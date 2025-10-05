# 녹음 기능 설정 가이드

## 1. 데이터베이스 스키마 업데이트

Supabase SQL Editor에서 다음 SQL을 실행하세요:

```sql
-- c_practice_records 테이블에 recording_url 컬럼 추가
ALTER TABLE c_practice_records 
ADD COLUMN IF NOT EXISTS recording_url TEXT;

-- 인덱스 생성 (성능 향상)
CREATE INDEX IF NOT EXISTS idx_c_practice_records_recording_url 
ON c_practice_records(recording_url) 
WHERE recording_url IS NOT NULL;

-- 컬럼 설명 추가
COMMENT ON COLUMN c_practice_records.recording_url IS '녹음 파일의 Supabase Storage URL';
```

## 2. Storage 버킷 생성

1. **Supabase 대시보드** → **Storage** 메뉴 이동
2. **"Create a new bucket"** 버튼 클릭
3. 설정:
   - **버킷 이름**: `recordings`
   - **공개 버킷**: ✅ 체크
4. **"Create bucket"** 클릭

## 3. Storage 권한 설정

Storage 버킷 생성 후 **Policies** 탭에서 다음 정책을 추가:

```sql
-- 읽기 권한 (모든 사용자)
CREATE POLICY "Public Access" ON storage.objects
FOR SELECT USING (bucket_id = 'recordings');

-- 업로드 권한 (인증된 사용자)
CREATE POLICY "Authenticated Upload" ON storage.objects
FOR INSERT WITH CHECK (bucket_id = 'recordings');
```

## 4. 테스트

1. 앱에서 연습 체크 페이지로 이동
2. 기존 연습 기록의 🎤 버튼 클릭
3. 녹음 후 저장 테스트

## 문제 해결

### "Bucket not found" 오류
- Storage 버킷이 생성되지 않았습니다
- 위의 2번 단계를 따라 버킷을 생성하세요

### "recording_url column not found" 오류
- 데이터베이스에 컬럼이 추가되지 않았습니다
- 위의 1번 단계를 따라 SQL을 실행하세요

### 권한 오류
- Storage 정책이 설정되지 않았습니다
- 위의 3번 단계를 따라 정책을 추가하세요
