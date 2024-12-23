object dmIniciarCorte: TdmIniciarCorte
  Height = 480
  Width = 688
  object qyOrdemIniciarCorte: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'select oc_situacao from ordem_corte where oc_id = 8132')
    Left = 64
    Top = 8
  end
  object qyPrevisto: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      
        'select oci_idocorte, oci_dtlanc, oci_hrlanc, oci_codusulanc, oci' +
        '_situacao_id, descricao, us_nome from ordem_corte_itens_previsto' +
        ', usuario, ordem_corte_itens_situacao'
      'where oci_codusulanc = us_id and oci_situacao_id = id;')
    Left = 184
    Top = 8
  end
  object qyDadosCorteById: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 296
    Top = 8
  end
  object qyOrdemDeCorte: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'select * from ordem_corte; ')
    Left = 416
    Top = 8
  end
  object qyGradeModificada: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'SELECT'
      #9'(fti.fti_id) AS itemId,'
      #9'(ftq.fti_id) gradeId'
      #9'FROM ficha_tecnica_itens AS fti'
      
        #9'LEFT JOIN ficha_tecnica_qtdtamanho AS ftq ON fti.fti_cortecidoi' +
        'dgrade = ftq.fti_cortecidoidgrade'
      #9'AND ftq.fti_idfichatec = fti.fti_idfichatec'
      #9'WHERE fti.fti_idfichatec='#39'5234'#39' '
      '        AND fti.fti_tipo='#39'P'#39
      '        AND fti.fti_tecido='#39'A'#39
      '        AND fti.fti_status<>'#39'C'#39)
    Left = 528
    Top = 8
  end
  object qyGradeFicha: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 64
    Top = 80
  end
  object qyFichaId: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 176
    Top = 80
  end
  object qyFichaSemGrade: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 280
    Top = 80
  end
  object qyLinha120: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'SELECT (TRUE) AS existe FROM ficha_tecnica_itens AS fti'
      #9'JOIN ficha_tecnica AS ft ON ft.fi_id = fti.fti_idfichatec'
      
        #9'JOIN produto_acabado AS pa ON pa.cad_id = ft.fi_idprodutoacabad' +
        'o'
      #9'JOIN tipo_tecido AS tt ON tt.tec_id = pa.cad_idtipotecido'
      #9'WHERE ('
      
        #9#9#9'(SELECT conf_idsubgrupotecjeans_cadprod FROM configuracao LIM' +
        'IT 1)=tt.tec_id OR'
      
        #9#9#9'(SELECT conf_idsubgrupotecsarja_cadprod FROM configuracao LIM' +
        'IT 1)=tt.tec_id'
      #9#9'  )'
      #9'AND fti.fti_status<>'#39'C'#39
      #9'AND fti.fti_idproduto=2296'
      #9'AND fti.fti_idgradetam=439'
      #9'And EXISTS ('
      
        #9#9'SELECT * FROM ficha_tecnica_itensfase AS ftf WHERE ftf.ftf_idi' +
        'temfichatecnica=fti.fti_id'
      #9#9'AND ftf.ftf_idfaseproducao=10'
      #9#9#9'   )'
      #9#9'AND fti.fti_idfichatec=5142'
      #9#9)
    Left = 392
    Top = 80
  end
  object qyFaseInformada: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'select * from ficha_tecnica_itens where fti_idfichatec = '#39'5233'#39
      
        'and fti_status = '#39'N'#39' and fti_tecido = '#39'N'#39' and fti_id not in(sele' +
        'ct ftf_iditemfichatecnica from ficha_tecnica_itensfase);')
    Left = 504
    Top = 80
  end
  object qyFichaPrototipo: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'select * from ficha_tecnica_prototipo where fp_idfichatec = 5229')
    Left = 64
    Top = 168
  end
  object qyCorGradeProt: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'SELECT'
      #9'*'
      #9'FROM ficha_tecnica_itens, ficha_tecnica_prototipo'
      #9'WHERE fti_idfichatec = '#39'5231'#39
      #9'AND fp_idfichatec = '#39'5231'#39
      #9'AND fti_status='#39'N'#39
      #9'AND fti_tipo='#39'P'#39
      #9'AND fti_cortecidoidgrade = fp_cortecido'
      #9'AND'
      #9#9'('
      
        #9#9#9'fti_tam1=fp_tamanho OR fti_tam2=fp_tamanho OR fti_tam3=fp_tam' +
        'anho OR fti_tam4=fp_tamanho OR fti_tam5=fp_tamanho OR'
      
        #9#9' '#9'fti_tam6 =fp_tamanho OR fti_tam7=fp_tamanho OR fti_tam8=fp_t' +
        'amanho OR fti_tam9=fp_tamanho OR fti_tam10=fp_tamanho OR'
      
        #9#9#9'fti_tam11=fp_tamanho OR fti_tam12=fp_tamanho OR fti_tam13=fp_' +
        'tamanho OR fti_tam14=fp_tamanho OR fti_tam15=fp_tamanho'
      #9#9')')
    Left = 176
    Top = 168
  end
  object qyTecidoPrincipal: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      
        'SELECT fti_cortecidoidgrade, count(fti_id) as qtdPrincipal FROM ' +
        'ficha_tecnica_itens'
      '      WHERE fti_idfichatec = '#39'5234'#39' AND'
      '      fti_tipo ='#39'P'#39' AND'
      '      fti_status='#39'N'#39
      '      GROUP BY fti_cortecidoidgrade')
    Left = 288
    Top = 168
  end
  object qyRefArtigoCor: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 400
    Top = 168
  end
  object qyAviamentosPorFicha: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 520
    Top = 168
  end
  object qyEstoqueSemReservaProt: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 64
    Top = 248
  end
  object qyCortePorTipoFichaId: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 208
    Top = 248
  end
  object dsOrdemdeCorte: TDataSource
    Left = 440
    Top = 248
  end
  object tbOrdemdeCorte: TFDTable
    Active = True
    IndexFieldNames = 'oc_id'
    MasterSource = dsOrdemdeCorte
    Connection = dmOrdemCorte.Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'ordem_corte'
    Left = 328
    Top = 248
  end
  object qyGEComOuSemProt: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 560
    Top = 248
  end
  object qyConsumoFaseGE: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 64
    Top = 320
  end
  object qyFichaFaseGE: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 176
    Top = 320
  end
  object qyItensFichaPrevisto: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 288
    Top = 320
  end
  object tbOrdemCorteItensPrevisto: TFDTable
    IndexFieldNames = 'oci_id'
    Connection = dmOrdemCorte.Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'ordem_corte_itens_previsto'
    Left = 432
    Top = 320
  end
  object qyOrdemCorteProtFase: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 592
    Top = 320
  end
  object tbOrdemCorteProtFase: TFDTable
    IndexFieldNames = 'ocpf_id'
    Connection = dmOrdemCorte.Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'ordem_corte_prototipo_fase'
    Left = 56
    Top = 400
  end
  object qyDefinirPrevistoGE: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 192
    Top = 400
  end
  object qyTemOrdPrototipo: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 320
    Top = 400
  end
  object qyChecaReserva: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 440
    Top = 400
  end
  object qyUserOrdem2: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 560
    Top = 400
  end
end
