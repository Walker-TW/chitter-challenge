require 'pg'
require_relative 'peep'

class User

  attr_reader :email, :username, :realname, :passwrd

  def initialize(email:, username:, realname:, passwrd:)
    @email = email
    @username = username
    @realname = realname
    @passwrd = passwrd
  end

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec('SELECT * FROM users')
  end

  def self.create(email:, username:, realname:, passwrd:)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO users (email, username, realname, passwrd) 
    VALUES('#{email}','#{username}', '#{realname}', '#{passwrd}') 
    RETURNING email, username, realname, passwrd")
    User.new(email: result[0]['email'], username: result[0]['username'], realname: result[0]['realname'], passwrd: result[0]['passwrd'])
  end
end
