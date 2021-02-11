require "pry"

class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, obj)
    # binding.pry
    sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL
    obj.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
    SELECT * 
    FROM pokemon
    WHERE id = ?
    SQL

    exe = db.execute(sql, id)[0]
    self.new(id: exe[0], name: exe[1], type: exe[2], db: db)
  end
end
