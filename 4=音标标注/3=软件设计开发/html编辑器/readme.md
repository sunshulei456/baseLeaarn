## ***\*1. 非所见即所得编辑器\****

这种编辑器的实现原理很简单，用textarea元素就可以实现，假如要实现粗体、斜体、下划线、颜色字、图片的效果，只需在字的中间加上自定义标签即可，例如：[b]富文本编辑器[b] ，[img]src=”http://www.google.com.hk/intl/zh-CN/images/logo_cn.png”[img]当然这些规则你得自己通过js进行定制。当POST提交后，再把这些标签转换为html标签。

## ***\*2. 所见即所得编辑器\****

在1中我提到的几种效果，我们无法在textarea中见到立竿见影的效果（所见即所得），而文本域本身也只是支持一些字符的输入，并不支持显示html。

如何做到编辑像文本域，又能够即时所见呢？答案就是使用iframe作为内容编辑区域。iframe本身也是一个嵌套页面，它如何能够被编辑呢？这里有一些关键的属性，它们可以做到让iframe可以被编辑。

还是直接上代码来得方便一些，代码也很少。

```
<html>
<script language="javascript" type="text/javascript">
//初始化编辑器
function init() {
var ifr = document.getElementByIdx_x("editor");
var doc = ifr.contentDocument || ifr.contentWindow.document; // W3C || IE
doc.designMode="on";
doc.contentEditable= true;
doc.write('<html><head><style>body{ margin:3px; word-wrap:break-word; word-break: break-all; }</style></head><body>GoodNessEditor</body></html>');
alert(doc.body.innerHTML);
}
//设置选定的文本为粗体/正常
function setBold() {
var win=document.getElementByIdx_x("editor").contentWindow;
win.document.execCommand("Bold",false,null);
win.focus();
}
</script>
<p>
<input type="button" id="bBtn" value="B" style="font-weight:bold" οnclick="setBold();" />
</p>
<p>
<iframe id="editor" width="600px" height="400px" style="border:solid 1px;"></iframe>
</p>
<script type="text/javascript">
init();
</script>
```

很重要的几点
  (1).用**ifr.contentDocument ||ifr.contentWindow.document**方式获取iframe的文档对象
  (2).分别设置***\*designMode\****属性为’on’，***\*contentEditable\****属性为’true’让iframe可编辑
  (3).通过**doc.body.innerHTML**方法获取内容，这个内容是我们最终要插入到数据库或显示在页面上的（例如用户评论）

大家可以运行上面的代码，可以看到如下截图中的效果：

![img](https://img-blog.csdn.net/20140108110728531?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZnQyMTY2ODI2/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)



但是在实际运行的时候，你是否发现除了chrome浏览器外（用IETester, Firefox,Chrome测试）打开这个页面都处于正在加载的状态（那个轮子转啊转，转个不停…）

只要**在doc.write()方法前后加上doc.open(),doc.close()**就可以了（在写之前开启，写完之后关闭）。

最后，我们的Web程序中经常使用jQuery作为基础类库，那就把上面的代码也改造为jQuery吧。代码如下：

```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KF富文本编辑器</title>
<script type="text/javascript" src="jquery.min.js">
</script>
<script type="text/javascript">
$(function(){
    $d = $("#editor")[0].contentWindow.document; // IE、FF都兼容
    $d.designMode="on";
    $d.contentEditable= true;
    $d.open();
    $d.close();
    $("body", $d).append("<div>A</div><div>B</div><div>C</div>");
    $('#insert_img').click(function(){
        // 在iframe中插入一张图片                                    
        var img = '<img src="' + $('#path').val() +'" />';
        $("body", $d).append(img);
    });
    $('#preview').click(function(){
        // 获取iframe的body内容，用于显示或者插入到数据库
        alert($('#editor').contents().find('body').html());
        $('#preview_area').html($('#editor').contents().find('body').html());
    });
});
</script>
</head>
<body>
<p><iframe id="editor" width="600px" height="200px" style="border:solid 1px;"></iframe></p>
<input type="text" id="path" value="http://www.google.com.hk/intl/zh-CN/images/logo_cn.png"/>
<input type="button" id="insert_img" value="插入图片" />
<input type="button" id="preview" value="预览" />
<p style="border: 1px dashed #ccc;" id="preview_area"></p>
</body>
</html>
```

效果图如下：

![img](https://img-blog.csdn.net/20140108110808203?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZnQyMTY2ODI2/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

是不是觉得很简单呢？