class Incident < ActiveRecord::Base

  belongs_to :user
  belongs_to :relationship


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
    DIDNT_LISTEN = 15
    LIED_ABOUT = 30
    TOOK = 15


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
    didnt_listen: DIDNT_LISTEN,
    lied_about: LIED_ABOUT,
    took: TOOK,
  }

end