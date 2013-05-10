class LuckyRandomViewController< UIViewController
  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad
    view.image = UIImage.imageNamed('background.png')

    @label = makeLabel
    view.addSubview(@label)

    view.userInteractionEnabled=true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'showLuckies')
    view.addGestureRecognizer(recognizer)

    @luckyRandom = LuckyRandom.new
  end

  def makeLabel
    label = UILabel.alloc.initWithFrame([[480, 240], [500, 500]])
    label.numberOfLines = 0
    label.font = UIFont.fontWithName('Noteworthy', size:20)
    label.setBackgroundColor(UIColor.clearColor);
    label.textColor = UIColor.whiteColor
    label.textAlignment = UITextAlignmentCenter
    label
  end

  def showLuckies
    @label.text = @luckyRandom.randomAnswer(10)
  end
end