        <div id="header">
            <table width="100%" cellspacing="0" cellpadding="0">
                  <tr><tr><tr>
				  <td width="1000" valign="center">
                          <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" WIDTH="1300" HEIGHT="200" id="sample" ALIGN="center">
                                  <PARAM NAME=movie VALUE="introduccion.swf">
                                  <PARAM NAME=quality VALUE=High>

                                  <PARAM NAME=bgcolor VALUE="#164796">
                                  <param name="wmode" value="transparent">
                                  <EMBED src="introduccion.swf" quality=High bgcolor=#164796  WIDTH="1300" HEIGHT="200" NAME="sample" ALIGN="center" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer" wmode="transparent">
                                  </EMBED>
                          </OBJECT>
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