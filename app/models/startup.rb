class Startup

    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

    def initialize (name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        self.name = name
        self.domain = domain
    end

    def contracts
        FundingRound.all.select {|contract| contract.startup == self}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        self.contracts.map {|contract| contract.type}.uniq.count
    end

    def total_funds
        self.contracts.map {|contract| contract.investment}.sum
    end

    def investors
        self.contracts.map {|contract| contract.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select {|investor| investor.total_worth > 1000000000}.uniq
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        self.all.map {|startup| startup.domain}
    end
end
