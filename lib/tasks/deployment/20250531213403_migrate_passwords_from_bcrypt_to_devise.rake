namespace :after_party do
  desc 'Deployment task: migrate_passwords_from_bcrypt_to_devise'
  task migrate_passwords_from_bcrypt_to_devise: :environment do
    puts "Running deploy task 'migrate_passwords_from_bcrypt_to_devise'"

    User.find_each do |user|
      # Read the password_digest directly from attributes
      current_password_digest = user.read_attribute(:password_digest)

      if current_password_digest.present? && user.encrypted_password.blank?
        user.encrypted_password = current_password_digest # Assign the raw digest
        # Devise tracks password changes and resets.
        # It's good practice to ensure reset_password_sent_at has a value.
        # Setting it to user.created_at or Time.current if it's nil.
        user.reset_password_sent_at = user.reset_password_sent_at || user.created_at || Time.current
        if user.save(validate: false) # Skipping validations as we're just copying data
          puts "Migrated password for user: #{user.email}"
        else
          puts "Failed to migrate password for user: #{user.email}. Errors: #{user.errors.full_messages.join(', ')}"
        end
      elsif user.encrypted_password.present?
        puts "User #{user.email} already has an encrypted_password. Skipping."
      else
        puts "User #{user.email} does not have a password_digest (read_attribute). Skipping."
      end
    end
    puts "Password migration attempt complete."

    # Update task as completed.  If you remove the line below, the task will
    # run with every deploy (or every time you call after_party:run).
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end