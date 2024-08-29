DELETE FROM CUSTOMER;
drop table user_info;
CREATE TABLE USER_INFO
   (	USERNO NUMBER(5,0), 
	USERID VARCHAR2(30 BYTE), 
	USERPWD VARCHAR2(100 BYTE), 
	USERNAME VARCHAR2(9 BYTE), 
	BIRTH DATE DEFAULT sysdate, 
	HP VARCHAR2(50 BYTE), 
	ADDRESS VARCHAR2(100 BYTE), 
	EMAIL VARCHAR2(100 BYTE), 
	CREATEDATE DATE DEFAULT sysdate, 
	SHOW VARCHAR2(40 BYTE), 
	KEY VARCHAR2(40 BYTE), 
	AUTHORITY VARCHAR2(40 BYTE) DEFAULT 'ROLE_USER', 
	ENABLED VARCHAR2(40 BYTE) DEFAULT 0
   );
Insert into USER_INFO (USERNO,USERID,USERPWD,USERNAME,BIRTH,HP,ADDRESS,EMAIL,CREATEDATE,SHOW,KEY,AUTHORITY,ENABLED) 
values (2,'mcp1011tt','$2a$10$qx3XbYmmPeUoDU.0yeUogO.SjllFEGNZhxCZ4f26bb/QWHxpzcNEC','박민창',to_date('24/08/03','RR/MM/DD'),'010-4343-7726','서울시 강남구','mcp1011@naver.com',to_date('24/08/05','RR/MM/DD'),'0','D18N06','ROLE_USER','0');
Insert into USER_INFO (USERNO,USERID,USERPWD,USERNAME,BIRTH,HP,ADDRESS,EMAIL,CREATEDATE,SHOW,KEY,AUTHORITY,ENABLED) 
values (3,'mcp1011oo','$2a$10$Jv8jVrtnk2XPxhfMasWpXOEAVhK663oNXDfE71cKRvcusWopkcU5.','박민창',to_date('24/07/29','RR/MM/DD'),'010-4343-7726','서울시 강남구','mcp1011@naver.com',to_date('24/08/05','RR/MM/DD'),'1','8Q1SFU','ROLE_USER','0');
Insert into USER_INFO (USERNO,USERID,USERPWD,USERNAME,BIRTH,HP,ADDRESS,EMAIL,CREATEDATE,SHOW,KEY,AUTHORITY,ENABLED) 
values (4,'mcp1011bb','$2a$10$jKk2keYaQt86pyU9B2FppOYeD7KWYd1KcShjrkqlGwMH6i.nU2jzi','박민창',to_date('24/08/02','RR/MM/DD'),'010-1111-7726','서울시 강남구','mcp1011@naver.com',to_date('24/08/05','RR/MM/DD'),'1','ASKUG5','ROLE_ADMIN','1');
Insert into USER_INFO (USERNO,USERID,USERPWD,USERNAME,BIRTH,HP,ADDRESS,EMAIL,CREATEDATE,SHOW,KEY,AUTHORITY,ENABLED) 
values (5,'mcp1011ww','$2a$10$vBugU4ajCO1.FtoUfgipJePRogNIUQWhf5Ap.Gd248eWBhALFxzQa','박민창',to_date('24/08/01','RR/MM/DD'),'010-7777-8888','서울시 강남구','mcp1011@naver.com',to_date('24/08/12','RR/MM/DD'),'1','518OYJ','ROLE_USER','1');
Insert into USER_INFO (USERNO,USERID,USERPWD,USERNAME,BIRTH,HP,ADDRESS,EMAIL,CREATEDATE,SHOW,KEY,AUTHORITY,ENABLED) 
values (1,'mcp1011aa','$2a$10$7G3kqxuaJu5KiQe0vA6zIe7Hpyv7mdohLGl9HijR6SouG4K9UFpku','박민창',to_date('24/07/16','RR/MM/DD'),'010-4343-7726','서울시 강남구','mcp1011@naver.com',to_date('24/07/31','RR/MM/DD'),'0','Q2Q20M','ROLE_USER','0');

DROP TABLE movie_info  CASCADE CONSTRAINTS;
CREATE TABLE movie_info(  
    mvNo         NUMBER(7)  PRIMARY KEY,      -- 영화번호
   title        VARCHAR2(50)  ,      -- 영화제목
   content      CLOB  ,              -- 줄거리
   director      VARCHAR2(30)  ,       -- 감독
   actor        VARCHAR2(300)  ,       -- 출연배우
   genre        VARCHAR2(300)  ,     --장르
   audience     NUMBER(10)  ,    --관객수
    poster      VARCHAR2(300)  ,    -- 영화포스터
   grade        VARCHAR2(300)  ,    --평점   
   releaseDate  date            ,
   country      VARCHAR2(50)    
);

-- 게시판 댓글테이블
DROP TABLE movie_comment_tbl  CASCADE CONSTRAINTS;
CREATE TABLE movie_comment_tbl(  
    comment_num     NUMBER(7)  PRIMARY KEY, -- PK, 댓글 일련번호
    pass        VARCHAR2(30) ,
    mvNo       NUMBER(7)  REFERENCES   movie_info(mvNo),   -- FK, 게시글 번호
    rating          VARCHAR2(30)  ,       -- 작성자
    review          CLOB ,              -- 글내용
   regDate         Date  DEFAULT sysdate       -- 등록일
);

-- 게시판  테이블
DROP TABLE mvc_board_tbl  CASCADE CONSTRAINTS;
CREATE TABLE mvc_board_tbl(  
    num         NUMBER(7)  PRIMARY KEY,      -- 글번호
   title       VARCHAR2(50)  ,      -- 글제목
   content     CLOB  ,              -- 글내용
   writer      VARCHAR2(30) ,       -- 작성자
   readCnt     NUMBER(6)   DEFAULT 0,      -- 조회수
   regDate     DATE  DEFAULT sysdate,       -- 작성일
   comment_count  NUMBER(6)   DEFAULT 0,--  댓글갯수
   show  char(1) default 'y',
   notice NUMBER(6)   DEFAULT 0
);
SELECT * FROM mvc_board_tbl;

-- 게시판  테이블
DROP TABLE mvc_comment_tbl  CASCADE CONSTRAINTS;
CREATE TABLE mvc_comment_tbl(  
    comment_num         NUMBER(7)  PRIMARY KEY,      -- 글번호
    board_num       NUMBER(7)      not null,
   content     CLOB  ,              -- 글내용
   writer      VARCHAR2(30) ,       -- 작성자
   regDate     DATE  DEFAULT sysdate,       -- 작성일
   FOREIGN KEY(board_num)REFERENCES mvc_board_tbl(num) ON DELETE CASCADE
);
SELECT * FROM mvc_board_tbl;

DROP TABLE user_messagebox  CASCADE CONSTRAINTS;
create table user_messagebox (
    messageNo number(30) primary key,
    userid varchar2(20) not null ,
    messagetitle VARCHAR2(100) not null,
    messageContent CLOB not null,
    FOREIGN KEY(userid)REFERENCES user_info(userid) ON DELETE CASCADE
);

SELECT * FROM movie_info;
COMMIT; 

DELETE movie_info;

COMMIT;

--게시글 입력(다건)
DECLARE --선언문
    i NUMBER:=1; --변수 i에 1을 대입
BEGIN
    WHILE i<=500 LOOP
        INSERT INTO mvc_board_tbl(num, title, content, writer, readCnt, regDate, comment_count)
         VALUES(i, '글제목'||i, '글내용'||i, '작성자'||i, 0, sysdate, 0);
         i := i+1;
    END LOOP;
END;
/
DECLARE --선언문
    i NUMBER:=1; --변수 i에 1을 대입
BEGIN
    WHILE i<=500 LOOP
        INSERT INTO mvc_comment_tbl(comment_num, board_num, content, writer, regDate)
         VALUES(i,i, '글내용'||i, '작성자'||i, sysdate);
         i := i+1;
    END LOOP;
END;
/
-- PL/SQL 프로시저가 성공적으로
COMMIT; --중요

--1
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), '곡성', '낯선 외지인(쿠니무라 준)이 나타난 후 벌어지는 의문의 연쇄 사건들로 마을이 발칵 뒤집힌다. 경찰은 집단 야생 버섯 중독으로 잠정적 결론을 내리지만 모든 사건의 원인이 그 외지인 때문이라는 소문과 의심이 걷잡을 수 없이 퍼져 나간다. 경찰 ‘종구’(곽도원)는 현장을 목격했다는 여인 ‘무명’(천우희)을 만나면서 외지인에 대한 소문을 확신하기 시작한다. 딸 ‘효진’(김환희)이 피해자들과 비슷한 증상으로 아파오기 시작하자 다급해진 ‘종구’. 외지인을 찾아 난동을 부리고, 무속인 ‘일광’(황정민)을 불러들이는데...',
 '나홍진','황정민 , 쿠니무라 준 등등','공포',6800000,'/html_pj_team2/resources/items/곡성.jpg', '네이버 평점 8.23','2016-05-12','국내영화');

 --2
INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '신세계', 
 '경찰청 수사 기획과 강과장(최민식)은 국내 최대 범죄 조직인 골드문이 기업형 조직으로 그 세력이 점점 확장되자 신입경찰 이자성(이정재)에게 잠입 수사를 명한다. 그리고 8년, 자성은 골드문의 2인자이자 그룹 실세인 정청(황정민)의 오른팔이 되기에 이른다. 골드문 회장이 갑자기 사망하자, 강과장(최민식)은 후계자 결정에 직접 개입하는 신세계 작전을 설계한다. 피도 눈물도 없는 후계자 전쟁의 한 가운데, 정청(황정민)은 8년 전, 고향 여수에서 처음 만나 지금까지 친형제처럼 모든 순간을 함께 해 온 자성(이정재)에게 더욱 강한 신뢰를 보낸다. "약속 했잖습니까... 이번엔 진짜 끝이라고" 한편, 작전의 성공만 생각하는 강과장(최민식)은 계속해서 자성(이정재)의 목을 조여만 간다. 시시각각 신분이 노출될 위기에 처한 자성(이정재)은 언제 자신을 배신할 지 모르는 경찰과, 형제의 의리로 대하는 정청(황정민) 사이에서 갈등하게 되는데…"',
 '박훈정',
 '이정재, 최민식, 황정민 등',
 '스릴러',
 4690000,
 '/html_pj_team2/resources/items/신세계.jpg', 
 '네티즌 평점 8.94',
 '2013-02-21','국내영화');
--3 
INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '범죄도시4', 
 '"신종 마약 사건 3년 뒤, 괴물형사 ‘마석도’(마동석)와 서울 광수대는 배달앱을 이용한 마약 판매 사건을 수사하던 중 수배 중인 앱 개발자가 필리핀에서 사망한 사건이 대규모 온라인 불법 도박 조직과 연관되어 있음을 알아낸다. 필리핀에 거점을 두고 납치, 감금, 폭행, 살인 등으로 대한민국 온라인 불법 도박 시장을 장악한 특수부대 용병 출신의 빌런 ‘백창기’(김무열)와 한국에서 더 큰 판을 짜고 있는 IT업계 천재 CEO ‘장동철’(이동휘). ‘마석도’는 더 커진 판을 잡기 위해 ‘장이수’(박지환)에게 뜻밖의 협력을 제안하고 광역수사대는 물론, 사이버수사대까지 합류해 범죄를 소탕하기 시작하는데… 나쁜 놈 잡는데 국경도 영역도 제한 없다! 업그레이드 소탕 작전! 거침없이 싹 쓸어버린다!"',
 '허명행',
 '마동석, 김무열 등',
 '액션',
 11000000,
 '/html_pj_team2/resources/items/범죄도시4.jpg', 
 '네티즌 평점 7.61',
 '2024-04-24','국내영화');
--4
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '베테랑', 
 '한 번 꽂힌 것은 무조건 끝을 보는 행동파 ‘서도철’(황정민), 20년 경력의 승부사 ‘오팀장’(오달수), 위장 전문 홍일점 ‘미스봉’(장윤주), 육체파 ‘왕형사’(오대환), 막내 ‘윤형사’(김시후)까지 겁 없고, 못 잡는 것 없고, 봐 주는 것 없는 특수 강력사건 담당 광역수사대. 오랫동안 쫓던 대형 범죄를 해결한 후 숨을 돌리려는 찰나, 서도철은 재벌 3세 ‘조태오’(유아인)를 만나게 된다. 세상 무서울 것 없는 안하무인의 조태오와 언제나 그의 곁을 지키는 오른팔 ‘최상무’(유해진). 서도철은 의문의 사건을 쫓던 중 그들이 사건의 배후에 있음을 직감한다. 건들면 다친다는 충고에도 불구하고 포기하지 않는 서도철의 집념에 판은 걷잡을 수 없이 커져가고 조태오는 이를 비웃기라도 하듯 유유히 포위망을 빠져 나가는데… 베테랑 광역수사대 VS 유아독존 재벌 3세 2015년 여름, 자존심을 건 한판 대결이 시작된다!', 
 '류승완',
 '황정민 유아인 등',
 '액션',
 13400000,
 '/html_pj_team2/resources/items/베테랑.jpg', 
 '네티즌 평점 9.24'
 ,'2015-08-05','국내영화');
 
--5
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '극한직업', 
 '불철주야 달리고 구르지만 실적은 바닥, 급기야 해체 위기를 맞는 마약반! 더 이상 물러설 곳이 없는 팀의 맏형 고반장은 국제 범죄조직의 국내 마약 밀반입 정황을 포착하고 장형사, 마형사, 영호, 재훈까지 4명의 팀원들과 함께 잠복 수사에 나선다. 마약반은 24시간 감시를 위해 범죄조직의 아지트 앞 치킨집을 인수해 위장 창업을 하게 되고, 뜻밖의 절대미각을 지닌 마형사의 숨은 재능으로 치킨집은 일약 맛집으로 입소문이 나기 시작한다. 수사는 뒷전, 치킨장사로 눈코 뜰 새 없이 바빠진 마약반에게 어느 날 절호의 기회가 찾아오는데… 범인을 잡을 것인가, 닭을 잡을 것인가',
 '이병헌',
 '류승룡 이하늬 등',
 '코미디',
 16200000,
 '/html_pj_team2/resources/items/극한직업.jpg', 
 '네이버 평점 8.23'
 ,'2019-01-23','국내영화');
--6
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '럭키', 
 '냉혹한 킬러 형욱(유해진)은 사건 처리 후 우연히 들른 목욕탕에서 비누를 밟고 넘어져 과거의 기억을 잃게 된다. 인기도, 삶의 의욕도 없어 죽기로 결심한 무명배우 재성(이준)은 신변 정리를 위해 들른 목욕탕에서 그런 형욱을 보게 되고, 자신과 그의 목욕탕 키를 바꿔 도망친다. 이후 형욱은 자신이 재성이라고 생각한 채, 배우로 성공하기 위해 노력하는데… 인생에 단 한번 찾아온 초대형 기회! 초특급 반전! 이것이 LUCK.KEY다!',
 '이계벽',
 '유해진, 이준 등',
 '코미디',
 6900000,
 '/html_pj_team2/resources/items/럭키.jpg', 
 '네이버 평점 8.76'
 ,'2016-10-13','국내영화');
--7
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '두사부일체', 
 '타고난 카리스마로 한국 조직사회에서 급부상하고있는 영동파 두목 계두식(정준호 분). 명동파를 접수하고 조직 수뇌부들과 처음으로 회의를 하게 된다. 큰 형님에게 떨어진 명령은 고등학교 졸업장. 수하 상두(정웅인 분)와 대가리(정운택 분)는 두목을 학교로 보내기 위해 사립고교에 기부금 입학을 시키게 되는데.',
 '윤제균',
 '정준호 정웅인 등',
 '코미디',
 3400000,
 '/html_pj_team2/resources/items/두사부일체.jpg', 
 '네이버 평점 7.57'
 ,'2001-12-08','국내영화');
--8
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '과속스캔들', 
 '한때 아이돌 스타로 10대 소녀 팬들의 영원한 우상이었던 남현수(차태현). 지금은 서른 중반의 나이지만, 그래도 아직까지는 잘나가는 연예인이자, 청취율 1위의 인기 라디오 DJ. 어느 날 애청자를 자처하며 하루도 빠짐없이 라디오에 사연을 보내오던 황.정.남(박보영)이 느닷없이 찾아와 자신이 현수가 과속해서 낳은 딸이라며 바득바득 우겨대기 시작하는데!! 그것도 애까지 달고 나타나서…… 집은 물론 현수의 나와바리인 방송국까지. 어디든 물불 안 가리고 쫓아다니는 스토커 정남으로 인해 완벽했던 인생에 태클 한방 제대로 걸린 현수. 설상가상 안 그래도 머리 복잡한 그에게 정남과 스캔들까지 휩싸이게 되는데… 나 이제, 이거 한방 터지면 정말 끝이다! 끝!!',
 '강형철',
 '차태현, 박보영, 왕석현 등',
 '코미디',
 8240000,
 '/html_pj_team2/resources/items/과속스캔들.jpg', 
 '네이버 평점 9.20'
 ,'2008-12-03','국내영화');
--9
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '아저씨', 
 '불행한 사건으로 아내를 잃고 세상을 등진 채 전당포를 꾸려가며 외롭게 살아가는 전직 특수요원 태식. 찾아오는 사람이라곤 전당포에 물건을 맡기러 오는 사람들과 옆집소녀 소미뿐이다. 세상으로부터 버림받은 소미와 함께 보내는 시간이 많아지면서 태식과 소미는 서로 마음을 열며 친구가 되어간다. 그러던 어느 날 소미가 갑자기 사라진다. 소미 엄마가 범죄사건에 연루되면서 같이 납치되고 만 것이다. 소미의 행방을 쫓아 다시 세상 밖으로 나오게 된 태식. 단 하나뿐인 친구인 소미를 위험에서 지켜내기 위해 범죄조직과 모종의 거래를 하지만 소미의 행방은 여전히 묘연하고, 경찰이 태식을 뒤쫓기 시작하면서 태식은 범죄조직과 경찰 양 쪽의 추격을 받게 된다. 그 과정에서 베일에 싸여 있던 태식의 비밀스런 과거도 드러나기 시작하는데…..',
 '이정범',
 '원빈 김희원 등',
 '액션',
 6280000,
 '/html_pj_team2/resources/items/아저씨.jpg', 
 '네티즌 평점 9.25'
 ,'2010-08-04','국내영화');
--10
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '악인전', 
 '우연히 연쇄살인마의 표적이 되었다 살아난 조직 보스 장동수와 범인잡기에 혈안이 된 강력반 미친개 정태석. 타협할 수 없는 두 사람이 연쇄살인마 K를 잡기 위해 손잡는다. 표적은 하나, 룰도 하나! 먼저 잡는 놈이 갖는다!',
 '이원태',
 '마동석, 김무열 등',
 '스릴러',
 3300000,
 '/html_pj_team2/resources/items/악인전.jpg', 
 '네티즌 평점 8.53'
 ,'2019-05-15','국내영화');
--11
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '파묘', 
 '미국 LA, 거액의 의뢰를 받은 무당 ‘화림’(김고은)과 ‘봉길’(이도현)은 기이한 병이 대물림되는 집안의 장손을 만난다. 조상의 묫자리가 화근임을 알아챈 ‘화림’은 이장을 권하고, 돈 냄새를 맡은 최고의 풍수사 ‘상덕’(최민식)과 장의사 ‘영근’(유해진)이 합류한다. “전부 잘 알 거야… 묘 하나 잘못 건들면 어떻게 되는지” 절대 사람이 묻힐 수 없는 악지에 자리한 기이한 묘. ‘상덕’은 불길한 기운을 느끼고 제안을 거절하지만, ‘화림’의 설득으로 결국 파묘가 시작되고… 나와서는 안될 것이 나왔다.',
 '장재현',
 '최민식, 김고은 등',
 '공포',
 11900000,
 '/html_pj_team2/resources/items/파묘.jpg', 
 '네티즌 평점 8.20'
 ,'2024-02-22','국내영화');
--12
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '어벤져스4', 
 '인피니티 워 이후 절반만 살아남은 지구 마지막 희망이 된 어벤져스 먼저 떠난 그들을 위해 모든 것을 걸었다! 위대한 어벤져스 운명을 바꿀 최후의 전쟁이 펼쳐진다!',
 '앤서니루소, 조루소',
 '크리스에반스, 로버트다우니주니어 등',
 '히어로',
 13970000,
 '/html_pj_team2/resources/items/어벤져스4.jpg', 
 '네티즌 평점 9.50'
 ,'2019-04-24','국외영화');
--13
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '트랜스포머', 
 '인류보다 월등히 뛰어난 지능과 파워를 지닌 외계 생명체 ‘트랜스포머’. 정의를 수호하는 ‘오토봇’ 군단과 악을 대변하는 ‘디셉티콘’ 군단으로 나뉘는 ‘트랜스포머’는 궁극의 에너지원인 ‘큐브’를 차지하기 위해 오랜 전쟁을 벌여왔다. 하지만 행성 폭발로 우주 어딘가로 사라져버린 ‘큐브’. 그들은 오랜 전쟁의 종지부를 찍기 위해 ‘큐브’를 찾아 전 우주를 떠돈다. 인류의 미래를 좌우할 에너지원인 ‘큐브’는 우주를 떠돌다 지구에 떨어지고 디셉티콘 군단의 끈질긴 추적 끝에 ‘큐브’가 지구에 있다는 사실을 알아낸다. 그들은 최후의 전쟁의 무대로 지구를 택하고, 아무도 모르게 지구로 잠입한다. 어떤 행성이든지 침입해 그 곳에 존재하는 기계로 변신, 자신의 존재를 숨길 수 있는 트랜스포머는 자동차, 헬기, 전투기 등의 다양한 형태로 변신해 인류의 생활에 깊숙이 침투한다. 그리고 그들은 큐브의 위치를 찾는데 결정적인 열쇠를 지닌 주인공 ‘샘’의 존재를 알게 된다. 이 모든 사실을 전혀 모른 채 살아가던 ‘샘’은 어느 날 밤, 자신의 낡은 자동차가 거대한 로봇으로 변신하는 놀라운 현장을 목격한다. 그의 자동차는 ‘트랜스포머’ 중 정의를 수호하는 ‘오토봇’ 군단의 ‘범블비’로 큐브를 차지하기 위해 음모를 꾸미는 ‘디셉티콘’ 군단에 맞서 샘을 보호하기 위해 파견된 트랜스포머. 우주의 질서를 수호하기 위해 반드시 샘을 지켜야만 하는 범블비는 자신이 형제들인 ‘오토봇’ 군단을 지구로 불러모으기 시작하는데.. 거대 에너지원 ‘큐브’가 디셉티콘의 손에 들어가는 것만은 막아야 한다. 샘을 찾아내 큐브를 손에 쥐어 지구를 지배하려는 악의 ‘디셉티콘’ 군단과 지구를 지키려는 정의의 ‘오토봇’ 군단의 인류의 운명을 건 숨막히는 대결이 펼쳐진다.',
 '마이클베이',
 '샤이아라보프, 메간폭스 등',
 'SF',
 7400000,
 '/html_pj_team2/resources/items/트랜스포머.jpg', 
 '네이버 평점 8.60'
 ,'2007-06-28','국외영화');
--14
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '아바타', 
 '지구 에너지 고갈 문제를 해결하기 위해 판도라 행성으로 향한 인류는 원주민 ‘나비족’과 대립하게 된다. 이 과정에서, 전직 해병대원 제이크 설리(샘 워싱턴)가 ‘아바타’ 프로그램을 통해 ‘나비족’의 중심부에 투입되는데… 피할 수 없는 전쟁! 이 모든 운명을 손에 쥔 제이크! 그 누구도 넘보지 못한 역대급 세계가 열린다! 아바타: 인간과 ‘나비족’의 DNA를 결합해 만들어졌으며 링크룸을 통해 인간의 의식으로 원격 조종할 수 있는 새로운 생명체',
 '제임스 카메론',
 '샘워딩턴, 조샐다나 등',
 'SF',
 14000000,
 '/html_pj_team2/resources/items/아바타.jpg', 
 '네티즌 평점 9.42'
 ,'2009-12-17','국외영화');
--15
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '핸콕', 
 'X맨, 슈퍼맨, 배트맨, 스파이더맨이 가지고 있던 모든 능력에 누구도 건드릴 수 없는 독특한 성격을 겸비한 슈퍼 히어로 핸콕(윌 스미스). 그는 위험에 처한 사람들을 도와주는 슈퍼 히어로지만 과격하고 예측 불가능한 행동으로 사람들에게 까칠한 슈퍼 히어로로 낙인 찍힌다. 사람들의 기피대상 1호로 떠오른 핸콕은 어느 날, PR 전문가 레이 엠브레이(제이슨 베이트먼)의 목숨을 구하게 되고, 그는 핸콕의 추락하는 이미지를 회복시켜 주기로 약속한다. 그러던 중, 핸콕은 레이의 아내 메리(샤를리즈 테론)가 자신이 탄생하게 된 비밀의 열쇠를 쥐고 있음을 알게 되고 설상가상으로 메리와 가까이 있을 수록 자신의 초능력이 점점 약해져가고 있다는 사실을 깨닫게 되는데...',
 '피터 버그',
 '윌 스미스. 샤를리즈 테론 등',
 '히어로',
2700000,
 '/html_pj_team2/resources/items/핸콕.jpg', 
 '네티즌 평점 7.36'
 ,'2008-07-02','국외영화');
--16 
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '아수라', 
 '신강력계 형사 한도경(정우성)은 이권과 성공을 위해 각종 범죄를 저지르는 악덕시장 박성배(황정민)의 뒷일을 처리해주는 대가로 돈을 받는다. 악에 계속 노출되는 사이, 말기 암 환자인 아내의 병원비를 핑계로 돈 되는 건 뭐든 하는 악인의 길로 들어서게 된 한도경. 그의 약점을 쥔 독종 검사 김차인(곽도원)과 검찰수사관 도창학(정만식)은 그를 협박하고 이용해 박성배의 비리와 범죄 혐의를 캐려 한다. 각자의 이익과 목적을 위해 한도경의 목을 짓누르는 검찰과 박성배. 그 사이 태풍의 눈처럼 되어 버린 한도경은, 자신을 친형처럼 따르는 후배 형사 문선모(주지훈)를 박성배의 수하로 들여보내고, 살아남기 위해 혈안이 된 나쁜 놈들 사이에서 서로 물지 않으면 물리는 지옥도가 펼쳐진다.',
 '김성수',
 '정우성, 황정민 등',
 '스릴러',
2590000,
 '/html_pj_team2/resources/items/아수라.jpg', 
 '네티즌 평점 6.54'
 ,'2016-09-28','국내영화');
 --17
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '청년경찰', 
 '의욕충만 경찰대생 기준(박서준) X 이론백단 경찰대생 희열(강하늘) 둘도 없는 친구인 두 사람은 외출을 나왔다 우연히 납치 사건을 목격하게 된다. 목격자는 오직 두 사람 뿐! 기준과 희열은 학교에서 배운 대로 지체 없이 경찰에 신고한다. 하지만 복잡한 절차와 부족한 증거로 수사는 전혀 진행될 기미가 보이지 않는 상황! 1분 1초가 급박한 상황에서 아까운 시간만 흘러가자, 기준과 희열은 직접 발로 뛰는 수사에 나서기로 하고 예측 불가능한 상황을 마주하게 되는데… 전공지식 총동원! 파릇파릇한 놈들의 혈기왕성 실전수사가 시작된다!',
 '김주환',
 '박서준, 강하늘 등',
 '코미디',
 5650000,
 '/html_pj_team2/resources/items/청년경찰.jpg', 
 '네티즌 평점 9.03'
 ,'2017-08-09','국내영화');
--18
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '미션임파서블', 
 '가장 위험한 작전, 그의 마지막 선택 모든 인류를 위협할 새로운 무기를 추적하게 된 에단 헌트(톰 크루즈)와 IMF팀은 이 무기가 인류의 미래를 통제할 수 있다는 사실을 알게 된다. 전 세계가 위태로운 상황에 처한 가운데, 이를 추적하던 에단 헌트에게 어둠의 세력까지 접근하고 마침내 미스터리하고 강력한 빌런과 마주하게 된 그는 가장 위험한 작전을 앞두고 자신이 아끼는 사람들의 생명과 중요한 임무 사이에서 선택을 해야 하는 상황에 놓이게 되는데…',
 '크리스토퍼 맥쿼리',
 '톰 크루즈, 헤일리 앳웰 등',
 '액션',
 4020000,
 '/html_pj_team2/resources/items/미션임파서블.jpg', 
 '네티즌 평점 8.51'
 ,'2023-07-12','국외영화');
--19
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '다이하드', 
 '7월 4일 미국의 독립기념일, 컴퓨터 해킹 용의자 매튜 패럴(저스틴 롱)을 FBI본부로 호송하던 존 맥클레인. 매튜 패럴의 집으로 들이닥친 괴한들의 총격을 받고 가까스로 목숨을 건진다. 정부의 네트워크 전산망을 파괴해 미국을 장악하려는 전 정부요원 토마스 가브리엘이 자신의 계획을 저지할 가능성이 있는 모든 해커들을 죽이는 동시에 미국의 네트워크를 공격하기 시작한 것이다. 천신만고 끝에 목숨을 건졌지만 미국의 교통,통신,금융,전기 등 모든 네트워크가 테러리스트의 손아귀에 들어가고, 미국은 공황상태에 빠진다. 테러리스트를 막기 위해 뉴저지로 워싱턴으로 버지니아로 숨막히는 추격전을 벌이는 가운데, 가브리엘이 존 맥클레인의 딸 루시를 인질로 잡고 마는데…',
 '렌 와이즈먼',
 '브루스윌리스, 저스틴 롱 등',
 '액션',
 3300000,
 '/html_pj_team2/resources/items/다이하드.jpg', 
 '네티즌 평점 8.90',
 '2007-07-17','국외영화');
--20
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '테이큰2', 
 '파리에서의 킴(메기 그레이스)의 납치 사건으로 조직에 치명타를 입고, 가족의 목숨까지 빼앗긴 인신매매범 일당은 브라이언(리암 니슨)에게 똑같이 갚아주기 위해 자신들의 조직력을 총동원, 그의 뒤를 쫓는다. 한편, 이스탄불을 여행 중이던 브라이언과 전처 레노어(팜케 얀슨)는 알 수 없는 일당의 기습을 받고 납치되지만, 킴만은 극적으로 놈들의 손아귀에서 벗어난다. 복수의 상대를 잘못 골랐다!! 낯선 도시 이스탄불에서 복면에 가려진 채 어디론가 끌려가는 브라이언. 캄캄한 어둠 속에 갇힌 그는, 오직 소리에만 의존해 자신의 위치를 파악해간다. 1,2,3…우회전, 1,2,3… 뱃고동… 1,2,3… 피리소리… 놈들의 감시를 피해 가까스로 탈출에 성공한 브라이언. 이제, 위기에 빠진 킴과 레노아를 지키기 위해 다시 한번 전직 특수 요원의 실력을 발휘해 놈들을 역추적하기 시작하는데..',
 '올리비에 메가톤',
 '리암니슨, 매기 그레이스 등',
 '액션',
2300000,
 '/html_pj_team2/resources/items/테이큰2.jpg', 
 '네티즌 평점 7'
 ,'2012-09-27','국외영화');
--21
 INSERT INTO movie_info(mvNo, title, content, director, actor, genre, audience, poster, grade, releaseDate, country)
 VALUES((SELECT NVL(MAX(mvNo), 0)+1 FROM movie_info), 
 '탑건:매버릭', 
 '최고의 파일럿이자 전설적인 인물 매버릭(톰 크루즈)은 자신이 졸업한 훈련학교 교관으로 발탁된다. 그의 명성을 모르던 팀원들은 매버릭의 지시를 무시하지만 실전을 방불케 하는 상공 훈련에서 눈으로 봐도 믿기 힘든 전설적인 조종 실력에 모두가 압도된다. 매버릭의 지휘아래 견고한 팀워크를 쌓아가던 팀원들에게 국경을 뛰어넘는 위험한 임무가 주어지자 매버릭은 자신이 가르친 동료들과 함께 마지막이 될 지 모를 하늘 위 비행에 나서는데…',
 '조셉 코신스키',
 '톰크루즈, 마일스텔러 등',
 '액션',
 8230000,
 '/html_pj_team2/resources/items/탑건매버릭.jpg', 
 '네티즌 평점 9.59'
 ,'2022-06-22','국외영화');
COMMIT; 

SELECT * FROM movie_comment_tbl;
 -- 댓글 작성페이지
INSERT INTO movie_comment_tbl(comment_num, pass, mvNo, rating, review, regDate)
 VALUES((SELECT NVL(MAX(comment_num)+1, 1) FROM movie_comment_tbl), '111',2, '★★★★★', '글내용1', sysdate);
COMMIT;  

