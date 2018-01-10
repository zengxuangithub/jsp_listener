<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
  <head>
    
    
    <title>filter 配置</title>
	
  </head>
  
  <body>
          ServletContextListener <br>
    
    <% System.out.println("可以从web上下文获取connection");
    
    %>
    
    </br>
      </br>
        </br>
        
    <% 
    Connection connection=(Connection)application.getAttribute("connect");
    if(connection==null)
    {
    System.out.println("connect为空");
    return;
    }
    Statement statement=connection.createStatement();
    ResultSet resultSet=  statement.executeQuery("select title from goods");
    %>
    <table>
    <%
    while(resultSet.next())
    {
    %>	
    <tr>
    <td>
    <%
    out.println(resultSet.getString(1));
     %>
    
    </td>
    </tr>
     
   <% 
    }
     %>
   </table>
    
  </body>
</html>
