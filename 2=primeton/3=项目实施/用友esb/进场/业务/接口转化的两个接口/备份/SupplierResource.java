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
	 * ��ȡģ������
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
		 //����token
		NCLocator.getInstance().lookup(ISecurityTokenCallback.class).token("NCSystem".getBytes(), "pfxx".getBytes());
		LogVO logsVO=new LogVO();
		//��¼��־
		logsVO.setData_type("receiveSupplier");
		logsVO.setSend("MDM");
		logsVO.setReceive("NCC");
		logsVO.setData_status("Y");
		logsVO.setInterface_type(PowerActionEnum.INSERT.getActioncode());
		logsVO.setStart_time(new UFDateTime());
		logsVO.setDatas(jSONObject.toString());
		
		//���Ϻ�json
		JSONObject result=new JSONObject();
		//���շ�����Ϣ
		JSONObject returnMessage = new JSONObject();
		//mdMappings
		JSONObject mdm = new JSONObject();
		JSONArray mdMappings = new JSONArray();
		//����esbת������
		JSONObject esbresult = new JSONObject();
		
		
		JSONObject supDataResult = new JSONObject();
		//��Ӧ������sub_supplier_Bank
		JSONObject supBankResult = new JSONObject();
		//��Ӧ�̵�ַsub_Supplier_address
		JSONObject supAddressResult = new JSONObject();
		//��Ӧ����ϵsub_supplier_contact
		JSONObject supContactResult = new JSONObject();
		//����json��vendTable
		JSONArray vendTable = new JSONArray();
		//����json��vendTable��Bank
		JSONArray sub_VendBankAccount = new JSONArray();
		//����json��vendTable��Address
		JSONArray sub_VendAddress = new JSONArray();
		//����json��vendTable��Contact
		JSONArray sub_VendContact = new JSONArray();
		
		String judgment="true";
		String subMessage="";
		try {
			JdbcUtils jdbcUtils=new JdbcUtils();
			String queryNcData = jdbcUtils.getNcdadta();
			Logger.error("��ǰ����ԴΪ"+queryNcData+"...");
			InvocationInfoProxy.getInstance().setUserDataSource(queryNcData);
			InvocationInfoProxy.getInstance().setGroupId(jdbcUtils.queryPkGroup());
			
			//-----liuyq 20221112�������ݿ��ȡ��ʽ20221112 START-----
			Map<String, Object> erpParam = jdbcUtils.getERPParam();
			
			String address=StrUtil.nullToEmpty((String)erpParam.get("erpapiaddress"));
			String method=StrUtil.nullToEmpty((String)erpParam.get("erpmethod"));
			String clientAppId=StrUtil.nullToEmpty((String)erpParam.get("erpclientappid"));
			
			String InterfaceType=StrUtil.nullToEmpty((String)erpParam.get("erpsupplierinterfacetype"));
			String CompanyCode=StrUtil.nullToEmpty((String)erpParam.get("erpsuppliercompanycode"));
			String AuthorizedCode=StrUtil.nullToEmpty((String)erpParam.get("erpsupplierauthorizedcode"));
			String InterfaceUser=StrUtil.nullToEmpty((String)erpParam.get("erpsupplierinterfaceuser"));
			
			//���������Ƿ���ESB
			String send_esb = jdbcUtils.queryColumn("pub_sysinit", "value", "initcode", "SEND_ESB");
			if(Toolkits.isEmpty(send_esb)) {
				send_esb="Y";
			}
			//��װESB��ַ
			if("Y".equals(send_esb)) {
				Map<String, Object> getEsbUrlParam = jdbcUtils.getMdmEsbUrl("getEsbUrl");
				String esbUrl =(String)getEsbUrlParam.get("interface_esb_url");
				
				Map<String, Object> esbUrlParam = jdbcUtils.getMdmEsbUrl("sendERPSupplier");
				String interface_esb_url =(String)esbUrlParam.get("interface_esb_url");
				
				address=esbUrl+interface_esb_url;
			}
			//-----liuyq 20221112�������ݿ��ȡ��ʽ20221112 END-----
			
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
			
			//masterData�ֶ�������
			JSONArray masterData = jSONObject.getJSONArray("masterData");
			
			for(int i=0;i<masterData.size();i++) {
				
				result=new JSONObject();//���Ϻ�json,ͬʱ�����һ��ѭ������
				result.put("InterfaceType",InterfaceType);
				result.put("MessageId", UUID.randomUUID());
				result.put("CompanyCode", CompanyCode);
				result.put("AuthorizedCode", AuthorizedCode);
				result.put("InterfaceUser", InterfaceUser);
				
				//��ȡmasterData�ڵĹ�Ӧ��ʵ��
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
				
				//��ȡ��Ӧ�������ݣ�ͬʱ�����һ��ѭ������
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
				 * ��Ӧ�����и�ʽת��
				 */
				JSONArray supBank=(JSONArray) supObject.get("sub_supplier_Bank");
				sub_VendBankAccount = new JSONArray();//����json��vendTable��Bank��ͬʱ�����һ��ѭ������
				for(int j=0;j<supBank.size();j++) {
					JSONObject object=supBank.getJSONObject(j);
					object = JSONObject.parseObject(object.toString());
					String MDMID=object.getString("pk_mdm");
					String BankName=object.getString("bank");
					AccountNum=object.getString("BankAccount");
					Currency=object.getString("currency_@currency_id");
					dr=object.getString("dr");
					supBankResult = new JSONObject();//��Ӧ������sub_supplier_Bank��ͬʱ�����һ��ѭ������
					supBankResult.put("MDMID",MDMID);				
					supBankResult.put("BankName",BankName);
					supBankResult.put("AccountNum",AccountNum);
					supBankResult.put("Currency",Currency);
					supBankResult.put("dr",dr);
					sub_VendBankAccount.add(supBankResult);
		
				}
				//json����
				supDataResult.put("sub_VendBankAccount",sub_VendBankAccount);
				/**
				 * ��Ӧ�̵�ַ��ʽת��
				 */
				JSONArray supAddress=(JSONArray) supObject.get("sub_Supplier_address");
				sub_VendAddress = new JSONArray();//����json��vendTable��Address��ͬʱ�����һ��ѭ������
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
					supAddressResult = new JSONObject();//��Ӧ�̵�ַsub_Supplier_address��ͬʱ�����һ��ѭ������
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
				
				//json����
				supDataResult.put("sub_VendAddress",sub_VendAddress);
				/**
				 * ��Ӧ����ϵ��ʽת��
				 */
				JSONArray supContact =(JSONArray) supObject.get("sub_supplier_contact");
				sub_VendContact = new JSONArray();//����json��vendTable��Contact��ͬʱ�����һ��ѭ������
				for(int j=0;j<supContact.size();j++) {
					JSONObject object=supContact.getJSONObject(j);
					String MDMID=object.getString("pk_mdm");
					String ContactPersonName=object.getString("Name");
					String Title=object.getString("Post");
					String Phone=object.getString("landline");
					String CellularPhone=object.getString("phone");
					String Email=object.getString("Mail");
					dr=object.getString("dr");
					supContactResult = new JSONObject();//��Ӧ����ϵsub_supplier_contact��ͬʱ�����һ��ѭ������
					supContactResult.put("ContactPersonName",ContactPersonName);
					supContactResult.put("Title",Title);
					supContactResult.put("Phone",Phone);
					supContactResult.put("CellularPhone",CellularPhone);
					supContactResult.put("Email",Email);
					supContactResult.put("dr",dr);
					supContactResult.put("MDMID",MDMID);
					sub_VendContact.add(supContactResult);
				}
				
				//json����
				supDataResult.put("sub_VendContact",sub_VendContact);
				vendTable = new JSONArray();//����json��VendTable��ͬʱ�����һ��ѭ������
				vendTable.add(supDataResult);
				result.put("VendTable",vendTable);
				
				//-----liuyq 20221112�������ݿ��ȡ��ʽ20221112 START-----
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
				//-----liuyq 20221112�������ݿ��ȡ��ʽ20221112 END-----
				esbresult = new JSONObject();//�����һ��ѭ������
				esbresult=JSONObject.parseObject(esbResult);
				
				String bool = esbresult.getInteger("Status") == 0 ? "true" : "false";
				if(bool=="false") {
					judgment="false";
				}
				String message = "";
				//returnMessage = new JSONObject();//���շ�����Ϣ��ͬʱ�����һ��ѭ������
				if(bool=="true") {
					message = "����ϵͳ�����������ݳɹ���";
					subMessage=subMessage+"��"+(i+1)+"�����������ѳɹ���ERP���ر��ģ�"+esbResult;
					returnMessage.put("success", bool);
				}else {
					JSONArray vendTableArray = esbresult.getJSONArray("VendTable");
					for(int j=0;j<vendTableArray.size();j++) {
						JSONObject object = vendTableArray.getJSONObject(j);
						message = message+object.getString("ErrorMessage")+",";
					}
					subMessage=subMessage+"��"+(i+1)+"������������ʧ�ܣ�ERP���ر��ģ�"+esbResult;
					returnMessage.put("success", bool);
				}
				returnMessage.put("message", message);
				
				
				
			}
			//mdm = new JSONObject();//�����һ��ѭ������
			mdm.put("mdmCode", "�����ݵı���");
			mdm.put("entityCode", "������ģ�͵ı���");
			mdm.put("busiDataId", "busiDataId");
			if(judgment=="true") {
				mdm.put("message", subMessage);
				mdm.put("success", true);
			}else {
				mdm.put("message", subMessage);
				mdm.put("success", false);
			}
			
			//mdMappings=new JSONArray();//�����һ��ѭ������
			mdMappings.add(mdm);
			returnMessage.put("mdMappings", mdMappings);
			
		} catch (Exception e) {
			returnMessage.put("mdMappings", "");//Array	���ݵ�ѪԵ��ϵ�б�
			returnMessage.put("success","false");//Boolean	���ݷַ��������ǳɹ���ʧ��
			returnMessage.put("message", "��Ӧ��ת��ʧ�ܣ�"+e.getMessage());//���ݷַ����ص�������Ϣ
		}finally {
	        logsVO.setMessage(esbresult.toString());
	        logsVO.setEnd_time(new UFDateTime());
	        //�������������־����
			local.operationVO_RequiresNew(logsVO,PowerActionEnum.INSERT.getActioncode());
		}
		return returnMessage;
	}

}
