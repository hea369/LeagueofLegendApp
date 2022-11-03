//
//  DetailViewController.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/28.
//

import UIKit
import Kingfisher
import SafariServices

class DetailViewController: UIViewController {
    
    var model: LOLChampion?
    
    var namuwikiModel: [String] = []
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        //        scrollView.showsVerticalScrollIndicator = false
        //        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var backgroundImage: UIImageView = {
        let view = UIImageView()
        view.alpha = 0.5
        return view
    }()
    
    let campionImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    let championName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    let championSubName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    let campionIp: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        return label
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("나무위키", for: .normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        return button
    }()
    
    lazy var centerButton: UIButton = {
        let button = UIButton()
        button.setTitle("인벤공략", for: .normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("카운터픽", for: .normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        scrollView.minimumZoomScale = 1.0
        //        scrollView.maximumZoomScale = 10.0
        //        scrollView.delegate = self
        
        view.backgroundColor = .systemBackground
        viewsetting()
        layoutSetting()
        buttonActionSetting()
    }
    
    @objc func viewtransform(){
        guard let a = storyboard?.instantiateViewController(withIdentifier: "LoLChampionViewController") as? LoLChampionViewController else { return }
        navigationController?.pushViewController(a, animated: true)
    }
    
    func viewsetting(){
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        scrollView.addSubview(backgroundImage)
        scrollView.addSubview(campionImage)
        scrollView.addSubview(championName)
        scrollView.addSubview(championSubName)
        scrollView.addSubview(campionIp)
        scrollView.addSubview(leftButton)
        scrollView.addSubview(centerButton)
        scrollView.addSubview(rightButton)
    }
    
    func layoutSetting(){
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backgroundView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
            make.height.equalTo(1500)
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.width.equalTo(400)
        }
        
        campionImage.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.top).offset(50)
            make.width.height.equalTo(100)
            make.centerX.equalTo(view)
        }

        championName.snp.makeConstraints { make in
            make.top.equalTo(campionImage.snp.top).offset(10)
            make.right.equalTo(championSubName.snp.left)
        }

        championSubName.snp.makeConstraints { make in
            make.top.equalTo(campionImage.snp.top).offset(10)
            make.left.equalTo(championName.snp.right)
        }
        
        campionIp.snp.makeConstraints { make in
            make.top.equalTo(championName.snp.bottom).offset(50)
            make.left.equalTo(backgroundView.safeAreaLayoutGuide)
            make.right.equalTo(backgroundView.safeAreaLayoutGuide)
            make.width.height.equalTo(50)
            make.centerX.equalTo(view)
        }
        
        leftButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.bottom).offset(20)
            make.left.equalTo(backgroundView.snp.left).offset(40)
        }
        
        centerButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        rightButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.bottom).offset(20)
            make.right.equalTo(backgroundView.snp.right).offset(-40)
        }
    }

    func buttonActionSetting(){
        leftButton.addTarget(self, action: #selector(leftButtontouch), for: .touchUpInside)
        centerButton.addTarget(self, action: #selector(centerButtontouch), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtontouch), for: .touchUpInside)
    }

    @objc func leftButtontouch(){
        var transformURL = URL(string: "https://namu.wiki/w/")!
        transformURL.appendPathComponent(namuwikiModel[0])
        
        print("https://namu.wiki/w/\(namuwikiModel[0])")
        
        let namuwikiVC: SFSafariViewController = SFSafariViewController(url: transformURL as! URL)
        
        self.present(namuwikiVC, animated: true, completion: nil)
    }
    
    @objc func centerButtontouch(){
        var transformURL = URL(string: "https://m.inven.co.kr/site/lol/champ.php?iskin=lol")!
        
        let lolInven: SFSafariViewController = SFSafariViewController(url: transformURL as! URL)
        
        self.present(lolInven, animated: true, completion: nil)
    }
    
    @objc func rightButtontouch(){
        var transformURL = URL(string: "https://lol.inven.co.kr/dataninfo/counter/")!
        
        let counterPick: SFSafariViewController = SFSafariViewController(url: transformURL as! URL)
        
        self.present(counterPick, animated: true, completion: nil)
    }
    
    func setModel(model: Champion) {
        namuwikiModel.append(model.name)
        
        championName.text = model.name
        championSubName.text = model.title
        let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/12.20.1/img/champion/\(model.id).png")
        campionImage.kf.setImage(with: url)
        
        let url2 = URL(string: "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/\(model.id)_1.jpg")
        backgroundImage.kf.setImage(with: url2)
    }
}

