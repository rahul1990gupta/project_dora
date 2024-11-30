namespace :job do
  desc "Count the number of lines of code in the project"
  task :fetch_feeds do
    Feed.all.each do |feed|
      feed.fetch_and_parse
    end
  end 
end
