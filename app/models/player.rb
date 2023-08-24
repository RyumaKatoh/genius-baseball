class Player < ActiveHash::Base
  self.data = [
    { id: 1, name: '------' },   
    { id: 2, name: '野手' },
    { id: 3, name: '投手' },
    { id: 4, name: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :practices
 
  end