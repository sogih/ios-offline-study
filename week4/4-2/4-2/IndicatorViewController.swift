import UIKit
import Then
import SnapKit

class IndicatorViewController: UIViewController {
    
    
    let startButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Start", for: .normal)
        btn.backgroundColor = .black
        btn.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
        return btn
    }()
    
    let stopButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Stop", for: .normal)
        btn.backgroundColor = .black
        btn.addTarget(self, action: #selector(tappedStopButton), for: .touchUpInside)
        return btn
    }()
    
    let indicator : UIActivityIndicatorView = {
        let idc = UIActivityIndicatorView()
        idc.style = .whiteLarge
        idc.hidesWhenStopped = true
        idc.color = .red
        return idc
    }()

    
}


//MARK:- life cycle
extension IndicatorViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


//MARK:- setup ui
extension IndicatorViewController {
    func setupUI() {
        
        view.backgroundColor = .orange
        
        view.addSubview(startButton)
        startButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        view.addSubview(stopButton)
        stopButton.snp.makeConstraints {
            $0.top.equalTo(startButton.snp_bottomMargin).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(indicator)
        indicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}



//MARK:- action event
extension IndicatorViewController {
    
    @objc func tappedStartButton() {
        self.indicator.startAnimating()
    }
    
    @objc func tappedStopButton() {
        self.indicator.stopAnimating()
    }
}
