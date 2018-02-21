--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computação
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto: Trabalho Prático I
--Módulo: Multiplexador 32 para 1 de 32 bits
--Descrição: O código descreve o circuito de um Multiplexador de 32 entradas de 32 bits cada usado para implementar as 
--2 portas de leitura do banco de registradores o sinal com o número do resgitrador a ser lido é usado como seletor do
--multiplexador.Possui 32 entradas de 32 bits cada, onde serão conectadas a saída de cada registrador e uma saída de 
--32 bits que retorna o valor do registrador selecionado
library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity multiplexer32bits32ports is port(
--Barramentos de entrada dos registradores
	registerAddres00:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres01:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres02:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres03:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres04:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres05:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres06:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres07:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres08:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres09:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres10:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres11:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres12:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres13:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres14:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres15:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres16:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres17:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres18:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres19:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres20:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres21:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres22:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres23:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres24:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres25:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres26:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres27:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres28:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres29:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres30:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	registerAddres31:IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	
	--Sinal entrada de seleçao do resgitrador a ser lido
	selectRegister	 :IN  STD_LOGIC_VECTOR (4 DOWNTO 0); 
	--Barramento de saida com o valor armazenado no resgistrador selecionado
	registerSelected:OUT STD_LOGIC_VECTOR (31 DOWNTO 0));	
END multiplexer32bits32ports;

ARCHITECTURE archMultiplexer32bits32ports OF multiplexer32bits32ports IS
BEGIN
	WITH selectRegister SELECT
	 registerSelected <= 
	 registerAddres00 WHEN "00000",
	 registerAddres01 WHEN "00001",
	 registerAddres02 WHEN "00010",
	 registerAddres03 WHEN "00011",
	 registerAddres04 WHEN "00100",
	 registerAddres05 WHEN "00101",
	 registerAddres06 WHEN "00110",
	 registerAddres07 WHEN "00111",
	 registerAddres08 WHEN "01000",
	 registerAddres09 WHEN "01001",
	 registerAddres10 WHEN "01010",
	 registerAddres11 WHEN "01011",
	 registerAddres12 WHEN "01100",
	 registerAddres13 WHEN "01101",
	 registerAddres14 WHEN "01110",
	 registerAddres15 WHEN "01111",
	 registerAddres16 WHEN "10000",
	 registerAddres17 WHEN "10001",
	 registerAddres18 WHEN "10010",
	 registerAddres19 WHEN "10011",
	 registerAddres20 WHEN "10100",
	 registerAddres21 WHEN "10101",
	 registerAddres22 WHEN "10110",
	 registerAddres23 WHEN "10111",
	 registerAddres24 WHEN "11000",
	 registerAddres25 WHEN "11001",
	 registerAddres26 WHEN "11010",
	 registerAddres27 WHEN "11011",
	 registerAddres28 WHEN "11100",
	 registerAddres29 WHEN "11101",
	 registerAddres30 WHEN "11110",
	 registerAddres31 WHEN "11111",
   "00000000000000000000000000000000" WHEN OTHERS;
END archMultiplexer32bits32ports;
	