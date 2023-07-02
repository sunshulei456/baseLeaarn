package com.primeton.esb.zhhc_nc.nc;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

import com.alibaba.fastjson.JSONObject;
import com.primeton.esb.config.impl.VariableConfiguration;
import com.primeton.esb.message.ITipMessagePayload;
import com.primeton.esb.message.TipMessageBuilder;
import com.primeton.esb.runtime.server.ESBServerFactory;

public class CollContractTransformUser {
	public ITipMessagePayload modify(ITipMessagePayload inMessage) throws Exception {
		String body = new String((byte[]) inMessage.getMessagePayload(),"UTF-8"); 
		SAXReader saxReader = new SAXReader();
		Document document = saxReader.read(new ByteArrayInputStream(body .getBytes("UTF-8")));
		Node node = document.selectSingleNode("//soapenv:Body/irec:recvCtAr");
		Node childNode = node.selectSingleNode("//content");
		String content = childNode.getText();
		JSONObject jsonObject = JSONObject.parseObject(content);
		JSONObject childJsonObject = (JSONObject) jsonObject.get("head");
		String pmsUser = (String) childJsonObject.get("pk_dutier");
	    String getNCUser_url=((VariableConfiguration)ESBServerFactory.getConfigManager().getVariableConfigById("com.primeton.esb.zhhc_nc.nc")).getStrVarValue("getNCUser_url");
	    CloseableHttpClient httpClient = HttpClientBuilder.create().build();
	    HttpPost httpPost = new HttpPost(getNCUser_url);
	    httpPost.setHeader("ClientId", "interface.oa");
	    httpPost.setHeader("OperationCode", "interface.oa.user.getNCUser");
	    httpPost.setHeader("Content-Type", "application/json;charset=utf8");
	    httpPost.setHeader("User-Agent", "PostmanRuntime/7.25.0");
	    RequestConfig clientConfig = RequestConfig.custom()
				.setConnectTimeout(600000)
				.setConnectionRequestTimeout(600000)
				.setSocketTimeout(600000)
				.setCircularRedirectsAllowed(true)
				.build();
	    httpPost.setConfig(clientConfig);
	    JSONObject json = new JSONObject();
	    json.put("loginName", pmsUser);
	    StringEntity entity = new StringEntity(json.toString(), "UTF-8");
	    httpPost.setEntity(entity);
	    CloseableHttpResponse response = null;
	    String ncUser=pmsUser;
	    try {
			response = httpClient.execute(httpPost);
			HttpEntity responseEntity = response.getEntity();
			if (responseEntity != null) {
				String retString = EntityUtils.toString(responseEntity);
				JSONObject retJsonObject = JSONObject.parseObject(retString);
				ncUser =retJsonObject.getString("message");
			}
		}  catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (httpClient != null) {
					httpClient.close();
				}
				if (response != null) {
					response.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	    childJsonObject.put("pk_dutier", ncUser);
	    childNode.setText(jsonObject.toString());
		Element rootElement = document.getRootElement();
		String modifiedBody = rootElement.asXML();
		TipMessageBuilder builder = TipMessageBuilder.withPayload(modifiedBody);
		builder.copySystemHeaders(inMessage.getSystemHeaders());
		((Map) inMessage.getProtocolHeaders()).put("Content-Length", String.valueOf(modifiedBody.length()));
		builder.setProtocolHeaders(inMessage.getProtocolHeaders());
		return builder.build();
	}

}
