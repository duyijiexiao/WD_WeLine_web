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
	<!-- ��ѯ bg-->	
	<table class="deskWidth">
	 <form name="search" method="post" action="Search.asp">
		 <td colspan="4" style="line-height:220%">
			<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FCFCFC">
				<tr align="center" style="font-weight:bold">
					<td>�����뱨�ޱ�Ų�ѯ����� 
					</br>
					  <input name="chaid" type="text" id="chaid">
					</br>
						(΢���û����޷�������ѯ���������Ͻǡ���������д򿪡�)
					</br>
					  <input class="className" name="Query" type="submit" id="Query" value="�� ѯ">
					</td>
				</tr>
			</table>
		 </td>
	 </form>
	 </table>
	<!-- ��ѯ end-->	
	
<table class="deskWidth" border="0" bgcolor="#dde4ea">
<%if ks=1 then %>
<%
chaid=Server.HTMLEncode(request("chaid"))
if chaid<>"" then
sql="select * from Info where xx1='"&chaid&"'"
set rs=server.createobject("adodb.recordset") 
rs.open sql,conn,1,1
if not rs.eof Then
%>
	<tr>
	  <td width="50%" align="right">���ޱ�ţ�</td>
	  <td height="25px"><%=rs("xx1")%></td>
	</tr>
	<tr bgcolor='#FFFFFF'>
	  <td align='right'> �ͻ�������</td>
	  <td height="25px"><%=left(rs("xx3"),1)%>**</td>
	</tr>
	<tr bgcolor='#FFFFFF'>
	  <td align='right'> ��ϵ�绰��</td>
	  <td height="25px"><%=left(rs("xx4"),3)%>********</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align='right'> ��ϵQQ��</td>
	  <td height="25px"><%=left(rs("xx5"),4)%>*****</td>
	</tr>	
	<tr bgcolor="#FFFFFF">
	  <td align='right'> ����Ʒ�ƣ�</td>
	  <td height="25px"><%=rs("xx2")%></td>
	</tr>	
	<tr bgcolor="#FFFFFF">
	  <td align='right'> ���Ծ����ͺţ�</td>
	  <td height="25px">
			<%=rs("xx6")%>
	  </td>
	</tr>	
	<tr bgcolor='#FFFFFF'>
	  <td align='right' >����������</td>
	  <td height="25px"><%=rs("xx7")%></td>
	</tr>
	<tr bgcolor='#FFFFFF'>
	  <td align='right' bgcolor="#FFFFFF">����ʱ�䣺</td>
	  <td height="25px"><%=rs("addtime")%></td>
	</tr>  
	<tr>
	  <td align='right'>����״̬��</td>
	  <td height="25px">
			<%if rs("xx8")="�����" then
			c="red"
			elseif rs("xx8")="ά����" then 
			c="blue"
			else c="green"
			end if%><font color="<%=c%>"><%=rs("xx8")%></font>
	  </td>
	</tr> 
<%
else
%>
  <tr align="center" bgcolor="#FFFFFF">
    <td height="50px" colspan="2">��Ǹ��û������ <font color="#FF0000"><%=chaid%></font> ��Ϣ��</td>
  </tr>
<%
end if
rs.close
set rs=nothing
end if
%>
<%else%>
  <tr>
    <td align="center" height="120px"><b>����ϵͳ�ѹرգ�</b></td>
  </tr>
<%end if%>
</table>
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
	</script>
	<!-- �ֻ�����Ӧjs end-->	
</body>
</html>