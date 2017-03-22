<!--#include file="inc/config.asp"-->
<!--#include file="inc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=SiteName%></title>
<!-- 自适应代码 bg-->
<meta http-equiv="Cache-Control" content="no-transform" /> 
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=yes" />
<!-- 自适应代码 end-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="description" content="维度先生的修理店" />
<link href="images/weidu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<style type="text/css"> 
	#divHead_mobile{display:none}
	#divNav_mobile{display:none}
	#divBottom_mobile{display:none}
	@media  screen and (max-width:960px)
	{
		.deskWidth{
			width:90%;
			font-size:13px;
			align:center;
			margin-top:20px;
		}		
		.widthBX{
			font-size: 16px;
			width:90%;
			border-radius:2px;
			height:28px;
			border:1px solid #DFDADA;	
			-webkit-tap-highlight-color: transparent;  
			-webkit-appearance: none;
			margin:auto;
		}		
		 /* 网页全屏显示 */
		body {width:100%;} 
		/* 正文全屏显示 */
		#divMain{width:100%} 
		/* 为了避免正文图片超出屏幕宽度 */
		/* 正文图片宽度最多是屏幕宽度的90% */
		#divMain img{max-width:90%} 
		/* 隐藏头部、导航、页脚 */
		#divHead{display:none}
		#divNav{display:none}
		#divBottom{display:none}
		/* 显示手机版导航*/
		#divNav_mobile{display:block}
		

}
</style>
</head>
<body>
	<!-- 头部 bg-->
	<div id="divHead">
	<table width="70%" cellSpacing=0 cellPadding=0 align=center>
	  <tr>
		<td colSpan=5 id="banner"><%=SiteName%></td>
	  </tr>
	</table>
	</div>
	<!-- 头部 end-->	
	<!-- 导航 bg-->
	<div class='card-holder' id="divNav">
	  <div class='card-wrapper'>
		<a href="index.asp">
		  <div class='card bg-01'>
			<span class='card-content'>维度先生首页</span>
		  </div>
		</a>
	  </div>
	  <div class='card-wrapper'>
		<a href="repair.asp">
		  <div class='card bg-02'>
			<span class='card-content'>在线报修</span>
		  </div>
		</a>
	  </div>
	  <div class='card-wrapper'>
		<a href='search.asp'>
		  <div class='card bg-03'>
			<span class='card-content'>维修状态查询</span>
		  </div>
		</a>
	  </div>
	</div>
	<div id="divNav_mobile" style="position:relative;z-index:99;">
		<div class="container">
			<div class="card-drop">
				<a align='center' class='toggle' href="#">
					<i class='fa fa-suitcase'></i> 
					  <span class='label-active'>维度先生的修理店</span>
				</a>
				<ul align='center'>
					<li class='active'>
						<a data-label="维度先生首页" href="index.asp"><i class='fa fa-suitcase'></i> 维度先生首页</a>
					</li>
					<li>
						<a data-label="在线报修" href="repair.asp"><i class='fa fa-magic'></i> 在线报修</a>
					</li>
					<li >
						<a data-label="维修状态查询" href="search.asp"><i class='fa fa-bolt'></i> 维修状态查询</a>
					</li>             
				</ul>
			</div>
		</div>
	</div>
	<!-- 导航 end-->	
	<!-- 信息填写 bg-->	
	<!--桌面版主体-->
	<div>
		<table class="deskWidth" bgcolor="#FFFFFF">		
			<%if ks=1 then %>
			<form id="divNav" width="100%" name="search" method="post" action="Search.asp">
				 <td colspan="4" style="line-height:220%">
					<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FCFCFC">
						<tr align="center" style="font-weight:bold">
					    <td><%=Description%></td>
					    </tr>
					</table>
				 </td>
			</form>
		 <tr>
		  <td colspan="4" style="line-height:220%">
			<table width="100%" align="center" > 
			 <form  name="add" align='center' method="post" action="submit.asp">			 
			  <tr align='center' bgcolor="#FFFFFF">
			   <%
			   Randomize
			   bh=year(now())&month(now())&day(now())&hour(now())&minute(now())&second(now())+int(999*rnd())%>
				  <td>报修编号：</br><input class="widthBX" name="xx1" type="text" id="xx1" onKeyDown="next()" value="W<%=bh%>" readonly> </td>
				</tr>				
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>客户姓名：</br><input class="widthBX" name="xx3" type="text" id="xx3" onKeyDown="next()"></td>
				</tr>				
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>联系电话：</br><input class="widthBX" name="xx4" type="text" id="xx4" onKeyDown="next()"></td>
				</tr>				
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>联系QQ：</br><input class="widthBX" name="xx5" type="text" id="xx5" onKeyDown="next()"></td>
				</tr>				
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>电脑品牌：</br>
<%
Set rsSclass = Server.CreateObject("ADODB.Recordset")
rsSclass.open "select * from Sclass",Conn,1,2
%>
				  <SELECT class="widthBX" name='xx2' id="xx2">
				  <%
				  do while not rsSclass.eof
				  %>
				  <option value="<%=rsSclass("title")%>"><%=rsSclass("title")%></option>
				  <%
					rsSclass.movenext
					loop
					set rsSclass=nothing
				  %>
				  </SELECT></td>
				</tr>
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>电脑具体型号：</br><input class="widthBX" name="xx6" type="text" id="xx6" onKeyDown="next()"></td>
				</tr>
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>维修问题描述：</br><textarea class="widthBX" name="xx7" rows="5" id="xx7" onKeyDown="next()"></textarea></td>
				</tr>
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>报修时间：</br><input class="widthBX" name="addtime" type="text" id="addtime" value="<%=now()%>" onKeyDown="next()" readonly></td>
				 </tr>
				<tr height="40px" align="center" bgcolor="#FFFFFF">
				  <td><input TYPE="hidden" name="action" value="yes"><input class="className" type="button" name="Submit" value=" 提 交 " onClick="check()"></td>
				</tr>
				<%
				else
				%>
				  <tr align="center" bgcolor="#FFFFFF">
					<td  height="120px" colspan="2"><b>报修系统已关闭！</b></td>
				  </tr>
				<%end if%>
				</form>
			  </table>
			
		  </td>
		 </tr>
		</table>
	</div>
	<!--桌面版主体END-->
	<!-- 信息填写 end-->	
	<table id="divBottom" cellSpacing=0 cellPadding=0 align=center width="80%">
	  <tr>
		<td height=40 align="center"> <%=Copyright%> </td>
	  </tr>
	</table>
	<!-- 手机自适应js bg-->	
	<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script>
	(function ($) {
		var cards = $('.card-drop'), toggler = cards.find('.toggle'), links = cards.find('ul>li>a'), li = links.parent('li'), count = links.length, width = 100;
		li.each(function (i) {
			$(this).css('z-index', count - i);
		});
		function setClosed() {
			li.each(function (index) {
				$(this).css('top', index * 4).css('width', width - index * 0.5 + '%').css('margin-left', index * 0.25 + '%');
			});
			li.addClass('closed');
			toggler.removeClass('active');
		}
		setClosed();
		toggler.on('mousedown', function () {
			var $this = $(this);
			if ($this.is('.active')) {
				setClosed();
			} else {
				$this.addClass('active');
				li.removeClass('closed');
				li.each(function (index) {
					$(this).css('top', 60 * (index + 1)).css('width', '100%').css('margin-left', '0px');
				});
			}
		});
		links.on('click', function (e) {
			var $this = $(this), label = $this.data('label');
			icon = $this.children('i').attr('class');
			li.removeClass('active');
			if ($this.parent('li').is('active')) {
				$this.parent('li').removeClass('active');
			} else {
				$this.parent('li').addClass('active');
			}
			toggler.children('span').text(label);
			toggler.children('i').removeClass().addClass(icon);
			setClosed();
			e.preventDefault;
		});
	}(jQuery));
	function check()
{
  if (document.add.xx3.value=="")
     {
      alert("请填写客户姓名！")
      document.add.xx3.focus()
      document.add.xx3.select()
      return
     }	 
  if (document.add.xx4.value=="")
     {
      alert("请填写联系电话！")
      document.add.xx4.focus()
      document.add.xx4.select()
      return
     }  
  if (document.add.xx5.value=="")
     {
      alert("请填写联系QQ！")
      document.add.xx5.focus()
      document.add.xx5.select()
      return
     }	 
  if (document.add.xx6.value=="")
     {
      alert("请填写电脑具体型号！")
      document.add.xx6.focus()
      document.add.xx6.select()
      return
     }	 
  if (document.add.xx6.value=="")
     {
      alert("请填写维修问题描述！")
      document.add.xx7.focus()
      document.add.xx7.select()
      return
     }
     document.add.submit()
}
	</script>
	<!-- 手机自适应js end-->	
</body>
</html>