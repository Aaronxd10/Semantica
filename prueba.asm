;Archivo: prueba.cpp
;Fecha: 09/11/2022 01:31:07 a. m.
#make_COM#
include emu8086.inc
ORG 100h
;Variables
	area DW ? 
	radio DW ? 
	pi DW ? 
	resultado DW ? 
	a DW ? 
	d DW ? 
	altura DW ? 
	cinco DW ? 
	x DW ? 
	y DW ? 
	i DW ? 
	j DW ? 
	k DW ? 
PRINTN "Introduce la altura de la piramide: "
CALL SCAN_NUM
MOV altura, CX 
CALL SCAN_NUM
MOV if, CX
MOV AX, 2
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE
InicioFor0 ;
POP AX
MOV i, AX
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE
MOV AX, 1
PUSH AX
MOV AX, 0
PUSH AX
POP AX
MOV j, AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if2:
MOV AX, 1
PUSH AX
PRINTN "
"
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE
MOV AX, 1
PUSH AX
MOV AX, 0
PUSH AX
POP AX
MOV j, AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if4:
MOV AX, 1
PUSH AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if6:
MOV AX, 1
PUSH AX
PRINTN "
"
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE
MOV AX, 1
PUSH AX
MOV AX, 0
PUSH AX
POP AX
MOV j, AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if8:
MOV AX, 1
PUSH AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if10:
MOV AX, 1
PUSH AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if12:
MOV AX, 1
PUSH AX
PRINTN "
"
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE
MOV AX, 1
PUSH AX
MOV AX, 0
PUSH AX
POP AX
MOV j, AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if14:
MOV AX, 1
PUSH AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if16:
MOV AX, 1
PUSH AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if18:
MOV AX, 1
PUSH AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if20:
MOV AX, 1
PUSH AX
PRINTN "
"
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE
MOV AX, 1
PUSH AX
MOV AX, 0
PUSH AX
POP AX
MOV j, AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if22:
MOV AX, 1
PUSH AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if24:
MOV AX, 1
PUSH AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if26:
MOV AX, 1
PUSH AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if28:
MOV AX, 1
PUSH AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if30:
MOV AX, 1
PUSH AX
PRINTN "
"
MOV AX, 0
PUSH AX
POP AX
POP BX
CMP AX, BX
JLE
MOV AX, 1
PUSH AX
MOV AX, 0
PUSH AX
POP AX
MOV j, AX
POP BX
POP AX
SUB AX, BX
PUSH AX
POP AX
POP BX
CMP AX, BX
JGE
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
JNE
PRINTN "*"
PRINTN "-"
if32:
MOV AX, 1
PUSH AX
PRINTN "
"
FinFor0 ;
MOV AX, 0
PUSH AX
POP AX
MOV k, AX
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
JGE
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
JGE
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
JGE
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
JGE
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
JGE
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
JGE
PRINTN "
"
PRINTN "
Error: la altura debe de ser mayor que 2
"
if1:
MOV AX, 1
PUSH AX
MOV AX, 1
PUSH AX
POP AX
POP BX
CMP AX, BX
JE
PRINTN "Esto no se debe imprimir"
MOV AX, 2
PUSH AX
MOV AX, 2
PUSH AX
POP AX
POP BX
CMP AX, BX
JNE
PRINTN "Esto tampoco"
if36:
if35:
MOV AX, 258
PUSH AX
POP AX
MOV a, AX
PRINTN "Valor de variable int 'a' antes del casteo: "
POP AX
POP AX
POP AX
MOV y, AX
PRINTN "
Valor de variable char 'y' despues del casteo de a: "
POP AX
PRINTN "
A continuacion se intenta asignar un int a un char sin usar casteo: 
"
RET
DEFINE_SCAN_NUM
