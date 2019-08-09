<html>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>

<%
List<String> randomList = new ArrayList<>();
byte[] array = new byte[10];

for(int i = 0; i < 10000; i++) {
	new Random().nextBytes(array);
	randomList.add(new String(array, Charset.forName("UTF-8")));
}

Collections.sort(randomList);
%>

<body>
	<h2>Load simulation</h2>
	<%
	for (String value : randomList) {
		out.println(value);
	}
	%>
</body>

</html>
