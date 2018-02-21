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

entity controlEXMEM is port( 
    CLOCK :IN STD_LOGIC;
	RESET :IN STD_LOGIC;
	controlEXMEMIn    :IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
    controlEXMEMOut   :OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END controlEXMEM;

ARCHITECTURE archcontrolEXMEM OF controlEXMEM IS
BEGIN
    controlEXMEMRegister :registerNbits GENERIC MAP (5) PORT MAP(CLOCK, RESET, controlEXMEMIn, controlEXMEMOut);
    
END controlEXMEM;