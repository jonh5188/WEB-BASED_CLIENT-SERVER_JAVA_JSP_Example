<%@ page import="code.*,java.io.*;"%>

<html>
  <head>
    <title>CS431 - Programming Assignment 3</title>
  </head>
  <body>
    <style type="text/css">
		form {
			text-align: center;
		}
		img {
			display: block;
			margin-left: auto;
			margin-right: auto;
		}
		body {
			margin:50px 0px; padding:0px;
			text-align:center;
			background-color: #FFFFFF;
			min-width: 950px;
		}
		html {
			background-color: #007550;
		}		
		input {
			color: #007550;
			border-radius:40px;
		}
		td {
			text-align: center; 
			vertical-align: middle; 
		}
		h1 {
			color: #007550;
		}
		table {
			background-color: #6A6A6A;
		}
    </style>
	<img src="Logo.png" alt="UAB Logo">
	<h1>File Service</h1>

	<FORM METHOD="POST" ACTION="">
          <TABLE BORDER="1" align="center">
	    <TR>
	      <TD>CD</TD>
	      
              <TD><INPUT TYPE="TEXT"  NAME="dir" SIZE="25" style="width:500px"></TD>
	      <TD><P><INPUT TYPE="SUBMIT" VALUE="Change" NAME="changeDir"></P></TD>
	   </TR>
	   <TR>
	    <TD>Upload</TD>
	    
<TD><INPUT TYPE="FILE" NAME="file" SIZE="25" style="width:500px"></TD>
	    <TD><P><INPUT TYPE="SUBMIT" VALUE="Submit" NAME="B1"></P></TD>
	   </TR>
	</TABLE>

         <% 
            String f = application.getRealPath("/");
            File file = new File(f);
            String [] fileNames = file.list();
            File [] files= file.listFiles();

            if (request.getParameter("dir") != "" && request.getParameter("changeDir") != null) {
              file  = new File(request.getParameter("dir"));
            }
            if (file.isDirectory()) {
         %>
              <P> <% out.println("Current Directory: " + file + ""); %> <INPUT TYPE="SUBMIT" VALUE="List" NAME="ls"></P>
         <% 
            }
              else { out.println("Directory " + request.getParameter("dir") + " does not exist");
  
                }
        %>

        <%  if (request.getParameter("ls") != null) { %>
        </FORM>
       <FORM METHOD="POST" ACTION="">
         <TABLE BORDER="1" align="center">
           <TR>
             <TH>File</TH>
             <TH>Size</TH>
             <TH></TH>
           </TR>
        <%
            for (int i = 0; i < files.length; i++) {
                if(!files[i].isDirectory()){
        %>
         <TR>
             <TD style="width:275px"><%= fileNames[i] %></TD>
             <TD style="width:275px"><%= Long.toString(files[i].length()) %> bytes</TD>
             <TD><INPUT TYPE="checkbox" name="" value="Download"></TD>
           </TR>
    
        <%
                }
            }
       %>
      <TR>
     <TD></TD>
             <TD></TD>
             <TD><P><INPUT TYPE="SUBMIT" VALUE="Download" NAME="B1"></P></TD>
           </TR>
     </TABLE>
       </FORM>
       <br>
<%
          }
        %>
     
  </body>
</html>	

