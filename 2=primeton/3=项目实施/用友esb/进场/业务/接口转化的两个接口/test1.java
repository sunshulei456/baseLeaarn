

/**
 * 接收接口
 * <p>
 * Title: ReceiveDataResource
 * </p>
 * <p>
 * Description:接受MDM下发的客户数据格式
 * </p>
 * 
 * @author wuzx
 * @date 2022-08-10 13:30:45
 */

public class MDMDataResource extends AbstractUAPRestResource {
	LocalItf local = (LocalItf) NCLocator.getInstance().lookup(LocalItf.class.getName());

	/**
	 * 
	 * 
	 * 
	 * @param
	 * @return JSONObject 创 建 人 ：wuzx 创建时间：2022年8月10日-下午14:14:23
	 * @throws BusinessException
	 */
	@POST

	@Consumes("application/json;charset=utf-8")
	@Produces("application/json;charset=utf-8")
	public JSONObject receiveClient(JSONObject jSONObject) throws BusinessException {
		// 设置token
		NCLocator.getInstance().lookup(ISecurityTokenCallback.class).token("NCSystem".getBytes(), "pfxx".getBytes());
//		JSONObject result = new JSONObject();
		JSONObject result3 = new JSONObject();
		JSONObject result4 = new JSONObject();
		JSONObject custDataResult = new JSONObject();
//		JSONObject custDataResult11 = new JSONObject();
		JSONObject custBankResult = new JSONObject();
		JSONObject custAddressResult = new JSONObject();
		JSONObject custContactResult = new JSONObject();
		JSONObject sendJson = new JSONObject();
		JSONObject mdm = new JSONObject();
//		JSONObject result1 = new JSONObject();
		JSONArray jsonarr = new JSONArray();
		JSONArray jsonarr1 = new JSONArray();
		JSONArray jsonarr2 = new JSONArray();
		JSONArray jsonarr3 = new JSONArray();
//		JSONArray jsonarr11 = new JSONArray();
		JSONArray array4 = new JSONArray();
		
		JSONObject j1=new JSONObject();

		LogVO logsVO = new LogVO();
		// 记录日志
		logsVO.setData_type("receiveCustomer");
		logsVO.setSend("MDM");
		logsVO.setReceive("NCC");
		logsVO.setData_status("Y");
		logsVO.setInterface_type(PowerActionEnum.INSERT.getActioncode());
		logsVO.setDatas(jSONObject.toString());
		logsVO.setStart_time(new UFDateTime());
		try {
			JdbcUtils jdbcUtils = new JdbcUtils();
			String queryNcData = jdbcUtils.getNcdadta();
			Logger.error("当前数据源为" + queryNcData + "...");
			InvocationInfoProxy.getInstance().setUserDataSource(queryNcData);
			InvocationInfoProxy.getInstance().setGroupId(jdbcUtils.queryPkGroup());
			
			//-----liuyq 20221112采用数据库获取方式20221112 START-----
			Map<String, Object> erpParam = jdbcUtils.getERPParam();
			
			String address=StrUtil.nullToEmpty((String)erpParam.get("erpapiaddress"));
			String method=StrUtil.nullToEmpty((String)erpParam.get("erpmethod"));
			String clientAppId=StrUtil.nullToEmpty((String)erpParam.get("erpclientappid"));
			
			String InterfaceType=StrUtil.nullToEmpty((String)erpParam.get("erpcustomerinterfacetype"));
			String CompanyCode=StrUtil.nullToEmpty((String)erpParam.get("erpcustomercompanycode"));
			String AuthorizedCode=StrUtil.nullToEmpty((String)erpParam.get("erpcustomerauthorizedcode"));
			String InterfaceUser=StrUtil.nullToEmpty((String)erpParam.get("erpcustomerinterfaceuser"));
			
			//参数控制是否走ESB
			String send_esb = jdbcUtils.queryColumn("pub_sysinit", "value", "initcode", "SEND_ESB");
			if(Toolkits.isEmpty(send_esb)) {
				send_esb="Y";
			}
			//组装ESB地址
			if("Y".equals(send_esb)) {
				Map<String, Object> getEsbUrlParam = jdbcUtils.getMdmEsbUrl("getEsbUrl");
				String esbUrl =(String)getEsbUrlParam.get("interface_esb_url");
				
				Map<String, Object> esbUrlParam = jdbcUtils.getMdmEsbUrl("sendERPCustomer");
				String interface_esb_url =(String)esbUrlParam.get("interface_esb_url");
				
				address=esbUrl+interface_esb_url;
			}
			//-----liuyq 20221112采用数据库获取方式20221112 END-----
			
			JSONObject json = JSONObject.parseObject(jSONObject.toString());
			
			/**
			 * 客户数据格式转换
			 */
			JSONArray custResult = jSONObject.getJSONArray("masterData");
			for (int i = 0; i < custResult.size(); i++) {
				
				result3 = new JSONObject();
				result4 = new JSONObject();
				custDataResult = new JSONObject();
				
				custBankResult = new JSONObject();
				custAddressResult = new JSONObject();
				custContactResult = new JSONObject();
				sendJson = new JSONObject();
				mdm = new JSONObject();
				
				jsonarr = new JSONArray();
				jsonarr1 = new JSONArray();
				jsonarr2 = new JSONArray();
				jsonarr3 = new JSONArray();
				
				array4 = new JSONArray();
				
				sendJson.put("InterfaceType", InterfaceType);
				sendJson.put("MessageId", UUID.randomUUID());
				sendJson.put("CompanyCode", CompanyCode);
				sendJson.put("AuthorizedCode",AuthorizedCode);
				sendJson.put("InterfaceUser",InterfaceUser);
				
				JSONObject custObject = custResult.getJSONObject(i);
//				custObject = JSONObject.parseObject(custObject.toString());
				String masterData = json.getString("masterData");
				String AccountNum = custObject.getString("bd_customer_code");
				String NCCCustAccount = custObject.getString("bd_customer_def2");
				String CustName = custObject.getString("bd_customer_name");
				String TaxID = custObject.getString("taxpayerid");
				String SalesClassification = custObject.getString("Salesclassification");
				String CustGroup = custObject.getString("CustGroup");
				String CustClassificationId = custObject.getString("CustClassificationId");
				String InvoiceAccount = custObject.getString("InvoiceAccount");
				String CustClassification = custObject.getString("pk_custclass");
				String Currency = custObject.getString("pk_currtype_@currency_id");
				String LanguageId = custObject.getString("LanguageId");
				String InclTax = custObject.getString("pk_custtaxes");
				String TaxGroup = custObject.getString("CustomerTaxRate_name");
				String enablestate = custObject.getString("enablestate");
				Integer dr=custObject.getInteger("dr");
				custDataResult.put("AccountNum", AccountNum);
				custDataResult.put("NCCCustAccount", NCCCustAccount);
				custDataResult.put("CustName", CustName);
				custDataResult.put("TaxID", TaxID);
				custDataResult.put("SalesClassification", SalesClassification);
				custDataResult.put("CustGroup", CustGroup);
				custDataResult.put("CustClassificationId", CustClassificationId);
				custDataResult.put("InvoiceAccount", InvoiceAccount);
				custDataResult.put("CustClassification", CustClassification);
				custDataResult.put("Currency", Currency);
				custDataResult.put("LanguageId", LanguageId);
				custDataResult.put("InclTax", InclTax);
				custDataResult.put("TaxGroup", TaxGroup);
				custDataResult.put("enablestate", enablestate);		
				custDataResult.put("dr", dr);
//				custDataResult.put("MDMID", MDMID);
				jsonarr.add(custDataResult);
//				jsonarr11.add(custDataResult11);

				/**
				 * 客户银行格式转换
				 */
				JSONArray custBank = (JSONArray) custObject.get("sub_Cust_Bank");
				for (int j = 0; j < custBank.size(); j++) {
					JSONObject object = custBank.getJSONObject(j);
					custBankResult=new JSONObject();
					String MDMID = object.getString("pk_mdm");
					String BankName1 = object.getString("bd_bankdoc_name");
					String AccountNum2 = object.getString("accnum");
					String Currency1 = object.getString("bd_currtype_name_@currency_id");
					Integer dr1=object.getInteger("dr");
//					String dr1 = object.getString("dr");
					custBankResult.put("BankName", BankName1);
					custBankResult.put("AccountNum", AccountNum2);
					custBankResult.put("Currency", Currency1);
					custBankResult.put("dr", dr1);
					custBankResult.put("MDMID", MDMID);
					jsonarr1.add(custBankResult);
				}
				// json整合
				custDataResult.put("sub_CustBankAccount", jsonarr1);
				/**
				 * 客户地址格式转换
				 */
				JSONArray custAddress = (JSONArray) custObject.get("sub_Cust_address");
				for (int j = 0; j < custAddress.size(); j++) {
					JSONObject object = custAddress.getJSONObject(j);
					custAddressResult=new JSONObject();
					String MDMID = object.getString("pk_mdm");
					String AddressType = object.getString("AddressType");
					String CountryRegionId = object.getString("CountryRegionId");
					String State = object.getString("State");
					String County = object.getString("County");
					String City = object.getString("City");
					String Street = object.getString("Street");
					Integer dr1=object.getInteger("dr");
//					String dr1 = object.getString("dr");
					custAddressResult.put("AddressType", AddressType);
					custAddressResult.put("CountryRegionId", CountryRegionId);
					custAddressResult.put("State", State);
					custAddressResult.put("County", County);
					custAddressResult.put("City", City);
					custAddressResult.put("Street", Street);
					custAddressResult.put("dr", dr1);
					custAddressResult.put("MDMID", MDMID);
					jsonarr2.add(custAddressResult);
				}

				// json整合
				custDataResult.put("sub_CustAddress", jsonarr2);
				/**
				 * 客户联系格式转换
				 */
				JSONArray custContact = (JSONArray) custObject.get("sub_cust_contact");
				for (int j = 0; j < custContact.size(); j++) {
					JSONObject object = custContact.getJSONObject(j);
					custContactResult=new JSONObject();
					String MDMID = object.getString("pk_mdm");
					String ContactPersonName = object.getString("name");
					String Title = object.getString("bd_linkman_vjob");
					String Phone = object.getString("bd_linkman_phone");
					String CellularPhone = object.getString("bd_linkman_cell");
//					String Email = object.getString("bd_linkman_email");
//					String dr1 = object.getString("dr");
					Integer dr1=object.getInteger("dr");
					custContactResult.put("Email", "5922@qq.com");
					custContactResult.put("ContactPersonName", ContactPersonName);
					custContactResult.put("Title", Title);
					custContactResult.put("Phone", Phone);
					custContactResult.put("CellularPhone", CellularPhone);
					custContactResult.put("dr", dr1);
					custContactResult.put("MDMID", MDMID);
					jsonarr3.add(custContactResult);
				}
				custDataResult.put("sub_CustContact", jsonarr3);
				// json整合
				sendJson.put("CustTable", jsonarr);
				
				//-----liuyq 20221112采用数据库获取方式20221112 START-----
//				String address = "http://192.168.188.192:9088/api/Domain/meikeerp/ws/erp/erp_mdm_0001/CallErpWebService";
//				String clientAppId = "63578e34-b925-8888-8598-d9d8788200f7";
				HttpConnection httpConnection = new HttpConnection();
				String esbResult="";
				
				if("Y".equals(send_esb)) {
					esbResult =httpConnection.callERPWebserviceByESB(address, clientAppId,  sendJson.toString());
				}else {
					JSONObject jsonResult = httpConnection.callERPWebserviceASMX(address, method, clientAppId, sendJson.toString());
					if(jsonResult!=null) {
						esbResult=jsonResult.toJSONString();
					}
				}
				//-----liuyq 20221112采用数据库获取方式20221112 END-----
				result3=JSONObject.parseObject(esbResult);
				
				String message = "成功！";
				String bool = result3.getInteger("Status") == 0 ? "true" : "false";

				JSONArray s= (JSONArray) result3.get("CustTable");
				String ErrorMessage=null;
				if(bool=="false") {
					for(int j=0;j<s.size();j++) {
						JSONObject object = s.getJSONObject(j);
						ErrorMessage = object.getString("ErrorMessage");
					}
				}
				
				if(bool=="false") {
					result4.put("success", bool);
					result4.put("message", ErrorMessage);
					mdm.put("mdmCode", "主数据的编码");
					mdm.put("entityCode", "主数据模型的编码");
					mdm.put("busiDataId", "busiDataId");
					mdm.put("message", "该条主数据消费失败！ERP返回报文："+esbResult);
					mdm.put("success", bool);
				}else {
					result4.put("success", bool);
					result4.put("message", message);
					mdm.put("mdmCode", "主数据的编码");
					mdm.put("entityCode", "主数据模型的编码");
					mdm.put("busiDataId", "busiDataId");
					mdm.put("message", "该条主数据消费成功！ERP返回报文："+esbResult);
					mdm.put("success", bool);
				}
				
				array4.add(mdm);
				result4.put("mdMappings", array4);

			}
			

		} catch (Exception e) {
			result4.put("mdMappings", "");//Array	数据的血缘关系列表
			result4.put("success","false");//Boolean	数据分发总体上是成功或失败
			result4.put("message", "供应商转换失败："+e.getMessage());//数据分发返回的详情信息
		} finally {
			logsVO.setMessage(result3.toString());
			logsVO.setEnd_time(new UFDateTime());
			// 独立事物操作日志数据
			local.operationVO_RequiresNew(logsVO, PowerActionEnum.INSERT.getActioncode());
		}
		return result4;

	}

	@Override
	public String getModule() {
		// TODO Auto-generated method stub
		return "meike";
	}

}
