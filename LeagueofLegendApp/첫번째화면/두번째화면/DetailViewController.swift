//
//  DetailViewController.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/28.
//

import UIKit

class DetailViewController: UIViewController {
    
    let viewBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let campionImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        return view
    }()
    
    let campionName: UILabel = {
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
        // Do any additional setup after loading the view.
    }
    func viewsetting(){
        view.addSubview(viewBackground)
        view.addSubview(campionImage)
        view.addSubview(campionName)
        view.addSubview(campionIp)
    }
    
    func layoutSetting(){
        viewBackground.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
            
        }
        campionImage.snp.makeConstraints { make in
            make.top.equalTo(viewBackground.snp.top).offset(20)
            make.width.height.equalTo(100)
            make.centerX.equalTo(view)
        }
        campionName.snp.makeConstraints { make in
            make.top.equalTo(campionImage.snp.bottom).offset(20)
            make.width.equalTo(50)
            make.centerX.equalTo(view)
        }
        campionIp.snp.makeConstraints { make in
            make.top.equalTo(campionName.snp.bottom).offset(20)
            make.width.equalTo(50)
            make.centerX.equalTo(view)
        }
    }
}
