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

