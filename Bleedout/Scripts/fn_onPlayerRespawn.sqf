/**
 * Author: XaFlaForo
 * Copyright: © XaFlaForo Studios, 2019
 * Website: xaflaforo.co.uk
 * Rights: All Rights Reserved
 * Notice: You're not allowed to use this file without permission from the author
 *
 * Filename: fn_onPlayerRespawn.sqf
 *
 * Parameter(s): OBJECT - Player that is inacpacitated
 *
 * Description:
 * Function to be used when a unit respawns.
 *
 * Dependencies:
 * AsYetUntitled Framework, XaFlaForo Base Installation Pack
 *
 * Donate:
 * If you would like to donate to recieve products first, technical suppport and no advertising in the products donate below.
 * paypal.me/EthanSolutions
 */


//--- DEBUGGING
scriptName "XaFlaForo_fnc_onPlayerRespawn";
scopeName "main";
#define __filename "fn_onPlayerRespawn.sqf"

//--- Gather & Set Variables
private ["_unit","_corpse","_containers"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;

if (!XaFlaForo_in_down_state) then
//--- Player has been killed (not yet entered bleeding out stage)
{
  //--- Unit Handlers
  _unit setPosATL (getPosATL _corpse);
  _unit setDir (getDir _corpse);

  //--- Anim State Change
  [_unit, "acts_InjuredLyingRifle01"] remoteExecCall ["life_fnc_animSync", 0];

  disableSerialization;

  //--- Init Death screenshot
  [_unit] spawn XaFlaForo_fnc_deathscreen;

  //--- Medic XaFlaForo_fnc_handleMedicRequest
  //[] remoteExecCall XaFlaForo_fnc_handleMedicRequest;
  [] remoteExec ["XaFlaForo_fnc_handleMedicRequest", 0, JIP];


  //--- Change Variables
  XaFlaForo_in_down_state = true;

}
//--- Player has been killed (already was in bleeding out stage)
else
{

  //--- Set variables on.
  _unit setVariable ["restrained",false,true];
  _unit setVariable ["Escorting",false,true];
  _unit setVariable ["transporting",false,true];
  _unit setVariable ["playerSurrender",false,true];
  _unit setVariable ["steam64id",getPlayerUID player,true]; //Reset the UID.
  _unit setVariable ["realname",profileName,true]; //Reset the players name.

  //--- Change & Fix Anim Points
  [_unit, ""] remoteExecCall ["life_fnc_animSync", 0];
  player playMoveNow "AmovPpneMstpSrasWrflDnon";

  //--- Setup Actions
  [] call life_fnc_setupActions;
  deleteMarker "Dead Player";

  //--- Reset Client Variables
  life_action_inUse = false;
  XaFlaForo_in_down_state = false;
  life_hunger = 100;
  life_thirst = 100;
  life_carryWeight = 0;
  life_cash = 0;
  life_is_alive = false;
  6969 cutText["Life_Death_Screen","PLAIN"];
  //6969 cutText ["", "PLAIN"]

  //--- Call Database
  [0] call SOCK_fnc_updatePartial;
  [3] call SOCK_fnc_updatePartial;
  [4] call SOCK_fnc_updatePartial;

  //--- Load Spawn Menu
  [] call life_fnc_spawnmenu;
};
