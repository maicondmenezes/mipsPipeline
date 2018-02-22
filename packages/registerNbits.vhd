--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computação
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes e Rafael Borba
--Projeto: Trabalho Prático V
--Módulo: registrador de N bits 
--Descrição:

library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY registerNbits IS
	GENERIC ( 
		n : INTEGER := 4); 
	PORT ( 
            clock:IN  STD_LOGIC; 
            reset:IN  STD_LOGIC;
            enable:IN  STD_LOGIC;   
		data: IN  STD_LOGIC_VECTOR (n-1 DOWNTO 0); 
		q    :OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)); 
END registerNbits;

ARCHITECTURE archRegisterNbits OF registerNbits IS 
BEGIN 
	PROCESS(reset, clock, enable) 
	BEGIN 
		IF reset = '1' THEN 
			q <= (OTHERS => '0'); 
		ELSIF clock'EVENT AND clock = '1' THEN 
                    IF  enable = '1' THEN q <= data; 
						  END IF;
		END IF; 
	END PROCESS; 
END archRegisterNbits;