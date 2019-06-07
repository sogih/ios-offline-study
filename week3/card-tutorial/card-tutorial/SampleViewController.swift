import UIKit
import SnapKit

class SampleViewController : UIViewController {
    lazy var label : UILabel = {
        let lb = UILabel()
        lb.text = "this is a sample view controller"
        return lb
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.leading.top.equalTo(view).offset(24)
        }
    }
}
