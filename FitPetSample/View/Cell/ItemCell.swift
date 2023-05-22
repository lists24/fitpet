//
//  ItemCell.swift
//  FitPetSample
//
//  Created by 크림버드공주 on 2023/05/19.
//

import UIKit
import RxSwift

class ItemCell: UITableViewCell {

    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var WeatherLabel: UILabel!
    @IBOutlet weak var MaxLabel: UILabel!
    @IBOutlet weak var MinLabel: UILabel!
    @IBOutlet weak var WeatherIconImageView: UIImageView!
    
    var disposeBag = DisposeBag()
    
    var itemCellModel : ItemCellViewModel?
    {
        didSet{
            itemCellModel?.weatherImage
                .bind(to: WeatherIconImageView.rx.image)
                .disposed(by: disposeBag)
            
            itemCellModel?.weather
                .bind(to: WeatherLabel.rx.text)
                .disposed(by: disposeBag)
            
            itemCellModel?.temp_max
                .bind(to: MaxLabel.rx.text)
                .disposed(by: disposeBag)
            
            itemCellModel?.temp_min
                .bind(to: MinLabel.rx.text)
                .disposed(by: disposeBag)
            
            itemCellModel?.date?
                .bind(to: DateLabel.rx.text)
                .disposed(by: disposeBag)
        }
    }
    
    var weatherList : List = List.EMPTY
    {
        didSet{
            if weatherList != List.EMPTY
            {
                itemCellModel = ItemCellViewModel(list: weatherList)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
