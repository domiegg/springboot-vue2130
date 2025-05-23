<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
	<head>

		<base href="${basePath}">
		<meta charset="UTF-8">
		<title>H5模版:</title>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
         <link type="text/css" rel="stylesheet" href="jsp/resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="jsp/resource/css/main.css" />
	<script type="text/javascript" src="jsp/resource/javascript/jquery.min.js"></script>
    <script type="text/javascript" src="jsp/resource/javascript/new_action.js"></script>
    <script type="text/javascript" src="jsp/resource/javascript/framework.js"></script>
    <script src="layer/layer.js"></script>
    <script src="layui/layui.js" charset="utf-8"></script>
    </head>
	<body>
				<form class="ui form fluid vertical segment" action="/user/new_action" id="addForm" name="form" method="post">
	          <div class="twelve wide column"style="margin-left:200px ;">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large add icon"></i>
  							<div class="content">
    							添加信息
  							</div>
						</h3>
					</div>
				</div>
                    <div class="two fields">
                    	<div class="field">
                            <label>姓名</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="text" id="bussinessName" name="bussinessName">
                            </div>
                        </div>
                    </div>
                    
                     <div class="two fields">
                        <div class="field">
                            <label>地址</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="text" id="bussinessAddress" name="bussinessAddress">
                            </div>
                        </div>
                    </div>
                       <div class="two fields">
                        <div class="field">
                            <label>联系电话</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="text" id="bussinessPhone" name="bussinessPhone">
                            </div>
                        </div>
                    </div>
               
                    
                    <button class="ui small blue button" id="save" type="button">保存</button>
                </form>
			</div>
		
	</body>
       <script type="text/javascript">
    $(function(){
        $("#save").on("click",function(){
        layer.msg('拼命上传中,请稍后....', {
              icon: 16
              ,shade: 0.45
            });
        setTimeout(function(){
             var formData = new FormData($("#addForm")[0]);
             $.ajax({
                 url: 'bussiness/addBussiness',
                 type: 'POST',
                 data: formData,
                 async:false,
                 cache: false,
                 contentType: false,
                 enctype: 'multipart/form-data',
                 processData: false,
                 success: function (data) {
                       layer.msg('数据上传成功！');
                       parent.layer.closeAll();
                 }
             });
          layer.closeAll('loading');
        }, 2000);
         
        window.location.href="bussiness/toBussinessList";
       });
        
        
        
    });
    
    
    
    </script>
</html>