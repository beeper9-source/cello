-- c_practice_records 테이블에 recording_url 컬럼 추가
-- 녹음 기능을 위한 컬럼

ALTER TABLE c_practice_records 
ADD COLUMN IF NOT EXISTS recording_url TEXT;

-- 컬럼 추가 후 인덱스 생성 (선택사항)
CREATE INDEX IF NOT EXISTS idx_c_practice_records_recording_url ON c_practice_records(recording_url) WHERE recording_url IS NOT NULL;

-- 컬럼 설명 추가
COMMENT ON COLUMN c_practice_records.recording_url IS '녹음 파일의 Supabase Storage URL';
