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
library packages;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use packages.MIPSPipelinePackage.ALL;

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
BEGIN
	--Implementaçao dos 32 registradores, com sinal de RESET síncrono,
	REGISTER00:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(00),dataRD, wireOfRegister00);
	REGISTER01:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(01),dataRD, wireOfRegister01);
	REGISTER02:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(02),dataRD, wireOfRegister02);
	REGISTER03:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(03),dataRD, wireOfRegister03);
	REGISTER04:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(04),dataRD, wireOfRegister04);
	REGISTER05:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(05),dataRD, wireOfRegister05);
	REGISTER06:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(06),dataRD, wireOfRegister06);
	REGISTER07:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(07),dataRD, wireOfRegister07);
	REGISTER08:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(08),dataRD, wireOfRegister08);
	REGISTER09:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(09),dataRD, wireOfRegister09);
	REGISTER10:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(10),dataRD, wireOfRegister10);
	REGISTER11:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(11),dataRD, wireOfRegister11);
	REGISTER12:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(12),dataRD, wireOfRegister12);
	REGISTER13:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(13),dataRD, wireOfRegister13);
	REGISTER14:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(14),dataRD, wireOfRegister14);
	REGISTER15:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(15),dataRD, wireOfRegister15);
	REGISTER16:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(16),dataRD, wireOfRegister16);
	REGISTER17:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(17),dataRD, wireOfRegister17);
	REGISTER18:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(18),dataRD, wireOfRegister18);
	REGISTER19:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(19),dataRD, wireOfRegister19);
	REGISTER20:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(20),dataRD, wireOfRegister20);
	REGISTER21:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(21),dataRD, wireOfRegister21);
	REGISTER22:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(22),dataRD, wireOfRegister22);
	REGISTER23:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(23),dataRD, wireOfRegister23);
	REGISTER24:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(24),dataRD, wireOfRegister24);
	REGISTER25:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(25),dataRD, wireOfRegister25);
	REGISTER26:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(26),dataRD, wireOfRegister26);
	REGISTER27:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(27),dataRD, wireOfRegister27);
	REGISTER28:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(28),dataRD, wireOfRegister28);
	REGISTER29:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(29),dataRD, wireOfRegister29);
	REGISTER30:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(30),dataRD, wireOfRegister30);
	REGISTER31:registerNbits GENERIC MAP(32) PORT MAP(CLOCK, RESET, wireOfRegisterEnabled(31),dataRD, wireOfRegister31);

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