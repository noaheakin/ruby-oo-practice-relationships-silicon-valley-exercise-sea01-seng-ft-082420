require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

microsoft = Startup.new("Big Tech", "Bill Gates", "microsoft.com")
xealth = Startup.new("Health Tech", "Paige Stocks", "xealth.com")

elon = VentureCapitalist.new("Elon Musk", 100000000000)
jobs = VentureCapitalist.new("Steve Jobs", 1000000)

round1 = FundingRound.new(microsoft, elon, "Series A", -100)
round2 = FundingRound.new(xealth, jobs, "Seed", 1000)
round3 = FundingRound.new(microsoft, jobs, "Series A", 200)
round4 = FundingRound.new(microsoft, elon, "Series B", 2)
round5 = FundingRound.new(xealth, jobs, "Next Round", 200)

# microsoft.pivot("newdomain", "Foundation")


binding.pry
0 #leave this here to ensure binding.pry isn't the last line