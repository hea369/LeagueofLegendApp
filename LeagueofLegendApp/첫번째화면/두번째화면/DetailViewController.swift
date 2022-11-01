//
//  DetailViewController.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/28.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var model: LOLChampion?
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.alpha = 0.5
        return view
    }()
    
    let backButton: UIButton = {
       let button = UIButton()
        button.alpha = 1.0
        button.setImage(UIImage(systemName: "star"), for: .normal)
        return button
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
        backButton.addTarget(self, action: #selector(viewtransform), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func viewtransform(){
        guard let a = storyboard?.instantiateViewController(withIdentifier: "LoLChampionViewController") as? LoLChampionViewController else { return }
        navigationController?.pushViewController(a, animated: true)
    }
    
    func viewsetting(){
        view.addSubview(backgroundImage)
        view.addSubview(campionImage)
        view.addSubview(championName)
        view.addSubview(campionIp)
        view.addSubview(backButton)
    }
    
    func layoutSetting(){
        backgroundImage.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.equalTo(self.view.safeAreaLayoutGuide)
            make.right.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(300)
            
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.top).offset(50)
            make.left.equalTo(backgroundImage.safeAreaLayoutGuide).offset(40)
            
        }
        
        campionImage.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.top).offset(70)
            make.width.height.equalTo(80)
            make.centerX.equalTo(view)
        }
        
        championName.snp.makeConstraints { make in
            make.top.equalTo(campionImage.snp.bottom).offset(20)
            make.width.equalTo(50)
            make.centerX.equalTo(view)
        }
        
        campionIp.snp.makeConstraints { make in
            make.top.equalTo(championName.snp.bottom).offset(20)
            make.width.equalTo(50)
            make.centerX.equalTo(view)
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
