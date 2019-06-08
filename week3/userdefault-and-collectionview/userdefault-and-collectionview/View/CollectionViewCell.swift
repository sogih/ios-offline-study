import UIKit

class CollectionViewCell : UICollectionViewCell {
    
    let title : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        return lbl
    }()
    
    let subtitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        return lbl
    }()
    
    let thumbnail : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 8
        iv.layer.masksToBounds = true
        return iv
    }()
    
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
