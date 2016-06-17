#creating Users & Incidents

#couple 1
@shnookum = User.create!(nickname: "Shnookum", email: "sunny_day155@hotmail.com", password: "12345", twitter: "Shnookie99")
@fuzzybear = User.create!(nickname: "Fuzzybear", email: "red_baron@aol.com", password: "airplane81", twitter: "RBGuy591")

#couple 2
@milly = User.create!(nickname: "Milly", email: "scorpio94@yahoo.ca", password: "zodiac01", twitter: "Mildred1")
@bob = User.create!(nickname: "Bob", email: "theresalways@bob.com", password: "alwaysbob", twitter: "Just_Bob")

@relationship1 = Relationship.create!(user1_id: @shnookum.id, user2_id: @fuzzybear.id)
@relationship2 = Relationship.create!(user1_id: @milly.id, user2_id: @bob.id)
#incidents for couple 1
# Incident.create!(relationship_id: "", category: "", description:, "", status: "", calculated_points: "")
Incident.create!(user_id: @relationship1.user2_id, relationship_id: @relationship1.id, category: "forgot to", description: "take out the garbage", status: "negative", calculated_points: 10)
Incident.create!(user_id: @relationship1.user2_id, relationship_id: @relationship1.id, category: "didn't listen", description: "when I was telling him about my day.", status: "negative", calculated_points: 15)
Incident.create!(user_id: @relationship1.user1_id, relationship_id: @relationship1.id, category: "said hurtful things ", description: "while yelling about something to do with her day", status: "negative", calculated_points: 20)
Incident.create!(user_id: @relationship1.user2_id, relationship_id: @relationship1.id, category: "bought", description: "me a necklace", status: "positive", calculated_points: 10)
Incident.create!(user_id: @relationship1.user2_id, relationship_id: @relationship1.id, category: "forgot to", description: "put the seat down...", status: "negative", calculated_points: 22.5)#second incident of forgot to
Incident.create!(user_id: @relationship1.user1_id, relationship_id: @relationship1.id, category: "lost", description: "the necklace I just bought her. Somehow dropped it in the toilet...", status: "negative", calculated_points: 5)
Incident.create!(user_id: @relationship1.user1_id, relationship_id: @relationship1.id, category: "said hurtful things ", description: "after reading my previous incident report", status: "negative", calculated_points: 45) #second incident of "said hurtful.."
Incident.create!(user_id: @relationship1.user2_id, relationship_id: @relationship1.id, category: "blamed me for", description: "losing the necklance", status: "negative", calculated_points: 10)
Incident.create!(user_id: @relationship1.user1_id, relationship_id: @relationship1.id, category: "helped", description: "me take apart the toilet", status: "positive", calculated_points: 10)
Incident.create!(user_id: @relationship1.user2_id, relationship_id: @relationship1.id, category: "lied about", description: "knowing how to take apart a toilet", status: "negative", calculated_points: 30)
                                                                #pt tally: @fuzzybear (him) : -77 @shnookum (her) : -60
#incidents for couple 2

Incident.create!(user_id: @relationship2.user2_id, relationship_id: @relationship2.id, category: "took", description: "the last cookie", status: "negative", calculated_points: 15)
Incident.create!(user_id: @relationship2.user1_id, relationship_id: @relationship2.id, category: "blamed me for", description: "her eating the last cookie", status: "negative", calculated_points: 10)
Incident.create!(user_id: @relationship2.user2_id, relationship_id: @relationship2.id, category: "forgot to", description: "buy cookies", status: "negative", calculated_points: 10)
Incident.create!(user_id: @relationship2.user2_id, relationship_id: @relationship2.id, category: "didn't listen", description: "when I asked him to buy cookies", status: "negative", calculated_points: 15)
Incident.create!(user_id: @relationship2.user1_id, relationship_id: @relationship2.id, category: "was honest about", description: "eating the last cookie", status: "positive", calculated_points: 20)
Incident.create!(user_id: @relationship2.user2_id, relationship_id: @relationship2.id, category: "didn't listen", description: "when I tried to explain that he may think I took the cookie, but I didn't", status: "negative", calculated_points: 33.75)
Incident.create!(user_id: @relationship2.user1_id, relationship_id: @relationship2.id, category: "forgave me for", description: "apparently taking the last cookie", status: "positive", calculated_points: 10)
Incident.create!(user_id: @relationship2.user2_id, relationship_id: @relationship2.id, category: "said hurtful things", description: "about my liking cookies more than him", status: "negative", calculated_points: 20)
Incident.create!(user_id: @relationship2.user2_id, relationship_id: @relationship2.id, category: "refused to", description: "buy the cookies!", status: "negative", calculated_points: 10)
Incident.create!(user_id: @relationship2.user1_id, relationship_id: @relationship2.id, category: "cheated", description: "because of a bloody cookie!!", status: "negative", calculated_points: 200)

                                                            #pt tally: @milly (her): -180 @bob (him): -103.5
