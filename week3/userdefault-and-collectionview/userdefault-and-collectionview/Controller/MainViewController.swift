import UIKit


class MainViewController: UIViewController {
    
    let welcomeText = UILabel().then {
        $0.text = "어서오세요! 😎"
        $0.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 0.7, alpha: 1.0)
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.textAlignment = .center
        $0.textColor = .white
    }
    
    let logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.9, alpha: 1.0)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
    }
    
    let sectionTitle = UILabel().then {
        $0.text = " Now hot 5"
        $0.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.font = UIFont.boldSystemFont(ofSize: 36)
    }
    
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
    
    var songList = [Song]() {
        didSet{
            self.firstCollectionView.reloadData()
        }
    }
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
        
        let thumbnail = ["fake_love.jpg", "노래방에서.jpg", "밤편지.jpg", "벌써12시.jpg", "오랜날오랜밤.jpg"]
        let title = ["fake love", "노래방에서", "밤편지", "벌써 12시", "오랜 날 오랜 밤"]
        let artist = ["BTS", "장범준", "아이유", "청하", "악동뮤지션"]
        
        for i in 0...thumbnail.count-1 {
            let song = Song(thumbnail: thumbnail[i], title: title[i], artist: artist[i])
            songList.append(song)
        }
        
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
        cell.song = self.songList[indexPath.item]
        
        return cell
    }
}
