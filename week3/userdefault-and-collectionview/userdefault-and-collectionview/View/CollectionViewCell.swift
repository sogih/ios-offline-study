import UIKit

class CollectionViewCell : UICollectionViewCell {
    
    var song : Song? {
        didSet {
            let image = UIImage(named:self.song!.thumbnail)
            self.thumbnail.image = image
            self.title.text = self.song?.title
            self.subtitle.text = self.song?.artist
        }
    }
    
    let title = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    let subtitle = UILabel().then {
        $0.textColor = .darkGray
    }
    
    let thumbnail = UIImageView().then {
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//MARK:- setup ui
extension CollectionViewCell {
    func setupUI() {
        
        contentView.addSubview(thumbnail)
        thumbnail.snp.makeConstraints {
            $0.centerX.equalTo(contentView)
            $0.top.equalToSuperview().offset(24)
            $0.height.width.equalTo(250)
        }
        
        contentView.addSubview(title)
        title.snp.makeConstraints {
            $0.leading.equalTo(thumbnail)
            $0.trailing.equalTo(contentView)
            $0.top.equalTo(thumbnail.snp_bottomMargin).offset(12)
        }

        contentView.addSubview(subtitle)
        subtitle.snp.makeConstraints {
            $0.leading.equalTo(thumbnail)
            $0.trailing.equalTo(contentView)
            $0.top.equalTo(title.snp_bottomMargin).offset(12)
        }

    }
}
