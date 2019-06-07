import UIKit
import Cards
import SnapKit

class ViewController: UIViewController {
    
    // first card
    lazy var card : Card = {
        let cd = Card()
        cd.backgroundColor = UIColor(red:0.75, green:0.5, blue:0.5, alpha:1.0)
        cd.textColor = .black   // default value
        cd.shadowBlur = 14  // default value
        cd.shadowColor = .gray  // deafault value
        cd.shadowOpacity = 0.6  // default value
        cd.cardRadius = 18  // 모서리 둥근 정도. 클수록 더 완만하다.
        cd.contentInset = 6 // 카드의 내용과 가장자리 사이의 간격
        cd.delegate = self
        cd.addSubview(sampleContent)
        sampleContent.snp.makeConstraints { (make) in
            make.center.equalTo(cd)
        }
        return cd
    }()
    
    // second card
    lazy var cardHighlight : CardHighlight = {
        let ch = CardHighlight()
        ch.title = "CardHighlight.title"
        ch.itemTitle = "itemTitle"
        ch.itemSubtitle = "itemSubTitle"
        ch.icon = UIImage(named: "icon.png")
        ch.buttonText = "add"
        ch.backgroundColor = UIColor(red:0.5, green:0.75, blue:0.5, alpha:1.0)
        let sampleVC = SampleViewController()
        ch.shouldPresent(sampleVC, from: self, fullscreen: true)
        return ch
    }()
    
    // third card
    lazy var cardGroupSliding : CardGroupSliding = {
        let cgs = CardGroupSliding()
        cgs.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.75, alpha: 1.0)
        cgs.icons = icons
        cgs.title = "CardGroupSliding.title"
        cgs.subtitle = "CardGroupSliding.subtitle"
        let sampleVC = SampleViewController()
        cgs.shouldPresent(sampleVC, from: self, fullscreen: true)
        return cgs
    }()
    
    
    
    let sampleContent : UILabel = {
        let lb = UILabel()
        lb.text = "Sample Content"
        lb.backgroundColor = .red
        lb.textColor = .white
        return lb
    }()
    
    let icons: [UIImage] = [
        
        UIImage(named: "Diamond_Emoji.png")!,
        UIImage(named: "Frog_Emoji.png")!,
        UIImage(named: "Ghost_Emoji.png")!,
        UIImage(named: "Rocket_Emoji.png")!,
        UIImage(named: "Woman_Saying_No_Emoji.png")!,
        UIImage(named: "Watermelon_Emoji.png")!
//
    ]
}


//MARK:- life cycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


//MARK:- setup ui
extension ViewController {
    func setupUI() {
        view.backgroundColor = .white
        
        // first card - card
        view.addSubview(card)
        card.snp.makeConstraints { (make) in
            make.leading.equalTo(view).offset(24)
            make.trailing.equalTo(view).offset(-24)
            make.top.equalTo(view).offset(48)
            make.height.equalTo(50)
        }

        
        // second card - cardhighlight
        view.addSubview(cardHighlight)
        cardHighlight.snp.makeConstraints { (make) in
            make.top.equalTo(card.snp_bottomMargin).offset(24)
            make.leading.trailing.equalTo(card)
            make.height.equalTo(200)
        }
        
        // third card - cardgroupSliding
        view.addSubview(cardGroupSliding)
        cardGroupSliding.snp.makeConstraints { (make) in
            make.top.equalTo(cardHighlight.snp_bottomMargin).offset(24)
            make.leading.trailing.equalTo(card)
            make.height.equalTo(200)
        }
        
    }
}

//MARK:- card delegate
extension ViewController : CardDelegate {
    func cardDidTapInside(card: Card) {
        print("🤟")
    }
}
