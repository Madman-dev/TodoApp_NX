# NX프로젝트 소개
- 지난 스파르타 코딩클럽 개인 과제, '투두어플' 고도화 진행

### UI Development
- Finished 투두를 담는 뷰 컨트롤러 구성
- ProfilePage 추가
- Figma에 디자인되어 있는 화면을 기반으로 동일한 UI 구축

### Technological Development
- 데이터베이스 CoreData로 CRUD 적용
- CoreData로 데이터 일관성 유지

___ 

## WireFrame
<img width="988" alt="Screenshot 2023-09-22 at 3 21 20 PM" src="https://github.com/Madman-dev/TodoApp_NX/assets/119504454/01621b10-f11e-4649-a4e6-ffd85e6bf21b">

### 1. 메인 화면:
기존 투두, 완료 투두와 함께 프로필 페이지. 유저 정보를 확인할 수 있는 메인 페이지.<br/>
⓶, ⓷, ⓸, ⓹ 페이지로 연결되어 navigation 담당
### 2. Todo 화면
Daily, Important, Soso 카테고리로 Todo를 구분하여 데이터 저장.<br/>
투두 별 좌측 버튼을 탭하여 완료 처리 가능<br/>
각 카테고리별 데이터는 section으로 구분지어 화면에 보일 수 있도록 정리

### 3. Complete 화면
Todo 페이지에서 완료 처리한 투두를 정리

### 4. 프로필 페이지 화면
인스타그램 profilePage를 구현<br/>
탭 바 클릭 시 메인 페이지로 이동
### 5. 유저 정보 화면
유저 관련 성함, 나이를 표시하는 페이지.<br/>
MVVM 관련 이해도를 높일 수 있도록 패턴을 적용해본 페이지.

떡국 먹기 버튼을 통해 viewModel을 거쳐 View로 '나이' 데이터를 한살 씩 올릴 수 있도록 처리

### Problem && Issues
- *23/10 현재 Todo 목록의 read가 산발적으로 되는 모습 발견.
새로운 Todo를 저장할 경우, 이전 입력된 값들을 호출하고 있다는 점에서 데이터는 잘 저장이 되고 있는 점 확인.
데이터를 표시하는 부분에서 문제점이 있는 것으로 보임. 수정 진행 예정.
- *23/10 현재 complete는 오류가 발생하는 것으로 보임. > 수정 진행 예정
