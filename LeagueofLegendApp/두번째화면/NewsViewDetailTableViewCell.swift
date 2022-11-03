//
//  NewsViewDetailTableViewCell.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/11/03.
//

import UIKit

class NewsViewDetailTableViewCell: UITableViewCell {
    
    let date = Date()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    let championrotationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    let rotationImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemBackground
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        addView()
        layoutSetting()
        // Configure the view for the selected state
    }
    
    func addView() {
        addSubview(dateLabel)
        addSubview(championrotationLabel)
        addSubview(rotationImageView)
    }
    
    func layoutSetting() {
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(20)
        }
        
        championrotationLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.left.equalTo(contentView.snp.left).offset(20)
        }
        
        rotationImageView.snp.makeConstraints { make in
            make.top.equalTo(championrotationLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(300)
        }
    }
    
    func setModel(model: String){
        
        dateLabel.text = "\(Calendar.current.component(.month, from: date))월 \(model)주"
        championrotationLabel.text = "챔피언 로테이션"
        
        
        //url 이미지  ( 로테이션 이미지 url을 못찾아 임시로 넣음)
        let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/Irelia_0.jpg")
        rotationImageView.kf.setImage(with: url)
    }
}
