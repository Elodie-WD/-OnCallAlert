class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :department
  validates :last_name, presence: true
  validates :first_name, presence: true
  # validates :address, presence: true
  # validates :phone_number, presence: true
  # validates :job_title, presence: true
  # validates :grade, presence: true, inclusion: { in: %w(Professeur(e) Docteur(e) Mme M)}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  enum :deplacement, { uncalled: 0, called: 1, accepted: 2, rejected: 3 }

  def next_booking(on_call)
    next_bookings = bookings.where(on_call: on_call)
    next_bookings.first.date.to_date == Date.today ? next_bookings.second : next_bookings.first
  end

  def notifs?
    self.department&.chatrooms
        &.find_by(date: Date.today)
        &.messages
        &.where&.not(user: self)
        &.map(&:viewed)
        &.include?(nil)
  end

end
