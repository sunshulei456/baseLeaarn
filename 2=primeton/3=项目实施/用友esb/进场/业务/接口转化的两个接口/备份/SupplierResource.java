package nc.pubitf.meike.rest;

import java.util.Map;
import java.util.UUID;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.hutool.core.util.StrUtil;
import nc.bs.framework.common.InvocationInfoProxy;
import nc.bs.framework.common.NCLocator;
import nc.bs.framework.server.ISecurityTokenCallback;
import nc.bs.itf.local.LocalItf;
import nc.bs.logging.Logger;
import nc.pub.meike.tools.HttpConnection;
import nc.pub.meike.tools.JdbcUtils;
import nc.pub.meike.tools.LogVO;
import nc.pub.meike.tools.Toolkits;
import nc.vo.pub.BusinessException;
import nc.vo.pub.lang.UFDateTime;
import nc.vo.pubapp.pub.power.PowerActionEnum;
import uap.ws.rest.resource.AbstractUAPRestResource;

@Path("meike/mdmSupplier")
public class SupplierResource extends AbstractUAPRestResource{
	
	LocalItf local=(LocalItf)NCLocator.getInstance().lookup(LocalItf.class.getName());
	/**
	 * 获取模块名称
	 */
	@Override
	public String getModule() {
		return "meike";
	}
	
	@POST
	@Path("receiveSupplier")
	@Consumes("application/json;charset=utf-8")
	@Produces("application/json;charset=utf-8")
	public Object pullSupplier(JSONObject jSONObject) throws BusinessException {
		 //设置token
		NCLocator.getInstance().lookup(ISecurityTokenCallback.class).token("NCSystem".getBytes(), "pfxx".getBytes());
		LogVO logsVO=new LogVO();
		//记录日志
		logsVO.setData_type("receiveSupplier");
		logsVO.setSend("MDM");
		logsVO.setReceive("NCC");
		logsVO.setData_status("Y");
		logsVO.setInterface_type(PowerActionEnum.INSERT.getActioncode());
		logsVO.setStart_time(new UFDateTime());
		logsVO.setDatas(jSONObject.toString());
		
		//整合后json
		JSONObject result=new JSONObject();
		//最终返回信息
		JSONObject returnMessage = new JSONObject();
		//mdMappings
		JSONObject mdm = new JSONObject();
		JSONArray mdMappings = new JSONArray();
		//调用esb转换后结果
		JSONObject esbresult = new JSONObject();
		
		
		JSONObject supDataResult = new JSONObject();
		//供应商银行sub_supplier_Bank
		JSONObject supBankResult = new JSONObject();
		//供应商地址sub_Supplier_address
		JSONObject supAddressResult = new JSONObject();
		//供应商联系sub_supplier_contact
		JSONObject supContactResult = new JSONObject();
		//整合json的vendTable
		JSONArray vendTable = new JSONArray();
		//整合json的vendTable的Bank
		JSONArray sub_VendBankAccount = new JSONArray();
		//整合json的vendTable的Address
		JSONArray sub_VendAddress = new JSONArray();
		//整合json的vendTable的Contact
		JSONArray sub_VendContact = new JSONArray();
		
		String judgment="true";
		String subMessage="";
		try {
			JdbcUtils jdbcUtils=new JdbcUtils();
			String queryNcData = jdbcUtils.getNcdadta();
			Logger.error("当前数据源为"+queryNcData+"...");
			InvocationInfoProxy.getInstance().setUserDataSource(queryNcData);
			InvocationInfoProxy.getInstance().setGroupId(jdbcUtils.queryPkGroup());
			
			//-----liuyq 20221112采用数据库获取方式20221112 START-----
			Map<String, Object> erpParam = jdbcUtils.getERPParam();
			
			String address=StrUtil.nullToEmpty((String)erpParam.get("erpapiaddress"));
			String method=StrUtil.nullToEmpty((String)erpParam.get("erpmethod"));
			String clientAppId=StrUtil.nullToEmpty((String)erpParam.get("erpclientappid"));
			
			String InterfaceType=StrUtil.nullToEmpty((String)erpParam.get("erpsupplierinterfacetype"));
			String CompanyCode=StrUtil.nullToEmpty((String)erpParam.get("erpsuppliercompanycode"));
			String AuthorizedCode=StrUtil.nullToEmpty((String)erpParam.get("erpsupplierauthorizedcode"));
			String InterfaceUser=StrUtil.nullToEmpty((String)erpParam.get("erpsupplierinterfaceuser"));
			
			//参数控制是否走ESB
			String send_esb = jdbcUtils.queryColumn("pub_sysinit", "value", "initcode", "SEND_ESB");
			if(Toolkits.isEmpty(send_esb)) {
				send_esb="Y";
			}
			//组装ESB地址
			if("Y".equals(send_esb)) {
				Map<String, Object> getEsbUrlParam = jdbcUtils.getMdmEsbUrl("getEsbUrl");
				String esbUrl =(String)getEsbUrlParam.get("interface_esb_url");
				
				Map<String, Object> esbUrlParam = jdbcUtils.getMdmEsbUrl("sendERPSupplier");
				String interface_esb_url =(String)esbUrlParam.get("interface_esb_url");
				
				address=esbUrl+interface_esb_url;
			}
			//-----liuyq 20221112采用数据库获取方式20221112 END-----
			
			String systemCode=jSONObject.getString("systemCode");
			String mdType=jSONObject.getString("mdType");
			String action=jSONObject.getString("action");
			String code=jSONObject.getString("code");
			String distributeToken=jSONObject.getString("distributeToken");
			
//			result.put("systemCode", systemCode);
//			result.put("mdType", mdType);
//			result.put("action",action);
//			result.put("distributeToken",distributeToken);
//			result.put("code",code);
			
			//masterData字段内数据
			JSONArray masterData = jSONObject.getJSONArray("masterData");
			
			for(int i=0;i<masterData.size();i++) {
				
				result=new JSONObject();//整合后json,同时清除上一次循环数据
				result.put("InterfaceType",InterfaceType);
				result.put("MessageId", UUID.randomUUID());
				result.put("CompanyCode", CompanyCode);
				result.put("AuthorizedCode", AuthorizedCode);
				result.put("InterfaceUser", InterfaceUser);
				
				//获取masterData内的供应商实体
				JSONObject supObject=masterData.getJSONObject(i);
				supObject = JSONObject.parseObject(supObject.toString());
				
				String AccountNum=supObject.getString("MainSupplierCode");
				String NCCVendAccount=supObject.getString("NCCSupplierCode");
				String VendName=supObject.getString("MainSupplierName");
				String VendGroup=supObject.getString("VendGroup");
				String InvoiceAccount=supObject.getString("InvoiceAccount");
				String UniformSocialCreditCode=supObject.getString("UnifiedSocialCredit");
				String Currency=supObject.getString("Currency_@currency_id");
				String LanguageId=supObject.getString("LanguageId");
				String InclTax=supObject.getString("SupplierTax");
				String TaxGroup=supObject.getString("SupplierTaxRate");
				String enablestate=supObject.getString("enablestate");
				String SupplyGrade=supObject.getString("SupplyLevel");
				String PerformanceGrade=supObject.getString("Performancelevel");
				String SupplyScope=supObject.getString("ScopeSupply");
				String dr=supObject.getString("dr");
				//String MDMID=supObject.getString("id");
				
				//获取供应商中数据，同时清除上一次循环数据
				supDataResult = new JSONObject();
				
				supDataResult.put("AccountNum",AccountNum);
				supDataResult.put("NCCVendAccount",NCCVendAccount);
				supDataResult.put("VendName",VendName);
				supDataResult.put("VendGroup",VendGroup);
				supDataResult.put("InvoiceAccount",InvoiceAccount);
				supDataResult.put("UniformSocialCreditCode",UniformSocialCreditCode);
				supDataResult.put("Currency",Currency);
				supDataResult.put("LanguageId",LanguageId);
				supDataResult.put("InclTax",InclTax);
				supDataResult.put("TaxGroup",TaxGroup);
				supDataResult.put("enablestate",enablestate);
				supDataResult.put("SupplyGrade",SupplyGrade);
				supDataResult.put("PerformanceGrade",PerformanceGrade);
				supDataResult.put("SupplyScope",SupplyScope);
				supDataResult.put("dr",dr);
				//supDataResult.put("MDMID",MDMID);
				
				
				/**
				 * 供应商银行格式转换
				 */
				JSONArray supBank=(JSONArray) supObject.get("sub_supplier_Bank");
				sub_VendBankAccount = new JSONArray();//整合json的vendTable的Bank，同时清除上一次循环数据
				for(int j=0;j<supBank.size();j++) {
					JSONObject object=supBank.getJSONObject(j);
					object = JSONObject.parseObject(object.toString());
					String MDMID=object.getString("pk_mdm");
					String BankName=object.getString("bank");
					AccountNum=object.getString("BankAccount");
					Currency=object.getString("currency_@currency_id");
					dr=object.getString("dr");
					supBankResult = new JSONObject();//供应商银行sub_supplier_Bank，同时清除上一次循环数据
					supBankResult.put("MDMID",MDMID);				
					supBankResult.put("BankName",BankName);
					supBankResult.put("AccountNum",AccountNum);
					supBankResult.put("Currency",Currency);
					supBankResult.put("dr",dr);
					sub_VendBankAccount.add(supBankResult);
		
				}
				//json整合
				supDataResult.put("sub_VendBankAccount",sub_VendBankAccount);
				/**
				 * 供应商地址格式转换
				 */
				JSONArray supAddress=(JSONArray) supObject.get("sub_Supplier_address");
				sub_VendAddress = new JSONArray();//整合json的vendTable的Address，同时清除上一次循环数据
				for(int j=0;j<supAddress.size();j++) {
					JSONObject object=supAddress.getJSONObject(j);
//					object = JSONObject.parseObject(object.toString());
					String MDMID=object.getString("pk_mdm");
					String AddressType=object.getString("AddressType");
					String CountryRegionId=object.getString("CountryRegionId");
					String State=object.getString("State");
					String County=object.getString("County");
					String City=object.getString("City");
					String Street=object.getString("Street");
					dr=object.getString("dr");
					supAddressResult = new JSONObject();//供应商地址sub_Supplier_address，同时清除上一次循环数据
					supAddressResult.put("AddressType",AddressType);
					supAddressResult.put("CountryRegionId",CountryRegionId);
					supAddressResult.put("State",State);
					supAddressResult.put("County",County);
					supAddressResult.put("City",City);
					supAddressResult.put("Street",Street);
					supAddressResult.put("dr",dr);
					supAddressResult.put("MDMID",MDMID);
					if(MDMID==null) {
						supBankResult.put("MDMID","");
					}

					sub_VendAddress.add(supAddressResult);
				}
				
				//json整合
				supDataResult.put("sub_VendAddress",sub_VendAddress);
				/**
				 * 供应商联系格式转换
				 */
				JSONArray supContact =(JSONArray) supObject.get("sub_supplier_contact");
				sub_VendContact = new JSONArray();//整合json的vendTable的Contact，同时清除上一次循环数据
				for(int j=0;j<supContact.size();j++) {
					JSONObject object=supContact.getJSONObject(j);
					String MDMID=object.getString("pk_mdm");
					String ContactPersonName=object.getString("Name");
					String Title=object.getString("Post");
					String Phone=object.getString("landline");
					String CellularPhone=object.getString("phone");
					String Email=object.getString("Mail");
					dr=object.getString("dr");
					supContactResult = new JSONObject();//供应商联系sub_supplier_contact，同时清除上一次循环数据
					supContactResult.put("ContactPersonName",ContactPersonName);
					supContactResult.put("Title",Title);
					supContactResult.put("Phone",Phone);
					supContactResult.put("CellularPhone",CellularPhone);
					supContactResult.put("Email",Email);
					supContactResult.put("dr",dr);
					supContactResult.put("MDMID",MDMID);
					sub_VendContact.add(supContactResult);
				}
				
				//json整合
				supDataResult.put("sub_VendContact",sub_VendContact);
				vendTable = new JSONArray();//整合json的VendTable，同时清除上一次循环数据
				vendTable.add(supDataResult);
				result.put("VendTable",vendTable);
				
				//-----liuyq 20221112采用数据库获取方式20221112 START-----
//				String address = "http://192.168.188.192:9088/api/Domain/meikeerp/ws/erp/erp_mdm_0002/CallErpWebService";
//				String clientAppId = "63578e34-b925-8888-8598-d9d8788200f7";
				
				HttpConnection httpConnection = new HttpConnection();
				String esbResult="";
				if("Y".equals(send_esb)) {
					esbResult =httpConnection.callERPWebserviceByESB(address, clientAppId,  result.toString());
				}else {
					JSONObject jsonResult = httpConnection.callERPWebserviceASMX(address, method, clientAppId, result.toString());
					if(jsonResult!=null) {
						esbResult=jsonResult.toJSONString();
					}
				}
				//-----liuyq 20221112采用数据库获取方式20221112 END-----
				esbresult = new JSONObject();//清除上一次循环数据
				esbresult=JSONObject.parseObject(esbResult);
				
				String bool = esbresult.getInteger("Status") == 0 ? "true" : "false";
				if(bool=="false") {
					judgment="false";
				}
				String message = "";
				//returnMessage = new JSONObject();//最终返回信息，同时清除上一次循环数据
				if(bool=="true") {
					message = "消费系统消费这批数据成功！";
					subMessage=subMessage+"第"+(i+1)+"条主数据消费成功！ERP返回报文："+esbResult;
					returnMessage.put("success", bool);
				}else {
					JSONArray vendTableArray = esbresult.getJSONArray("VendTable");
					for(int j=0;j<vendTableArray.size();j++) {
						JSONObject object = vendTableArray.getJSONObject(j);
						message = message+object.getString("ErrorMessage")+",";
					}
					subMessage=subMessage+"第"+(i+1)+"条主数据消费失败！ERP返回报文："+esbResult;
					returnMessage.put("success", bool);
				}
				returnMessage.put("message", message);
				
				
				
			}
			//mdm = new JSONObject();//清除上一次循环数据
			mdm.put("mdmCode", "主数据的编码");
			mdm.put("entityCode", "主数据模型的编码");
			mdm.put("busiDataId", "busiDataId");
			if(judgment=="true") {
				mdm.put("message", subMessage);
				mdm.put("success", true);
			}else {
				mdm.put("message", subMessage);
				mdm.put("success", false);
			}
			
			//mdMappings=new JSONArray();//清除上一次循环数据
			mdMappings.add(mdm);
			returnMessage.put("mdMappings", mdMappings);
			
		} catch (Exception e) {
			returnMessage.put("mdMappings", "");//Array	数据的血缘关系列表
			returnMessage.put("success","false");//Boolean	数据分发总体上是成功或失败
			returnMessage.put("message", "供应商转换失败："+e.getMessage());//数据分发返回的详情信息
		}finally {
	        logsVO.setMessage(esbresult.toString());
	        logsVO.setEnd_time(new UFDateTime());
	        //独立事物操作日志数据
			local.operationVO_RequiresNew(logsVO,PowerActionEnum.INSERT.getActioncode());
		}
		return returnMessage;
	}

}
