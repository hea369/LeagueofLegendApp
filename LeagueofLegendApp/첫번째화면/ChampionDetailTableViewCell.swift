//
//  ChampionDetailTableViewCell.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/27.
//

import UIKit
import Kingfisher

class ChampionDetailTableViewCell: UITableViewCell {
    
    // 이미지뷰1, 레이블7, 막대그래프 3
    let championImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        return view
    }()
    
    let championName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
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
    }
    
    func layoutSetting() {
        championImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.width.height.equalTo(120)
            make.left.equalTo(contentView.snp.right)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        championName.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.width.equalTo(50)
            make.left.equalTo(championImage.snp.right).offset(20)
        }
        championWinRate.snp.makeConstraints { make in
            make.top.equalTo(championName.snp.bottom).offset(10)
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
    func setModel(model: Champion) {
        championName.text = model.name
        let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(model.id)_0.jpg")
        championImage.kf.setImage(with: url)
    }
}
