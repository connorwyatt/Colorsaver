import Foundation
import ScreenSaver

class ColorsaverView: ScreenSaverView
{

  private var timeLabel: NSTextField?
  private var timeLabelSize: CGFloat = 96
  private var currentTime: String { return Date().description }

  override init?(frame: NSRect, isPreview: Bool)
  {
    super.init(frame: frame, isPreview: isPreview)

    self.timeLabel = createTimeLabel(frame: frame, isPreview: isPreview)

    initialize()
  }

  required init?(coder decoder: NSCoder)
  {
    super.init(coder: decoder)

    self.timeLabel = createTimeLabel(frame: bounds, isPreview: isPreview)

    initialize()
  }

  override func draw(_ rect: NSRect)
  {
    super.draw(rect)

    if let timeLabel = timeLabel {
      timeLabel.frame = timeLabelFrame(from: timeLabel, in: rect)
    }
  }

  override func animateOneFrame()
  {
    updateTimeLabel(with: currentTime)
    setNeedsDisplay(frame)
  }

  private func initialize()
  {
    animationTimeInterval = 1.0/30.0

    guard let timeField = timeLabel else { return }

    addSubview(timeField)
  }

  private func createTimeLabel(frame: NSRect, isPreview: Bool) -> NSTextField
  {
    let label = NSTextField(frame: frame)
    label.stringValue = currentTime
    label.autoresizingMask = .width
    label.alignment = .center
    label.textColor = .white
    label.font = NSFont.monospacedDigitSystemFont(
      ofSize: timeLabelSize,
      weight: .ultraLight)
    label.isBezeled = false
    label.isBordered = false
    label.isSelectable = false
    label.isEditable = false
    label.backgroundColor = .clear

    return label
  }

  private func timeLabelFrame(
    from label: NSTextField,
    in rect: NSRect) -> NSRect
  {
    var newFrame = label.frame
    newFrame.origin.x = 0
    newFrame.origin.y = rect.size.height / 2
    newFrame.size.width = rect.size.width
    newFrame.size.height = (label.stringValue as NSString).size(
      withAttributes: [NSAttributedStringKey.font: label.font!]).height

    return newFrame
  }

  private func updateTimeLabel(with time: String) {
    timeLabel?.stringValue = time
  }

}
