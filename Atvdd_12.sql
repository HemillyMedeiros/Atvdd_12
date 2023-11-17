--Definindo uma estrutura de dados simulada
dados_clientes = {
    1: {'contas': {101: 1000, 102: 500}},
    2: {'contas': {201: 1500, 202: 200}},
}
--Função para consultar saldo:
def fn_consultar_saldo(codigo_cliente, codigo_conta):
    try:
        saldo = dados_clientes[codigo_cliente]['contas'][codigo_conta]
        return saldo
    except KeyError:
        print("Cliente ou conta não encontrados.")
        return None