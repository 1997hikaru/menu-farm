class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '野菜' },
    { id: 3, name: '肉' },
    { id: 4, name: '魚介' },
    { id: 5, name: '果物' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
  end