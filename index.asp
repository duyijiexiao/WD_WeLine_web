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
			width:100%;
			font-size:10px;
			align:center;
			margin-top:15px;
			word-wrap: break-word;
			word-break: break-all;
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
		body{
		    height: 100%;
			opacity: 0.9;
			-moz-opacity: 0.9;
			filter: alpha(opacity=90);
			background: url(../images/4.jpg) no-repeat;
			/* background-size: cover; */
			margin: auto;
			font-size: 14px;
			background-repeat: repeat-x;
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
<body >
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
	<table class="deskWidth" border="0" bgcolor="#dde4ea">
	 <form name="search" method="post" action="Search.asp">
		 <td colspan="4" style="line-height:220%">
			<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FCFCFC">
				<tr align="center" style="font-weight:bold">
					<td>�����뱨�ޱ�Ų�ѯ����� 
					</br>
					  <input name="chaid" type="text" id="chaid"> 
					  </br>
					  <input class="className" name="Query" type="submit" id="Query" value="�� ѯ">
					</td>
				</tr>
			</table>
		 </td>
	 </form>
	<%if ks=1 then %>
	 <tr>
	  <td colspan="4" style="line-height:190%">
		<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#dde4ea">
		  <tr align="center"  style="font-weight:bold">
		  <td width="5%">���ޱ��</td>
		  <td width="5%">�ͻ�����</td>
		  <td width="5%">��ϵ�绰</td>
		  <td width="5%">��ϵQQ</td>
		  <td width="5%">����Ʒ��</td>
		  <td width="6%">���Ծ����ͺ�</td>
		  <td width="15%">��������</td>
		  <td width="10%">����ʱ��</td>
		  <td width="5%">����״̬</td>
		  </tr>
	<%
	page=clng(request("page"))	
	sql="select * from Info order by id desc"
	 set rs=server.createobject("adodb.recordset") 
	 rs.open sql,conn,1,1
	 if not rs.eof then
	 proCount=rs.recordcount
		rs.PageSize=15
		 if not IsEmpty(Request("ToPage")) then
			ToPage=CInt(Request("ToPage"))
			if ToPage>rs.PageCount then
			   rs.AbsolutePage=rs.PageCount
			   intCurPage=rs.PageCount
			elseif ToPage<=0 then
			   rs.AbsolutePage=1
			   intCurPage=1
			else
			   rs.AbsolutePage=ToPage
			   intCurPage=ToPage
			end if
		 else
			rs.AbsolutePage=1
			intCurPage=1
		 end if
		 intCurPage=CInt(intCurPage)
		 For i = 1 to rs.PageSize
		 if rs.eof then     
		 Exit For 
		 end if
	%>
		  <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"' onmouseout='this.style.background="#FFFFFF"'>
			  <td><%=rs("xx1")%></td>
			  <td><%=left(rs("xx3"),2)%>*</td>
			  <td><%=left(rs("xx4"),3)%>********</td>
			  <td><%=left(rs("xx5"),4)%>*****</td>
			  <td><%=rs("xx2")%></td>
			  <td><%=rs("xx6")%></td>
			  <td><%=left(rs("xx7"),12)%><%if len(rs("xx7"))>11 then%>����<%end if%></td>
			  <td><%=rs("addtime")%></td>
			  <td>
			  <%if rs("xx8")="�����" then
			  c="red"
			  elseif rs("xx8")="ά����" then 
			  c="blue"
			  else c="green"
			  end if%><font color="<%=c%>"><%=rs("xx8")%></font></td>
		   </tr>
	<%
	rs.movenext 
	next
	%>
			<tr align="center">
			  <td colspan="9" id="link">
	�ܹ���  <font color="#ff0000"><%=rs.PageCount%></font>ҳ, <font color="#ff0000"><%=proCount%></font>��������Ϣ, ��ǰҳ��<font color="#ff0000"><%=intCurPage%> </font></br>
	<%if intCurPage<>1 then%><a href="?">��ҳ</a> | <a href="?ToPage=<%=intCurPage-1%>">��һҳ</a> | <% end if
	if intCurPage<>rs.PageCount then %><a href="?ToPage=<%=intCurPage+1%>">��һҳ</a> | <a href="?ToPage=<%=rs.PageCount%>"> ĩҳ</a><% end if%></span></td>
		   </tr>
	<%
	else
	%>
	  <tr align="center" bgcolor="#FFFFFF">
		<td  height="120%" colspan="8"><b>�Բ���Ŀǰ���ݿ��л�û����ӱ�����Ϣ��</b></td>
	  </tr>
	<%
	rs.close
	set rs=nothing
	end if
	%>
		</table>
	  </td>
	 </tr>
	 <%
	else
	%>
	  <tr align="center">
		<td  height="120%" align="center"><b>����ϵͳ�ѹرգ�</b></td>
	  </tr>
	<%end if%>
	 </table>



		<!-- ��ѯ end-->
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