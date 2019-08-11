//
//  ViewController.swift
//  hikingDemo_scroll&zoom
//
//  Created by APAN on 2019/8/10.
//  Copyright © 2019 APAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var scrollViewColection: [UIScrollView]!
    @IBOutlet var imageColection: [UIImageView]!
    @IBOutlet weak var mainScroll: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = 9
        pageControl.currentPage = 0
        for scrollView in scrollViewColection {
            scrollView.delegate = self
            scrollView.maximumZoomScale = 5
            scrollView.minimumZoomScale = 1
            scrollView.zoomScale = 1
        }
        mainScroll.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = currentPage
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageColection[pageControl.currentPage]
    }


}

