require 'csv'
require "benchmark"

namespace :import do
   desc "imports data from csv to postgresql"
   animals = []
   task :batch_record => :environment do
       CSV.foreach(filename, headers: true) do |row|
           animals << row
       end
       newanimals = animals.map do |attrs|
           Animal.new(attrs)
       end
       time = Benchmark.realtime {Animal.import(newanimals)}
       puts time
   end
end