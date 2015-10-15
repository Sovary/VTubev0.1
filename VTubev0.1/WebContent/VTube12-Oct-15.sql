/*
Navicat PGSQL Data Transfer

Source Server         : conPostgres
Source Server Version : 90303
Source Host           : localhost:5432
Source Database       : dbVTube
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90303
File Encoding         : 65001

Date: 2015-10-12 16:57:53
*/


-- ----------------------------
-- Sequence structure for cate_id_seq
-- ----------------------------
DROP SEQUENCE "cate_id_seq";
CREATE SEQUENCE "cate_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 62
 CACHE 1;
SELECT setval('"public"."cate_id_seq"', 62, true);

-- ----------------------------
-- Sequence structure for comment_id_seq
-- ----------------------------
DROP SEQUENCE "comment_id_seq";
CREATE SEQUENCE "comment_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for main_cate_id_seq
-- ----------------------------
DROP SEQUENCE "main_cate_id_seq";
CREATE SEQUENCE "main_cate_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 54
 CACHE 1;
SELECT setval('"public"."main_cate_id_seq"', 54, true);

-- ----------------------------
-- Sequence structure for phonebook_id_seq
-- ----------------------------
DROP SEQUENCE "phonebook_id_seq";
CREATE SEQUENCE "phonebook_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 2
 CACHE 1;
SELECT setval('"public"."phonebook_id_seq"', 2, true);

-- ----------------------------
-- Sequence structure for user_id_seq
-- ----------------------------
DROP SEQUENCE "user_id_seq";
CREATE SEQUENCE "user_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 79
 CACHE 1;
SELECT setval('"public"."user_id_seq"', 79, true);

-- ----------------------------
-- Sequence structure for video_id_seq
-- ----------------------------
DROP SEQUENCE "video_id_seq";
CREATE SEQUENCE "video_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 34
 CACHE 1;
SELECT setval('"public"."video_id_seq"', 34, true);

-- ----------------------------
-- Table structure for tblcategories
-- ----------------------------
DROP TABLE IF EXISTS "tblcategories";
CREATE TABLE "tblcategories" (
"category_id" int4 DEFAULT nextval('cate_id_seq'::regclass) NOT NULL,
"category_name" varchar(64) COLLATE "default",
"category_description" varchar(64) COLLATE "default",
"main_cate_id" int4 DEFAULT 32,
"category_status" int4,
"category_index" int4,
"category_image" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tblcategories
-- ----------------------------
BEGIN;
INSERT INTO "tblcategories" VALUES ('44', 'JSP', 'Java Server Page', '1', '1', '5', 'secondarytile.png');
INSERT INTO "tblcategories" VALUES ('61', 'HTML', 'Hyper Text Markup Language', '1', '1', '1', 'video-camera-icon.png');
INSERT INTO "tblcategories" VALUES ('62', 'iOS', '', '50', '1', '1', 'default.jpg');
COMMIT;

-- ----------------------------
-- Table structure for tblcomments
-- ----------------------------
DROP TABLE IF EXISTS "tblcomments";
CREATE TABLE "tblcomments" (
"comment_id" int4 DEFAULT nextval('comment_id_seq'::regclass) NOT NULL,
"user_id" int4 DEFAULT 32,
"video_id" int4 DEFAULT 32,
"comment_description" varchar(64) COLLATE "default",
"comment_date" date,
"comment_status" int4,
"comment_mark" int2
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tblcomments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tblmain_categories
-- ----------------------------
DROP TABLE IF EXISTS "tblmain_categories";
CREATE TABLE "tblmain_categories" (
"main_cate_id" int4 DEFAULT nextval('main_cate_id_seq'::regclass) NOT NULL,
"main_cate_name" varchar(64) COLLATE "default",
"main_cate_status" int4,
"main_cate_image" varchar COLLATE "default",
"main_cate_index" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tblmain_categories
-- ----------------------------
BEGIN;
INSERT INTO "tblmain_categories" VALUES ('1', 'Web', '1', 'video-camera-icon.png', '1');
INSERT INTO "tblmain_categories" VALUES ('46', 'Programming', '1', 'responsive-web-design.png', '1');
INSERT INTO "tblmain_categories" VALUES ('50', 'Mobile Technologies', '1', 'mobiletech.png', '1');
COMMIT;

-- ----------------------------
-- Table structure for tblusers
-- ----------------------------
DROP TABLE IF EXISTS "tblusers";
CREATE TABLE "tblusers" (
"user_id" int4 DEFAULT nextval('user_id_seq'::regclass) NOT NULL,
"user_name" varchar(64) COLLATE "default",
"user_email" varchar(64) COLLATE "default",
"user_password" varchar(64) COLLATE "default",
"user_gender" int4 DEFAULT 1,
"user_image" varchar(64) COLLATE "default",
"user_type" int4 DEFAULT 1,
"user_status" int4,
"user_register" date,
"user_confirmcode" varchar(128) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tblusers
-- ----------------------------
BEGIN;
INSERT INTO "tblusers" VALUES ('1', 'Vary', 'vary@vtube.com', '123', '0', 'avatar.png', '1', '1', '2015-09-12', null);
INSERT INTO "tblusers" VALUES ('2', 'Sub-cyber', 'moder@vtube.com', '123', '0', 'avatar.png', '2', '1', '2015-09-13', null);
INSERT INTO "tblusers" VALUES ('3', 'user', 'user@vtube.com', '123', '1', 'avatar.png', '3', '1', '2015-09-13', null);
INSERT INTO "tblusers" VALUES ('4', 'Admin', 'admin@vtube.com', '123', '1', 'avatar.png', '1', '1', '2015-09-14', null);
INSERT INTO "tblusers" VALUES ('5', 'menghok', 'menghok.heak@gmail.com', '123', '1', 'avatar.png', '1', '1', '2015-09-14', null);
INSERT INTO "tblusers" VALUES ('6', 'Heng', 'heng@editor.com', '123', '0', 'avatar.jpg', '2', '1', '2015-09-23', null);
INSERT INTO "tblusers" VALUES ('29', 'Money', 'mon@gmail.com', '123', '1', 'default.jpg', '3', '1', '2015-09-25', null);
INSERT INTO "tblusers" VALUES ('30', 'We', 'we@mail.com', '123', '1', 'default.jpg', '3', '1', '2015-09-28', null);
INSERT INTO "tblusers" VALUES ('79', 'Cyber Heng', 'kongsovaryhrdi@gmail.com', '123', '1', 'avatar.jpg', '3', '1', '2015-10-15', null);
COMMIT;

-- ----------------------------
-- Table structure for tblvideo
-- ----------------------------
DROP TABLE IF EXISTS "tblvideo";
CREATE TABLE "tblvideo" (
"video_id" int4 DEFAULT nextval('video_id_seq'::regclass) NOT NULL,
"category_id" int4 DEFAULT 32,
"user_id" int4 DEFAULT 32,
"video_title" varchar(64) COLLATE "default",
"video_description" varchar(64) COLLATE "default",
"video_url" varchar(64) COLLATE "default",
"video_up" int4 DEFAULT 32,
"video_down" int4 DEFAULT 32,
"video_view" int4 DEFAULT 32,
"video_date" date,
"video_status" int4,
"video_index" int2
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tblvideo
-- ----------------------------
BEGIN;
INSERT INTO "tblvideo" VALUES ('7', '44', '1', 'Lesson1 HTML', 'No description', 'xdVisPWq2Va', '32', '32', '32', '2015-09-18', '1', '2');
INSERT INTO "tblvideo" VALUES ('13', '44', '4', 'Video Title', 'Video Desc', 'www.youtube.com/watch?v=Wjiodsjfljrvjlr', '0', '0', '0', '2015-09-19', '1', '3');
INSERT INTO "tblvideo" VALUES ('14', '44', '6', 'My new Videos', 'Hello World', 'sssssssd', '0', '0', '0', '2015-09-30', '1', '1');
INSERT INTO "tblvideo" VALUES ('15', '61', '6', 'My new Video', 'Hello World', 'dsjfljrvjlr', '0', '0', '0', '2015-09-30', '1', '2');
INSERT INTO "tblvideo" VALUES ('19', '61', '6', 'Testing Successfull', 'Hello', 'wpWZY4ZJEtM', '0', '0', '0', '2015-09-30', '1', '2');
INSERT INTO "tblvideo" VALUES ('22', '44', '6', 'Lava level1', 'Cartoon with 3D', 'dUAPuh-bNSo', '0', '0', '0', '2015-09-30', '1', '2');
INSERT INTO "tblvideo" VALUES ('23', '44', '1', 'Updated', '', 'hacker', '0', '0', '0', '2015-09-23', '1', '4');
INSERT INTO "tblvideo" VALUES ('27', '61', '6', 'Upload', 'Hen', 'om/watch?v=', '0', '0', '0', '2015-09-30', '1', '2');
INSERT INTO "tblvideo" VALUES ('29', '44', '4', 'I upload 1', '', 'om/watch?v=', '0', '0', '0', '2015-10-01', '0', '0');
INSERT INTO "tblvideo" VALUES ('31', '44', '2', 'Cyber 1', '', 'om/watch?v=', '0', '0', '0', '2015-10-01', '1', '1');
INSERT INTO "tblvideo" VALUES ('32', '44', '2', 'Cyber 2', '', '333', '0', '0', '0', '2015-10-01', '0', '1');
INSERT INTO "tblvideo" VALUES ('33', '44', '6', 'Heng1', '', 'om/watch?v=', '0', '0', '0', '2015-10-01', '0', '2');
INSERT INTO "tblvideo" VALUES ('34', '44', '4', 'This is testyion', 'Hello', 'WxlNY2SdGNg', '0', '0', '0', '2015-10-10', '1', '1');
COMMIT;

-- ----------------------------
-- View structure for v_dashb_videolist
-- ----------------------------
CREATE OR REPLACE VIEW "v_dashb_videolist" AS 
 SELECT vdo.video_id,
    vdo.video_title,
    cate.category_name,
    vdo.video_view,
    vdo.video_status,
    vdo.video_date
   FROM (tblvideo vdo
   JOIN tblcategories cate ON ((vdo.category_id = cate.category_id)))
  ORDER BY vdo.video_view DESC
 LIMIT 10;

-- ----------------------------
-- View structure for v_getcount_subeach_main
-- ----------------------------
CREATE OR REPLACE VIEW "v_getcount_subeach_main" AS 
 SELECT count(sub.main_cate_id) AS count,
    main.main_cate_name
   FROM (tblmain_categories main
   JOIN tblcategories sub ON ((main.main_cate_id = sub.main_cate_id)))
  GROUP BY main.main_cate_name;

-- ----------------------------
-- View structure for v_listadmin
-- ----------------------------
CREATE OR REPLACE VIEW "v_listadmin" AS 
 SELECT tblusers.user_id,
    tblusers.user_name,
    tblusers.user_email,
    tblusers.user_image
   FROM tblusers
  WHERE (tblusers.user_type = 1);

-- ----------------------------
-- View structure for v_listallvdo
-- ----------------------------
CREATE OR REPLACE VIEW "v_listallvdo" AS 
 SELECT v.video_id,
    v.video_index,
    v.video_date,
    u.user_name,
    v.video_title,
    v.video_url,
    sub.category_name,
    v.video_view,
    v.video_up,
    v.video_down,
    v.video_status
   FROM ((tblvideo v
   JOIN tblcategories sub ON ((v.category_id = sub.category_id)))
   JOIN tblusers u ON ((v.user_id = u.user_id)));

-- ----------------------------
-- View structure for v_listmaincate
-- ----------------------------
CREATE OR REPLACE VIEW "v_listmaincate" AS 
 SELECT main.main_cate_id,
    main.main_cate_name,
    main.main_cate_status,
    main.main_cate_image,
    main.main_cate_index,
    count(sub.main_cate_id) AS countsub
   FROM (tblmain_categories main
   FULL JOIN tblcategories sub ON ((main.main_cate_id = sub.main_cate_id)))
  GROUP BY main.main_cate_id;

-- ----------------------------
-- View structure for v_listsubcate
-- ----------------------------
CREATE OR REPLACE VIEW "v_listsubcate" AS 
 SELECT sub.category_id,
    sub.category_name,
    sub.category_description,
    sub.category_status,
    sub.category_index,
    sub.category_image,
    main.main_cate_name,
    count(v.video_id) AS count
   FROM ((tblcategories sub
   JOIN tblmain_categories main ON ((sub.main_cate_id = main.main_cate_id)))
   FULL JOIN tblvideo v ON ((v.category_id = sub.category_id)))
  GROUP BY sub.category_id, sub.category_name, sub.category_description, sub.category_status, sub.category_index, sub.category_image, main.main_cate_name;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tblcategories
-- ----------------------------
ALTER TABLE "tblcategories" ADD PRIMARY KEY ("category_id");

-- ----------------------------
-- Primary Key structure for table tblcomments
-- ----------------------------
ALTER TABLE "tblcomments" ADD PRIMARY KEY ("comment_id");

-- ----------------------------
-- Primary Key structure for table tblmain_categories
-- ----------------------------
ALTER TABLE "tblmain_categories" ADD PRIMARY KEY ("main_cate_id");

-- ----------------------------
-- Primary Key structure for table tblusers
-- ----------------------------
ALTER TABLE "tblusers" ADD PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table tblvideo
-- ----------------------------
ALTER TABLE "tblvideo" ADD PRIMARY KEY ("video_id");

-- ----------------------------
-- Foreign Key structure for table "tblcategories"
-- ----------------------------
ALTER TABLE "tblcategories" ADD FOREIGN KEY ("main_cate_id") REFERENCES "tblmain_categories" ("main_cate_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "tblcomments"
-- ----------------------------
ALTER TABLE "tblcomments" ADD FOREIGN KEY ("user_id") REFERENCES "tblusers" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "tblcomments" ADD FOREIGN KEY ("video_id") REFERENCES "tblvideo" ("video_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "tblvideo"
-- ----------------------------
ALTER TABLE "tblvideo" ADD FOREIGN KEY ("category_id") REFERENCES "tblcategories" ("category_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "tblvideo" ADD FOREIGN KEY ("user_id") REFERENCES "tblusers" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
