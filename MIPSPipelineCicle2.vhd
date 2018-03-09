--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: CiÃªncia da computaÃ§Ã£o
--Disciplina: Sistemas Digitais AvanÃ§ados
--ProfÂ°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto:
--MÃ³dulo:
--DescriÃ§Ã£o:

library ieee;
library packages;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use packages.MIPSPipelinePackage.ALL;
 
entity MIPSPipelineCicle2 is port( 
   CLOCK                  :IN  STD_LOGIC;
   RESET                  :IN STD_LOGIC;
   dataRDIn               :IN STD_LOGIC_VECTOR (31 DOWNTO 0);    
   selectRDIn             :IN STD_LOGIC_VECTOR(4 downto 0);
   instructionIn          :IN STD_LOGIC_VECTOR (31 DOWNTO 0);
   DIEXRegisterRTIn       :IN STD_LOGIC_VECTOR(4 downto 0);   
   DIEXWriteMemoryIn      :IN STD_LOGIC;
   nextInstructionIn      :IN STD_LOGIC_VECTOR (31 DOWNTO 0);
   MEMERWriteRegisterBank :IN STD_LOGIC;
   --Saídas
   RSOut  		     :OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
   RTOut  		     :OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
   RDOut  		     :OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
   dataRS  		     :OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
   dataRT  		     :OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
   enablePC                  :OUT STD_LOGIC;
   resetBIDI                 :OUT STD_LOGIC;
   resetEX                   :OUT STD_LOGIC;
   controlOut                :OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
   enableBIDI                :OUT STD_LOGIC;   
   branchSumResult           :OUT STD_LOGIC_VECTOR (31 DOWNTO 0);   
   nextInstructionOut        :OUT STD_LOGIC_VECTOR (31 DOWNTO 0);   
   extendedMemoryAddressOut  :OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
   registersComparatorResult :OUT STD_LOGIC);
END  MIPSPipelineCicle2;

ARCHITECTURE archMIPSPipelineCicle2 OF MIPSPipelineCicle2 IS
	--Sinais do DATAPATH do segundo ciclo
	--Registradores RT e RS do primeiro ciclo utilizados para detecção de conflitos
	SIGNAL BIDIRegisterRT  :IN STD_LOGIC_VECTOR(4 downto 0);
        SIGNAL BIDIRegisterRS  :IN STD_LOGIC_VECTOR(4 downto 0); 
        --Saída da unidade de deslocamento conectada no somador de calculo de saltos
	SIGNAL leftShifter2bOut :STD_LOGIC_VECTOR (31 DOWNTO 0);
        --Sinais da instrução atual
        --OPCODE da instrução atual
	SIGNAL OPCODE :STD_LOGIC_VECTOR (5 DOWNTO 0);	
        --RS da instrução atual
	SIGNAL RS :STD_LOGIC_VECTOR (4 DOWNTO 0);	
        --RT da instrução atual
	SIGNAL RT :STD_LOGIC_VECTOR (4 DOWNTO 0);	
        --RD da instrução atual
	SIGNAL RD :STD_LOGIC_VECTOR (4 DOWNTO 0);	
	--Sinal de Endereçamento de memória
	SIGNAL memoryAddress :STD_LOGIC_VECTOR (15 DOWNTO 0);
        --Sinal de saída do extensor de sinal conectado ao deslocador e ao registrador DIEX
        SIGNAL extendedMemoryAddress:STD_LOGIC_VECTOR (31 DOWNTO 0);      
        SIGNAL enableControlUnit :STD_LOGIC;
        SIGNAL resetDI :STD_LOGIC;
        SIGNAL controlUnitOut :STD_LOGIC_VECTOR (8 DOWNTO 0);
        SIGNAL uniControlMuxSelector :STD_LOGIC;
   BEGIN
	--Componentes do CONTROLE do segundo ciclo
        uniControlMuxSelector <= enableControlUnit OR resetDI;
        --Unidade de detecção de conflitos
        conflictDetection :unitOfConflictDetection PORT MAP(DIEXWriteMemoryIn, DIEXRegisterRTIn, RT, RD, enableBIDI, enablePC, enableControlUnit);
        uniControlMultiplexer :multiplexerNbits2ports GENERIC MAP(9) PORT MAP(controlUnitOut ,"000000000", uniControlMuxSelector, controlOut);
        --Unidade de controle geral
        control :controlUnit PORT MAP(OPCODE, controlUnitOut, resetDI, resetEX);
       
        --Componentes do DATAPATH do segundo ciclo
        --Definindo os valores dos sinais da instrução
        OPCODE <= instructionIn(31 downto 26);
        RS <= instructionIn(25 downto 21);
        RT <= instructionIn(20 downto 16);
        memoryAddress <= instructionIn(15 downto 0);
        extendedMemoryAddressOut <= extendedMemoryAddress;
        nextInstructionOut <= nextInstructionIn;
        RSOut <= RS;
        RTOut <= RD;
        RDOut <= RT;
        --Extensor de sinal
        signalExtender :signalExtender16bTo32b PORT MAP(memoryAddress, extendedMemoryAddress);
        --Deslocador 2 bits a esquerda
        leftShifter :leftShifter2b GENERIC MAP(32) PORT MAP(extendedMemoryAddress, leftShifter2bOut);
        --Somador dos desvios
        branchAdder :fullAdderNbits GENERIC MAP(32) PORT MAP(leftShifter2bOut, nextInstructionIn, '0', branchSumResult);
        --Banco de Registradores
        registers :registerBank32b PORT MAP(CLOCK, RESET, MEMERWriteRegisterBank, RS, RT, selectRDIn, dataRDIn, dataRS, dataRT);
	--Comparador
        dataComparator :dataComparatorNbits GENERIC MAP(32) PORT MAP(dataRS, dataRT, registersComparatorResult);
        
END archMIPSPipelineCicle2;
	 