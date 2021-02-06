# +
import pandas as pd


class PandasUtils:
    def __init__(self):
        self.df = {}

    def read_excel(self, alias, filename):
        self.df[alias] = pd.read_excel(filename)

    def write_excel(self, alias, filename):
        self.df[alias].to_excel(filename, index = False)
        
    def filter_by_column_greater_than(self, alias, column, limit: int):
        df = self.df[alias]
        match_df = (df[column] > limit)
        self.df[alias] = df[match_df]

    def merge_by_column(self, alias1, alias2, alias_result, column):
        df1 = self.df[alias1]
        df2 = self.df[alias2]
        self.df[alias_result] = pd.merge(df1, df2, on=column)
    
    def get_data_as_dict(self, alias):
        return self.df[alias].to_dict('records')
# -


