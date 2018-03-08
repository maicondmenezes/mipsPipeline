--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ci�ncia da comput��o
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

 
entity dataComparatorNbits is
	GENERIC (n :INTEGER:=8);
	PORT( 
    portA      :IN  STD_LOGIC_VECTOR(n-1 downto 0);
    portB      :IN  STD_LOGIC_VECTOR(n-1 downto 0);
    result     :OUT STD_LOGIC);
END  dataComparatorNbits;

ARCHITECTURE archdataComparatorNbits OF dataComparatorNbits IS
BEGIN
    result <= '1' WHEN portA=portB ELSE '0';
END archdataComparatorNbits;

	 