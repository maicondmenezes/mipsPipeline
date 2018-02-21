--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computação
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto: Trabalho Prático I
--Módulo: Multiplexador 2 para 1 de 32 bits
--Descrição: O código descreve o circuito de controle das operaçoes do processador
library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity controlUnit is port( 
   OPCODE           :IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
   controlOut       :OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
END  controlUnit;

ARCHITECTURE archcontrolUnit OF controlUnit IS
BEGIN
    WITH OPCODE SELECT
	--Instruções do tipo R
	    controlOut <="10011000";
	    --ULAOperation      <= "10"; 
        --ULASource         <= '0';
        --registerDestiny   <= '1';
        --writeRegisterBank <= '1';
        --writeMemory       <= '0';
        --conditionalBranch <= '0';
        --memoryToRegister  <= '0';
        WHEN '000000';
    --instrução de leitura da memória
        controlOut <="00101001";
        --ULAOperation      <= "00"; 
        --ULASource         <= '1';
        --registerDestiny   <= '0';
        --writeRegisterBank <= '1';
        --writeMemory       <= '0';
        --conditionalBranch <= '0';
        --memoryToRegister  <= '1';
        WHEN '000000';
    --Instrução de escrita na memória
        controlOut <="00100100";
        --ULAOperation      <= '00'; 
        --ULASource         <= '1';
        --registerDestiny   <= '0';
        --writeRegisterBank <= '0';
        --writeMemory       <= '1';
        --conditionalBranch <= '0';
        --memoryToRegister  <= '0';
        WHEN '000000';
    --Instrução de salto se igual
        controlOut <="01000010";
        --ULAOperation      <= '01'; 
        --ULASource         <= '0';
        --registerDestiny   <= '0';
        --writeRegisterBank <= '0';
        --writeMemory       <= '0';
        --conditionalBranch <= '1';
        --memoryToRegister  <= '0';
        WHEN '000000';
END archcontrolUnit;
	 