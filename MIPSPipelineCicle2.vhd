--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computação
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto:
--Módulo:
--Descrição:

library ieee;
library packages;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use packages.MIPSPipelinePackage.ALL;
 
entity MIPSPipelineCicle2 is port( 
   CLOCK :IN  STD_LOGIC;
   RESET :IN STD_LOGIC;
	---Sinal de saída do somador que calcula o endereço de um salto condicional
	instructionIn     :IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        nextInstructionIn :IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	---Sinal de controle do multiplexador que define o valor do 'Program Counter' FontePC
	PCSource :IN STD_LOGIC;
	    :OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	:OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END  MIPSPipelineCicle2;

ARCHITECTURE archMIPSPipelineCicle2 OF MIPSPipelineCicle2 IS
	--Sinais do DATAPATH do primeiro ciclo
	---Sinal de saída do multiplexador que seleciona a origem do PC entre um salto ou a próxima instruçao
	SIGNAL PCSourceMuxOut :STD_LOGIC_VECTOR (31 DOWNTO 0); 
	---Sinal de saída do somador que calcula o endereço da próxima instrução (PC+4)
	SIGNAL PCPlus4Out :STD_LOGIC_VECTOR (31 DOWNTO 0);
	---Sinal de saída do 'Program Counter' aponta para a instruçao atual
	SIGNAL PCOut :STD_LOGIC_VECTOR (31 DOWNTO 0);
	---Sinal de saída da memória de instruçoes
	SIGNAL instruction:STD_LOGIC_VECTOR (31 DOWNTO 0);
	
BEGIN
	--Componentes do DATAPATH do primeiro ciclo
	--Multiplexador que seleciona a origem do PC entre um salto ou a próxima instruçao
	PCSourceMultiplexer :multiplexerNbits2ports GENERIC MAP(32) PORT MAP(PCPlus4Out, branchSumResult, PCSource, PCSourceMuxOut);
	--Somador que calcula o endereço de um salto condicional
	PCPlu4Adder :fullAdderNbits GENERIC MAP(32) PORT MAP(PCOut, "00000000000000000000000000000010", '0', PCPlus4Out);
	--Program Counter
	PC :registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, PCSourceMuxOut, PCOut);
	--Banco de Memória de instruçoes
	instructionsMemory :instructionMemory PORT MAP(CLOCK, PCOut, instruction);
	--Barreira Temporal do Primeiro Ciclo
	cicle1 :BIDI PORT MAP(CLOCK, RESET, PCPlus4Out, instruction, nextInstructionOut, instructionOut);		
END archMIPSPipelineCicle2;
	 