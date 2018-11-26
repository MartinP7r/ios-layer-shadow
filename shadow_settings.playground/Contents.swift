//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {

    let _view = UIView()
    let shadowView = UIView(frame: CGRect(x: 87.5, y: 40, width: 200, height: 100))

    let radiusSlider = Slider(frame: CGRect(x: 50, y: 200, width: 250, height: 20))
    let radiusLabel = UILabel(frame: CGRect(x: 300, y: 200, width: 250, height: 20))

    let opacitySlider = Slider(frame: CGRect(x: 50, y: 250, width: 250, height: 20))
    let opacityLabel = UILabel(frame: CGRect(x: 300, y: 250, width: 250, height: 20))

    let sizeWSlider = Slider(frame: CGRect(x: 50, y: 300, width: 250, height: 20))
    let sizeWLabel = UILabel(frame: CGRect(x: 300, y: 300, width: 250, height: 20))

    let sizeHSlider = Slider(frame: CGRect(x: 50, y: 350, width: 250, height: 20))
    let sizeHLabel = UILabel(frame: CGRect(x: 300, y: 350, width: 250, height: 20))

    override func loadView() {

        _view.backgroundColor = .white

        shadowView.backgroundColor = .white

        shadowView.layer.cornerRadius = 4
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 1
        shadowView.layer.shadowOffset = CGSize(width: 0,
                                               height: 0.5)

        setupControls()
        _view.addSubview(shadowView)

        self.view = _view
    }

    func setupControls() {
        radiusSlider.minimumValue = 0
        radiusSlider.maximumValue = 10
        radiusSlider.addTarget(self,
                               action: #selector(radiusChange(sender:)),
                               for: .valueChanged)

        sizeWSlider.addTarget(self, action: #selector(offSetWidthChange(sender:)), for: .valueChanged)
        sizeHSlider.addTarget(self, action: #selector(offSetHeightChange(sender:)), for: .valueChanged)


        _view.addSubview(radiusSlider)
        _view.addSubview(radiusLabel)
        _view.addSubview(opacitySlider)
        _view.addSubview(opacityLabel)
        _view.addSubview(sizeWSlider)
        _view.addSubview(sizeWLabel)
        _view.addSubview(sizeHSlider)
        _view.addSubview(sizeHLabel)
    }

    @objc func radiusChange(sender: UISlider) {
        shadowView.layer.shadowRadius = CGFloat(sender.value)
        radiusLabel.text = "\(sender.value)"
    }

    @objc func offSetWidthChange(sender: UISlider) {
        let size = CGSize(width: CGFloat(sender.value),
               height: shadowView.layer.shadowOffset.height)
        shadowView.layer.shadowOffset = size
        sizeWLabel.text = "\(sender.value)"
    }

    @objc func offSetHeightChange(sender: UISlider) {
        let size = CGSize(width: shadowView.layer.shadowOffset.height,
                          height: CGFloat(sender.value))
        shadowView.layer.shadowOffset = size
        sizeHLabel.text = "\(sender.value)"
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
print((PlaygroundPage.current.liveView as! UIViewController).view.frame.debugDescription)
