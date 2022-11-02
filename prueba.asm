;Archivo: prueba.cpp
;Fecha: 28/10/2022 09:36:53 a. m.
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
	x DW ? 
	y DW ? 
	i DW ? 
	j DW ? 
PRINTN "Introduce el radio del sonido:"
CALL SCAN_NUM
MOV radio, CX 
RET
DEFINE_SCAN_NUM
