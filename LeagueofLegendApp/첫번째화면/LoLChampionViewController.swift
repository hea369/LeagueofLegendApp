//
//  LoLChampionViewController.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/27.
//

import UIKit
import SnapKit
import Alamofire

class LoLChampionViewController: UIViewController {
    
    var model: LOLChampion?
    
    var modelDum: [Champion] = []
    
    let tableiw: UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "챔피언 검색"
        return searchBar
    }()
    
    let backBarkButtonItem: UIBarButtonItem = {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        return backButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetting()
        callAPI()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func callAPI(){
        AF.request("http://ddragon.leagueoflegends.com/cdn/12.20.1/data/ko_KR/champion.json").response { response in
            debugPrint(response)
            guard let data = response.data else { return }
            let model = try! JSONDecoder().decode(LOLChampion.self, from: data)
            self.model = model
            self.modelDum = Array(model.data.values)
            self.tableiw.reloadData()
        }
    }
    
    //  urlssection 통신
    //    func testAPI(){
    //        LoLAPI.callAPI { data in
    //            self.modelDum = Array(data.data.values)
    //            self.tableiw.reloadData()
    //        }
    //    }
    
    func navigationSetting(){
        navigationController?.navigationBar.backgroundColor = .systemBackground
        self.navigationItem.titleView = searchBar
        self.navigationItem.backBarButtonItem = backBarkButtonItem
    }
    
    func setup() {
        view.backgroundColor = .systemBackground
        tableiw.delegate = self
        tableiw.dataSource = self
        tableiw.register(ChampionDetailTableViewCell.self, forCellReuseIdentifier: "ChampionDetailTableViewCell")
        view.addSubview(tableiw)
    
        tableiw.snp.makeConstraints { make in
            make.width.height.equalTo(self.view)
        }
    }
}

extension LoLChampionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "League of Legends Champion"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
}

extension LoLChampionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.data.values.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChampionDetailTableViewCell") as? ChampionDetailTableViewCell else { return UITableViewCell() }
        
        let championInfo = modelDum[indexPath.row]
        cell.setModel(model: championInfo)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
        detailViewController.campionImage.image = UIImage(systemName: "star")
        detailViewController.campionName.text = "이름"
        detailViewController.campionIp.text = "Ip"
    }
}
