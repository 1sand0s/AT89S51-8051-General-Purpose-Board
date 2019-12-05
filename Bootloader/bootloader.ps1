$AVRDUDE_HOME = "Absolute Path to avrdude.exe"
$CONF_FILE = "Absolute Path to F40R96CIUSLFZFP.conf"

#$args[0] = Arduino COM Port
#$args[1] = Baudrate (Max = 1/16th of AT89S51 Crystal Frequency)
#$args[2] = HEX file to burn

if ($args[0] -eq "--help" -OR $args[0] -eq "-h")
{

    echo "`n`n`t**************************Arguements******************************"
    echo "`t*                                                                *"
    echo "`t* args[0] = Arduino COM Port                                     *"
    echo "`t*                                                                *"
    echo "`t* args[1] = Baudrate (Max = 1/16th of AT89S51 Crystal Frequency) *"
    echo "`t*                                                                *"
    echo "`t* args[2] = HEX file to burn                                     *"
    echo "`t*                                                                *"
    echo "`t******************************************************************"



    echo "`n`n`t********************************Steps*****************************************"
    echo "`t*                                                                            *"
    echo "`t* Connect MISO of Arduino to MISO of Board V1(AT89s51)                       *"
    echo "`t*                                                                            *"

    echo "`t* Connect MOSI of Arduino to MOSI of Board V1(AT89s51)                       *"
    echo "`t*                                                                            *"

    echo "`t* Connect SCK of Arduino to SCK of Board V1(AT89s51)                         *"
    echo "`t*                                                                            *"

    echo "`t* Connect Pin 10 of Arduino to RST of Board V1(AT89s51)                      *"
    echo "`t*                                                                            *"

    echo "`t* The board V1 must be powered by the Arduino while burning the HEX file     *"
    echo "`t*                                                                            *"

    echo "`t* Connect GND of Arduino to GND of Board V1(AT89s51)                         *"
    echo "`t*                                                                            *"

    echo "`t* Connect 5V of Arduino to VCC of Board V1(AT89s51)                          *"
    echo "`t*                                                                            *"

    echo "`t* Remove the Jumper shorting VPP and VCC on board V1(AT89s51) on J5          *"
    echo "`t*                                                                            *"
     
    echo "`t* Press RESET on board V1(AT89s51) and execute the command below             *"
    echo "`t*                                                                            *"
    echo "`t* Sample Usage : Must be executed in the directory containing the HEX file   *"
    echo "`t*                                                                            *"
    echo "`t*         `"bootloader.ps1 COM3 19200 Blinky.hex`"                             *"
    echo "`t*                                                                            *"

    echo "`t* Remove the MISO, MOSI, SCK, RST, VCC and GND connections from board V1     *"
    echo "`t*                                                                            *"

    echo "`t* Power up board V1 using DC Adapter (5V-15V tolerant)                       *"
    echo "`t*                                                                            *"

    echo "`t* Add back the Jumper shorting VPP and VCC on board V1 on J5                 *"
    echo "`t*                                                                            *"

    echo "`t* Press RESET on board V1                                                    *"
    echo "`t*                                                                            *"

    echo "`t******************************************************************************`n"
}
else
{
    & $AVRDUDE_HOME @('-C',$CONF_FILE,'-c','stk500v1','-P',$args[0],'-p','89s51','-b',$args[1],'-U',('flash:w:'+$args[2]))
}