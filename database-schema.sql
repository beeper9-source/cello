-- 월간 뒤포르 셀로 연습 관리 앱 데이터베이스 스키마

-- 연주자 관리 테이블
CREATE TABLE IF NOT EXISTS c_players (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  nickname VARCHAR(50) NOT NULL UNIQUE,
  grade VARCHAR(10) NOT NULL CHECK (grade IN ('알', '애벌래', '미들', '엑스퍼트')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 곡 관리 테이블
CREATE TABLE IF NOT EXISTS c_songs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  composer VARCHAR(100) NOT NULL,
  grade VARCHAR(10) NOT NULL CHECK (grade IN ('알', '애벌래', '미들', '엑스퍼트')),
  month INTEGER NOT NULL CHECK (month >= 1 AND month <= 12),
  year INTEGER NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(grade, month, year)
);

-- 연습 기록 테이블
CREATE TABLE IF NOT EXISTS c_practice_records (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  player_id UUID NOT NULL REFERENCES c_players(id) ON DELETE CASCADE,
  song_id UUID NOT NULL REFERENCES c_songs(id) ON DELETE CASCADE,
  practice_date DATE NOT NULL,
  practiced BOOLEAN NOT NULL DEFAULT FALSE,
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(player_id, song_id, practice_date)
);

-- 결과 제출 테이블
CREATE TABLE IF NOT EXISTS c_submissions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  player_id UUID NOT NULL REFERENCES c_players(id) ON DELETE CASCADE,
  song_id UUID NOT NULL REFERENCES c_songs(id) ON DELETE CASCADE,
  submission_url TEXT NOT NULL,
  title VARCHAR(200),
  description TEXT,
  submitted_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(player_id, song_id)
);

-- 인덱스 생성
CREATE INDEX IF NOT EXISTS idx_c_players_grade ON c_players(grade);
CREATE INDEX IF NOT EXISTS idx_c_songs_grade_month_year ON c_songs(grade, month, year);
CREATE INDEX IF NOT EXISTS idx_c_practice_records_player_song ON c_practice_records(player_id, song_id);
CREATE INDEX IF NOT EXISTS idx_c_practice_records_date ON c_practice_records(practice_date);
CREATE INDEX IF NOT EXISTS idx_c_submissions_player_song ON c_submissions(player_id, song_id);

-- RLS (Row Level Security) 활성화
ALTER TABLE c_players ENABLE ROW LEVEL SECURITY;
ALTER TABLE c_songs ENABLE ROW LEVEL SECURITY;
ALTER TABLE c_practice_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE c_submissions ENABLE ROW LEVEL SECURITY;

-- 모든 사용자가 읽기/쓰기 가능하도록 정책 설정 (개발용)
CREATE POLICY "Enable all access for all users" ON c_players FOR ALL USING (true);
CREATE POLICY "Enable all access for all users" ON c_songs FOR ALL USING (true);
CREATE POLICY "Enable all access for all users" ON c_practice_records FOR ALL USING (true);
CREATE POLICY "Enable all access for all users" ON c_submissions FOR ALL USING (true);

-- 업데이트 시간 자동 갱신 함수
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- 트리거 생성
CREATE TRIGGER update_c_players_updated_at BEFORE UPDATE ON c_players FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_c_songs_updated_at BEFORE UPDATE ON c_songs FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_c_practice_records_updated_at BEFORE UPDATE ON c_practice_records FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_c_submissions_updated_at BEFORE UPDATE ON c_submissions FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
