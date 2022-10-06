#ifdef __hsp30__
#ifndef __SDL__
#define global __SDL__
#uselib "SDL2.dll"

; SDL関連 SDL_Init Flag群
#define SDL_INIT_TIMER 0x1
#define SDL_INIT_AUDIO 0x10
#define SDL_INIT_VIDEO 0x20 ; SDK_INIT_EVENTS暗黙
#define SDL_INIT_JOYSTICK 0x200 ; SDL_INIT_EVENTS暗黙
#define SDL_INIT_HAPTIC 0x1000
#define SDL_INIT_GAMECONTROLLER 0x2000 ; SDL_INIT_JOYSTICK暗黙
#define SDL_INIT_EVENTS 0x4000
#define SDL_INIT_SENSOR 0x8000
#define SDL_INIT_EVERYTHING 0xF231

; SDL_Joystick Define
#define SDL_JOYSTICK_AXIS_MAX   32767
#define SDL_JOYSTICK_AXIS_MIN   -32768

#define SDL_HAT_CENTERED    0x00
#define SDL_HAT_UP          0x01
#define SDL_HAT_RIGHT       0x02
#define SDL_HAT_DOWN        0x04
#define SDL_HAT_LEFT        0x08
#define SDL_HAT_RIGHTUP     (SDL_HAT_RIGHT|SDL_HAT_UP)
#define SDL_HAT_RIGHTDOWN   (SDL_HAT_RIGHT|SDL_HAT_DOWN)
#define SDL_HAT_LEFTUP      (SDL_HAT_LEFT|SDL_HAT_UP)
#define SDL_HAT_LEFTDOWN    (SDL_HAT_LEFT|SDL_HAT_DOWN)


; SDL関連
; Cのコメントについては https://github.com/libsdl-org/SDL/blob/main/include/SDL.h
; ここに書いてあるのはHSP系についての。
#cfunc SDL_Init "SDL_Init" int ; (uint32 flags)
#cfunc SDL_Quit "SDL_Quit"
#cfunc SDL_RWFromFile "SDL_RWFromFile" sptr,sptr ;SDL向けFILE*みたいな。
#cfunc SDL_GetError "SDL_GetError"

; SDL_stdinc Support
#cfunc SDL_strlen "SDL_strlen" int ; const char* ret int


; SDL_Joystick関連
#cfunc SDL_LockJoysticks "SDL_LockJoysticks" ; Lock Joystick API (MT)
#cfunc SDL_UnlockJoysticks "SDL_UnlockJoysticks" ; Unlock Joystick API (MT)
#cfunc SDL_NumJoysticks "SDL_NumJoysticks"
#cfunc SDL_JoystickNameForIndex "SDL_JoystickNameForIndex" int ; device_index ret const char*
#cfunc SDL_JoystickPathForIndex "SDL_JoystickPathForIndex" int ; device_index ret const char*
#cfunc SDL_JoystickGetDevicePlayerIndex "SDL_JoystickGetDevicePlayerIndex" int ; device_index ret int
#cfunc SDL_JoystickGetDeviceGUID "SDL_JoystickGetDeviceGUID" int ; device_index ret SDL_JoystickGUID (GUID)
#cfunc SDL_JoystickGetDeviceVendor "SDL_JoystickGetDeviceVendor" int ; device_index ret int(uint16)
#cfunc SDL_JoystickGetDeviceProduct "SDL_JoystickGetDeviceProduct" int ; device_index ret int(uint16)
#cfunc SDL_JoystickGetDeviceProductVersion "SDL_JoystickGetDeviceProductVersion" int ; device_index ret int(uint16)
#cfunc SDL_JoystickGetDeviceType "SDL_JoystickGetDeviceType" int ; device_index ret SDL_JoystickType(Enum)
#cfunc SDL_JoystickGetDeviceInstanceID "SDL_JoystickGetDeviceInstanceID" int ; device_index ret SDL_JoystickID
#cfunc SDL_JoystickOpen "SDL_JoystickOpen" int ; device_index ret SDL_Joystick*
#cfunc SDL_JoystickFromInstanceID "SDL_JoystickFromInstanceID" ; JoystickID ret SDL_Joystick*
#cfunc SDL_JoystickFromPlayerIndex "SDL_JoystickFromPlayerIndex" ; player_index ret SDL_Joystick*
;SDL_JoystickAttachVirtual
;SDL_JoystickAttachVirtualEx
;SDL_JoystickDetachVirtual
;SDL_JoystickIsVirtual
;SDL_JoystickSetVirtualAxis
;SDL_JoystickSetVirtualButton
;SDL_JoystickSetVirtualHat
#cfunc SDL_JoystickName "SDL_JoystickName" int ; SDL_Joystick* ret const char*
#cfunc SDL_JoystickPath "SDL_JoystickPath" int ; SDL_Joystick* ret const char*
#cfunc SDL_JoystickGetPlayerIndex "SDL_JoystickGetPlayerIndex" int ; SDL_Joystick* ret int(Player_index)
#cfunc SDL_JoystickSetPlayerIndex "SDL_JoystickSetPlayerIndex" int, int ; SDL_Joystick*, player_index ret void
#cfunc SDL_JoystickGetGUID "SDL_JoystickGetGUID" int ; SDL_Joystick* ret SDL_JoystickGUID (GUID)
#cfunc SDL_JoystickGetVendor "SDL_JoystickGetVendor" int ; SDL_Joystick* ret int(Uint16)
#cfunc SDL_JoystickGetProduct "SDL_JoystickGetProduct" int ; SDL_Joystick* ret int(Uint16)
#cfunc SDL_JoystickGetProductVersion "SDL_JoystickGetProductVersion" int ; SDL_Joystick* ret int(Uint16)
#cfunc SDL_JoystickGetFirmwareVersion "SDL_JoystickGetFirmwareVersion" int ; SDL_Joystick* ret int(Uint16)
#cfunc SDL_JoystickGetSerial "SDL_JoystickGetSerial" int ; SDL_Joystick* ret const char*
#cfunc SDL_JoystickGetType "SDL_JoystickGetType" int ; SDL_Joystick* ret SDL_JoystickType
#cfunc SDL_JoystickGetGUIDString "SDL_JoystickGetGUIDString" int,sptr,int ; GUID, GUID, cbGUID ret void
#cfunc SDL_JoystickGetGUIDFromString "SDL_JoystickGetGUIDFromString" sptr ; GUID(const char*) ret GUID
#cfunc SDL_GetJoystickGUIDInfo "SDL_GetJoystickGUIDInfo" sptr, sptr, sptr, sptr, sptr ; GUID, vendor, product, version, crc16
#cfunc SDL_JoystickGetAttached "SDL_JoystickGetAttached" int ; SDL_Joystick* ret bool
#cfunc SDL_JoystickInstanceID "SDL_JoystickInstanceID" int ; SDL_Joystick* ret SDL_JoystickID(?)
#cfunc SDL_JoystickNumAxes "SDL_JoystickNumAxes" int ; SDL_Joystick* ret int
#cfunc SDL_JoystickNumBalls "SDL_JoystickNumBalls" int ; SDL_Joystick* ret int
#cfunc SDL_JoystickNumHats "SDL_JoystickNumHats" int ; SDL_Joystick* ret int
#cfunc SDL_JoystickNumButtons "SDL_JoystickNumButtons" int ; SDL_Joystick* ret int
#cfunc SDL_JoystickUpdate "SDL_JoystickUpdate" ; void
#cfunc SDL_JoystickEventState "SDL_JoystickEventState" int ; int(state) ret int
#cfunc SDL_JoystickGetAxis "SDL_JoystickGetAxis" int, int ; SDL_Joystick* int(axis) ret int(signed)
#cfunc SDL_JoystickGetAxisInitialState "SDL_JoystickGetAxisInitialState" int, int, int ; SDL_Joystick*, axis, state* ret Bool
#cfunc SDL_JoystickGetHat "SDL_JoystickGetHat" int, int ; SDL_Joystick*, hat ret int(u8)
#cfunc SDL_JoystickGetBall "SDL_JoystickGetBall" int, int, ptr, ptr ; SDL_Joystick*, ball, *dx, *dy ret int
#cfunc SDL_JoystickGetButton "SDL_JoystickGetButton" int, int ; SDL_Joystick* button ret int(u8)
#cfunc SDL_JoystickRumble "SDL_JoystickRumble" int, int, int, int ; SDL_Joystick* low_freq high_freq duration_ms ret int
#cfunc SDL_JoystickRumbleTriggers "SDL_JoystickRumbleTriggers" int, int, int, int ; SDL_Joystick* left_rumble right_rumble duration_ms ret int
#cfunc SDL_JoystickHasLED "SDL_JoystickHasLED" int ; SDL_Joystick* ret bool
#cfunc SDL_JoystickHasRumble "SDL_JoystickHasRumble" int ; SDL_Joystick* ret bool
#cfunc SDL_JoystickHasRumbleTriggers "SDL_JoystickHasRumbleTriggers" int ; SDL_Joystick* ret bool
#cfunc SDL_JoystickSetLED "SDL_JoystickSetLED" int, int, int, int ; SDL_Joystick* red green blue ret int
#cfunc SDL_JoystickSendEffect "SDL_JoystickSendEffect" int, ptr, int ; SDL_Joystick*, dataptr size ret int
#cfunc SDL_JoystickClose "SDL_JoystickClose" int ; SDL_Joystick* 
#cfunc SDL_JoystickCurrentPowerLevel "SDL_JoystickCurrentPowerLevel" int ; SDL_Joystick*

; SDL_gamecontroller関連 

; SDL_GameControllerType 
;https://github.com/libsdl-org/SDL/blob/main/include/SDL_gamecontroller.h#L61
;https://github.com/libsdl-org/SDL/blob/main/include/SDL_gamecontroller.h#L79

#cfunc SDL_GameControllerAddMappingsFromRW "SDL_GameControllerAddMappingsFromRW" int, int ; SDL_RWops* freerw ret status
#define ctype SDL_GameControllerAddMappingsFromFile(%1) SDL_GameControllerAddMappingsFromRW(SDL_RWFromFile(%1, "rb"), 1)
#cfunc SDL_GameControllerAddMapping "SDL_GameControllerAddMapping" sptr ; mappingString(sptr) ret status
#cfunc SDL_GameControllerNumMappings "SDL_GameControllerNumMappings" ; ret status
#cfunc SDL_GameControllerMappingForIndex "SDL_GameControllerMappingForIndex" int ; mapping_index 
#cfunc SDL_GameControllerMappingForGUID "SDL_GameControllerMappingForGUID" sptr ; SDL_JoystickGUID ret char*(?)
#cfunc SDL_GameControllerMapping "SDL_GameControllerMapping" int ; SDL_GameController ret char* sptr
#cfunc SDL_IsGameController "SDL_IsGameController" int ; joystick_index ret bool
#cfunc SDL_GameControllerNameForIndex "SDL_GameControllerNameForIndex" int ; joystick_index ret sptr(const char*)
#cfunc SDL_GameControllerPathForIndex "SDL_GameControllerPathForIndex" int ; joystick_index ret sptr(const char*)
#cfunc SDL_GameControllerTypeForIndex "SDL_GameControllerTypeForIndex" int ; joystick_index retint(GameControllerType)
#cfunc SDL_GameControllerMappingForDeviceIndex "SDL_GameControllerMappingForDeviceIndex" ; joystick_index ret char*
#cfunc SDL_GameControllerOpen "SDL_GameControllerOpen" int ; joystick_index ret SDL_GameController*
#cfunc SDL_GameControllerFromInstanceID "SDL_GameControllerFromInstanceID" int ; joystickID ret SDL_GameController*
#cfunc SDL_GameControllerFromPlayerIndex "SDL_GameControllerFromPlayerIndex" int ; player_index ret SDL_GameControler*
#cfunc SDL_GameControllerName "SDL_GameControllerName" int ; SDL_GameController* ret sptr(const char*)
#cfunc SDL_GameControllerPath "SDL_GameControllerPath" int ;  SDL_GameController* ret sptr(const char*)
#cfunc SDL_GameControllerGetType "SDL_GameControllerGetType" int ; SDL_GameController* ret GameControllerType
#cfunc SDL_GameControllerGetPlayerIndex "SDL_GameControllerGetPlayerIndex" int ; SDL_GameController* ret int
#cfunc SDL_GameControllerSetPlayerIndex "SDL_GameControllerSetPlayerIndex" int, int ; SDL_GameController*,player_index
#cfunc SDL_GameControllerGetVendor "SDL_GameControllerGetVendor" int ; SDL_GameController* ret int(uint16)
#cfunc SDL_GameControllerGetProduct "SDL_GameControllerGetProduct" int ; SDL_GameController* ret int(uint16)
#cfunc SDL_GameControllerGetProductVersion "SDL_GameControllerGetProductVersion" int ; SDL_GameController ret int uint16
#cfunc SDL_GameControllerGetFirmwareVersion "SDL_GameControllerGetFirmwareVersion" int ; SDL_GameController* ret int(uint16)
#cfunc SDL_GameControllerGetSerial "SDL_GameControllerGetSerial" int ; SDL_GameController* ret const char*
#cfunc SDL_GameControllerGetAttached "SDL_GameControllerGetAttached" int ; SDL_GameController* ret bool
#cfunc SDL_GameControllerGetJoystick "SDL_GameControllerGetJoystick" int ; SDL_GameController* ret SDL_Joystick*
#cfunc SDL_GameControllerEventState "SDL_GameControllerEventState" int ; state ret int
#cfunc SDL_GameControllerUpdate "SDL_GameControllerUpdate" ; None; Update controller
#cfunc SDL_GameControllerGetAxisFromString "SDL_GameControllerGetAxisFromString" sptr ; sptr ret GameControllerAxis
#cfunc SDL_GameControllerGetStringForAxis "SDL_GameControllerGetStringForAxis" int ; GameControllerAxis ret sptr
#cfunc SDL_GameControllerGetBindForAxis "SDL_GameControllerGetBindForAxis" int, int; SDL_GameController* axis ret SDL_GameControllerButtonBind
#cfunc SDL_GameControllerHasAxis "SDL_GameControllerHasAxis" int, int ; SDL_GameController* SDL_GameControllerAxis
#cfunc SDL_GameControllerGetAxis "SDL_GameControllerGetAxis" int, int ; SDL_GameController* axis return Sint16
#cfunc SDL_GameControllerButton "SDL_GameControllerButton" sptr ; const char* ret SDL_GameControllerButton
#cfunc SDL_GameControllerGetStringForButton "SDL_GameControllerGetStringForButton" int ; SDL_GameController ret sptr
#cfunc SDL_GameControllerGetBindForButton "SDL_GameControllerGetBindForButton" int, int ; SDL_GameController* Button ret SDL_GameControllerButtonBind
#cfunc SDL_GameControllerHasButton "SDL_GameControllerHasButton" int, int ; SDL_GameController* Button ret bool
#cfunc SDL_GameControllerGetButton "SDL_GameControllerGetButton" int, int ; SDL_GameController* Button ret int(U8)
#cfunc SDL_GameControllerGetNumTouchpads "SDL_GameControllerGetNumTouchpads" int ; SDL_GameController* ret int
#cfunc SDL_GameControllerGetNumTouchpadFingers "SDL_GameControllerGetNumTouchpadFingers" int, int ; SDL_GameController* touchpad ret int
#cfunc SDL_GameControllerGetTouchpadFinger "SDL_GameControllerGetTouchpadFinger" int, int, int, ptr, ptr, ptr, ptr ; SDL_GameController* touchpad, finger, f *state, f *x, f *y , f *pressure ret int
#cfunc SDL_GameControllerHasSensor "SDL_GameControllerHasSensor" int, int ; SDL_GameController*, SDL_SensorType type ret bool
#cfunc SDL_GameControllerSetSensorEnabled "SDL_GameControllerSetSensorEnabled" ; SDL_GameController*, SDL_SensorType type, bool enabled ret int
#cfunc SDL_GameControllerIsSensorEnabled "SDL_GameControllerIsSensorEnabled" ; SDL_GameController*, SDL_SensorType type ret bool
#cfunc SDL_GameControllerGetSensorDataRate "SDL_GameControllerGetSensorDataRate" int, int ; SDL_GameController*, type ret float (double?)
#cfunc SDL_GameControllerGetSensorData "SDL_GameControllerGetSensorData" int, int, ptr, int ; SDL_GameController*, SDL_SensorType type, f *data, int num_values
#cfunc SDL_GameControllerRumble "SDL_GameControllerRumble" int, int, int, int ; SDL_GameController *gamecontroller, Uint16 low_frequency_rumble, Uint16 high_frequency_rumble, Uint32 duration_ms
#cfunc SDL_GameControllerRumbleTriggers "SDL_GameControllerRumbleTriggers" int, int, int , int ; SDL_GameController *gamecontroller, Uint16 left_rumble, Uint16 right_rumble, Uint32 duration_ms
#cfunc SDL_GameControllerHasLED "SDL_GameControllerHasLED" int ; SDL_GameController*
#cfunc SDL_GameControllerHasRumbleTriggers "SDL_GameControllerHasRumbleTriggers" int ; SDL_GameController*
#cfunc SDL_GameControllerSetLED "SDL_GameControllerSetLED" int, int, int, int ; SDL_GameController* red green blue
#cfunc SDL_GameControllerSendEffect "SDL_GameControllerSendEffect" int, ptr, int ; (SDL_GameController *gamecontroller, const void *data, int size
#cfunc SDL_GameControllerClose "SDL_GameControllerClose" int ; SDL_GameController*
#cfunc SDL_GameControllerGetAppleSFSymbolsNameForButton "SDL_GameControllerGetAppleSFSymbolsNameForButton" ; SDL_GameController *gamecontroller, SDL_GameControllerButton button ret const char*
#cfunc SDL_GameControllerGetAppleSFSymbolsNameForAxis "SDL_GameControllerGetAppleSFSymbolsNameForAxis" ; SDL_GameController *gamecontroller, SDL_GameControllerAxis axis ret const char*
#endif

; TODO: Eventをサポートする (HSPのポインタ事情が分からない)
; TODO: 64bitのcallもサポートする。HSPInt64.dllとかに依存したい。
