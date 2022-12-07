# SolarSystem


I. 논리의 흐름 
-------------
1) 1단계에서 원을 그리는 기능을 구현한다.
2) 원을 그리는 기능을 이용하여 태양,지구,달 등의 천체를 구현한다. 
3) 달의 공전주기는 1달 , 지구의 공전주기는 1년으로 가정하고, 각 날짜마다의 위치관계를 고려하여 출력하는 기능을 구현한다.
4) 공백으로 채워진 2차원 배열인 backPlane , 공전의 기준이 되는 천체를 담은 2차원 배열 , 공전을 하는 천체를 담은 2차원 배열을 만든다. 
5) backPlane의 중앙에 공전의 기준이 되는 천체를 넣고, 입력된 날짜에 따른 위치에 공전을 하는 천체를 넣는다. 
6) 위치관계가 고려된 [공전의 기준인 천체 + 공전을 하는 천체]가 포함된 plane이 완성된다. 
7) 이 과정을 2회 거친다면 [태양 <-> 지구 <-> 달] 의 관계를 포함한 커다란 plane이 만들어진다. 
8) backPlane을 공백으로 채워진 2차원 배열 대신, 여러 특수문자가 포함된 2차원 배열을 사용하여 우주공간의 느낌을 "멋지게" 표현한다. 
9) 이후 추가적인 우주적 요소들을 추가하여 완성시킨다. 

II. 사전준비
-----------
날짜에 따른 천체들의 위치관계를 출력하기 위해서는 어떤 날짜에 어떤 위치인지 알 필요가 있다. backPlane에 천체를 끼워넣는 방법을 사용 할 것이므로 , 
2차원배열을 좌표화하여 좌표평면상에서의 위치좌표를 파악해야한다. 중앙에 위치한 천체를 기준으로 각도에 따라 위치를 근사화시킨 좌표를 계산하여 얻어 놓았다. 
* example : 지구와 달의 날짜에 따른 위치관계 ( 공전주기 1달 )
![지구 달 좌표](https://user-images.githubusercontent.com/88966578/206140967-71a07398-505f-4780-8bb4-c53e19b89253.jpeg){: width="500" height="500"){: .center}

같은 방법으로 지구와 태양의 위치관계 좌표역시 미리 계산을 통해 얻어 놓았다. 

III. 구현 

## 1단계 

## 2단계 

## 3단계 
