//
//  HomeViewController.swift
//  Aksam
//
//  Created by emirhan battalbaş on 22.03.2020.
//  Copyright © 2020 emirhan battalbaş. All rights reserved.
//

import UIKit
import iCarousel

class HomeViewController: UIViewController {

    // TableView
    @IBOutlet weak var leftMenuTableView: UITableView!
    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var leftMenuOpenButtonOutlet: UIButton!
    @IBOutlet weak var leftMenuCloseButtonOutlet: UIButton!
    
    @IBOutlet weak var leftMenuLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var blackBgView: UIView!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var carouselView: iCarousel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slider: [Section] = []
    var news: [Section] = []
    var programs: [Section] = []

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
        configureCarouselView()
        configurePageControl()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        homePageRequest()
        
        leftMenuLeadingConstraint.constant = -leftMenuLeadingConst
    }
    
        fileprivate func homePageRequest() {
            
            APIClient.homePage { (result) in
                switch result {
                case .success(let response):
                    
                    self.slider = response.secitons.filter({ $0.sectionType == SectionType.SLIDER.rawValue })
                    self.news = response.secitons.filter({ $0.sectionType == SectionType.NEWS.rawValue })
                    self.programs = response.secitons.filter({ $0.sectionType == SectionType.PROGRAMS.rawValue })

                    self.homeTableView.reloadData()
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    
    func configureCarouselView() {
        carouselView.type = .linear
        carouselView.perspective = -0.0025
        carouselView.isPagingEnabled = true
        carouselView.scrollSpeed = 0.5
        
    }
    
    func configurePageControl() {
        
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor(red: 153.0 / 255.0, green: 153.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 52.0 / 255.0, green: 52.0 / 255.0, blue: 52.0 / 255.0, alpha: 1.0)
    }
    
    fileprivate func registerCell() {
        
        homeTableView.tableHeaderView = headerView
        
        homeTableView.register(cellType: NewsTableViewCell.self)
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
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard tableView == homeTableView else  {
            let cell: LeftMenuTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        }
        
        let cell: NewsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        let viewModel = NewsTableViewCell.ViewModel(data: news[indexPath.row].itemList, newsTypeTitle: news[indexPath.row].title)
        cell.configure(viewModel: viewModel)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension HomeViewController: iCarouselDataSource, iCarouselDelegate{
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        
        return 5
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        let carouselView = Bundle.main.loadNibNamed("SliderCarouselView", owner: self, options: nil)?.first as! SliderCarouselView
        
        carouselView.layer.frame.size.width = UIScreen.main.bounds.size.width

        return carouselView
        
    }
    
    func carouselDidScroll(_ carousel: iCarousel) {
        
        pageControl.currentPage = carousel.currentItemIndex
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        if option == .spacing {
            return value * 1.5
        } else if option == .visibleItems {
            return 3
        }else if option == .wrap {
            return 1.0
        }else if option == .arc {
            return 4.5
        }
        return value
    }
}

