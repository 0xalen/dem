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
<ncl id="conectores" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
<head>
	<connectorBase>		
  		<causalConnector id="onBeginStart">
  			<simpleCondition role="onBegin" />
   			<simpleAction max="unbounded" qualifier="seq" role="start" delay="5s"/>
  		</causalConnector>
  		<causalConnector id="onSelectionStopStart">
				<connectorParam name="keyCode"/>
				<simpleCondition key="$keyCode" role="onSelection" />
				<compoundAction operator="seq">
					<simpleAction max="unbounded" qualifier="seq" role="stop" />
					<simpleAction max="unbounded" qualifier="seq" role="start" />
				</compoundAction>
		</causalConnector>			
		<!-- -->
		<causalConnector id="onSelectionPauseStart">
				<connectorParam name="keyCode"/>
				<simpleCondition key="$keyCode" role="onSelection" />
				<compoundAction operator="seq">
					<simpleAction max="unbounded" qualifier="seq" role="pause" />
					<simpleAction max="unbounded" qualifier="seq" role="start" />
				</compoundAction>
		</causalConnector>			
		<causalConnector id="onSelectionStopResume">
				<connectorParam name="keyCode"/>
				<simpleCondition key="$keyCode" role="onSelection" />
				<compoundAction operator="seq">
					<simpleAction max="unbounded" qualifier="seq" role="stop" />
					<simpleAction max="unbounded" qualifier="seq" role="resume" />
				</compoundAction>
		</causalConnector>			
		<!-- Diferencia con respecto a App1-->
  		<causalConnector id="onStopStart">
  			<simpleCondition role="onStop" />  			
			<simpleAction max="unbounded" qualifier="seq" role="start" />				
  		</causalConnector>  			
  		<causalConnector id="onEndStart">
  			<simpleCondition role="onEnd" />
   			<simpleAction max="unbounded" qualifier="seq" role="start" delay="5s" />
  		</causalConnector>  		
 	</connectorBase>
</head>
</ncl>
