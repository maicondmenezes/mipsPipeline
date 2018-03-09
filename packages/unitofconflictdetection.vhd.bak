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

entity unitOfConflictDetection is port( 
    DIEXWriteMemory :IN STD_LOGIC;
    DIEXRegisterRT  :IN STD_LOGIC_VECTOR(4 downto 0);
    BIDIRegisterRT  :IN STD_LOGIC_VECTOR(4 downto 0);
    BIDIRegisterRS  :IN STD_LOGIC_VECTOR(4 downto 0);
    enableBIDI        :OUT STD_LOGIC;
    resetBIDI         :OUT STD_LOGIC;
    enablePC          :OUT STD_LOGIC;
    enableControlUnit :OUT STD_LOGIC);
END unitOfConflictDetection;

ARCHITECTURE archunitOfConflictDetection OF unitOfConflictDetection IS
BEGIN
    enableBIDI        <= '0' WHEN (DIEXWriteMemory ='1' 
                                   AND((DIEXRegisterRT = BIDIRegisterRT) 
                                   OR (DIEXRegisterRT = BIDIRegisterRs)) 
                             ELSE '1';

    enablePC          <= '0' WHEN (DIEXWriteMemory ='1' 
                                   AND((DIEXRegisterRT = BIDIRegisterRT) 
                                   OR (DIEXRegisterRT = BIDIRegisterRs)) 
                             ELSE '1';

    enableControlUnit <= '0' WHEN (DIEXWriteMemory ='1' 
                                   AND((DIEXRegisterRT = BIDIRegisterRT) 
                                   OR (DIEXRegisterRT = BIDIRegisterRs)) 
                             ELSE '1';

END archunitOfConflictDetection;