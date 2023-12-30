from src.models.schema_transacao import SchemaTabelaTransacao


def test_verificando_se_a_database_existe(SchemaTabelaTransacao):
    """ Teste simples de checagem de leitura do database é possível"""
    pass


def test_verificando_se_a_tabela_transacao_existe(SchemaTabelaTransacao):
    """ Teste simples de as tabelas existem"""
    pass

def test_veritificando_se_a_tabela_possui_schema(model : SchemaTabelaTransacao):
    """ Teste verificando o schema das tabelas"""
    pass

def test_veritificando_se_a_tabela_esta_atualizada(model : SchemaTabelaTransacao):
    """ Teste verificando se o max(data_transaction) da tabela é menor do que 2 dias"""
    pass

def test_veritificando_se_a_tabela_tem_todas_as_lojas(model : SchemaTabelaTransacao):
    """ Teste verificando se o max(data_transaction) da tabela é igual a 300"""
    pass

def test_veritificando_se_a_tabela_tem_ecommerce(model : SchemaTabelaTransacao):
    """ Teste verificando se o max(data_transaction) da tabela de ecommerce é igual a 1"""
    pass