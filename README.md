# jsp listener

用于监听web应用的内部事件

##   常见的web事件监听接口
-  ServletContextListener   监听web的启动和关闭  
   注意  这里是web应用的启动  不同用户的访问  或者一个用户的多次访问 不会调用该事件  只有当jsp 第一次被编译成servlet时 才会被调用
	 
-  ServletContextAttributeListener 用于监听servletContext范围 （application）属性的变化
	 
-  ServletRequestListener    用于监听用户请求
	 
-  ServletRequestAttributeListener   用于监听servletRequest 请求范围内  属性的变化
	 
-   HttpSessionListener    用于监听用户session的开始和结束
	 
-   HttpSessionAttributeListener  用于监听session范围内属性的变化
	 
-   还有其他的监听器

##   用法步骤

1   新建一个类 并且 implements  相应的监听接口  实现相应的方法
```
public class GetConnectionListener  implements ServletContextListener
{

	public void contextDestroyed(ServletContextEvent arg0) 
	{
		// TODO Auto-generated method stub
		ServletContext applicationContext=arg0.getServletContext();
	    Connection connection=(Connection)	applicationContext.getAttribute("connect");
		if (connection!=null) 
		{
		  try 
		  {
			connection.close();
		  } catch (SQLException e)
		  {
			// TODO: handle exception
			  System.out.println("数据库关闭失败"+e.getMessage());
		  }	
		}
	}

	public void contextInitialized(ServletContextEvent event)
	{
		// TODO Auto-generated method stub
		 System.out.println("应用初始化");
		String driver,url,user,pass;
		ServletContext application;
		try
		{
			 application=event.getServletContext();
			
			 driver=application.getInitParameter("driver");
			 url=application.getInitParameter("url");
			 user=application.getInitParameter("user");
			 pass=application.getInitParameter("pass");
			 System.out.println("driver"+driver);
			 System.out.println("url"+url);
				
			 System.out.println("user"+user);
				
			 System.out.println("pass"+pass);
				
			
		} catch (Exception e)
		{
			// TODO: handle exception
			System.out.println("获取web应用参数失败"+e.toString());
			return;
		}
		try 
		{
			Class.forName(driver);
			Connection connection=DriverManager.getConnection(url, user, pass);
			application.setAttribute("connect", connection);
		} catch (Exception e)
		{
			// TODO: handle exception
			System.out.println("数据库链接异常"+e.toString());
			return;
		}
		 System.out.println("初始化结束");
		
	}

}



```



2  配置web.xml  添加一个监听节点

```
	<listener>
		<listener-class>main.listeners.GetConnectionListener</listener-class>
	</listener>


```

