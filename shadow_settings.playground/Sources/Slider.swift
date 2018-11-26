import Foundation
import UIKit

public class Slider: UISlider {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    func setup() {
        thumbTintColor = .blue
        minimumValue = -5
        maximumValue = 5
    }
}
