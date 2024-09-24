![image](https://github.com/user-attachments/assets/a0538c20-f2e3-4ac5-bf4b-a26cd6e873d6)

## HelloWeather

**심플한 애니메이션으로 전달하는 상세 날씨 정보 앱**

내일배움캠프 iOS 3기 13조의 팀 프로젝트로, 사용자 맞춤형 날씨 정보를 제공하는 iOS 앱입니다. 현대카드 웨더 앱에서 영감을 받아 디자인되었으며, 생동감 있는 애니메이션과 함께 사용자 위치 기반 및 검색 지역의 상세 날씨 정보, 북마크 기능, 비 소식 알림 기능을 제공합니다. 이 리드미 파일은 @eqqmayo가 구현한 부분을 중심으로 서술합니다.
<br><br>
<p align="center"><img width="190" alt="1" src="https://github.com/user-attachments/assets/b07dbd74-4f20-4395-97c7-922d89da77ec"><img width="190" alt="2" src="https://github.com/user-attachments/assets/0b3ca90b-7eb1-4837-b73f-43f876d0e071"><img width="190" alt="3" src="https://github.com/user-attachments/assets/c1f61b68-e81b-4958-be6f-e0284031635a"><img width="190" alt="4" src="https://github.com/user-attachments/assets/b7210d76-b301-431d-bbec-88ef96508950"></p>


## Features

- **사용자 위치 정보**: CoreLocation을 활용하여 사용자의 현재 위치 정보(위도, 경도, 지역명)를 실시간으로 가져옵니다.
- **날씨 정보**: Weather API를 통해 사용자 위치 또는 검색 위치의 현재 날씨 정보를 비동기적으로 가져와 표시합니다.
- **새로고침 기능**: UIRefreshControl을 사용하여 화면을 아래로 당겼을 때 최신 날씨 정보로 업데이트합니다.
- **북마크 기능**: 관심 지역을 즐겨찾기 하면 UserDefaults에 저장되어 나의 관심 지역 목록에 추가됩니다.
- **일출일몰 정보 시각화**: 일출일몰 시간 정보를 반원 그래프로 시각화하여 직관적으로 제공합니다.


## Framework & Libraries

- UIKit
- CoreLocation
- [WeatherAPI](https://www.weatherapi.com/docs/)
- [SnapKit](https://github.com/SnapKit/SnapKit) (5.7.1)
- [Alamofire](https://github.com/Alamofire/Alamofire) (5.9.1)
- [Lottie](https://github.com/airbnb/lottie-ios) (4.4.3)
- [Tabman](https://github.com/uias/Tabman) (3.2.0)
- [SkeletonView](https://github.com/Juanpe/SkeletonView) (1.31.0)
  

## Architecture

![mvvm](https://github.com/user-attachments/assets/9ad36b12-117b-4a00-985b-bf6717748c48)


## Contributors

![Dock](https://github.com/user-attachments/assets/d2e10876-02bc-43b0-9d09-a576a80fb723)


## Details
[13조 개발일지](https://www.figma.com/board/SeuyCc70AAmYenzZN1Ncz7/Project-13?node-id=418-2544&node-type=frame&t=uBFkjBfKHqSfoItn-0)
