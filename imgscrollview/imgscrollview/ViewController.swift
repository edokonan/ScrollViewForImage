//
//  ViewController.swift
//  imgscrollview
//
//  Created by ZHUKUI on 2016/03/06.
//  Copyright © 2016年 ZHUKUI. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {
    
    @IBOutlet var scrollView: TouchScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.pagingEnabled = false
        scrollView.userInteractionEnabled = true
        
        scrollView.imageView = UIImageView(image: UIImage(named: "fengjing.jpg"))
        scrollView.imageView.userInteractionEnabled=true
        scrollView.addSubview(scrollView.imageView)

        
        scrollView.Person = UIImageView(image: UIImage(named: "point.png"))
        scrollView.Person.center = CGPointMake(160, 330)
        let rect:CGRect = CGRectMake(0, 0, 50, 50)
        scrollView.Person!.frame = rect;
        
        scrollView.addSubview(scrollView.Person)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let size = scrollView.imageView.image?.size {
            // imageView完全放在scrollView之内
            let wrate = scrollView.frame.width / size.width
            let hrate = scrollView.frame.height / size.height
            let rate = min(wrate, hrate, 1)
            scrollView.imageView.frame.size = CGSizeMake(size.width * rate, size.height * rate)
            
            // 按照图片大小设置contentSize
            scrollView.contentSize = scrollView.imageView.frame.size
            // 为了初始设置更新contentInset
            updateScrollInset()
        }
    }
    
    func viewForZoomingInScrollView(inscrollView: UIScrollView) -> UIView? {
        // 为了缩放，需要设定
        return scrollView.imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        // 在缩放时，需要更新contentInset
        updateScrollInset()
    }
    
    private func updateScrollInset() {
        // 根据imageView的大小来设置contentInset
        // 不能比0小
        scrollView.contentInset = UIEdgeInsetsMake(
            max((scrollView.frame.height - scrollView.imageView.frame.height)/2, 0),
            max((scrollView.frame.width - scrollView.imageView.frame.width)/2, 0),
            0,
            0
        );
        //print(scrollView.contentInset)
    }
}

