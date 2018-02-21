--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computação
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto: Trabalho Final
--Módulo: BIDI
--Descrição: O código descreve o circuito de um registrador de 32 bits
library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity controlDIEX is port( 
    CLOCK :IN STD_LOGIC;
	RESET :IN STD_LOGIC;
	controlDIEXIn    :IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    controlDIEXOut   :OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END controlDIEX;

ARCHITECTURE archControlDIEX OF controlDIEX IS
BEGIN
    controlDIEXRegister :registerNbits GENERIC MAP (8) PORT MAP(CLOCK, RESET, controlDIEXIn, controlDIEXOut);
    
END archControlDIEX;