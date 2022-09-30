//
//  ScrollViewController.swift
//  Loadimage
//
//  Created by admin on 30/09/2022.
//

import UIKit

class ScrollViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupScrollView()
    }
    private func setupScrollView() {
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
        scrollView.contentSize = .init(width: 2000, height: 2000)
        
    }
    

   
}

extension ScrollViewController: UIScrollViewDelegate {
    
}
