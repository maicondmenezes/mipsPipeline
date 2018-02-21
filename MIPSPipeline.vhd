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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use packages.MIPSPipelinePackage.ALL;
 
entity MIPSPipelineCicle1 is port( 
   CLOCK :IN  STD_LOGIC;
   RESET :OUT STD_LOGIC;
   instructionOut    :OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
   nextInstructionOut:OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END  MIPSPipelineCicle1;

ARCHITECTURE archMIPSPipelineCicle1 OF MIPSPipelineCicle1 IS
BEGIN
	--Sinais do DATAPATH do primeiro ciclo
	---Sinal de saída do multiplexador que seleciona a origem do PC entre um salto ou a próxima instruçao
	SIGNAL PCSourceMuxOut :STD_LOGIC_VECTOR (31 DOWNTO 0); 
	---Sinal de saída do somador que calcula o endereço da próxima instrução (PC+4)
	SIGNAL PCPlus4Out :STD_LOGIC_VECTOR (31 DOWNTO 0);
	---Sinal de saída do somador que calcula o endereço de um salto condicional
	SIGNAL branchSumResult :STD_LOGIC_VECTOR (31 DOWNTO 0);
	---Sinal de saída do 'Program Counter' aponta para a instruçao atual
	SIGNAL PCOut :STD_LOGIC_VECTOR (31 DOWNTO 0);
	---Sinal de saída da memória de instruçoes
	SIGNAL instruction:STD_LOGIC_VECTOR (31 DOWNTO 0);
	--Sinais de controle do primeiro ciclo
	---Sinal de controle do multiplexador que define o valor do 'Program Counter' FontePC
	SIGNAL PCSource :STD_LOGIC;
	--Componentes do DATAPATH do primeiro ciclo
	--Multiplexador que seleciona a origem do PC entre um salto ou a próxima instruçao
	PCSourceMultiplexer :multiplexerNbits2ports GENERIC MAP(32) PORT MAP(PCPlus4Out, branchSumResult, PCSource, PCSourceMuxOut);
	--Somador que calcula o endereço de um salto condicional
	PCPlu4Adder :fullAdderNbits GENERIC MAP(32) PORT MAP(PCOut, "00000000000000000000000000000010", '0', PCPlus4Out);
	--Program Counter
	PC :registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, PCSourceMuxOut, PCOut);
	--Banco de Memória de instruçoes
	instructionsMemory :instructionMemory(CLOCK, PCOut, instruction);
	--Barreira Temporal do Primeiro Ciclo
	cicle1 :BIDI PORT MAP(CLOCK, RESET, PCPlus4Out, instruction, nextInstructionOut, instructionOut);		
END archMIPSPipelineCicle1;
	 