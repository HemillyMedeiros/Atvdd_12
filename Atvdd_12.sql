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

-- Função para transferir dinheiro entre contas:
def fn_transferir(codigo_cliente_remetente, codigo_conta_remetente, codigo_cliente_destinatario, codigo_conta_destinatario, valor_transferencia):
    try:
        saldo_remetente = dados_clientes[codigo_cliente_remetente]['contas'][codigo_conta_remetente]
        saldo_destinatario = dados_clientes[codigo_cliente_destinatario]['contas'][codigo_conta_destinatario]

        if saldo_remetente >= valor_transferencia and valor_transferencia > 0:
            dados_clientes[codigo_cliente_remetente]['contas'][codigo_conta_remetente] -= valor_transferencia
            dados_clientes[codigo_cliente_destinatario]['contas'][codigo_conta_destinatario] += valor_transferencia
            return True
        else:
            print("Transferência não permitida. Saldo insuficiente.")
            return False
    except KeyError:
        print("Cliente, conta remetente ou conta destinatário não encontrados.")
        return False

-- Testando as funções com blocos anônimos:
if __name__ == "__main__":
    # Teste da função fn_consultar_saldo
    saldo_conta = fn_consultar_saldo(1, 101)
    if saldo_conta is not None:
        print(f"Saldo da conta: {saldo_conta}")

    # Teste da função fn_transferir
    transferencia_sucesso = fn_transferir(1, 101, 2, 201, 300)
    if transferencia_sucesso:
        print("Transferência realizada com sucesso.")