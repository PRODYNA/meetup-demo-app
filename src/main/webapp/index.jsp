<html>
<%@ page import="java.util.Properties,java.util.Map"%>

<%
Map<String, String> env = System.getenv();
String bgColor = env.get("COLOR");

if(bgColor == null) {
	bgColor = "white";
}
%>

<body bgcolor="<%= bgColor %>">
	<h2>Hello Docker! --> Version 1.1.0</h2>

	<%
		out.println("OS Name: " + System.getProperty("os.name") + "<br>");
		out.println("OS Arch: " + System.getProperty("os.arch") + "<br>");
		out.println("OS Version: " + System.getProperty("os.version") + "<br>");
		out.println("Java Vendor: " + System.getProperty("java.vendor") + "<br>");
		out.println("Java Version: " + System.getProperty("java.version") + "<br>");
		out.println("Server Version: " + org.apache.catalina.util.ServerInfo.getServerNumber() + "<br>");
	%>

	<h3>Environment</h3>
	<%
	for (String envName : env.keySet()) {
		out.println(envName + "=" + env.get(envName) + "<br>");
	}
	%>

	<h3>System Properties</h3>
	<%
	Properties props = System.getProperties();
	for (Object propName : props.keySet()) {
		out.println(propName + "=" + props.get(propName) + "<br>");
	}
	%>


</body>

</html>
