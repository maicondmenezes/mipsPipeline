--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computação
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto: Trabalho Final
--Módulo: BIDI
--Descrição: O código descreve o circuito da primeira barreira temporal do caminho de dados do MIPS Pipeline, com 2 registrador
-- de 32 bits cada
library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use packages.MIPSPipelinePackage.ALL;

entity dataMemory is port(
	CLOCK: in std_logic;
	readWriteEnable: in std_logic;
	writeData: in std_logic_vector(31 downto 0);
	readData: out std_logic_vector(31 downto 0);
	memoryAddress: in std_logic_vector(31 downto 0));
end dataMemory;

architecture archDataMemory of dataMemory is
	signal cell:mematual;
begin

process(CLOCK)
begin
	if(CLOCK'event and CLOCK = '1') then
		if readWriteEnable = '1' then
			cell(to_integer(unsigned(memoryAddress))) <= writeData;
		end if;
		readData <= cell(to_integer(unsigned(memoryAddress)));
	end if;
end process;



end archDataMemory;