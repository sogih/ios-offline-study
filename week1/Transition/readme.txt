


==========================================================================================


1.FirstViewController
2.SecondViewController
3.MainViewController
4.FirstSubViewController
5.SecondSubViewController

총 5가지 Controller 로 진행이 됩니다.

##
- 모든 버튼의 크기와 레이아웃은 일체 관여하지않습니다. 편하신데로 작성하시면됩니다
- 이름은 반드시 지켜주세요




1.FirstViewController

SuperView Color = red

- Go To SecondVC : SecondViewController 로 Present 합니다



2.SecondViewController

SuperView Color = orange

- back To FirstVC : SecondVC를 dismiss 합니다
- Go To MainNVC : MainViewController 를 네비게이션 루트뷰 컨트롤러로 만들어서 present 합니다.



3.MainViewController

SuperView Color = green

- 뒤로 : MainNVC를 dismiss 합니다
- Go To FirstSVC : FirstSVC 로 push 합니다



4. FirstSubViewController

SuperView Color = blue

- Go To SecondSVC : SecondSVC 로 push 합니다



5. SecondSubViewController

SuperView Color = black

- back To RootVC = Navigation RootViewController(= MainViewController)로 되돌아갑니다



==========================================================================================

