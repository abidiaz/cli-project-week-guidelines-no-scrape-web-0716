require 'pry'
class OopsiesMapCLI

  def call
    puts "Welcome to Oopsies Map! What borough would you like to search?"
    run
  end
    
  def get_user_input
    gets.chomp.strip
  end

  def run
    print "Borough keyword: "
    input = get_user_input
    if input == "help"
      help
      run
    elsif input == "exit"
      exit
    else
      # binding.pry
      search(input)
    end
  end

  def search(input)
    search_term = input
    puts "Your search term was #{search_term}, I am searching..."
    # need to send input to API_caller to run search
    Incident.get_and_create_incidents
    Incident.search_incidents_by_borough(search_term)
    # Incident.date_range

    # url = "https://twitter.com/search?q=#{search_term}&src=typd&f=realtime"
    # tweet = ExampleScraper.new(url).example_method.sample
    puts "Thank you for your patience. I found what you wanted. Be safe out there!"
    #print out results
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type a borough's name to search :Manhattan, Queens, Staten Island, Bronx, or Brooklyn"
  end
  
  def exit
    puts "Thank you and have a nice day!"
  end

end

