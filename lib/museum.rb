class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interests
    grouped = Hash.new
    @exhibits.each do |exhibit|
      grouped[exhibit] = []
      patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          grouped[exhibit] << patron
        end
      end
    end
    grouped
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.find_all do |patron|
      patron.interests.include?(exhibit.name) && patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    if ticket_lottery_contestants(exhibit) == []
      nil
    else
      ticket_lottery_contestants(exhibit).sample.name
    end
  end

end
