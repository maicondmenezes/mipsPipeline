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

entity unitOfAdvance is port( 
    EXMEMRDRegister    :IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    MEMERRDRegister    :IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    DIEXRSRegister     :IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    DIEXRTRegister     :IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    EXMEMwriteRegister :IN STD_LOGIC;
    MEMERwriteRegister :IN STD_LOGIC;
    
    advanceA :OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    advanceB :OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
END unitOfAdvance;

ARCHITECTURE archunitOfAdvance OF unitOfAdvance IS
BEGIN
    advanceA <= "10" WHEN 
        EXMEMwriteRegister = '1' AND 
        EXMEMRDRegister /= 0 AND 
        EXMEMRDRegister = DIEXRSRegister;
    ELSIF 
        MEMERwriteRegister = '1' AND 
        MEMERRDRegister /= 0 AND 
        MEMERRDRegister = DIEXRSRegister "01"
    ELSE "00";

    advanceB <= "10" WHEN 
        EXMEMwriteRegister = '1' AND 
        EXMEMRDRegister /= 0 AND 
        EXMEMRDRegister = DIEXRTRegister;
    ELSIF   
        MEMERwriteRegister = '1' AND 
        MEMERRDRegister /= 0 AND 
        MEMERRDRegister = DIEXRTRegister "01"
    ELSE "00";
END archunitOfAdvance;