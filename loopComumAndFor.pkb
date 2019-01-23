// criação de procedure para gravação de dados
CREATE OR REPLACE PROCEDURE ATUALIZAR_CLI_SEG_MERCADO
    (p_id cliente.id%type,
    p_segmercado_id IN cliente.segmercado_id%type)
IS
BEGIN
    UPDATE cliente
        SET segmercado_id = p_segmercado_id
        WHERE id = p_id;
    COMMIT;
END;

// utilizando loop comum para inserir os dados
DECLARE
    v_segmercado_id cliente.segmercado_id%type;
    v_i number(3);
BEGIN
        v_i := 1;
  LOOP
        ATUALIZAR_CLI_SEG_MERCADO(v_i, v_segmercado_id);
        v_i := v_i + 1;
        EXIT WHEN v_i > 3;
  END LOOP;
  COMMIT;
END;

// utilizando for
DECLARE
    v_segmercado_id cliente.segmercado_id%type := 2;
BEGIN
 FOR i in 1..3 LOOP
     ATUALIZAR_CLI_SEG_MERCADO(i, v_segmercado_id);
 END LOOP;
 COMMIT;
END;