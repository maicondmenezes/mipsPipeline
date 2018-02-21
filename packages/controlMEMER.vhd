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

entity controlMEMER is port( 
    CLOCK :IN STD_LOGIC;
	RESET :IN STD_LOGIC;
	controlMEMERIn    :IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    controlMEMEROut   :OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END controlMEMER;

ARCHITECTURE archcontrolMEMER OF controlMEMER IS
BEGIN
    controlMEMERRegister :registerNbits GENERIC MAP (2) PORT MAP(CLOCK, RESET, controlMEMERIn, controlMEMEROut);
END archcontrolMEMER;