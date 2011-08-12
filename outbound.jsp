<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONTokener"%>
<%@page import="java.util.Enumeration"%>
<%
System.out.println("####################################################################\n"
		+ new java.util.Date() +  "Outbound Call request from tama");
		
application.setAttribute("phone_no", request.getParameter("phone_no"));
String tamaData = request.getParameter("url");
tamaData = URLDecoder.decode(tamaData, "UTF8");
int idx = tamaData.indexOf("tamaData=");
tamaData  = tamaData.substring(idx + "tamaData=".length());
System.out.println("\n" + tamaData + "\n");

try {
JSONObject jsobject = new JSONObject(tamaData);
application.setAttribute( "regimen_id", jsobject.getString("regimen_id"));
application.setAttribute( "total_times_to_send", jsobject.getString("total_times_to_send"));
application.setAttribute( "times_sent", jsobject.getString("times_sent"));
application.setAttribute( "dosage_id", jsobject.getString("dosage_id"));
} catch(Exception e) {
	e.printStackTrace();
}
System.out.println("End of outbound request");
%>