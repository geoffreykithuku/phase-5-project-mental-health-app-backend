class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :appointment_time, :issue, :prescription, :status
end
