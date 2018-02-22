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
 
entity MIPSPipelineCicle1 is port( 
   --Entradas de controle do primeiro ciclo
	CLOCK 						 :IN  STD_LOGIC;
  	enablePC          		 :IN STD_LOGIC;--Habilita ou desabilita o registrador Program Counter
	conditionalBranch 		 :IN STD_LOGIC;--Flag de desvio condicional
	registersComparatorResult:IN STD_LOGIC;--Flag da comparaçao entre os dois operandos da ula
	PCSourceMuxSelect1 		 :IN STD_LOGIC;--Segundo bit da seleçao do mux que atualiza o PC, ele vem da unidade de controle
   --Entradas de dados do primeiro ciclo
	branchSumResult :IN STD_LOGIC_VECTOR (31 DOWNTO 0);--Primeira entrada do mux que atualiza o PC
	--Saídas de dados do primeiro ciclo
	instructionOut     :OUT STD_LOGIC_VECTOR (31 DOWNTO 0); --Instrução apontada pelo PC;
   nextInstructionOut :OUT STD_LOGIC_VECTOR (31 DOWNTO 0));--Endereço da póroxima instrução que o PC irá apontar
END  MIPSPipelineCicle1;

ARCHITECTURE archMIPSPipelineCicle1 OF MIPSPipelineCicle1 IS
	--Sinais de controle do primeiro ciclo
	SIGNAL PCSourceMuxSelect0:STD_LOGIC;--Primeiro bit da seleçao do mux que atualiza o PC é o resultado da operaçao AND entre conditionalBranch e registersComparatorResult
	SIGNAL PCSourceMuxSelect :STD_LOGIC_VECTOR(1 DOWNTO 0);--Seleciona qual o valor de atualizaça do program counter para o próximo ciclo
	
	--Sinais do DATAPATH do primeiro ciclo
	SIGNAL PCSourceMuxOut :STD_LOGIC_VECTOR (31 DOWNTO 0); --Sinal de saída do multiplexador que seleciona a origem do PC entre um salto ou a próxima instruçao
	SIGNAL PCPlus4Out :STD_LOGIC_VECTOR (31 DOWNTO 0);     --Sinal de saída do somador que calcula o endereço da próxima instrução (PC+4)
	SIGNAL PCOut :STD_LOGIC_VECTOR (31 DOWNTO 0);          --Sinal de saída do 'Program Counter' aponta para a instruçao atual	
BEGIN
	--Arquitetura do controle do primeiro ciclo
	--Operaçao AND entre o Desvio condicional e a comparaçao entre os registradores
	PCSourceMuxSelect0 <= conditionalBranch AND registersComparatorResult;
	--Concatena o primeiro bit do PCSourceMuxSelect com o segundo 
	PCSourceMuxSelect <= PCSourceMuxSelect0 & PCSourceMuxSelect1;
	
	--Arquitetura do DATAPATH do primeiro ciclo
	--Program Counter
	PC :registerNbits GENERIC MAP(32) PORT MAP(CLOCK, '0', enablePC, PCSourceMuxOut, PCOut);
	--Multiplexador que seleciona a origem do Program Counter entre o calculo do Salto, o código de exceçao ou a próxima instruçao
	PCSourceMultiplexer :multiplexerNbits3ports GENERIC MAP(32) PORT MAP(branchSumResult, "10000000000000000000000000001000", PCPlus4Out, PCSourceMuxSelect, PCSourceMuxOut);
	--Somador que calcula o endereço da próxima instrução (PC+4)
	PCPlus4Adder :fullAdderNbits GENERIC MAP(32) PORT MAP(PCOut, "00000000000000000000000000000100", '0', PCPlus4Out);
	--Banco de Memória de instruçoes
	instructionsMemory :instructionMemory PORT MAP (CLOCK, PCOut, instructionOut);
	--Enviando o endereço da próxima instruçao para próxima etapa
	nextInstructionOut <= PCPlus4Out;
END archMIPSPipelineCicle1;
	 