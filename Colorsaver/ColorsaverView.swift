import Foundation
import ScreenSaver

class ColorsaverView: ScreenSaverView
{

  override init?(frame: NSRect, isPreview: Bool)
  {
    super.init(frame: frame, isPreview: isPreview)

    initialize()
  }

  required init?(coder decoder: NSCoder)
  {
    super.init(coder: decoder)

    initialize()
  }

  private func initialize()
  {
    animationTimeInterval = 1.0/30.0
  }

}
