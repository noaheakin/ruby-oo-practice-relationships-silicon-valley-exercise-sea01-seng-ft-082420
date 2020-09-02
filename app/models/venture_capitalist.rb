class VentureCapitalist

    attr_reader :name, :total_worth
    
    @@all = []

    def initialize (name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|investor| investor.total_worth >= 1000000000}
    end

    def offer_contract (startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|contract| contract.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map {|contract| contract.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by {|contract| contract.investment}
    end

    def invested(domain)
        contracts = self.funding_rounds.select {|contract| contract.startup.domain == domain}
        contracts.sum {|contract| contract.investment}
    end
end

