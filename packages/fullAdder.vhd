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
 
ENTITY fullAdder IS PORT (
	operatorA: IN  STD_LOGIC;
	operatorB: IN  STD_LOGIC;
	carryIn:   IN  STD_LOGIC;
	carryOut:  OUT STD_LOGIC;
	result:	  OUT STD_LOGIC);
END fullAdder;

ARCHITECTURE archFullAdder OF fullAdder IS
BEGIN
	carryOut <= ((operatorA AND operatorB)OR(carryIn AND(operatorA XOR operatorB)));
	result <=(carryIn XOR(operatorA XOR operatorB));
END archFullAdder;