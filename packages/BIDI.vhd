--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computção
--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computção	 
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto: MIPS Pipeline
--Módulo:
--Descrição:
library ieee;
library packages;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use packages.MIPSPipelinePackage.ALL;

entity BIDI is port( 
    CLOCK   :IN STD_LOGIC;
    RESET   :IN STD_LOGIC;
    ENABLED :IN STD_LOGIC;
	
	instructionIn     :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	nextInstructionIn :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	
	instructionOut    :OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	nextInstructionOut:OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END BIDI;

ARCHITECTURE archBIDI OF BIDI IS
BEGIN
    instructionRegister     :registerNbits GENERIC MAP (32) PORT MAP(CLOCK, RESET, ENABLED, instructionIn, instructionOut);
    nextInstructionRegister :registerNbits GENERIC MAP (32) PORT MAP(CLOCK, RESET, ENABLED, nextInstructionIn, nextInstructionOut);
END archBIDI;