;Archivo: prueba.cpp
;Fecha: 09/11/2022 09:52:48 p. m.
#make_COM#
include emu8086.inc
ORG 100h
;Variables
	area DD ?
	radio DD ?
	pi DD ?
	resultado DD ?
	a DW ?
	d DW ?
	altura DW ?
	cinco DW ?
	x DD ?
	y DB ?
	i DW ?
	j DW ?
	k DW ?
PRINTN "Introduce la altura de la piramide: "
CALL SCAN_NUM
MOV altura, CX 
MOV AX, 2
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE if1
InicioFor0 ;
POP AX
MOV i, AX
InicioFor0:
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE FinFor0
MOV AX, 1
PUSH AX
MOV AX, 0
PUSH AX
POP AX
MOV j, AX
While0:
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While0
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if2
PRINTN "*"
JMP else2
if2:
PRINTN "-"
if2:
MOV AX, 1
PUSH AX
JMP While0
Fin While0:
PRINTN "
"
JMPInicioFor0
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE FinFor0
MOV AX, 1
PUSH AX
MOV AX, 0
PUSH AX
POP AX
MOV j, AX
While1:
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While1
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if4
PRINTN "*"
JMP else3
if4:
PRINTN "-"
if4:
MOV AX, 1
PUSH AX
JMP While1
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While1
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if6
PRINTN "*"
JMP else4
if6:
PRINTN "-"
if6:
MOV AX, 1
PUSH AX
JMP While1
Fin While1:
PRINTN "
"
JMPInicioFor0
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE FinFor0
MOV AX, 1
PUSH AX
MOV AX, 0
PUSH AX
POP AX
MOV j, AX
While2:
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While2
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if8
PRINTN "*"
JMP else5
if8:
PRINTN "-"
if8:
MOV AX, 1
PUSH AX
JMP While2
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While2
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if10
PRINTN "*"
JMP else6
if10:
PRINTN "-"
if10:
MOV AX, 1
PUSH AX
JMP While2
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While2
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if12
PRINTN "*"
JMP else7
if12:
PRINTN "-"
if12:
MOV AX, 1
PUSH AX
JMP While2
Fin While2:
PRINTN "
"
JMPInicioFor0
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE FinFor0
MOV AX, 1
PUSH AX
MOV AX, 0
PUSH AX
POP AX
MOV j, AX
While3:
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While3
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if14
PRINTN "*"
JMP else8
if14:
PRINTN "-"
if14:
MOV AX, 1
PUSH AX
JMP While3
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While3
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if16
PRINTN "*"
JMP else9
if16:
PRINTN "-"
if16:
MOV AX, 1
PUSH AX
JMP While3
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While3
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if18
PRINTN "*"
JMP else10
if18:
PRINTN "-"
if18:
MOV AX, 1
PUSH AX
JMP While3
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While3
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if20
PRINTN "*"
JMP else11
if20:
PRINTN "-"
if20:
MOV AX, 1
PUSH AX
JMP While3
Fin While3:
PRINTN "
"
JMPInicioFor0
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE FinFor0
MOV AX, 1
PUSH AX
MOV AX, 0
PUSH AX
POP AX
MOV j, AX
While4:
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While4
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if22
PRINTN "*"
JMP else12
if22:
PRINTN "-"
if22:
MOV AX, 1
PUSH AX
JMP While4
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While4
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if24
PRINTN "*"
JMP else13
if24:
PRINTN "-"
if24:
MOV AX, 1
PUSH AX
JMP While4
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While4
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if26
PRINTN "*"
JMP else14
if26:
PRINTN "-"
if26:
MOV AX, 1
PUSH AX
JMP While4
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While4
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if28
PRINTN "*"
JMP else15
if28:
PRINTN "-"
if28:
MOV AX, 1
PUSH AX
JMP While4
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While4
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if30
PRINTN "*"
JMP else16
if30:
PRINTN "-"
if30:
MOV AX, 1
PUSH AX
JMP While4
Fin While4:
PRINTN "
"
JMPInicioFor0
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE FinFor0
MOV AX, 1
PUSH AX
MOV AX, 0
PUSH AX
POP AX
MOV j, AX
While5:
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin While5
MOV AX, 2
PUSH AX
POP BX
POP AX
DIV BX
PUSH DX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if32
PRINTN "*"
JMP else17
if32:
PRINTN "-"
if32:
MOV AX, 1
PUSH AX
JMP While5
Fin While5:
PRINTN "
"
JMPInicioFor0
FinFor0 ;
MOV AX, 0
PUSH AX
POP AX
MOV k, AX
Do0:
PRINTN "-"
MOV AX, 2
PUSH AX
MOV AX, 2
PUSH AX
POP BX
POP AX
MUL BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin Do0
JMP Do0
PRINTN "-"
MOV AX, 2
PUSH AX
MOV AX, 2
PUSH AX
POP BX
POP AX
MUL BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin Do0
JMP Do0
PRINTN "-"
MOV AX, 2
PUSH AX
MOV AX, 2
PUSH AX
POP BX
POP AX
MUL BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin Do0
JMP Do0
PRINTN "-"
MOV AX, 2
PUSH AX
MOV AX, 2
PUSH AX
POP BX
POP AX
MUL BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin Do0
JMP Do0
PRINTN "-"
MOV AX, 2
PUSH AX
MOV AX, 2
PUSH AX
POP BX
POP AX
MUL BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin Do0
JMP Do0
PRINTN "-"
MOV AX, 2
PUSH AX
MOV AX, 2
PUSH AX
POP BX
POP AX
MUL BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE Fin Do0
JMP Do0
Fin Do0;
PRINTN "
"
JMP else1
if1:
PRINTN "
Error: la altura debe de ser mayor que 2
"
else1:
if1:
MOV AX, 1
PUSH AX
MOV AX, 1
PUSH AX
POP AX
POP BX
CMP AX, BX
JE if35
PRINTN "Esto no se debe imprimir"
MOV AX, 2
PUSH AX
MOV AX, 2
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE if36
PRINTN "Esto tampoco"
if36:
if35:
MOV AX, 258
PUSH AX
POP AX
MOV a, AX
PRINTN "Valor de variable int 'a' antes del casteo: "
POP AX
CALL PRINT_NUM
POP AX
MOV AH, 0
PUSH AX
POP AX
MOV y, AX
PRINTN "
Valor de variable char 'y' despues del casteo de a: "
POP AX
CALL PRINT_NUM
PRINTN "
A continuacion se intenta asignar un int a un char sin usar casteo: 
"
RET
DEFINE_SCAN_NUM
