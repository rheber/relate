require "CSV"

def repl questions
  amountCorrect = 0
  prompts = questions.keys.shuffle
  prompts.each { |prompt|
    puts prompt
    correctAnswer = questions[prompt]
    userAnswer = STDIN.gets.chomp
    if correctAnswer.downcase == userAnswer.downcase
      puts "Correct!"
      amountCorrect += 1
    else
      puts "Incorrect: #{correctAnswer}"
    end
  }
  return amountCorrect
end

def main
  csv = CSV.read(ARGV[0])
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
  amountCorrect = repl questions
  amountTotal = questions.length
  puts "Correct answers: #{amountCorrect}/#{amountTotal}"

rescue Errno::ENOENT
  STDERR.print "relate: Invalid file '#{ARGV[0]}'"
rescue NoMethodError
  STDERR.print "relate: Too few arguments" # Called downcase on nil.
rescue TypeError
  STDERR.print "relate: Too few arguments" # Called + on nil.
end

main
