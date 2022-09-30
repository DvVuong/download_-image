//
//  DetailViewController.swift
//  Loadimage
//
//  Created by admin on 30/09/2022.
//

import UIKit



class DetailViewController: UIViewController {
    static func instance(_ data: ImageData) -> DetailViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil ).instantiateViewController(withIdentifier: "DetailScreen") as! DetailViewController
        vc.presenter = DetailPresenter(with: vc, with: data)
        return vc
    }
    
    @IBOutlet private var tvLink: UITextView!
    @IBOutlet private var image: UIImageView!
    @IBOutlet private  var proGress: UIProgressView!
    
    
    private var presenter: DetailPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showData()
        setupProgress()
        downLoadImage()
        setupImage()
    }
    private func setupScrollView(){
            
    }
    private func setupImage(){
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        image.contentMode = .scaleToFill
        image.isUserInteractionEnabled = true
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didTapToPinch))
        image.addGestureRecognizer(pinchGesture)
    }
    @objc func didTapToPinch(pinch: UIPinchGestureRecognizer){
        if let view = pinch.view {
            let x = pinch.scale
            let y = pinch.scale
            view.transform = view.transform.scaledBy(x: x, y: y)
            pinch.scale = 1
        }
    }
    private func setupProgress(){
        proGress.setProgress(0, animated: true)
        proGress.trackTintColor = .lightGray
        proGress.tintColor = .blue
        view.addSubview(proGress)
    }
    func downLoadImage() {
        let url = URL(string: tvLink.text!)
        let secsion = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        secsion.downloadTask(with: url!).resume()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

}
extension DetailViewController: DetailPresenterView {
    func loadData(_ data: ImageData) {
        tvLink.text = data.url
    }
}
extension DetailViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        if let data = try? Data(contentsOf: location) {
            DispatchQueue.main.async {
                self.image.image = UIImage(data: data)
            }
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)// Tổng số byte tải về / số byte sẽ tải về
        DispatchQueue.main.async {
            self.proGress.progress = progress
        }
        
    }
}
