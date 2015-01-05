<%@ page language="java"  pageEncoding="UTF-8"%>
<%
  String imageId = request.getParameter("imageId");
  String flage = request.getParameter("flage");
  String czy = request.getParameter("czy");
  String mkId = request.getParameter("mkId");
  String height = "200";
  String width = "200";
  if(request.getParameter("height")!=null&&request.getParameter("height")!=""){
       height = request.getParameter("height");
  }
  if(request.getParameter("width")!=null&&request.getParameter("width")!=""){
       width = request.getParameter("width");
  }
  session.setAttribute("width",width);
  session.setAttribute("height",height);
  session.setAttribute("imageId",imageId);
  session.setAttribute("flage",flage);
  session.setAttribute("czy",czy);
  session.setAttribute("mkId",mkId);
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">       
<head>       
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />  
<link rel="stylesheet" type="text/css" href="css/imgareaselect-default.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.imgareaselect.pack.js"></script>     
<title></title>
</style>   
<script type="text/javascript">
//初始化加载
$(window).load(function () {
$('#biuuu').imgAreaSelect({ aspectRatio: '1:1', onSelectChange: preview });
}); 

function preview(img, selection){
var scaleX = 100 / selection.width;
var scaleY = 100 / selection.height;

//动态小头像 获取当前选中框的宽度，高度，左边框，右边框
$('#biuuu + div > img').css({
width: Math.round(scaleX * 400) + 'px',
height: Math.round(scaleY * 300) + 'px',
marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px',
marginTop: '-' + Math.round(scaleY * selection.y1) + 'px'
});
}

//加载小头像
$(document).ready(function () {
$('<div><img src="biuuu.jpg" style="position: relative;" /></div>')
.css({
float: 'left',
position: 'relative',
overflow: 'hidden',
width: '100px',
height: '100px'
})
.insertAfter($('#biuuu'));
}); 
</script>
<script type="text/javascript"> 
 var imageWidth = "<%=width%>";
 var iamgeHeight = "<%=height%>";
 var imageId = "<%=imageId%>";
 var imageFlage = "<%=flage%>";

 function myLoad(){
  
    var newPreview = document.getElementById("newPreview"); 
    newPreview.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod = scale)";
    if(imageId==null||imageId==""||imageId=="null"){
        newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = "upload/defaule.jpg";
        
   }else{
        newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = "loadImage?imageId="+imageId;
   }
    if(imageWidth!=null && imageWidth>0 && iamgeHeight!=null && iamgeHeight>0){
       newPreview.style.width = imageWidth; 
       newPreview.style.height = iamgeHeight;
   }
   if(imageFlage=="insert"||imageFlage=="update"){
      document.getElementById("upload_img").style.display="";
      document.getElementById("sub").style.display="";
   }else{
      document.getElementById("upload_img").style.display="none";
      document.getElementById("sub").style.display="none";
   }
   
 }
 
 function lookImage (imgFile){
   
     var path = imgFile.value;
     if( !imgFile.value.match( /.jpg|.gif|.png|.bmp/i ) ){        
        alert('图片格式错误');        
        return false;        
    }  
    
    if( imgFile.files &&  imgFile.files[0] ){        
        // Firefox 因安全性问题已无法直接通过 input[file].value 获取完整的文件路径        
        path = imgFile.files[0].getAsDataURL();            
    } 
    //解决IE7，IE8由于安全问题不能获取全路径的问题 
    var isIE = (document.all) ? true : false;
    var isIE7 = isIE && (navigator.userAgent.indexOf('MSIE 7.0') != -1);
    var isIE8 = isIE && (navigator.userAgent.indexOf('MSIE 8.0') != -1);
    if(isIE7 || isIE8){
        imgFile.select();
        path=document.selection.createRange().text;
        document.selection.empty();
    }
    // IE7,IE8 在设置本地图片地址为 img.src 时出现莫名其妙的后果        
    //（相同环境有时能显示，有时不显示），因此只能用滤镜来解决
    var newPreview = document.getElementById("newPreview"); 
    newPreview.style.width = imageWidth; 
    newPreview.style.height = iamgeHeight;    
    newPreview.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod = scale)";    
    newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = path; 
   // document.getElementById("preview").src = path;
   
   //var objPreview = document.getElementById( 'preview' );
   //objPreview.src = imgFile.value;
 }       
</script>       
</head>       
<body onLoad="myLoad()" leftmargin="0px" rightmargin="0px" topmargin="0px" marginwidth="0px" marginheight="0px"> 
   <input type="hidden" name="hid_imageId" id="hid_imageId" value="<%=imageId%>"/>     
	<form action="upImage" method="post" name="form1" enctype="multipart/form-data"> 
	    <div id="newPreview">
	     
	    </div>
	    <input  type="file" id="upload_img" name="upload_img" onChange="lookImage(this)"/>
	    <input type="submit" id="sub" name="sub" value="上传" />   
	   
	</form>
<div class="container">
<p>
<img id="biuuu" src="G:\新建文件夹\large_dlzd_3cd500017f82118c.jpg" title="biuuu" style="float: left; margin-right: 10px;" />
</p>
</div> 
</body>       
</html>
