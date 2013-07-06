require 'csv'

task :load_data => :environment do
  puts "Loading..."
  Dir.glob('db/data/*.csv').map do |path|
    file = File.open(path)
    file.readline # file header
    puts path
    lines = file.readlines
    lines.map do |line| 
      line.encode!('ISO-8859-1', 'UTF-8', :invalid => :replace, :replace => '?')
      line.gsub!('"', '')
      data = line.split(';')

      # Save person data
      person = Person.new
      person.name = data[3]
      person.save!

      # Save political party
      acronym = data[4]
      political_party = PoliticalParty.find_by_acronym(acronym)
      political_party ||= PoliticalParty.create(:acronym => acronym, :name => data[5])
      political_party.save!
     
      filiation = Filiation.new 
      filiation.person = person
      filiation.political_party = political_party
      filiation.uf = data[6]
      filiation.registry_situation = data[12]
      filiation.defiliation_date = data[15]
      filiation.date = data[11]
      filiation.save!
 
    end
  end
  # custom stuff
end
