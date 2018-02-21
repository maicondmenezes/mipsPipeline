--Universidade Federal de Pelotas--
--Unidade: CDTEC
--Curso: Ciência da computação
--Disciplina: Sistemas Digitais Avançados
--Prof°: Rafael Iankowski Soares
--Aluno: Maicon de Menezes
--Projeto: Trabalho Prático I
--Módulo: Multiplexador 2 para 1 de 32 bits
--Descrição: O código descreve o circuito de controle das operaçoes da UAL de acordo com as entradas do campo FUNCT
--respeitando a seguinte tabela:
library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity ULAControl is port( 
   FUNCT        :IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
   ULAOperation :IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
   operation:OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END  ULAControl;

ARCHITECTURE archULAControl OF ULAControl IS
BEGIN
	PROCESS(FUNCT, ULAOperation)
	BEGIN
	    IF ULAOperation = '00' THEN
	        operation <= "010";--Soma
	    ELSIF ULAOperation = '01' THEN
	        operation <= "110";--Subtraçao
	    ELSIF ULAOperation = '01' THEN
	        CASE FUNCT IS 
	            WHEN "100000" => operation <= "010";--Soma
			    WHEN "100010" => operation <= "110";--Subtraçao
			    WHEN "100100" => operation <= "000";--AND
			    WHEN "100101" => operation <= "001";--OR
			    WHEN "101010" => operation <= "111";--Atribui valor se menor
			    WHEN OTHERS   => operation <= "011";
		    END CASE;
		END CASE;
	END PROCESS;
	
END archULAControl;
	 