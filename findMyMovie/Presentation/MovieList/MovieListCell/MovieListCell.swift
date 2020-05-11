//
//  MovieListCell.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelDirector: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(viewModel: Result) {
        
        self.labelTitle.text = viewModel.name
        self.labelDirector.text = viewModel.artistName
        
        let url = URL(string: viewModel.artworkUrl100 ?? "")

        
        // Kingfisher API
        let processor = DownsamplingImageProcessor(size: self.imageMovie.bounds.size) |> RoundCornerImageProcessor(cornerRadius: 10)
        
        self.imageMovie.kf.indicatorType = .activity
        self.imageMovie.kf.setImage(
            with: url,
            placeholder: UIImage(named: "movieListCellPlaceHolder"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        
    }
    
}
