<%--
  Created by IntelliJ IDEA.
  User: fitz
  Date: 2019/2/25
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>ECharts</title>

  <!-- 引入 echarts.js -->
  <script type="text/javascript" src="js/echarts.min.js"></script>
  <script type="text/javascript" src="js/jquery/jquery-2.2.4.min.js"></script>

  <script type="text/javascript">
      function a() {
          console.log("a");
          document.getElementById("main").style.display="";
          // 基于准备好的Dom, 初始化echart实例
          var myChart = echarts.init(document.getElementById('main'));
          // 显示标题，图例和空的坐标轴
          myChart.setOption({
              title: {
                  text: '往年录取分数线'
              },
              tooltip: {},
              legend: {
                  data:['投档线']
              },
              xAxis: {
                  data: []
              },
              yAxis: {
                  scale: true
              },
              series: [{
                  name: '投档线',
                  type: 'line',
                  data: []
              }]
          });

          myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画

          var years=[];    //年份数组（实际用来盛放X轴坐标值）
          var scores=[];    //分数数组（实际用来盛放Y坐标值）

          $.ajax({
              type : "post",
              async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
              url : "showdata",    //请求发送到TestServlet处
              data : {},
              dataType : "json",        //返回数据形式为json
              success : function(result) {
                  //请求成功时执行该函数内容，result即为服务器返回的json对象
                  if (result) {
                      for(var i=0;i<result.length;i++){
                          years.push(result[i].year);    //挨个取出year别并填入年份数组
                      }
                      for(var i=0;i<result.length;i++){
                          scores.push(result[i].lScore);    //挨个取出lScore并填入score数组
                      }
                      myChart.hideLoading();    //隐藏加载动画
                      myChart.setOption({        //加载数据图表
                          xAxis: {
                              data: years
                          },
                          series: [{
                              // 根据名字对应到相应的系列
                              name: '投档线',
                              data: scores
                          }]
                      });

                  }

              },
              error : function(errorMsg) {
                  //请求失败时执行该函数
                  alert("图表请求数据失败!");
                  myChart.hideLoading();
              }
          })
      }

  </script>

</head>

<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 600px;height:400px; display: none"></div>
<div>
  <input type="button" value="show" onclick="a()">
</div>
</body>
</html>