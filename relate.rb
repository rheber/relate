require "CSV"

def main
  CSV.foreach("relations/"+ARGV[0]) do |row|
    print row
  end
rescue Errno::ENOENT
  STDERR.print "relate: Invalid file '#{ARGV[0]}'"
end

main
