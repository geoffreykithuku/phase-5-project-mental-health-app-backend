class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :appointment_time, :appointment_date, :issue, :prescription, :status
end
