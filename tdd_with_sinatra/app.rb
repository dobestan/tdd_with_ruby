require 'haml'
require 'pstore'
require_relative '../tdd_with_ruby/lib/team.rb'
require_relative '../tdd_with_ruby/lib/competition.rb'

class App < Sinatra::Base

  before { load_db } 
  get "/" do
    "Hello World"
  end

  get "/teams/new" do
    haml :"teams/new"
  end

  post "/teams" do
    redirect "/teams/success"
  end

  get "teams/success" do
    haml :"teams/success"
  end

  private
    def load_db
      @db = PStore.new "store"

      @db.transaction do
        @db[:competitions] ||= [
          Competitions.new,
          Competitions.new(["Question 1"])
        ]
      end
    end
end
