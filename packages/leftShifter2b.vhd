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
 
entity leftShifter2b is port( 
   dataIn      :IN  STD_LOGIC_VECTOR(31 downto 0);
   shiftedData :OUT STD_LOGIC_VECTOR(31 downto 0));
END  leftShifter2b;

ARCHITECTURE archleftShifter2b OF leftShifter2b IS
BEGIN
    shiftedData <= dataIn/2;
END archleftShifter2b;