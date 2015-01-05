// JavaScript Document
/*****************************************************************************
*  创建日期: 2005年10月16日
*  作者:  gongh
*  功能:  申报表的公用方法
*  公司:  天之华
*****************************************************************************/

/**
*  打开模式对话框的方法  
*  pageUrl: 对话框的URL地址
*  dialogInfo: 传入对话框的变量, 在对话框页面中通过window.dialogArguments可以取得
*  dialogWidth, dialogHeight: 对话框的宽度和高度
*  返回值: 对话框的引用
*/
function showDialog(pageUrl, dialogInfo, dialogWidth, dialogHeight) {
	return window.showModalDialog(pageUrl, dialogInfo, "dialogWidth:" + dialogWidth + "px;dialogHeight:" + dialogHeight + "px;help:no;scroll:auto;status:no");
}

/*敲回车键自动跳转下一个控件,页面控件配onKeyDown事件*/
function func_enter()
{
	if(event.keyCode==13)
		event.keyCode=9;
}

/*点击图片自动隐藏表格*/
function func_dispTB(img,tb)
{
	if(img.src.indexOf('tishi_01.gif')>=0)
	{
		img.src='../../resources/images/tishi_01b.gif';
		tb.style.display = "none";
	}
	else
	{
		img.src='../../resources/images/tishi_01.gif';
		tb.style.display = "";
	}
}
/*检查控件是否为空值*/
function func_check()
{
	var obj=document.all;
	for(var i=0;i<obj.length;i++)
	{
		if(obj[i].validate=='0' && obj[i].value == '')
		{	
			alert(obj[i].desc+'不能为空!');
			return false;
		}
	}
	return true;
}

/*清空页面控件*/
function func_cancel()
{
	var obj=document.all;
	for(var i=0;i<obj.length;i++)
	{
		if((obj[i].tagName=='INPUT' || obj[i].tagName=='image-select' || obj[i].tagName=='TEXTAREA')&& (obj[i].type!='button'))
		{
			obj[i].value='';
		}
	}
}

/*将页面控件打包生成XML*/
function createXML()
{
	var str_xml="<data><xmls>";
	var obj=document.all;
	for(var i=0;i<obj.length;i++)
	{
		if (obj[i].xml=='0' && obj[i].value!='')
		{
			if (obj[i].value.indexOf('<')!=-1)
			{
				obj[i].value = obj[i].value.replace(/</g,"《");
			}
			if (obj[i].value.indexOf('>')!=-1)
			{
				obj[i].value = obj[i].value.replace(/>/g,"》");
			}
			str_xml += "<"+obj[i].name+">"+obj[i].value+"</"+obj[i].name+">";
		}
	}
	str_xml += "</xmls></data>";
	return str_xml;
}

function func_check_form()
{
	var obj=document.forms[0].elements;
	for(var i=0;i<obj.length;i++)
	{
		if(obj[i].validate=='0' && obj[i].value == '')
		{	
			alert(obj[i].desc+'不能为空!');
			return false;
		}
	}
	return true;
}

function func_cancel_form()
{
	var obj=document.forms[0].elements;
	for(var i=0;i<obj.length;i++)
	{
		if((obj[i].tagName=='INPUT' || obj[i].tagName=='image-select')&& (obj[i].type!='button'))
		{
			obj[i].value='';
		}
	}
	return true;
}
/*将页面控件加底色*/
function loadBorder()
{
    var con=document.all;
	for(var i=0;i<con.length;i++)
	{
	  	if(con[i].type=="text" || con[i].tagName == "TEXTAREA")
		{
			if(con[i].bgcolor=="0")
	    		con[i].style.backgroundColor = "#E0F0FF";
			else
				con[i].style.backgroundColor = "#FFFFFF";
		}
	  	if(con[i].type=="image-select" || con[i].type=="editor-select")
		{
			if(con[i].bgcolor=="0")
	    		con[i].setBgColor("#E0F0FF");
			else
				con[i].setBgColor("#FFFFFF");
		}
	 }
}
//取消操作 关闭页面
function cancel() {
	try {
		parent.window.oMPC.DelCurrentPage();
	} catch(e) {
		window.close();
	}
}

function parent_cancel() {
	try {
		parent.parent.window.oMPC.DelCurrentPage();
	} catch(e) {
		parent.window.close();
	}
}
/**
*  通过自定义的rowTag属性获取指定表格的行
*  tableId: 查找的Table元素的ID
*  tagName: 自定义的行的tagName属性名称
*  返回值: 查找到后返回行对象， 没找到返回空值 
**/
function getRowByTagName(tableId, tagName) {
	var rows = tableId.rows;
	for (var i = 0; i < rows.length; i++) {
		if (rows[i].rowTag == tagName)
			return rows[i];
	}
	return null;
}
//
function getRowsByTagName(tableId, tagName) {
	var aryRows = new Array();
	var rows = tableId.rows;
	var pos = 0;
	for (var i = 0; i < rows.length; i++) {
		if (rows[i].rowTag == tagName) {
			aryRows[pos++] = rows[i];
		}
	}
	return aryRows;
}

/**
*  通过批定自定义的rowName属性的所有行  
*  tableId: 查找的Table元素的ID
*  rowName: 自定义的行rowName属性
*  返回值: 返回把有行的rowName属性为指定名称的行对象的数组
**/
function getRowsByRowName(tableId, rowName) {
	var aryRows = new Array();
	var rows = tableId.rows;
	var pos = 0;
	for (var i = 0; i < rows.length; i++) {
		if (rows[i].rowName == rowName) {
			aryRows[pos++] = rows[i];
		}
	}
	return aryRows;
}
/**
*通过自定义的rowName数据检索具体的行
*tableId： 查找的Table元素的ID
*rowName：自定义的行rowName
*返回值：返回具体的行
*/
function getRowByRowName(tableId,rowName){
	var rows = tableId.rows;	
	var pos = 0;
	for (var i = 0; i < rows.length; i++) {
		if (rows[i].rowName == rowName) {
			return rows[i];
		}
	}
	return null;
}
/**
*   一个文本框的onkeypress公用的事件处理程序
*   用于校验输入的值是否正整型数据
*   当输入的不为数字则不显示按键的值
**/
function validateInt() {
	var keyCode = window.event.keyCode;   //取得按下的键
	var value = window.event.srcElement.value;  
	value += String.fromCharCode(keyCode);
	if (value == "") return;
	//var reg = "^(((-)?(\\d+\\.)?)|((-)?\\d+(\\.\\d{1,2})?))$"; 
	var reg = "^(((-)?(\\d+)?)|((-)?\\d+(\\d+)?))$"; 
	if (regTestValue1(value, reg)) return;
	window.event.returnValue = false;
}
/**
*   一个文本框的onkeypress公用的事件处理程序
*   用于校验输入的值是否为两位浮点型数据
*   当输入的不为数字则不显示按键的值
**/
function validateNum() {
	var keyCode = window.event.keyCode;   //取得按下的键
	var value = window.event.srcElement.value;  
	value += String.fromCharCode(keyCode);
	if (value == "") return;
	//var reg = "^(((-)?(\\d+\\.)?)|((-)?\\d+(\\.\\d{1,2})?))$"; 
	var reg = "^(((-)?(\\d+\\.)?)|((-)?\\d+(\\.\\d+)?))$"; 
	if (regTestValue1(value, reg)) return;
	window.event.returnValue = false;
}

/***
*   通取来的正则表达式验证
*   sVal: 要验证的字符串值
*   regStr: 匹配的正则表达式的值
*   返回值:  true，通过验证, false,没通过验证
**/
function regTestValue1(sVal, regStr) {
	if(sVal.match( regStr ))
		return true;
	return false;
}

/***
*  格式化指定行的序号列
*  tableId, 指定的Table元素ID
*  startRowIndex: 开始行位置
*  endRowIndex:  结束行位置
*  colIndex: 格式化的列 
***/
function formatSerN(tableId, startRowIndex, endRowIndex, colIndex) {
	var pos = 1;
	for (var i = startRowIndex; i <= endRowIndex; i++) {
		tableId.rows(i).cells(colIndex).innerHTML  = '<div align="center">' + pos++ + '</div>';
	}
}

/**
*   格式化指定rowName的行的序号
*   每一小项的数据都是从1开始递增
*   tableId: 表格元素的ID
*   rowName: 需格化行的名称
*   colIndex: 格式化的列
*/
function formatSmallSn(tableId, rowName, colIndex) {
	var rows = getRowsByRowName(tableId, rowName);
	for (var i = 0; i < rows.length; i++) {
		rows[i].cells[colIndex].childNodes[0].value = (i + 1);
	}
}

/***
*   禁止粘贴数据
**/
function DoBeforepaste() {
	clipboardData.setData('text','');
}

/***************************************************************************
*   以下方法用于对上行，下行XML进行打包与解包的通用操作方法
*
****************************************************************************/
/**
*  通用的打包方法
*  
**/
function package() {
		
}

/**
* 将主表的数据打包成XML (static-data数据)
* 通过文本框的自定义的属性flag来标识
* XML格式为元素名为文本框名，值为文本框的Value
**/
function packageMainTable(doc, rootElement) {
	var staticData = doc.createElement("static-data");
	rootElement.appendChild(staticData);
	//遍历页面所有元素，查找flag标识为main的为主表的元素
	for (var i = 0; i < document.all.length; i++) {
		var obj = document.all(i);
		if (obj.flag == 'main') {
			//alert(obj.name);
			var node =null;
			if(obj.selFlag){//打包 select
				node=doc.createElement(obj.tmpname);
			}else{
				node=doc.createElement(obj.name);
			}
			//alert(obj.outerHTML);
			if(obj.charFlag=='need'){//打包字符
				node.text = "'"+obj.value+"'";				
			}else{
				if(obj.name=='N_ZEROFLAG'){//零申报
					if(obj.checked){
						node.text = obj.value;
					}else{
						node.text="0";	
					}
				}else{
					node.text = obj.value;
				}
			}
			//alert(node.text);			
			staticData.appendChild(node);
		}
	}
}

/***
*  解包主表数据
*  通过查询static-data元素下的子元素进行数据填充
*  static-data下子元素命名是页面文本框的ID
*  rootElement: 要解析的XML元素结点
**/
function parseMainTableXML(rootElement) {
	var mainDataElement = rootElement.selectSingleNode("/data/static-data");
	//alert(mainDataElement.xml);
	if (mainDataElement) {
		var childNdoes = mainDataElement.childNodes;
		for (var i = 0; i < childNdoes.length; i++) {
			//alert(childNdoes[i].xml);
			var nodeName = childNdoes[i].nodeName;
			var nodeText = childNdoes[i].text;
			var objText = eval("document.all." + nodeName);
			//alert(nodeText);
			if (objText.type == 'text') {
				objText.value = (nodeText.replace("'","")).replace("'","");
			}else if(objText.type =='checkbox'){				
				if(nodeName=='N_ZEROFLAG'){
					if(nodeText=='1'){		//零申报 选中
						objText.checked="true";
					}				
				}
			}
		}
	}
} 
/*
* 解析财务报表的本年累计数据
* rootElement: 要解析的XML元素结点
* b_showLeijs:是否显示累计数 0:不显示,1:显示
*/
function parseLastTotalXML(rootElement, b_showLeijs) {
	var lastTotalElement = rootElement.selectSingleNode("/data/static-data");
	//alert(lastTotalElement.xml);
	if (lastTotalElement) {
		var childNdoes = lastTotalElement.childNodes;
		for (var i = 0; i < childNdoes.length; i++) {
			//alert(childNdoes[i].xml);
			var nodeName = childNdoes[i].nodeName;
			var nodeText = childNdoes[i].text;
			var objText = eval("document.all." + nodeName);
			if (objText.type == 'text') {
				if(b_showLeijs==1){
					objText.value = (nodeText.replace("'","")).replace("'","");
				}							
				objText.lastTotal = (nodeText.replace("'","")).replace("'","");
			}
		}
	}
} 

/**
*	初始化申报页面[下行xml解析之前]添加纳税人初始化信息	
*/
//"page_url(0)", "st_order(1)", "纳税人编码(2)","纳税人名称(3)","企业类型(4)","隶属关系(5)","征收机关(DM)(6)","征收机关(MC)(7)","银行(8)","帐号(9)","税款所属机关(DM)(10)","税款所属机关名称(11)","申报表主表名称(12)","税种联动(13)","纳税核定属性(14)")||;';
function loadNsrInfoBegin(paramArray){
	//alert(paramArray[22]);
	//alert(paramArray);
	if(paramArray){
		if(paramArray[0])//storder
			document.all.C_SBB_ID_SNO.value=paramArray[0];
		if(paramArray[1])//纳税人编码
			document.all.C_NSRBM.value=paramArray[1];
		if(paramArray[2])//纳税人名称
			document.all.C_MC.value=paramArray[2];
		if(paramArray[5]){//征收机关(DM)
			document.all.hid_swjgdm.value=paramArray[5];
		}
		if(paramArray[6]){//征收机关(MC)
			document.all.txt_oc_zsjg.value=paramArray[6];	
		}
		if(paramArray[7])//银行
			document.all.hid_yh.value=paramArray[7];	
		if(paramArray[9]){//税款所属机关(DM)						
			document.all.hid_skssjgdm.value=paramArray[9];
		}
		if(paramArray[10]){//税款所属机关(MC)
			document.all.txt_oc_skssjg.value=paramArray[10];
		}
		if(paramArray[11]){//申报表主表名称
			document.all.hid_sb_main_table.value=paramArray[11];
		}
		if(paramArray[12]){//税种联动标志值
			document.all.hid_sz_ld.value=paramArray[12];
			document.all.OC_SBBLX.value=paramArray[12];
		}
		if(paramArray[13]){//纳税核定属性
			document.all.OC_NSHDSX.value=paramArray[13];
		} 
	}
}
/**
*	初始化申报页面[下行xml解析之后]添加纳税人初始化信息	
*/
//"page_url(0)", "st_order(1)", "纳税人编码(2)","纳税人名称(3)","企业类型(4)","隶属关系(5)","征收机关(DM)(6)",
//"征收机关(MC)(7)","银行(8)","帐号(9)","税款所属机关(DM)(10)","税款所属机关名称(11)","申报表主表名称(12)",
//"税种联动(13)","纳税核定属性(14)")||;';
//"缴款方式(15)","主营行业代码(16)","主营行业名称(17)")||;';
function loadNsrInfoEnd(ary){
	//alert(ary);
	if(ary){
		if(ary[3])//企业类型
			document.all.OC_JJXZ.setValue(ary[3]);
		if(ary[4])//隶属关系		
			document.all.OC_LSGX.setValue(ary[4]);	
		if(ary[5]==null||ary[5]==""){//征收机关(DM)
			document.all.hid_swjgdm.value=document.all.hid_dqswjg.value;//税款所属机关代码		
		}
		if(ary[6]==null||ary[6]==""){//征收机关(MC)
			document.all.txt_oc_zsjg.value=document.all.hid_dqswjgmc.value;//税款所属机关名称			
		}
		if(ary[7])//银行
			document.all.OC_KHYH.setValue(ary[7]);	
		if(ary[8])//银行帐号
			document.all.C_YHZH.setValue(ary[8]);	
		if(ary[9]==null||ary[9]==""){//税款所属机关(DM)						
			document.all.hid_skssjgdm.value=document.all.hid_dqswjg.value;//当前征收机关代码
		}
		if(ary[10]==null||ary[10]==""){//税款所属机关(MC)
			document.all.txt_oc_skssjg.value=document.all.hid_dqswjgmc.value;//当前征收机关名称
		}
		if(ary[14]){//缴款方式
			document.all.OC_JKFS.setValue(ary[14]);
		}
		if(ary[15]){//主营行业代码
			document.all.OC_ZYHY.value=ary[15];
		}
		if(ary[16]){//主营行业名称
			document.all.C_HY.value=ary[16];
		} 
	}
}  
/**
*	打包纳税人信息
*/
function packageNsrInfo(N_SJSK){
	var xmlDocNsr = new ActiveXObject("Msxml2.DOMDocument");
	var rootElementNsr = xmlDocNsr.createElement("data");
	//遍历页面所有元素，查找flag标识为nsrinfo的元素		
	for (var i = 0; i < document.all.length; i++) {
		var obj = document.all(i);
		if (obj.flag == 'nsrinfo') {				
			var node = xmlDocNsr.createElement(obj.name);
			if(obj.dateflag=='need'){//打包日期
				node.text = "to_date('"+obj.value+"','YYYY-MM-DD')";
			}else{
				node.text ="'"+obj.value+"'";
			}
			rootElementNsr.appendChild(node);
			//alert(obj.name+"  "+obj.value);
		}
	}
	if(N_SJSK){
		var node = xmlDocNsr.createElement("N_SJSK");	
		//alert(N_SJSK);
		node.text=N_SJSK;
		rootElementNsr.appendChild(node);
	}
	//alert(rootElementNsr.xml);
	//document.all.hidden_nsr_table_value.value = rootElementNsr.xml;
	return rootElementNsr.xml;
}
/*弹出征收机关树*/
function openSWJG(){
	var val = showDialog('../../../resources/swjg/swjg.htm', null, 400, 600);
	if (val) {
		oc_djswjg.value=val[1];
		hid_djswjg.value=val[0];
		OC_ZSJG.value=val[0];		//征收机关（C_DM）
	}
	//alert(val[0] + "=======" + val[1]);
}
/**********************************************处理联动*************************************************************/

//动态联动的下拉框数据
var arrayObj = new Object();
arrayObj['OC_SZ'] = new Array();      //税种下拉框
arrayObj['OC_SM'] = new Array();      //税目下拉框
arrayObj['OC_KUAN'] = new Array();    //款下拉框
arrayObj['OC_XIANG'] = new Array();   //项下拉框
arrayObj['OC_FPBL'] = new Array();    //分配比例
arrayObj['OC_PZDL'] = new Array();    //票证大类
arrayObj['OC_ZJFL'] = new Array();    //征集分类
arrayObj['OC_SJGK'] = new Array();    //收缴国库

var curRow=null;//当前行	
var SEL_SZ=document.createElement('select');//税种	
var SEL_SM=document.createElement('select');//税目

var SEL_KUAN=document.createElement('select');//款
var SEL_XIANG=document.createElement('select');//项
var SEL_FPBL=document.createElement('select');//分配比例
var SEL_SJGK=document.createElement('select');//收缴国库
var SEL_PZDL=document.createElement('select');//票证大类
var SEL_ZJFL=document.createElement('select');//征集分类
	
var SEL_NSQX=document.createElement('select');//纳税期限

var OC_SKSSQ=null;//税款所属起
var OC_SKSSZ=null;//税款所属止
var OC_XJRQ=null;//限缴日期
var OC_TFRQ=null;//填发日期
//var N_HJJE=null;//核缴金额
var N_ZNJ=null; //滞纳金
var N_SL=null;//税率


//通过列名获取列的列标
function getColumnIndexByName(name) {
	//alert(columnNameArray.length);
	for (var i = 0; i < columnNameArray.length; i++) {
		if (columnNameArray[i] == name)
			return i;
	}
	return -1;
}

//加载下拉框的列表值
function loadSelectOption(name, element) {
	var childNodes = element.selectNodes("//" + name + "/list");
	for (var i = 0; i < childNodes.length; i++) {
		var value = childNodes[i].getAttribute("value");
		var text = childNodes[i].getAttribute("display_name");
		var tmpOption = new Option(text, value);
		tmpOption.inner_xml = processChild(childNodes[i]);
		arrayObj[name][i] = tmpOption;
	}
}

//处理结点的子节点XML数据
function processChild(element) {
	var returnString = "";
	var childNodes = element.childNodes;
	for (var i = 0; i < childNodes.length; i++) {
		var childNodes1 = childNodes[i].childNodes;
		var tmpString = "";
		for (var j = 0; j < childNodes1.length; j++) {
			if (childNodes1[j].nodeName.toLowerCase() == 'list') {
				var value = childNodes1[j].getAttribute("value");
				tmpString += value + ";";
			} else if (childNodes1[j].nodeName.toLowerCase() == 'value') {
				tmpString = childNodes1[j].text;
				break;
			}
		}
		tmpString = childNodes[i].nodeName + "," + tmpString + "|";
		returnString += tmpString;
	}
	return returnString;
}


//获取指定选项值
function getOptions(name, value) {
	var returnOptions = new Array();
	var ary = value.split(";");
	for (var i = 0; i < ary.length; i++) {
		var listAry = arrayObj[name];
		for (var j = 0; j < listAry.length; j++) {
			if (listAry[j].value == ary[i]) {
				returnOptions[i] = listAry[j];
				break;
			}
		}
	}
	return  returnOptions;
}

//扩展String对象，添加两个方法
//endWith判断指定的字符串是否以指定的字符结尾
String.prototype.endWith = function(str) {
	if (str.length > this.length) 
		return false;
	var tmp = this.substr(this.length-str.length, this.length);
	if (tmp == str)
		return true;
	return false;
}

//为指定的字符串载取后面的指定字符串
String.prototype.trim = function(str) {
	if (str.length > this.length) 
		return this;
	var tmp = this.substr(this.length-str.length, this.length);
	if (tmp == str)
		return this.substr(0, this.length-str.length);
	return this;
}

function changeLD() {
	//alert(event.srcElement.outerHTML);
	processSMRelation(event.srcElement);
}


//标识选中行
function selectRows() {
	event.cancelBubble=true;
	var obj = event.srcElement;
	while(obj.tagName.toLowerCase() != 'tr')
		obj = obj.parentNode;
	if (curRow == obj)
		return;
	if (curRow != null) {
		curRow.bgColor = "#FFFFFF";
		curRow.style.color = "#000000"
	}
	curRow = obj;
	curRow.bgColor = "highlight";
	curRow.style.color = "#FFFFFF";
}
//取消选中行
function document.onclick() {
	if (curRow != null) {
		curRow.bgColor = "#FFFFFF";
		curRow.style.color = "#000000"
	}
	curRow  = null;
}


//加载静态下拉框的数据
function loadSelect() {
	//加载税种
	var ary=arrayObj['OC_SZ']
	SEL_SZ.options.length=0;
	for (var i = 0; i < ary.length; i++) {
		SEL_SZ.add(ary[i]);
	}
	//加载税目
	ary = arrayObj['OC_SM'];
	SEL_SM.options.length = 0;
	for (var i = 0; i < ary.length; i++) {
		SEL_SM.add(ary[i]);
	}		
	//加载款
	ary = arrayObj['OC_KUAN'];
	SEL_KUAN.options.length = 0;
	for (var i = 0; i < ary.length; i++) {
		SEL_KUAN.add(ary[i]);
	}		
	//加载分配比例
	ary = arrayObj['OC_FPBL'];
	SEL_FPBL.options.length = 0;
	for (var i = 0; i < ary.length; i++) {
		SEL_FPBL.add(ary[i]);
	}		
	//加载票证大类
	ary = arrayObj['OC_PZDL'];
	SEL_PZDL.options.length = 0;
	for (var i = 0; i < ary.length; i++) {
		SEL_PZDL.add(ary[i]);
	}		
	//加载征集分类
	ary = arrayObj['OC_ZJFL'];
	SEL_ZJFL.options.length = 0;
	for (var i = 0; i < ary.length; i++) {
		SEL_ZJFL.add(ary[i]);
	}		
	//加载收缴国库
	ary = arrayObj['OC_SJGK'];
	SEL_SJGK.options.length = 0;
	for (var i = 0; i < ary.length; i++) {
		SEL_SJGK.add(ary[i]);
	}
}

//页面初始化加载数据的方法
function loadDataLD(xmlData) {
	//alert(xmlData);
	//税种
	SEL_SZ.onchange="changeLD();"
	SEL_SZ.Class="myselectSZorSM";
	SEL_SZ.tmpname="OC_SZ";
	SEL_SZ.selFlag="need";
	SEL_SZ.charFlag="need";
	//税目
	//SEL_SM.onchange = "changeLD();";
	SEL_SM.Class="myselectSZorSM";
	SEL_SM.tmpname="OC_SM";
	SEL_SM.selFlag="need";
	SEL_SM.charFlag="need";
	//款
	SEL_KUAN.onchange = "changeLD();";
	SEL_KUAN.Class="myselectKUAN";
	SEL_KUAN.tmpname="OC_KUAN";
	SEL_KUAN.selFlag="need";
	SEL_KUAN.charFlag="need";
	//项
	SEL_XIANG.tmpname="OC_XIANG";
	SEL_XIANG.Class="myselectKUAN";
	SEL_XIANG.selFlag="need";
	SEL_XIANG.charFlag="need";
	//票证大类
	SEL_PZDL.tmpname="OC_PZDL";
	//SEL_PZDL.Class="myselect";
	SEL_PZDL.selFlag="need";
	SEL_PZDL.charFlag="need";
	//分配比例
	SEL_FPBL.tmpname="OC_FPBL";
	//SEL_FPBL.Class="myselectFPBL";
	SEL_FPBL.selFlag="need";
	SEL_FPBL.charFlag="need";
	//收缴国库
	SEL_SJGK.tmpname="OC_SJGK";
	//SEL_SJGK.Class="myselect";
	SEL_SJGK.selFlag="need";
	SEL_SJGK.charFlag="need";
	//征集分类
	SEL_ZJFL.tmpname="OC_ZJFL";
	//SEL_ZJFL.Class="myselect";
	SEL_ZJFL.selFlag="need";
	SEL_ZJFL.charFlag="need";
	
	var xmlDoc = new ActiveXObject("Msxml2.DOMDocument");
	if(xmlData){
		xmlDoc.loadXML(xmlData);
		var root = xmlDoc.documentElement;
		//加载税种
		loadSelectOption("OC_SZ", root);
		loadSelectOption("OC_SM", root);
		loadSelectOption("OC_KUAN", root);
		loadSelectOption("OC_XIANG", root);
		
		loadSelectOption("OC_FPBL", root);
		loadSelectOption("OC_PZDL", root);
		loadSelectOption("OC_ZJFL", root);
		loadSelectOption("OC_SJGK", root);
		
		//加载静态下拉框的数据
		loadSelect();
		//addInitInfo();
	}		
}


//添加初始化税目信息，多税种
function addInitInfo(){	
	if(SEL_SZ){
		//alert(SEL_SZ.options.length);
		for(var i=0;i<SEL_SZ.options.length;i++){			
			SEL_SZ.value = SEL_SZ.options[i].value;
			var inner_xml = SEL_SZ.options[i].inner_xml;
			var ary1 = inner_xml.split("|");
			for (var k = 0; k < ary1.length; k++) {
				var tmpStr = ary1[k];
				if (tmpStr) {
					var ary2 = tmpStr.split(",");
					var name = ary2[0];
					var value = ary2[1];
					if (name == 'OC_SM') { 
						if (value.endWith(";")) {
							//执行加载下拉列表值，有递归连动关系需递归处理
							var celIndex = getColumnIndexByName(name);
							var tmpOptions = getOptions(name, value);
							for (var j = 0; j < tmpOptions.length; j++) {
								addRow(tmpOptions[j].value);
							}
						}
					}
				}
			}
			
		}
	}
}

//添加初始化 核定信息, 单税种
function addInitInfo1(){
	if(SEL_SM){
		for(var i=0;i<SEL_SM.options.length;i++){
			SEL_SM.value = SEL_SM.options[i].value;				
			addRow();				
		}
	}
} 


//处理税目联动关系
function processSMRelation(obj) {
	var row = obj.parentNode.parentNode;
	if (obj.selectedIndex == -1) {
		return;
	}
	var curOption = obj.options[obj.selectedIndex];
	var inner_xml = curOption.inner_xml;
	var ary1 = inner_xml.split("|");
	for (var i = 0; i < ary1.length; i++) {
		var tmpStr = ary1[i];
		if (tmpStr) {
			var ary2 = tmpStr.split(",");
			var name = ary2[0];
			var value = ary2[1];
			if (value.endWith(";")) {
				//执行加载下拉列表值，有递归连动关系需递归处理
				var celIndex = getColumnIndexByName(name);
				var tmpOptions = getOptions(name, value);
				var obj1 = row.cells[celIndex].childNodes[0];
				//alert(obj1.outerHTML);
				if (obj1) {
					obj1.options.length = 0;
					for (var j = 0; j < tmpOptions.length; j++) {
						var tmpOp = new Option(tmpOptions[j].text, tmpOptions[j].value);
						tmpOp.inner_xml = tmpOptions[j].inner_xml;
						obj1.add(tmpOp);				
					}
				}
				if (name == 'OC_KUAN') {
					var rIndex = getColumnIndexByName('OC_KUAN');
					processSMRelation(row.cells[rIndex].childNodes[0]);
				}	
				if (name == 'OC_SM') {
					var rIndex = getColumnIndexByName('OC_SM');
					processSMRelation(row.cells[rIndex].childNodes[0]);
				}	
			}  else {
				//加载单值，选定值
				var celIndex = getColumnIndexByName(name);				
				//alert(name + "," + celIndex);				
				row.cells[celIndex].childNodes[0].value = value;
				//款有连动关系，先处理其连动
				if (name == 'OC_KUAN') {
					var rIndex = getColumnIndexByName('OC_KUAN');
					processSMRelation(row.cells[rIndex].childNodes[0]);
				}	
			}	
		}
	}
}


/*计算置纳金
*  tfDate:   填发日期
*  xjDate:   限缴日期
*  num:      核缴金额
*/
function ZNJCal(tfDate, xjDate, num) {
	var rValue = 0;
	//将日期字符串转换成日期格式
	//alert(tfDate+"  "+xjDate+"  "+ num);
	var ary = tfDate.split('-');
	var sDate = new Date(ary[0], ary[1]-1, ary[2]);
	var ary1 = xjDate.split('-');
	var eDate = new Date(ary1[0], ary1[1]-1, ary1[2]);
	
	//获取日期之间的相差
	var mildate = (sDate.getTime() - eDate.getTime());
	
	var day = mildate / (3600*24*1000);
	if (day >= 0) {
		rValue = num * day * 0.0005;
	}
	return rValue.toFixed(2);
}
/** 计算 税率 和 速算扣除数
*/
//通过税种，税目，计税金额取出税率，速算扣除数
function calSlAndSsk(sz, sm, jsje) {
	//alert(sz+"  "+sm+"   "+jsje);
	var sm2 = sm.substring(sm.length-2, sm.length);
	var xmlDoc = new ActiveXObject("microsoft.xmldom");
	//联动计算信息
	var xmlText=commFram.document.all.hid_sz_ld_xml.value;
	//var xmlText=commFram.document.all.slsckcs.value;
	//alert(xmlText);
	xmlDoc.async = false;
	//xmlDoc.load("/tax/zsgl/sbgl/sl.xml");
	xmlDoc.loadXML(xmlText);
	var rootElement = xmlDoc.documentElement;
	var node =rootElement.selectSingleNode('//data/column-relations/root/sz[@value="' +  sz  + '"]');		
	if (node) {
		var childNodes = node.childNodes;
		for (var i = 0; i < childNodes.length; i++) {
			var smName = childNodes[i].getAttribute('value');
			if (smName == 'any' || smName == sm2) {
				var cNodes = childNodes[i].childNodes;
				for (var j = 0; j < cNodes.length; j++) {
					var sx = cNodes[j].getAttribute("sx");
					sx = parseFloat(sx);
					var xx = cNodes[j].getAttribute("xx");
					if (xx == 'max' && jsje >= sx) {
						var sl = cNodes[j].childNodes[0].text;
						var kcs = cNodes[j].childNodes[1].text;
						//alert(sl + ',' + kcs);
						return new Array(sl, kcs);
					}
					xx = parseFloat(xx);
					if (jsje >= sx && jsje < xx) {
						var sl = cNodes[j].childNodes[0].text;
						var kcs = cNodes[j].childNodes[1].text;
						//alert(sl + ',' + kcs);
						return new Array(sl, kcs);
					}
				}
			}
		}
	}
	return new Array(0,0);
}
//创建纳税期限下拉框
function createSelNSQX(){		
	//alert(document.all.hid_szld_xml.value);
	if(document.all.hid_szld_xml.value){		
		//SEL_NSQX=document.createElement('select'); //创建 select
		SEL_NSQX.id="OC_NSQX";					   //自定义名称		
		SEL_NSQX.tmpname="OC_NSQX";  		   	   //自定义名称   			
		SEL_NSQX.selFlag="need";				   //标识为sel
		SEL_NSQX.charFlag="need";				   //以字符窜格式打包数据
		SEL_NSQX.disabled="true";				   //不可用
		SEL_NSQX.Class="myselect";				   //自定义样式
		var xmlDoc = new ActiveXObject("Msxml2.DOMDocument");
		xmlDoc.loadXML(document.all.hid_szld_xml.value);
		var root = xmlDoc.documentElement;
		var columnRelations = root.selectSingleNode("//data/column-relations");
		var selNode=columnRelations.selectSingleNode("OC_NSQX");  //纳税期限 select
		var colDisplayNodes=selNode.selectNodes("list");	 	  //下拉列表值
		for(var i=0;i<colDisplayNodes.length;i++){
			var tmpListNode=colDisplayNodes[i];
			var atrDisplayName=tmpListNode.getAttribute("display_name");//text
			var atrDisplayValue=tmpListNode.getAttribute("value");		//value
			SEL_NSQX.add(new Option(atrDisplayName,atrDisplayValue));
		}
		return SEL_NSQX;
	}
	//alert(SEL_NSQX.outerHTML);
	return null;
}
/*-------------------------------------------------------------------------------*/
//表格每列的列名
var columnNameArray = new Array('','OC_SZ','OC_SM','N_HJJE','N_ZNJ','OC_PZDL','OC_KUAN',
					'OC_XIANG','OC_FPBL','OC_SJGK','OC_ZJFL','DT_XJRQ', 'DT_TFRQ', 
					'DT_SKSHQ', 'DT_SKSHZ','OC_NSQX','OC_SBQX','N_SL');
//计算滞纳金	
function JS_ZNJ(){
	//alert(N_HJJE);
	//alert(document.all.N_HJJE.value);
	var checkValue=parseFloat(document.all.N_HJJE.value).toFixed(2);
	if(isNaN(checkValue)){
		checkValue=0;			
	}
	document.all.N_HJJE.value=checkValue;	
	window.event.srcElement.value=parseFloat(window.event.srcElement.value==''?0:window.event.srcElement.value);		
	if(parseFloat(document.all.N_HJJE.value)<0){
		document.all.N_HJJE.value=0.00;
	}
	//如果税种代码 后2位为 >70  不计算滞纳金
	var tmpSz=SEL_SZ.value;
	if(tmpSz){
		//alert("税种："+SEL_SZ.value);
		if(parseFloat(tmpSz.substr((tmpSz.length-2),2))>=70){
			document.all.N_ZNJ.value=0.00;			
		}else{
			var znjValue=ZNJCal(document.all.DT_TFRQ.value,document.all.DT_XJRQ.value,document.all.N_HJJE.value);
			document.all.N_ZNJ.value=znjValue;
		}
	}
}
//适用于单税目 申报表
function loadCommonInfo(){
	//解析联动
	loadDataLD(document.all.hid_szld_xml.value);	
	//纳税期限
	createSelNSQX();	
	
	SEL_SZ.flag="main";//税种
	SEL_SZ.id="OC_SZ";
	getRowByRowName(commInfoTable,"commRow").cells[1].innerHTML=SEL_SZ.outerHTML;				
	SEL_SM.flag="main";//税目
	SEL_SM.id="OC_SM";
	getRowByRowName(commInfoTable,"commRow").cells[2].innerHTML=SEL_SM.outerHTML;				
	SEL_PZDL.flag="main";//票证大类
	SEL_PZDL.id="OC_PZDL";
	getRowByRowName(commInfoTable,"commRow").cells[5].innerHTML=SEL_PZDL.outerHTML;		
	SEL_KUAN.flag="main";//款
	SEL_KUAN.id="OC_KUAN";
	getRowByRowName(commInfoTable,"commRow").cells[6].innerHTML=SEL_KUAN.outerHTML;
	SEL_XIANG.flag="main";//项
	SEL_XIANG.id="OC_XIANG";
	getRowByRowName(commInfoTable,"commRow").cells[7].innerHTML=SEL_XIANG.outerHTML;
	SEL_FPBL.flag="main";//分配比例
	SEL_FPBL.id="OC_FPBL";
	getRowByRowName(commInfoTable,"commRow").cells[8].innerHTML=SEL_FPBL.outerHTML;
	SEL_SJGK.flag="main";//收缴国库
	SEL_SJGK.id="OC_SJGK";
	getRowByRowName(commInfoTable,"commRow").cells[9].innerHTML=SEL_SJGK.outerHTML;
	SEL_ZJFL.flag="main";//征集分类
	SEL_ZJFL.id="OC_ZJFL";
	getRowByRowName(commInfoTable,"commRow").cells[10].innerHTML=SEL_ZJFL.outerHTML;
	//处理纳税期限
	getRowByRowName(commInfoTable,"commRow").cells[15].innerHTML=SEL_NSQX.outerHTML;

	processSMRelation(getRowByRowName(commInfoTable,"commRow").cells[6].childNodes[0]);	// 处理款
	processSMRelation(getRowByRowName(commInfoTable,"commRow").cells[2].childNodes[0]);	// 处理税目
}


//当日期控件值改变值时触发
function dateChangeEvent(obj) {
	if (obj.canChange == 'true') {
		//var oRow = obj.parentNode.parentNode;
		var sz = SEL_SZ.value;
		var date = obj.value;
		var nsqx = document.all.OC_NSQX.value;
		var sbqx = document.all.OC_SBQX.value;
		
		var ary = commFram.getSkssRqAndXjrq(sz, date, nsqx, sbqx);
		
		//ary格式税款所属时间起,税款所属时间止,限缴日期
		//alert(ary);
		//t1.value = ary;
		document.all.DT_XJRQ.value = ary[2];
		document.all.DT_SKSHQ.value = ary[0];
		document.all.DT_SKSHZ.value = ary[1];
		//alert(SEL_SZ.value);
		//计算滞纳金
		var znjValue=ZNJCal(document.all.DT_TFRQ.value,document.all.DT_XJRQ.value,document.all.N_HJJE.value);
		document.all.N_ZNJ.value=znjValue;
	}
}

//转还为浮点数
function parseFFunc(tmpVal){
	
	var checkValue=parseFloat(tmpVal);
	if(isNaN(checkValue)){
		checkValue=0;
	}
	return checkValue.toFixed(2);
	//return parseFloat(tmpVal==''?0:tmpVal).toFixed(2);
}



//单层表结构 保存前验证 验证 核缴金额不能大于 实际应缴税额
function saveCheck(ynse){
	if(ynse){
		//alert(document.all.N_HJJE.value+"   "+ynse);
		if(parseFloat(document.all.N_HJJE.value==''?0:document.all.N_HJJE.value)>parseFloat(ynse)){			
			alert("核缴金额不能大于实际应缴税额！");
			document.all.N_HJJE.focus();
			return false;
		}
	}
}


//有动态添加行  保存前验证  核缴金额不能大于  实际应缴税额
function saveCheckDynamic(hjjeNode,ynseNode){
	//if(hjjeNode.value&&ynseNode.value){
		//alert("核缴金额:"+hjjeNode.value+"  应纳税额:"+ynseNode.value);
		if(parseFloat(hjjeNode.value==''?0:hjjeNode.value)>parseFloat(ynseNode.value==''?0:ynseNode.value)){
			alert("核缴金额不能大于实际应缴税额！");
			hjjeNode.focus();
			return false;
		}
	//}
}
//分解缴销信息然后给页面对应元素赋值
function assignJCvalue(){
	if(FPJCHM.value!=''){
		var arrJcxx=FPJCHM.value.split("##"); 
		if(arrJcxx!=null && arrJcxx.length>0){
		    var jxkshm=arrJcxx[0];
			JXKSHM12.value=jxkshm.substring(0,12); //开始号码前12位字轨部分
			JXKSHM8.value=jxkshm.substring(12,20); //开始号码后8位
			JXJSHM.value=arrJcxx[1]; //结束号码
			hid_kshm.value=jxkshm; //隐藏开始号码
			hid_jshm.value=arrJcxx[1]; //隐藏结束号码
			hid_fpme.value=parseFloat(arrJcxx[2]).toFixed(2); //隐藏发票面额
			hid_fpdm.value=arrJcxx[3]; 
			JXFS.value=parseFloat(JXJSHM.value.substring(12,20))-parseFloat(JXKSHM8.value)+1; //份数
			hid_jxfs.value=JXFS.value;
			if(JXSYQK.value =='填用发票'){
				TKJE.value=parseFloat(hid_fpme.value*JXFS.value).toFixed(2); //填开金额
			}
			else{
				TKJE.value=parseFloat(0).toFixed(2); //填开金额
			}
			if(TKJE.value==0.00){
				TKJE.readOnly=false; //非定额发票
			}else{
				TKJE.readOnly=true;  //定额发票
			}
			
		}
	}
}

/*
*分解可核销信息,然后给页面对应元素赋值
*/
function assignHXKCvalue(){
	if(KHXSJ.value!=''){
	//370001034##22342342341201000001##22342342341201000003##1
		var arrJcxx=KHXSJ.value.split("##"); 
		
		if(arrJcxx!=null && arrJcxx.length>0){
		    var hskshm=arrJcxx[1];
			HXKSHM12.value=hskshm.substring(0,12); //开始号码前12位字轨部分
			HXKSHM8.value=hskshm.substring(12,20); //开始号码后8位
			HXJSHM.value=arrJcxx[2]; //结束号码
			hid_kshm.value=arrJcxx[1]; //隐藏开始号码
			hid_jshm.value=arrJcxx[2]; //隐藏结束号码
			MBFS.value=arrJcxx[3]; //每本份数
			//核销本数
			HXBS.value=(HXJSHM.value.substring(12,20)-HXKSHM8.value+1)/MBFS.value; 
			hid_hxbs.value=HXBS.value;
		}
	}

}

	/**判断新加入的开始号码和结束号码是否已经存在 */
	function isExist(beginNum,endNum,newBeginNum,newEndNum){
		var fExist;
		if((compareNum(newBeginNum,endNum)>0 || (compareNum(newEndNum,beginNum)<0))){
		  fExist = false;
		}else
		  fExist = true;
		return fExist;
	}

	//比较两个长度相等的整数字
	function compareNum(num1,num2){
		var fResult;
		for(i=0;i<num1.length;i++){
			if(num1.charAt(i) != num2.charAt(i)){
				if(num1.charAt(i).valueOf() > num2.charAt(i).valueOf()){
					fResult = 1;//num1 >　num2
				}
				if(num1.charAt(i).valueOf() < num2.charAt(i).valueOf()){
					fResult = -1;//num1 <　num2
				}
				break;
			}else
				fResult = 0;//num1 == num2
		}
		return fResult;
	}

//字符的位数不够，前面用0补齐，n为位数
function add0(str,n){
var tem=str;
    if(str.length>=n)
    {return str;}
    else{
        for(i=0;i<n-str.length;i++){
                tem="0"+tem;
        }
        return tem;
    }
}
//数字文本框失去焦点后自动在后面加小数点
function autoAddXsd(Str)
{
  if(Str.indexOf('.')==-1)
  {
	//alert(Str);
    Str=Str + '.00';
    
   }
   return Str;
 }

//通过TABLE导出EXCEL
 function exportExcel1(obj) 
 {
  	var tbrws=obj.rows;
  	var zsjg=c_zsjg.value;
	for(var rwindex=0;rwindex<tbrws.length;rwindex++)
	{
     	var tbcells=tbrws[rwindex].cells;
	 	for(var colindex=0;colindex<tbcells.length;colindex++)
	 	{
	  		if(tbrws[rwindex].cells[colindex].childNodes[0].nodeName=='INPUT' && tbrws[rwindex].cells[colindex].childNodes[0].type=='text')
			{
		    	tbrws[rwindex].cells[colindex].align="center";
		   		var mytb=tbrws[rwindex].cells[colindex].childNodes[0].parentNode;
		     	var myval=tbrws[rwindex].cells[colindex].childNodes[0].value;
			  	tbrws[rwindex].cells[colindex].innerHTML="<span>"+myval+"</span>";
			}
		
	 	}
	}
	var oXL = new ActiveXObject("Excel.Application"); 
	var oWB = oXL.Workbooks.Add(); 
	var oSheet = oWB.ActiveSheet; 
	var sel=document.body.createTextRange();
	sel.moveToElementText(obj);
	sel.select();
	sel.execCommand("Copy");
	oSheet.Paste();
	oXL.Visible = true;
 	document.execCommand("refresh");
 }
 
 function SetWinHeight(obj)    
{    
    var win = obj;    
    if (document.getElementById)    
    {    
        if (win && !window.opera)    
        {    
            if (win.contentDocument && win.contentDocument.body.offsetHeight)    
   
                win.height = win.contentDocument.body.offsetHeight;    
            else if (win.Document && win.Document.body.scrollHeight)    
                win.height = win.Document.body.scrollHeight;    
        }    
    }    
}

function substrByChar(string1,char1,char2)
{
	return string1.substr(string1.indexOf(char1)+1,string1.indexOf(char2)-1)
}

//对页面中的EDITTABLE的某一列进行校验
function validateEdittable(edittable,tablecomment,colname,colcomment,isnull,maxlength)//
{
	var col_array = eval("document.all."+edittable+".GetColumnValueByName('"+colname+"');");
	for(var i=0;i<col_array.length;i++)
	{
		if(isnull == 'T' && (col_array[i] == null || col_array[i] == ''))
		{
			alert(tablecomment+'的第'+(i+1)+'行的'+colcomment+'不能为空!');
			return false;
		}
		if(maxlength !='' && col_array[i].length > maxlength)
		{
			alert(tablecomment+'的第'+(i+1)+'的'+colcomment+'不能超过'+maxlength+'个字符!');
			return false;
		}
	}
	return true;
}

//将字符串去掉空格
function Trim(str) {
	return LTrim(RTrim(str));
	}

//将字符串去掉左空格
function LTrim(str) {
	if (str)
		return str.replace(/(^\s*)/g, "");
	else
		return "";
}

//将字符串去掉右空格
function RTrim(str) {
	if (str)
		return str.replace(/(\s*$)/g, "");
	else
		return "";
}

//将字符串中的数值去掉逗号
function TRNumber(numberStr)
{
	var obj_str = new Array();
	var R_value = ' ';
	if(numberStr.indexOf(",")>=0)
	{
		obj_str = numberStr.split(",");
		for(var i=0;i<obj_str.length;i++)
		{
			R_value = R_value + obj_str[i];
		}
		return Trim(R_value);
	}
	else
		return Trim(numberStr);
	
}
