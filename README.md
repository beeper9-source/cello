# 월간 뒤포르 - 셀로 연습 관리 앱

순수 HTML, CSS, JavaScript로 개발된 셀로 연습 관리 시스템입니다.

## 🎻 주요 기능

- **📊 대시보드**: 전체 현황과 통계 확인
- **👥 연주자 관리**: 등급별 연주자 추가/수정/삭제
- **🎵 곡 관리**: 반주 링크, 악보 링크 포함 곡 관리
- **✅ 연습 체크**: 월별 달력 형태의 연습 기록 관리
- **🎯 결과 제출**: 연습 결과 URL 제출 및 공유

## 🚀 시작하기

### 1. 의존성 설치
```bash
npm install
```

### 2. 개발 서버 실행
```bash
npm run dev
```

### 3. 브라우저에서 접속
```
http://localhost:3001/
```

## 🗄️ 데이터베이스 설정

### Supabase 설정
1. Supabase 프로젝트 생성
2. `database-schema.sql` 파일 실행하여 테이블 생성
3. `add_song_links.sql` 파일 실행하여 반주/악보 링크 컬럼 추가
4. `index.html`에서 Supabase URL과 API 키 설정

### 필요한 테이블
- `c_players`: 연주자 정보
- `c_songs`: 곡 정보 (반주 링크, 악보 링크 포함)
- `c_practice_records`: 연습 기록
- `c_submissions`: 결과 제출

## 🛠️ 기술 스택

- **Frontend**: 순수 HTML, CSS, JavaScript
- **Database**: Supabase (PostgreSQL)
- **Build Tool**: Vite
- **Deployment**: 정적 파일 호스팅 가능

## 📱 특징

- **반응형 디자인**: 모바일/데스크톱 최적화
- **실시간 동기화**: Supabase 실시간 데이터 동기화
- **사용자 친화적**: 직관적인 인터페이스
- **빠른 로딩**: 순수 HTML로 빠른 성능

## 📝 라이선스

ISC License