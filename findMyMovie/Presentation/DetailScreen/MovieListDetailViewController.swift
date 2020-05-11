//
//  MovieListDetailViewController.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 10/05/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import UIKit
import Kingfisher

protocol MovieListDetailViewProtocol: class{
    
}

class MovieListDetailViewController: BaseViewController<MovieListDetailPresenterProtocol> {
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView() {
        self.getMovieInformation()
    }
    
    func getMovieInformation() {
        guard let movieInformation = self.presenter?.getMovieInformation() else { return }
        self.configureView(movieInformation: movieInformation)
    }
    
    func configureView(movieInformation: Result) {
        
        self.movieTitleLabel.text = movieInformation.name
        self.artistNameLabel.text = movieInformation.artistName
        
        let url = URL(string: movieInformation.artworkUrl100 ?? "")
        
        
        // Kingfisher API
        let processor = DownsamplingImageProcessor(size: self.bannerImageView.bounds.size) |> RoundCornerImageProcessor(cornerRadius: 10)
        
        self.bannerImageView.kf.indicatorType = .activity
        
        self.bannerImageView.kf.setImage(with: url, placeholder: UIImage(named: "movieListCellPlaceHolder"),
                                         options: [
                                            .processor(processor),
                                            .scaleFactor(UIScreen.main.scale),
                                            .transition(.fade(1)),
                                            .cacheOriginalImage
        ])
        
        self.artworkImageView.kf.indicatorType = .activity
        
        self.artworkImageView.kf.setImage(with: url, placeholder: UIImage(named: "movieListCellPlaceHolder"),
                                         options: [
                                            .processor(processor),
                                            .scaleFactor(UIScreen.main.scale),
                                            .transition(.fade(1)),
                                            .cacheOriginalImage
        ])
        
    }

}

 extension MovieListDetailViewController: MovieListDetailViewProtocol {

}
