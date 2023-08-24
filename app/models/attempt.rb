class Attempt < ActiveHash::Base
  self.data = [
    { id: 1, name: '------' },   
    { id: 2, name: 'バッティング' },
    { id: 3, name: '守備・フィールディング' },
    { id: 4, name: '走塁・ダッシュ' },
    { id: 5, name: 'ピッチング' },
    { id: 6, name: 'トレーニング・エクササイズ' },
    { id: 7, name: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :practices
 
  end