--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ci�ncia da comput��o	 
--Disciplina: Sistemas Digitais Avan�ados
--Prof�: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto: MIPS Pipeline
--M�dulo:
--Descri��o:
library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity controlUnit is port( 
   OPCODE     :IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
   controlOut :OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
   resetDI    :OUT STD_LOGIC;
   resetEX    :OUT STD_LOGIC);
END  controlUnit;

ARCHITECTURE archcontrolUnit OF controlUnit IS
BEGIN
    WITH OPCODE SELECT controlOut <=
	--Instruções do tipo R
	"100110000"
		  --ULAOperation      <= "10"; 
        --ULASource         <= '0';
        --registerDestiny   <= '1';
        --writeRegisterBank <= '1';
        --writeMemory       <= '0';
        --conditionalBranch <= '0';
        --memoryToRegister  <= '0';
        --resetBI           <= '0';
   WHEN "000000",
    --instrução de leitura da memória
   "001010010"
        --ULAOperation      <= "00"; 
        --ULASource         <= '1';
        --registerDestiny   <= '0';
        --writeRegisterBank <= '1';
        --writeMemory       <= '0';
        --conditionalBranch <= '0';
        --memoryToRegister  <= '1';
        --resetBI           <= '0';
	WHEN "000001",
    --Instrução de escrita na memória
   "001001000"
        --ULAOperation      <= '00'; 
        --ULASource         <= '1';
        --registerDestiny   <= '0';
        --writeRegisterBank <= '0';
        --writeMemory       <= '1';
        --conditionalBranch <= '0';
        --memoryToRegister  <= '0';
        --resetBI           <= '0';
    WHEN "000010",
    --Instrução de salto se igual
    "010000101"
        --ULAOperation      <= '01'; 
        --ULASource         <= '0';
        --registerDestiny   <= '0';
        --writeRegisterBank <= '0';
        --writeMemory       <= '0';
        --conditionalBranch <= '1';
        --memoryToRegister  <= '0';
        --resetBI           <= '1';
    WHEN "000100",
	 "000000000" WHEN OTHERS;
END archcontrolUnit;
	 