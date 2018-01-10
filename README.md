# jsp listener

���ڼ���webӦ�õ��ڲ��¼�

##   ������web�¼������ӿ�
     -  ServletContextListener   ����web�������͹ر�  ע��  ������webӦ�õ�����  ��ͬ�û��ķ���  ����һ���û��Ķ�η��� ������ø��¼�  ֻ�е�jsp ��һ�α������servletʱ �Żᱻ����
	 
	 -  ServletContextAttributeListener ���ڼ���servletContext��Χ ��application�����Եı仯
	 
	 -  ServletRequestListener    ���ڼ����û�����
	 
	 -  ServletRequestAttributeListener   ���ڼ���servletRequest ����Χ��  ���Եı仯
	 
	 -   HttpSessionListener    ���ڼ����û�session�Ŀ�ʼ�ͽ���
	 
	 -   HttpSessionAttributeListener  ���ڼ���session��Χ�����Եı仯
	 
	 -   ���������ļ�����

##   �÷�����

1   �½�һ���� ���� implements  ��Ӧ�ļ����ӿ�  ʵ����Ӧ�ķ���
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
			  System.out.println("���ݿ�ر�ʧ��"+e.getMessage());
		  }	
		}
	}

	public void contextInitialized(ServletContextEvent event)
	{
		// TODO Auto-generated method stub
		 System.out.println("Ӧ�ó�ʼ��");
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
			System.out.println("��ȡwebӦ�ò���ʧ��"+e.toString());
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
			System.out.println("���ݿ������쳣"+e.toString());
			return;
		}
		 System.out.println("��ʼ������");
		
	}

}



```



2  ����web.xml  ���һ�������ڵ�

```
	<listener>
		<listener-class>main.listeners.GetConnectionListener</listener-class>
	</listener>


```

