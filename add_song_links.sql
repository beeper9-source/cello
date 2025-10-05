-- 곡 관리 테이블에 반주 링크와 악보 링크 컬럼 추가

-- 반주 링크 컬럼 추가
ALTER TABLE c_songs 
ADD COLUMN accompaniment_url TEXT;

-- 악보 링크 컬럼 추가  
ALTER TABLE c_songs 
ADD COLUMN sheet_music_url TEXT;

-- 컬럼에 대한 코멘트 추가
COMMENT ON COLUMN c_songs.accompaniment_url IS '반주 링크 (YouTube, SoundCloud 등)';
COMMENT ON COLUMN c_songs.sheet_music_url IS '악보 링크 (PDF, 이미지 등)';

-- 기존 데이터 확인 (선택사항)
SELECT id, title, composer, grade, month, year, accompaniment_url, sheet_music_url 
FROM c_songs 
ORDER BY year DESC, month DESC;
