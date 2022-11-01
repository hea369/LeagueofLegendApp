//
//  ChampionDetailTableViewCell.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/27.
//

import UIKit
import Kingfisher

class ChampionDetailTableViewCell: UITableViewCell {
    
    var tagsName: [String] = []
    var transformTagsName: [String] = []
    
    // 이미지뷰1, 레이블7, 막대그래프 3
    let championImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        return view
    }()
    
    let championName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let championTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let championPosition: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 1
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    let championPosition2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 1
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    let championWinRate: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        return label
    }()
    
    let championPickRate: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        return label
    }()
    
    let championBanRate: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    func addView() {
        addSubview(championName)
        addSubview(championImage)
        addSubview(championWinRate)
        addSubview(championPickRate)
        addSubview(championBanRate)
        addSubview(championTitle)
        addSubview(championPosition)
        addSubview(championPosition2)
    }
    
    func layoutSetting() {
        championImage.snp.makeConstraints { make in
//            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(contentView.snp.top).offset(20)
            make.width.height.equalTo(120)
            make.left.equalTo(contentView.snp.left).offset(20)
        }
        championName.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(championImage.snp.right).offset(20)
        }
        
        championTitle.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(championName.snp.right).offset(3)
        }
        
        championPosition.snp.makeConstraints { make in
            make.top.equalTo(championName.snp.top).offset(20)
            make.left.equalTo(championImage.snp.right).offset(20)
        }
        
        championPosition2.snp.makeConstraints { make in
            make.top.equalTo(championName.snp.top).offset(20)
            make.left.equalTo(championImage.snp.right).offset(60)
        }
        
        championWinRate.snp.makeConstraints { make in
            make.top.equalTo(championTitle.snp.bottom).offset(10)
            make.width.equalTo(50)
            make.left.equalTo(championImage.snp.right).offset(20)
        }
        championPickRate.snp.makeConstraints { make in
            make.top.equalTo(championWinRate.snp.bottom).offset(10)
            make.width.equalTo(50)
            make.left.equalTo(championImage.snp.right).offset(20)
        }
        championBanRate.snp.makeConstraints { make in
            make.top.equalTo(championPickRate.snp.bottom).offset(10)
            make.width.equalTo(50)
            make.left.equalTo(championImage.snp.right).offset(20)
        }
    }
    
    func labelBackgroundColor(model: UILabel){
        if transformTagsName.first == "전사"{
            model.backgroundColor = .blue
        } else if transformTagsName.first == "탱커" {
            model.backgroundColor = .red
        } else if transformTagsName.first == "마법사" {
            model.backgroundColor = .green
        } else if transformTagsName.first == "암살자" {
            model.backgroundColor = .gray
        } else if transformTagsName.first == "서폿터" {
            model.backgroundColor = .orange
        } else {
            model.backgroundColor = .gray
        }
    }
    
    func labelBackgroundColor2(model: UILabel){
        if transformTagsName.last == "전사"{
            model.backgroundColor = .blue
        } else if transformTagsName.last == "탱커" {
            model.backgroundColor = .red
        } else if transformTagsName.last == "마법사" {
            model.backgroundColor = .green
        } else if transformTagsName.last == "암살자" {
            model.backgroundColor = .gray
        } else if transformTagsName.last == "서폿터" {
            model.backgroundColor = .orange
        } else {
            model.backgroundColor = .gray
        }
    }
    
    func setModel(model: Champion) {
        championName.text = "\(model.name),"
        for a in model.tags{
            tagsName.append(a.rawValue)
        }
        for b in 0..<tagsName.count{
            transformTagsName.append(tagsName[b].translate())
        }
        if transformTagsName.first == transformTagsName.last{
            labelBackgroundColor(model: championPosition)
            championPosition.text = transformTagsName.first
            championPosition2.text = ""
        } else {
            labelBackgroundColor(model: championPosition)
            championPosition.text = transformTagsName.first
            labelBackgroundColor2(model: championPosition2)
            championPosition2.text = transformTagsName.last
        }
        championTitle.text = model.title
        let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(model.id)_0.jpg")
        championImage.kf.setImage(with: url)
    }
}
