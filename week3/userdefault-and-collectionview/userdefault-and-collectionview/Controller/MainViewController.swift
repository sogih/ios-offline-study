import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let welcomeText : UILabel = {
        let lbl = UILabel()
        lbl.text = "\(UserDefaults.standard.string(forKey: "id")!)님 어서오세요! 😎"
        lbl.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 0.7, alpha: 1.0)
        lbl.layer.cornerRadius = 8
        lbl.layer.masksToBounds = true
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    
    let logoutButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("로그아웃", for: .normal)
        btn.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.9, alpha: 1.0)
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
        return btn
    }()
    
    let sectionTitle : UILabel = {
        let lbl = UILabel()
        lbl.text = " Now hot 5"
        lbl.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        lbl.layer.cornerRadius = 8
        lbl.layer.masksToBounds = true
        lbl.font = UIFont.boldSystemFont(ofSize: 36)
        return lbl
    }()
    
    lazy var firstCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        cv.isPagingEnabled = true
        cv.delegate = self
        cv.dataSource = self
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.layer.cornerRadius = 8
        return cv
    }()
    
    var songList = [Song]()
}


//MARK:- life cycle
extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSong()
    }
}


//MARK:- setup ui
extension MainViewController {
    
    func setupUI() {
        
        // view
        view.backgroundColor = .white
        
        // welcome text
        view.addSubview(welcomeText)
        welcomeText.snp.makeConstraints {
            $0.top.equalToSuperview().offset(48)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(240)
            $0.height.equalTo(44)
        }
        
        // logout button
        view.addSubview(logoutButton)
        logoutButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.top.equalTo(welcomeText)
            $0.leading.equalTo(welcomeText.snp_trailingMargin).offset(24)
        }
        
        // section title
        view.addSubview(sectionTitle)
        sectionTitle.snp.makeConstraints {
            $0.top.equalTo(welcomeText.snp_bottomMargin).offset(24)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(48)
        }
        
        // first collectionview
        view.addSubview(firstCollectionView)
        firstCollectionView.snp.makeConstraints {
            $0.top.equalTo(sectionTitle.snp_bottomMargin).offset(-2)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(340)
        }
        
    } // setupui end
    
}



//MARK:- action event
extension MainViewController {
    @objc func tappedLogoutButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func addSong() {
        let first = Song(thumbnail: "fake_love.jpg", title: "fake love", artist: "BTS")
        let second = Song(thumbnail: "노래방에서.jpg", title: "노래방에서", artist: "장범준")
        let third = Song(thumbnail: "밤편지.jpg", title: "밤편지", artist: "아이유")
        let fourth = Song(thumbnail: "벌써12시.jpg", title: "벌써 12시", artist: "청하")
        let fifth = Song(thumbnail: "오랜날오랜밤.jpg", title: "오랜 날 오랜 밤", artist: "악동뮤지션")
        songList.append(first)
        songList.append(second)
        songList.append(third)
        songList.append(fourth)
        songList.append(fifth)
        
    }
}


//MARK:- collectionview delegate pattern
extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.songList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.thumbnail.image = UIImage(named: songList[indexPath.row].thumbnail)
        cell.title.text = songList[indexPath.row].title
        cell.subtitle.text = songList[indexPath.row].artist
        return cell
    }
}
