//
//  DetailViewController.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/28.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    lazy var contentViewSzie = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    var model: LOLChampion?
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    
    lazy var scrollView: UIScrollView = {

        let scrollView = UIScrollView()
        scrollView.backgroundColor = .blue
        scrollView.frame = scrollView.bounds
        scrollView.frame = self.view.bounds
        scrollView.contentSize = contentViewSzie
//        scrollView.minimumZoomScale = 1.0
//        scrollView.maximumZoomScale = 10.0
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
        label.font = .boldSystemFont(ofSize: 10)
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
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        viewsetting()
        layoutSetting()
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
        scrollView.addSubview(campionIp)
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
            make.top.equalTo(backgroundView.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(400)
        }
        
        campionImage.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.top).offset(40)
            make.width.height.equalTo(40)
            make.centerX.equalTo(view)
        }
        
        championName.snp.makeConstraints { make in
            make.top.equalTo(campionImage.snp.bottom).offset(20)
            make.left.equalTo(backgroundView.safeAreaLayoutGuide)
            make.right.equalTo(backgroundView.safeAreaLayoutGuide)
            make.width.height.equalTo(50)
            make.centerX.equalTo(view)
        }
        
        campionIp.snp.makeConstraints { make in
            make.top.equalTo(championName.snp.bottom).offset(50)
            make.left.equalTo(backgroundView.safeAreaLayoutGuide)
            make.right.equalTo(backgroundView.safeAreaLayoutGuide)
            make.width.height.equalTo(50)
            make.centerX.equalTo(view)
//            make.bottom.equalToSuperview()
        }
    }
    
    func setModel(model: Champion) {
        championName.text = model.name
        let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/12.20.1/img/champion/\(model.id).png")
        campionImage.kf.setImage(with: url)
        
        let url2 = URL(string: "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/\(model.id)_1.jpg")
        backgroundImage.kf.setImage(with: url2)
    }
}
