class Filiation < ActiveRecord::Base

  belongs_to :person
  belongs_to :political_party

end
