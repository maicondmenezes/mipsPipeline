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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use packages.MIPSPipelinePackage.ALL;
 
entity signalExtender16bTo32b is port( 
   dataIn      :IN  STD_LOGIC_VECTOR(15 downto 0);
   extendedData :OUT STD_LOGIC_VECTOR(31 downto 0));
END  signalExtender16bTo32b;

ARCHITECTURE archsignalExtender16bTo32b OF signalExtender16bTo32b IS
BEGIN
    extendedData <= "0000000000000000"&dataIn;
END archsignalExtender16bTo32b;

	 