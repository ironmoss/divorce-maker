class Incident < ActiveRecord::Base

  belongs_to :user
  belongs_to :relationship

  validates :category, presence: true
  validates :description, presence: true,
                          length: { maximum: 120 }
  validates :status, presence: true

  before_save :calculate_points

# Constant point values for postive incidents (kisses)
  DID                 = 10
  REMEMBERED          = 10
  FORGAVE_ME_FOR      = 10
  SAID_NICE_THINGS    = 15
  FOUND               = 5
  FIXED               = 5
  HELPED              = 15
  LISTENED            = 15
  WAS_HONEST          = 20
  BOUGHT              = 10

# Constant point values for negative incidents (yells)
  REFUSED_TO          = 10
  FORGOT              = 10
  BLAMED_ME_FOR       = 10
  SAID_HURTFUL_THINGS = 20
  LOST                = 5
  BROKE               = 5
  CHEATED             = 200
  DID_NOT_LISTEN      = 15
  LIED                = 30
  TOOK                = 15

# Multiplying factors for recurrent incidents.
  POSITIVE_MULTIPLIER = 0.75
  NEGATIVE_MULTIPLIER = 1.25

# Relates positive categories to their point values.
  POSITIVE = {
    'did'               => DID,
    'remembered'        => REMEMBERED,
    'forgave me for'    => FORGAVE_ME_FOR,
    'said nice things'  => SAID_NICE_THINGS,
    'found'             => FOUND,
    'fixed'             => FIXED,
    'helped'            => HELPED,
    'listened'          => LISTENED,
    'was honest'        => WAS_HONEST,
    'bought'            => BOUGHT
  }

# Relates negative categories to their point values.
  NEGATIVE = {
    'refused to'          => REFUSED_TO,
    'forgot'              => FORGOT,
    'blamed me for'       => BLAMED_ME_FOR,
    'said hurtful things' => SAID_HURTFUL_THINGS,
    'lost'                => LOST,
    'broke'               => BROKE,
    'cheated'             => CHEATED,
    'did not listen'      => DID_NOT_LISTEN,
    'lied'                => LIED,
    'took'                => TOOK
  }

# Calculates the point value of each incident on instantiation via callback.
  def calculate_points
    if status == "negative"
      penalty = NEGATIVE[category]
      occurences = Incident.where(user_id: user_id, category: category).count
      self.calculated_points = -(penalty * NEGATIVE_MULTIPLIER**occurences)
    elsif status == "positive"
      penalty = POSITIVE[category]
      occurences = Incident.where(user_id: user_id, category: category).count
      self.calculated_points = penalty * POSITIVE_MULTIPLIER**occurences
    end
  end

end