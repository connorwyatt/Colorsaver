import Foundation

class Clock: NSView
{

  var time: Date?
  {
    didSet
    {
      guard let time = time else { return }

      timeLabel.stringValue = formatter.string(from: time)
      colorLabel.stringValue = time.color.hexString

      setNeedsDisplay(frame)
    }
  }

  private let formatter = DateFormatter()
  private var timeLabel: NSTextField!
  private let timeLabelSize: CGFloat = 96
  private var colorLabel: NSTextField!
  private let colorLabelSize: CGFloat = 64

  required init?(coder decoder: NSCoder)
  {
    super.init(coder: decoder)

    initialize()
  }

  override init(frame frameRect: NSRect)
  {
    super.init(frame: frameRect)

    initialize()
  }

  private func initialize()
  {
    configure(dateFormatter: formatter)

    timeLabel = createTimeLabel()
    colorLabel = createColorLabel()

    let stack = createStack(views: [timeLabel, colorLabel])

    addSubview(stack)

    stack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    stack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }

  private func configure(dateFormatter: DateFormatter)
  {
    dateFormatter.dateFormat = "HH:mm:ss"
  }

  private func createTimeLabel() -> NSTextField
  {
    let label = createBaseLabel()
    label.font = NSFont.monospacedDigitSystemFont(ofSize: timeLabelSize, weight: .ultraLight)

    return label
  }

  private func createColorLabel() -> NSTextField
  {
    let label = createBaseLabel()
    label.font = NSFont.monospacedDigitSystemFont(ofSize: colorLabelSize, weight: .ultraLight)

    return label
  }

  private func createBaseLabel() -> NSTextField
  {
    let label = NSTextField(labelWithString: "")
    label.textColor = NSColor.white

    return label
  }

  private func createStack(views: [NSView]) -> NSStackView
  {
    let stack = NSStackView(views: views)
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.orientation = .vertical
    stack.alignment = .centerX
    stack.spacing = 20

    return stack
  }

}
