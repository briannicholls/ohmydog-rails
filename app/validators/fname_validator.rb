class FnameValidator < ActiveModel::Validator
  def validate(record)
    if record.fname.empty?
      #record.errors.messages.transform_keys! { |key|
      #  if key && key.to_s == 'fname'
      #    'First name'
      #  end
      #}.deep_symbolize_keys!

      record.errors[:fname] << "You must have a first name... right?"
    end
  end
end
