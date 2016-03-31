require "CSV"

def main
  csv = CSV.read("relations/"+ARGV[0]+".csv")
  header = csv[0].map{|h| h.downcase}
  key = header.index(ARGV[1].downcase)
  val = header.index(ARGV[2].downcase)

  questions = Hash.new
  begin
    csv[1..-1].each { |row| questions[row[key]] = row[val] }
  rescue TypeError
    STDERR.print "relate: Invalid heading"
  end
rescue Errno::ENOENT
  STDERR.print "relate: Invalid file '#{ARGV[0]}'"
rescue NoMethodError
  STDERR.print "relate: Too few arguments" # Called downcase on nil.
rescue TypeError
  STDERR.print "relate: Too few arguments" # Called + on nil.
end

main
