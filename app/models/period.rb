class Period < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '翌日発送' },
    { id: 3, name: '2~3日で発送' },
    { id: 4, name: '4~7日で発送' }
  ]
end
