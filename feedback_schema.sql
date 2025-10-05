-- 개선요청 게시판 테이블 생성

CREATE TABLE IF NOT EXISTS c_feedback (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  content TEXT NOT NULL,
  author_name VARCHAR(100) NOT NULL,
  author_email VARCHAR(100),
  status VARCHAR(20) NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'in_progress', 'completed', 'rejected')),
  priority VARCHAR(10) NOT NULL DEFAULT 'medium' CHECK (priority IN ('low', 'medium', 'high', 'urgent')),
  category VARCHAR(50) NOT NULL DEFAULT 'general' CHECK (category IN ('ui', 'functionality', 'performance', 'bug', 'feature', 'general')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 컬럼에 대한 코멘트 추가
COMMENT ON COLUMN c_feedback.title IS '제목';
COMMENT ON COLUMN c_feedback.content IS '내용';
COMMENT ON COLUMN c_feedback.author_name IS '작성자 이름';
COMMENT ON COLUMN c_feedback.author_email IS '작성자 이메일 (선택사항)';
COMMENT ON COLUMN c_feedback.status IS '처리 상태 (pending, in_progress, completed, rejected)';
COMMENT ON COLUMN c_feedback.priority IS '우선순위 (low, medium, high, urgent)';
COMMENT ON COLUMN c_feedback.category IS '카테고리 (ui, functionality, performance, bug, feature, general)';

-- 인덱스 생성
CREATE INDEX IF NOT EXISTS idx_feedback_status ON c_feedback(status);
CREATE INDEX IF NOT EXISTS idx_feedback_category ON c_feedback(category);
CREATE INDEX IF NOT EXISTS idx_feedback_created_at ON c_feedback(created_at);

-- 기존 데이터 확인 (선택사항)
SELECT id, title, author_name, status, priority, category, created_at 
FROM c_feedback 
ORDER BY created_at DESC;
