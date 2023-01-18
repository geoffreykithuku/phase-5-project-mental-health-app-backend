class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password
end
