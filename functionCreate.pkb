// criação da function
CREATE OR REPLACE FUNCTION obter_descricao_segmercado
    (p_id IN segmercado.id%type)  // busca tipo na tabela
    RETURN segmercado.descricao%type
IS
    v_descricao segmercado.descricao%type;
BEGIN
    SELECT descricao INTO v_descricao
        FROM segmercado
        WHERE id = p_id;
    RETURN v_descricao;
END;	

// exemplo de execução
SET SERVEROUTPUT ON
DECLARE
    v_descricao segmercado.descricao%type;
BEGIN
    v_descricao := obter_descricao_segmercado(2);
    dbms_output.put_line('Descricao: '||v_descricao);
END;

// exemplo com nomeação de parametro
DECLARE
    v_id segmercado.id%type;
	v_descricao segmercado.descricao%type;
BEGIN
    v_id := 2;
    v_descricao := obter_descricao_segmercado(2);(p_id => v_id);
END;