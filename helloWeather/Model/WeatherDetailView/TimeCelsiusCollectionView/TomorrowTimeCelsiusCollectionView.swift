//
//  TomorrowTimeCelsiusCollectionView.swift
//  helloWeather
//
//  Created by 이유진 on 5/15/24.
//

import UIKit
import RxSwift
import RxCocoa

class TomorrowTimeCelsiusCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var viewModel: WeatherDetailViewModel?
    private var disposeBag = DisposeBag()
    var hourlyWeatherData: [WeatherDetailViewModel.HourlyWeather] = []
    
    weak var todayCollectionView: TodayTimeCelsiusCollectionView?
    
    init(viewModel: WeatherDetailViewModel, todayCollectionView: TodayTimeCelsiusCollectionView) {
        self.viewModel = viewModel
        self.todayCollectionView = todayCollectionView
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
        self.register(FirstRightCollectionViewCell.self, forCellWithReuseIdentifier: FirstRightCollectionViewCell.identifier)
        self.showsHorizontalScrollIndicator = false
        self.isScrollEnabled = false
        
        bindViewModel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewModel 바인딩
    private func bindViewModel() {
        viewModel?.fetchHourlyWeather()
            .subscribe(onNext: { [weak self] hourlyWeather in
                guard let self = self, let todayCollectionView = self.todayCollectionView else { return }
                
//                print("전체 데이터: \(hourlyWeather)")
                
                // 첫 번째 0시의 인덱스 찾기
                guard let firstZeroHourIndex = hourlyWeather.firstIndex(where: { $0.time.hasPrefix("0시") }) else { return }
                
                // 첫 번째 0시부터 3시간 간격으로 필터링된 시간대 가져오기
                var nextDayHourlyWeather = hourlyWeather[firstZeroHourIndex...].enumerated().compactMap { index, hourlyData in
                    guard index % 3 == 0 else { return nil }
                    return hourlyData
                } as [WeatherDetailViewModel.HourlyWeather]
                
                // TomorrowTimeCelsiusCollectionView 셀 개수 설정
                let todayCellCount = todayCollectionView.hourlyWeatherData.count
                let requiredCellCount = min(8, max(0, 16 - todayCellCount))
                nextDayHourlyWeather = Array(nextDayHourlyWeather.prefix(requiredCellCount))
                
//                print("필터링된 데이터: \(nextDayHourlyWeather)")
//                print("오늘 데이터: \(todayCellCount)")
//                print("내일 데이터: \(requiredCellCount)")
                self.hourlyWeatherData = nextDayHourlyWeather
                self.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyWeatherData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: FirstRightCollectionViewCell.identifier, for: indexPath) as! FirstRightCollectionViewCell
        
        let hourlyWeather = hourlyWeatherData[indexPath.item]
        cell.configureConstraints(data: hourlyWeather)
        cell.celsiusLabel.text = hourlyWeather.feelslikeC
        cell.timeLabel.text = hourlyWeather.time
        cell.celsiusLabel.textColor = .mygray
        cell.timeLabel.textColor = .mygray
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width: CGFloat = 40
        let height: CGFloat = 119
        return CGSize(width: width, height: height)
    }
    
}
