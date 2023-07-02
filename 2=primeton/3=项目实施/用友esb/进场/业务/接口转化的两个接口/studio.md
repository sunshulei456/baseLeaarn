## 接口信息

```java



之前项目现场这边有两个转换的接口是通过CRM(NCC)进行了中转路由实现，涉及crm的输入和输出接口分别为
crm 进行中转路由实现

crm的输入和输出接口
1.ERP-MDM-0001
输入：客户目标调用地址：http://192.168.188.32:53258/WebService.asmx?op=CallErpWebService
输出：    加工调用地址：http://192.168.188.206/uapws/rest/meike/mdmCustomer/receiveCustomer
2.ERP-MDM-0002
输入： 供应商目标调用地址：http://192.168.188.32:53258/WebService.asmx?op=CallErpWebService
输出:      加工调用地址： http://192.168.188.206/uapws/rest/meike/mdmSupplier/receiveSupplier


烦请看下之前客开经理交接的代码，把这块的代码找一下给到总线团队的同事以便于进行功能迁移
-------------------------------


    
    
我想请问下， ERP-MDM-0001， ERP-MDM-0002   这两个接口进行报文转换的情况，我想问下
    
-------------------------------
问下，现在客户有两个接口【mdm --> erp】存在报文转换， 原本是通过一个中间层【crm模块】进行数据转换的，现在需要去掉中间层 crm, 将数据报文转换迁移到我们的 ESB 上，但是 crm 存在一个循环发送请求的逻辑：【就是 mdm 传递给 crm 的参数有一个数组， 在 crm 中使用一个循环逻辑，遍历这个数组参数，然后对数组中每个元素都进行一个请求发送】，想问下，我们把数据迁移到我们的 esb 系统上，该怎么处理这个循环发送请求的状况？
    
    
1. 谁调用谁
	ERP 系统开发环境提供给 MDM 系统的客户主档信息接口
		原本的： MDM --[http]--> (crm 接口参数) --[ws]--> ERP 
         我们的： MDM --[  ]-->       esb     --[ws]--> ERP
    
    
    代理服务： mdm --[http--]
    中介服务： 服务 -- [ws]
    业务服务： erp
    
    代理服务        中介服务          业务服务
    mdm --[http] --  ws  ---[ws]---  erp
    
		// 原本的： MDM --[ws]--> (crm 接口参数) --[ws]--> ERP , 参数传递的逻辑    
    	data [data1, data2, data3, data4, ...]
    	crm 转换过程存在一个循环发送参数数组的数据，然后将所有循环发送的请求的响应进行封装，
    
 
         
         	
         
         
         
         
2. 现有接口是谁改的？
	crm 在改动
3. 改哪些内容
	主要是其中的字段进行拆分，进行分批发送
	
```



## erp信息

```
192.168.188.32 

53258


通道信息 9086
```





# ws 协议报文

## 不同版本

### soap

```xml
CallErpWebService
CallErpWebService(string _clientAppId, string _requestMessage)

测试
测试窗体只能用于来自本地计算机的请求。
SOAP 1.1  

=== 响应

POST /WebService.asmx HTTP/1.1
Host: 192.168.188.32
Content-Type: text/xml; charset=utf-8
Content-Length: length
SOAPAction: "http://tempuri.org/CallErpWebService"    <!--这个版本的需要注意这个请求头。 soap12 没有， soapq-->

<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <CallErpWebService xmlns="http://tempuri.org/">
      <_clientAppId>string</_clientAppId>
      <_requestMessage>string</_requestMessage>
    </CallErpWebService>
  </soap:Body>
</soap:Envelope>




=== 响应

HTTP/1.1 200 OK
Content-Type: text/xml; charset=utf-8
Content-Length: length

<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <CallErpWebServiceResponse xmlns="http://tempuri.org/">
      <CallErpWebServiceResult>string</CallErpWebServiceResult>
    </CallErpWebServiceResponse>
  </soap:Body>
</soap:Envelope>

```

### soap 12

```xml
SOAP 1.2
以下是 SOAP 1.2 请求和响应示例。所显示的占位符需替换为实际值。


========================== 请求

POST /WebService.asmx HTTP/1.1
Host: 192.168.188.32
Content-Type: application/soap+xml; charset=utf-8
Content-Length: length

<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <CallErpWebService xmlns="http://tempuri.org/">
      <_clientAppId>string</_clientAppId>
      <_requestMessage>string</_requestMessage>
    </CallErpWebService>
  </soap12:Body>
</soap12:Envelope>


========================== 响应

HTTP/1.1 200 OK
Content-Type: application/soap+xml; charset=utf-8
Content-Length: length

<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <CallErpWebServiceResponse xmlns="http://tempuri.org/">
      <CallErpWebServiceResult>string</CallErpWebServiceResult>
    </CallErpWebServiceResponse>
  </soap12:Body>
</soap12:Envelope>
```

