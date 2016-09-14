class Contact < ActiveRecord::Base

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |contact|
      csv << contact.attributes.values_at(*column_names)
    end
  end
end

	has_one :user
	has_one :admin

REMINDER_TIME = 1

  def self.check_reminders
    contacts = where("followup_at >= ? and followup_at < ?", REMINDER_TIME.days.from_now.beginning_of_day, REMINDER_TIME.days.from_now.end_of_day)
    contacts.each do |contact|
      contact.send_reminder
    end
  end

  def send_reminder
	ContactsMailer.reminder(self)
  end
end
