User.destroy_all
Role.destroy_all
Course.destroy_all

Role.create!([
  {
    name: 'admin',
    description: 'Администратор'
  },
  {
    name: 'user',
    description: 'Обучающийся пользователь'
  }
])

User.create!([
  {
    email: 'admin@mail.ru',
    password: '123456',
    role: Role.find_by(name: :admin)
  },
  {
    email: 'user1@mail.ru',
    password: '123456'
  }
])

Course.create!([
  {
    name: 'Курс 1',
    description: 'Основной курс'
  },
  {
    name: 'Курс 2',
    description: 'Расширеный курс'
  }
])

Course.find_each do |course|
  Theme.create!([
  {
    name: 'Тема 1',
    description: 'Базовая тема',
    content: 'Min consed quos que nonsequas quia arum fugiae odis et quisto omnia ducitatatiae nonet fugiae repta aliquatur se erroviditaes ant, illistio ipit, simus non rerehendi disimagnis volorumet rehentioreic tet fuga. Nemporeium qui venimilis et que rem ut volesent facearum volore volori sequiae velignaturia eveni.',
    course: course
  },
  {
    name: 'Тема 2',
    description: 'Углубленная тема.',
    content: 'Min consed quos que nonsequas quia arum fugiae odis et quisto omnia ducitatatiae nonet fugiae repta aliquatur se erroviditaes ant, illistio ipit, simus non rerehendi disimagnis volorumet rehentioreic tet fuga. Nemporeium qui venimilis et que rem ut volesent facearum volore volori sequiae velignaturia eveni.',
    course: course
  }
])
end

Course.first.user_courses.create(user: User.last)
