<!--#include file="inc/config.asp"-->
<!--#include file="inc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=SiteName%></title>
<!-- ����Ӧ���� bg-->
<meta http-equiv="Cache-Control" content="no-transform" /> 
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=yes" />
<!-- ����Ӧ���� end-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="description" content="ά�������������" />
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
		 /* ��ҳȫ����ʾ */
		body {width:100%;} 
		/* ����ȫ����ʾ */
		#divMain{width:100%} 
		/* Ϊ�˱�������ͼƬ������Ļ��� */
		/* ����ͼƬ����������Ļ��ȵ�90% */
		#divMain img{max-width:90%} 
		/* ����ͷ����������ҳ�� */
		#divHead{display:none}
		#divNav{display:none}
		#divBottom{display:none}
		/* ��ʾ�ֻ��浼��*/
		#divNav_mobile{display:block}
		

}
</style>
</head>
<body>
	<!-- ͷ�� bg-->
	<div id="divHead">
	<table width="70%" cellSpacing=0 cellPadding=0 align=center>
	  <tr>
		<td colSpan=5 id="banner"><%=SiteName%></td>
	  </tr>
	</table>
	</div>
	<!-- ͷ�� end-->	
	<!-- ���� bg-->
	<div class='card-holder' id="divNav">
	  <div class='card-wrapper'>
		<a href="index.asp">
		  <div class='card bg-01'>
			<span class='card-content'>ά��������ҳ</span>
		  </div>
		</a>
	  </div>
	  <div class='card-wrapper'>
		<a href="repair.asp">
		  <div class='card bg-02'>
			<span class='card-content'>���߱���</span>
		  </div>
		</a>
	  </div>
	  <div class='card-wrapper'>
		<a href='search.asp'>
		  <div class='card bg-03'>
			<span class='card-content'>ά��״̬��ѯ</span>
		  </div>
		</a>
	  </div>
	</div>
	<div id="divNav_mobile" style="position:relative;z-index:99;">
		<div class="container">
			<div class="card-drop">
				<a align='center' class='toggle' href="#">
					<i class='fa fa-suitcase'></i> 
					  <span class='label-active'>ά�������������</span>
				</a>
				<ul align='center'>
					<li class='active'>
						<a data-label="ά��������ҳ" href="index.asp"><i class='fa fa-suitcase'></i> ά��������ҳ</a>
					</li>
					<li>
						<a data-label="���߱���" href="repair.asp"><i class='fa fa-magic'></i> ���߱���</a>
					</li>
					<li >
						<a data-label="ά��״̬��ѯ" href="search.asp"><i class='fa fa-bolt'></i> ά��״̬��ѯ</a>
					</li>             
				</ul>
			</div>
		</div>
	</div>
	<!-- ���� end-->	
	<!-- ��Ϣ��д bg-->	
	<!--���������-->
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
				  <td>���ޱ�ţ�</br><input class="widthBX" name="xx1" type="text" id="xx1" onKeyDown="next()" value="W<%=bh%>" readonly> </td>
				</tr>				
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>�ͻ�������</br><input class="widthBX" name="xx3" type="text" id="xx3" onKeyDown="next()"></td>
				</tr>				
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>��ϵ�绰��</br><input class="widthBX" name="xx4" type="text" id="xx4" onKeyDown="next()"></td>
				</tr>				
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>��ϵQQ��</br><input class="widthBX" name="xx5" type="text" id="xx5" onKeyDown="next()"></td>
				</tr>				
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>����Ʒ�ƣ�</br>
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
				  <td>���Ծ����ͺţ�</br><input class="widthBX" name="xx6" type="text" id="xx6" onKeyDown="next()"></td>
				</tr>
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>ά������������</br><textarea class="widthBX" name="xx7" rows="5" id="xx7" onKeyDown="next()"></textarea></td>
				</tr>
				<tr align='center' bgcolor='#FFFFFF'>
				  <td>����ʱ�䣺</br><input class="widthBX" name="addtime" type="text" id="addtime" value="<%=now()%>" onKeyDown="next()" readonly></td>
				 </tr>
				<tr height="40px" align="center" bgcolor="#FFFFFF">
				  <td><input TYPE="hidden" name="action" value="yes"><input class="className" type="button" name="Submit" value=" �� �� " onClick="check()"></td>
				</tr>
				<%
				else
				%>
				  <tr align="center" bgcolor="#FFFFFF">
					<td  height="120px" colspan="2"><b>����ϵͳ�ѹرգ�</b></td>
				  </tr>
				<%end if%>
				</form>
			  </table>
			
		  </td>
		 </tr>
		</table>
	</div>
	<!--���������END-->
	<!-- ��Ϣ��д end-->	
	<table id="divBottom" cellSpacing=0 cellPadding=0 align=center width="80%">
	  <tr>
		<td height=40 align="center"> <%=Copyright%> </td>
	  </tr>
	</table>
	<!-- �ֻ�����Ӧjs bg-->	
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
      alert("����д�ͻ�������")
      document.add.xx3.focus()
      document.add.xx3.select()
      return
     }	 
  if (document.add.xx4.value=="")
     {
      alert("����д��ϵ�绰��")
      document.add.xx4.focus()
      document.add.xx4.select()
      return
     }  
  if (document.add.xx5.value=="")
     {
      alert("����д��ϵQQ��")
      document.add.xx5.focus()
      document.add.xx5.select()
      return
     }	 
  if (document.add.xx6.value=="")
     {
      alert("����д���Ծ����ͺţ�")
      document.add.xx6.focus()
      document.add.xx6.select()
      return
     }	 
  if (document.add.xx6.value=="")
     {
      alert("����дά������������")
      document.add.xx7.focus()
      document.add.xx7.select()
      return
     }
     document.add.submit()
}
	</script>
	<!-- �ֻ�����Ӧjs end-->	
</body>
</html>