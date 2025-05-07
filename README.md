## 🖼️ Naver Image Search Flutter App

### 🧾 요약

이 앱은 Naver의 이미지 검색 API를 활용하여 사용자가 입력한 키워드에 따라 관련 이미지를 검색하고, **리스트/그리드 뷰로 결과를 전환**하여 보여주는 구조의 Flutter 앱입니다.

## 앱 시연 영상 


https://github.com/user-attachments/assets/8fec9059-4bb2-40ce-b831-6fbce59dcee9


⚠️ **앱 개발 과정에서 사용되었던 Naver API 키는 현재 삭제되어 더 이상 유효하지 않습니다.**

---

### 🧱 아키텍처 및 구조

* **MVVM 아키텍처** 기반

  * View: UI 위젯 계층 (SearchView, ListView1, GridView1)
  * ViewModel: 상태관리 및 사용자 이벤트 처리 (SearchViewModel, ListViewModel, GridViewModel)
  * UseCase: 도메인 로직 중심 (`SearchUseCase`)
  * Repository: API 호출 추상화 (`Repository`)
  * Service: 실제 API 통신 구현 (`ApiService`)

* **상태 관리**: `ChangeNotifier + Provider`

* **상태 흐름**: `SearchViewModel`이 검색 상태를 관리하며 결과에 따라 화면 전환

* **리스트/그리드 뷰 전환**: 각각 별도 ViewModel과 화면을 통해 전환

---

### 🔄 주요 기능

| 기능          | 설명                                                          |
| ----------- | ----------------------------------------------------------- |
| 🔍 검색창      | 사용자가 검색어를 입력하고 버튼을 눌러 이미지 검색                                |
| 📃 리스트 뷰    | 검색된 이미지를 세로 리스트로 렌더링                                        |
| 🧱 그리드 뷰    | 버튼 클릭 시 그리드 형식으로 전환 가능                                      |
| 📡 상태 전환 흐름 | `SearchState` (idle/searching/complete/error) 기반으로 화면 상태 제어 |

---

### 🧰 기술 스택 및 구현 요소

* Flutter 3+
* Provider 상태관리
* RESTful API (Naver Open API)
* MVVM 아키텍처
* 이미지 렌더링: `Image.network`
* 뷰 전환: Navigator + ChangeNotifierProvider 재주입

---

### 🔌 의존성 주입 & UseCase 역할

* **DI**: 앱 시작 시 `SearchViewModel` 생성 시점에 `SearchUseCase` → `Repository` → `ApiService`를 수동 주입
* **UseCase**: 검색 로직의 중심으로, 결과를 `List<ImageModelItem>` 형태로 보관하며 ViewModel과 공유

---

### 🔐 API 키 처리

* 해당 앱에 포함되어 있던 **Naver Open API 키는 현재 삭제된 상태**입니다.
* 테스트 목적의 프로젝트이며, 타인이 clone해도 더 이상 API 요청은 수행되지 않습니다.

---

### 📌 기타 참고 사항

* ViewModel은 상태만을 관리하며, 데이터 처리 및 호출은 UseCase가 담당
* Navigator를 통해 ViewModel 인스턴스를 유지한 채 뷰를 전환함으로써 데이터 공유 실현
* 에러 상태에서는 안내 메시지를, 검색 성공 시 자동으로 다른 화면으로 이동하는 UX를 구현

---

### 👨‍💻 개발자

* **임단 / urbosa.dev**

