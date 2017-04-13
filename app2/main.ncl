<!--
# ==================================================================== #
#	LICENCIA (GPLv2)
#
#	Copyrigth (C) 2017 Franco Alejandro Trinidad (0xalen)
#
#	This program is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 2 of the License, or
#	(at your option) any later version.
#	
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# ==================================================================== #
-->
<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="main2" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
<head>
	<regionBase>  
		<region id="rgBase" width="100%" height="100%" zIndex="0">	
			<region id="rgEnter" left="5px" bottom="5px" width="4%" height="6%" zIndex="2"/>
			<region id="rgExit" left="5px" bottom="5px" width="4%" height="6%" zIndex="4"/>
			<region id="rgOverlayImg" left="20px"  bottom="10px" width="35%" height="25%" zIndex="1"/>
			<region id="rgOverlayTxt" right="20px"  bottom="10px" width="55%" height="25%" zIndex="1"/>
			<region id="rgOption" left="20px" rigth="50px" top="10px" width="30%" height="30%" zIndex="1"/>
		</region>	
	</regionBase>
	<transitionBase>
		<transition id="tBase" type="fade" dur="1s"/>		
		<transition id="tAction" type="fade" dur="2s"/>
		<transition id="tOverlay" type="fade" dur="1s"/>
		<transition id="tOption" type="fade" dur="1s"/>
	</transitionBase>			
	<descriptorBase>
		<descriptor id="dBase" region="rgBase" transIn="tBase"/>
		<descriptor id="dEnter" region="rgEnter" transIn="tAction" transOut="tAction" explicitDur="5s"/>		
		<descriptor id="dExit" region="rgExit" transIn="tAction" transOut="tAction">
				<descriptorParam name="transparency" value="0.4"/>
		</descriptor>		
		<descriptor id="dOverlayImg" region="rgOverlayImg" transIn="tOverlay" transOut="tOverlay">
			<descriptorParam name="transparency" value="0.4"/>
		</descriptor>					
		<descriptor id="dOverlayTxt" region="rgOverlayTxt" transIn="tOverlay" transOut="tOverlay">
			<descriptorParam name="transparency" value="0.4"/>
		</descriptor>					
		<descriptor id="dOption" region="rgOption" transIn="tOption" transOut="tOption">
			<descriptorParam name="transparency" value="0.4"/>
		</descriptor>										
	</descriptorBase>	
	<connectorBase>
		<importBase documentURI="conectores.ncl" alias="c"/>
	</connectorBase>
</head>

<body>		
	<media id="settings" type="application/x-ginga-settings">
		<property name="channel.keyCapture" value="interactive_keys"/>
	</media>
		
	<media id="mBase" type="image/jpeg" src="media/image/BaseImage.jpg" descriptor="dBase"/>
	<media id="mEnter" type="image/png" src="media/image/Enter.png" descriptor="dEnter"/>
	<media id="mExit" type="image/png" src="media/image/Exit.png" descriptor="dExit"/>
	<media id="mOverlayImg1" type="image/jpeg" src="media/image/Overlay1.jpg" descriptor="dOverlayImg"/>	
	<media id="mOverlayImg2" type="image/jpeg" src="media/image/Overlay2.jpg" descriptor="dOverlayImg"/>	
	<media id="mOverlayImg3" type="image/jpeg" src="media/image/Overlay3.jpg" descriptor="dOverlayImg"/>		
	<media id="mOverlayTxt1" src="media/files/Overlay1.txt" descriptor="dOverlayTxt">
		<property name="fontSize" value="18"/>
		<property name="fontColor" value="black"/>
		<property name="background" value="white"/>
	</media>
	<media id="mOverlayTxt2" src="media/files/Overlay2.txt" descriptor="dOverlayTxt">
		<property name="fontSize" value="18"/>
		<property name="fontColor" value="black"/>
		<property name="background" value="white"/>
	</media>
	<media id="mOverlayTxt3" src="media/files/Overlay3.txt" descriptor="dOverlayTxt">
		<property name="fontSize" value="18"/>
		<property name="fontColor" value="black"/>
		<property name="background" value="white"/>
	</media>
	<media id="mOption1" type="image/png" src="media/image/Option1.png" descriptor="dOption"/>	
	<media id="mOption2" type="image/png" src="media/image/Option2.png" descriptor="dOption"/>	
	<media id="mOption3" type="image/png" src="media/image/Option3.png" descriptor="dOption"/>	
	
	<port id="pBase" component="mBase"/>
	<!-- APARECE EL BOTÓN -->
	<link id="OnBeginStart" xconnector="c#onBeginStart">
		<bind role="onBegin" component="mBase"/>
		<bind role="start" component="mEnter"/>		
	</link>
	
	<!-- DESAPARECE Y VUELVE A APARECER -->
	<link id="OnEndStart" xconnector="c#onEndStart">
		<bind role="onEnd" component="mEnter"/>
		<bind role="start" component="mEnter"/>
	</link>
	
	<!-- 1) SELECCIÓN DEL BOTÓN ROJO (DEFAULT AZUL)-->
	<link id="OnSelectionRedIn" xconnector="c#onSelectionPauseStart">
		<bind role="onSelection" component="mEnter"> 
			<bindParam name="keyCode" value="RED"/> 
		</bind>
		<bind role="pause" component="mEnter"/>
		<bind role="start" component="mExit"/>
		<bind role="start" component="mOption1"/>
		<bind role="start" component="mOverlayImg1"/>		
		<bind role="start" component="mOverlayTxt1"/>
	</link>
	
	<!-- OPCIONES PARA EL BOTÓN AMARILLO -->
		<!-- 2) AZUL/AMARILLO -->
	<link id="OnSelectionYellowStopBlue" xconnector="c#onSelectionStopStart">
		<bind role="onSelection" component="mOption1"> 
			<bindParam name="keyCode" value="YELLOW"/> 
		</bind>
		<bind role="stop" component="mOption1"/>
		<bind role="stop" component="mOverlayImg1"/>
		<bind role="stop" component="mOverlayTxt1"/>
		<bind role="start" component="mOption2"/>
		<bind role="start" component="mOverlayImg2"/>		
		<bind role="start" component="mOverlayTxt2"/>		
	</link>
		<!-- 3) VERDE/AMARILLO -->
	<link id="OnSelectionYellowStopGreen" xconnector="c#onSelectionStopStart">
		<bind role="onSelection" component="mOption3"> 
			<bindParam name="keyCode" value="YELLOW"/> 
		</bind>
		<bind role="stop" component="mOption3"/>
		<bind role="stop" component="mOverlayImg3"/>
		<bind role="stop" component="mOverlayTxt3"/>
		<bind role="start" component="mOption2"/>
		<bind role="start" component="mOverlayImg2"/>		
		<bind role="start" component="mOverlayTxt2"/>
	</link>
	
	<!-- OPCIONES PARA EL BOTÓN VERDE -->
		<!-- 4) AZUL/VERDE -->
	<link id="OnSelectionGreenStopBlue" xconnector="c#onSelectionStopStart">
		<bind role="onSelection" component="mOption1"> 
			<bindParam name="keyCode" value="GREEN"/> 
		</bind>
		<bind role="stop" component="mOption1"/>
		<bind role="stop" component="mOverlayImg1"/>
		<bind role="stop" component="mOverlayTxt1"/>
		<bind role="start" component="mOption3"/>
		<bind role="start" component="mOverlayImg3"/>		
		<bind role="start" component="mOverlayTxt3"/>		
	</link>
		<!-- 5) AMARILLO/VERDE -->
	<link id="OnSelectionGreenStopYellow" xconnector="c#onSelectionStopStart">
		<bind role="onSelection" component="mOption2"> 
			<bindParam name="keyCode" value="GREEN"/> 
		</bind>
		<bind role="stop" component="mOption2"/>
		<bind role="stop" component="mOverlayImg2"/>
		<bind role="stop" component="mOverlayTxt2"/>
		<bind role="start" component="mOption3"/>
		<bind role="start" component="mOverlayImg3"/>		
		<bind role="start" component="mOverlayTxt3"/>		
	</link>
	
	<!-- OPCIONES PARA EL BOTÓN AZUL -->
		<!-- 6) AMARILLO/AZUL -->
	<link id="OnSelectionBlueStopYellow" xconnector="c#onSelectionStopStart">
		<bind role="onSelection" component="mOption2"> 
			<bindParam name="keyCode" value="BLUE"/> 
		</bind>
		<bind role="stop" component="mOption2"/>
		<bind role="stop" component="mOverlayImg2"/>
		<bind role="stop" component="mOverlayTxt2"/>
		<bind role="start" component="mOption1"/>
		<bind role="start" component="mOverlayImg1"/>		
		<bind role="start" component="mOverlayTxt1"/>		
	</link>
		<!-- 7) VERDE/AZUL -->
	<link id="OnSelectionBlueStopGreen" xconnector="c#onSelectionStopStart">
		<bind role="onSelection" component="mOption3"> 
			<bindParam name="keyCode" value="BLUE"/> 
		</bind>
		<bind role="stop" component="mOption3"/>
		<bind role="stop" component="mOverlayImg3"/>
		<bind role="stop" component="mOverlayTxt3"/>
		<bind role="start" component="mOption1"/>
		<bind role="start" component="mOverlayImg1"/>		
		<bind role="start" component="mOverlayTxt1"/>		
	</link>
	
	
	<!-- SALIR DE LA APP Y CERRAR TODAS LAS OPCIONES -->	
	<link id="OnSelectionRedOut" xconnector="c#onSelectionStopResume">
		<bind role="onSelection" component="mExit">
			<bindParam name="keyCode" value="RED"/>
		</bind>
		<bind role="stop" component="mExit"/>
		<bind role="stop" component="mOption1"/>
		<bind role="stop" component="mOption2"/>
		<bind role="stop" component="mOption3"/>
		<bind role="stop" component="mOverlayImg1"/>
		<bind role="stop" component="mOverlayTxt1"/>
		<bind role="stop" component="mOverlayImg2"/>
		<bind role="stop" component="mOverlayTxt2"/>
		<bind role="stop" component="mOverlayImg3"/>
		<bind role="stop" component="mOverlayTxt3"/>
		<bind role="resume" component="mEnter"/>				
	</link>		
		 
</body>
</ncl> 
