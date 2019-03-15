/**
 * Author: XaFlaForo
 * Copyright: © XaFlaForo Studios, 2019
 * Website: xaflaforo.co.uk
 * Rights: All Rights Reserved
 * Notice: You're not allowed to use this file without permission from the author!
 *
 * Filename: fn_handleHeal.sqf
 *
 * Parameter(s): OBJECT - Player that is inacpacitated
 *               OBJECT - Player that is healing inacpacitated
 *
 * Description:
 * Function to be used to control the deathscreen GUI.
 *
 * Dependencies:
 * AsYetUntitled Framework, XaFlaForo Base Installation Pack
 *
 * Donate:
 * If you would like to donate to recieve products first, technical suppport and no advertising in the products donate below.
 * paypal.me/EthanSolutions
 */

 //--- DEBUGGING
 scriptName "XaFlaForo_fnc_handleHeal";
 scopeName "main";
 #define __filename "fn_handleHeal.sqf"

 //--- Get params from eventhandler
 params [ "_unit", "_healer", "_isMedic" ];

 //--- Get the injured player
 _injured = _this select 0;

 //--- Get damage of the injured
 _damage = damage _injured;
 _currentblood = XaFlaForo_Blood;

 //--- Check If Player Is Bleeding Out
if ( XaFlaForo_in_down_state ) then {
 		XaFlaForo_Blood = XaFlaForo_Blood - 0.15;
 	  systemChat "You were healed by another civilian";
 };
