class FiliationsController < ApplicationController

  def index
  end


  def map
    data = {}
    data['header'] = []

    Filiation.count(:group => [:uf, :political_party_id]).map do |key, value|
      acronym = PoliticalParty.find(key.second).acronym
      data['header'].push(acronym)

      data['values'] ||= {}
      data['values'][key.first.downcase] ||= {} 
      data['values'][key.first.downcase].merge!({acronym => value})
    end
    
    data['header'].uniq!
    render :text => data.to_json
  end

  def bubble
    data = {}
    data['header'] = []

    Filiation.count(:group => [:uf, :political_party_id]).map do |key, value|
      acronym = PoliticalParty.find(key.second).acronym
      data['header'].push(key.first)

      data['values'] ||= {}
      data['values'][acronym] ||= {} 
      data['values'][acronym].merge!({key.first => value})
    end
    
    data['header'].uniq!
    render :text => data.to_json
  end

end
