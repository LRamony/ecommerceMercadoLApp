class Admin < ApplicationRecord

  #Constantes
  ROLES  = {:full_access => 0, :restricted_access => 1}

  #Enums
  enum role: ROLES 

  #scope
  # scope :with_full_access, -> { where(role: ROLES[:full_access] ) } #uso de lambda para criar scope
  # scope :with_restricted_access, -> { where(role: ROLES[:restricted_access]) } #uso de lambda para criar scope

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def role_br
  #   if self.role == "full_access"
  #     'Acesso Completo'
  #   else
  #     'Acesso Restrito'
  #   end
  # end         
end
