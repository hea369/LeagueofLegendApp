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
    
    let tableiw: UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setup() {
        view.backgroundColor = .systemBackground
        tableiw.delegate = self
        tableiw.dataSource = self
        tableiw.register(ChampionDetailTableViewCell.self, forCellReuseIdentifier: "ChampionDetailTableViewCell")
        tableiw.rowHeight = UITableView.automaticDimension
        tableiw.estimatedRowHeight = UITableView.automaticDimension
        view.addSubview(tableiw)
        tableiw.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableiw.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableiw.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableiw.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableiw.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

}

extension LoLChampionViewController: UITableViewDelegate {
    
}

extension LoLChampionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChampionDetailTableViewCell") as? ChampionDetailTableViewCell else { return UITableViewCell() }
        
        cell.campionName.text = "챔피언이름"
        cell.campionImage.image = UIImage(systemName: "star")
        cell.campionWinRate.text = "승률"
        cell.campionPickRate.text = "픽률"
        cell.campionBanRate.text = "벤률"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
        detailViewController.campionImage.image = UIImage(systemName: "star")
        detailViewController.campionName.text = "팍쒸"
        detailViewController.campionIp.text = "Ip"
    }
}
