//
//  ViewController.swift
//  Loadimage
//
//  Created by admin on 30/09/2022.
//

import UIKit

class LoadImageViewController: UIViewController {
    @IBOutlet private  var tabelView: UITableView!
    
    private lazy var presenter = LoadImagePresenter(with: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.loadImage()
        setupImageTable()
    }
    
    private func setupImageTable(){
        tabelView.delegate = self
        tabelView.dataSource = self

    }



}
extension LoadImageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRow()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageTableViewCell
        if let data = presenter.cellForRowAt(indexPath.row) {
            cell.updateUI(data)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController.instance(presenter.cellForRowAt(indexPath.row)!)
        navigationController?.pushViewController(vc, animated: true)
    }
}





extension LoadImageViewController: LoadImagePresenterView {
    func showimage() {
        
    }
    
}
