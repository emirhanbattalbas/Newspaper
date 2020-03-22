//
//  HomeViewController.swift
//  Aksam
//
//  Created by emirhan battalbaş on 22.03.2020.
//  Copyright © 2020 emirhan battalbaş. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // TableView
    @IBOutlet weak var leftMenuTableView: UITableView!
    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var leftMenuOpenButtonOutlet: UIButton!
    @IBOutlet weak var leftMenuCloseButtonOutlet: UIButton!
    
    @IBOutlet weak var leftMenuLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var blackBgView: UIView!
    
    var leftMenuLeadingConst: CGFloat {
        get {
            return Utils.getScreenWidth()*0.7
        }set {
            leftMenuLeadingConstraint.constant = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell() 
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        leftMenuLeadingConstraint.constant = -leftMenuLeadingConst
    }
    
    fileprivate func registerCell() {
        leftMenuTableView.register(cellType: LeftMenuTableViewCell.self)
    }
    
    @IBAction func leftMenuOpenButtonTapped(_ sender: Any) {
        leftMenuOpenOrClose(isOpen: true)
    }
    
    @IBAction func leftMenuCloseButtonTapped(_ sender: Any) {
        leftMenuOpenOrClose(isOpen: false)
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        
    }
    
    fileprivate func leftMenuOpenOrClose(isOpen: Bool)  {
    
        leftMenuCloseButtonOutlet.isUserInteractionEnabled = isOpen
        
        leftMenuLeadingConst = isOpen ? 0 : -Utils.getScreenWidth()*0.7
        
        UIView.animateKeyframes(withDuration: 0.5,
                                delay: 0.0,
                                options: .calculationModePaced,
                                animations: {
                                    self.blackBgView.alpha = isOpen ? 0.2 : 0.0
                                    self.view.layoutIfNeeded()
        })
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: LeftMenuTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
