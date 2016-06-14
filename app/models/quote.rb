class Quote < ActiveRecord::Base #This line picks all the hard work about interacting with the database. ActiveRecord is the model command that shows we use RoR
  validates :saying, presence: true, length: {maximum: 140, minimum: 3}
  validates :author, presence: true, length: {maximum: 50, minimum: 3}
end

#This file makes it super easy to reach out to the database and pull, edit, create or destroy items in the database. 