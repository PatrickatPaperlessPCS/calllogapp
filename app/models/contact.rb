class Contact < ActiveRecord::Base

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |contact|
      csv << contact.attributes.values_at(*column_names)
    end
  end
end

	belongs_to :user
	has_one :host

scope :in_last_month, lambda { where("contacts.created_at > ? AND contacts.created_at < ?", Time.now.beginning_of_month - 1.month, Time.now.end_of_month - 1.month) }
scope :this_month, lambda { where("contacts.created_at > ? AND contacts.created_at < ?", Time.now.beginning_of_month, Time.now.end_of_month) }
scope :this_year, lambda { where("contacts.created_at > ? AND contacts.created_at < ?", Time.now.beginning_of_year, Time.now) }

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

  after_create :send_notification_email

  def send_notification_email
     if self.admin_email.present?
    ContactsMailer.email(self).deliver_later
  end
  end


end
