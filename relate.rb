require "CSV"

def main
  csv = CSV.read("relations/"+ARGV[0]+".csv")
  header = csv[0].map{|h| h.downcase}
  key = header.index(ARGV[1].downcase)
  if not key
    STDERR.print "relate: Invalid heading '#{ARGV[1]}'"
    exit
  end
  val = header.index(ARGV[2].downcase)
  if not val
    STDERR.print "relate: Invalid heading '#{ARGV[2]}'"
    exit
  end
  questions = Hash.new
  csv[1..-1].each { |row| questions[row[key]] = row[val] }

rescue Errno::ENOENT
  STDERR.print "relate: Invalid file '#{ARGV[0]}'"
rescue NoMethodError
  STDERR.print "relate: Too few arguments" # Called downcase on nil.
rescue TypeError
  STDERR.print "relate: Too few arguments" # Called + on nil.
end

main
