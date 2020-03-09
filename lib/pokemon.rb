class Pokemon
  
  attr_accessor :name, :type, :db, :id
  
  def initialize (name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL
    
    db.execute(sql, [name, type])
    
  end
  
  # def self.find(id, db)
  #   pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [id])
  #   new_pokemon = self.new(pokemon)
  #   new_pokemon.id = pokemon[0][0]
  #   new_pokemon.name = pokemon[0][1]
  #   new_pokemon.type = pokemon[0][2]
  #   return new_pokemon
  # end
  
def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = (?);
    SQL
    
    pokemon = db.execute(sql, [id])
    Pokemon.new(pokemon[0][1], pokemon[0][2], db, id )
  end
end