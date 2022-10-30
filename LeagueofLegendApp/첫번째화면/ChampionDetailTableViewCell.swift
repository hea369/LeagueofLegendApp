//
//  ChampionDetailTableViewCell.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/27.
//

import UIKit

class ChampionDetailTableViewCell: UITableViewCell {
    
    // 이미지뷰1, 레이블7, 막대그래프 3
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
    
    let campionWinRate: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        return label
    }()
    
    let campionPickRate: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        return label
    }()
    
    let campionBanRate: UILabel = {
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
        addSubview(campionName)
        addSubview(campionImage)
        addSubview(campionWinRate)
        addSubview(campionPickRate)
        addSubview(campionBanRate)
    }
    
    func layoutSetting() {
        campionImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.width.height.equalTo(150)
            make.left.equalTo(contentView.snp.right)
        }
        campionName.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.width.equalTo(50)
            make.left.equalTo(campionImage.snp.right).offset(20)
        }
        campionWinRate.snp.makeConstraints { make in
            make.top.equalTo(campionName.snp.bottom).offset(10)
            make.width.equalTo(50)
            make.left.equalTo(campionImage.snp.right).offset(20)
        }
        campionPickRate.snp.makeConstraints { make in
            make.top.equalTo(campionWinRate.snp.bottom).offset(10)
            make.width.equalTo(50)
            make.left.equalTo(campionImage.snp.right).offset(20)
        }
        campionBanRate.snp.makeConstraints { make in
            make.top.equalTo(campionPickRate.snp.bottom).offset(10)
            make.width.equalTo(50)
            make.left.equalTo(campionImage.snp.right).offset(20)
        }
    }
    func setModel(model: Champion) {
        campionName.text = model.name
        
    }
}
