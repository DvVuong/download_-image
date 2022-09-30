//
//  DetailPresenter.swift
//  Loadimage
//
//  Created by admin on 30/09/2022.
//

import Foundation
import UIKit
protocol DetailPresenterView: AnyObject {
    func loadData(_ data : ImageData)
}
class DetailPresenter {
    private weak var view: DetailPresenterView?
    private var data: ImageData?
    init(with view: DetailPresenterView, with data:ImageData) {
        self.view = view
        self.data = data
    }
    func showData() {
        view?.loadData(data!)
    }

}
