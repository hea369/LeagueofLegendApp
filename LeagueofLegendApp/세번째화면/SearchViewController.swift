//
//  SerchViewController.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/29.
//

import UIKit
import WebKit

class SearchViewController: UIViewController {
    
    var webView: WKWebView!
    
    
    let segmentedControl: UISegmentedControl = {
        let items = ["op", "fow", "deep"]
        let control = UISegmentedControl(items: items)
        return control
    }()
//    let op: UIView = {
//        let view = UIView()
//        view.backgroundColor = .green
//        return view
//    }()
//    let fow: UIView = {
//        let view = UIView()
//        view.backgroundColor = .yellow
//        return view
//    }()
//
//    let deep: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        return view
//    }()
    
    var testLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    override func loadView() {
        super.loadView()
        webView = WKWebView(frame: self.view.frame)
        self.view = self.webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
        webViewSetting()
        addView()
        viewLayoutSetting()
    }
    
    func webViewSetting(){
        let sURL = "https://www.op.gg"
        let uURL = URL(string: sURL)
        var request = URLRequest(url: uURL!)
        webView.load(request)
    }
    
    func addView(){
        view.addSubview(segmentedControl)
//        view.addSubview(op)
//        view.addSubview(fow)
//        view.addSubview(deep)
        view.addSubview(testLabel)
    }
    
    func viewLayoutSetting() {
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.snp.centerX)
        }
        
//        op.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
//            make.centerX.equalTo(view.snp.centerX)
//        }
        
        testLabel.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.top).offset(50)
            make.centerX.equalTo(segmentedControl.snp.centerX)
            
//            fow.snp.makeConstraints { make in
//                make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
//                make.centerX.equalTo(view.snp.centerX)
//            }
//
//            deep.snp.makeConstraints { make in
//                make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
//                make.centerX.equalTo(view.snp.centerX)
//            }
            
        }
    }
    @objc func didChangeValue(segment: UISegmentedControl) {
    
        if segment.selectedSegmentIndex == 0 {
            let sURL = "https://www.op.gg"
            let uURL = URL(string: sURL)
            var request = URLRequest(url: uURL!)
            webView.load(request)
        } else if segment.selectedSegmentIndex == 1 {
            let sURL = "http://fow.kr"
            let uURL = URL(string: sURL)
            var request = URLRequest(url: uURL!)
            webView.load(request)
        } else {
            let sURL = "https://www.deeplol.gg"
            let uURL = URL(string: sURL)
            var request = URLRequest(url: uURL!)
            webView.load(request)
        }
    }
}
