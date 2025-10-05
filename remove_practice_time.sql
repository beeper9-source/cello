-- 연습 기록 테이블에서 시간 필드 제거 및 다중 연습 허용

-- 연습 시간 컬럼 제거 (만약 존재한다면)
ALTER TABLE c_practice_records 
DROP COLUMN IF EXISTS practice_time;

-- 기존 UNIQUE 제약 조건 제거
ALTER TABLE c_practice_records 
DROP CONSTRAINT IF EXISTS c_practice_records_unique;

-- 기존 UNIQUE 제약 조건 제거 (원래 제약 조건명)
ALTER TABLE c_practice_records 
DROP CONSTRAINT IF EXISTS c_practice_records_player_id_song_id_practice_date_key;

-- 새로운 UNIQUE 제약 조건 추가 (연주자, 곡, 날짜 조합으로 유니크)
-- 이렇게 하면 같은 연주자가 같은 곡을 같은 날에 여러 번 연습할 수 없지만
-- 다른 연주자들은 같은 날에 같은 곡을 연습할 수 있음
ALTER TABLE c_practice_records 
ADD CONSTRAINT c_practice_records_unique 
UNIQUE(player_id, song_id, practice_date);

-- 또는 완전히 제약 조건을 제거하여 같은 연주자도 같은 날에 여러 번 연습할 수 있도록 하려면:
-- 위의 UNIQUE 제약 조건 추가 부분을 주석 처리하고 아래 주석을 해제하세요
-- ALTER TABLE c_practice_records 
-- ADD CONSTRAINT c_practice_records_unique 
-- UNIQUE(player_id, song_id, practice_date, notes);

-- 기존 데이터 확인
SELECT id, player_id, song_id, practice_date, practiced, notes, created_at
FROM c_practice_records 
ORDER BY practice_date DESC, created_at DESC;

