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
use packages.MIPSPipelinePackage.ALL;

entity DIEX is port( 
    CLOCK :IN STD_LOGIC;
	RESET :IN STD_LOGIC;
	nextInstructionIn :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	readData1In       :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	readData2In       :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	signalExtensionIn :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerDestiny1In :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
	registerDestiny2In :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
	
	nextInstructionOut :Out  STD_LOGIC_VECTOR (31 DOWNTO 0);
    readData1Out       :Out  STD_LOGIC_VECTOR (31 DOWNTO 0);
    readData2Out       :Out  STD_LOGIC_VECTOR (31 DOWNTO 0);
    signalExtensionOut :Out  STD_LOGIC_VECTOR (31 DOWNTO 0);
    registerDestiny1Out :Out  STD_LOGIC_VECTOR (4 DOWNTO 0);
    registerDestiny2Out :Out  STD_LOGIC_VECTOR (4 DOWNTO 0));
END DIEX;

ARCHITECTURE archDIEX OF DIEX IS
BEGIN
    nextInstructionRegister :registerNbits GENERIC MAP (32) PORT MAP(CLOCK, RESET, nextInstructionIn, nextInstructionOut);
    readData1Register       :registerNbits GENERIC MAP (32) PORT MAP(CLOCK, RESET, readData1In, readData1Out);
    readData2Register       :registerNbits GENERIC MAP (32) PORT MAP(CLOCK, RESET, readData2In, readData2Out);
    signalExtensionRegister :registerNbits GENERIC MAP (5)  PORT MAP(CLOCK, RESET, signalExtensionIn, signalExtensionOut);
    registerDestiny1Register :registerNbits GENERIC MAP (5)  PORT MAP(CLOCK, RESET, registerDestiny1In, registerDestiny1Out);
    registerDestiny2Register :registerNbits GENERIC MAP (5)  PORT MAP(CLOCK, RESET, registerDestiny2In, registerDestiny2Out);
END archDIEX;