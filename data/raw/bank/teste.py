import pandas as pd

bank = pd.read_csv('/home/nayara/Downloads/eng_dados/estudo/projetos/dbt-bank-marketing/data/raw/bank/bank-full.csv', delimiter=';', quotechar='"')

print(bank.shape)


# Supondo que bank seja o seu DataFrame
bank['customer_id'] = bank['age'].astype(str) + '_' + bank['job'] + '_' + bank['education'] + '_' + bank['contact']+'_' + bank['housing'] +'_' + bank['loan'] + '_' + bank['marital'] + '_' + bank['balance'].astype(str)
# Agora, bank['customer_id'] deve conter o identificador único para cada cliente

bank['customer_id'].value_counts()
print(bank['customer_id'].value_counts())