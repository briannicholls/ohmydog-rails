class LnameValidator < ActiveModel::Validator
  def validate(record)
    if record.lname.empty?
      #record.errors.messages.transform_keys!{ |key| 'First name' if key.to_s == 'fname' }
      record.errors[:lname] << "You must have a last name... right?"
    end
  end
end
