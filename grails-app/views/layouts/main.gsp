<html>
<head>
	<meta http-equiv="Content-Type" content="ISO-8859-1" />
		<title><g:layoutTitle /></title>
		<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'layout.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'qalific.css')}" />
<%--		<gui:resources components="accordion"/>--%>
		<g:layoutHead />
	</head>
<body class="yui-skin-sam" id = "superBody">
<div style="height: 0px;"></div>
<table align="center" cellspacing="0" cellpadding="0" width="1005"
	bgcolor="#FFFFFF" id="tablaprincipal" class="tabla_p";>
	<tr>
		<td colspan="2" class="barraMenu">		
		<label class="controller"> <%--para obtener propiedades de la classe controller --%>
			 <br>
			<g:link controller="Qalific_solicitudCuenta">Login</g:link>
			<p style="white-space: pre";><%--con esta etiqueta el texto siguiente toma los caracteres tal cual con espacios incluidos--%>
			<g:link controller="somos">¿Quienes somos?</g:link>  <g:link controller="Qalifica_busqueda">¿Buscas servicios?</g:link>   <g:link controller="index.gsp">Inicio</g:link>  </p>
		</label>				
		</td>
	</tr>
	<tr >
	
<%--		 **************** PARA QUITAR MENU cerrar comentario --> 
		<td width="20px" valign="top" class="menu_principal">
			<div style="color:#DF7401; text-align: center; background-color: #DF7401;" >
				<sec:ifLoggedIn>	        		
	        		<gui:accordion  slow="true" multiple="true">
	        			<sec:ifAnyGranted roles="ROLE_ADMIN">
						    <gui:accordionElement title="Administraci&oacute;n">
						    <div style="text-align: left;">
						    	<ul type="square">
						        <li class="controller"><g:link controller="solicitudCuenta">Solicitud de cuenta y verificaci&oacute;n de Identidad</g:link></li>
						        <hr>
								<li class="controller"><g:link controller="directorio">Directorio Inapesca</g:link></li>
								<hr>
								<li class="controller"><g:link controller="institucionDeFinanciamiento">Instituci&oacute;n de Financiamiento</g:link></li>
								<hr>
								<li class="controller"><g:link controller="catMetodologia">Metodolog&iacute;as</g:link></li>
								<hr>
								<li class="controller"><g:link controller="criterio">Criterios</g:link></li>
								<hr>
								<li class="controller"><g:link controller="catInstructores">Instructores</g:link></li>
								<hr>
								<li class="controller"><g:link controller="ubicacionCurso">Ubicaci&oacute;n de Cursos</g:link></li>
								<hr>
								<li class="controller"><g:link controller="catModalidadCurso">Modalidad de Cursos</g:link></li>
								<hr>
								<li class="controller"><g:link controller="catEstandaresCompetenciaLaboral">Est&aacute;ndares de Competencia Laboral</g:link></li>
								<hr>
								<li class="controller"><g:link controller="catTipoPago">Pago de Instructores</g:link></li>
								<hr>
								<li class="controller"><g:link controller="catTiposCurso">Tipos de Curso</g:link></li>
								<hr>
								<li class="controller"><g:link controller="catTipoReporte">Tipos de Reporte</g:link></li>
								</ul>
							</div>
					    	</gui:accordionElement>
					    </sec:ifAnyGranted>
					    <gui:accordionElement title="Demanda de Cursos">
						    <div style="text-align: left;">
						    <ul type="square">
						    	<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_CAPACITACION">
						        	<li class="controller"><g:link controller="cursos">Demanda de Curso de Capacitaci&oacute;n</g:link></li>
						        </sec:ifAnyGranted>
						        <hr>
						        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_FILTRADO">
									<li class="controller"><g:link controller="calificacion" action = "index">Priorizar Demanda de Cursos de Capacitaci&oacute;n</g:link></li>
								</sec:ifAnyGranted>
							</ul>
							</div>
					    </gui:accordionElement>
					    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_CAPACITACION">
						    <gui:accordionElement title="Costeo de Evento">
							    <div style="text-align: left; ">
							    <ul type="square">
							        <li class="controller"><g:link controller="costeoEvento" action = "index">Aportaciones de Curso</g:link></li>
							        </ul>
							    </div>
						    </gui:accordionElement>
						    <gui:accordionElement title="Difusi&oacute;n">
							    <div style="text-align: left;">
							    <ul type="square">
							        <li class="controller"><g:link controller="difusionCurso">Difusiones de Cursos</g:link></li>
							        </ul>
							    </div>
					    	</gui:accordionElement>
					    </sec:ifAnyGranted>
					    <gui:accordionElement title="Reportes">
						    <div style="text-align: left;">
						    <ul type="square">
						        <li class="controller"><g:link controller="reportes">Generar reportes</g:link></li>
						    </ul>
						    </div>
					    </gui:accordionElement>
					</gui:accordion>
            	</sec:ifLoggedIn>
    		</div>
		</td>	
<%--		--%>
		<td width="825px">
			<div class = "panel-body" align="center" >
				<g:layoutBody />
			</div>
		</td>
	</tr>
	<tr id="footer">
		<td height="2" colspan="1" align="center" class="pie_pagina">
		<label class="controller"> <%--para obtener propiedades de la classe controller --%>
		<br>
		<g:link controller="contacto">Contactanos</g:link>
		/
		<g:link controller="privacidad">Privacidad</g:link>
		</label>
		</td>
	</tr>
</table>
</body>
</html>