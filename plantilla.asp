        <div id="header">
            <table width="100%" cellspacing="0" cellpadding="0">
                  <tr><tr><tr>
				  <td width="1000" valign="center">
                     </td>
                 </tr>
            </table>
        </div>
        <div id="hnavigation"> 
            <script >
                document.write('<scr'+'ipt src="../script/menu.js">'+'</scr'+'ipt>');
              <%if Session("sesion_nombre")="admin" then%>
                document.write('<scr'+'ipt src="../imagen/Nuevo usuario.js">'+'</scr'+'ipt>');
              <%else%>
                document.write('<scr'+'ipt src="../imagen/limitado/Nuevo usuario.js">'+'</scr'+'ipt>');
              <%end if%>
            </script>
        </div>
        <div id="image"></div>
        <div id="image2"></div>
        <div id="image3"></div>
        <div id="content"> 
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                       <td valign="top" width="179"> 
                          <br><br>
                          <p align="center"> 
                          <script >
                              document.write('<scr'+'ipt src="../script/menu.js">'+'</scr'+'ipt>');
                              document.write('<scr'+'ipt src="../index_files/index_vnavbar.js">'+'</scr'+'ipt>');
                          </script>
                          </p>    
                       </td>