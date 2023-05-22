# fitpet
fitpet 과제 전형

# View Info
## ViewController
 - 설명 : 최초 실행 뷰 tableView를 사용하였다.
 - Type : UIViewConteoller
 - 수정 예정사항 
      MVC -> MVVM 패턴 변경
      IGListKit을 이용한 ScrollView 제작

## ItemCell
  - 설명 : 각각의 날씨를 표시해줄 정보를 담은 Cell
  - Type : UITableViewCell

# ViewModel Info
## ItemCellViewModel
  - 설명 : 각각의 날씨를 표시해줄 정보를 담은 Class
  - Type : NSObject
  - Observalbe : import RxSwift

    just : 하나의 값을 방출한다.</br>
    of : 여러개의 값을 방출한다.</br>
    from : 배열의 값을 방출한다.
  

# Model Info
## CityWeatherModel
  - 설명 : 날씨 API 받기위한 Model 
## SectionModel
  - 설명  : TableView dataSource 적용을 위한 Model

# 사용 Library

* RxSwift

  비동기&이벤트를 위한 코드로 구성하고 있는 라이브러리
 
* RxCocoa

  "UIKit 및 Cocoa개발을 지원하는 클래스"를 보유하고 있는 RxSwift동반 라이브러리

* RxDataSources

   RxSwift 용 UITableView와 UICollectionView의 DataSources 관련 라이브러리
   
* Alamofire

  스위프트 기반 Http 네트워킹 라이브러리
