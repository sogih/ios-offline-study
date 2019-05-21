import UIKit

class ViewController: UIViewController {

    // 인스턴스 할당
    let firstView = UIView()
    let secondView = UIView()
    let thirdView = UIView()
    let firstButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    let fourthButton = UIButton()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // view에 추가
        view.addSubview(firstView)
        view.addSubview(secondView)
        view.addSubview(thirdView)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        view.addSubview(fourthButton)
        
        // 오토 레이아웃을 사용하기 위해 auto resizing 해제
        firstView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        fourthButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 각 뷰와 버튼의 배경색 지정
        firstView.backgroundColor = .red
        secondView.backgroundColor = .orange
        thirdView.backgroundColor = .yellow
        firstButton.backgroundColor = .green
        secondButton.backgroundColor = .blue
        thirdButton.backgroundColor = .purple
        fourthButton.backgroundColor = .gray
        
        // 오토 레이아웃 지정
        let padding: CGFloat = 24
        let width: CGFloat = (view.frame.width-24*4)/3
        
        firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding).isActive = true
        firstView.widthAnchor.constraint(equalToConstant: width).isActive = true
        firstView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: padding).isActive = true
        secondView.topAnchor.constraint(equalTo: firstView.topAnchor).isActive = true
        secondView.widthAnchor.constraint(equalTo: firstView.widthAnchor).isActive = true
        secondView.heightAnchor.constraint(equalTo: firstView.heightAnchor).isActive = true
        
        thirdView.leadingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: padding).isActive = true
        thirdView.topAnchor.constraint(equalTo: secondView.topAnchor).isActive = true
        thirdView.widthAnchor.constraint(equalTo: secondView.widthAnchor).isActive = true
        thirdView.heightAnchor.constraint(equalTo: secondView.heightAnchor).isActive = true
        
        
        firstButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor).isActive = true
        firstButton.topAnchor.constraint(equalTo: thirdView.bottomAnchor, constant: padding).isActive = true
        firstButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
        firstButton.heightAnchor.constraint(equalTo: thirdView.widthAnchor).isActive = true
        
        
        secondButton.leadingAnchor.constraint(equalTo: firstButton.leadingAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: padding).isActive = true
        secondButton.widthAnchor.constraint(equalTo: firstButton.heightAnchor).isActive = true
        secondButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding).isActive = true
        
        thirdButton.leadingAnchor.constraint(equalTo: secondView.leadingAnchor).isActive = true
        thirdButton.topAnchor.constraint(equalTo: secondButton.topAnchor).isActive = true
        thirdButton.widthAnchor.constraint(equalTo: secondButton.widthAnchor).isActive = true
        thirdButton.bottomAnchor.constraint(equalTo: secondButton.bottomAnchor).isActive = true
        
        fourthButton.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor).isActive = true
        fourthButton.topAnchor.constraint(equalTo: thirdButton.topAnchor).isActive = true
        fourthButton.widthAnchor.constraint(equalTo: thirdButton.widthAnchor).isActive = true
        fourthButton.bottomAnchor.constraint(equalTo: thirdButton.bottomAnchor).isActive = true
        
    }

}

