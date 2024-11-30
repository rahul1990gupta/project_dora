# Rakefile
namespace :job do 
  desc "Count the number of lines of code in the project"
  task :count_lines do
    # Get all Ruby files in the current directory and subdirectories
    files = Dir.glob("app/**/*.rb") \
          + Dir.glob("app/**/**/*.erb") \
          + Dir.glob("app/assets/**/*.css")

    # Initialize the line count
    total_lines = 0

    # Process each file
    files.each do |file|
      line_count = File.readlines(file).size
      puts "#{file}: #{line_count} lines"
      total_lines += line_count
    end

    puts "\nTotal number of lines: #{total_lines}"
  end
end 

