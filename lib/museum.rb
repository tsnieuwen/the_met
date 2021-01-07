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

end
