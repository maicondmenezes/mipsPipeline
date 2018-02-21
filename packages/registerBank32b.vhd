--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computação
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto: Trabalho Prático I
--Módulo: Banco de Registradores de 32 bits
--Descrição: O código descreve o circuito de um banco de 32 registradores de 32 bits cada, que executa a leitura dos 
--registradores(RS e RT) simultaneamente e a escrita do regitrador (RD). Possui 3 sinais de entrada de 5 bits para 
--definir os endereços dos registradores RS e RT e 1 de 32 bits para o conteúdo de dados do resgitrador RD, 
--2 sinais de saída de 32 bits que retornam o conteúdo dos registradores RS e RT, além do sinal de controle de escritas
-- que deve ser ativo para que uma escrita ocorra na transiçao ativa do CLOCK. Somando um total de 4 entradas 
--(3 para numeros de registradores e 1 para dados) e 2 saídas(ambas para dados).

library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity registerBank32b is port ( 
   CLOCK        :IN  STD_LOGIC;--Entrada de dados do sinal de clock do circuito
	RESET        :IN  STD_LOGIC;--Entrada de dados do sinal de reset do circuito
	writeRegister:IN  STD_LOGIC;--Entrada de dados do sinal de controle do estado de escrita 'ativo em nivel lógico alto '1''
	selectRS		 :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);  --Entrada de dados do endereço do registrador RT 'Fonte'
   selectRT		 :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);  --Entrada de dados do endereço do registrador RS 'Fonte'
   selectRD		 :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);  --Entrada de dados do endereço do registrador RD 'Destino'
   dataRD  		 :IN  STD_LOGIC_VECTOR (31 DOWNTO 0); --Entrada de dados do conteúdo do registrador RD  que será armazenado no banco
   dataRS  		 :OUT STD_LOGIC_VECTOR (31 DOWNTO 0); --Saída de dados do conteúdo do registrador RS que será utilizado nas operaçoes sa UAL
   dataRT  		 :OUT STD_LOGIC_VECTOR (31 DOWNTO 0));--Saída de dados do conteúdo do registrador RS que será utilizado nas operaçoes sa UAL
END registerBank32b;

ARCHITECTURE archRegisterBank32b OF registerBank32b IS
--SINAIS INTERMEDIÁRIOS
--Barramentos de conexão dos registradores ao multiplexador
	SIGNAL wireOfRegister00, wireOfRegister01, wireOfRegister02, wireOfRegister03, wireOfRegister04, wireOfRegister05,
		    wireOfRegister06, wireOfRegister07, wireOfRegister08, wireOfRegister09, wireOfRegister10, wireOfRegister11, 
			 wireOfRegister12, wireOfRegister13, wireOfRegister14, wireOfRegister15, wireOfRegister16, wireOfRegister17,
			 wireOfRegister18, wireOfRegister19, wireOfRegister20, wireOfRegister21, wireOfRegister22, wireOfRegister23,
			 wireOfRegister24, wireOfRegister25, wireOfRegister26, wireOfRegister27, wireOfRegister28, wireOfRegister29,
			 wireOfRegister30, wireOfRegister31 :STD_LOGIC_VECTOR (31 DOWNTO 0);

--Barramento de conexão do sinal habilitado no decodificador ao sinal de controle de escrita através da porta 'AND'  
	SIGNAL wireOfRegisterSelector:STD_LOGIC_VECTOR (31 DOWNTO 0);
--Barramento que habilita o registrador a ser escrito
	SIGNAL wireOfRegisterEnabled :STD_LOGIC_VECTOR (31 DOWNTO 0);

--COMPONENTES DO CIRCUITO

--Componente descrito no arquivo 'register32b.vhd'
COMPONENT register32b PORT( 
    CLOCK : IN  STD_LOGIC;
	 RESET : IN  STD_LOGIC;
	 DATA  : IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
    Q     : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END COMPONENT;

--Componente descrito no arquivo 'multiplexer32bits32ports.vhd'
COMPONENT multiplexer32bits32ports PORT(
--Barramentos de entrada dos registradores
	registerAddres00, registerAddres01, registerAddres02, registerAddres03, registerAddres04, registerAddres05,
	registerAddres06, registerAddres07, registerAddres08, registerAddres09, registerAddres10, registerAddres11,
	registerAddres12,	registerAddres13,	registerAddres14,	registerAddres15,	registerAddres16,	registerAddres17,
	registerAddres18,	registerAddres19,	registerAddres20,	registerAddres21,	registerAddres22,	registerAddres23,
	registerAddres24,	registerAddres25,	registerAddres26,	registerAddres27,	registerAddres28,	registerAddres29,
	registerAddres30,	registerAddres31 :IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	--Sinal entrada de seleçao do resgitrador a ser lido
	selectRegister	 :IN  STD_LOGIC_VECTOR (4 DOWNTO 0); 
	--Barramento de saida com o valor armazenado no resgistrador selecionado
	registerSelected:OUT STD_LOGIC_VECTOR (31 DOWNTO 0));	
END COMPONENT;

--Componente descrito no arquivo 'registerSelector32b.vhd'
COMPONENT registerSelector32b is port(
	selectRegister :IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
	registerEnabled:OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END COMPONENT;

BEGIN
	--Implementaçao dos 32 registradores, com sinal de RESET síncrono,
	REGISTER00:register32b PORT MAP(wireOfRegisterEnabled(00), RESET, dataRD, wireOfRegister00);
	REGISTER01:register32b PORT MAP(wireOfRegisterEnabled(01), RESET, dataRD, wireOfRegister01);
	REGISTER02:register32b PORT MAP(wireOfRegisterEnabled(02), RESET, dataRD, wireOfRegister02);
	REGISTER03:register32b PORT MAP(wireOfRegisterEnabled(03), RESET, dataRD, wireOfRegister03);
	REGISTER04:register32b PORT MAP(wireOfRegisterEnabled(04), RESET, dataRD, wireOfRegister04);
	REGISTER05:register32b PORT MAP(wireOfRegisterEnabled(05), RESET, dataRD, wireOfRegister05);
	REGISTER06:register32b PORT MAP(wireOfRegisterEnabled(06), RESET, dataRD, wireOfRegister06);
	REGISTER07:register32b PORT MAP(wireOfRegisterEnabled(07), RESET, dataRD, wireOfRegister07);
	REGISTER08:register32b PORT MAP(wireOfRegisterEnabled(08), RESET, dataRD, wireOfRegister08);
	REGISTER09:register32b PORT MAP(wireOfRegisterEnabled(09), RESET, dataRD, wireOfRegister09);
	REGISTER10:register32b PORT MAP(wireOfRegisterEnabled(10), RESET, dataRD, wireOfRegister10);
	REGISTER11:register32b PORT MAP(wireOfRegisterEnabled(11), RESET, dataRD, wireOfRegister11);
	REGISTER12:register32b PORT MAP(wireOfRegisterEnabled(12), RESET, dataRD, wireOfRegister12);
	REGISTER13:register32b PORT MAP(wireOfRegisterEnabled(13), RESET, dataRD, wireOfRegister13);
	REGISTER14:register32b PORT MAP(wireOfRegisterEnabled(14), RESET, dataRD, wireOfRegister14);
	REGISTER15:register32b PORT MAP(wireOfRegisterEnabled(15), RESET, dataRD, wireOfRegister15);
	REGISTER16:register32b PORT MAP(wireOfRegisterEnabled(16), RESET, dataRD, wireOfRegister16);
	REGISTER17:register32b PORT MAP(wireOfRegisterEnabled(17), RESET, dataRD, wireOfRegister17);
	REGISTER18:register32b PORT MAP(wireOfRegisterEnabled(18), RESET, dataRD, wireOfRegister18);
	REGISTER19:register32b PORT MAP(wireOfRegisterEnabled(19), RESET, dataRD, wireOfRegister19);
	REGISTER20:register32b PORT MAP(wireOfRegisterEnabled(20), RESET, dataRD, wireOfRegister20);
	REGISTER21:register32b PORT MAP(wireOfRegisterEnabled(21), RESET, dataRD, wireOfRegister21);
	REGISTER22:register32b PORT MAP(wireOfRegisterEnabled(22), RESET, dataRD, wireOfRegister22);
	REGISTER23:register32b PORT MAP(wireOfRegisterEnabled(23), RESET, dataRD, wireOfRegister23);
	REGISTER24:register32b PORT MAP(wireOfRegisterEnabled(24), RESET, dataRD, wireOfRegister24);
	REGISTER25:register32b PORT MAP(wireOfRegisterEnabled(25), RESET, dataRD, wireOfRegister25);
	REGISTER26:register32b PORT MAP(wireOfRegisterEnabled(26), RESET, dataRD, wireOfRegister26);
	REGISTER27:register32b PORT MAP(wireOfRegisterEnabled(27), RESET, dataRD, wireOfRegister27);
	REGISTER28:register32b PORT MAP(wireOfRegisterEnabled(28), RESET, dataRD, wireOfRegister28);
	REGISTER29:register32b PORT MAP(wireOfRegisterEnabled(29), RESET, dataRD, wireOfRegister29);
	REGISTER30:register32b PORT MAP(wireOfRegisterEnabled(30), RESET, dataRD, wireOfRegister30);
	REGISTER31:register32b PORT MAP(wireOfRegisterEnabled(31), RESET, dataRD, wireOfRegister31);

	--Implementação das portas de leitura do banco
	--Leitura do registrador RS
	muxRS:multiplexer32bits32ports PORT MAP(wireOfRegister00, wireOfRegister01, wireOfRegister02, wireOfRegister03,
														 wireOfRegister04, wireOfRegister05, wireOfRegister06, wireOfRegister07,
	                                        wireOfRegister08, wireOfRegister09, wireOfRegister10, wireOfRegister11,
														 wireOfRegister12, wireOfRegister13, wireOfRegister14, wireOfRegister15,
														 wireOfRegister16, wireOfRegister17, wireOfRegister18, wireOfRegister19,
														 wireOfRegister20, wireOfRegister21, wireOfRegister22, wireOfRegister23,
														 wireOfRegister24, wireOfRegister25, wireOfRegister26, wireOfRegister27,
														 wireOfRegister28, wireOfRegister29, wireOfRegister30, wireOfRegister31,
														 selectRS, dataRS);
	--Leitura do registrador RT	 
	muxRT:multiplexer32bits32ports PORT MAP(wireOfRegister00, wireOfRegister01, wireOfRegister02, wireOfRegister03,
														 wireOfRegister04, wireOfRegister05, wireOfRegister06, wireOfRegister07,
	                                        wireOfRegister08, wireOfRegister09, wireOfRegister10, wireOfRegister11,
														 wireOfRegister12, wireOfRegister13, wireOfRegister14, wireOfRegister15,
														 wireOfRegister16, wireOfRegister17, wireOfRegister18, wireOfRegister19,
														 wireOfRegister20, wireOfRegister21, wireOfRegister22, wireOfRegister23,
														 wireOfRegister24, wireOfRegister25, wireOfRegister26, wireOfRegister27,
														 wireOfRegister28, wireOfRegister29, wireOfRegister30, wireOfRegister31,
														 selectRT, dataRT);
	--Implementação da porta de escrita do banco
	registerSelector: registerselector32b PORT MAP(selectRD, wireOfRegisterSelector);
	wireOfRegisterEnabled(00) <= (wireOfRegisterSelector(00) AND writeRegister);
	wireOfRegisterEnabled(01) <= (wireOfRegisterSelector(01) AND writeRegister);
	wireOfRegisterEnabled(02) <= (wireOfRegisterSelector(02) AND writeRegister);
	wireOfRegisterEnabled(03) <= (wireOfRegisterSelector(03) AND writeRegister);
	wireOfRegisterEnabled(04) <= (wireOfRegisterSelector(04) AND writeRegister);
	wireOfRegisterEnabled(05) <= (wireOfRegisterSelector(05) AND writeRegister);
	wireOfRegisterEnabled(06) <= (wireOfRegisterSelector(06) AND writeRegister);
	wireOfRegisterEnabled(07) <= (wireOfRegisterSelector(07) AND writeRegister);
	wireOfRegisterEnabled(08) <= (wireOfRegisterSelector(08) AND writeRegister);
	wireOfRegisterEnabled(09) <= (wireOfRegisterSelector(09) AND writeRegister);
	wireOfRegisterEnabled(10) <= (wireOfRegisterSelector(10) AND writeRegister);
	wireOfRegisterEnabled(11) <= (wireOfRegisterSelector(11) AND writeRegister);
	wireOfRegisterEnabled(12) <= (wireOfRegisterSelector(12) AND writeRegister);
	wireOfRegisterEnabled(13) <= (wireOfRegisterSelector(13) AND writeRegister);
	wireOfRegisterEnabled(14) <= (wireOfRegisterSelector(14) AND writeRegister);
	wireOfRegisterEnabled(15) <= (wireOfRegisterSelector(15) AND writeRegister);
	wireOfRegisterEnabled(16) <= (wireOfRegisterSelector(16) AND writeRegister);
	wireOfRegisterEnabled(17) <= (wireOfRegisterSelector(17) AND writeRegister);
	wireOfRegisterEnabled(18) <= (wireOfRegisterSelector(18) AND writeRegister);
	wireOfRegisterEnabled(19) <= (wireOfRegisterSelector(19) AND writeRegister);
	wireOfRegisterEnabled(20) <= (wireOfRegisterSelector(20) AND writeRegister);
	wireOfRegisterEnabled(21) <= (wireOfRegisterSelector(21) AND writeRegister);
	wireOfRegisterEnabled(22) <= (wireOfRegisterSelector(22) AND writeRegister);
	wireOfRegisterEnabled(23) <= (wireOfRegisterSelector(23) AND writeRegister);
	wireOfRegisterEnabled(24) <= (wireOfRegisterSelector(24) AND writeRegister);
	wireOfRegisterEnabled(25) <= (wireOfRegisterSelector(25) AND writeRegister);
	wireOfRegisterEnabled(26) <= (wireOfRegisterSelector(26) AND writeRegister);
	wireOfRegisterEnabled(27) <= (wireOfRegisterSelector(27) AND writeRegister);
	wireOfRegisterEnabled(28) <= (wireOfRegisterSelector(28) AND writeRegister);
	wireOfRegisterEnabled(29) <= (wireOfRegisterSelector(29) AND writeRegister);
	wireOfRegisterEnabled(30) <= (wireOfRegisterSelector(30) AND writeRegister);
	wireOfRegisterEnabled(31) <= (wireOfRegisterSelector(31) AND writeRegister);
	
END archRegisterBank32b;