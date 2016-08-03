class Incident

  attr_reader :borough
  
  def initialize
    @location = location

  end

  def self.get_and_create_incidents
    @incidents = []
    client = ApiCommunicator.new
    client.incident_data.each do |hash|
        @incidents << hash
    end
  end

  def self.search_incidents_by_borough(search_term)
    @results = @incidents.select do |hash|
      hash["borough"] == search_term
    end
    puts @results.count.to_s + " total incidents occurred in #{search_term}."
    puts "Top 10 Incidents Report Below:"
    return_incident_types_and_totals  
  end

  def self.return_incident_types_and_totals
      arr =[]
      n =0
      while n <  @results.count
        arr <<  @results[n]["incident_type"]
        n += 1
      end
      
      @incident_count = Hash.new(0)
      arr.each { |incident| @incident_count[incident] += 1 }
      @incident_count_sorted = @incident_count.sort_by {|k,v| v}.reverse
      results_formatting
    end
  
  def self.results_formatting
    top_10 = @incident_count_sorted.collect do |incident_type, value|
         "#{incident_type} = #{value}"
    end
    puts top_10.first(10) 
    date_range
 end

  def self.date_range
    arr =[]
    n=0
    while n <  @results.count
      arr << @results[n]["creation_date"]
      n += 1
    end
    latest_date = arr.sort.reverse.first
    earliest_date = arr.sort.reverse.last
    # binding.pry
   puts "These incidents occurred between the dates of: #{earliest_date} to #{latest_date}"
  end

end
