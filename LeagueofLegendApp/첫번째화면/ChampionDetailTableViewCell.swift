//
//  ChampionDetailTableViewCell.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/27.
//

import UIKit
import Kingfisher
import WebKit

class ChampionDetailTableViewCell: UITableViewCell {
    
    var tagsName: [String] = []
    var transformTagsName: [String] = []
    
    let championImage: UIImageView = {
        let view = UIImageView()
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
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .systemGray
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
    
    lazy var guideButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.green.cgColor
        return button
    }()
    
    let guideLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .green
        label.numberOfLines = 1
        label.text = "공략보기"
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
        
        self.guideButton.addTarget(self, action: #selector(centerButtontouch), for: .touchUpInside)
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
        contentView.addSubview(guideButton)
        addSubview(guideLabel)
        addSubview(championWinRate)
        addSubview(championPickRate)
        addSubview(championBanRate)
    }
    
    func layoutSetting() {
        
        championImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.height.equalTo(120)
            make.width.equalTo(150)
            make.left.equalTo(contentView.snp.left).offset(20)
        }
        championName.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(championImage.snp.right).offset(20)
        }
        
        championTitle.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24)
            make.left.equalTo(championName.snp.right).offset(3)
        }
        
        championPosition.snp.makeConstraints { make in
            make.top.equalTo(championName.snp.top).offset(20)
            make.left.equalTo(championImage.snp.right).offset(20)
        }
        
        championPosition2.snp.makeConstraints { make in
            if (championPosition.text != nil) == isHidden {
                make.top.equalTo(championName.snp.top).offset(20)
                make.left.equalTo(championPosition.snp.right).offset(5)
            } else {
            }
        }
        
        championWinRate.snp.makeConstraints { make in
            make.top.equalTo(championTitle.snp.bottom).offset(35)
            make.width.equalTo(50)
            make.left.equalTo(championImage.snp.right).offset(10)
        }
        championPickRate.snp.makeConstraints { make in
            make.top.equalTo(championWinRate.snp.bottom).offset(10)
            make.width.equalTo(50)
            make.left.equalTo(championImage.snp.right).offset(10)
        }
        championBanRate.snp.makeConstraints { make in
            make.top.equalTo(championPickRate.snp.bottom).offset(10)
            make.width.equalTo(50)
            make.left.equalTo(championImage.snp.right).offset(10)
        }
        guideButton.snp.makeConstraints { make in
            make.centerY.equalTo(championImage.snp.centerY)
            make.right.equalTo(-15)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        guideLabel.snp.makeConstraints { make in
            make.centerY.equalTo(championImage.snp.centerY)
            make.right.equalTo(-20)
        }
    }
    
    @objc func centerButtontouch(){
        guard let transformURL = URL(string: "https://m.inven.co.kr/site/lol/champ.php?iskin=lol"),UIApplication.shared.canOpenURL(transformURL) else { return }
        UIApplication.shared.open(transformURL, options: [:], completionHandler: nil)
    }
    
    @objc func buttonAction(){
        print("button")
    }
    
    func labelBackgroundColor(model: UILabel){
        if transformTagsName.first == "전사"{
            model.backgroundColor = .orange
        } else if transformTagsName.first == "탱커" {
            model.backgroundColor = .purple
        } else if transformTagsName.first == "마법사" {
            model.backgroundColor = .blue
        } else if transformTagsName.first == "암살자" {
            model.backgroundColor = .red
        } else if transformTagsName.first == "서폿터" {
            model.backgroundColor = .green
        } else {
            model.backgroundColor = .gray
        }
    }
    
    func labelBackgroundColor2(model: UILabel){
        if transformTagsName.last == "전사"{
            model.backgroundColor = .orange
        } else if transformTagsName.last == "탱커" {
            model.backgroundColor = .purple
        } else if transformTagsName.last == "마법사" {
            model.backgroundColor = .blue
        } else if transformTagsName.last == "암살자" {
            model.backgroundColor = .red
        } else if transformTagsName.last == "서폿터" {
            model.backgroundColor = .green
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
        
        championWinRate.text = "승률"
        championPickRate.text = "픽률"
        championBanRate.text = "벤률"
    }
    
}
