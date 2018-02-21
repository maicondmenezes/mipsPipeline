--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computação
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto: Trabalho Prático I
--Módulo: Multiplexador 2 para 1 de 32 bits
--Descrição:

library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY fullAdderNbits IS
	GENERIC (
		nBits: integer := 4);
	PORT (
		operatorA: IN STD_LOGIC_VECTOR (nBits-1 DOWNTO 0);
		operatorB: IN STD_LOGIC_VECTOR (nBits-1 DOWNTO 0);
		carryIn:   IN STD_LOGIC;
		result:	  OUT STD_LOGIC_VECTOR (nBits-1 DOWNTO 0));
END fullAdderNbits;

ARCHITECTURE archFullAdderNbits OF fullAdderNbits IS
	COMPONENT fullAdder PORT (
		operatorA: IN  STD_LOGIC;
		operatorB: IN  STD_LOGIC;
		carryIn:   IN  STD_LOGIC;
		carryOut:  OUT STD_LOGIC;
		result:	  OUT STD_LOGIC);
	END COMPONENT;
	SIGNAL carrysOut: STD_LOGIC_VECTOR(nBits-1 DOWNTO 0);
	SIGNAL carryOut:  STD_LOGIC;
BEGIN
	adder0: fullAdder PORT MAP (operatorA(0), operatorB(0), carryIn, carrysOut(0), result(0));
	adderN: FOR i IN 1 TO nBits-1 GENERATE
		adders: fullAdder PORT MAP (operatorA(i), operatorB(i), carrysOut(i-1), carrysOut(i), result(i));
	END GENERATE;
	carryOut<= (carrysOut(nBits-1) XOR carrysOut(nBits-2));
END archFullAdderNbits;