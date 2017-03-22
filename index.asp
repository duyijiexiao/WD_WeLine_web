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
<body >
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
	<!-- 查询 bg-->	
	<table class="deskWidth" border="0" bgcolor="#dde4ea">
	 <form name="search" method="post" action="Search.asp">
		 <td colspan="4" style="line-height:220%">
			<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FCFCFC">
				<tr align="center" style="font-weight:bold">
					<td>请输入报修编号查询结果： 
					</br>
					  <input name="chaid" type="text" id="chaid"> 
					  </br>
					  <input class="className" name="Query" type="submit" id="Query" value="查 询">
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
		  <td width="5%">报修编号</td>
		  <td width="5%">客户姓名</td>
		  <td width="5%">联系电话</td>
		  <td width="5%">联系QQ</td>
		  <td width="5%">电脑品牌</td>
		  <td width="6%">电脑具体型号</td>
		  <td width="15%">故障描述</td>
		  <td width="10%">报修时间</td>
		  <td width="5%">报修状态</td>
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
			  <td><%=left(rs("xx7"),12)%><%if len(rs("xx7"))>11 then%>……<%end if%></td>
			  <td><%=rs("addtime")%></td>
			  <td>
			  <%if rs("xx8")="待审核" then
			  c="red"
			  elseif rs("xx8")="维修中" then 
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
	总共：  <font color="#ff0000"><%=rs.PageCount%></font>页, <font color="#ff0000"><%=proCount%></font>条报修信息, 当前页：<font color="#ff0000"><%=intCurPage%> </font></br>
	<%if intCurPage<>1 then%><a href="?">首页</a> | <a href="?ToPage=<%=intCurPage-1%>">上一页</a> | <% end if
	if intCurPage<>rs.PageCount then %><a href="?ToPage=<%=intCurPage+1%>">下一页</a> | <a href="?ToPage=<%=rs.PageCount%>"> 末页</a><% end if%></span></td>
		   </tr>
	<%
	else
	%>
	  <tr align="center" bgcolor="#FFFFFF">
		<td  height="120%" colspan="8"><b>对不起！目前数据库中还没有添加报修信息！</b></td>
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
		<td  height="120%" align="center"><b>报修系统已关闭！</b></td>
	  </tr>
	<%end if%>
	 </table>



		<!-- 查询 end-->
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