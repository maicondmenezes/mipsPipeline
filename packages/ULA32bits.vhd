--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computação
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto: Trabalho Prático I
--Módulo: Banco de Registradores de 32 bits
--Descrição: O código descreve o circuito de uma ULA que executa as seguintes operaçoes sobre 2 operadores de 32 bits cada:
--Soma,
--Subtração,
--(RS.RT)+!RS,
--AND,
--OR, 
--NOT.
--Possui 2 sinais de entrada de 32 bits que contém os dados dos operadores, um sinal de controle de 3 bits para 
--especificar qual operaçao será realizada sobre os operadores, um sinal de saída de 32 bits que retorna o resultado da
--operaçao, além de um sinal de flag que é ativo sempre que o resultado da operaçao for igual a 0.

library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ULA32bits is port( 
   OP  :IN  STD_LOGIC_VECTOR (2 DOWNTO 0);  --Entrada de dados usado para especificar qual a operaçao será realizada
   RS  :IN  STD_LOGIC_VECTOR (31 DOWNTO 0); --Entrada de dados do conteúdo do registrador RS
   RT  :IN  STD_LOGIC_VECTOR (31 DOWNTO 0); --Entrada de dados do conteúdo do registrador RT
   RD  :OUT STD_LOGIC_VECTOR (31 DOWNTO 0);--Saída de dados do resultado da operação realizada
   ZERO:OUT STD_LOGIC); --Flag de controle acionado quando o resultado da operaçao for igual a '0'
END ULA32bits;

ARCHITECTURE archULA32bits OF ULA32bits IS

BEGIN
	PROCESS (OP, RS, RT, RD)
    BEGIN
       CASE OP IS
            WHEN"010"=>RD<=RS+RT;                --Soma
            WHEN"110"=>RD<=RS-RT;                --Subtraçao  
            WHEN"000"=>RD<=RS AND RT;            --AND
            WHEN"001"=>RD<=RS OR RT;			 --OR
            WHEN"111"=>RD<=NOT(RT);				 --NOT(RT)
            WHEN OTHERS =>RD<="00000000000000000000000000000000";
        END CASE;
	END PROCESS;
	WITH RD SELECT
    	ZERO <= '1' WHEN "00000000000000000000000000000000";
    	ZERO <= '0' WHEN OTHERS;

END archULA32bits;