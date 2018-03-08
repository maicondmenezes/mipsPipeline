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
use ieee.numeric_std.all;
 
entity leftShifter2b is
	GENERIC( n : INTEGER:=8); 
	PORT(
		dataIn      :IN  STD_LOGIC_VECTOR(n-1 downto 0);
		shiftedData :OUT STD_LOGIC_VECTOR(n-1 downto 0));
END  leftShifter2b;

ARCHITECTURE archleftShifter2b OF leftShifter2b IS
BEGIN	
		shiftedData <= dataIn(n-3 downto 0)&"00";
END archleftShifter2b;