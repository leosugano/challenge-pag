//
//  DetailViewController.swift
//  challenge-pag
//
//  Created by Leonardo Sugano on 09/03/21.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var beerImageView: UIImageView?
    @IBOutlet weak var beerNameLabel: UILabel?
    @IBOutlet weak var taglineLabel: UILabel?
    @IBOutlet weak var alcoholContentLabel: UILabel?
    @IBOutlet weak var bitternessScaleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    
    //MARK: - Lets
    
    //MARK: - Vars
    var presenter: ViewToPresenterDetailProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.presenter?.showDetailBeer()
    }
    
    private func setupNavigationBar() {
        self.title = "detail_title".localized()
    }
}

extension DetailViewController : PresenterToViewDetailProtocol {
    func showDetailBeer(beer: BeerModel) {
        self.beerImageView?.sd_setImage(with: URL(string: beer.imageBeer ?? ""), placeholderImage: UIImage(named: "beer-placeholder"))
        self.beerNameLabel?.text = beer.name
        self.taglineLabel?.text = beer.tagline
        self.alcoholContentLabel?.text = "Teor alcoólico: \(beer.alcoholContent?.doubleValue ?? 0)%"
        self.bitternessScaleLabel?.text = "Escala de amargor: \(beer.bitternessScale?.intValue ?? 0)"
        self.descriptionLabel?.text = beer.descriptionBeer
    }
}
