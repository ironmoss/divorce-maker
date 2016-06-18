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
# Incident.create!(user_id: "", relationship_id: "", category: "", description:, "", status: "")
Incident.create!(user_id: @relationship1.user2_id, relationship_id: @relationship1.id, category: "forgot", description: "to take out the garbage", status: "negative")
Incident.create!(user_id: @relationship1.user2_id, relationship_id: @relationship1.id, category: "did not listen", description: "when I was telling him about my day.", status: "negative")
Incident.create!(user_id: @relationship1.user1_id, relationship_id: @relationship1.id, category: "said hurtful things", description: "while yelling about something to do with her day", status: "negative")
Incident.create!(user_id: @relationship1.user2_id, relationship_id: @relationship1.id, category: "bought", description: "me a necklace", status: "positive")
Incident.create!(user_id: @relationship1.user2_id, relationship_id: @relationship1.id, category: "forgot", description: "to put the seat down...", status: "negative")#second incident of forgot to
Incident.create!(user_id: @relationship1.user1_id, relationship_id: @relationship1.id, category: "lost", description: "the necklace I just bought her. Somehow dropped it in the toilet...", status: "negative")
Incident.create!(user_id: @relationship1.user1_id, relationship_id: @relationship1.id, category: "said hurtful things", description: "after reading my previous incident report", status: "negative") #second incident of "said hurtful.."
Incident.create!(user_id: @relationship1.user2_id, relationship_id: @relationship1.id, category: "blamed me for", description: "losing the necklance", status: "negative")
Incident.create!(user_id: @relationship1.user1_id, relationship_id: @relationship1.id, category: "helped", description: "me take apart the toilet", status: "positive")
Incident.create!(user_id: @relationship1.user2_id, relationship_id: @relationship1.id, category: "lied", description: "about knowing how to take apart a toilet", status: "negative")
                                                                #pt tally: @fuzzybear (him) : -77 @shnookum (her) : -60
#incidents for couple 2

Incident.create!(user_id: @relationship2.user2_id, relationship_id: @relationship2.id, category: "took", description: "the last cookie", status: "negative")
Incident.create!(user_id: @relationship2.user1_id, relationship_id: @relationship2.id, category: "blamed me for", description: "her eating the last cookie", status: "negative")
Incident.create!(user_id: @relationship2.user2_id, relationship_id: @relationship2.id, category: "forgot", description: "to buy cookies", status: "negative")
Incident.create!(user_id: @relationship2.user2_id, relationship_id: @relationship2.id, category: "did not listen", description: "when I asked him to buy cookies", status: "negative")
Incident.create!(user_id: @relationship2.user1_id, relationship_id: @relationship2.id, category: "was honest", description: "about eating the last cookie", status: "positive")
Incident.create!(user_id: @relationship2.user2_id, relationship_id: @relationship2.id, category: "did not listen", description: "when I tried to explain that he may think I took the cookie, but I didn't", status: "negative")
Incident.create!(user_id: @relationship2.user1_id, relationship_id: @relationship2.id, category: "forgave me for", description: "apparently taking the last cookie", status: "positive")
Incident.create!(user_id: @relationship2.user2_id, relationship_id: @relationship2.id, category: "said hurtful things", description: "about my liking cookies more than him", status: "negative")
Incident.create!(user_id: @relationship2.user2_id, relationship_id: @relationship2.id, category: "refused to", description: "buy the cookies!", status: "negative")
Incident.create!(user_id: @relationship2.user1_id, relationship_id: @relationship2.id, category: "cheated", description: "because of a bloody cookie!!", status: "negative")

                                                            #pt tally: @milly (her): -180 @bob (him): -103.5
