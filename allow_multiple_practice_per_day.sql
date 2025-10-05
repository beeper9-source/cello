-- 같은 날짜에 여러 번 연습할 수 있도록 UNIQUE 제약 조건 제거

-- 기존 UNIQUE 제약 조건 제거
ALTER TABLE c_practice_records 
DROP CONSTRAINT IF EXISTS c_practice_records_player_id_song_id_practice_date_key;

-- 제약 조건이 성공적으로 제거되었는지 확인
SELECT constraint_name, constraint_type 
FROM information_schema.table_constraints 
WHERE table_name = 'c_practice_records' 
AND constraint_type = 'UNIQUE';

-- 기존 데이터 확인
SELECT id, player_id, song_id, practice_date, practiced, notes, created_at
FROM c_practice_records 
ORDER BY practice_date DESC, created_at DESC;
