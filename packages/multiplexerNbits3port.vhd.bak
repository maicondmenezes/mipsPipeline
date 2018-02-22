--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computação
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto: Trabalho Prático I
--Módulo: Multiplexador 2 para 1 de 32 bits
--Descrição: O código descreve o circuito de um Multiplexador de 2 entradas de 32 bits cada usado para selecionar a 
--origem dos dados do segundo operador da UAL.
library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity multiplexerNbits3ports is 
    GENERIC(nBits :integer:=32);
    PORT(
        portA     : IN STD_LOGIC_VECTOR (nBits-1 DOWNTO 0);
        portB     : IN STD_LOGIC_VECTOR (nBits-1 DOWNTO 0);
        portC     : IN STD_LOGIC_VECTOR (nBits-1 DOWNTO 0);
        selectPort: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        muxOut    : OUT STD_LOGIC_VECTOR(nBits-1 DOWNTO 0));
END multiplexerNbits3ports;

ARCHITECTURE archmultiplexerNbits3ports OF multiplexerNbits3ports IS
BEGIN
	WITH selectPort SELECT
        muxOut <= 
            portA WHEN "00"',
            portB WHEN "01",
            portB WHEN "01",
            "00000000000000000000000000000000" WHEN OTHERS;
END archmultiplexerNbits3ports;
	 