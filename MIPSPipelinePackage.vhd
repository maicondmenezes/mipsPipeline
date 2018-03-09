--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computação
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto: Trabalho Prático I
--Módulo: Pacote de componentes
--Descrição: Este código descreve em um pacote todos os componentes de hardware utilizados no processador

library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

PACKAGE MIPSPipelinePackage IS
    
   TYPE mematual_line is array (0 to 7) of std_logic_vector(7 downto 0);
   TYPE mematual is array (0 to 7) of mematual_line;
		
	COMPONENT fullAdder PORT (
		operatorA: IN  STD_LOGIC;
		operatorB: IN  STD_LOGIC;
		carryIn:   IN  STD_LOGIC;
		carryOut:  OUT STD_LOGIC;
		result:	  OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT registerNbits
	GENERIC ( 
		n : INTEGER := 4); 
	PORT ( 
            clock:IN  STD_LOGIC; 
            reset:IN  STD_LOGIC;
            enable:IN  STD_LOGIC;   
		data: IN  STD_LOGIC_VECTOR (n-1 DOWNTO 0); 
		q    :OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)); 
	END COMPONENT;
	
	COMPONENT fullAdderNbits 
	GENERIC (nBits: integer);
	PORT (
		operatorA: IN  STD_LOGIC_VECTOR (nBits-1 DOWNTO 0);
		operatorB: IN  STD_LOGIC_VECTOR (nBits-1 DOWNTO 0);
		carryIn:   IN  STD_LOGIC;
		result:	  OUT STD_LOGIC_VECTOR (nBits-1 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT multiplexerNbits2ports
	GENERIC(nBits :integer);
    PORT(
        portA     : IN  STD_LOGIC_VECTOR (nBits-1 DOWNTO 0);
        portB     : IN  STD_LOGIC_VECTOR (nBits-1 DOWNTO 0);
        selectPort: IN  STD_LOGIC;
        muxOut    : OUT STD_LOGIC_VECTOR (nBits-1 DOWNTO 0));
	END COMPONENT;
	COMPONENT multiplexerNbits3ports 
   GENERIC(nBits :integer);
    PORT(
        portA     : IN  STD_LOGIC_VECTOR (nBits-1 DOWNTO 0);
        portB     : IN  STD_LOGIC_VECTOR (nBits-1 DOWNTO 0);
        portC     : IN  STD_LOGIC_VECTOR (nBits-1 DOWNTO 0);
        selectPort: IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
        muxOut    : OUT STD_LOGIC_VECTOR (nBits-1 DOWNTO 0));
	END COMPONENT;
	COMPONENT registerSelector32b
	PORT(
	    selectRegister :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
	    registerEnabled:OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT ualOperation PORT( 
	    FUNCT    :IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
	    operation:OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT ual32b PORT( 
	    OP  :IN  STD_LOGIC_VECTOR (2 DOWNTO 0);  --Entrada de dados usado para especificar qual a operaçao será realizada
        RS  :IN  STD_LOGIC_VECTOR (31 DOWNTO 0); --Entrada de dados do conteúdo do registrador RS
        RT  :IN  STD_LOGIC_VECTOR (31 DOWNTO 0); --Entrada de dados do conteúdo do registrador RT
        RD  :BUFFER STD_LOGIC_VECTOR (31 DOWNTO 0);--Saída de dados do resultado da operação realizada
        ZERO:OUT STD_LOGIC);
	END COMPONENT;

    COMPONENT registerBank32b PORT ( 
        CLOCK        :IN  STD_LOGIC;--Entrada de dados do sinal de clock do circuito
	RESET        :IN  STD_LOGIC;--Entrada de dados do sinal de reset do circuito
	writeRegister:IN  STD_LOGIC;--Entrada de dados do sinal de controle do estado de escrita 'ativo em nivel lógico alto '1''
        selectRS		 :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);  --Entrada de dados do endereço do registrador RT 'Fonte'
        selectRT		 :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);  --Entrada de dados do endereço do registrador RS 'Fonte'
        selectRD		 :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);  --Entrada de dados do endereço do registrador RD 'Destino'
        dataRD  		 :IN  STD_LOGIC_VECTOR (31 DOWNTO 0); --Entrada de dados do conteúdo do registrador RD  que será armazenado no banco
        dataRS  		 :OUT STD_LOGIC_VECTOR (31 DOWNTO 0); --Saída de dados do conteúdo do registrador RS que será utilizado nas operaçoes sa 
        dataRT  		 :OUT STD_LOGIC_VECTOR (31 DOWNTO 0));--Saída de dados do conteúdo do registrador RS que será utilizado nas operaçoes sa 
	END COMPONENT;
	
	COMPONENT multiplexer32bits32ports PORT(
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
	END COMPONENT;

    COMPONENT MEMER PORT( 
        --Sinais de controle
        CLOCK :IN STD_LOGIC;--Clock síncrono do sistema
	    RESET :IN STD_LOGIC;--Reset síncrono do sistema
	    --Sinais de entrada
	    readDataIn      :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);--dado a ser lido
	    ULAResultIn     :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);--resultado da ULA
	    writeRegisterIn :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);--dado a ser escrito
        --Sinais de saída
	    readDataOut      :OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    ULAResultOut     :OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    writeRegisterOut :OUT  STD_LOGIC_VECTOR (4 DOWNTO 0));
    END COMPONENT;
	
	COMPONENT EXMEM PORT(
	    --Sinais de controle
	    CLOCK :IN STD_LOGIC;--Clock síncrono do sistema
	    RESET :IN STD_LOGIC;--Reset síncrono do sistema
	    --Sinais de entrada
	    branchSumResultIn :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    ULAResultIn       :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    writeDataIn       :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    writeRegisterIn   :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
        --Sinais de saída
	    branchSumResultOut :OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    ULAResultOut       :OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    writeDataOut       :OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    writeRegisterOut   :OUT  STD_LOGIC_VECTOR (4 DOWNTO 0));
	END COMPONENT;
    
    COMPONENT DIEX  PORT( 
        --Sinais de controle
	    CLOCK :IN STD_LOGIC;--Clock síncrono do sistema
	    RESET :IN STD_LOGIC;--Reset síncrono do sistema
	    --Sinais de entrada
	    nextInstructionIn :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    readData1In       :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    readData2In       :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    signalExtensionIn :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    instruction2016In :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
	    instruction1511In :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
	    --Sinais de saída
	    nextInstructionOut :Out  STD_LOGIC_VECTOR (31 DOWNTO 0);
        readData1Out       :Out  STD_LOGIC_VECTOR (31 DOWNTO 0);
        readData2Out       :Out  STD_LOGIC_VECTOR (31 DOWNTO 0);
        signalExtensionOut :Out  STD_LOGIC_VECTOR (31 DOWNTO 0);
        instruction2016Out :Out  STD_LOGIC_VECTOR (4 DOWNTO 0);
        instruction1511Out :Out  STD_LOGIC_VECTOR (4 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT BIDI  PORT( 
        --Sinais de controle
	    CLOCK :IN STD_LOGIC;--Clock síncrono do sistema
	    RESET :IN STD_LOGIC;--Reset síncrono do sistema
	    --Sinais de entrada
	    nextInstructionIn :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 instructionIn     :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	    --Sinais de saída
	    nextInstructionOut:OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		 instructionOut    :OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;
	
    COMPONENT controlUnit PORT( 
	    OPCODE     :IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
            controlOut :OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
            resetDI    :OUT STD_LOGIC;
    END COMPONENT;
    
    COMPONENT controlDIEX PORT( 
        CLOCK :IN STD_LOGIC;
	    RESET :IN STD_LOGIC;
	    controlDIEXIn    :IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
        controlDIEXOut   :OUT STD_LOGIC_VECTOR(8 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT controlMEMER PORT( 
        CLOCK :IN STD_LOGIC;
	    RESET :IN STD_LOGIC;
	    controlMEMERIn    :IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        controlMEMEROut   :OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT controlEXMEM PORT( 
        CLOCK :IN STD_LOGIC;
	    RESET :IN STD_LOGIC;
	    controlEXMEMIn    :IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
        controlEXMEMOut   :OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT dataMemory PORT(
	    CLOCK: in std_logic;
	    readWriteEnable: in std_logic;
	    writeData: in std_logic_vector(31 downto 0);
	    readData: out std_logic_vector(31 downto 0);
	    memoryAddress: in std_logic_vector(31 downto 0));
    END COMPONENT;
    
    COMPONENT instructionMemory PORT(
	    CLOCK: in std_logic;
	    instructionAddress: in std_logic_vector(31 downto 0);
		 readData: out std_logic_vector(31 downto 0));
    END COMPONENT;
    COMPONENT unitOfConflictDetection PORT(
        DIEXWriteMemory :IN STD_LOGIC;
        DIEXRegisterRT  :IN STD_LOGIC_VECTOR(4 downto 0);
        BIDIRegisterRT  :IN STD_LOGIC_VECTOR(4 downto 0);
        BIDIRegisterRS  :IN STD_LOGIC_VECTOR(4 downto 0);
        enableBIDI        :OUT STD_LOGIC;
        enablePC          :OUT STD_LOGIC;
        enableControlUnit :OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT leftShifter2b 
    GENERIC( n : INTEGER); 
    PORT(
        dataIn      :IN  STD_LOGIC_VECTOR(n-1 downto 0);
	shiftedData :OUT STD_LOGIC_VECTOR(n-1 downto 0));
    END COMPONENT;
    COMPONENT dataComparatorNbits 
    GENERIC (n :INTEGER);
    PORT( 
        portA      :IN  STD_LOGIC_VECTOR(n-1 downto 0);
        portB      :IN  STD_LOGIC_VECTOR(n-1 downto 0);
        result     :OUT STD_LOGIC);
    END COMPONENT;
    COMPONENT signalExtender16bTo32b PORT( 
        dataIn       :IN  STD_LOGIC_VECTOR(15 downto 0);
        extendedData :OUT STD_LOGIC_VECTOR(31 downto 0));
    END COMPONENT;
END MIPSPipelinePackage;