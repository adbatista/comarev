admin = User.where(email: 'admin@example.com').first_or_create(
  password: '123456',
  full_name: 'Admin test',
  cpf: FFaker::IdentificationBR.cpf,
  cellphone: FFaker.numerify('###############'),
  address: FFaker::Address.street_address,
  admin: true
)

manager = User.where(email: 'manager@example.com').first_or_create(
  password: '123456',
  full_name: 'Manager test',
  cpf: FFaker::IdentificationBR.cpf,
  cellphone: FFaker.numerify('###############'),
  address: FFaker::Address.street_address
)

regular = User.where(email: 'regular@example.com').first_or_create(
  password: '123456',
  full_name: 'Regular test',
  cpf: FFaker::IdentificationBR.cpf,
  cellphone: FFaker.numerify('###############'),
  address: FFaker::Address.street_address
)

company = Company.where(name: 'Company test').first_or_create(
  cnpj: FFaker::IdentificationBR.cnpj,
  phone: FFaker.numerify('##############'),
  active: true
)

company.managers << manager if company.managers.empty?
company.regulars << regular if company.regulars.empty?
