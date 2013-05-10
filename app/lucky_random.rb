class LuckyRandom
  def initialize
    @applicants = loadApplicants
  end

  def loadApplicants
    names = []
    applicantsFile = NSBundle.mainBundle.pathForResource('applicants', ofType: 'json')
    errorPointer = Pointer.new(:object)
    data = NSData.alloc.initWithContentsOfFile(applicantsFile,
                                               options:NSDataReadingUncached,
                                               error:errorPointer)

    unless data
      printError errorPointer[0]
      return defaultApplicants
    end

    json = NSJSONSerialization.JSONObjectWithData(data,
                                                  options:NSDataReadingUncached,
                                                  error:errorPointer)

    unless json
      printError errorPointer[0]
      return defaultApplicants
    end

    json.each{|appl| names << appl[:name]}
    names
  end

  def printError(error)
    $stderr.puts "Error: #{error.description}"
  end

  def defaultApplicants
    ['Lucky John']
  end

  def randomAnswer(count = 1)
    @applicants.length < count ? 'No one is lucky today' : @applicants.sample(count).join("\n")
  end
end