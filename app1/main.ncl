<!--
# ==================================================================== #
#	LICENCIA (GPLv2)
#
#	Copyrigth (C) 2017 Franco Alejandro Trinidad (0xalen)
#
#	This program is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
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
			<region id="rgOverlayImg" left="20px" bottom="10px" width="25%" height="30%" zIndex="1"/>
			<region id="rgOverlayTxt" right="10px" bottom="10px" width="70%" height="30%" zIndex="1"/>
		</region>	
	</regionBase>
	<transitionBase>
		<transition id="tBase" type="fade" dur="3s"/>		
		<transition id="tAction" type="fade" dur="1s"/>
		<transition id="tOverlay" type="fade" dur="1s"/>
	</transitionBase>			
	<descriptorBase>
		<descriptor id="dBase" region="rgBase" transIn="tBase"/>
		<descriptor id="dEnter" region="rgEnter" transIn="tAction" transOut="tAction" explicitDur="5s" background="WHITE"/>		
		<descriptor id="dExit" region="rgExit" transIn="tAction" transOut="tAction">
				<descriptorParam name="transparency" value="0.4"/>
		</descriptor>		
		<descriptor id="dOverlayImg" region="rgOverlayImg" transIn="tOverlay" transOut="tOverlay">
			<descriptorParam name="transparency" value="0.4"/>
		</descriptor>					
		<descriptor id="dOverlayTxt" region="rgOverlayTxt" transIn="tOverlay" transOut="tOverlay">
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
		
	<media id="mBase" type="image/jpeg" src="media/image/BaseImage.jpeg" descriptor="dBase"/>
	<media id="mEnter" type="image/png" src="media/image/Enter.png" descriptor="dEnter"/>
	<media id="mExit" type="image/png" src="media/image/Exit.png" descriptor="dExit"/>
	<media id="mOverlayImg" type="" src="media/image/Overlay.jpg" descriptor="dOverlayImg"/>	
	<media id="mOverlayTxt" src="media/files/Overlay.txt" descriptor="dOverlayTxt">
		<property name="fontSize" value="18"/>
		<property name="fontColor" value="black"/>
	</media>
	
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
	
	<!-- SELECCIÓN DEL BOTON -->
	<link id="OnSelectionRedIn" xconnector="c#onSelectionPauseStart">
		<bind role="onSelection" component="mEnter"> 
			<bindParam name="keyCode" value="RED"/> 
		</bind>
		<bind role="pause" component="mEnter"/>
		<bind role="start" component="mExit"/>
		<bind role="start" component="mOverlayImg"/>		
		<bind role="start" component="mOverlayTxt"/>		
	</link>
	
	<link id="OnSelectionRedOut" xconnector="c#onSelectionStopResume">
		<bind role="onSelection" component="mExit">
			<bindParam name="keyCode" value="RED"/>
		</bind>
		<bind role="stop" component="mExit"/>
		<bind role="stop" component="mOverlayImg"/>
		<bind role="stop" component="mOverlayTxt"/>
		<bind role="resume" component="mEnter"/>				
	</link>	
		 
</body>
</ncl> 
