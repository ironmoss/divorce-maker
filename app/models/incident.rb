class Incident < ActiveRecord::Base

  belongs_to :user
  belongs_to :relationship

  validates :category, presence: true
  validates :description, presence: true,
                          length: { maximum: 120 }
  validates :status, presence: true

  before_save :calculate_points

  DID = 10
  REMEMBERED_TO = 10
  FORGAVE_ME_FOR = 10
  SAID_NICE_THINGS = 15
  FOUND = 5
  FIXED = 5
  HELPED = 15
  LISTENED = 15
  WAS_HONEST_ABOUT = 20
  BOUGHT = 10

  REFUSED_TO = 10
  FORGOT_TO = 10
  BLAMED_ME_FOR = 10
  SAID_HURTFUL_THINGS = 20
  LOST = 5
  BROKE = 5
  CHEATED = 200
  DID_NOT_LISTEN = 15
  LIED_ABOUT = 30
  TOOK = 15

  POSITIVE_MULTIPLIER = 0.75
  NEGATIVE_MULTIPLIER = 1.25

  POSITIVE = {
    did: DID,
    remembered_to: REMEMBERED_TO,
    forgave_me_for: FORGAVE_ME_FOR,
    said_nice_things: SAID_NICE_THINGS,
    found: FOUND,
    fixed: FIXED,
    helped: HELPED,
    listened: LISTENED,
    was_honest_about: WAS_HONEST_ABOUT,
    bought: BOUGHT
  }

  NEGATIVE = {
    refused_to: REFUSED_TO,
    forgot_to: FORGOT_TO,
    blamed_me_for: BLAMED_ME_FOR,
    said_hurtful_things: SAID_HURTFUL_THINGS,
    lost: LOST,
    broke: BROKE,
    cheated: CHEATED,
    do_not_listen: DID_NOT_LISTEN,
    lied_about: LIED_ABOUT,
    took: TOOK
  }

  def calculate_points
    if status == "negative"
      penalty = NEGATIVE[category.to_sym]
      occurences = Incident.where(user_id: user_id, category: category).count
      self.calculated_points = -(penalty * NEGATIVE_MULTIPLIER**occurences)
    elsif status == "positive"
      penalty = POSITIVE[category.to_sym]
      occurences = Incident.where(user_id: user_id, category: category).count
      self.calculated_points = penalty * POSITIVE_MULTIPLIER**occurences
    end
  end

end