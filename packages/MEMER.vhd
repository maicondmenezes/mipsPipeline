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

entity MEMER is port( 
    CLOCK :IN STD_LOGIC;
	RESET :IN STD_LOGIC;
	
	readDataIn      :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	ULAResultIn     :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	writeRegisterIn :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);

	readDataOut      :OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
	ULAResultOut     :OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
	writeRegisterOut :OUT  STD_LOGIC_VECTOR (4 DOWNTO 0));
END MEMER;

ARCHITECTURE archMEMER OF MEMER IS
BEGIN
    readDataRegister      :registerNbits GENERIC MAP (32) PORT MAP(CLOCK, RESET, readDataIn, readDataOut);
    ULAResultRegister     :registerNbits GENERIC MAP (32) PORT MAP(CLOCK, RESET, ULAResultIn, ULAResultOut);
    writeRegisterRegister :registerNbits GENERIC MAP (5)  PORT MAP(CLOCK, RESET, writeRegisterIn, writeRegisterOut);
    
END archMEMER;