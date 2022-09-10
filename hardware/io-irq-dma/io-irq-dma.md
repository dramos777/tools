# I/O & IRQ & DMA
```
apt update && apt install irqtop
```

First off, what are I/O,IRQ'S and DMA'S.

I/O is short for Input/Output which refers to memory allocation addresses.

IRQ is short for Interrupt Request which is a way the computer controls various functions.

DMA is short for Direst Memory Access which tells the computer which part of the memory a device will use.

There are reserved I/O's set within the computer bios which cannot be changed.

There are reserved IRQ's set for standard cards to use a national industry standard.

There are reserved DMA's set for cards so they have there own working area set out to perform there task.

####Standard Settings:

Depending on the amount of installed memory these can reside in many different areas, to find out whats where goto the dos prompt and type MSD.exe, it will bring up a screen that enables you view your system in all aspects, from who made the CPU ( Central Processing Unit ) right down to the type of mouse you are using.

I/O'S can range from 0000H to 03FFH ( The number refers to a area of memory where the card resides )

IRQ'S can range from 00 to 15 ( The number refers to a line controlled by the CPU )Some are reserved for system usage.

DMA'S can range from 00 to 09 ( The number refers to a channel controlled by the CPU ) Some are reserved for system usage


### I/O Summary and there designated use.

- 0000H-000FH DMA
- 0020H-0021H PIC
- 0040H-0043H System Timer
- 0060H-0060H Keyboard
- 0061H-0061H System Speaker
- 0064H-0064H Keyboard
- 0070H-0071H System Timer/Real Time Clock
- 0081H-0083H DMA
- 0087H-0087H DMA
- 0089H-008BH DMA
- 008FH-008FH DMA
- 00A0H-00A1H PIC
- 00C0H-00DFH DMA
- 00F0H-00FFH Co-Pro ( If installed )
- 01F0H-01F7H IDE Hard Disk Controller
- 0200H-0207H Joystick Port ( If installed )
- 02F8H-02FFH Com 2
- 0378H-037AH Printer Port ( LPT 1 )
- 03F2H-03F5H Floppy Drive Controller
- 03F6H-03F6H IDE Hard Disk Controller
- 03F8H-03FFH Com 1
Some of these settings can be changed by jumpers on the indivdual cards or motherboard.

There are others available for add on devices such as soundcards, video cards, cd-rom's, and network cards.

### IRQ Summary and there designated use.

- 00-System Timer
- 01-Keyboard
- 02-PIC ( Programmable Interrupt Controller )
- 03-Communications Ports ( Com 2 & Com 4 )
- 04-Communications Ports ( Com 1 & Com 3 )
- 05-Can be used for add on devices
- 06-Standard Floppy Disk Controller
- 07-Can be used for add on devices
- 08-System Cmos/Real time clock
- 09-Can be used for add on devices
- 10-Can be used for add on devices
- 11-Can be used for add on devices
- 12-Can be used for add on devices
- 13-Numeric Data Processor ( Co-Pro ) if installed
- 14-IDE Hard Drive Controller
- 15-Can be used for add on devices

Some of these may vary depending on the Bios Manufacturer. Com Ports are set to a standard and should not be deviated from. When installing a new device, check the IRQ'S already in use and pick one not in use by the system, it may be required to change the settings of one cards IRQ to allow the instalation of a new one to advoid conflicts. Check to see if the new card has a DMA setting required and do the same as for IRQ'S. Only Com1&3 & Com2&4 can share IRQ's without a possable conflict unless the com port is disabled on the card physically by a jumper, in which case that IRQ can be used by another device

**NOTE**: A modem CANNOT share a common IRQ with a mouse, If your mouse is on com 1 then your modem must be on com 2 or 4, if your mouse is on com 2 then your modem must be on com 1 or 3,see examples below

### DMA'S Summary:

- 00-Can be used for add on device
- 01-Can be used for add on device
- 02-Standard Floppy Disk Controller
- 03-Can be used for add on device
- 04-Direct Memory Access Contoller
- 05-Can be used for add on device
- 06-Can be used for add on device
- 07-Can be used for add on device

There are 2 reserved DMA'S which are 02 & 04
Others are available for use for such things as sound cards, scanners, and network cards.

*Examples:*

Modem installed on com2

IRQ=4

I/O=02F8-02FF

DMA=none



Mouse installed on com1

IRQ=3

I/O=03F8-03FF

DMA=none


*Some PC cards require mutiple I/O'S and DMA'S*

Example: Soundcard

IRQ=5

I/O=0220-022F

I/O=0330-0331

I/O=0338-038B

DMA=03

DMA=07

Some Soundcards have built in CD-Rom controllers and Joystick ports, usually these can be disabled either by a jumper on the card itself or by a setup program.
Check the documentation that came with the card for more info.

Before installing a new card take the time to check out the I/O Address, which IRQ it needs, and the DMA channel if needed, it these requirements are met then go for it, if not then dig out all the info. you can, sit down with a big cup of Java, and start them wheels turning to make the resources required there, if not you will most likely end up with a big mess, that will take days or weeks to fix. 

Source: https://www.angelfire.com/id/MastersEstate/irq.html
