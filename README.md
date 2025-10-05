# 월간 뒤포르 - Cello 연습 관리 앱

순수 HTML, CSS, JavaScript로 개발된 Cello 연습 관리 시스템입니다.

## 🎻 주요 기능

- **📊 대시보드**: 전체 현황과 통계 확인 (등급별 간반 차트, 최근 활동)
- **👥 연주자 관리**: 등급별 연주자 추가/수정/삭제 (간반 차트 스타일)
- **🎵 곡 관리**: 반주 링크, 악보 링크 포함 곡 관리
- **✅ 연습 체크**: 월별 달력 형태의 연습 기록 관리 (일자별 다중 기록 지원)
- **🎯 결과 제출**: 연습 결과 URL 제출 및 공유
- **💬 개선요청 게시판**: 앱 개선사항 제안 및 관리 (상태 변경, 삭제 기능)

## 🚀 시작하기

### 1. 개발 서버 실행
```bash
# Python HTTP 서버 사용
python -m http.server 8000
```

### 2. 브라우저에서 접속
```
https://beeper9-source.github.io/cello/
```

### 3. 로컬 개발 환경 (선택사항)
```bash
# Python HTTP 서버 사용
python -m http.server 8000
# 접속: http://localhost:8000/cello/
```

## 🗄️ 데이터베이스 설정

### Supabase 설정
1. Supabase 프로젝트 생성
2. `database-schema.sql` 파일 실행하여 테이블 생성
3. `feedback_schema.sql` 파일 실행하여 피드백 테이블 생성
4. `allow_multiple_practice_per_day.sql` 파일 실행하여 연습 기록 제약 조건 수정
5. `index.html`에서 Supabase URL과 API 키 설정

### 필요한 테이블
- `c_players`: 연주자 정보 (등급: 알, 애벌래, 미들, 엑스퍼트)
- `c_songs`: 곡 정보 (반주 링크, 악보 링크 포함)
- `c_practice_records`: 연습 기록 (일자별 다중 기록 지원)
- `c_submissions`: 결과 제출
- `c_feedback`: 개선요청 게시판

## 🎨 UI/UX 특징

- **간반 차트 스타일**: 연주자를 등급별로 시각적으로 그룹화
- **반응형 디자인**: 모바일/데스크톱 최적화
- **브랜드 로고**: 헤더에 Cello 로고 표시
- **등급별 색상 구분**: 각 등급마다 고유한 색상과 이모지
- **실시간 필터링**: 개선요청 게시판의 상태/카테고리 필터

## 🔐 보안 기능

- **연주자 삭제 보호**: 비밀번호 인증 필요 (SHA-256 해시)
- **데이터 검증**: 클라이언트 및 서버 측 유효성 검사

## 🛠️ 기술 스택

- **Frontend**: 순수 HTML, CSS, JavaScript
- **Database**: Supabase (PostgreSQL)
- **보안**: SHA-256 해시 알고리즘
- **Deployment**: 정적 파일 호스팅 가능

## 📱 주요 업데이트

### v2.0 기능
- ✅ 일자별 다중 연습 기록 지원
- ✅ 등급별 간반 차트 디자인
- ✅ 곡 관리 링크 정보 강화
- ✅ 최근 활동 날짜/시간 표시
- ✅ 브랜드 로고 추가
- ✅ 개선요청 게시판 구현
- ✅ 연주자 삭제 보안 강화

## 📝 라이선스

ISC License