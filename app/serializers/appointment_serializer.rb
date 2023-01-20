class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :appointment_time, :appointment_date, :issue, :prescription, :patient, :doctor, :status
end
