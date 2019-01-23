// in out -> trabalha com a referencia da variável realizando alterações, sem out é tratado como constante
CREATE OR REPLACE PROCEDURE FORMAT_CNPJ
    (p_cnpj IN out cliente.CNPJ%type)  // busca tipo na tabela
IS
BEGIN
    p_cnpj := substr(p_cnpj,1,2) ||'/'|| substr(p_cnpj,3);
END;

// exemplo aplicado 
SET SERVEROUTPUT ON
DECLARE
    v_cnpj cliente.cnpj%type;
BEGIN
	v_cnpj := '12345';
    FORMAT_CNPJ(v_cnpj);
    dbms_output.put_line('CNPJ: '||v_cnpj);
END;