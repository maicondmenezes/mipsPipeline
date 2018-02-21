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
 
entity dataComparator32b is port( 
    portA      :IN  STD_LOGIC_VECTOR(31 downto 0);
    portB      :IN  STD_LOGIC_VECTOR(31 downto 0);
    result     :OUT STD_LOGIC);
END  dataComparator32b;

ARCHITECTURE archdataComparator32b OF dataComparator32b IS
BEGIN
    result <= '1' WHEN portA=portB ELSE '0';
END archdataComparator32b;

	 