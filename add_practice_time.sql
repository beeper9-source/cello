-- 연습 기록 테이블에 연습 시간 컬럼 추가

-- 연습 시간 컬럼 추가
ALTER TABLE c_practice_records 
ADD COLUMN practice_time TIME;

-- 컬럼에 대한 코멘트 추가
COMMENT ON COLUMN c_practice_records.practice_time IS '연습 시간 (HH:MM 형식)';

-- 기존 UNIQUE 제약 조건 제거 (같은 날짜에 여러 번 연습 가능하도록)
ALTER TABLE c_practice_records 
DROP CONSTRAINT IF EXISTS c_practice_records_player_id_song_id_practice_date_key;

-- 새로운 UNIQUE 제약 조건 추가 (연주자, 곡, 날짜, 시간 조합으로 유니크)
ALTER TABLE c_practice_records 
ADD CONSTRAINT c_practice_records_unique 
UNIQUE(player_id, song_id, practice_date, practice_time);

-- 기존 데이터 확인 (선택사항)
SELECT id, player_id, song_id, practice_date, practice_time, practiced, notes 
FROM c_practice_records 
ORDER BY practice_date DESC, practice_time DESC;

