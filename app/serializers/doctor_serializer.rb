class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :specialty, :email
end
