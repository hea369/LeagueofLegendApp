//
//  NewsViewController.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/29.
//

import UIKit

class NewsViewController: UIViewController {
    
    var weekNumber: [String] = []
    
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .white
        return tableview
    }()
    
    let date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        dateWeek()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    

    
    func setup() {
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsViewDetailTableViewCell.self, forCellReuseIdentifier: "NewsViewDetailTableViewCell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func dateWeek(){
        if Calendar.current.component(.day, from: date) / 7 == 0 {
            weekNumber.append("1")
        } else if Calendar.current.component(.day, from: date) / 7 == 1 {
            weekNumber.append("1")
            weekNumber.append("2")
        } else if Calendar.current.component(.day, from: date) / 7 == 2 {
            weekNumber.append("1")
            weekNumber.append("2")
            weekNumber.append("3")
        } else if Calendar.current.component(.day, from: date) / 7 == 3 {
            weekNumber.append("1")
            weekNumber.append("2")
            weekNumber.append("3")
            weekNumber.append("4")
        } else {
            weekNumber.append("1")
            weekNumber.append("2")
            weekNumber.append("3")
            weekNumber.append("4")
            weekNumber.append("5")
        }
    }

}

extension NewsViewController: UITableViewDelegate {
    
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let month = Calendar.current.component(.month, from: date)
        return month / 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsViewDetailTableViewCell") as? NewsViewDetailTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        let cellInfo = weekNumber[indexPath.row]
        cell.setModel(model: cellInfo)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
