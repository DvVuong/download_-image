//
//  LoadImagePresenter.swift
//  Loadimage
//
//  Created by admin on 30/09/2022.
//

import Foundation
protocol LoadImagePresenterView: AnyObject {
    func showimage()
    
}
class LoadImagePresenter {
    private var imageLists = [ImageData]()
    private weak var view: LoadImagePresenterView?
    init(with view: LoadImagePresenterView) {
        self.view = view
    }
    func loadImage(){
        let image1 = ImageData(name: "Cassini", url: "https://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg")
        let image2 = ImageData(name: "Earth", url: "https://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg")
        let image3 = ImageData(name: "Saturn", url: "https://www.nasa.gov/sites/default/files/saturn_collage.jpg")
        imageLists.append(image1)
        imageLists.append(image2)
        imageLists.append(image3)
        view?.showimage()
    }
    func numberOfRow() -> Int {
        return imageLists.count
    }
    func cellForRowAt(_ index: Int) -> ImageData?  {
        guard  index >= 0 && index < numberOfRow() else {
            return nil
        }
        return imageLists[index]
    }
}
