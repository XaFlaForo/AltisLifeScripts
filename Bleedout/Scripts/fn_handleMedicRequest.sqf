/**
 * Author: XaFlaForo
 * Copyright: © XaFlaForo Studios, 2019
 * Website: xaflaforo.co.uk
 * Rights: All Rights Reserved
 * Notice: You're not allowed to use this file without permission from the author!
 *
 * Filename: fn_deathscreen.sqf
 *
 * Parameter(s): OBJECT: Player that is incapacitatedState
 *               STRING: Marker on map
 *
 * Description:
 * Function to be used to handle notifcations to medics.
 *
 * Dependencies:
 * AsYetUntitled Framework, XaFlaForo Base Installation Pack
 *
 * Donate:
 * If you would like to donate to recieve products first, technical suppport  and no advertising in the products donate below.
 * paypal.me/EthanSolutions
 */

//--- Params
parms [_unit];

//--- Not a medic
if !(playerSide isEqualTo independent) exitWith {};

//--- Create Marker
_XaFlaForo_Marker_Bleedout = createMarker ["Dead Player", _unit]
_XaFlaForo_Marker_Bleedout setMarkerShape "ICON";
_XaFlaForo_Marker_Bleedout setMarkerType "hd_dot";

//--- Hint
["Player Down",["Check your map to find the player"]] call bis_fnc_showNotification;
