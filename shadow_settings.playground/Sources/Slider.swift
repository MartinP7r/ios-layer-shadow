import Foundation
import UIKit

public class Slider: UISlider {

    let lbl = UILabel()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public convenience init(frame: CGRect, title: String) {
        self.init(frame: frame)
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.text = title
        addSubview(lbl)
        lbl.frame = CGRect(x: 0, y: -20, width: 200, height: 16)
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    func setup() {
        thumbTintColor = .blue
        minimumValue = -5
        maximumValue = 5
    }
}
