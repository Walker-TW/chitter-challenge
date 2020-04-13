require 'pg'
require_relative 'user'

class Peep
  attr_reader :user_id, :created_at, :peep, :name_for_user
  def initialize(user_id:, created_at:, peep:)
    @user_id = user_id
    @created_at = created_at
    @peep = peep
  end

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps')
    # name_for_user = connection.exec('SELECT users.username FROM peeps INNER JOIN users ON peeps.user_id = users.id')
    result.map { |peep| Peep.new(created_at: peep["created_at"], user_id: peep['user_id'], peep: peep["peep"]) }
  end

  def self.create(user_id:, peep:)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (user_id, peep) VALUES ('#{user_id}', '#{peep}') 
    RETURNING user_id, created_at, peep")
    Peep.new(user_id: result[0]['user_id'], created_at: result[0]['created_at'], peep: result[0]['peep'])
  end

end
