class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :issue, :appointment_time, :status, :prescription
end
