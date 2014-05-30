class LuckyRandomViewController< UIViewController
  def viewDidLoad
    @logo = UIImageView.alloc.initWithImage(UIImage.imageNamed('RM_logo.png'))
    @logo.center = view.center

    @logo.userInteractionEnabled = true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action: 'showLuckies')
    @logo.addGestureRecognizer(recognizer)

    view.addSubview(@logo)

    @label = makeLabel
    view.addSubview(@label)
    @label.hidden = true

    @luckyRandom = LuckyRandom.new
  end

  def makeLabel
    label = UILabel.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    label.numberOfLines = 0
    label.font = UIFont.fontWithName('Noteworthy', size:20)
    label.textColor = UIColor.whiteColor
    label.textAlignment = UITextAlignmentCenter
    label
  end

  def showLuckies
    @label.text = @luckyRandom.randomAnswer(10)
    @label.hidden = false
    @logo.hidden = true
  end
end