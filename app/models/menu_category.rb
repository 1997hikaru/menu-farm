class MenuCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '主食' },
    { id: 3, name: 'おかず' },
    { id: 4, name: 'スープ' },
    { id: 5, name: 'お菓子' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :menus
end