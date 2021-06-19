# the empty list for storing transactions on the blockchain
blockchain = []


def last_chain_value():
    """finds the last value on the current chain"""
    return blockchain[-1]


def add_value(amount, last_transaction=[1]):
    """adds/subtracts the previous value to the blockchain
by looking at the previous block"""
    blockchain.append([last_transaction, amount])



def get_user_input():
    """initiates allowing user input for the amount they want inserted,
    as a float value"""
    return float(input('How much currency you want to deposit?: '))


# adds user input values to the last transaction on the blockchain
# and stores that new information (transaction) on the chain
tx_amount = get_user_input()
add_value(tx_amount)

tx_amount = get_user_input()
add_value(last_transaction=last_chain_value(), amount=tx_amount)

tx_amount = get_user_input()
add_value(tx_amount, last_chain_value())

# displays the result
print(blockchain)
