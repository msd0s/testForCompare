-- phpMyAdmin SQL Dump
-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 16, 2017 at 03:24 PM
-- Server version: 5.5.31
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `respina_|||||||||||||||`
--

-- --------------------------------------------------------

--
-- Table structure for table `needactions`
--


CREATE TABLE `refundonline_log` (
  `id` int(11) NOT NULL,
  `regdate` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_passengers` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `refund` tinyint(2) NOT NULL,
  `proccess_refund` int(11) NOT NULL,
  `number_passenger` int(11) NOT NULL,
  `status_sanad` int(11) DEFAULT NULL,
  `log` text COLLATE utf8_persian_ci NOT NULL,
  `typePayment` tinyint(4) NOT NULL,
  `accounting_document` tinyint(1) DEFAULT NULL,
  `percent` int(11) NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `typeService` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `reason` tinyint(1) DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `counter_cron` int(11) NOT NULL DEFAULT 0,
  `timer_cron` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `action` varchar(20) COLLATE utf8_persian_ci NOT NULL DEFAULT 'pending',
  `all_action` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ;


ALTER TABLE `refundonline_log`
    ADD PRIMARY KEY (`id`);
ALTER TABLE `refundonline_log` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT;


CREATE TABLE `admin_service_request` (
  `id` int(11) NOT NULL,
  `service` varchar(50) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `admin_id` int(11) NOT NULL,
  `request_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `request_type_en` varchar(50) DEFAULT NULL,
  `ticket_status` tinyint(4) DEFAULT NULL COMMENT 'وضعیت 1 یعنی نمایش و وضعیت 2 یعنی تیکت',
  `api` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
  `from` varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
  `to` varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
  `request_message` text CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `request_status` tinyint(4) NOT NULL,
  `reg_date` varchar(25) NOT NULL,
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ;



ALTER TABLE `admin_service_request`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `admin_service_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



CREATE TABLE `notepad_list`
(
    `id`        int(11)                          NOT NULL,
    `regdate`   int(11)                          NOT NULL,
    `text`      longtext COLLATE utf8_persian_ci NOT NULL,
    `user_id`   int(11)                          NOT NULL,
    `direction` tinyint(1)                       NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

CREATE TABLE `details_respina_tickets`
(
    `id`                        int(11)                             NOT NULL,
    `ticketid`                  int(11)                             NOT NULL,
    `correction_price`          int(11)     DEFAULT NULL,
    `correction_date`           varchar(50) DEFAULT NULL,
    `hesabdariID`               int(11)                             NOT NULL,
    `esrequest_varizetebaruser` VARCHAR(20) COLLATE utf8_persian_ci NOT NULL,
    `eshteraki`                 TINYINT(1)                          NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `instructions`
(
    `id`        int(11)                              NOT NULL,
    `regdate`   int(11)                              NOT NULL,
    `editdate`  int(11)                              NOT NULL,
    `user_id`   int(11)                              NOT NULL,
    `user_edit` int(11) DEFAULT NULL,
    `subject`   varchar(500) COLLATE utf8_persian_ci NOT NULL,
    `text`      text COLLATE utf8_persian_ci         NOT NULL,
    `unit`      tinyint(4)                           NOT NULL,
    `log`       text COLLATE utf8_persian_ci         NOT NULL,
    `status`    tinyint(1)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

CREATE TABLE `personnel_notif`
(
    `id`               int(11)    NOT NULL,
    `text`             varchar(200)        DEFAULT NULL,
    `link`             varchar(500)        DEFAULT NULL,
    `view_by`          varchar(200)        DEFAULT NULL,
    `set_timestamp`    int(11)    NOT NULL,
    `active_timestamp` int(11)             DEFAULT NULL,
    `is_active`        tinyint(1) NOT NULL DEFAULT '1' COMMENT 'فعال بودن اطلاعیه',
    `status`           tinyint(4) NOT NULL COMMENT '0ایجاد 1اعلام'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `allowed_delay`
(
    `id`        int(11)     NOT NULL AUTO_INCREMENT,
    `regdate`   varchar(20) NOT NULL,
    `user_id`   varchar(20) NOT NULL,
    `user_name` varchar(50) NOT NULL,
    `delay_day` varchar(20) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8;

CREATE TABLE `personnel_groups`
(
    `id`            int(11)     NOT NULL AUTO_INCREMENT,
    `name`          varchar(50) NOT NULL,
    `supervisor_id` int(11)              DEFAULT NULL,
    `status`        tinyint(4)  NOT NULL,
    `delay_penalty` INT         NOT NULL DEFAULT '0',
    `lunch_penalty` INT         NOT NULL DEFAULT '0',
    `voip_queue`    INT         NOT NULL COMMENT 'شماره صف ویپ',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 0
  DEFAULT CHARSET = utf8;

CREATE TABLE `users_personnel` (
  `id` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'تاریخ ایجاد رکورد',
  `user_id` varchar(20) NOT NULL,
  `user_cellphone` varchar(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_dakheli` varchar(10) DEFAULT NULL,
  `user_unit_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `shift_id` tinyint(4) DEFAULT NULL,
  `supervisor_id` varchar(20) NOT NULL DEFAULT '0',
  `presence_point` varchar(10) NOT NULL DEFAULT '0' COMMENT 'امتیاز مازاد روزانه',
  `min_work_hours` int(11) NOT NULL DEFAULT 0 COMMENT 'حداقل ساعت کار روزانه',
  `max_start_time` varchar(5) DEFAULT NULL COMMENT 'حداکثر زمان ورود',
  `min_finish_time` varchar(5) DEFAULT NULL COMMENT 'حد اقل ساعت خروج',
  `max_vacation_days` int(11) DEFAULT NULL COMMENT 'حداکثر تعداد مرخصی روزانه',
  `hour_leave_price` int(11) DEFAULT NULL COMMENT 'مبلغ کسر بابت مرخصی ساعتی',
  `day_leave_price` int(11) DEFAULT NULL COMMENT 'مبلغ کسر بابت مرخصی روزانه بدون حقوق',
  `overtime_price` int(11) DEFAULT NULL COMMENT 'مبلغ اضافه بابت اضافه کاری',
  `log_user_work` tinyint(1) NOT NULL COMMENT 'ثبت عدم تایید حضور ، در لیست حضور و غیاب',
  `signature` varchar(200) DEFAULT NULL,
  `perstamp` varchar(200) DEFAULT NULL,
  `signature_name` varchar(50) DEFAULT NULL,
  `image_url` varchar(250) DEFAULT NULL COMMENT 'عکس پرسنل',
  `thumb_url` varchar(250) DEFAULT NULL COMMENT 'عکس کوچک پرسنل',
  `check_top_padding` varchar(3) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL DEFAULT '0',
  `check_right_padding` varchar(3) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL DEFAULT '0',
  `user_menu_access` varchar(500) NOT NULL,
  `user_banks` text NOT NULL,
  `lastdateUpdatebank` varchar(100) DEFAULT NULL,
  `duties` text CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
  `hasTasks` tinyint(1) DEFAULT 1,
  `responseTasks` longtext CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT '',
  `employ_date` varchar(10) DEFAULT NULL COMMENT 'تاریخ استخدام',
  `birthdate` varchar(10) DEFAULT NULL COMMENT 'تاریخ تولد',
  `first_child_birthdate` varchar(10) DEFAULT NULL COMMENT 'تاریخ تولد اولین فرزند',
  `second_child_birthdate` varchar(10) DEFAULT NULL COMMENT 'تاریخ تولد دومین فرزند',
  `father_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'نام پدر',
  `nid` varchar(10) DEFAULT NULL COMMENT 'کد ملی',
  `birth_cert_no` varchar(15) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'شماره شناسنامه',
  `issue_place` varchar(25) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'محل صدور',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'آدرس',
  `salaryLow` int(11) NOT NULL COMMENT 'سال و ماه اعمال ذخیره خدمت',
  `checkoutFirst` int(11) NOT NULL COMMENT 'آخرین سال و فصل دریافت طلب',
  `checkoutFinal` int(11) NOT NULL COMMENT 'آخرین سال و فصل تسویه حساب ذخیره خدمت',
  `checkoutConfirm` int(11) NOT NULL COMMENT 'آخرین سال و فصل تایید تسویه حساب',
  `session_id` varchar(50) DEFAULT NULL,
  `refund_commission` int(3) NOT NULL,
  `lastAssignedTime` int(11) DEFAULT NULL COMMENT 'زمان آخرین تیکت محول شده به پشتیبان'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='پرسنل';


-- --------------------------------------------------------

--
-- Table structure for table `settleconfirm`
--

CREATE TABLE `settleconfirm` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `reg_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
 `user_id` bigint(20) NOT NULL,
 `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
 `amount` int(20) NOT NULL,
 `last4digit` varchar(30) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
 `account_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
 `serviceprovider_id` int(11) NOT NULL,
 `serviceprovider_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
 `settle_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
 `settle_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
 `status` tinyint(4) NOT NULL DEFAULT 0,
 `manager_confirm_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `manager_id` bigint(20) DEFAULT NULL,
 `manager_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `checkAPI_count` tinyint(4) NOT NULL,
 `customer_id` int(11) DEFAULT NULL,
 `customer_mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `customer_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `token_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `balance_updated` tinyint(1) NOT NULL DEFAULT 0,
 `log` varchar(250) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `Isbuyhand` int(11) DEFAULT NULL,
 `typeServiceBuyhand` tinyint(2) DEFAULT NULL,
 `buyhandId` int(11) DEFAULT NULL,
 `isSabtsanad` tinyint(1) DEFAULT NULL,
 `logMsg` text CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `IsLowmojudi` tinyint(1) NOT NULL DEFAULT 0,
 `type` set('confirm','smscard','userfund') NOT NULL DEFAULT 'confirm' COMMENT 'confirm:تایید واریزی smscard:انتظار کارت به کارت userfund:دریافت صندوقدار',
 `extra_info` text CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT '' COMMENT 'اطلاعات اضافی وابسته به نوع type',
 `success_url` VARCHAR(250) NULL COMMENT 'فراخوانی آدرس بعد از تایید کارت به کارت',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='واریزی های کارت به کارت ثبت شده جهت تأیید';



CREATE TABLE `hotel_price_markups`
(
    `id`           int(11)                             NOT NULL,
    `regdate`      varchar(20) COLLATE utf8_persian_ci NOT NULL,
    `hotel_id`     int(11)                             NOT NULL,
    `hotel_name`   varchar(50) COLLATE utf8_persian_ci NOT NULL,
    `city_name`    varchar(50) COLLATE utf8_persian_ci NOT NULL,
    `price_markup` int(11)                             NOT NULL,
    `admin_id`     int(11)                             NOT NULL,
    `admin_name`   varchar(50) COLLATE utf8_persian_ci NOT NULL,
    `logs`         text COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;
-- --------------------------------------------------------

--
-- Table structure for table `needactions`
--

CREATE TABLE `needactions`
(
    `id`           int(11)                                                NOT NULL,
    `from`         varchar(5)                                             NOT NULL,
    `to`           varchar(5)                                             NOT NULL,
    `fnumber`      varchar(10)                                            NOT NULL,
    `airline`      varchar(20)                                            NOT NULL,
    `date`         varchar(20)                                            NOT NULL,
    `api`          varchar(10)                                            NOT NULL,
    `status`       tinyint(1)                                             NOT NULL DEFAULT '1',
    `comment`      varchar(500)                                           NOT NULL,
    `deadline`     varchar(50)                                            NOT NULL,
    `refund`       tinyint(1)                                             NOT NULL,
    `percent`      tinyint(5)                                             NOT NULL,
    `sid`          varchar(20)                                            NOT NULL,
    `refundMethod` TINYINT(1)                                             NULL     DEFAULT '0' COMMENT '0 online 1 offline',
    `pnr`          VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `user_insert`  TINYINT(1)                                             NULL     DEFAULT '0' COMMENT '1 ایجاد شده توسط کاربر',
    `admin`        varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT ''
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


-- --------------------------------------------------------

--
-- Table structure for table `userfund`
--

CREATE TABLE `userfund`
(
    `id`                      int(11)                                                NOT NULL AUTO_INCREMENT,
    `reg_date`                int(20)                                                NOT NULL,
    `user_id`                 int(11)                                                NOT NULL,
    `user_name`               varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `date`                    int(20)                                                NOT NULL,
    `amount`                  int(11)                                                NOT NULL,
    `receipt_payment`         tinyint(1)                                             NOT NULL DEFAULT '0' COMMENT '0دریافت 1پرداخت',
    `type`                    tinyint(1)                                             NOT NULL COMMENT '-1مانده از قبل0دریافت 1پرداخت 2درآمد 3هزینه',
    `serviceprovider_id`      int(11)                                                         DEFAULT NULL,
    `from_serviceprovider_id` int(11)                                                         DEFAULT NULL,
    `customer_user_id`        int(11)                                                         DEFAULT NULL,
    `customer_mobile`         varchar(11) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL,
    `customer_name`           varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL,
    `customer_token_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL,
    `payment_code`            varchar(8) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `advance_user_id`         int(11)                                                         DEFAULT NULL,
    `payment_type`            tinyint(1)                                             NOT NULL DEFAULT '0' COMMENT '-1مانده از قبل0نقدی 1پوز',
    `pos_serviceprovider_id`  int(11)                                                         DEFAULT NULL,
    `unit`                    tinyint(1)                                             NOT NULL COMMENT '0ریال 1دلار 2یورو 3عراقی 4درهم',
    `foreign_amount`          int(11)                                                         DEFAULT NULL,
    `description`             varchar(250) CHARACTER SET utf8 COLLATE utf8_persian_ci         DEFAULT NULL,
    `hesabdari_sanad`         tinyint(1)                                             NOT NULL DEFAULT '0',
    `password_updated`        tinyint(1)                                             NOT NULL DEFAULT '0',
    `status2`                 tinyint(4)                                             NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1 COMMENT ='دریافت و پرداخت صندوق کاربر';


-- --------------------------------------------------------

--
-- Table structure for table `user_fund`
--

CREATE TABLE `user_fund`
(
    `id`                 int(11)                                                NOT NULL AUTO_INCREMENT,
    `reg_date`           int(11)                                                NOT NULL,
    `user_id`            int(11)                                                NOT NULL,
    `user_name`          varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `serviceprovider_id` int(11)                                                NOT NULL COMMENT 'حساب متصل به صندوق',
    `title`              varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `poses_json`         varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL COMMENT '[{"name","serviceprov_id"}, ...]',
    `last_day_balance`   decimal(15, 0)                                         NOT NULL COMMENT 'آخرین موجودی روز قبل',
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_id` (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1 COMMENT ='صندوق های کاربر';


-- --------------------------------------------------------

--
-- Table structure for table `accounting_notes`
--

CREATE TABLE `accounting_notes`
(
    `id`                  int(11)                                                NOT NULL AUTO_INCREMENT,
    `regdate`             int(11)                                                NOT NULL,
    `user_id`             int(11)                                                NOT NULL,
    `user_name`           varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `type`                tinyint(1)                                             NOT NULL COMMENT '0دریافتی 1پرداختی',
    `category`            tinyint(1)                                             NOT NULL COMMENT '0چک 1سفته 2ضمانتنامه 3برات 4سایر',
    `amount`              bigint(20)                                             NOT NULL,
    `date`                int(11)                                                NOT NULL,
    `drawer_name`         varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `drawer_phonebook_id` int(11)                                                NOT NULL,
    `bank`                varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL,
    `number`              varchar(25)                                                     DEFAULT NULL,
    `scan_path`           varchar(250) CHARACTER SET utf8 COLLATE utf8_persian_ci         DEFAULT NULL,
    `note_type`           tinyint(1)                                             NOT NULL DEFAULT '1' COMMENT '1تضامنی 2سررسید دار',
    `deposit_to`          int(11)                                                         DEFAULT NULL,
    `due_date`            int(11)                                                         DEFAULT NULL,
    `notify_date`         int(11)                                                         DEFAULT NULL,
    `notify_to_admins`    varchar(100)                                                    DEFAULT NULL,
    `notify_cellphone`    varchar(11) CHARACTER SET utf8                                  DEFAULT NULL,
    `notified_date`       int(11)                                                         DEFAULT NULL,
    `description`         varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci         DEFAULT NULL,
    `status`              int(11)                                                NOT NULL DEFAULT '0' COMMENT '0دریافت شده 1واگذاری به حساب 2نقد شده 3درجریان وصول4برگشت خورده',
    `changes`             varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci         DEFAULT NULL,
    `comments`            varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci         DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


-- --------------------------------------------------------

--
-- Table structure for table `scores_settings`
--

CREATE TABLE `scores_settings`
(
    `id`             int(11)                                                 NOT NULL AUTO_INCREMENT,
    `name`           varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `value`          varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `title`          varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `description`    varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `group_number`   tinyint(1)                                              NOT NULL,
    `group_title`    varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'عنوان کل گروه',
    `count_function` varchar(50) CHARACTER SET utf8                          NOT NULL COMMENT 'نام تابعی از مدل scores که محاسبه تعداد این آیتم را انجام میدهد',
    `unit_id`        tinyint(1)                                              NOT NULL COMMENT 'امتیاز آیتم به پرسنل این بخش اعمال میشود',
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`, `unit_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


-- --------------------------------------------------------

--
-- Table structure for table `scores_record`
--

CREATE TABLE `scores_record`
(
    `id`          int(11)                                                NOT NULL AUTO_INCREMENT,
    `regtime`     int(11)                                                NOT NULL COMMENT 'تاریخ ثبت رکورد',
    `user_id`     int(11)                                                NOT NULL COMMENT 'کاربر مورد محاسبه',
    `user_name`   varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'نام کاربر',
    `user_exten`  int(11)                                                DEFAULT NULL COMMENT 'شماره داخلی کاربر',
    `unit_id`     int(11)                                                NOT NULL COMMENT 'بخش کاربر',
    `vac_status`  varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL COMMENT 'وضعیت مرخصی کاربر',
    `calc_time`   int(11)                                                NOT NULL COMMENT 'تاریخ مورد محاسبه',
    `calc_date`   varchar(20)                                            NOT NULL COMMENT 'تاریخ مورد محاسبه',
    `calc_result` float                                                  NOT NULL COMMENT 'جمع امتیازات',
    `calc_items`  text CHARACTER SET utf8 COLLATE utf8_persian_ci COMMENT 'آیتمهای امتیاز',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


-- --------------------------------------------------------

--
-- Table structure for table `work_reports`
--

CREATE TABLE `work_reports`
(
    `id`            int(11)                                                 NOT NULL AUTO_INCREMENT,
    `unit_id`       int(11)                                                 NOT NULL COMMENT 'بخش',
    `supervisor_id` int(11)                                                 NOT NULL COMMENT 'سرپرست',
    `user_id`       int(11)                                                 NOT NULL COMMENT 'کاربر',
    `subject`       varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL COMMENT 'عنوان فعالیت',
    `start_time`    int(11)                                                 NOT NULL COMMENT 'زمان شروع',
    `end_time`      int(11)                                                          DEFAULT NULL COMMENT 'زمان پایان',
    `notes`         text CHARACTER SET utf8 COLLATE utf8_persian_ci COMMENT 'توضیحات کاربر و سرپرست',
    `link`          varchar(250) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'لینک',
    `hardness`      tinyint(1)                                                       DEFAULT NULL COMMENT 'درجه سختی',
    `status`        tinyint(1)                                              NOT NULL DEFAULT '1' COMMENT '1شروع 2تکمیل 3امتیاز داده شده',
    `score`         int(11)                                                 NOT NULL DEFAULT '0' COMMENT 'امتیاز',
    `admin_id`      int(11)                                                          DEFAULT NULL COMMENT 'امتیاز دهنده',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1 COMMENT ='ثبت فعالیت روزانه';


-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders`
(
    `id`               int(11)                                                 NOT NULL AUTO_INCREMENT,
    `reg_time`         int(11)                                                 NOT NULL,
    `user_id`          int(11)                                                 NOT NULL COMMENT 'کاربر ثبت یادآوری',
    `due_time`         int(11)                                                 NOT NULL COMMENT 'زمان انجام یادآوری',
    `text`             varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL COMMENT 'متن یادآوری',
    `voice_url`        varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'آدرس فایل جهت تماس صوتی',
    `description`      text CHARACTER SET utf8 COLLATE utf8_persian_ci COMMENT 'توضیحات',
    `advance_user_id`  int(11)                                                          DEFAULT NULL COMMENT 'یادآوری برای این کاربر است',
    `user_cellphone`   varchar(11)                                                      DEFAULT NULL COMMENT 'با این شماره تماس گرفته میشود',
    `user_email`       varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'یادآوری به این آدرس ایمیل میشود',
    `send_sms`         tinyint(1)                                              NOT NULL DEFAULT '1' COMMENT 'به موبایل کاربر پیامک شود؟',
    `userpanel_status` tinyint(1)                                              NOT NULL DEFAULT '0' COMMENT 'در پنل کاربر نمایش داده شده؟',
    `sms_status`       tinyint(1)                                              NOT NULL DEFAULT '0' COMMENT 'پیامک ارسال شده ؟',
    `call_status`      tinyint(1)                                              NOT NULL DEFAULT '0' COMMENT 'تماس گرفته شده؟',
    `email_status`     tinyint(1)                                              NOT NULL DEFAULT '0' COMMENT 'ایمیل ارسال شده؟',
    `log`              varchar(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci         DEFAULT NULL COMMENT 'پیگیری عملکرد کرون جاب',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


-- --------------------------------------------------------

--
-- Table structure for table `contentsPages`
--

CREATE TABLE `contentsPages` (
  `id` int(11) NOT NULL,
  `service` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0دامنه 1پرواز داخلی 2پرواز خارجی 3هتل داخلی 4هتل خارجی 5اتوبوس 6قطار 7تور 9تور آنلاین داخلی 11پرواز دوطرفه 12قطار خارجی 13خدمات گردشگری 20ویزا',
  `fromSource` varchar(25) COLLATE utf8_persian_ci NOT NULL,
  `toDest` varchar(25) COLLATE utf8_persian_ci NOT NULL,
  `hotel` varchar(50) COLLATE utf8_persian_ci NOT NULL COMMENT 'آی دی هتل در یک شهر مقصد',
  `tourCategory` varchar(70) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'عنوان انگلیسی دسته بندی گردشگری',
  `tourService` varchar(70) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'عنوان انگلیسی خدمت گردشگری',
  `manualLink` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'اتصال محتوا به صفحه سایت ، دستی است؟ (از طریق مقدار فیلد link)',
  `link` varchar(250) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'لینک نمایش محتوا در سایت',
  `linkRedirect` varchar(250) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'به این لینک ریدایرکت شود',
  `published` tinyint(1) DEFAULT 1 COMMENT 'آیا محتوا منتشر شده است؟',
  `publishTime` int(11) DEFAULT NULL COMMENT 'اگر منتشر نشده در چه زمانی منتشر شود؟',
  `publishLog` varchar(250) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'تاریخ و کاربر آخرین بروزرسانی انتشار',
  `textContent` text COLLATE utf8_persian_ci NOT NULL,
  `metaKeywords` varchar(250) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'کلیدواژه های موتورهای جستجو',
  `metaDescription` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'توضیحات برای موتورهای جستجو',
  `pageTitle` varchar(200) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'در صورت وجود برای عنوان صفحه استفاده میشود',
  `tagH1` varchar(200) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'بعنوان اولین تگ H1 در صفحه استفاده میشود',
  `abstract` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'خلاصه محتوا - در زیر تگ H1 نمایش  داده می شود',
  `tagVideo` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'آدرس فایل ویدئو و فایل تصویر تگ ویدئو صفحه (بصورتJSON)',
  `travelInfo` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'اطلاعات سفر (بصورتJSON)',
  `schemaQuestions` text COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'سوال و جوابهای schema (بصورتJSON)',
  `relatedLinksH1` varchar(200) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'عنوان بخش لینکهای مرتبط',
  `relatedLinks` text COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'لینکهای مرتبط (بصورتJSON)',
  `extraRelatedLinksH1` text COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'آرایه عنوان های بخش های لینک مرتبط اضافه (JSON)',
  `extraRelatedLinks` text COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'آرایه بخش های لینک مرتبط اضافه (JSON)',
  `dailyNews` text COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'اخبار روز (بصورتJSON)',
  `alternative` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'نزدیکترین تور (بصورت JSON)',
  `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'آیا باکس جستجوی محصول نمایش داده شود؟',
  `searchService` tinyint(1) DEFAULT NULL COMMENT 'باکس جستجوی کدام محصول نمایش داده شود؟',
  `showInSitemap` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'آیا لینک در سایتمپ نمایش داده شود؟',
  `lastmodeStatus` varchar(250) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'جیسون آخرین اطلاعات جهت استفاده در بروز رسانی lasmode',
  `lastmode` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'تاریخ جهت نمایش در سایت مپ',
  `log` varchar(250) CHARACTER SET utf8 DEFAULT NULL COMMENT 'تاریخ و کاربر آخرین بروزرسانی محتوا'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci COMMENT='محتوای صفحات';


-- --------------------------------------------------------

--
-- Table structure for table `seocontrol`
--

CREATE TABLE `seocontrol`
(
    `id`                    int(11) NOT NULL AUTO_INCREMENT,
    `reg_time`              int(11) NOT NULL,
    `user_id`               int(11) NOT NULL COMMENT 'کاربر ثبت کننده',
    `seocontrol_keyword_id` int(11) NOT NULL COMMENT 'کلمه کلیدی مربوطه در جدول  seocontrol_keywords',
    `type`                  int(11) NOT NULL COMMENT '1وضعیت 2فعالیت 3رقبا',
    `google_rank`           int(11) NOT NULL                                        DEFAULT '0' COMMENT 'رتبه در گوگل',
    `bing_rank`             int(11) NOT NULL                                        DEFAULT '0' COMMENT 'رتبه در بینگ',
    `alexa_rank`            int(11) NOT NULL                                        DEFAULT '0' COMMENT 'رتبه در الکسا',
    `googlerank_change`     int(11) NOT NULL                                        DEFAULT '0' COMMENT 'تغییر در رتبه گوگل',
    `bingrank_change`       int(11) NOT NULL                                        DEFAULT '0' COMMENT 'تغییر در رتبه بینگ',
    `alexarank_change`      int(11) NOT NULL                                        DEFAULT '0' COMMENT 'تغییر در رتبه الکسا',
    `name`                  varchar(250) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'فعالیت-سایت',
    `link`                  varchar(250) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `extra_text1`           varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL COMMENT '"تاریخ انتها" در فعالیت',
    `extra_number1`         int(11)                                                 DEFAULT NULL COMMENT '"مبلغ هزینه" در فعالیت-"تعداد بک لینک" در رقبا',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = latin1;


-- --------------------------------------------------------

--
-- Table structure for table `seocontrol_keywords`
--

CREATE TABLE `seocontrol_keywords`
(
    `id`          int(11)                                                 NOT NULL AUTO_INCREMENT,
    `reg_time`    int(11)                                                 NOT NULL COMMENT 'تاریخ ثبت',
    `user_id`     int(11)                                                 NOT NULL COMMENT 'کاربر ثبت کننده',
    `keyword`     varchar(250) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL COMMENT 'نام کلمه کلیدی',
    `link`        varchar(250) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL COMMENT 'لینک',
    `google_rank` int(11)                                                 NOT NULL DEFAULT '0' COMMENT 'آخرین رتبه ثبت شده گوگل',
    `bing_rank`   int(11)                                                 NOT NULL DEFAULT '0' COMMENT 'آخرین رتبه ثبت شده بینگ',
    `alexa_rank`  int(11)                                                 NOT NULL DEFAULT '0' COMMENT 'آخرین رتبه ثبت شده الکسا',
    `total_cost`  int(11)                                                 NOT NULL DEFAULT '0' COMMENT 'جمع هزینه',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = latin1;



CREATE TABLE `notifications_action`
(
    `id`                 int(11)                              NOT NULL,
    `safarang_id`        int(11)                              NOT NULL,
    `regdate`            int(11)                              NOT NULL,
    `calldate`           int(11)                              NOT NULL,
    `notification_id`    int(11)                              NOT NULL,
    `pnr`                varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `ticket_id`          int(11)                              NOT NULL,
    `mobile`             varchar(20) COLLATE utf8_persian_ci  NOT NULL,
    `voice`              varchar(500) COLLATE utf8_persian_ci NOT NULL,
    `trunk`              varchar(200) COLLATE utf8_persian_ci          DEFAULT '',
    `send_voice`         tinyint(1)                           NOT NULL,
    `confirmation`       tinyint(1)                           NOT NULL,
    `callCount`          int(11)                                       DEFAULT '0',
    `callStatus`         tinyint(1)                                    DEFAULT '0',
    `callData`           tinyint(1)                                    DEFAULT '0',
    `lastCall`           int(11)                                       DEFAULT NULL,
    `status`             tinyint(4)                           NOT NULL,
    `admin_id`           varchar(20) CHARACTER SET utf8       NOT NULL,
    `admin_name`         varchar(50) CHARACTER SET utf8       NOT NULL,
    `refundMethod`       tinyint(1)                           NOT NULL,
    `percent`            tinyint(5)                           NOT NULL,
    `log`                text COLLATE utf8_persian_ci         NOT NULL,
    `des`                varchar(500) COLLATE utf8_persian_ci          DEFAULT NULL,
    `admin_id_final`     varchar(20) COLLATE utf8_persian_ci           DEFAULT NULL,
    `admin_name_final`   varchar(50) COLLATE utf8_persian_ci           DEFAULT NULL,
    `final`              tinyint(1)                                    DEFAULT '0',
    `deadline`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `changeStatus`       tinyint(1)                           NOT NULL DEFAULT '0',
    `refund`             tinyint(1)                           NOT NULL,
    `site`               varchar(50) COLLATE utf8_persian_ci           DEFAULT '',
    `type_notifications` varchar(10) CHARACTER SET utf8       NOT NULL,
    `regdate2`           int(11)                              NOT NULL,
    `ttime`              varchar(10) COLLATE utf8_persian_ci  NOT NULL,
    `status2`            tinyint(4)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;
-- --------------------------------------------------------

--
-- Table structure for table `visa`
--

CREATE TABLE `visa`
(
    `visa_Id`                 bigint(20)                                              NOT NULL,
    `visa_adminid`            int(11)                                                 NOT NULL,
    `visa_country`            varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `visa_ptell`              varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `visa_cellphone`          varchar(15) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `visa_pcount`             int(11)                                                 NOT NULL,
    `visa_price`              bigint(20)                                              NOT NULL,
    `visa_priceall`           bigint(20)                                              NOT NULL,
    `visa_varizt`             varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `visa_tarikhvariz`        varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `visa_shomarekartmabda`   varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `visa_shomarekartmaghsad` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `visa_describe`           text CHARACTER SET utf8 COLLATE utf8_persian_ci         NOT NULL,
    `visa_date`               varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `user_id`                 bigint(20)                                              NOT NULL,
    `visa_status`             int(11)                                                 NOT NULL,
    `visa_amount`             bigint(20)                                              NOT NULL,
    `visa_paystatus`          tinyint(4)                                              NOT NULL,
    `visa_tiket`              int(11)                                                 NOT NULL,
    `visa_paydescribe`        text CHARACTER SET utf8 COLLATE utf8_persian_ci         NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accounting_documents`
--

CREATE TABLE `accounting_documents`
(
    `id`             int(11)        NOT NULL,
    `type`           tinyint(5)     NOT NULL,
    `description`    varchar(1000)  NOT NULL,
    `amount`         decimal(12, 0) NOT NULL,
    `createDate`     bigint(20)     NOT NULL,
    `ISrefund`       TINYINT(1)     NOT NULL DEFAULT '0',
    `typeSabt`       TINYINT(1)     NULL     DEFAULT '0',
    `idDaftarSelf`   INT            NOT NULL,
    `idDaftarReturn` INT            NOT NULL,
    `status` TINYINT(1) NOT NULL DEFAULT '0',
    `transactions` TEXT CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
-- --------------------------------------------------------

--
-- Table structure for table `user_notif`
--

CREATE TABLE `user_notif`
(
    `id`              int(11)                        NOT NULL,
    `regdate`         varchar(20) CHARACTER SET utf8 NOT NULL,
    `service`         varchar(50) CHARACTER SET utf8 NOT NULL,
    `user_cellphone`  varchar(20) CHARACTER SET utf8 NOT NULL,
    `date`            varchar(30) CHARACTER SET utf8 NOT NULL,
    `day`             tinyint(4)                     NOT NULL,
    `origin`          varchar(50) CHARACTER SET utf8 NOT NULL,
    `destination`     varchar(50) CHARACTER SET utf8 NOT NULL,
    `vehicle_id`      varchar(100) CHARACTER SET utf8         DEFAULT NULL,
    `price`           bigint(50) UNSIGNED            NOT NULL,
    `percent`         tinyint(4)                     NOT NULL,
    `ip`              varchar(30) CHARACTER SET utf8          DEFAULT NULL,
    `validation_time` varchar(20) CHARACTER SET utf8          DEFAULT NULL,
    `code`            varchar(10) CHARACTER SET utf8          DEFAULT NULL,
    `sms_status`      tinyint(4)                     NOT NULL DEFAULT 0,
    `buy_status`      tinyint(4)                     NOT NULL,
    `try`             tinyint(11)                    NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Table structure for table `admin`
--

CREATE TABLE `admin`
(
    `admin_id`            int(11)                                                 NOT NULL,
    `admin_user`          varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `admin_pass`          varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `admin_permission`    tinyint(4)                                              NOT NULL,
    `admin_login_date`    varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `admin_active`        tinyint(4)                                              NOT NULL,
    `admin_name`          varchar(200) COLLATE utf8_persian_ci                    NOT NULL,
    `admin_cellphone`     varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `admin_email`         varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `admin_permissions`   varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `admin_dakheli`       int(10)                                                 NOT NULL,
    `admin_tell`          int(11)                                                 NOT NULL,
    `admin_hesabdari`     int(11)                                                 NOT NULL,
    `permission_group_id` int(11)                                                      DEFAULT NULL,
    `signature`           VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `perstamp`            VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `signature_name`      VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `admin_group`         INT(11),
    `admin_pic`           VARCHAR(300) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_user`, `admin_pass`, `admin_permission`, `admin_login_date`, `admin_active`,
                     `admin_name`, `admin_cellphone`, `admin_email`, `admin_permissions`, `admin_dakheli`, `admin_tell`,
                     `admin_hesabdari`, `permission_group_id`)
VALUES (1, 'admin', '', 5, '1487245286', 1, 'مدیر ', '9151111111', 'Test@gmail.com', '', 310, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adminlog`
--

CREATE TABLE `adminlog`
(
    `adminlog`       bigint(20)                      NOT NULL,
    `admin_id`       int(11)                         NOT NULL,
    `adminlog_ip`    varchar(50) CHARACTER SET utf8  NOT NULL,
    `adminlog_log`   varchar(500) CHARACTER SET utf8 NOT NULL,
    `adminlog_date`  varchar(25) CHARACTER SET utf8  NOT NULL,
    `adminlog_kinde` varchar(250) CHARACTER SET utf8 NOT NULL,
    `adminlog_type`  tinyint(4)                      NOT NULL,
    `user_id`        bigint(20)                      NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_ip`
--

CREATE TABLE `admin_ip`
(
    `admin_ip_id` bigint(20)  NOT NULL,
    `admin_id`    int(11)     NOT NULL,
    `admin_ip`    varchar(50) NOT NULL,
    `time_login`  varchar(50) NOT NULL,
    `time_logout` varchar(50) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Dumping data for table `admin_ip`
--

INSERT INTO `admin_ip` (`admin_ip_id`, `admin_id`, `admin_ip`, `time_login`, `time_logout`)
VALUES (192, 1, '31.59.71.21', '1487144676', ''),
       (193, 1, '2.180.121.183', '1487245286', '');


CREATE TABLE `admin_notif`
(
    `id`               int(11)    NOT NULL AUTO_INCREMENT,
    `text`             varchar(200) DEFAULT NULL,
    `link`             varchar(500) DEFAULT NULL,
    `view_by`          varchar(200) DEFAULT NULL,
    `set_timestamp`    int(11)    NOT NULL,
    `active_timestamp` int(11)      DEFAULT NULL,
    `status`           tinyint(4) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles`
(
    `articleID`         int(11)                               NOT NULL,
    `rank`              float                                 NOT NULL,
    `title`             varchar(255) COLLATE utf8_persian_ci           DEFAULT NULL,
    `subject`           varchar(255) COLLATE utf8_persian_ci  NOT NULL,
    `description`       text COLLATE utf8_persian_ci,
    `short_description` text COLLATE utf8_persian_ci,
    `meta_word`         text COLLATE utf8_persian_ci          NOT NULL,
    `meta_descrip`      text COLLATE utf8_persian_ci          NOT NULL,
    `active`            varchar(4) COLLATE utf8_persian_ci    NOT NULL,
    `article_code`      char(35) COLLATE utf8_persian_ci               DEFAULT NULL,
    `thumbnail`         varchar(30) COLLATE utf8_persian_ci            DEFAULT NULL,
    `image_logo`        text COLLATE utf8_persian_ci,
    `image_logob`       text COLLATE utf8_persian_ci          NOT NULL,
    `cod_link`          varchar(255) COLLATE utf8_persian_ci           DEFAULT NULL,
    `customers_rating`  float                                 NOT NULL,
    `rowShow`           int(5)                                NOT NULL,
    `date`              varchar(50) COLLATE utf8_persian_ci   NOT NULL,
    `visit`             int(11)                               NOT NULL,
    `article_top`       varchar(10) COLLATE utf8_persian_ci   NOT NULL,
    `comment`           varchar(10) COLLATE utf8_persian_ci   NOT NULL,
    `article_entitle`   varchar(255) COLLATE utf8_persian_ci  NOT NULL,
    `article_video`     text COLLATE utf8_persian_ci          NOT NULL,
    `meta_creator`      text COLLATE utf8_persian_ci COMMENT 'نویسنده',
    `meta_contributors` text COLLATE utf8_persian_ci COMMENT 'کمک کننده',
    `meta_type`         text COLLATE utf8_persian_ci COMMENT 'نوع',
    `meta_source`       text COLLATE utf8_persian_ci COMMENT 'منبع',
    `meta_relation`     text COLLATE utf8_persian_ci COMMENT 'ارتباط و یکسان بودن',
    `meta_coverage`     text COLLATE utf8_persian_ci COMMENT 'پوشش',
    `meta_rights`       text COLLATE utf8_persian_ci COMMENT 'حقوق',
    `tour_type`         varchar(50) COLLATE utf8_persian_ci   NOT NULL,
    `tour_state`        varchar(100) COLLATE utf8_persian_ci  NOT NULL,
    `tour_city`         varchar(50) COLLATE utf8_persian_ci   NOT NULL,
    `tour_date`         varchar(50) COLLATE utf8_persian_ci   NOT NULL,
    `tour_start`        varchar(50) COLLATE utf8_persian_ci   NOT NULL,
    `tour_end`          varchar(50) COLLATE utf8_persian_ci   NOT NULL,
    `type`              tinyint(4)                            NOT NULL,
    `tour_transfer`     varchar(255) COLLATE utf8_persian_ci  NOT NULL,
    `tour_country`      varchar(100) COLLATE utf8_persian_ci  NOT NULL,
    `tour_trip_type`    int(4)                                NOT NULL,
    `tour_hotel`        varchar(255) COLLATE utf8_persian_ci  NOT NULL,
    `tour_staying_time` varchar(255) COLLATE utf8_persian_ci  NOT NULL,
    `tour_special`      int(4)                                NOT NULL,
    `tour_airline`      varchar(100) COLLATE utf8_persian_ci  NOT NULL,
    `article_related`   varchar(3000) COLLATE utf8_persian_ci NOT NULL,
    `tags`              varchar(1000) COLLATE utf8_persian_ci NOT NULL,
    `likes`             INT(5)                                NOT NULL DEFAULT '0',
    `comments`          INT(5)                                NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles_tags`
--

CREATE TABLE `articles_tags`
(
    `id`     int(64)      NOT NULL,
    `tag`    varchar(100) NOT NULL,
    `tag_en` varchar(100) NOT NULL,
    `time`   bigint(20)   NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;



-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

CREATE TABLE `article_category`
(
    `categoryID`        int(11)                             NOT NULL,
    `name`              varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `name_en`           varchar(40) COLLATE utf8_persian_ci NOT NULL,
    `description`       text COLLATE utf8_persian_ci,
    `meta_descrip`      text COLLATE utf8_persian_ci        NOT NULL,
    `meta_word`         text COLLATE utf8_persian_ci        NOT NULL,
    `image`             varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
    `rowShow`           int(11)                              DEFAULT NULL,
    `active`            varchar(4) COLLATE utf8_persian_ci  NOT NULL,
    `rootID`            bigint(11)                          NOT NULL,
    `catalog`           int(11)                             NOT NULL,
    `short_description` text COLLATE utf8_persian_ci        NOT NULL,
    `color`             text COLLATE utf8_persian_ci        NOT NULL,
    `category_top`      varchar(5) COLLATE utf8_persian_ci  NOT NULL,
    `menu`              tinyint(4)                          NOT NULL,
    `type`              int(4)                              NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_connect`
--

CREATE TABLE `article_connect`
(
    `id`         bigint(20)                           NOT NULL,
    `articleID`  bigint(20)                           NOT NULL,
    `categoryID` bigint(20)                           NOT NULL,
    `name`       varchar(150) COLLATE utf8_persian_ci NOT NULL,
    `rootID`     int(11)                              NOT NULL,
    `rootName`   varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `name_en`    varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `type`       tinyint(4)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;
-- --------------------------------------------------------

--
-- Stand-in structure for view `articles_view`
-- (See below for the actual view)
--

CREATE VIEW `articles_view` AS
select `article_connect`.`id`                 AS `connect_id`,
       `article_connect`.`articleID`          AS `connect_articleID`,
       `article_connect`.`categoryID`         AS `connect_categoryID`,
       `article_connect`.`name`               AS `connect_name`,
       `article_connect`.`rootID`             AS `connect_rootID`,
       `article_connect`.`rootName`           AS `connect_rootName`,
       `article_connect`.`name_en`            AS `connect_name_en`,
       `article_connect`.`type`               AS `connect_type`,
       `article_category`.`categoryID`        AS `category_categoryID`,
       `article_category`.`name`              AS `category_name`,
       `article_category`.`name_en`           AS `category_name_en`,
       `article_category`.`description`       AS `category_description`,
       `article_category`.`meta_descrip`      AS `category_meta_descrip`,
       `article_category`.`meta_word`         AS `category_meta_word`,
       `article_category`.`image`             AS `category_image`,
       `article_category`.`rowShow`           AS `category_rowShow`,
       `article_category`.`active`            AS `category_active`,
       `article_category`.`rootID`            AS `category_rootID`,
       `article_category`.`catalog`           AS `category_catalog`,
       `article_category`.`short_description` AS `category_short_description`,
       `article_category`.`color`             AS `category_color`,
       `article_category`.`category_top`      AS `category_category_top`,
       `article_category`.`menu`              AS `category_menu`,
       `article_category`.`type`              AS `category_type`,
       `articles`.`articleID`                 AS `articles_articleID`,
       `articles`.`rank`                      AS `articles_rank`,
       `articles`.`title`                     AS `articles_title`,
       `articles`.`subject`                   AS `articles_subject`,
       `articles`.`description`               AS `articles_description`,
       `articles`.`short_description`         AS `articles_short_description`,
       `articles`.`meta_word`                 AS `articles_meta_word`,
       `articles`.`meta_descrip`              AS `articles_meta_descrip`,
       `articles`.`active`                    AS `articles_active`,
       `articles`.`article_code`              AS `articles_article_code`,
       `articles`.`thumbnail`                 AS `articles_thumbnail`,
       `articles`.`image_logo`                AS `articles_image_logo`,
       `articles`.`image_logob`               AS `articles_image_logob`,
       `articles`.`cod_link`                  AS `articles_cod_link`,
       `articles`.`customers_rating`          AS `articles_customers_rating`,
       `articles`.`rowShow`                   AS `articles_rowShow`,
       `articles`.`date`                      AS `articles_date`,
       `articles`.`visit`                     AS `articles_visit`,
       `articles`.`article_top`               AS `articles_article_top`,
       `articles`.`comment`                   AS `articles_comment`,
       `articles`.`article_entitle`           AS `articles_article_entitle`,
       `articles`.`article_video`             AS `articles_article_video`,
       `articles`.`meta_creator`              AS `articles_meta_creator`,
       `articles`.`meta_contributors`         AS `articles_meta_contributors`,
       `articles`.`meta_type`                 AS `articles_meta_type`,
       `articles`.`meta_source`               AS `articles_meta_source`,
       `articles`.`meta_relation`             AS `articles_meta_relation`,
       `articles`.`meta_coverage`             AS `articles_meta_coverage`,
       `articles`.`meta_rights`               AS `articles_meta_rights`,
       `articles`.`tour_type`                 AS `articles_tour_type`,
       `articles`.`tour_state`                AS `articles_tour_state`,
       `articles`.`tour_city`                 AS `articles_tour_city`,
       `articles`.`tour_date`                 AS `articles_tour_date`,
       `articles`.`tour_start`                AS `articles_tour_start`,
       `articles`.`tour_end`                  AS `articles_tour_end`,
       `articles`.`type`                      AS `articles_type`,
       `articles`.`tour_transfer`             AS `articles_tour_transfer`,
       `articles`.`tour_country`              AS `articles_tour_country`,
       `articles`.`tour_trip_type`            AS `articles_tour_trip_type`,
       `articles`.`tour_hotel`                AS `articles_tour_hotel`,
       `articles`.`tour_staying_time`         AS `articles_tour_staying_time`,
       `articles`.`tour_special`              AS `articles_tour_special`,
       `articles`.`tour_airline`              AS `articles_tour_airline`,
       `articles`.`article_related`           AS `articles_article_related`,
       `articles`.`tags`                      as `articles_tags`,
       `articles`.`likes`                     AS `articles_likes`,
       `articles`.`comments`                  AS `articles_comments`
from ((`article_connect` left join `article_category`
       on ((`article_connect`.`categoryID` = `article_category`.`categoryID`))) left join `articles`
      on ((`article_connect`.`articleID` = `articles`.`articleID`)));

-- --------------------------------------------------------

--
-- Table structure for table `bankdraft`
--

CREATE TABLE `bankdraft`
(
    `bankDraftID`            bigint(20)                           NOT NULL,
    `orderID`                bigint(20)                           NOT NULL,
    `peymentAmount`          bigint(20)                           NOT NULL,
    `name`                   varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `user_id`                bigint(20)                           NOT NULL,
    `dateCreate`             varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `paymentDate`            varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `describe`               varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `codePayment`            varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `account`                varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `serial`                 varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `status`                 tinyint(4)                           NOT NULL,
    `archive`                tinyint(3)                           NOT NULL,
    `user_id_create`         bigint(20)                           NOT NULL,
    `user_type_create`       varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_id_accept`         bigint(20)                           NOT NULL,
    `user_type_accept`       varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `accept_describe`        text COLLATE utf8_persian_ci         NOT NULL,
    `bankdraft_userDescribe` text COLLATE utf8_persian_ci         NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `benefit_loss`
--

CREATE TABLE `faq`
(
    `id`       int(11)                                                 NOT NULL AUTO_INCREMENT,
    `unit_id`  tinyint(1)                                              NOT NULL DEFAULT '0',
    `question` varchar(250) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `answer`   text CHARACTER SET utf8 COLLATE utf8_persian_ci         NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = latin1;

CREATE TABLE `benefit_loss`
(
    `id`                 int(11)      NOT NULL,
    `serviceprovidersId` int(11)                                         DEFAULT NULL,
    `userId`             int(11)                                         DEFAULT NULL,
    `paymentId`          varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
    `amount`             decimal(15, 0)                                  DEFAULT NULL,
    `cash`               decimal(15, 0)                                  DEFAULT NULL,
    `description`        varchar(200) NOT NULL                           DEFAULT '',
    `refrenceId`         int(11)                                         DEFAULT '0',
    `ticketTypeId`       int(4)                                          DEFAULT '0',
    `bankId`             tinyint(1)                                      DEFAULT '0',
    `transactionTypeId`  tinyint(1)                                      DEFAULT '0',
    `documentId`         INT(11)                                         DEFAULT 0,
    `createDate`         timestamp    NOT NULL                           DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block`
(
    `block_id`       int(11)                             NOT NULL,
    `block_ip`       varchar(50) COLLATE utf8_persian_ci NOT NULL,
    `block_date`     varchar(50) COLLATE utf8_persian_ci NOT NULL,
    `block_describe` text COLLATE utf8_persian_ci        NOT NULL,
    `block_active`   tinyint(4)                          NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;
-- --------------------------------------------------------

--
-- Table structure for table `city_routes`
--

CREATE TABLE `city_routes`
(
    `city_routes_id`                 int(11) NOT NULL,
    `city_routes_pname`              varchar(50) DEFAULT NULL,
    `city_routes_ename`              varchar(50) DEFAULT NULL,
    `city_routes_alias`              varchar(50) DEFAULT NULL,
    `city_routes_iata_code`          text,
    `city_routes_routes`             text,
    `city_routes_train_routes`       text,
    `city_routes_bus_routes`         text,
    `city_routes_routes_count`       int(11)     DEFAULT NULL,
    `city_routes_train_routes_count` int(11)     DEFAULT NULL,
    `city_routes_bus_routes_count`   int(11) NOT NULL,
    `city_routes_priority`           int(2)      DEFAULT NULL,
    `city_routes_active`             int(1)      DEFAULT NULL,
    `city_routes_hotel_id`           int(11)     DEFAULT NULL,
    `city_routes_active_flight`      int(1)      DEFAULT NULL,
    `city_routes_active_train`       int(1)      DEFAULT NULL,
    `city_routes_active_bus`         int(1)      DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `city_routes`
--


INSERT INTO `city_routes` (`city_routes_id`, `city_routes_pname`, `city_routes_ename`, `city_routes_alias`,
                           `city_routes_iata_code`, `city_routes_routes`, `city_routes_train_routes`,
                           `city_routes_bus_routes`, `city_routes_routes_count`, `city_routes_train_routes_count`,
                           `city_routes_bus_routes_count`, `city_routes_priority`, `city_routes_active`,
                           `city_routes_hotel_id`, `city_routes_active_flight`, `city_routes_active_train`,
                           `city_routes_active_bus`)
VALUES (1, 'تهران', 'Tehran', 'Tehran - THR - تهران', 'THR',
        '2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,31,32,34,36,37,38,39,35,40,30', '',
        '', 38, 0, 0, 0, 1, NULL, 1, 1, NULL),
       (2, 'مشهد', 'Mashhad', 'Mashhad - MHD - مشهد', 'MHD',
        '1,3,4,5,6,7,8,9,10,11,12,13,14,15,17,18,19,20,21,23,24,27,28', NULL, '', 23, NULL, 0, 0, 1, NULL, 1, 1, NULL),
       (3, 'اصفهان', 'Isfahan', 'Isfahan - IFN - اصفهان', 'IFN', '1,2,4,5,6,7,8,9,10,12,15,19,40', NULL, NULL, 13, NULL,
        0, 0, 1, NULL, 1, 1, NULL),
       (4, 'تبریز', 'Tabriz', 'Tabriz - TBZ - تبریز', 'TBZ', '1,2,3,5,6,7,8,9,10', NULL, NULL, 9, NULL, 0, 0, 1, NULL,
        1, 1, NULL),
       (5, 'شیراز', 'Shiraz', 'Shiraz - SYZ - شیراز', 'SYZ', '1,2,3,4,6,7,8,9,10,12,15,17,18,19,21,28', NULL, NULL, 16,
        NULL, 0, 0, 1, NULL, 1, 1, NULL),
       (6, 'اهواز', 'Ahvaz', 'Ahvaz - AWZ -اهواز', 'AWZ', '1,2,3,4,5,7,8,9,10,11,28', NULL, NULL, 11, NULL, 0, 0, 1,
        NULL, 1, 1, NULL),
       (7, 'کیش', 'Kish', 'Kish - KIH - کیش', 'KIH', '1,2,3,4,5,6,8,9,10,11,15,16,19,21,28', NULL, NULL, 15, NULL, 0, 0,
        1, NULL, 1, 1, NULL),
       (8, 'بندر عباس', 'Bandar Abbas', 'Bandar Abbas - BND - بندر عباس', 'BND', '1,2,3,4,5,6,7,9,10,11,12,17,19,21,28',
        NULL, NULL, 15, NULL, 0, 0, 1, NULL, 1, 1, NULL),
       (9, 'قشم', 'Gheshm', 'Gheshm - GSM - قشم', 'GSM', '1,2,3,5,10,19', '', NULL, 6, 0, 0, 0, 1, NULL, 1, 1, NULL),
       (10, 'کرمانشاه', 'Kermanshah', 'Kermanshah - KSH - کرمانشاه', 'KSH', '1,2,5,7,8,9', NULL, NULL, 6, NULL, 0, 0, 1,
        NULL, 1, 1, NULL),
       (11, 'یزد', 'Yazd', 'Yazd - AZD - یزد', 'AZD', '1,2,6,7,8', NULL, NULL, 5, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (12, 'آبادان', 'Abadan', 'Abadan - ABD - آبادان', 'ABD', '1,2,3,5,8', '', '', 5, 0, 0, 0, 1, 0, 1, 1, 1),
       (13, 'ارومیه', 'Urmieh', 'Urmieh - OMH - ارومیه', 'OMH', '1,2', NULL, NULL, 2, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (14, 'گرگان', 'Gorgan', 'Gorgan - GBT - گرگان', 'GBT', '1,2', NULL, NULL, 2, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (15, 'بوشهر', 'Bushehr', 'Bushehr - BUZ -بوشهر', 'BUZ', '1,2,3,5,7', NULL, NULL, 5, NULL, 0, 0, 1, 0, 1, 1,
        NULL),
       (16, 'سنندج', 'Sanandaj', 'Sanandaj - SDG - سنندج', 'SDG', '1,7', NULL, NULL, 2, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (17, 'چابهار', 'Chah bahar', 'Chah-bahar - ZBR - چابهار', 'ZBR', '1,2,5,8', NULL, NULL, 4, NULL, 0, 0, 1, 0, 1,
        1, NULL),
       (18, 'زاهدان', 'Zahedan', 'Zahedan - ZAH - زاهدان', 'ZAH', '1,2,5', NULL, NULL, 3, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (19, 'کرمان', 'Kerman', 'Kerman - KER - کرمان', 'KER', '1,2,3,5,7,8,9', NULL, NULL, 7, NULL, 0, 0, 1, 0, 1, 1,
        NULL),
       (20, 'اردبیل', 'Ardabil', 'Ardabil - ADU - اردبیل', 'ADU', '1,2', NULL, NULL, 2, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (21, 'رشت', 'Rasht', 'Rasht - RAS - رشت', 'RAS', '1,2,5,7,8', NULL, NULL, 5, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (22, 'دزفول', 'Dezful', 'Dezful - DEF - دزفول', 'DEF', '1', NULL, NULL, 1, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (23, 'بیرجند', 'Birjand', 'Birjand - XBJ - بیرجند', 'XBJ', '1,2', NULL, NULL, 2, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (24, 'ایلام', 'Ilaam', 'Ilaam - IIL - ایلام', 'IIL', '1,2', NULL, NULL, 2, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (25, 'رامسر', 'Ramsar', 'Ramsar - RZR - رامسر', 'RZR', '1', NULL, NULL, 1, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (26, 'لارستان', 'Lar', 'Lar - LRR - لارستان', 'LRR', '1', NULL, NULL, 1, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (27, 'زابل', 'Zabol', 'Zabol - ACZ - زابل', 'ACZ', '1,2', NULL, NULL, 2, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (28, 'ساری', 'Sary', 'Sary - SRY - ساری', 'SRY', '1,2,5,6,7,8', NULL, NULL, 6, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (29, 'سیرجان', 'Sirjan', 'Sirjan - SYJ - سیرجان', 'SYJ', '1', NULL, NULL, 1, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (30, 'بجنورد', 'Bojnord', 'Bojnord - BJB -بجنورد', 'BJB', '1', NULL, NULL, 1, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (31, 'شاهرود', 'Shahroud', 'Shahroud - RUD - شاهرود', 'RUD', '1', NULL, NULL, 1, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (32, 'شهرکرد', 'Shahre kord', 'Shahre kord - CQD - شهر کرد', 'CQD', '1', NULL, NULL, 1, NULL, 0, 0, 1, 0, 1, 1,
        NULL),
       (33, 'جیروفت', 'Jiroft', 'JYR - Jiroft - جیروفت', 'JYR', '', NULL, NULL, 0, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (34, 'رفسنجان', 'Rafsanjan', 'Rafsanjan - RJN - رفسنجان', 'RJN', '1', NULL, NULL, 1, NULL, 0, 0, 1, 0, 1, 1,
        NULL),
       (35, 'سبزوار', 'Sabzevar', 'Sabzevar - AFZ - سبزوار', 'AFZ', '1', NULL, NULL, 1, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (36, 'خوی', 'Khoy', 'Khoy - KHY - خوی', 'KHY', '1', NULL, NULL, 1, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (37, 'کلاله', 'kLleh', 'kLleh - KLM - کلاله', 'KLM', '1', NULL, NULL, 1, NULL, 0, 0, 1, 0, 1, 1, NULL),
       (38, 'بم', 'Bam', 'Bam - BXR - بم', 'BXR', '1', '', '', 1, 1, 0, 0, 1, 0, 1, 1, NULL),
       (39, 'گچساران', 'Ghachsaran', 'Ghachsaran - GCH - گچساران', 'GCH', '1', NULL, NULL, 1, NULL, 0, 0, 1, 0, 1, 1,
        NULL),
       (40, 'ماهشهر', 'Mahshar', 'Mahshar - MRX - ماهشهر', 'MRX', '1,3', NULL, NULL, 3, NULL, 0, 0, 1, 0, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions`
(
    `session_id`    varchar(40) COLLATE utf8_persian_ci  NOT NULL DEFAULT '0',
    `ip_address`    varchar(45) COLLATE utf8_persian_ci  NOT NULL DEFAULT '0',
    `user_agent`    varchar(120) COLLATE utf8_persian_ci NOT NULL,
    `last_activity` int(10) UNSIGNED                     NOT NULL DEFAULT '0',
    `user_data`     text COLLATE utf8_persian_ci         NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`)
VALUES ('0f798d7183a661aa0e4184d91dd4e77c', '66.249.79.169',
        'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1487212168, ''),
       ('25b8c8496bb4a199b242327217fb479b', '66.249.79.169',
        'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1487212168,
        'a:3:{s:9:\"user_data\";s:0:\"\";s:14:\"captcha_config\";s:498:\"a:15:{s:4:\"code\";s:3:\"G1L\";s:10:\"min_length\";i:3;s:10:\"max_length\";i:3;s:15:\"png_backgrounds\";a:1:{i:0;s:35:\"application/captcha2/captcha_bg.png\";}s:5:\"fonts\";a:1:{i:0;s:41:\"application/captcha2/times_new_yorker.ttf\";}s:10:\"characters\";s:35:\"ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789\";s:13:\"min_font_size\";i:25;s:13:\"max_font_size\";i:30;s:5:\"color\";s:4:\"#000\";s:9:\"angle_min\";i:0;s:9:\"angle_max\";i:0;s:6:\"shadow\";b:1;s:12:\"shadow_color\";s:4:\"#CCC\";s:15:\"shadow_offset_x\";i:-2;s:15:\"shadow_offset_y\";i:2;}\";s:12:\"captcha_info\";a:2:{s:4:\"code\";s:3:\"G1L\";s:9:\"image_src\";s:53:\"http://|||||||||||||||.ir/viewcaptcha?tr=0.53903800+1487212168\";}}'),
       ('37a7cbe5e7ac215c6edafe310de3deec', '2.180.121.183',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',
        1487245327, ''),
       ('441fb05b1164d48a6d84dd8d7651de48', '94.183.243.122',
        'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',
        1487238859, ''),
       ('5ad2287d024b4fda219d07c4e1b41b2d', '66.249.79.172',
        'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1487213690, ''),
       ('78764b4a10403abe64498fbae147bd43', '2.180.121.183',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',
        1487245327,
        'a:2:{s:9:\"user_data\";s:0:\"\";s:12:\"captcha_info\";a:2:{s:4:\"code\";s:3:\"ML8\";s:9:\"image_src\";s:53:\"http://|||||||||||||||.ir/viewcaptcha?tr=0.89414400+1487245330\";}}'),
       ('81d091c8fa6686a9cd7a5170e93c8a6b', '66.249.79.160',
        'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1487221243, ''),
       ('98d6e57562d452cdd7fde507c81d1ff2', '66.249.79.164',
        'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1487216718, ''),
       ('ca6764936a5c33b8328f84e5536a8d87', '2.180.121.183',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',
        1487232302, ''),
       ('d53eb00b2b7925ef3a5b4c48482f2be2', '66.249.79.172',
        'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1487213690, ''),
       ('d6fa69824e400dfd23e6fa1b0f9b7746', '66.249.79.164',
        'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1487216718, ''),
       ('f206de19fb78084a972ec83bd20d2a29', '66.249.79.160',
        'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1487221243, ''),
       ('f72ece78cebd46d5ec73d16443fa8696', '94.183.243.122',
        'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',
        1487238859, '');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents`
(
    `id`     int(11)                              NOT NULL,
    `type`   varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `title`  varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `value`  text COLLATE utf8_persian_ci         NOT NULL,
    `active` tinyint(1)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `type`, `title`, `value`, `active`)
VALUES (1, 'site', 'emailContentUs', 'info[at]|||||||||||||||[dot]com', 0),
       (3, 'site', 'google', '', 0),
       (4, 'site', 'alexa', '', 0),
       (5, 'site', 'meta_word',
        'خرید بلیط چارتر ارزان قیمت , بلیط هواپیما, خرید بلیط هواپیما,بلیط هواپیما خارجی, بلیط قطار,خرید بلیط قطار,قطار رجا, بلیط چارتر, رزرو بلیط هواپیما, قیمت بلیط هواپیما, خرید اینترنتی بلیط هواپیما خارجی, پرواز چارتر, بلیط هواپیما چارتر, هواپیمایی ماهان, ایران ایر,بلیط ارزان هواپیما, فروش بلیط هواپیما بلیط اتوبوس رزرو هتل مشهد هتل اصفهان هتل کیش هتل تهران',
        0),
       (6, 'site', 'meta_descrip',
        'خرید بلیط چارتر ارزان قیمت ،خرید اینترنتی بلیط هواپیما،بلیط چارتر و بلیط قطار رجا، رزرو بلیط هواپیما و خرید بلیط هواپیما خارجی  و خرید بلیط اتوبوس',
        0),
       (7, 'site', 'logo', '', 0),
       (8, 'site', 'siteName', 'خرید بلیط هواپیما بلیط قطار اتوبوس خرید بلیط چارترارزان قیمت', 0),
       (26, 'site', 'imagePage', '', 0),
       (29, 'site', 'logoImage', '/basefile/|||||||||||||||/images/logo/Untitled-11%20(2222).png', 0),
       (30, 'site', 'urlImages', 'basefile/|||||||||||||||/Images/', 0),
       (31, 'site', 'urlImageUser', 'basefile/|||||||||||||||/users/', 0),
       (33, 'site', 'logoUserImageM', '/basefile/|||||||||||||||/images/def-avatar.png', 0),
       (34, 'site', 'urlImageProducts', 'basefile/|||||||||||||||/products/', 0),
       (38, 'site', 'logoHotelsImage', '/basefile/|||||||||||||||/images/def-avatar.png', 0),
       (39, 'site', 'logoServiceImage', '/basefile/|||||||||||||||/images/def-avatar.png', 0),
       (40, 'site', 'logoUserImageF', '/basefile/|||||||||||||||/images/def-avatar.png', 0),
       (41, 'site', 'imageLogoProduct', '', 0),
       (44, 'site', 'urlImageArticle', 'basefile/|||||||||||||||/articles/', 0),
       (46, 'site', 'aticleAuthor', '', 0),
       (47, 'site', 'aticlePublisher', '', 0),
       (48, 'site', 'urlImageCatalog', 'basefile/|||||||||||||||/catalog/', 0),
       (49, 'site', 'urlImageCatalogArt', 'basefile/|||||||||||||||/catalogArt/', 0),
       (50, 'site', 'imageLogoCatalog', 'IR,EP,QB,I3,HH,NV,Y9,W5,JI,IV,ZV,VR', 0),
       (51, 'site', 'imageLogoCatalogArt', '', 0),
       (52, 'site', 'imageLogoArticle', '', 0),
       (53, 'site', 'address', '', 0),
       (54, 'site', 'emailContentUs2', '', 0),
       (55, 'site', 'phoneContactUs', '05138580959', 0),
       (56, 'site', 'urlExcel', 'basefile/|||||||||||||||/excel/', 0),
       (57, 'site', 'alert1',
        'درخواست شما با موفقیت ثبت شد. در حال بررسی میباشد.در صورت تمایل برای پیگیری با شماره تماس حاصل نماید .&#13;&#10;',
        0),
       (58, 'site', 'alert2', '1', 0),
       (59, 'form-contact', 'phoneContactUs2', '', 0),
       (60, 'form-contact', 'phoneContactUs3', '', 0),
       (61, 'form-contact', 'phoneContactUs4', '', 0),
       (62, 'form-contact', 'phoneContactUs5', '', 0),
       (63, 'aboutMain', 'linkvideo', '', 0),
       (64, 'site', 'componyNameSite', '|||||||||||||||', 0),
       (65, 'site', 'footerSiteText', '', 0),
       (66, 'site', 'DomainNameHami', 'http://|||||||||||||||.com', 0),
       (67, 'site', 'AccountNameHami', '|||||||||||||||', 0),
       (68, 'site', 'RedirectWebSite', 'http://|||||||||||||||.com', 0),
       (69, 'aboutMain', 'TextaboutMain', '', 0),
       (70, 'aboutUs', 'TextaboutUs', '', 0),
       (71, 'form-contact', 'TextContact', '', 0),
       (72, 'bankPin', 'BankMelat', '', 0),
       (73, 'bankPin', 'BankParsian', '', 0),
       (74, 'accountApiHami', 'accountApiHamiUser', '|||||||||||||||', 0),
       (75, 'accountApiHami', 'accountApiHamiPass', '#|||||||||||||||@$', 0),
       (76, 'site', 'RedirectWebSiteName', '|||||||||||||||', 0),
       (77, 'site', 'BaseDirSite', '|||||||||||||||', 0),
       (78, 'site', 'enamadCode', '', 0),
       (79, 'aboutMain', 'ArzNerkh', '0', 0),
       (80, 'bankPin', 'BankSaman', '', 0),
       (81, 'bankPin', 'bankMelatActive', '0', 0),
       (82, 'bankPin', 'bankParsianActive', '0', 0),
       (83, 'bankPin', 'bankSamanActive', '1', 0),
       (84, 'site', 'RedirectWebSite2', '', 0),
       (85, 'site', 'RedirectWebSite3', '', 0),
       (86, 'site', 'RedirectWebSiteName2', '', 0),
       (87, 'adv', 'advaside1', '', 0),
       (88, 'adv', 'advaside2', '', 0),
       (89, 'adv', 'advaside3', '', 0),
       (90, 'adv', 'advtop1', '', 0),
       (91, 'adv', 'advtop2', '', 0),
       (92, 'adv', 'advtop3', '', 0),
       (93, 'adv', 'advfooter1', '', 0),
       (94, 'adv', 'advfooter2', '', 0),
       (95, 'adv', 'advfooter3', '', 0),
       (96, 'adv', 'advheader1', '', 0),
       (97, 'adv', 'advheader2', '', 0),
       (98, 'adv', 'advheader3', '', 0),
       (99, 'flights', 'charterListOff', '0', 0),
       (100, 'flights', 'systemListOff', '0', 0),
       (101, 'flights', 'priceMarkupCharter', '60000', 0),
       (102, 'site', 'samnadehi', '', 0),
       (103, 'site', 'blockPriceMony', '0', 0),
       (104, 'userLimit', 'userLevel1', '0', 0),
       (105, 'userLimit', 'userLevel2', '20', 0),
       (106, 'userLimit', 'userLevel3', '0', 0),
       (107, 'userLimit', 'userLevel4', '0', 0),
       (108, 'userLimit', 'userLevel5', '0', 0),
       (109, 'site', 'ShowOnlinePayment', '1', 0),
       (110, 'site', 'AsideSearch', '', 0),
       (111, 'userLimit', 'userLevel6', '0', 0),
       (112, 'bankPin', 'BaseBankMelat', '', 0),
       (113, 'bankPin', 'BaseBankParsian', '', 0),
       (114, 'site', 'EmailBaseOnhami', 'info@|||||||||||||||.com', 0),
       (115, 'site', 'showMenuOnheader', '1', 0),
       (116, 'flights', 'SendSmsActive', '1', 0),
       (117, 'flights', 'SendEmailActive', '1', 0),
       (118, 'form-contact', 'telegramAccont', '', 0),
       (119, 'form-contact', 'telegramChanel', 'https://t.me/|||||||||||||||', 0),
       (120, 'site', 'templateSite', 'theme3', 0),
       (121, 'bus', 'priceMarkupBus', '0', 0),
       (122, 'bus', 'BusIsOff', '0', 0),
       (123, 'flights', 'FlightIsOff', '0', 0),
       (124, 'international', 'InternationalIsOff', '0', 0),
       (125, 'international', 'priceMarkupInternational', '3', 0),
       (126, 'hotel', 'priceMarkupHotel', '0', 0),
       (127, 'hotel', 'HotelIsOff', '0', 0),
       (135, 'train', 'priceMarkupTrain', '0', 0),
       (136, 'train', 'TrainIsOff', '0', 0),
       (137, 'flights', 'PriceMarkupBime', '0', 0),
       (138, 'userLimit', 'userLevel0', '0', 0),
       (139, 'accounting', 'LastApiMojodi', '0', 0),
       (140, 'userLimit', 'userLevelTrain0', '0', 0),
       (141, 'userLimit', 'userLevelTrain1', '0', 0),
       (142, 'userLimit', 'userLevelTrain2', '0', 0),
       (143, 'userLimit', 'userLevelTrain3', '0', 0),
       (144, 'userLimit', 'userLevelTrain4', '0', 0),
       (145, 'userLimit', 'userLevelTrain5', '0', 0),
       (146, 'userLimit', 'userLevelBus0', '0', 0),
       (147, 'userLimit', 'userLevelBus1', '0', 0),
       (148, 'userLimit', 'userLevelBus2', '0', 0),
       (149, 'userLimit', 'userLevelBus3', '0', 0),
       (150, 'userLimit', 'userLevelBus4', '0', 0),
       (151, 'userLimit', 'userLevelBus5', '0', 0),
       (152, 'userLimit', 'userLevelHotel0', '0', 0),
       (153, 'userLimit', 'userLevelHotel1', '0', 0),
       (154, 'userLimit', 'userLevelHotel2', '0', 0),
       (155, 'userLimit', 'userLevelHotel3', '0', 0),
       (156, 'userLimit', 'userLevelHotel4', '0', 0),
       (157, 'userLimit', 'userLevelHotel5', '0', 0),
       (158, 'userLimit', 'userLevelInternational0', '0', 0),
       (159, 'userLimit', 'userLevelInternational1', '0', 0),
       (160, 'userLimit', 'userLevelInternational2', '0', 0),
       (161, 'userLimit', 'userLevelInternational3', '0', 0),
       (162, 'userLimit', 'userLevelInternational4', '0', 0),
       (163, 'userLimit', 'userLevelInternational5', '0', 0),
       (164, 'accounting', 'UserHamiMojodi', '30000000000', 0),
       (165, 'webservice', 'IpAdressConnection', '', 0),
       (166, 'site', 'headerOFSite', '', 0),
       (169, 'flights', 'systemListOffAll', '', 0),
       (170, 'flights', 'charterListOffAll', '', 0),
       (171, 'flights', 'PriceFalse', '0', 0),
       (174, 'site', 'templateSiteBlog', 'blog', 0),
       (175, 'userLimit', 'userLevelSystem0', '0', 0),
       (176, 'userLimit', 'userLevelSystem1', '0', 0),
       (177, 'userLimit', 'userLevelSystem2', '0', 0),
       (178, 'userLimit', 'userLevelSystem3', '0', 0),
       (179, 'userLimit', 'userLevelSystem4', '0', 0),
       (180, 'userLimit', 'userLevelSystem5', '0', 0),
       (181, 'userLimit', 'userLevelCharter0', '0', 0),
       (182, 'userLimit', 'userLevelCharter1', '0', 0),
       (183, 'userLimit', 'userLevelCharter2', '0', 0),
       (184, 'userLimit', 'userLevelCharter3', '0', 0),
       (185, 'userLimit', 'userLevelCharter4', '0', 0),
       (186, 'userLimit', 'userLevelCharter5', '0', 0),
       (187, 'userLimit', 'userLevelSystemMahan0', '0', 0),
       (188, 'userLimit', 'userLevelSystemMahan1', '0', 0),
       (189, 'userLimit', 'userLevelSystemMahan2', '0', 0),
       (190, 'userLimit', 'userLevelSystemMahan3', '0', 0),
       (191, 'userLimit', 'userLevelSystemMahan4', '0', 0),
       (192, 'userLimit', 'userLevelSystemMahan5', '0', 0),
       (193, 'userLimit', 'userLevelSystemAseman0', '0', 0),
       (194, 'userLimit', 'userLevelSystemAseman1', '0', 0),
       (195, 'userLimit', 'userLevelSystemAseman2', '0', 0),
       (196, 'userLimit', 'userLevelSystemAseman3', '0', 0),
       (197, 'userLimit', 'userLevelSystemAseman4', '0', 0),
       (198, 'userLimit', 'userLevelSystemAseman5', '0', 0),
       (199, 'userLimit', 'userLevelSystemIranAir0', '0', 0),
       (200, 'userLimit', 'userLevelSystemIranAir1', '0', 0),
       (201, 'userLimit', 'userLevelSystemIranAir2', '0', 0),
       (202, 'userLimit', 'userLevelSystemIranAir3', '0', 0),
       (203, 'userLimit', 'userLevelSystemIranAir4', '0', 0),
       (204, 'userLimit', 'userLevelSystemIranAir5', '0', 0),
       (205, 'userLimit', 'userLevelSystemNaft0', '0', 0),
       (206, 'userLimit', 'userLevelSystemNaft1', '0', 0),
       (207, 'userLimit', 'userLevelSystemNaft2', '0', 0),
       (208, 'userLimit', 'userLevelSystemNaft3', '0', 0),
       (209, 'userLimit', 'userLevelSystemNaft4', '0', 0),
       (210, 'userLimit', 'userLevelSystemNaft5', '0', 0),
       (211, 'userLimit', 'userLevelSystemAtrak0', '0', 0),
       (212, 'userLimit', 'userLevelSystemAtrak1', '0', 0),
       (213, 'userLimit', 'userLevelSystemAtrak2', '0', 0),
       (214, 'userLimit', 'userLevelSystemAtrak3', '0', 0),
       (215, 'userLimit', 'userLevelSystemAtrak4', '0', 0),
       (216, 'userLimit', 'userLevelSystemAtrak5', '0', 0),
       (217, 'userLimit', 'userLevelSystemAta0', '0', 0),
       (218, 'userLimit', 'userLevelSystemAta1', '0', 0),
       (219, 'userLimit', 'userLevelSystemAta2', '0', 0),
       (220, 'userLimit', 'userLevelSystemAta3', '0', 0),
       (221, 'userLimit', 'userLevelSystemAta4', '0', 0),
       (222, 'userLimit', 'userLevelSystemAta5', '0', 0),
       (223, 'userLimit', 'userLevelSystemZagros0', '0', 0),
       (224, 'userLimit', 'userLevelSystemZagros1', '0', 0),
       (225, 'userLimit', 'userLevelSystemZagros2', '0', 0),
       (226, 'userLimit', 'userLevelSystemZagros3', '0', 0),
       (227, 'userLimit', 'userLevelSystemZagros4', '0', 0),
       (228, 'userLimit', 'userLevelSystemZagros5', '0', 0),
       (229, 'userLimit', 'userLevelSystemTaban0', '0', 0),
       (230, 'userLimit', 'userLevelSystemTaban1', '0', 0),
       (231, 'userLimit', 'userLevelSystemTaban2', '0', 0),
       (232, 'userLimit', 'userLevelSystemTaban3', '0', 0),
       (233, 'userLimit', 'userLevelSystemTaban4', '0', 0),
       (234, 'userLimit', 'userLevelSystemTaban5', '0', 0),
       (235, 'userLimit', 'userLevelSystemQeshmAir0', '0', 0),
       (236, 'userLimit', 'userLevelSystemQeshmAir1', '0', 0),
       (237, 'userLimit', 'userLevelSystemQeshmAir2', '0', 0),
       (238, 'userLimit', 'userLevelSystemQeshmAir3', '0', 0),
       (239, 'userLimit', 'userLevelSystemQeshmAir4', '0', 0),
       (240, 'userLimit', 'userLevelSystemQeshmAir5', '0', 0),
       (241, 'userLimit', 'userLevelSystemMeraj0', '0', 0),
       (242, 'userLimit', 'userLevelSystemMeraj1', '0', 0),
       (243, 'userLimit', 'userLevelSystemMeraj2', '0', 0),
       (244, 'userLimit', 'userLevelSystemMeraj3', '0', 0),
       (245, 'userLimit', 'userLevelSystemMeraj4', '0', 0),
       (246, 'userLimit', 'userLevelSystemMeraj5', '0', 0),
       (247, 'userLimit', 'userLevelSystemCaspian0', '0', 0),
       (248, 'userLimit', 'userLevelSystemCaspian1', '0', 0),
       (249, 'userLimit', 'userLevelSystemCaspian2', '0', 0),
       (250, 'userLimit', 'userLevelSystemCaspian3', '0', 0),
       (251, 'userLimit', 'userLevelSystemCaspian4', '0', 0),
       (252, 'userLimit', 'userLevelSystemCaspian5', '0', 0),
       (253, 'userLimit', 'userLevelSystemAirtour0', '0', 0),
       (254, 'userLimit', 'userLevelSystemAirtour1', '0', 0),
       (255, 'userLimit', 'userLevelSystemAirtour2', '0', 0),
       (256, 'userLimit', 'userLevelSystemAirtour3', '0', 0),
       (257, 'userLimit', 'userLevelSystemAirtour4', '0', 0),
       (258, 'userLimit', 'userLevelSystemAirtour5', '0', 0),
       (259, 'userLimit', 'userLevelSystemKishAir0', '0', 0),
       (260, 'userLimit', 'userLevelSystemKishAir1', '0', 0),
       (261, 'userLimit', 'userLevelSystemKishAir2', '0', 0),
       (262, 'userLimit', 'userLevelSystemKishAir3', '0', 0),
       (263, 'userLimit', 'userLevelSystemKishAir4', '0', 0),
       (264, 'userLimit', 'userLevelSystemKishAir5', '0', 0),
       (265, 'site', 'AppAndroid', '', 0),
       (266, 'site', 'AppIos', '', 0),
       (267, 'site', 'SocialTwitter', 'https://twitter.com/|||||||||||||||', 0),
       (268, 'site', 'SocialGoops', 'https://plus.google.com/+|||||||||||||||com', 0),
       (269, 'site', 'SocialFacebook', 'https://www.facebook.com/|||||||||||||||.tkt', 0),
       (270, 'site', 'SocialInstagram', 'https://www.instagram.com/|||||||||||||||/', 0),
       (271, 'form-contact', 'PageRules',
        '<p dir=\"RTL\" style=\"text-align:justify\"><span style=\"font-size:20px\"><strong>قوانین کنسلی و استرداد بلیط اتوبوس</strong></span></p>\n\n<p style=\"text-align:justify\"><strong><span style=\"font-size:14px\">شرایط استرداد اینترنتی بر طبق ضوابط خرید (که هنگام خرید تائید نموده&zwnj;اید) به&zwnj;قرار زیر می&zwnj;باشد:</span></strong></p>\n\n<p style=\"text-align:justify\"><strong><span style=\"font-size:14px\">استرداد اینترنتی تا 12 ساعت قبل از حرکت و با ارائه شماره کامل خرید انجام می&zwnj;گردد. استرداد در پایانه مبدأ در هر زمان قبل و بعد از حرکت و بر طبق ضوابط و با&nbsp;</span></strong><strong><span style=\"font-size:14px\">دریافت وجه امکان&zwnj;پذیر است مشروط به اینکه بلیط، قبلاً در سایت استرداد نشده باشد<span dir=\"LTR\">.</span></span></strong></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:20px\">نکات بسيار مهم رزرو هتل<span dir=\"LTR\">&nbsp;</span></span></strong></p>\n\n<p style=\"text-align:justify\"><strong><span style=\"font-size:16px\">قوانين کنسلي</span></strong></p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:16px\">کنسلي رزرو در ايام پيک و غير پيک<span dir=\"LTR\"> :</span></span></strong></p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">با توجه به اينکه نرخ کنسلي در ايام مختلف و هتل&zwnj;های مختلف متفاوت می&zwnj;باشد.مبلغ دقيق کنسلي، بعد از استعلام از هتل مشخص می&zwnj;گردد.</span></strong></p>\n\n<p dir=\"RTL\" style=\"text-align:justify\">&nbsp;</p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:20px\">نرخ مهمانان ايراني و خارجي<span dir=\"LTR\"> :</span></span></strong></p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><span style=\"font-size:14px\"><strong>نرخ&zwnj;های اعلام&zwnj;شده براي مهمانان ايراني می&zwnj;باشد و نرخ اتاق براي مهمانان عرب و خارجي متفاوت است<span dir=\"LTR\">.</span></strong></span></p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><span style=\"font-size:14px\"><strong>هزينه اقامت کوکان زير دو سال رايگان و هزينه اقامت کودکان بالاي دو سال، بر اساس قوانين هتل محاسبه می&zwnj;گردد<span dir=\"LTR\">.</span></strong></span></p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><span style=\"font-size:14px\"><strong>ساعت تحويل اتاق 14:00 می&zwnj;باشد<span dir=\"LTR\"> .</span></strong></span></p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><span style=\"font-size:14px\"><strong>ساعت تخليه اتاق 12:00 می&zwnj;باشد<span dir=\"LTR\"> .</span></strong></span></p>\n\n<p dir=\"RTL\" style=\"text-align:justify\">&nbsp;</p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:20px\">قوانین و حقوق مسافر در رزرو قطار</span></strong></p>\n\n<p style=\"text-align:justify\"><strong><span style=\"font-size:14px\">كليه&zwnj;ي بليت&zwnj;هاي استردادي، در ساعت 10 صبح روز قبل از حركت، مجدداً به سيستم برگشت و در مراكز فروش بليت شهر مبدأ و شهرهاي اطراف آن عرضه مي&zwnj;شود. </span></strong></p>\n\n<p style=\"text-align:justify\"><strong><span style=\"font-size:14px\">درصورتی&zwnj;که روز قبل از حركت ايام تعطيل باشد بليت آن روز در روز اداري قبل صادر می&zwnj;شود به&zwnj;عنوان&zwnj;مثال بليت روز شنبه روز پنجشنبه عرضه می&zwnj;شود)</span></strong></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><strong><span style=\"font-size:16px\">مفقودشدن بليت مسافر:</span></strong></p>\n\n<p style=\"text-align:justify\"><strong><span style=\"font-size:14px\">به&zwnj;شرط حضور به&zwnj;موقع (حداكثر 45 دقيقه مانده به حركت) در ايستگاه&zwnj;هاي راه&zwnj;آهن كه سيستم فروش بليت آنلاين دارند و در وقت اداري بليت&nbsp;المثني طبق آیین&zwnj;نامه مربوط صادر مي&zwnj;شود. بليت مفقودي بايد از طريق شبكه&zwnj;ي رایانه&zwnj;ای صادرشده و استرداد نشده باشد. صدور بليت المثني با 5 درصد قيمت كل&nbsp;بليت، انجام مي&zwnj;شود و در صورت مفقود شدن آن، بليت المثني ديگري صادر نخواهد شد. در حال حاضر، بليت المثني از طريق سيستم استرداد نمی&zwnj;شود. </span></strong></p>\n\n<p style=\"text-align:justify\"><strong><span style=\"font-size:14px\">(استردادبليت&nbsp;المثني فقط به&zwnj;شرط ارائه بليت اصلي و بليت المثني به&zwnj;صورت هم&zwnj;زمان در ایستگاه&zwnj;های آنلاين و كليه نمایندگی&zwnj;های فروش و با هماهنگي اداره برنامه&zwnj;ریزی وعمليات فروش انجام می&zwnj;شود) </span></strong></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><strong><span style=\"font-size:14px\">تأخير حركت قطار از مبدأ:</span></strong></p>\n\n<p style=\"text-align:justify\"><strong><span style=\"font-size:14px\">تأخير در شروع حركت قطارهايي كه مسافران آن از باجه كنترل بليت عبور و در سكو يا داخل قطارقرارگرفته&zwnj;اند جزو تأخير نهايي آن&zwnj;ها در مقصد محاسبه و مورد ملاك براي پرداخت خسارت قرار مي&zwnj;گيرد.</span></strong></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><strong><span style=\"font-size:16px\"><strong>تأخیر بیش&zwnj;ازحد مقرر قطار اكسپرس يا سريع در رسيدن به&nbsp;مقصد:</strong></span></strong></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><strong><strong>تأخير، ناشي از حوادث طبيعي نباشد. درصورتی&zwnj;که ورود قطار به ايستگاه مقصد بعد از گذشت وعده غذايي روزانه باشد يك وعده پذيرايي رايگان بر اساس&nbsp;</strong></strong><strong><strong>ساعت ورود قطار انجام مي&zwnj;شود. زمان پذيرايي صبحانه بعد از ساعت 8 صبح، ناهار بعد از ساعت 13 و شام بعد از ساعت 20 مي&zwnj;باشد. زمان موردمحاسبه براي</strong></strong><strong><strong>تأخير قطار در مسيرهاي مختلف متفاوت است.</strong></strong></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:20px\">شرایط خرید اینترنتی</span></strong></p>\n\n<ul>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">واردکردن اسامی صحیح مسافر مطابق با اطلاعات درج&zwnj;شده در کارت ملی یا گذرنامه</span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">عدم پذیرش در صورت عدم تطابق نام شخص واردشده در سیستم با کارت شناسایی</span></strong></li>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">صرفاً پرداخت وجه به&zwnj;منزله&zwnj;ی صدور نیست. بعد از پرداخت نهایی دریافت فایل<span dir=\"LTR\"> pdf </span>قطعی می&zwnj;باشد<span dir=\"LTR\">.</span></span></strong></li>\n    <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">طبق قوانین مسافران کمتر از 2سال نوزاد , بین 2 تا 12 سال کودک و بیش از 12سال بزرگ&zwnj;سال محسوب می&zwnj;شوند<span dir=\"LTR\">.</span></span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">هرگونه درخواست کنسلی از سمت مسافر شامل جریمه می&zwnj;باشد<span dir=\"LTR\"> .</span></span></strong></li>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">ابطال یا تأخیر بیش از 2ساعت پرواز شامل جریمه کنسلی نمی&zwnj;باشد. ارائه&zwnj;ی بلیط / رسید مهرشده توسط ایستگاه مبدأ، به&zwnj;منظور هرگونه پیگیری و استرداد بدون جریمه&zwnj; الزامی است<span dir=\"LTR\">.</span></span></strong></li>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">چک کردن قوانین کنسلی , مقدار بار و نوع هواپیما قبل از رزرو به عهده رزرو گیرنده می&zwnj;باشد<span dir=\"LTR\">.</span></span></strong></li>\n    <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">رعایت فاصله زمانی مناسب در صورت داشتن ادامه مسیر به عهده رزرو گیرنده است<span dir=\"LTR\">.</span></span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">همراه داشتن مجوز پزشکی برای خانم&zwnj;های باردار یا هرگونه بیماری که سبب منع سفر هوایی باشد<span dir=\"LTR\">.</span></span></strong></li>\n    <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">دقت به مبلغ گزینه انتخاب&zwnj;شده در هنگام رزرو و در هنگام پرداخت در درگاه بانک.</span></strong></li>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">همکاران آژانسی جهت برخورداری از کمیسیون، حتماً در سایت مربوطه ثبت&zwnj;نام نمایید<span dir=\"LTR\">.</span></span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">روش&zwnj;های پرداخت : مراجعه حضوری , انتقال وجه به کارت , پرداخت آنلاین تعبیه&zwnj;شده بر روی سایت.</span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">امکان صدور بلیت برای کودک بین 2 تا 12 سال به&zwnj;تنهایی امکان&zwnj;پذیر نیست<span dir=\"LTR\">.</span></span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">كليه عمليات خريد بليت در اين سايت، مشمول قوانين تجارت الكترونيك بوده و هرگونه تخلف پيگرد قانوني خواهد داشت<span dir=\"LTR\">.</span></span></strong></li>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">حداقل زمان حضور مسافر در فرودگاه برای پرواز داخلی 1 ساعت و برای پرواز خارجی 3ساعت است. برای قطار و اتوبوس نیز 1ساعت قبل از حرکت حضور در محل الزامی&nbsp; است<span dir=\"LTR\">.</span></span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">در صورت تمایل به رزرو ویلچر در پروازهای سیستمی، در هنگام رزرو درخواست خود را مطرح نمایید و در پروازهای چارتری با مراجعه 3الی4 ساعت قبل از پرواز با حضور در فرودگاه درخواست خود را ارائه دهید.</span></strong></li>\n</ul>\n\n<p dir=\"RTL\" style=\"text-align:justify\">&nbsp;</p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:20px\">کالاهای خطرناک</span></strong></p>\n\n<ul>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">شامل هر کالايي است که به جان انسان ,اموال ایشان يا به بدنه هواپيما آسيب برساند از قبیل<span dir=\"LTR\">:</span></span></strong></li>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">مواد منفجره و لوازم آتش&zwnj;بازی</span></strong></li>\n    <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">گازهاي تحت&zwnj;فشار ، آتش&zwnj;زا و غيره - لوازم سفري ( از قبيل گاز سفري<span dir=\"LTR\">(</span></span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">سيلندرهاي گاز تحت&zwnj;فشار و سوخت فندك</span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">گازهاي فوق سرد شده - نيتروژن مايع</span></strong></li>\n    <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">مايعات آتش&zwnj;زا- رنگ، تينر، محلول&zwnj;ها، آستون، انواع پاک&zwnj;کننده&zwnj;ها، آب&zwnj;بند، درزگير، رزین&zwnj;ها و چسب&zwnj;ها</span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">جامدات- مواد آتش&zwnj;زا و كبريت</span></strong></li>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">مواد اكسيدکننده و اکسيد شونده از قبیل سفیدکننده&zwnj;ها و پاک&zwnj;کننده&zwnj;ها</span></strong></li>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">مولدهاي اكسيژن شيميايي، باد کننده&zwnj;های کیسه&zwnj;های هوا، واحدهاي كيسه هوا</span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">دی&zwnj;اکسید کربن(يخ خشك)، اكسيژن مايع سرد شده</span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">لوازم اطفاي حريق</span></strong></li>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">چسب&zwnj;ها</span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">آلات صنعتي از قبيل فشارسنج، كليدهاي جیوه&zwnj;ای، لوازم يكسو كننده</span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">آرسنيك، سموم دفع آفات نباتي، گاز اشک&zwnj;آور</span></strong></li>\n    <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">هر نوع چراغ&zwnj;قوه</span></strong></li>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">مواد عفوني - مواد حامل ويروس و باكتري كه انسان و حيوان را تحت تأثیر قرار می&zwnj;دهند.</span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">مواد راديواكتيو- آلاتي كه داراي منبع راديواكتيو جهت تحقيقات ایزوتوپ&zwnj;های راديواكتيو می&zwnj;باشند.</span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">مواد سمي و مسموم</span></strong></li>\n</ul>\n\n<p dir=\"RTL\" style=\"text-align:justify\">&nbsp;</p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">توجه :&nbsp; کليه اقلام نامبرده می&zwnj;بایستی تنها با رعايت اصول باربري هوايي و در بسته&zwnj;بندی&zwnj;های خاص، حمل گردند<span dir=\"LTR\">.</span></span></strong></p>\n\n<p dir=\"RTL\" style=\"text-align:justify\">&nbsp;</p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:20px\">مسافران بیماری که نیاز به اخذ مجوز پزشکی ندارند</span></strong></p>\n\n<ul>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">جانبازان عزیز و معلولینی که نیازمند خدمات پزشکی خاص نیستند<span dir=\"LTR\">.</span></span></strong></li>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">افرادی که تحت اعمال جراحی ناباروری قرارگرفته&zwnj;اند پس از گذشت 24 ساعت از عمل<span dir=\"LTR\">.</span></span></strong></li>\n    <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">اعمال جراحی سطحی مرتبط با پوست و مو. ( جراحی بینی شامل آن نمی&zwnj;شود)</span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">اعمال جراحی اصلاح دید در مسافران کمتر از 40 سال.(جراحی لیزری قرنیه)</span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">موارد آتل گیری و گچ گیری اندام فوقانی(بازو و ساعد) و زیر زانو(پا و ساق پا) پس از 24 ساعت در پروازهای داخلی و 48 ساعت پس از گچ گیری در پروازهای خارجی به&zwnj;شرط نداشتن خونریزی<span dir=\"LTR\">.</span></span></strong></li>\n    <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">جراحی بینی بدون انسداد مجاری تنفسی و پانسمان داخلی بینی بدون خونریزی<span dir=\"LTR\">.</span></span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">مسافران دارای سوند ادراری که هیچ&zwnj;گونه اعمال جراحی شکمی در دو هفته اخیر نداشته&zwnj;اند</span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">افراد زیر 60 سال که دارای ضایعه نخاعی هستند اما نیازمند برانکارد و اکسیژن نیستند و قادر به استفاده از کمربند صندلی می&zwnj;باشند<span dir=\"LTR\"> .</span></span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">سوختگی&zwnj;های سطحی که ظاهر و بوی نامناسبی نداشته باشند<span dir=\"LTR\">.</span></span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">هرگونه عمل جراحی که از آن دو هفته گذشته باشد و فرد دارای حال عمومی مناسب بوده و بتواند روی صندلی بنشیند و کمربند صندلی خود را ببندد<span dir=\"LTR\">.</span></span></strong></li>\n</ul>\n\n<p dir=\"RTL\" style=\"text-align:justify\">&nbsp;</p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:20px\">بارداری</span></strong></p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">بارداری اول</span></strong></p>\n\n<ul>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">پروازهای کمتر از 2 ساعت: تا انتهای هفته 28 بارداری از سن بارداری و تخمین تاریخ زایمان نیاز به مجوز ندارد<span dir=\"LTR\">.</span></span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">پروازهای بیش از 2 ساعت: تا انتهای هفته 28 بارداری نیاز به مجوز ندارد</span></strong></li>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">نکته: در هر دو مورد مذکور ارائه مدرک پزشکی معتبر که ممهور به مهر نظام پزشکی پزشک متخصص زنان و زایمان باشد الزامی است<span dir=\"LTR\">.</span></span></strong></li>\n</ul>\n\n<p dir=\"RTL\" style=\"text-align:justify\">&nbsp;</p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">بارداری دوم به بعد</span></strong></p>\n\n<ul>\n <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">تا انتهای هفته 28 بارداری نیاز به مجوز ندارد . (ارائه مدرک پزشکی معتبر که ممهور به مهر نظام پزشکی پزشک متخصص زنان و زایمان باشد الزامی است)</span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">از ابتدای هفته 35 بارداری, پروازممنوع می&zwnj;باشد</span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">وجود هرگونه عارضه&zwnj;ای در دوران بارداری ( خونریزی، تهدید به سقط، فشارخون کنترل نشده) مانع پرواز می&zwnj;باشد<span dir=\"LTR\">.</span></span></strong></li>\n    <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">پس از گذشت یک هفته از زایمان پرواز منعی ندارد<span dir=\"LTR\">.</span></span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">نوزادان طبیعی پس از هفته اول تولد به&zwnj;شرط نداشتن عارضه پزشکی می&zwnj;توانند پرواز کنند<span dir=\"LTR\">.</span></span></strong></li>\n</ul>\n\n<p dir=\"RTL\" style=\"text-align:justify\">&nbsp;</p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:20px\">شرایط حمل مسافر و توشه همراه</span></strong></p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">شرایط قرارداد طبق پيمان ورشو : </span></strong></p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">يعني پيمان مربوط به يكنواخت نمودن پاره&zwnj;اي از مقررات حمل&zwnj;ونقل بين&zwnj;المللي هوايي كه در تاريخ 12 اكتبر 1929 در ورشو به امضا رسيده يا اصلاحيه پيمان مزبور كه در تاريخ 28 سپتامبر 1955 در لاهه انجام&zwnj;گرفته و هرکدام در موردي شمول خواهد يافت<span dir=\"LTR\">.</span></span></strong></p>\n\n<ul>\n    <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">حمل&zwnj;ونقلی كه طبق اين شرايط انجام گيرد تابع مقررات و محدودیت&zwnj;های مربوط به مسئوليت مقرر در پيمان ورشو خواهد بود. مگر اينكه چنين حمل&zwnj;ونقلی همان&zwnj;طور كه در پيمان مزبور تعریف&zwnj;شده از نوع حمل&zwnj;ونقل بین&zwnj;المللی نباشد<span dir=\"LTR\">.</span></span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">حمل&zwnj;ونقل فوق&zwnj;الذكر و انجام ساير خدماتي كه توسط هر حمل&zwnj;کننده&zwnj;ای انجام مي&zwnj;شود تا حدودي كه با مراتب فوق مغايرت نداشته باشد تابع شرايط زير خواهد بود: (1) شرايط مقرر در اين بليت (2) تعرفه&zwnj;هاي قابل انطباق (3) شرايط حمل مؤسسه حمل&zwnj;کننده و مقررات مربوط به آن، كه جزئي از اين قرارداد محسوب مي&zwnj;شود (و در دفاتر مؤسسه حمل&zwnj;کننده موجود و در صورت تقاضا در دسترس گذارده مي&zwnj;شود) به&zwnj;استثنای موارد حمل بين نقطه&zwnj;اي در كشورهاي ایالات&zwnj;متحده آمريكا يا كانادا و به هر نقطه&zwnj;اي خارج از كشورهاي مزبور كه تابع تعرفه&zwnj;هاي معتبر جاری، در آن كشورها مي&zwnj;باشد<span dir=\"LTR\">.</span></span></strong></li>\n    <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">نام حمل&zwnj;کننده را مي&zwnj;توان به&zwnj;اختصار در بليت درج نمود. نام كامل بايستي همراه با نام اختصاري در تعرفه&zwnj;ها، شرايط حمل ، مقررات يا برنامه پروازي قيد شود. نشاني حمل&zwnj;کننده فرودگاه مبدأ خواهد بود كه در مقابل اولين نام اختصاري حمل&zwnj;کننده در بليت درج مي&zwnj;شود. نقاط توقف موردتوافق به&zwnj;قرار مندرج در اين بليت يا به شرح مندرج در برنامه&zwnj;هاي پروازي در مسير حمل مسافر مي&zwnj;باشد. حملي كه به&zwnj;موجب اين شرايط به&zwnj;وسیله چندين حمل&zwnj;کننده متوالي صورت گيرد يك پرواز تلقي خواهد شد<span dir=\"LTR\">.</span></span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">هنگامی&zwnj;که يك مؤسسه حمل&zwnj;ونقل هوايي به&zwnj;منظور حمل روي خطوط پروازي مؤسسه حمل&zwnj;ونقل هوايي ديگري مبادرت به صدور بليت يا رسيد توزين توشه بنمايد اين عمل را صرفاً از جنبه نمايندگي انجام می&zwnj;دهد<span dir=\"LTR\">.</span></span></strong></li>\n    <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">هرگونه رد مسئوليت يا محدوديت در مسئوليت كه به حمل&zwnj;کننده تعلق گيرد شامل حال كارگزاران و كاركنان و نمايندگان حمل&zwnj;کننده و شامل هر شخصي كه هواپيماي وي از طرف حمل&zwnj;کننده براي حمل مورداستفاده شده و نيز شامل كارگزاران كاركنان نمايندگان شخص اخير خواهد بود<span dir=\"LTR\">.</span></span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">توشه حمل شده به&zwnj;موجب اين شرايط به ارائه&zwnj;دهنده رسيد توشه تحويل مي&zwnj;شود. چنانچه به توشه خسارتي واردشده باشد ، شكايت كتبي بايد فوراً پس از كشف خسارت و منتهي ظرف 7 روز پس از دريافت آن و در صورت تأخیر شكايت كتبي بايد ظرف 21 روز از تاريخ تحويل توشه به حمل&zwnj;کننده تسليم گردد. در مورد حمل&zwnj;ونقل غير بين&zwnj;المللي به تعرفه&zwnj;ها يا شرايط حمل رجوع شود<span dir=\"LTR\"> .</span></span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">اين بليت به مدت یک سال از تاريخ صدور اعتبار دارد. مگر اينكه ترتيب ديگري در اين بليت ، در تعرفه&zwnj;هاي حمل&zwnj;کننده ، در شرايط حمل يا در مقررات مربوطه پیش&zwnj;بینی&zwnj;شده باشد. كرايه حمل طبق اين شرايط تا قبل از آغاز حمل قابل&zwnj;تغییر است. حمل&zwnj;کننده مي&zwnj;تواند درصورتی&zwnj;که كرايه مقرر پرداخت&zwnj;نشده باشد از حمل خودداري نمايد<span dir=\"LTR\">.</span></span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">حمل&zwnj;کننده تعهد مي&zwnj;نمايد حداكثر كوشش خود را در حمل مسافر و توشه وي در حدود امكان به عمل آورد. اوقات مندرج در برنامه&zwnj;هاي پرواز يا هر جاي ديگر، تضمين نمي&zwnj;شود و جزئي از اين قرارداد بشمار نمي&zwnj;رود. حمل&zwnj;کننده مي&zwnj;تواند بدون اخطار در تبديل و تعويض حمل&zwnj;کنندگان يا هواپيما اقدام ، و در صورت لزوم نقاط توقف مندرج در اين بليت را تغيير دهد يا حذف نمايد. برنامه&zwnj;هاي پرواز بدون اطلاع قبلي قابل&zwnj;تغییر مي&zwnj;باشد. حمل&zwnj;کننده هیچ&zwnj;گونه مسئوليتي در برقرار سازی ارتباط به عهده نمي&zwnj;گيرد<span dir=\"LTR\">.</span></span></strong></li>\n  <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">مسافر موظف به رعايت مقررات دولتي مربوط به مسافرت بوده و بايد كليه اسناد خروج و ورود ، و ساير مدارك لازم را ارائه نمايد و در رأس ساعتي كه از طرف حمل&zwnj;کننده مقرر گرديده و چنانچه وقتي تعيين نشده باشد با رعايت دقت كافي براي انجام تشريفات پرواز در فرودگاه حضور يابد<span dir=\"LTR\">.</span></span></strong></li>\n   <li dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:14px\">هيچ كارگزار ، مستخدم يا نماينده حمل&zwnj;کننده اجازه تغيير ، اصلاح يا صرف&zwnj;نظر كردن از هیچ&zwnj;یک از مفاد اين قرارداد را ندارد<span dir=\"LTR\">.</span></span></strong></li>\n</ul>\n\n<p dir=\"RTL\" style=\"text-align:justify\">&nbsp;</p>\n\n<p dir=\"RTL\" style=\"text-align:justify\"><strong><span style=\"font-size:20px\">حق بازرسی</span></strong></p>\n\n<p style=\"text-align:justify\"><strong><span style=\"font-size:14px\">به دلایل امنیتی و ایمنی، امکان اسکن و بازرسی و<span dir=\"LTR\"> X-RAY </span>جامه&zwnj;دان شما وجود دارد . در صورت عدم حضور شما جامه&zwnj;دان شما در غیاب شما و به&zwnj;منظور اطمینان از عدم وجود موارد مذکور ممنوعه، بازرسی می&zwnj;گردد، زیرا این&zwnj;گونه وسایل را تحویل نداده&zwnj;اید. در صورت عدم رضایت و توافق شما جهت انجام چنین موضوعی، از حمل شما و جامه&zwnj;دان شما اجتناب می&zwnj;نماید. در مواقعی که بازرسی، اسکن و یا<span dir=\"LTR\">X-RAY </span>باعث آسیب و خسارت به شما و یا جامه&zwnj;دان شما شود، مسئولیتی متوجه ما نیست مگر مواردی که قصور و غفلت از جانب شرکت هواپیمایی انجام&zwnj;گرفته باشد<span dir=\"LTR\"> .</span></span></strong></p>\n\n<p dir=\"RTL\">&nbsp;</p>\n',
        0),
       (272, 'site', 'SloganNameSite',
        'خرید اینترنتی بلیط هواپیما ، بلیط قطار ، بلیط اتوبوس و رزرو هتل خرید بلیط چارترارزان قیمت', 0),
       (273, 'site', 'ColorTemplate', '#0574b9,#ff8c00,#ffffff,#303030,#e9ecf3,', 0),
       (274, 'site', 'SocialYoutube', '', 0),
       (275, 'site', 'SocialAparat', 'http://www.aparat.com/|||||||||||||||', 0),
       (276, 'site', 'SiteFavicon', '', 0),
       (277, 'site', 'SocialLinkedIn', 'https://www.linkedin.com/company/|||||||||||||||', 0),
       (278, 'site', 'headerOFCss', '', 0),
       (279, 'site', 'RedirectWebSiteName3', '', 0),
       (290, 'module', 'parvaz_dakheli', '0', 1),
       (291, 'module', 'parvaz_khareji', '0', 1),
       (292, 'module', 'hotel_dakheli', '0', 1),
       (293, 'module', 'hotel_khareji', '0', 1),
       (294, 'module', 'ghatar_raja', '0', 0),
       (295, 'module', 'ghatar_fadak', '0', 1),
       (296, 'module', 'ghatar_safir', '0', 0),
       (297, 'module', 'bus', '0', 1),
       (298, 'module', 'blog', '0', 1),
       (299, 'flights', 'charterpriceOff', '0', 0),
       (300, 'userLimit', 'userLevelMarckupCharter', '0', 0),
       (301, 'form-contact', 'PageRulesEsterdad', '0', 0),
       (302, 'telegrambot', 'telegrambotcode', '0', 0),
       (303, 'telegrambot', 'telegrambotid', '0', 0),
       (304, 'telegrambot', 'Talertforerror', '0', 0),
       (305, 'form-contact', 'Hsupportcharter', '0', 0),
       (306, 'site', 'Temp1001', '0', 0),
       (307, 'site', 'Temp1002', '0', 0),
       (308, 'site', 'metawordflightD', ' ', '0'),
       (309, 'site', 'metadescribeflightD', ' ', '0'),
       (310, 'site', 'metawordflightI', ' ', '0'),
       (311, 'site', 'metadescribeflightI', ' ', '0'),
       (312, 'site', 'metawordtrain', ' ', '0'),
       (313, 'site', 'metadescribetrain', ' ', '0'),
       (314, 'site', 'metawordhotel', ' ', '0'),
       (315, 'site', 'metadescribehotel', ' ', '0'),
       (316, 'site', 'metawordbus', ' ', '0'),
       (317, 'site', 'metadescribebus', ' ', '0'),
       (318, 'site', 'metawordtour', ' ', '0'),
       (319, 'site', 'metadescribetour', ' ', '0'),
       (320, 'site', 'RedirectWebSiteBlog', '', '0'),
       (321, 'site', 'Multilanguage', '0', '0'),
       (322, 'site', 'Languagesname', '', '0'),
       (323, 'site', 'Pricedinar', '', '0'),
       (324, 'site', 'Pricedollar', '', '0'),
       (325, 'site', 'Showheaderfactor', '', '0'),
       (326, 'site', 'metatitleflightD', '', '0'),
       (327, 'site', 'metatitleflightI', '', '0'),
       (328, 'site', 'metatitletrain', '', '0'),
       (329, 'site', 'metatitlehotel', '', '0'),
       (330, 'site', 'metatitletour', '', '0'),
       (331, 'site', 'metatitlebus', '', '0'),
       (332, 'site', 'HsupportHotel', '', '0'),
       (333, 'train', 'trainonline', '0', '0'),
       (334, 'userLimit', 'selecttypeprice', '0', '0'),
       (335, 'site', 'Showshomareshaba', '', '0'),
       (336, 'site', 'refundmoneyauto', '1', '0'),
       (337, 'site', 'nomarkup', '', '0'),
       (338, 'site', 'noshowfailed', '', '0'),
       (339, 'site', 'refundcharter', '', '0'),
       (340, 'module', 'tour', '0', 1),
       (341, 'site', 'tour_ext_supp_mob', '', 0),
       (342, 'site', 'tour_dom_supp_mob', '', 0),
       (343, 'site', 'tour_day_supp_mob', '', 0),
       (344, 'site', 'tour_logo_background', 'teal', 0),
       (345, 'site', 'tour_day_supp', '', 0),
       (346, 'site', 'tour_dom_supp', '', 0),
       (347, 'site', 'tour_ext_supp', '', 0),
       (348, 'site', 'tour_management', '1', 0),
       (349, 'site', 'brb', '1', 0),
       (352, 'buyhand', 'state_contract', ' ', 0),
       (353, 'buyhand', 'manage_contract', ' ', 0),
       (354, 'buyhand', 'daftar_contract', ' ', 0),
       (355, 'buyhand', 'mojavez_contract', ' ', 0),
       (356, 'buyhand', 'phon_contract', ' ', 0),
       (357, 'userLimit', 'webservice', '0', '1'),
       (358, 'simcharge', 'gift_enable', '0', '0'),
       (359, 'simcharge', 'gift_value', '10000', '0'),
       (360, 'site', 'showMasir', '1', '0'),
       (361, 'flights', 'segmentcounter', '0,0', 0),
       (362, 'site', 'apkversion', '1', '0'),
       (363, 'site', 'iosversion', '1.0', '0'),
       (364, 'site', 'showAirline', '1', '0'),
       (365, 'site', 'showApp', '1', '0'),
       (366, 'site', 'showcharterprice', '1', '0'),
       (367, 'site', 'tour_from', 'allOrigins', '0'),
       (368, 'site', 'tour_to', 'allDestinations', '0'),
       (369, 'site', 'tour_date', 'allDates', '0'),
       (370, 'site', 'tour_kind', 'allTour', '0'),
       (371, 'site', 'noshownumber', '0', '0'),
       (372, 'bankPin', 'BankIrankish', '', 0),
       (373, 'bankPin', 'bankIrankishActive', '0', 0),
       (374, 'internationalhotel', 'priceMarkupInternationalHotel', '60000', 0),
       (375, 'internationalhotel', 'priceDiscountInternationalHotel', '0', 0),
       (376, 'internationalhotel', 'HotelinterIsOff', '0', 0),
       (377, 'site', 'showsystemcharter', '1', 1),
       (378, 'site', 'taeidhesabdari', '1', 1),
       (379, 'site', 'autovarizi', '1', 1),
       (380, 'form-contact', 'managerPhone', '', 1),
       (381, 'international', 'searchcounter', '0', 1),
       (382, 'international', 'tasviesearchcounter', '2018-08-01', 1),
       (383, 'site', 'TextLoader', 'حامی همراه شماست', 1),
       (384, 'international', 'internationalservice', 'parto', 1),
       (385, 'site', 'Adverfactor', '', 1),
       (386, 'ios', 'iosVersionLink', '', 0),
       (387, 'international', 'twostepsearch', '1', 1),
       (388, 'directLink', 'directLinkApp', '', 1),
       (389, 'directLink', 'directLinkBazar', '', 1),
       (390, 'directLink', 'directLinkGooglePlay', '', 1),
       (391, 'directLink', 'directLinkSibApp', '', 1),
       (392, 'directLink', 'directLinkShow', '0', 1),
       (393, 'site', 'metadescribehotelINT', '', 1),
       (394, 'bankPin', 'BankPasargad', '', 0),
       (395, 'bankPin', 'bankPasargadActive', '0', 0),
       (396, 'site', 'tourFastAccess', '1', 0),
       (397, 'site', 'internationalHotelFastAccess', '1', 0),
       (398, 'site', 'internationalFlightCaptcha', '1', 0),
       (399, 'site', 'notificationPicture', '', 0),
       (400, 'site', 'notificationTitle', '', 0),
       (401, 'site', 'notificationText', '', 0),
       (402, 'site', 'notificationLink', '', 0),
       (403, 'site', 'notification', '0', 0),
       (404, 'site', 'tour2', '0', 0),
       (405, 'site', 'internalFlightSupportMobile', '', 0),
       (406, 'site', 'externalFlightSupportMobile', '', 0),
       (407, 'site', 'trainSupportMobile', '', 0),
       (408, 'site', 'busSupportMobile', '', 0),
       (409, 'site', 'internalTourSupportMobile', '', 0),
       (410, 'site', 'externalTourSupportMobile', '', 0),
       (411, 'site', 'internalHotelSupportMobile', '', 0),
       (412, 'site', 'externalHotelSupportMobile', '', 0),
       (413, 'site', 'visaSupportMobile', '', 0),
       (414, 'site', 'internalFlightSupportPhone', '', 0),
       (415, 'site', 'externalFlightSupportPhone', '', 0),
       (416, 'site', 'trainSupportPhone', '', 0),
       (417, 'site', 'busSupportPhone', '', 0),
       (418, 'site', 'internalTourSupportPhone', '', 0),
       (419, 'site', 'externalTourSupportPhone', '', 0),
       (420, 'site', 'internalHotelSupportPhone', '', 0),
       (421, 'site', 'externalHotelSupportPhone', '', 0),
       (422, 'site', 'visaSupportPhone', '', 0),
       (423, 'site', 'internalFlightSupportTelegramId', '', 0),
       (424, 'site', 'externalFlightSupportTelegramId', '', 0),
       (425, 'site', 'trainSupportTelegramId', '', 0),
       (426, 'site', 'busSupportTelegramId', '', 0),
       (427, 'site', 'internalTourSupportTelegramId', '', 0),
       (428, 'site', 'externalTourSupportTelegramId', '', 0),
       (429, 'site', 'internalHotelSupportTelegramId', '', 0),
       (430, 'site', 'externalHotelSupportTelegramId', '', 0),
       (431, 'site', 'visaSupportTelegramId', '', 0),
       (432, 'module', 'insurance', '0', 1),
       (433, 'site', 'priceMarkupInsurance', '0', 1),
       (434, 'site', 'charge', '0', 1),
       (435, 'blog', 'articleShow', '1', 1),
       (436, 'blog', 'newsShow', '1', 1),
       (437, 'blog', 'visaShow', '1', 1),
       (438, 'blog', 'travelGuideShow', '1', 1),
       (439, 'blog', 'tourInternalShow', '1', 1),
       (440, 'blog', 'tourExternalShow', '1', 1),
       (441, 'blog', 'tourismInternalShow', '1', 1),
       (442, 'blog', 'tourismExternalShow', '1', 1),
       (443, 'site', 'pdfsms', '0', 1),
       (444, 'site', 'pdfsmstext', '1', 1),
       (445, 'site', 'customerclub_active', '0', 1),
       (446, 'site', 'customerclub_flight', '0', 1),
       (447, 'site', 'customerclub_international', '0', 1),
       (448, 'site', 'customerclub_train', '0', 1),
       (449, 'site', 'customerclub_bus', '0', 1),
       (450, 'site', 'customerclub_hotel', '0', 1),
       (451, 'site', 'customerclub_internationalhotel', '0', 1),
       (452, 'site', 'customerclub_tour', '0', 1),
       (453, 'site', 'customerclub_insurance', '0', 1),
       (454, 'site', 'metatitletour2', '', 1),
       (455, 'site', 'metadescribetour2', '', 1),
       (456, 'site', 'metawordtour2', '', 1),
       (457, 'site', 'metatitletourDomestic', '', 1),
       (458, 'site', 'metadescribetourDomestic', '', 1),
       (459, 'site', 'metawordtourDomestic', '', 1),
       (460, 'site', 'tourDomestic', '0', 1),
       (461, 'site', 'priceDiscountFlight', '0', 1),
       (462, 'site', 'priceDiscountFlightMobile', '0', 1),
       (463, 'site', 'priceDiscountFlightIos', '0', 1),
       (464, 'site', 'managerSheba', '', 1),
       (465, 'site', 'managerShebaName', '', 1),
       (466, 'site', 'IOSServerKey', '', 1),
       (467, 'site', 'androidServerKey', '', 1),
       (468, 'site', 'fcmNotify', 0, 1),
       (469, 'site', 'displayLikeInAllLandPages', 1, 1),
       (470, 'site', 'smsToAdminAfterBusTicket10Min', 0, 1),
       (471, 'site', 'smsToAdminAfterTicketMobile', '', 1),
       (472, 'site', 'activeRefundAdmin', '', 1),
       (473, 'bankPin', 'BankSadad', '', 0),
       (474, 'site', 'bankSadadActive', '', 0),
       (475, 'site', 'BaseBankSadad', '', 0),
       (476, 'site', 'shortLinkActive', 1, 0),
       (477, 'site', 'webPushNotificationScript', '', 0),
       (478, 'site', 'tourDomesticAdminMobile', '', 0),
       (479, 'site', 'tourDomesticBuyUser', '', 0),
       (480, 'site', 'tourDomesticBuyPass', '', 0),
       (481, 'site', 'twoStepLogin', '1', 0),
       (482, 'site', 'tourPackageSupportMobile', '', 0),
       (483, 'site', 'tourPackageSupportPhone', '', 0),
       (484, 'site', 'tourPackageSupportTelegramId', '', 0),
       (485, 'site', 'tourDomesticSupportMobile', '', 0),
       (486, 'site', 'tourDomesticSupportPhone', '', 0),
       (487, 'site', 'tourDomesticSupportTelegramId', '', 0),
       (488, 'site', 'insuranceSupportMobile', '', 0),
       (489, 'site', 'insuranceSupportPhone', '', 0),
       (490, 'site', 'insuranceSupportTelegramId', '', 0),
       (491, 'site', 'defaultFrom', 'THR', 0),
       (492, 'site', 'defaultTo', 'MHD', 0),
       (493, 'site', 'buswebservice', 'payaneh', 1),
       (494, 'site', 'internationalHotelApiType', 'parto', 0), /*ba taeid mohandes nadafi parto shod*/
       (495, 'userLimit', 'userLevelInternationalTrain0', '0', 0),
       (496, 'userLimit', 'userLevelInternationalTrain1', '0', 0),
       (497, 'userLimit', 'userLevelInternationalTrain2', '0', 0),
       (498, 'userLimit', 'userLevelInternationalTrain3', '0', 0),
       (499, 'userLimit', 'userLevelInternationalTrain4', '0', 0),
       (500, 'userLimit', 'userLevelInternationalTrain5', '0', 0),
       (501, 'internationaltrain', 'priceDiscountInternationalTrain', '0', 0),
       (502, 'internationaltrain', 'priceMarkupInternationalTrain', '0', 0),
       (503, 'module', 'internationaltrain', '0', 1),
       (504, 'internationaltrain', 'internationaltrainservice', 'parto', 0),
       (505, 'site', 'metatitleInternationalTrain', '', 0),
       (506, 'site', 'metadescribeInternationalTrain', '', 0),
       (507, 'site', 'metawordInternationalTrain', '', 0),
       (508, 'site', 'webApplicationLogo52_52', '', 0),
       (509, 'site', 'webApplicationLogo76_76', '', 0),
       (510, 'site', 'webApplicationLogo120_120', '', 0),
       (511, 'site', 'webApplicationLogo152_152', '', 0),
       (512, 'site', 'webApplicationLogo167_167', '', 0),
       (513, 'site', 'showhami', '1', 0),
       (514, 'site', 'smsnumber', '500010009323176', 0),
       (515, 'userLimit', 'userLevelSystemVaresh0', '0', 0),
       (516, 'userLimit', 'userLevelSystemVaresh1', '0', 0),
       (517, 'userLimit', 'userLevelSystemVaresh2', '0', 0),
       (518, 'userLimit', 'userLevelSystemVaresh3', '0', 0),
       (519, 'userLimit', 'userLevelSystemVaresh4', '0', 0),
       (520, 'userLimit', 'userLevelSystemVaresh5', '0', 0),
       (521, 'site', 'cooperation_percent', '0', 0),
       (522, 'site', 'multiCurrency', '0', 0),
       (523, 'site', 'allCurrency', 'IRR-USD-IQD', 0),
       (524, 'site', 'USD_Currency', '150000', 0),
       (525, 'site', 'IQD_Currency', '12500', 0),
       (526, 'site', 'backgroundColorMobile', '#959595', 1),
       (527, 'userLimit', 'userLevelSystemSaha0', '0', 1),
       (528, 'userLimit', 'userLevelSystemSaha1', '0', 1),
       (529, 'userLimit', 'userLevelSystemSaha2', '0', 1),
       (530, 'userLimit', 'userLevelSystemSaha3', '0', 1),
       (531, 'userLimit', 'userLevelSystemSaha4', '0', 1),
       (532, 'userLimit', 'userLevelSystemSaha5', '0', 1),
       (533, 'site', 'active_sercvice', 'internalFlight', 1),
       (534, 'adminVer', 'secretCodeTime', '', 0),
       (535, 'adminVer', 'secretCode', '', 0),
       (536, 'site', 'hotelhamiSendSMSToAdmin', '0', 0),
       (537, 'site', 'hotelhamiAdminPhone', '', 0),
       (538, 'site', 'CRMActive', '1', 0),
       (539, 'site', 'serviceBlog', '1', 1),
       (540, 'bankPin', 'dargaheshteraki', '0', 1),
       (541, 'site', 'getUserCellphoneHotel', '0', 0),
       (542, 'simcharge', 'gift_value_gold', '10000', 0),
       (543, 'simcharge', 'gift_value_silver', '10000', 0),
       (544, 'simcharge', 'gift_value_bronze', '10000', 0),
       (545, 'site', 'landingFlight', '', '0'),
       (546, 'site', 'landingInternationalFlight', '', '0'),
       (547, 'site', 'landingTrain', '', '0'),
       (548, 'site', 'landingInternationalTrain', '', '0'),
       (549, 'site', 'landingBus', '', '0'),
       (550, 'site', 'landingHotel', '', '0'),
       (551, 'site', 'landingInternationalHotel', '', '0'),
       (552, 'site', 'landingToor', '', '0'),
       (553, 'site', 'landingTourDomestic', '', '0'),
       (554, 'site', 'landingInternationalTour', '', '0'),
       (555, 'site', 'landingTour', '', '0'),
       (556, 'site', 'landingInsurance', '', '0'),
       (557, 'site', 'landingChargeMobile', '', '0'),
       (558, 'site', 'level2segmentcount', '', '0'),
       (559, 'site', 'internalFlightSupportWhatsAppId', '', '0'),
       (560, 'site', 'internalFlightSupportEmail', '', '0'),
       (561, 'site', 'externalFlightSupportWhatsAppId', '', '0'),
       (562, 'site', 'externalFlightSupportEmail', '', '0'),
       (563, 'site', 'trainSupportWhatsAppId', '', '0'),
       (564, 'site', 'trainSupportEmail', '', '0'),
       (565, 'site', 'busSupportWhatsAppId', '', '0'),
       (566, 'site', 'busSupportEmail', '', '0'),
       (567, 'site', 'internalTourSupportWhatsAppId', '', '0'),
       (568, 'site', 'internalTourSupportEmail', '', '0'),
       (569, 'site', 'externalTourSupportWhatsAppId', '', '0'),
       (570, 'site', 'externalTourSupportEmail', '', '0'),
       (571, 'site', 'internalHotelSupportWhatsAppId', '', '0'),
       (572, 'site', 'internalHotelSupportEmail', '', '0'),
       (573, 'site', 'externalHotelSupportWhatsAppId', '', '0'),
       (574, 'site', 'externalHotelSupportEmail', '', '0'),
       (575, 'site', 'visaSupportWhatsAppId', '', '0'),
       (576, 'site', 'visaSupportEmail', '', '0'),
       (577, 'site', 'insuranceSupportWhatsAppId', '', '0'),
       (578, 'site', 'insuranceSupportEmail', '', '0'),
       (579, 'payments', 'melat_count', '0', '0'),
       (580, 'payments', 'saman_count', '0', '0'),
       (581, 'payments', 'parsian_count', '0', '0'),
       (582, 'payments', 'pasargad_count', '0', '0'),
       (583, 'payments', 'irankish_count', '0', '0'),
       (584, 'payments', 'sadad_count', '0', '0'),
       (585, 'payments', 'samanDargahSetting',
        '{\"UserName\":\"\",\"Password\":\"\",\"RepRelationKey\":\"\",\"CustomerKey\":\"\",\"RepWebserviceKey\":\"\"}',
        '0'),
       (586, 'payments', 'melatDargahSetting', '{\"UserName\":\"\",\"Password\":\"\",\"Iban\":\"\"}', '0'),
       (587, 'payments', 'gardeshgariBankWebserviceSetting',
        '[{\"UserName\":\"\",\"DepositNumber\":\"\",\"Sheba\":\"\"},{\"UserName\":\"\",\"DepositNumber\":\"\",\"Sheba\":\"\"},{\"UserName\":\"\",\"DepositNumber\":\"\",\"Sheba\":\"\"},{\"UserName\":\"\",\"DepositNumber\":\"\",\"Sheba\":\"\"},{\"UserName\":\"\",\"DepositNumber\":\"\",\"Sheba\":\"\"},{\"UserName\":\"\",\"DepositNumber\":\"\",\"Sheba\":\"\"},{\"UserName\":\"\",\"DepositNumber\":\"\",\"Sheba\":\"\"},{\"UserName\":\"\",\"DepositNumber\":\"\",\"Sheba\":\"\"},{\"UserName\":\"\",\"DepositNumber\":\"\",\"Sheba\":\"\"},{\"UserName\":\"\",\"DepositNumber\":\"\",\"Sheba\":\"\"}]',
        '0'),
       (588, 'site', 'showLeavingCountyLink', '1', '1'),
       (589, 'site', 'metatitleflightRtrip', '', '1'),
       (590, 'site', 'metawordflightRtrip', '', '1'),
       (591, 'site', 'metadescribeflightRtrip', '', '1'),
       (592, 'site', 'limitHamiAmount', '10000000,2019-01-09', '1'),
       (593, 'site', 'activeLimitHamiAmount', '0', '0'),
       (594, 'module', 'tourDomesticAdminActive', '0', 1),
       (595, 'module', 'tour2AdminActive', '0', 1),
       (596, 'site', 'internationaltour', '0', '0'),
       (597, 'module', 'internationalTourAdminActive', '0', 1),
       (598, 'site', 'tour_day_supp_admin_id', '', '0'),
       (599, 'site', 'tour_dom_supp_admin_id', '', '0'),
       (600, 'site', 'tour_ext_supp_admin_id', '', '0'),
       (601, 'site', 'tour2_day_supp', '', '0'),
       (602, 'site', 'tour2_day_supp_mob', '', '0'),
       (603, 'site', 'tour2_day_supp_admin_id', '', '0'),
       (604, 'site', 'tour2_dom_supp', '', '0'),
       (605, 'site', 'tour2_dom_supp_mob', '', '0'),
       (606, 'site', 'tour2_dom_supp_admin_id', '', '0'),
       (607, 'site', 'tour2_ext_supp', '', '0'),
       (608, 'site', 'tour2_ext_supp_mob', '', '0'),
       (609, 'site', 'tour2_ext_supp_admin_id', '', '0'),
       (610, 'site', 'hamiTicket_sms', '0', '0'),
       (611, 'site', 'esterdadProvider', '0', '0'),
       (612, 'module', 'AutomationActive', '0', 1),
       (613, 'module', 'SeoActive', '0', 1),
       (614, 'module', 'hesabdariActive', '0', 1),
       (615, 'module', 'trainActive', '0', 1),
       (616, 'module', 'esterdadActive', '0', 1),
       (617, 'module', 'paymentsActive', '0', 1),
       (618, 'module', 'customerActive', '0', 1),
       (619, 'module', 'personnelActive', '0', 1),
       (620, 'module', 'brbActive', '0', 1),
       (621, 'module', 'siteActive', '0', 1),
       (622, 'module', 'miscelaneousActive', '0', 1),
       (623, 'module', 'chargeActive', '0', 1),
       (624, 'seo', 'meta_desc_register', '', 1),
       (625, 'seo', 'meta_word_register', '', 1),
       (626, 'seo', 'meta_title_register', '', 1),
       (627, 'seo', 'meta_desc_login', '', 1),
       (628, 'seo', 'meta_word_login', '', 1),
       (629, 'seo', 'meta_title_login', '', 1),
       (630, 'seo', 'meta_desc_rules', '', 1),
       (631, 'seo', 'meta_word_rules', '', 1),
       (632, 'seo', 'meta_title_rules', '', 1),
       (633, 'seo', 'meta_desc_jobs', '', 1),
       (634, 'seo', 'meta_word_jobs', '', 1),
       (635, 'seo', 'meta_title_jobs', '', 1),
       (636, 'seo', 'meta_desc_follow', '', 1),
       (637, 'seo', 'meta_word_follow', '', 1),
       (638, 'seo', 'meta_title_follow', '', 1),
       (639, 'seo', 'meta_desc_tips', '', 1),
       (640, 'seo', 'meta_word_tips', '', 1),
       (641, 'seo', 'meta_title_tips', '', 1),
       (642, 'seo', 'meta_desc_aboutus', '', 1),
       (643, 'seo', 'meta_word_aboutus', '', 1),
       (644, 'seo', 'meta_title_aboutus', '', 1),
       (645, 'seo', 'meta_desc_contact', '', 1),
       (646, 'seo', 'meta_word_contact', '', 1),
       (647, 'seo', 'meta_title_contact', '', 1),
       (648, 'seo', 'meta_desc_call', '', 1),
       (649, 'seo', 'meta_word_call', '', 1),
       (650, 'seo', 'meta_title_call', '', 1),
       (651, 'module', 'flightRtrip', '0', 1),
       (652, 'flights', 'priceMarkupCharterType', '0', 1),
       (653, 'flights', 'safarMarketDiscountLimit', '5', 1),
       (654, 'provider', 'ProvidersTypeTrain', '', 1),
       (655, 'provider', 'ProvidersTypeOther', '', 1),
       (656, 'site', 'landingvisa', '', '1'),
       (657, 'module', 'performanceActive', '0', 1),
       (658, 'module', 'vacationActive', '0', 1),
       (659, 'userLimit', 'userLevelSystemSepehran0', '0', 0),
       (660, 'userLimit', 'userLevelSystemSepehran1', '0', 0),
       (661, 'userLimit', 'userLevelSystemSepehran2', '0', 0),
       (662, 'userLimit', 'userLevelSystemSepehran3', '0', 0),
       (663, 'userLimit', 'userLevelSystemSepehran4', '0', 0),
       (664, 'userLimit', 'userLevelSystemSepehran5', '0', 0),
       (665, 'payments', 'sinaBankWebserviceSetting', '', 1),
       (666, 'provider', 'ProvidersTypeEnteghalBank', '', 1),
       (667, 'cron', 'limitOffset', '0', '0'),
       (668, 'site', 'hamiTafzil', '', '1'),
       (669, 'module', 'tourismActive', '0', 1),
       (670, 'tourism', 'priceMarkupTourism', '0', 1),
       (671, 'site', 'urlImageTourism', 'basefile/respina24/tourism/', 1),
       (672, 'site', 'urlImageShop', 'basefile/respina24/shop/', 1),
       (673, 'userLimit', 'userLevelSystemParsAir0', '0', 0),
       (674, 'userLimit', 'userLevelSystemParsAir1', '0', 0),
       (675, 'userLimit', 'userLevelSystemParsAir2', '0', 0),
       (676, 'userLimit', 'userLevelSystemParsAir3', '0', 0),
       (677, 'userLimit', 'userLevelSystemParsAir4', '0', 0),
       (678, 'userLimit', 'userLevelSystemParsAir5', '0', 0),
       (679, 'site', 'trainPreSaleTime', '0', 0),
       (680, 'site', 'trainPreSaleNumber', '0', 0),
       (681, 'seo', 'landing_text_app_download', '', 1),
       (682, 'seo', 'landing_text_rules_flight', '', 1),
       (683, 'seo', 'landing_text_rules_flight_int', '', 1),
       (684, 'seo', 'landing_text_rules_train', '', 1),
       (685, 'seo', 'landing_text_rules_bus', '', 1),
       (686, 'seo', 'landing_text_rules_hotel', '', 1),
       (687, 'site', 'showForeignPassengerTrain', '0', 1),
       (688, 'module', 'callRequestActive', '0', 0),
       (689, 'site', 'paymentLinkSMS', '1', 0),
       (690, 'module', 'howMuchBuyActive', '1', 0),
       (691, 'site', 'shebaPage', '1', 0),
       (692, 'site', 'userTourTravel', '', 0),
       (693, 'site', 'robots', '', 0),
       (694, 'hotel', 'priceDiscountHotel', '0', 1),
       (695, 'hotel', 'priceDiscountHotelMobile', '0', 1),
       (696, 'hotel', 'priceDiscountHotelIos', '0', 1),
       (697, 'seo', 'meta_title_flight_information', '', '1'),
       (698, 'seo', 'meta_word_flight_information', '', '1'),
       (699, 'seo', 'meta_desc_flight_information', '', '1'),
       (700, 'seo', 'meta_h1_flight_information', '', '1'),
       (701, 'seo', 'meta_canonical_flight_information', '', '1'),
       (702, 'seo', 'schema_rating_flight_information', '', '1'),
       (703, 'site', 'landing', '', '0'),
       (704, 'site', 'busRtrip', '0', '0'),
       (705, 'flights', 'removeNoMarkupFlight', 0, 1),
       (706, 'flights', 'safarMarketDiscountToken', '', 1),
       (707, 'userLimit', 'userLevelSystemFlypersia0', '0', 1),
       (708, 'userLimit', 'userLevelSystemFlypersia1', '0', 1),
       (709, 'userLimit', 'userLevelSystemFlypersia2', '0', 1),
       (710, 'userLimit', 'userLevelSystemFlypersia3', '0', 1),
       (711, 'userLimit', 'userLevelSystemFlypersia4', '0', 1),
       (712, 'userLimit', 'userLevelSystemFlypersia5', '0', 1),
       (713, 'site', 'siteCaptchaType', 'number', '0'),
       (714, 'userLimit', 'userLevelSystemPouya0', '0', '1'),
       (715, 'userLimit', 'userLevelSystemPouya1', '0', '1'),
       (716, 'userLimit', 'userLevelSystemPouya2', '0', '1'),
       (717, 'userLimit', 'userLevelSystemPouya3', '0', '1'),
       (718, 'userLimit', 'userLevelSystemPouya4', '0', '1'),
       (719, 'userLimit', 'userLevelSystemPouya5', '0', '1'),
       (720, 'payments', 'isAccnew', '0', '1'),
       (721, 'bankPin', 'BankZarinpal', '', 0),
       (722, 'bankPin', 'bankZarinpalActive', '0', 0),
       (723, 'site', 'usingProviderGatewayForSystemi', '0', 0);

-- --------------------------------------------------------
--
-- Table structure for table `cron_jobs`
--

CREATE TABLE `cron_jobs`
(
    `id`           int(64)       NOT NULL,
    `url`          varchar(1000) NOT NULL,
    `status`       tinyint(1)    NOT NULL DEFAULT '0',
    `type`         varchar(50)   NOT NULL,
    `scheduleTime` bigint(20)    NOT NULL,
    `period`       int(5)        NOT NULL,
    `createTime`   timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `cron_jobs`
--

INSERT INTO `cron_jobs` (`id`, `url`, `status`, `type`, `scheduleTime`, `period`, `createTime`)
VALUES (323, 'international/getEtickets', 0, 'parvazkhareji', 1486994701, 0, '2017-01-14 13:25:55'),
       (325, 'bus/sendTicketEmail', 0, 'bus', 1486994701, 0, '2017-01-14 13:27:14'),
       (334, 'flight/mailTickets', 0, 'parvazdakheli', 1486994702, 0, '2017-01-25 13:06:26'),
       (335, 'bus/try_ticket_bus', 0, 'bus', 1486994702, 0, '2017-01-26 14:02:05'),
       (336, 'international/try_ticket_international', 0, 'parvazkhareji', 1486994703, 0, '2017-01-26 14:02:05'),
       (337, 'flight/try_ticket_flight', 0, 'parvazdakheli', 1486994703, 0, '2017-01-26 14:02:05'),
       (338, 'main/sendsmsgroup', 0, 'main', 1486994703, 0, '2017-01-26 14:02:05'),
       (339, 'insurance/mailInsurance', 0, 'insurance', 1486994703, 0, '2017-01-26 14:02:05'),
       (340, 'internationalhotel/mailTickets', 0, 'internationalhotel', 1486994703, 0, '2017-01-26 14:02:05'),
       (361, 'internationalflight/getEtickets', 0, 'parvazkhareji', 1610025095, 0, '2020-05-11 08:55:55'),
       (362, 'tourDomestic/try_ticket_tour', 0, 'tourDomestic', 1610025095, '600', '2020-05-11 08:55:55'),
       (363, 'userTask/check_notice', '0', 'userTask', '1632825904', '600', '2021-09-28 14:13:55'),
       (364, 'user_panel/flightD/ticketEsterdadNatamam', '0', 'parvazdakheli', '1632825904', '300', '2021-09-28 14:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `esterdad`
--

CREATE TABLE `esterdad`
(
    `esterdadID`                  bigint(20)                           NOT NULL,
    `esterdad_date`               varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `esterdad_refrens`            varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `esterdad_buynumber`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `esterdad_pcount`             int(11)                              NOT NULL,
    `esterdad_masir`              varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `esterdad_airline`            varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `esterdad_price`              bigint(20)                           NOT NULL,
    `esterdad_shomarekart`        varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `esterdad_namekart`           varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `esterdad_shaba`              varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `esterdad_tell`               int(11)                              NOT NULL,
    `esterdad_describe`           text COLLATE utf8_persian_ci         NOT NULL,
    `esterdad_status`             int(11)                              NOT NULL,
    `esterdad_file`               text COLLATE utf8_persian_ci         NOT NULL,
    `esterdad_username`           varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `esterdad_psargoroh`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `esterdad_type`               int(11)                              NOT NULL,
    `esterdad_fish`               varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `user_id`                     bigint(20)                           NOT NULL,
    `esterdad_admin_des`          text COLLATE utf8_persian_ci         NOT NULL,
    `esterdad_user_des`           text COLLATE utf8_persian_ci         NOT NULL,
    `esterdad_pardakht`           int(11)                              NOT NULL,
    `esterdad_bcount`             int(11)                              NOT NULL,
    `esterdad_tarikhparvaz`       varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `esterdad_shomareparvaz`      varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `esterdad_tarikhvariz`        varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `esterdad_shomarekartmaghsad` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `esterdad_shomarekartmabda`   varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `esterdad_tiket`              int(11)                              NOT NULL,
    `esterdad_adminid`            int(11)                              NOT NULL,
    `hesabdariID`                 bigint(20)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery`
(
    `image_id`        bigint(20)                          NOT NULL,
    `imageURL`        varchar(255) CHARACTER SET latin1   NOT NULL,
    `imageURL_thumbs` varchar(255) CHARACTER SET latin1   NOT NULL,
    `user_id`         bigint(20)                          NOT NULL,
    `productID`       bigint(20)                          NOT NULL,
    `advsellID`       int(11)                             NOT NULL,
    `date`            varchar(52) COLLATE utf8_persian_ci NOT NULL,
    `typeImage`       varchar(50) COLLATE utf8_persian_ci NOT NULL,
    `categoryID`      int(11)                             NOT NULL,
    `news_id`         int(11)                             NOT NULL,
    `articleID`       int(11)                             NOT NULL,
    `repinaID`        bigint(20)                          NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hesabdari`
--

CREATE TABLE `hesabdari`
(
    `hesabdariID`                 bigint(20)                                              NOT NULL,
    `hesabdari_type`              varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `hesabdari_price`             bigint(20)                                              NOT NULL,
    `hesabdari_priceAll`          BIGINT(20)                                              NOT NULL,
    `hesabdari_id`                bigint(20)                                              NOT NULL,
    `user_id`                     bigint(20)                                              NOT NULL,
    `hesabdari_status`            int(11)                                                 NOT NULL,
    `admin_id`                    int(11)                                                 NOT NULL,
    `admin_user`                  varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `hesabdari_date`              varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `hesabdari_peygiri`           varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `hesabdari_peygiridate`       varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `hesabdari_paytype`           int(11)                                                 NOT NULL,
    `hesabdari_cart`              varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `hesabdari_fstatus`           tinyint(4)                                              NOT NULL,
    `hesabdari_describe`          text COLLATE utf8_persian_ci                            NOT NULL,
    `hesabdari_airlinetype`       varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `hesabdari_tafzil`            int(11)                                                 NOT NULL,
    `hesabdari_reference`         varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `hesabdari_namekart`          varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `hesabdari_shomarekart`       int(11)                                                 NOT NULL,
    `hesabdari_brokerprice`       INT                                                     NULL     DEFAULT NULL,
    `hesabdari_dateesterdad`      INT                                                     NULL     DEFAULT NULL,
    `hesabdari_statusprice`       INT                                                     NULL     DEFAULT NULL,
    `rehesabdari_tafzil`          INT                                                     NULL,
    `rehesabdari_brokerprice`     INT                                                     NULL,
    `rehesabdari_dateesterdad`    INT                                                     NULL,
    `rehesabdari_statusprice`     INT                                                     NULL,
    `type_rezerve`                INT                                                     NULL     DEFAULT NULL,

    `isChargeUser`                TINYINT(1)                                              NOT NULL DEFAULT '0',
    `isSabtsanad`                 INT(11)                                                 NOT NULL DEFAULT '0',
    `hesabdari_shomaresheba`      VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `serviceproviders_type`       INT                                                     NULL     DEFAULT NULL,
    `serviceproviders_typHazine`  INT                                                     NULL     DEFAULT NULL,
    `IshesabMovaghat`             TINYINT(1)                                              NOT NULL DEFAULT '0',
    `type_pardakht`               TINYINT(1)                                              NOT NULL,
    `type_tarafhesab`             TINYINT(1)                                              NOT NULL,
    `type_Search`                 TINYINT(1)                                              NULL     DEFAULT NULL,
    `serviceproviders_typBanke`   INT                                                     NULL     DEFAULT NULL,
    `logSanad`                    TEXT                                                    NOT NULL,
    `variziId`                    INT                                                     NOT NULL,
    `bankIDbardasht`              INT                                                     NOT NULL DEFAULT '0',
    `bankIDvariz`                 INT                                                     NOT NULL DEFAULT '0',
    `bankIDkarmazd`               INT                                                     NOT NULL DEFAULT '0',
    `hasabBanksafarang`           VARCHAR(50)                                             NOT NULL,
    `typeRequest`                 TINYINT(1)                                              NOT NULL DEFAULT '0',
    `sanadDaftarRuzname`          VARCHAR(500)                                            NULL     DEFAULT NULL,
    `hesabdari_cellphone`         VARCHAR(11)                                             NULL     DEFAULT NULL,


    `hesabdari_brokerpriceAdmin`  INT                                                     NOT NULL COMMENT 'مبلغ دریافتی از کارگزار به تشخیص کارشناس',
    `hesabdari_typeService`       VARCHAR(30)                                             NULL     DEFAULT NULL COMMENT 'نوع سرویس',
    `hesabdari_typeAction`        VARCHAR(30)                                             NULL     DEFAULT NULL COMMENT 'نوع فعالیت',
    `hesabdari_ticketId`          INT                                                     NULL     DEFAULT NULL,
    `hesabdari_karshenasH`        INT                                                     NULL     DEFAULT NULL,
    `hesabdari_typeEhraz`         VARCHAR(20)                                             NOT NULL,
    `hesabdari_pidtype`           VARCHAR(10)                                             NOT NULL,
    `hesabdari_tafzilHazine`      INT                                                     NULL     DEFAULT NULL,
    `hesabdari_tafzilDaramad`     INT                                                     NULL     DEFAULT NULL,
    `hesabdari_tafzilprovider`    INT                                                     NULL     DEFAULT NULL,
    `hesabdari_siteSaller`        VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `hesabdari_soodPrice`         INT                                                     NOT NULL,
    `hesabdari_soodPriceProvider`         INT                                                     NOT NULL COMMENT ' درآمد کم شده از پروایدر.',
    `hesabdari_soodPriceSaller`   INT                                                     NOT NULL,
    `hesabdari_hamiPriceSaller`   INT                                                     NOT NULL,
    `refundDaftarRuzname`         VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `hesabdari_hesabdariIDSaller` INT                                                     NOT NULL,
    `hesabdariIDEhraz`            BIGINT                                                  NOT NULL,
    `issabtFormkargozar`          TINYINT(1)                                              NOT NULL DEFAULT '0',

    `hesabdari_takhfifPrice`      INT                                                     NOT NULL,
    `hesabdari_soodPriceTour`     INT                                                     NOT NULL,
    `hesabdari_tafzilDaramadTour` INT                                                     NULL     DEFAULT NULL,
    `hesabdari_buyhandID`         INT                                                     NOT NULL,
    `isuserBardasht`              TINYINT(1)                                              NOT NULL DEFAULT '0',
    `is_new` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'براساس تغییرات جدید (منفی شدن کارشناس ) ثبت شده است یا خیر',
    `type_request`              VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `season_salary`              TINYINT(1) NOT NULL,
    `year_salary`              INT(6) NOT NULL,
    `returnIssabtsanad`         TINYINT(1) NOT NULL DEFAULT '0',
    `returnDaftarRuzname`       VARCHAR(500) NOT NULL,
    `percent` INT(3) NOT NULL COMMENT 'درصد جریمه',
    `originCard` VARCHAR(20) NOT NULL,
    `destinationCard` VARCHAR(20) NOT NULL,
    `is_ehrazHesabdar` TINYINT(1) NOT NULL,
    `status_ehraz` TINYINT(1) NOT NULL

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;






-- --------------------------------------------------------

--
-- Table structure for table `daftar_roozname`
--
CREATE TABLE `daftar_roozname`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `regdate`      varchar(50)         DEFAULT NULL,
    `type`         varchar(100)        DEFAULT '',
    `status`       tinyint(1) NOT NULL DEFAULT '0',
    `note`         varchar(200)        DEFAULT '',
    `count`        int(5)              DEFAULT '0',
    `transactions` text,
    `typeSanad`    TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'با ساختار حسابداری قبل یا جدید',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 0
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel`
(
    `hotelID`                  bigint(20)                           NOT NULL,
    `user_id`                  bigint(20)                           NOT NULL,
    `hotel_date`               varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `hotel_admin_des`          text COLLATE utf8_persian_ci         NOT NULL,
    `hotel_user_des`           text COLLATE utf8_persian_ci         NOT NULL,
    `hotel_name`               varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotel_star`               int(11)                              NOT NULL,
    `hotel_psargoroh`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotel_tarikhvorod`        varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotel_tarikhkhoroj`       varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotel_sobhane`            tinyint(4)                           NOT NULL,
    `hotel_nahar`              tinyint(4)                           NOT NULL,
    `hotel_sham`               tinyint(4)                           NOT NULL,
    `hotel_ptell`              varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `hotel_dtell`              varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `hotel_dname`              varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotel_pricep`             bigint(20)                           NOT NULL,
    `hotel_price`              bigint(20)                           NOT NULL,
    `hotel_variz`              text COLLATE utf8_persian_ci         NOT NULL,
    `hotel_status`             int(11)                              NOT NULL,
    `hotel_varizn`             varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotel_describe`           text COLLATE utf8_persian_ci         NOT NULL,
    `hotel_pcount`             int(11)                              NOT NULL,
    `hotel_tiket`              int(11)                              NOT NULL,
    `hotel_tarikhvariz`        varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotel_shomarekartmabda`   varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotel_shomarekartmaghsad` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotel_adminid`            int(100)                             NOT NULL,
    `hotel_keshvar`            varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotel_city`               varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotel_amount`             bigint(20)                           NOT NULL,
    `hotel_paystatus`          tinyint(4)                           NOT NULL,
    `hotel_paydescribe`        text COLLATE utf8_persian_ci         NOT NULL,
    `hotelsid`                 bigint(20)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

CREATE TABLE `respina_tickets_tourism`
(
    `id`                   int(11)                                                 NOT NULL AUTO_INCREMENT,
    `regdate`              int(11)                                                 NOT NULL COMMENT 'تاریخ ثبت درخواست',
    `api_ticket_id`        int(11)                                                          DEFAULT NULL COMMENT 'آیدی درخواست در رسم سفر',
    `user_id`              int(11)                                                 NOT NULL COMMENT 'آیدی کاربر ثبت کننده',
    `user_name`            varchar(50) COLLATE utf8_persian_ci                     NOT NULL COMMENT 'نام کاربر ثبت کننده',
    `user_level`           tinyint(1)                                              NOT NULL COMMENT 'سطح دسترسی کاربر',
    `user_mobile`          varchar(10) COLLATE utf8_persian_ci                     NOT NULL COMMENT 'شماره موبایل کاربر',
    `status`               tinyint(1)                                              NOT NULL DEFAULT 1 COMMENT 'وضعیت درخواست (1-ثبت 2-آماده 3-موفق)',
    `numberp`              tinyint(4)                                              NOT NULL DEFAULT 1 COMMENT 'تعداد مهمان',
    `gender`               varchar(6) COLLATE utf8_persian_ci                               DEFAULT NULL COMMENT 'جنسیت مهمان (male,female)',
    `nid`                  varchar(10) COLLATE utf8_persian_ci                     NOT NULL COMMENT 'کد ملی مهمان ',
    `first_name`           varchar(50) COLLATE utf8_persian_ci                              DEFAULT NULL COMMENT 'نام مهمان',
    `last_name`            varchar(70) COLLATE utf8_persian_ci                              DEFAULT NULL COMMENT 'نام خانوادگی مهمان',
    `cellphone`            varchar(10) COLLATE utf8_persian_ci                              DEFAULT NULL COMMENT 'تلفن همراه مهمان',
    `discount_code`        varchar(10) COLLATE utf8_persian_ci                              DEFAULT NULL COMMENT 'کد تخفیف',
    `date`                 int(11)                                                 NOT NULL COMMENT 'تاریخ رزرو (تاریخ استفاده از محصول گردشگری)',
    `date_shamsi`          varchar(10) COLLATE utf8_persian_ci                              DEFAULT NULL COMMENT 'تاریخ شمسی (yyyy/mm/dd)',
    `product_id`           int(11)                                                 NOT NULL COMMENT 'آیدی محصول گردشگری',
    `city_name`            varchar(100) COLLATE utf8_persian_ci                             DEFAULT NULL COMMENT 'شهر مقصد خدمت گردشگری',
    `service_id`           int(11)                                                          DEFAULT NULL COMMENT 'آیدی خدمت گردشگری',
    `service_title`        varchar(100) COLLATE utf8_persian_ci                             DEFAULT NULL COMMENT 'عنوان خدمت گردشگری',
    `product_name`         varchar(100) COLLATE utf8_persian_ci                             DEFAULT NULL COMMENT 'نام محصول گردشگری',
    `product_time`         varchar(50) COLLATE utf8_persian_ci                              DEFAULT NULL COMMENT 'ساعت استفاده ازمحصول گردشگری',
    `product_price_adult`  INT(11)                                                 NULL     DEFAULT NULL COMMENT 'قیمت محصول گردشگری بزرگسال',
    `product_price_child`  INT                                                     NULL COMMENT 'قیمت محصول گردشگری کودک',
    `product_price_infant` INT                                                     NULL COMMENT 'قیمت محصول گردشگری نوزاد',
    `price`                int(11)                                                 NOT NULL DEFAULT 0 COMMENT 'قیمت کل',
    `fprice`               int(11)                                                 NOT NULL DEFAULT 0 COMMENT 'قیمت نهایی',
    `discount`             int(11)                                                 NOT NULL DEFAULT 0 COMMENT 'تخفیف',
    `finalprice`           int(11)                                                 NOT NULL DEFAULT 0 COMMENT 'مبلغ قابل پرداخت',
    `markup`               int(11)                                                          DEFAULT 0 COMMENT 'روکشی (fprice-price)',
    `profit`               int(11)                                                          DEFAULT 0 COMMENT 'سود (finalprice-price)',
    `totalDiscount`        varchar(20) COLLATE utf8_persian_ci                              DEFAULT NULL,
    `payment_type`         tinyint(1)                                                       DEFAULT NULL COMMENT 'نوع پرداخت',
    `paymentID`            int(11)                                                          DEFAULT NULL COMMENT ' شماره سفارش بانک',
    `payment_status`       tinyint(1)                                                       DEFAULT 0 COMMENT 'وضعیت پرداخت (0-پرداخت نشده 1-پرداخت شده)',
    `pidtype`              varchar(10) COLLATE utf8_persian_ci                              DEFAULT NULL COMMENT ' مالکیت محصول (self,provider)',
    `tafzilprovider`       int(11)                                                          DEFAULT NULL COMMENT 'حساب تفضیل تامین کننده',
    `provider`             varchar(100) COLLATE utf8_persian_ci                             DEFAULT NULL COMMENT 'سایت حامی تامین کننده',
    `tafzilTarafHesab`     int(11)                                                          DEFAULT NULL,
    `tafzilHazine`         int(11)                                                          DEFAULT NULL,
    `tafzilDaramad`        int(11)                                                          DEFAULT NULL,
    `typeService`          varchar(10) COLLATE utf8_persian_ci                              DEFAULT 'tourism',
    `hamiSegment`          int(11)                                                          DEFAULT NULL,
    `providerSegment`      int(11)                                                          DEFAULT NULL,
    `logSanad`             text COLLATE utf8_persian_ci                                     DEFAULT '',
    `tickets_paydescribe`  varchar(2000) COLLATE utf8_persian_ci                            DEFAULT NULL COMMENT 'توضیحات پرداخت',
    `payment_kind`         varchar(10) CHARACTER SET utf8                                   DEFAULT NULL COMMENT 'شیوه پرداخت (self,hami)',
    `error_code`           varchar(100) COLLATE utf8_persian_ci                             DEFAULT NULL,
    `api_error`            text COLLATE utf8_persian_ci                                     DEFAULT NULL COMMENT 'پیام خطای دریافتی از حامی پرو',
    `error`                text COLLATE utf8_persian_ci                                     DEFAULT NULL COMMENT 'خطا',
    `priceapi`             int(11)                                                          DEFAULT NULL COMMENT 'سهم تأمین کننده',
    `profitapi`            int(11)                                                          DEFAULT NULL COMMENT 'سود API (حامی پرو)',
    `refund`               varchar(3) COLLATE utf8_persian_ci                               DEFAULT NULL,
    `refund_date`          varchar(15) COLLATE utf8_persian_ci                              DEFAULT NULL,
    `refund_status`        varchar(2) COLLATE utf8_persian_ci                               DEFAULT NULL,
    `refund_desc`          varchar(300) COLLATE utf8_persian_ci                             DEFAULT NULL,
    `steps_log`            text COLLATE utf8_persian_ci                                     DEFAULT NULL,
    `salesby`              varchar(50) COLLATE utf8_persian_ci                              DEFAULT NULL,
    `device`               varchar(50) COLLATE utf8_persian_ci                              DEFAULT NULL,
    `os`                   varchar(50) COLLATE utf8_persian_ci                              DEFAULT NULL,
    `browser`              varchar(50) COLLATE utf8_persian_ci                              DEFAULT NULL,
    `webservice_type`      varchar(30) COLLATE utf8_persian_ci                              DEFAULT NULL COMMENT 'نام وبسرویس',
    `webservice_reference` int(11)                                                          DEFAULT NULL COMMENT 'شناسه رزرو وبسرویس (آیدی جدول رزروهای وبسرویس)',
    `tracking_code`        varchar(200) COLLATE utf8_persian_ci                             DEFAULT NULL COMMENT 'کد پیگیری تأمین کننده نهایی',
    `statusSanad`          tinyint(1)                                              NOT NULL DEFAULT 0,
    `salesDaftarRuzname`   varchar(500) COLLATE utf8_persian_ci                             DEFAULT NULL,
    `smsDaftarRuzname`     varchar(500) COLLATE utf8_persian_ci                             DEFAULT NULL,
    `paymentDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    PRIMARY KEY (`id`),
    `price_id`             INT                                                     NOT NULL,
    `sub_price_id`         INT                                                     NOT NULL,
    `adl_count`            INT                                                     NOT NULL,
    `chd_count`            INT                                                     NOT NULL,
    `inf_count`            INT                                                     NOT NULL,
    `sendsmslink`          TINYINT(1)                                              NULL     DEFAULT '0',
    `sendSmsPayment`       TINYINT(1)                                              NULL     DEFAULT '0',
    `returnDaftarRuzname`  VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `refundRequest_status` TINYINT(2)                                              NOT NULL DEFAULT '0',
    `personelDaftarRuzname` BIGINT(20) NOT NULL,
    `profitDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci COMMENT ='درخواست های خرید محصول گردشگری';

CREATE TABLE `respina_passengers_tourism`
(
    `id`                   int(11)                             NOT NULL AUTO_INCREMENT,
    `regdate`              varchar(10) COLLATE utf8_persian_ci NOT NULL COMMENT 'تاریخ ثبت',
    `ticket_id`            int(11)                             NOT NULL COMMENT 'آیدی درخواست اصلی (در جدول respina_tickets_tourism)',
    `user_id`              int(11)                                      DEFAULT NULL COMMENT 'آیدی کاربر ثبت کننده',
    `nid`                  varchar(10) COLLATE utf8_persian_ci NOT NULL COMMENT 'کد ملی',
    `gender`               varchar(6) COLLATE utf8_persian_ci  NOT NULL COMMENT 'جنسیت (male,female)',
    `first_name`           varchar(50) COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'نام مهمان',
    `last_name`            varchar(70) COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'نام خانوادگی',
    `nationality`          tinyint(1)                                   DEFAULT 1 COMMENT 'ملیت (1-ایرانی 2-خارجی)',
    `passport_no`          varchar(10) COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'شماره پاسپورت',
    `age_type`             tinyint(1)                                   DEFAULT 1 COMMENT '(1-بزرگسال 2-کودک 3-نوزاد)',
    `ticket_link`          varchar(1000) COLLATE utf8_persian_ci        DEFAULT NULL,
    `refundRequest_status` TINYINT(2)                          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `ticket_id` (`ticket_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci COMMENT ='مهمان های خدمات گردشگری';

CREATE TABLE `tourism_cip`
(
    `id`                         int(11)                              NOT NULL,
    `ticket_id`                  int(11)                              NOT NULL,
    `locationCode`               varchar(30) COLLATE utf8_persian_ci  NOT NULL COMMENT 'کد مرکز مدنظر برای ارائه خدمات',
    `locationName`               varchar(100) COLLATE utf8_persian_ci NOT NULL COMMENT 'نام مرکز مدنظر برای ارائه خدمات',
    `serviceCode`                varchar(30) COLLATE utf8_persian_ci  NOT NULL COMMENT 'کد خدمات اصلی',
    `serviceName`                varchar(100) COLLATE utf8_persian_ci NOT NULL COMMENT 'نام خدمات اصلی',
    `arriveFlightTime`           varchar(10) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'زمان پرواز ورودی',
    `arriveFlightDate`           VARCHAR(20)                          NULL,
    `arriveFlightAirline`        varchar(30) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'شرکت هواپیمایی پرواز ورودی',
    `arriveFlightNumber`         varchar(10) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'شماره پرواز ورودی',
    `arriveFlightOrigin`         varchar(30) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'مبداء پرواز ورودی',
    `departureFlightTime`        varchar(10) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'زمان پرواز خروجی',
    `departureFlightDate`        VARCHAR(20)                          NULL,
    `departureFlightAirline`     varchar(30) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'شرکت هواپیمایی پرواز خروجی',
    `departureFlightNumber`      varchar(10) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'شماره پرواز خروجی',
    `departureFlightDestination` varchar(30) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'مقصد پرواز خروجی',
    `suiteRestHour`              varchar(10) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'زمان حدودی استراحت سوئیت',
    `suiteStartTime`             varchar(10) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'ساعت حدودی ورود سوئیت'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

CREATE TABLE `tourism_cip_sub_services`
(
    `id`           int(11)                              NOT NULL,
    `ticket_id`    int(11)                              NOT NULL,
    `cip_id`       int(11)                              NOT NULL,
    `serviceCode`  varchar(10) COLLATE utf8_persian_ci  NOT NULL,
    `serviceCount` int(11)                              NOT NULL,
    `serviceName`  varchar(100) COLLATE utf8_persian_ci NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


--
-- Table structure for table `hotelc`
--

CREATE TABLE `hotelc`
(
    `hotelcID`            bigint(20)                           NOT NULL,
    `user_id`             bigint(20)                           NOT NULL,
    `hotelc_date`         varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `hotelc_admin_des`    text COLLATE utf8_persian_ci         NOT NULL,
    `hotelc_user_des`     text COLLATE utf8_persian_ci         NOT NULL,
    `hotelc_status`       tinyint(4)                           NOT NULL,
    `hotelc_name`         varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotelc_psargoroh`    varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotelc_dayc`         int(11)                              NOT NULL,
    `hotelc_tarikhvorod`  varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `hotelc_tarikhkhoroj` varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `hotelc_khesrat`      int(11)                              NOT NULL,
    `hotelc_price`        bigint(20)                           NOT NULL,
    `hotelc_kshomarekart` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotelc_namekart`     varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotelc_ptell`        varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `hotelc_pcount`       int(11)                              NOT NULL,
    `hotelc_describe`     text COLLATE utf8_persian_ci         NOT NULL,
    `hotelc_dname`        varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotelc_dtell`        varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `hotelc_tiket`        int(11)                              NOT NULL,
    `hotelc_adminid`      int(11)                              NOT NULL,
    `hesabdariID`         bigint(20)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotelch`
--

CREATE TABLE `hotelch`
(
    `hotelchID`                  bigint(20)                           NOT NULL,
    `hotelch_type`               int(11)                              NOT NULL,
    `hotelch_status`             int(11)                              NOT NULL,
    `hotelch_date`               varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `hotelch_describe`           text COLLATE utf8_persian_ci         NOT NULL,
    `hotelch_price`              bigint(20)                           NOT NULL,
    `hotelID`                    bigint(20)                           NOT NULL,
    `hotelch_variz`              text COLLATE utf8_persian_ci         NOT NULL,
    `user_id`                    bigint(20)                           NOT NULL,
    `hotelch_user_des`           text COLLATE utf8_persian_ci         NOT NULL,
    `hotelch_admin_des`          text COLLATE utf8_persian_ci         NOT NULL,
    `hotelch_tiket`              int(11)                              NOT NULL,
    `hotelch_describe2`          text COLLATE utf8_persian_ci         NOT NULL,
    `hotelch_shomarekartmaghsad` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotelch_shomarekartmabda`   varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotelch_tarikhvariz`        varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotelch_adminid`            int(11)                              NOT NULL,
    `hotelch_paystatus`          tinyint(4)                           NOT NULL,
    `hotelch_amount`             bigint(20)                           NOT NULL,
    `hotel_paydescribe`          text COLLATE utf8_persian_ci         NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotelgallery`
--

CREATE TABLE `hotelgallery`
(
    `hotelgalleryID`         int(11)                              NOT NULL,
    `hotelgallery_url`       text COLLATE utf8_persian_ci         NOT NULL,
    `hotelgallery_thumbs`    text COLLATE utf8_persian_ci         NOT NULL,
    `hotelgallery_status`    int(11)                              NOT NULL,
    `hotelgallery_typeImage` varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotelsID`               bigint(20)                           NOT NULL,
    `hotelgallery_date`      varchar(50) COLLATE utf8_persian_ci  NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels`
(
    `hotelsID`                int(11)                              NOT NULL,
    `hotels_id`               int(11)                              NOT NULL,
    `hotels_id_area`          int(11)                              NOT NULL,
    `hotels_city_name`        varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotels_persian_name`     varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotels_foreign_name`     varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotels_hotel_kind`       varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotels_short_desc`       text COLLATE utf8_persian_ci         NOT NULL,
    `hotels_star`             int(11)                              NOT NULL,
    `hotels_address`          text COLLATE utf8_persian_ci         NOT NULL,
    `hotels_room_number`      int(11)                              NOT NULL,
    `hotels_status`           int(11)                              NOT NULL,
    `hotels_order_priority`   int(11)                              NOT NULL,
    `hotels_record_timestamp` varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotels_image`            text COLLATE utf8_persian_ci         NOT NULL,
    `hotels_tell`             varchar(200) COLLATE utf8_persian_ci NOT NULL,
    `hotels_tell2`            varchar(200) COLLATE utf8_persian_ci NOT NULL,
    `hotels_email`            varchar(200) COLLATE utf8_persian_ci NOT NULL,
    `hotels_website`          text COLLATE utf8_persian_ci         NOT NULL,
    `hotels_lat`              varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotels_lng`              varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `hotels_active`           int(11)                              NOT NULL,
    `hotels_desc`             text COLLATE utf8_persian_ci         NOT NULL,
    `hotels_video`            text COLLATE utf8_persian_ci         NOT NULL,
    `hotels_meta_word`        text COLLATE utf8_persian_ci         NOT NULL,
    `hotels_metaDescribe`     text COLLATE utf8_persian_ci         NOT NULL,
    `hotels_imageb`           text COLLATE utf8_persian_ci         NOT NULL,
    `hotels_percent`          int(11)                              NOT NULL,
    `hotels_info`             text COLLATE utf8_persian_ci         NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------
--
-- Table structure for table `ip_daily` .Customer's ip will be saved when searchs for domestic hotel and if the ip is new will prompt for phone number.
--

CREATE TABLE `ip_daily`
(
    `id`      int(11) NOT NULL AUTO_INCREMENT,
    `service` varchar(50) DEFAULT NULL,
    `ip`      varchar(20) DEFAULT NULL,
    `time`    varchar(15) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;
-- --------------------------------------------------------

--
-- Table structure for table `listip`
--

CREATE TABLE `listip`
(
    `listipID`      bigint(20)  NOT NULL,
    `listip_ip`     varchar(50) NOT NULL,
    `listip_count`  int(11)     NOT NULL,
    `listip_date`   varchar(50) NOT NULL,
    `listip_datem`  varchar(50) NOT NULL,
    `listip_dateh`  varchar(50) NOT NULL,
    `listip_dated`  varchar(50) NOT NULL,
    `listip_countm` int(11)     NOT NULL,
    `listip_counth` int(11)     NOT NULL,
    `listip_countd` int(11)     NOT NULL,
    `listip_data`   text        NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Dumping data for table `listip`
--

INSERT INTO `listip` (`listipID`, `listip_ip`, `listip_count`, `listip_date`, `listip_datem`, `listip_dateh`,
                      `listip_dated`, `listip_countm`, `listip_counth`, `listip_countd`, `listip_data`)
VALUES (17, '31.59.133.187', 4, '1487063163', '1487063157', '1487063157', '1487063157', 4, 4, 4,
        '{\"date\":\"2017-02-22\",\"from\":\"MHD\",\"to\":\"THR\",\"type\":\"fast\"}'),
       (18, '31.59.184.124', 2, '1487081943', '1487081942', '1487081942', '1487081942', 2, 2, 2,
        '{\"date\":\"2017-02-15\",\"from\":\"MHD\",\"to\":\"THR\",\"type\":\"fast\"}'),
       (19, '2.180.121.183', 3, '1487245332', '1487245332', '1487245271', '1487245271', 1, 3, 3,
        '{\"date\":\"2017-02-18\",\"from\":\"MHD\",\"to\":\"THR\",\"type\":\"\"}');

-- --------------------------------------------------------

--
-- Table structure for table `mojodi`
--

CREATE TABLE `mojodi`
(
    `mojodiID`       bigint(20)                          NOT NULL,
    `user_id`        bigint(20)                          NOT NULL,
    `mojodi_status`  int(11)                             NOT NULL,
    `mojodi_price`   bigint(20)                          NOT NULL,
    `mojodi_date`    varchar(50) COLLATE utf8_persian_ci NOT NULL,
    `mojodi_adminid` int(11)                             NOT NULL,
    `hesabdariID`    bigint(20)                          NOT NULL,
    `mojodi_type`    int(11)                             NOT NULL,
    `mojodi_tiket`   int(11)                             NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mosafer`
--

CREATE TABLE `mosafer`
(
    `mosaferID`          int(11)                                                 NOT NULL,
    `mosafer_id`         bigint(20)                                              NOT NULL,
    `mosafer_type`       varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `mosafer_name`       varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `mosafer_sex`        tinyint(4)                                              NOT NULL,
    `mosafer_age`        tinyint(4)                                              NOT NULL,
    `mosafer_meli`       varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `mosafer_tell`       varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `mosafer_date`       varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `user_id`            bigint(20)                                              NOT NULL,
    `mosafer_gozarname`  varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `mosafer_tgozarname` varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `passenger_id`       int(11)                                                 NOT NULL,
    `mosafer_price`      int(11)                                                 NULL,
    `mosafer_mobile`     VARCHAR(12)                                             NULL DEFAULT NULL,
    `ticket_number`      VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pardakht`
--

CREATE TABLE `pardakht`
(
    `pardakhtID`                 int(11)                              NOT NULL,
    `pardakht_price`             int(11)                              NOT NULL,
    `pardakht_price_h`           varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `pardakht_shomarekart`       varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `pardakht_namekart`          varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `pardakht_describe`          text COLLATE utf8_persian_ci         NOT NULL,
    `pardakht_type`              int(11)                              NOT NULL,
    `pardakht_cellphone`         varchar(11) COLLATE utf8_persian_ci  NOT NULL,
    `pardakht_alarm`             int(11)                              NOT NULL,
    `hesabdariID`                int(11)                              NOT NULL,
    `pardakht_paytype`           int(11)                              NOT NULL,
    `pardakht_adminid`           int(11)                              NOT NULL,
    `pardakht_tiket`             int(11)                              NOT NULL,
    `pardakht_adminname`         varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `pardakht_date`              varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `pardakht_status`            int(11)                              NOT NULL,
    `user_id`                    int(11)                              NOT NULL,
    `user_name`                  varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `user_nameA`                 varchar(100) COLLATE utf8_persian_ci NOT NULL,


    `phonebook_id`               INT                                  NULL     DEFAULT NULL,
    `IshesabMovaghat`            TINYINT(1)                           NOT NULL DEFAULT '0',
    `serviceproviders_type`      INT                                  NULL,
    `serviceproviders_typBanke`  INT                                  NULL,
    `serviceproviders_typHazine` INT                                  NULL,
    `type_tarafhesab`            INT(1)                               NULL     DEFAULT NULL,
    `type_pardakht`              TINYINT(1)                           NULL     DEFAULT NULL,
    `pardakht_reson`             TEXT                                 NOT NULL,
    `buyhandId`                  INT                                  NULL     DEFAULT NULL,
    `pardakht_shomaresheba`      VARCHAR(100)                         NULL,
    `pardakht_typeSearch`        TINYINT(1)                           NULL,
    `refrece`                    VARCHAR(100)                         NULL,
    `phonePassenger`             VARCHAR(11)                          NULL,
    `pardakht_oldId`             INT                                  NULL COMMENT 'شناسه پرداخت قبلی',
    `admin_neg` TINYINT(1) NOT NULL DEFAULT '0'


) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



-- --------------------------------------------------------

--
-- Table structure for table `parvaz`
--

CREATE TABLE `parvaz`
(
    `parvazID`                  bigint(20)                           NOT NULL,
    `parvaz_type`               int(11)                              NOT NULL,
    `parvaz_type1`              int(11)                              NOT NULL,
    `parvaz_masir`              text COLLATE utf8_persian_ci         NOT NULL,
    `parvaz_shomareparvaz`      int(11)                              NOT NULL,
    `parvaz_airline`            varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvaz_tarikhraft`         varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `parvaz_tarikhbargasht`     varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `parvaz_pcount`             int(11)                              NOT NULL,
    `parvaz_class`              varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvaz_price`              bigint(20)                           NOT NULL,
    `parvaz_file`               text COLLATE utf8_persian_ci         NOT NULL,
    `parvaz_varizt`             varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvaz_varizd`             text COLLATE utf8_persian_ci         NOT NULL,
    `parvaz_cellphone`          varchar(15) COLLATE utf8_persian_ci  NOT NULL,
    `parvaz_describe`           text COLLATE utf8_persian_ci         NOT NULL,
    `parvaz_status`             int(11)                              NOT NULL,
    `parvaz_priceall`           bigint(20)                           NOT NULL,
    `parvaz_date`               varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `parvaz_admin_des`          text COLLATE utf8_persian_ci         NOT NULL,
    `parvaz_user_des`           text COLLATE utf8_persian_ci         NOT NULL,
    `user_id`                   bigint(20)                           NOT NULL,
    `parvaz_psargoroh`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvaz_ptell`              varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvaz_namekart`           varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvaz_shaba`              varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvaz_t`                  tinyint(4)                           NOT NULL,
    `parvaz_shomarekart`        varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvaz_tiket`              int(11)                              NOT NULL,
    `parvaz_tarikhvariz`        varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `parvaz_shomarekartmabda`   varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `parvaz_shomarekartmaghsad` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `parvaz_adminid`            int(11)                              NOT NULL,
    `parvaz_refrens`            varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `parvaz_amount`             bigint(20)                           NOT NULL,
    `parvaz_paystatus`          tinyint(4)                           NOT NULL,
    `parvaz_paydescribe`        text COLLATE utf8_persian_ci         NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parvazc`
--

CREATE TABLE `parvazc`
(
    `parvazcID`              bigint(20)                           NOT NULL,
    `parvazc_type`           int(11)                              NOT NULL,
    `parvazc_type1`          int(11)                              NOT NULL,
    `parvazc_masir`          text COLLATE utf8_persian_ci         NOT NULL,
    `parvazc_shomareparvaz`  int(11)                              NOT NULL,
    `parvazc_airline`        varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_tarikhraft`     varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `parvazc_tarikhbargasht` varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `parvazc_pcount`         int(11)                              NOT NULL,
    `parvazc_class`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_price`          bigint(20)                           NOT NULL,
    `parvazc_file`           text COLLATE utf8_persian_ci         NOT NULL,
    `parvazc_varizt`         varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_varizd`         text COLLATE utf8_persian_ci         NOT NULL,
    `parvazc_cellphone`      varchar(15) COLLATE utf8_persian_ci  NOT NULL,
    `parvazc_describe`       text COLLATE utf8_persian_ci         NOT NULL,
    `parvazc_status`         int(11)                              NOT NULL,
    `parvazc_priceall`       bigint(20)                           NOT NULL,
    `parvazc_date`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `parvazc_admin_des`      text COLLATE utf8_persian_ci         NOT NULL,
    `parvazc_user_des`       text COLLATE utf8_persian_ci         NOT NULL,
    `user_id`                bigint(20)                           NOT NULL,
    `parvazc_psargoroh`      varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_ptell`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_namekart`       varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_shaba`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_t`              tinyint(4)                           NOT NULL,
    `parvazc_shomarekart`    varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_tiket`          int(11)                              NOT NULL,
    `parvazc_babat`          int(11)                              NOT NULL,
    `parvazc_refrens`        varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_adminid`        int(11)                              NOT NULL,
    `parvazc_paytype`        tinyint(4)                           NOT NULL,
    `hesabdariID`            bigint(20)                           NOT NULL,
    `ticketid`               int(11)                              NOT NULL,
    `allpassengers`          tinyint(4)                           NOT NULL,
    `user_name`              varchar(250) COLLATE utf8_persian_ci NOT NULL,
    `user_cellphone`         varchar(11) COLLATE utf8_persian_ci  NOT NULL,
    `desc_type`              varchar(10) COLLATE utf8_persian_ci  NOT NULL,
    `parvazc_enddate`        varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `type_api`               VARCHAR(10) COLLATE utf8_persian_ci  NOT NULL,
    `hesabdari_price`        bigint(20)                           NOT NULL,
    `parvazc_site`           text COLLATE utf8_persian_ci         NOT NULL,
    `refundprice`            bigint(20)                           NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parvazch`
--

CREATE TABLE `parvazch`
(
    `parvazchID`                  bigint(20)                           NOT NULL,
    `parvazch_type`               bigint(20)                           NOT NULL,
    `parvazch_status`             int(11)                              NOT NULL,
    `parvazch_date`               varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_id`                     bigint(20)                           NOT NULL,
    `parvazch_describe`           text COLLATE utf8_persian_ci         NOT NULL,
    `parvazch_price`              bigint(20)                           NOT NULL,
    `parvazch_variz`              text COLLATE utf8_persian_ci         NOT NULL,
    `parvazID`                    bigint(20)                           NOT NULL,
    `parvazch_user_des`           text COLLATE utf8_persian_ci         NOT NULL,
    `parvazch_admin_des`          text COLLATE utf8_persian_ci         NOT NULL,
    `parvazch_tiket`              int(11)                              NOT NULL,
    `parvazch_tarikhvariz`        varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `parvazch_shomarekartmabda`   varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `parvazch_shomarekartmaghsad` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `parvazch_describe2`          text COLLATE utf8_persian_ci         NOT NULL,
    `parvazch_refrens`            varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `parvazch_adminid`            int(11)                              NOT NULL,
    `parvazch_amount`             bigint(20)                           NOT NULL,
    `parvazch_paydescribe`        text COLLATE utf8_persian_ci         NOT NULL,
    `parvazch_paystatus`          tinyint(4)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentrefund`
--

CREATE TABLE `paymentrefund`
(
    `paymentrefundID`              int(11)       NOT NULL,
    `paymentID`                    int(11)       NOT NULL,
    `user_id`                      int(11)       NOT NULL,
    `admin_id`                     int(11)       NOT NULL,
    `peymentAmount`                bigint(20)    NOT NULL,
    `paymentrefundAmount`          bigint(50)    NOT NULL,
    `paymentrefund_ip`             varchar(50)   NOT NULL,
    `bank_name`                    varchar(50)   NOT NULL,
    `paymentrefund_status`         tinyint(4)    NOT NULL,
    `paymentrefundCode`            varchar(255)  NOT NULL,
    `paymentrefundType`            varchar(255)  NOT NULL,
    `paymentrefundrequestPay`      varchar(255)  NOT NULL,
    `paymentrefundpayOnlineV`      varchar(255)  NOT NULL,
    `paymentrefundrequestVer`      varchar(255)  NOT NULL,
    `paymentrefundpayment_au`      varchar(255)  NOT NULL,
    `paymentrefundpayment_rand`    varchar(255)  NOT NULL,
    `paymentrefundrespinaID`       int(11)       NOT NULL,
    `paymentrefundpayment_au2`     varchar(255)  NOT NULL,
    `paymentrefundpayment_rs`      varchar(255)  NOT NULL,
    `paymentrefund_urlback`        varchar(1000) NOT NULL,
    `paymentrefund_describes`      varchar(1000) NOT NULL,
    `paymentrefund_describesadmin` varchar(1000) NOT NULL,
    `paymentrefundcodesale`        varchar(255)  NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments`
(
    `paymentID`              bigint(20)                           NOT NULL,
    `user_id`                bigint(20)                           NOT NULL,
    `payment_cellphone`      varchar(12) COLLATE utf8_persian_ci  NOT NULL,
    `payment_username`       varchar(150) COLLATE utf8_persian_ci NOT NULL,
    `payment_email`          varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `payment_describe`       text COLLATE utf8_persian_ci         NOT NULL,
    `peymentAmount`          bigint(20)                           NOT NULL,
    `peymentAmountD`         varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `payment_ip`             varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `paymentDate`            varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `bank_name`              varchar(150) COLLATE utf8_persian_ci NOT NULL,
    `payment_status`         tinyint(4)                           NOT NULL,
    `sanad_status`           tinyint(1) DEFAULT 0,
    `paymentType`            varchar(20) COLLATE utf8_persian_ci  NOT NULL,
    `paymentCode`            varchar(1000) COLLATE utf8_persian_ci NOT NULL,
    `paymentcodesale`        varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `requestPay`             varchar(5) COLLATE utf8_persian_ci   NOT NULL,
    `payOnlineV`             varchar(20) COLLATE utf8_persian_ci  NOT NULL,
    `requestVer`             varchar(20) COLLATE utf8_persian_ci  NOT NULL,
    `payment_au`             varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `payment_rand`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `respinaID`              bigint(20)                           NOT NULL,
    `payment_au2`            varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `payment_rs`             varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `payment_urlback`        text COLLATE utf8_persian_ci         NOT NULL,
    `payment_describes`      text COLLATE utf8_persian_ci         NOT NULL,
    `payment_describesadmin` text COLLATE utf8_persian_ci         NOT NULL,
    `provider`               varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `tafzilprovider`         INT(11)                              NULL     DEFAULT '0',
    `tafzilDargah`           INT(11)                              NULL     DEFAULT '0',
    `tasvieDargah`           tinyint(4)                           NOT NULL DEFAULT '0',
    `tasvieBank`             tinyint(4)                           NOT NULL DEFAULT '0',
    `ignore`                 tinyint(4)                           NOT NULL DEFAULT '0',
    `poshtiban`              tinyint(4)                           NOT NULL DEFAULT '0',
    `dargahLog`              text CHARACTER SET utf8,
    `bankLog`                text CHARACTER SET utf8,
    `tafzilbankHami`         INT                                  NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`paymentID`, `user_id`, `payment_cellphone`, `payment_username`, `payment_email`,
                        `payment_describe`, `peymentAmount`, `peymentAmountD`, `payment_ip`, `paymentDate`, `bank_name`,
                        `payment_status`, `paymentType`, `paymentCode`, `paymentcodesale`, `requestPay`, `payOnlineV`,
                        `requestVer`, `payment_au`, `payment_rand`, `respinaID`, `payment_au2`, `payment_rs`,
                        `payment_urlback`, `payment_describes`, `payment_describesadmin`)
VALUES (__________, __________, '', '', '', '', 0, '', '', '1486585173', '', 0, '', '', '', '0', '', '', '', '',
        __________, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission`
(
    `permission_id`       int(11)                              NOT NULL,
    `permission_title`    varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `permission_rootID`   int(11)                              NOT NULL,
    `permission_describe` text COLLATE utf8_persian_ci         NOT NULL,
    `permission_type`     varchar(20) COLLATE utf8_persian_ci  NOT NULL,
    `permission_showRow`  tinyint(4)                           NOT NULL,
    `permission_level`    tinyint(4)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`permission_id`, `permission_title`, `permission_rootID`, `permission_describe`,
                          `permission_type`, `permission_showRow`, `permission_level`)
VALUES (7, 'admin', 0, '', '', 0, 4),
       (10, 'admin_panel', 7, '', '', 0, 3),
       (12, 'customer', 0, '', '', 0, 3),
       (14, 'settings', 0, 'کلاس تنظیمات سایت', '', 0, 4),
       (15, 'manager', 0, 'کلاس مدیریت', '', 0, 4),
       (16, 'gallery', 0, '', '', 0, 4),
       (19, 'smsPanel', 12, '', '', 0, 0),
       (20, 'manager', 0, 'فیش ها واریزی', '', 0, 0),
       (21, 'tikets', 0, 'لیست پیام ها', '', 0, 0),
       (22, 'parvazallmenu', 0, 'عدم نمایش لیست کامل پرواز (فقط لیست نمایش داده نمی شود )', '', 0, 0),
       (23, 'esterdadallmenu', 0, 'عدم نمایش لیست کامل استرداد(فقط لیست نمایش داده نمی شود )', '', 0, 0),
       (24, 'hesabdariallmenu', 0, 'عدم نمایش لیست کامل حسابداری (فقط لیست نمایش داده نمی شود )', '', 0, 0),
       (25, 'hotelallmenu', 0, 'عدم نمایش لیست کامل هتل(فقط لیست نمایش داده نمی شود )', '', 0, 0),
       (26, 'fishallmenu', 0, 'عدم نمایش لیست کامل فیش ها واریزی(فقط لیست نمایش داده نمی شود )', '', 0, 0),
       (27, 'tiketsallmenu', 0, 'عدم نمایش لیست کامل پیام ها (فقط لیست نمایش داده نمی شود )', '', 0, 0),
       (28, 'settingsallmenu', 0, 'عدم نمایش لیست کامل تنظیمات (فقط لیست نمایش داده نمی شود )', '', 0, 0),
       (29, 'articleallmenu', 0, 'عدم نمایش لیست کامل صفحات(فقط لیست نمایش داده نمی شود )', '', 0, 0),
       (30, 'customerallmenu', 0, 'عدم نمایش  مشتریان(فقط منو نمایش داده نمی شود )', '', 0, 0),
       (31, 'hotel', 0, 'رزرو هتل', '', 0, 0),
       (32, 'hotelc', 0, 'کنسلی هتل', '', 0, 0),
       (33, 'hotelch', 0, 'تغییر رزرو هتل', '', 0, 0),
       (34, 'parvaz', 0, 'رزرو پرواز', '', 0, 0),
       (35, 'parvazc', 0, 'کنسلی پرواز', '', 0, 0),
       (36, 'parvazch', 0, 'تغییر رزرو پرواز', '', 0, 0),
       (38, 'hesabdari', 0, 'حسابداری', '', 0, 0),
       (39, 'mojodi', 0, 'درخواست موجودی', '', 0, 0),
       (40, 'mainadminmenu', 0, 'عدم نمایش مدیریت درخواست ها (فقط منو نمایش داده نمی شود )', '', 0, 0),
       (41, 'dataexcel', 0, 'عدم دستریس به پایگاه داده اکسل', '', 0, 0),
       (42, 'respina', 0, 'استرداد وجه', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `permission_group`
--

CREATE TABLE `permission_group`
(
    `permission_group_id`       int(11)       NOT NULL,
    `permission_group_name`     varchar(250)  NOT NULL,
    `permission_group_active`   tinyint(4)    NOT NULL,
    `permission_group_list`     varchar(2000) NOT NULL,
    `permission_group_describe` text
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------


CREATE TABLE `services_request_call`
(
    `id`          int(11)                              NOT NULL,
    `regdate`     int(11)                              NOT NULL,
    `origin_name` varchar(100) COLLATE utf8_persian_ci  DEFAULT '',
    `dest_name`   varchar(100) COLLATE utf8_persian_ci  DEFAULT '',
    `type`        varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `user_mobile` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `user_id`     varchar(50) COLLATE utf8_persian_ci   DEFAULT NULL,
    `ip`          varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `admin`       varchar(50) COLLATE utf8_persian_ci   DEFAULT NULL,
    `admin_id`    varchar(50) COLLATE utf8_persian_ci   DEFAULT NULL,
    `comment`     varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
    `log`         text COLLATE utf8_persian_ci          DEFAULT NULL,
    `status`      tinyint(4)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Table structure for table `price_routes`
--

CREATE TABLE `price_routes`
(
    `id`    int(11) NOT NULL,
    `date`  varchar(50) DEFAULT NULL,
    `from`  int(11)     DEFAULT NULL,
    `to`    int(11)     DEFAULT NULL,
    `price` double      DEFAULT NULL,
    `count` int(11)     DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference`
(
    `reference_id`       int(11)                              NOT NULL,
    `reference_type`     varchar(20) COLLATE utf8_persian_ci  NOT NULL,
    `refrence_title`     varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `refrence_value`     text COLLATE utf8_persian_ci         NOT NULL,
    `reference_describe` text COLLATE utf8_persian_ci         NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Dumping data for table `reference`
--

INSERT INTO `reference` (`reference_id`, `reference_type`, `refrence_title`, `refrence_value`, `reference_describe`)
VALUES (12, 'user', 'imgProfile', '5', 'تعداد تصویر  آپلود');

-- --------------------------------------------------------

--
-- Table structure for table `refrespina`
--

CREATE TABLE `refrespina`
(
    `refrespinaID`          int(11)                              NOT NULL,
    `refrespina_type`       varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `refrespina_title`      varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `refrespina_condition`  bigint(20)                           NOT NULL,
    `refrespina_condition1` bigint(20)                           NOT NULL,
    `refrespina_value`      bigint(20)                           NOT NULL,
    `refrespina_describe`   text COLLATE utf8_persian_ci         NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `respina_passengers`
--

CREATE TABLE `respina_passengers`
(
    `id`                     int(11)                                         NOT NULL,
    `ticket_id`              int(11)                                         NOT NULL,
    `gender`                 tinyint(4)                                      NOT NULL,
    `name`                   varchar(25) COLLATE utf8_persian_ci                      DEFAULT NULL,
    `family`                 varchar(25) COLLATE utf8_persian_ci                      DEFAULT NULL,
    `ename`                  varchar(25) COLLATE utf8_persian_ci                      DEFAULT NULL,
    `efamily`                varchar(25) COLLATE utf8_persian_ci                      DEFAULT NULL,
    `nid`                    varchar(50) COLLATE utf8_persian_ci             NOT NULL,
    `dob`                    varchar(10) COLLATE utf8_persian_ci             NOT NULL,
    `type`                   varchar(7) COLLATE utf8_persian_ci              NOT NULL,
    `meli`                   tinyint(4)                                      NOT NULL,
    `price`                  int(11)                                         NOT NULL,
    `fprice`                 int(11)                                         NOT NULL,
    `nationality`            varchar(10) COLLATE utf8_persian_ci             NOT NULL,
    `nationalitycode`        varchar(10) COLLATE utf8_persian_ci             NOT NULL,
    `expdate`                date                                            NOT NULL,
    `vilcher`                tinyint(4)                                      NOT NULL,
    `ticket_number`          varchar(100) COLLATE utf8_persian_ci            NOT NULL,
    `ticket_link`            text COLLATE utf8_persian_ci                    NOT NULL,
    `pnr`                    varchar(100) COLLATE utf8_persian_ci            NOT NULL,
    `ticket_iduser`          int(11)                                         NOT NULL,
    `tktinfo`                text COLLATE utf8_persian_ci                    NOT NULL,
    `tfc`                    varchar(255) COLLATE utf8_persian_ci            NOT NULL,
    `pda`                    text COLLATE utf8_persian_ci                    NOT NULL,
    `passport_number`        varchar(100) COLLATE utf8_persian_ci            NOT NULL,
    `user_id`                int(11)                                         NOT NULL,
    `finalprice`             int(11)                                         NOT NULL,
    `discount`               tinyint(4)                                      NOT NULL,
    `refund`                 tinyint(4)                                      NOT NULL,
    `jarimerefund`           int(11)                                         NOT NULL,
    `pnrrefund`              varchar(50) COLLATE utf8_persian_ci             NOT NULL,
    `daterefund`             varchar(100) COLLATE utf8_persian_ci            NOT NULL,
    `user_id_refund`         int(11)                                         NOT NULL,
    `user_type_refund`       varchar(100) COLLATE utf8_persian_ci            NOT NULL,
    `pricejarime`            int(11)                                         NOT NULL,
    `ticketrefund`           tinyint(4)                                      NOT NULL,
    `sacnumber`              varchar(255) COLLATE utf8_persian_ci            NOT NULL,
    `expnr`                  mediumtext COLLATE utf8_persian_ci              NOT NULL,
    `refundprice`            int(11)                                         NOT NULL,
    `dmmd`                   mediumtext COLLATE utf8_persian_ci              NOT NULL,
    `serviceprovidersIdtype` int(11)                                         NOT NULL,
    `est_status`             TINYINT(2)                                      NOT NULL DEFAULT '0',
    `number`                 INT(2)                                          NULL     DEFAULT NULL,
    `priceapi`               INT(11)                                         NULL     DEFAULT '0',
    `finalRefundPrice`       INT(11)                                         NULL,
    `refundDaftarRuzname`    VARCHAR(50)                                     NULL,
    `logSanad`               TEXT CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `refundRequest_status`   TINYINT(2)                                      NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Dumping data for table `respina_passengers`
--

INSERT INTO `respina_passengers` (`id`, `ticket_id`, `gender`, `name`, `family`, `ename`, `efamily`, `nid`, `dob`,
                                  `type`, `meli`, `price`, `fprice`, `nationality`, `nationalitycode`, `expdate`,
                                  `vilcher`, `ticket_number`, `ticket_link`, `pnr`, `ticket_iduser`, `tktinfo`, `tfc`,
                                  `pda`, `passport_number`, `user_id`, `finalprice`, `discount`, `refund`,
                                  `jarimerefund`, `pnrrefund`, `daterefund`, `user_id_refund`, `user_type_refund`,
                                  `pricejarime`, `ticketrefund`, `sacnumber`, `expnr`, `refundprice`, `dmmd`,
                                  `serviceprovidersIdtype`)
VALUES (__________, __________, 1, 'علی', 'علوی', 'ALI', 'Alavi', '0123456789', '1989-11-01', '1', 1, 1205000, 1070000,
        '1', 'IRN', '0000-00-00', 0, '', '', '', 0, '', '135000', '', '', __________, 1205000, 0, 0, 0, '', '', 0, '',
        0, 0, '', '', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `respina_passengers_kh`
--

CREATE TABLE `respina_passengers_kh`
(
    `id`                      int(11)                                                 NOT NULL,
    `ticket_id`               bigint(11)                                              NOT NULL,
    `gender`                  tinyint(4)                                              NOT NULL,
    `name`                    varchar(100)                                                     DEFAULT NULL,
    `family`                  varchar(100)                                                     DEFAULT NULL,
    `ename`                   varchar(100)                                                     DEFAULT NULL,
    `efamily`                 varchar(100)                                                     DEFAULT NULL,
    `nid`                     varchar(50)                                             NOT NULL,
    `dob`                     varchar(10)                                             NOT NULL,
    `type`                    varchar(7)                                              NOT NULL,
    `price`                   int(11)                                                 NOT NULL,
    `baseFare`                decimal(10, 0)                                                   DEFAULT 0,
    `fprice`                  int(11)                                                 NOT NULL,
    `finalprice`              decimal(10, 0)                                          NOT NULL,
    `nationality`             varchar(10)                                             NOT NULL,
    `issuePassportCountry`    varchar(30)                                                      DEFAULT NULL COMMENT 'کشور صادر کننده پاسپورت IR ,TR ,...',
    `passport_issue_date`     date                                                             DEFAULT NULL,
    `expdate`                 date                                                    NOT NULL,
    `vilcher`                 tinyint(4)                                              NOT NULL,
    `ticket_number`           varchar(100)                                            NOT NULL,
    `pnr`                     varchar(100)                                            NOT NULL,
    `tktinfo`                 text                                                    NOT NULL,
    `passport_number`         varchar(100)                                            NOT NULL,
    `user_id`                 int(11)                                                 NOT NULL,
    `refund`                  tinyint(4)                                              NOT NULL,
    `jarimerefund`            int(11)                                                 NOT NULL,
    `daterefund`              varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `user_id_refund`          int(11)                                                 NOT NULL,
    `user_type_refund`        varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `ticketrefund`            tinyint(4)                                              NOT NULL,
    `refundprice`             int(11)                                                 NOT NULL,
    `est_status`              tinyint(2)                                              NOT NULL DEFAULT 0,
    `eticket`                 varchar(100)                                                     DEFAULT NULL COMMENT 'تیکت نامبر ',
    `eticketUpdateMethodName` varchar(100)                                                     DEFAULT NULL COMMENT 'از کدوم متد آپدیت شده buyticket  | getEtickets , get',
    `freemelicode`            VARCHAR(500)                                            NULL COMMENT 'آزاد کردن کد ملی این مسافر',
    `freemelicodeLog`         TEXT                                                    NULL COMMENT 'چه کسی آزاد کرده؟',
    `refundDaftarRuzname`     VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL     DEFAULT NULL,
    `logSanad`                TEXT CHARACTER SET utf8 COLLATE utf8_persian_ci         NULL     DEFAULT NULL,
    `baseFareSource`          VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `baseFareReturn`          VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;



--
-- Dumping data for table `respina_passengers_kh`
--

INSERT INTO `respina_passengers_kh` (`id`, `ticket_id`, `gender`, `name`, `family`, `ename`, `efamily`, `nid`, `dob`,
                                     `type`, `price`, `baseFare`, `fprice`, `finalprice`, `nationality`, `expdate`,
                                     `vilcher`, `ticket_number`, `pnr`, `tktinfo`, `passport_number`, `user_id`)
VALUES (__________, __________, 2, '', '', '', '', '', '', '', 0, '', 0, '', '', '', 0, '', '', '', '', __________);

-- --------------------------------------------------------

--
-- Table structure for table `test`

CREATE TABLE `test`
(
    `id`   int(11)                                             NOT NULL AUTO_INCREMENT,
    `data` longtext CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `time` varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `type` varchar(50)                                            DEFAULT NULL COMMENT 'TIKET,SMS,VOIP,GSM,PASS,PENALTY,WORKHOUR,...',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = latin1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_links`
CREATE TABLE `payment_links`
(
    `id`          int(11) NOT NULL,
    `regdate`     varchar(50) CHARACTER SET latin1                       DEFAULT NULL,
    `paymentID`   bigint(20)                                             DEFAULT NULL,
    `user_id`     bigint(20)                                             DEFAULT NULL,
    `amount`      varchar(20)                                            DEFAULT NULL,
    `end_user_id` bigint(20)                                             DEFAULT NULL,
    `name`        varchar(100)                                           DEFAULT NULL,
    `status`      tinyint(1)                                             DEFAULT NULL,
    `mobile`      varchar(15) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `comment`     varchar(500)                                           DEFAULT NULL,
    `link`        varchar(300)                                           DEFAULT NULL,
    `pass`        varchar(20)                                            DEFAULT NULL,
    `token_set`   int(11) NOT NULL                                       DEFAULT 0
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

ALTER TABLE `payment_links`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `payment_links`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Table structure for table `respina_tickets`
--


CREATE TABLE `user_request`
(
    `id`                   int(11)                                                 NOT NULL,
    `service`              varchar(40) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `ticket_id`            int(11)                                                 DEFAULT NULL,
    `price`                int(11)                                                 DEFAULT NULL,
    `user_id`              int(11)                                                 DEFAULT NULL,
    `admin_id`             varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `status`               tinyint(4)                                              DEFAULT NULL,
    `payment_status`       tinyint(4)                                              DEFAULT NULL,
    `payment_type`         tinyint(4)                                              DEFAULT NULL,
    `payment_id`           int(11)                                                 DEFAULT NULL,
    `payment_kind`         varchar(40) CHARACTER SET utf8 COLLATE utf8_persian_ci  DEFAULT NULL,
    `pid_type`             varchar(40) CHARACTER SET utf8 COLLATE utf8_persian_ci  DEFAULT NULL,
    `request_type`         varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `request_type_en`      varchar(150)                                            NOT NULL,
    `ticket_status`        tinyint(4)                                              DEFAULT NULL COMMENT 'وضعیت 1 - جاری و 2- گذشته  و وضعیت 3 - هر دو',
    `api`                  varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `from`                 varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  DEFAULT NULL,
    `to`                   varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  DEFAULT NULL,
    `request_message`      text CHARACTER SET utf8 COLLATE utf8_persian_ci         NOT NULL,
    `request_status`       tinyint(4)                                              NOT NULL COMMENT 'وضعیت 1 - نمایش به کاربر و 2- عدم نمایش به کاربر',
    `reg_date`             varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `log`                  longtext CHARACTER SET utf8 COLLATE utf8_persian_ci     DEFAULT NULL,
    `provider`             varchar(100)                                            DEFAULT NULL,
    `salesDaftarRuzname`   varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `paymentDaftarRuzname` varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `task_id` INT NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


ALTER TABLE `user_request`
    ADD PRIMARY KEY (`id`);


ALTER TABLE `user_request`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



CREATE TABLE `respina_tickets`
(
    `id`                         bigint(11)                                              NOT NULL,
    `regdate`                    varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `ticketid`                   varchar(20) COLLATE utf8_persian_ci                     NOT NULL,
    `ip`                         varchar(20) COLLATE utf8_persian_ci                     NOT NULL,
    `from`                       varchar(15) COLLATE utf8_persian_ci                     NOT NULL,
    `to`                         varchar(15) COLLATE utf8_persian_ci                     NOT NULL,
    `price`                      int(20)                                                 NOT NULL,
    `fprice`                     int(11)                                                 NOT NULL,
    `tdate`                      date                                                    NOT NULL,
    `ttime`                      varchar(5) COLLATE utf8_persian_ci                      NOT NULL,
    `arrival`                    varchar(5) COLLATE utf8_persian_ci                      NOT NULL,
    `status`                     int(11)                                                 NOT NULL,
    `fnumber`                    varchar(10) COLLATE utf8_persian_ci                     NOT NULL,
    `airline`                    varchar(15) COLLATE utf8_persian_ci                     NOT NULL,
    `flight_name`                varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `mobile`                     varchar(15) COLLATE utf8_persian_ci                     NOT NULL,
    `email`                      varchar(125) COLLATE utf8_persian_ci                    NOT NULL,
    `emailed`                    tinyint(1)                                                       DEFAULT '0',
    `class`                      varchar(20) COLLATE utf8_persian_ci                     NOT NULL,
    `pnr`                        varchar(40) COLLATE utf8_persian_ci                     NOT NULL,
    `api`                        varchar(10) COLLATE utf8_persian_ci                     NOT NULL,
    `ticketp`                    longtext COLLATE utf8_persian_ci                        NOT NULL,
    `numberp`                    int(11)                                                 NOT NULL,
    `systemiparams`              text COLLATE utf8_persian_ci                            NOT NULL,
    `error`                      text COLLATE utf8_persian_ci                            NOT NULL,
    `code_error`                 int(11)                                                 NOT NULL,
    `salesby`                    varchar(50)                                                      DEFAULT '',
    `device`                     varchar(50)                                                      DEFAULT '',
    `os`                         varchar(50)                                                      DEFAULT '',
    `browser`                    varchar(50)                                                      DEFAULT '',
    `respina_userID`             int(11)                                                 NOT NULL,
    `ticket_iduser`              int(11)                                                 NOT NULL,
    `adl`                        int(11)                                                 NOT NULL,
    `chd`                        int(11)                                                 NOT NULL,
    `inf`                        int(11)                                                 NOT NULL,
    `pid`                        int(11)                                                 NOT NULL,
    `passenger_sepehr`           longtext COLLATE utf8_persian_ci                        NOT NULL,
    `random`                     int(11)                                                 NOT NULL,
    `paymentID`                  int(11)                                                 NOT NULL,
    `payment_status`             tinyint(4)                                              NOT NULL,
    `webservice_error`           text COLLATE utf8_persian_ci                            NOT NULL,
    `last_class`                 varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `apilist_id`                 int(11)                                                 NOT NULL,
    `user_id`                    int(11)                                                 NOT NULL,
    `user_name`                  varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `isForeignClass`             TINYINT(1)                                              NULL DEFAULT '0',
    `tickets_paydescribe`        text COLLATE utf8_persian_ci                            NOT NULL,
    `user_cellphone`             varchar(12) COLLATE utf8_persian_ci                     NOT NULL,
    `payment_type`               int(11)                                                 NOT NULL,
    `discount`                   int(11)                                                 NOT NULL,
    `discount_id`                int(11)                                                 NOT NULL,
    `link`                       varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `namep1`                     varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `refund`                     tinyint(4)                                              NOT NULL,
    `markup`                     int(11)                                                 NOT NULL,
    `priceapi`                   int(11)                                                 NOT NULL,
    `sytemidiscount`             tinyint(4)                                              NOT NULL,
    `payment_kind`               varchar(10) COLLATE utf8_persian_ci                     NOT NULL,
    `pidtype`                    varchar(10) COLLATE utf8_persian_ci                     NOT NULL,
    `refundstatus`               tinyint(4)                                              NOT NULL,
    `refunddate`                 varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `backlink`                   VARCHAR(400) COLLATE utf8_persian_ci                    NOT NULL,
    `sendbot`                    tinyint(1)                                              NOT NULL,
    `needaction_status`          tinyint(1)                                                       DEFAULT '0',
    `comment`                    VARCHAR(500) COLLATE utf8_persian_ci                    NOT NULL,
    `discounttype`               varchar(5)                                                       DEFAULT '',
    `discounttotal`              varchar(5)                                                       DEFAULT '',
    `hesabdariID`                INT                                                     NULL     DEFAULT NULL,
    `esrequest_status`           TINYINT(1)                                              NULL     DEFAULT NULL,
    `admin_id`                   VARCHAR(25)                                             NULL     DEFAULT NULL,
    `esrequest_type`             TINYINT(1)                                              NULL     DEFAULT NULL,
    `esrequest_reason`           TINYINT(1)                                              NULL     DEFAULT NULL,
    `esrequest_date`             varchar(50) COLLATE utf8_persian_ci                              DEFAULT NULL,
    `esrequest_price`            int(11)                                                          DEFAULT NULL,
    `esrequest_paytype`          int(1)                                                  NOT NULL DEFAULT '0',
    `eskargozar_price`           int(11)                                                 NOT NULL,
    `eskargozar_price_admin`     INT                                                     NOT NULL,
    `eskargozar_statusprice`     int(11)                                                 NOT NULL DEFAULT '1',
    `eskargozar_date`            varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `esrequest_datetakmil`       VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `esrequest_varizetebaruser`  varchar(20) COLLATE utf8_persian_ci                              DEFAULT NULL,
    `discountCode`               varchar(50) COLLATE utf8_persian_ci                              DEFAULT NULL,
    `discountCodeAmount`         varchar(50) COLLATE utf8_persian_ci                              DEFAULT NULL,
    `esrequest_description`      TEXT COLLATE utf8_persian_ci                            NOT NULL,
    `user_rank`                  TINYINT(1)                                              NULL,
    `reminder_sms_status`        TINYINT(2)                                              NULL,
    `lottery`                    TEXT CHARACTER SET utf8 COLLATE utf8_general_ci         NULL,
    `provider`                   VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `logSanad`                   TEXT                                                    NULL     DEFAULT '',
    `isSplitedFrom`              VARCHAR(100)                                            NULL     DEFAULT '0',
    `tafzilprovider`             INT(11)                                                 NULL     DEFAULT '0',
    `buyhand_id`                 INT                                                     NULL,
    `source`                     VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL,
    `wheelchair`                 TINYINT(1)                                              NULL DEFAULT '0',
    `totalDiscount`              VARCHAR(20)                                             NULL     DEFAULT '',
    `tafzilTarafHesab`           INT(11)                                                 NULL     DEFAULT '0',
    `tafzilHazine`               INT(11)                                                 NULL     DEFAULT '0',
    `tafzilDaramad`              INT(11)                                                 NULL     DEFAULT '0',
    `typeService`                VARCHAR(20)                                             NULL     DEFAULT 'flightD',
    `priceSource`                INT(11)                                                 NULL     DEFAULT '0',
    `hamiSegment`                INT(11)                                                 NULL     DEFAULT '0',
    `providerSegment`            INT(11)                                                 NULL     DEFAULT '0',
    `esrequest_NOTpricekargozar` TINYINT(1)                                              NOT NULL DEFAULT '0',
    `statusSanad`                TINYINT(1)                                              NOT NULL DEFAULT '0',
    `salesDaftarRuzname`         VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `smsDaftarRuzname`           VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `paymentDaftarRuzname`       VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `returnDaftarRuzname`        VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `return19DaftarRuzname`        VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `personelDaftarRuzname`      BIGINT(20) NOT NULL,
    `esrequest_userId_damage`    INT                                                     NULL     DEFAULT NULL,
    `refundRequest_status`       TINYINT(2)                                              NOT NULL DEFAULT '0',
    `adl_price_increase`         INT(11)                                                 NULL     DEFAULT '0',
    `chd_price_increase`         INT(11)                                                 NULL     DEFAULT '0',
    `inf_price_increase`         INT(11)                                                 NULL     DEFAULT '0',
    `total_price_increase`       INT(11)                                                 NULL     DEFAULT '0',
    `admin_reserve_flight`       INT(11)                                                 NULL     DEFAULT '0',
    `backup_email` varchar(30) COLLATE utf8_persian_ci DEFAULT NULL,
    `backup_mobile` varchar(15) COLLATE utf8_persian_ci DEFAULT NULL,
    `is_print` tinyint(4) NOT NULL,
    `refundable` tinyint(1) NOT NULL DEFAULT 1,
    `requested` varchar(30) COLLATE utf8_persian_ci DEFAULT NULL,
    `sms_payment` tinyint(1) DEFAULT NULL,
    `sendsmslink` tinyint(1) DEFAULT NULL,
    `typeSanad` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `all_action` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL ,
    `info_sms` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-nothing 1-counter info 2-gate info',
    `second_connection` tinyint(1) NOT NULL,
    `source_url` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
    `profitDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `extortionAmount` varchar(50) COLLATE utf8_persian_ci DEFAULT ''
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Dumping data for table `respina_tickets`
--

INSERT INTO `respina_tickets` (`id`, `regdate`, `ticketid`, `ip`, `from`, `to`, `price`, `fprice`, `tdate`, `ttime`,
                               `status`, `fnumber`, `airline`, `mobile`, `email`, `emailed`, `class`, `pnr`, `api`,
                               `ticketp`, `numberp`, `systemiparams`, `error`, `code_error`, `respina_userID`,
                               `ticket_iduser`, `adl`, `chd`, `inf`, `pid`, `passenger_sepehr`, `random`, `paymentID`,
                               `payment_status`, `webservice_error`, `last_class`, `apilist_id`, `user_id`, `user_name`,
                               `tickets_paydescribe`, `user_cellphone`, `payment_type`, `discount`, `discount_id`,
                               `link`, `namep1`, `refund`, `markup`, `priceapi`, `sytemidiscount`, `payment_kind`,
                               `pidtype`, `refundstatus`, `refunddate`)
VALUES (__________, '', '', '', '', '', 0, 0, '', '', 2, '', '', '', '', 0, '', '', '', '', 1, '', '', 1, 0, 0, 1, 0, 0,
        0, '', 300000000, 0, 0, '', '', 0, __________, '', '', '', 0, 0, 0, '', '', 0, 0, 0, 0, '', '', 0, '');

ALTER TABLE `respina_tickets`
    ADD INDEX `useridrespinatickets` (`user_id`);


-- --------------------------------------------------------

--
-- Table structure for table `respina_tickets_bus`
--

CREATE TABLE `respina_tickets_bus`
(
    `id`                    int(11)                                                 NOT NULL,
    `regdate`               varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `searchId`              varchar(20)                                                      DEFAULT NULL,
    `orderId`               varchar(200)                                            NOT NULL,
    `ip`                    varchar(20)                                             NOT NULL,
    `from`                  varchar(100)                                                     DEFAULT NULL,
    `to`                    varchar(100)                                                     DEFAULT NULL,
    `price`                 int(20)                                                 NOT NULL,
    `fprice`                int(11)                                                 NOT NULL,
    `finalprice`            int(11)                                                 NOT NULL,
    `tdate`                 varchar(15)                                             NOT NULL,
    `ttime`                 varchar(10)                                             NOT NULL,
    `chairs`                varchar(100)                                            NOT NULL,
    `status`                tinyint(2)                                              NOT NULL,
    `busnumber`             varchar(40)                                             NOT NULL,
    `bustype`               varchar(1000)                                                    DEFAULT NULL,
    `company`               varchar(100)                                                     DEFAULT NULL,
    `mobile`                varchar(15)                                             NOT NULL,
    `email`                 varchar(125)                                            NOT NULL,
    `emailed`               tinyint(1)                                              NOT NULL,
    `pnr`                   varchar(200)                                                     DEFAULT NULL,
    `api`                   varchar(10)                                             NOT NULL,
    `numberp`               tinyint(2)                                              NOT NULL,
    `error`                 text                                                    NOT NULL,
    `code_error`            int(4)                                                  NOT NULL,
    `salesby`               varchar(50)                                                      DEFAULT '',
    `device`                varchar(50)                                                      DEFAULT '',
    `os`                    varchar(50)                                                      DEFAULT '',
    `browser`               varchar(50)                                                      DEFAULT '',
    `paymentID`             int(11)                                                 NOT NULL,
    `payment_status`        tinyint(4)                                              NOT NULL,
    `payment_rand`          varchar(10)                                             NOT NULL,
    `webservice_error`      text                                                    NOT NULL,
    `user_id`               int(11)                                                 NOT NULL,
    `user_name`             varchar(100)                                            NOT NULL,
    `tickets_paydescribe`   text                                                    NOT NULL,
    `ReservationItems`      text                                                    NOT NULL,
    `name`                  varchar(100)                                            NOT NULL,
    `gender`                tinyint(1)                                              NOT NULL,
    `nid`                   varchar(20)                                             NOT NULL,
    `payment_type`          tinyint(2)                                              NOT NULL,
    `discount`              int(11)                                                 NOT NULL,
    `discount_id`           int(11)                                                 NOT NULL,
    `markup`                int(8)                                                  NOT NULL,
    `credit`                int(11)                                                 NOT NULL,
    `payment_kind`          varchar(10)                                             NOT NULL,
    `pidtype`               varchar(10)                                                      DEFAULT NULL,
    `refund`                tinyint(4)                                              NOT NULL,
    `backlink`              varchar(400) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `discountCode`          varchar(50)                                                      DEFAULT NULL,
    `discountCodeAmount`    varchar(50)                                                      DEFAULT NULL,
    `discountAmount`        varchar(50)                                                      DEFAULT NULL,
    `new_bus`               tinyint(1)                                                       DEFAULT 0,
    `SRCID`                 varchar(50)                                                      DEFAULT NULL,
    `DSTID`                 varchar(50)                                                      DEFAULT NULL,
    `user_rank`             tinyint(1)                                                       DEFAULT NULL,
    `reminder_sms_status`   tinyint(2)                                                       DEFAULT NULL,
    `lottery`               text                                                             DEFAULT NULL,
    `provider`              varchar(100)                                                     DEFAULT NULL,
    `serviceProviderTypeId` int(11)                                                          DEFAULT NULL,
    `hesabSood`             int(11)                                                          DEFAULT NULL,
    `group`                 varchar(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci         DEFAULT NULL,
    `admin_reserve`         varchar(30) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `comment`               text CHARACTER SET utf8 COLLATE utf8_persian_ci                  DEFAULT NULL,
    `is_tour`               int(11)                                                          DEFAULT 0,
    `sendsmslink`           tinyint(1)                                                       DEFAULT 0,
    `sendSmsPayment`        tinyint(1)                                                       DEFAULT 0,
    `priceapi`              int(11)                                                          DEFAULT NULL,
    `profitapi`             int(11)                                                          DEFAULT NULL,
    `tafzilprovider`        int(11)                                                          DEFAULT NULL,
    `logSanad`              text                                                             DEFAULT '',
    `totalDiscount`         varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT '',
    `typeService`           varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT 'busD',
    `tafzilTarafHesab`      int(11)                                                          DEFAULT 0,
    `tafzilHazine`          int(11)                                                          DEFAULT 0,
    `tafzilDaramad`         int(11)                                                          DEFAULT 0,
    `hamiSegment`           int(11)                                                          DEFAULT 0,
    `providerSegment`       int(11)                                                          DEFAULT 0,
    `profit`                int(11)                                                          DEFAULT 0,
    `statusSanad`           tinyint(1)                                              NOT NULL DEFAULT 0,
    `salesDaftarRuzname`    varchar(500)                                                     DEFAULT NULL,
    `smsDaftarRuzname`      varchar(500)                                                     DEFAULT NULL,
    `refundPriceBroker`     int(11)                                                          DEFAULT 0,
    `refundPricePassenger`  int(11)                                                          DEFAULT 0,
    `refundPriceApi`        int(11)                                                          DEFAULT 0,
    `paymentDaftarRuzname`  varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL,
    `hesabdariID`           int(11)                                                          DEFAULT NULL,
    `typeSanad`             varchar(20)                                                      DEFAULT NULL,
    `returnDaftarRuzname`   VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `refundRequest_status`  TINYINT(2)                                              NOT NULL DEFAULT '0',
    `refundPercent`         TINYINT(2) UNSIGNED                                     NULL     DEFAULT NULL,
    `refundTime`            VARCHAR(15)                                             NULL     DEFAULT NULL,
    `source_url`            VARCHAR(100)                                            NULL     DEFAULT NULL,
    `ticketNo`              VARCHAR(60)                                             NULL,
    `personelDaftarRuzname` BIGINT(20) NOT NULL,
    `profitDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `respina_tickets_bus`
--

INSERT INTO `respina_tickets_bus` (`id`, `regdate`, `searchId`, `orderId`, `ip`, `from`, `to`, `price`, `fprice`,
                                   `finalprice`, `tdate`, `ttime`, `chairs`, `status`, `busnumber`, `bustype`,
                                   `company`, `mobile`, `email`, `emailed`, `pnr`, `api`, `numberp`, `error`,
                                   `code_error`, `paymentID`, `payment_status`, `payment_rand`, `webservice_error`,
                                   `user_id`, `user_name`, `tickets_paydescribe`, `ReservationItems`, `name`, `gender`,
                                   `nid`, `payment_type`, `discount`, `discount_id`, `markup`, `credit`, `payment_kind`,
                                   `pidtype`, `refund`)
VALUES (__________, 1486635860, '', '', '', '', '', 0, 0, 0, '', '', '', 2, '0', '', '', '', '', 0, NULL, '', 2, '', 1,
        __________, 0, '', '', __________, '', '', '', '', 2, '', 0, 0, 0, 0, 100, '', NULL, 0);

-- --------------------------------------------------------

CREATE TABLE `tiket_groups`
(
    `id`           int(11)                                NOT NULL,
    `regdate`      int(11)                                NOT NULL,
    `name`         varchar(200) COLLATE utf8_persian_ci   NOT NULL,
    `tiket_vaheds` varchar(10000) COLLATE utf8_persian_ci NOT NULL,
    `log`          text COLLATE utf8_persian_ci           NOT NULL,
    `admin`        varchar(10) COLLATE utf8_persian_ci    NOT NULL,
    `admin_name`   varchar(100) COLLATE utf8_persian_ci   NOT NULL,
    `status`       tinyint(4)                             NOT NULL,
    `show`         TINYINT(1)                             NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

INSERT INTO `tiket_groups` (`id`, `regdate`, `name`, `tiket_vaheds`, `log`, `admin`, `admin_name`, `status`, `show`)
VALUES (3, 1623760520, 'فعال سازی حساب کاربری', '', '', '', '', 1, 0),
       (10, 1623848801, 'پشتیبانی پرواز داخلی', '', '', '', '', 1, 0),
       (12, 1624261740, 'hami flight support', '', '', '', '', 1, 0),
       (15, 1624352774, 'تور داخلی', '', '', '', '', 1, 1),
       (16, 1624352799, 'هتل داخلی', '', '', '', '', 1, 1),
       (17, 1624353446, 'پرواز داخلی', '', '', '', '', 1, 1),
       (18, 1624353476, 'پرواز و قطار خارجی', '', '', '', '', 1, 1),
       (19, 1624353502, 'اتوبوس و قطار', '', '', '', '', 1, 1),
       (20, 1624353901, 'حسابداری', '', '', '', '', 1, 1),
       (21, 1624353958, 'ویزا ،هتل و تور خارجی', '', '', '', '', 1, 1),
       (22, 1624354008, 'شکایات', '', '', '', '', 1, 1),
       (25, 1627382411, 'پشتیبانی پرواز خارجی', '', '', '', '', 1, 0),
       (26, 1631943631, 'پشتیبانی هتل داخلی', '', '', '', '', 1, 0);


CREATE TABLE `bus_votes`
(
    `id`       int(11)                              NOT NULL,
    `fromName` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `toName`   varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `vote`     tinyint(1)                           NOT NULL,
    `ip`       varchar(30) COLLATE utf8_persian_ci  NOT NULL,
    `user_id`  varchar(30) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

CREATE TABLE `tiket_categories`
(
    `id`         int(11)                              NOT NULL,
    `regdate`    int(11)                              NOT NULL,
    `name`       varchar(200) COLLATE utf8_persian_ci NOT NULL,
    `log`        text COLLATE utf8_persian_ci         NOT NULL,
    `admin`      varchar(10) COLLATE utf8_persian_ci  NOT NULL,
    `admin_name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `status`     tinyint(4)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

CREATE TABLE `train_votes`
(
    `id`       int(11)                              NOT NULL,
    `fromName` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `toName`   varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `vote`     tinyint(1)                           NOT NULL,
    `ip`       varchar(30) COLLATE utf8_persian_ci  NOT NULL,
    `user_id`  varchar(30) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `flight_votes`
(
    `id`       int(11)                              NOT NULL,
    `fromName` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `toName`   varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `vote`     tinyint(1)                           NOT NULL,
    `ip`       varchar(30) COLLATE utf8_persian_ci  NOT NULL,
    `user_id`  varchar(30) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `hotel_votes`
(
    `id`       int(11)                              NOT NULL,
    `cityName` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `hotelId`  varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `vote`     tinyint(1)                           NOT NULL,
    `ip`       varchar(30) COLLATE utf8_persian_ci  NOT NULL,
    `user_id`  varchar(30) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `hotel_survey`
(
    `id`            int(11)                                                 NOT NULL,
    `hotelId`       int(11)                                                 NOT NULL,
    `hotelName`     varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `cityName`      varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT '',
    `user_id`       int(11)                                                 NOT NULL,
    `user_name`     varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `comment`       text CHARACTER SET utf8 COLLATE utf8_persian_ci         NOT NULL,
    `status`        tinyint(4)                                              NOT NULL,
    `mobile`        varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  DEFAULT NULL,
    `facility_rate` float                                                   NOT NULL,
    `price_rate`    float                                                   NOT NULL,
    `quality_rate`  float                                                   NOT NULL,
    `location_rate` float                                                   NOT NULL,
    `admin`         varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `logs`          text CHARACTER SET utf8 COLLATE utf8_persian_ci         DEFAULT NULL,
    `regdate`       int(11)                                                 NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;



--
-- Table structure for table `tour_list_cities`
--


CREATE TABLE `tour_list_cities`
(
    `id`         int(11)                                                  NOT NULL,
    `city`       varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `list`       varchar(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `admin_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `time`       int(11)                                                  NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


--
-- Table structure for table `respina_tickets_kh`
--

CREATE TABLE `respina_tickets_kh`
(
    `id`                            bigint(11)                                              NOT NULL,
    `regdate`                       bigint(20)                                                       DEFAULT NULL,
    `searchId`                      varchar(50)                                                      DEFAULT NULL,
    `followId`                      varchar(50)                                                      DEFAULT NULL,
    `eticket`                       varchar(100)                                                     DEFAULT NULL COMMENT 'eticket first passanger',
    `ip`                            varchar(20)                                                      DEFAULT NULL,
    `from`                          varchar(15)                                                      DEFAULT NULL,
    `to`                            varchar(15)                                                      DEFAULT NULL,
    `price`                         int(20)                                                          DEFAULT NULL,
    `baseFare`                      decimal(10, 0)                                                   DEFAULT 0,
    `fprice`                        int(11)                                                          DEFAULT NULL,
    `finalprice`                    decimal(10, 0)                                                   DEFAULT NULL,
    `returnPrice`                   int(11)                                                          DEFAULT NULL COMMENT 'فقط برای سفرنگ کارایی داره اگر پرواز برگشت رو نتونستیم بخریم مبلغ رو واریز به حساب کاربر کنیم',
    `tdate`                         date                                                             DEFAULT NULL,
    `ttime`                         varchar(10)                                                      DEFAULT NULL,
    `status`                        int(11)                                                          DEFAULT NULL,
    `fnumber`                       varchar(10)                                                      DEFAULT NULL,
    `airline`                       varchar(50)                                                      DEFAULT NULL,
    `carrierCode`                   varchar(10)                                                      DEFAULT '',
    `mobile`                        varchar(15)                                                      DEFAULT NULL,
    `email`                         varchar(125)                                                     DEFAULT NULL,
    `emailed`                       tinyint(1)                                                       DEFAULT 0,
    `class`                         varchar(20)                                                      DEFAULT NULL,
    `pnr`                           varchar(40)                                                      DEFAULT NULL,
    `api`                           varchar(10)                                                      DEFAULT NULL,
    `numberp`                       int(11)                                                          DEFAULT NULL,
    `error`                         text                                                             DEFAULT NULL,
    `code_error`                    int(11)                                                          DEFAULT NULL,
    `salesby`                       varchar(50)                                                      DEFAULT '',
    `device`                        varchar(50)                                                      DEFAULT '',
    `os`                            varchar(50)                                                      DEFAULT '',
    `browser`                       varchar(50)                                                      DEFAULT '',
    `adl`                           int(11)                                                          DEFAULT NULL,
    `chd`                           int(11)                                                          DEFAULT NULL,
    `inf`                           int(11)                                                          DEFAULT NULL,
    `paymentID`                     int(11)                                                          DEFAULT NULL,
    `payment_status`                tinyint(4)                                                       DEFAULT NULL,
    `payment_rand`                  varchar(10)                                             NOT NULL,
    `webservice_error`              text                                                             DEFAULT NULL,
    `apilist_id`                    int(11)                                                          DEFAULT NULL,
    `user_id`                       int(11)                                                          DEFAULT NULL,
    `user_name`                     varchar(100)                                                     DEFAULT NULL,
    `tickets_paydescribe`           text                                                             DEFAULT NULL,
    `ReservationItems`              text                                                             DEFAULT NULL,
    `operatorDescription`           varchar(300)                                                     DEFAULT NULL,
    `user_cellphone`                varchar(12)                                                      DEFAULT NULL,
    `namep1`                        varchar(100)                                                     DEFAULT NULL,
    `payment_type`                  int(11)                                                          DEFAULT NULL,
    `discount`                      int(11)                                                          DEFAULT NULL,
    `discount_id`                   int(11)                                                          DEFAULT NULL,
    `markup`                        int(8)                                                           DEFAULT 0,
    `credit`                        int(11)                                                          DEFAULT 0,
    `payment_kind`                  varchar(10)                                                      DEFAULT '',
    `pidtype`                       varchar(10)                                                      DEFAULT NULL,
    `refund`                        tinyint(4)                                                       DEFAULT 0,
    `tripType`                      tinyint(1)                                                       DEFAULT NULL,
    `redate`                        date                                                             DEFAULT NULL,
    `retime`                        varchar(10)                                                      DEFAULT NULL,
    `refnumber`                     varchar(50)                                                      DEFAULT NULL,
    `reairline`                     varchar(50)                                                      DEFAULT NULL,
    `recarrierCode`                 varchar(10)                                                      DEFAULT '',
    `apiResult`                     text                                                             DEFAULT NULL,
    `apiResultBuyTicket`            text                                                             DEFAULT NULL COMMENT 'response webservice->buyticket',
    `legs`                          text                                                             DEFAULT NULL,
    `baggage`                       text                                                             DEFAULT NULL,
    `sessionId`                     varchar(50)                                                      DEFAULT NULL,
    `refundstatus`                  tinyint(4)                                                       DEFAULT NULL,
    `refunddate`                    varchar(50)                                                      DEFAULT NULL,
    `discountCode`                  varchar(50)                                                      DEFAULT NULL,
    `discountCodeAmount`            varchar(50)                                                      DEFAULT NULL,
    `lottery`                       text                                                             DEFAULT NULL,
    `user_rank`                     tinyint(1)                                                       DEFAULT NULL,
    `reminder_sms_status`           tinyint(2)                                                       DEFAULT NULL,
    `backlink`                      varchar(400)                                                     DEFAULT NULL,
    `hesabdariID`                   int(11)                                                          DEFAULT NULL,
    `esrequest_status`              tinyint(1)                                                       DEFAULT NULL,
    `admin_id`                      varchar(25) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `esrequest_type`                tinyint(1)                                                       DEFAULT NULL,
    `esrequest_reason`              tinyint(1)                                                       DEFAULT NULL,
    `esrequest_triptype`            tinyint(1)                                                       DEFAULT NULL,
    `esrequest_date`                varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `esrequest_datetakmil`          varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `esrequest_paytype`             tinyint(1)                                              NOT NULL DEFAULT 0,
    `esrequest_description`         text CHARACTER SET utf8 COLLATE utf8_persian_ci         NOT NULL,
    `esrequest_price`               int(11)                                                          DEFAULT NULL,
    `eskargozar_price`              int(11)                                                          DEFAULT NULL,
    `eskargozar_statusprice`        tinyint(1)                                              NOT NULL DEFAULT 1,
    `eskargozar_date`               varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `eskargozar_REprice`            int(11)                                                          DEFAULT NULL,
    `eskargozar_REstatusprice`      tinyint(1)                                                       DEFAULT 1,
    `eskargozar_REdate`             varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `buyhand_id`                    int(11)                                                          DEFAULT NULL,
    `orderId`                       int(11)                                                          DEFAULT NULL COMMENT 'آیدی سمت وب سرویس',
    `developer`                     varchar(10)                                                      DEFAULT NULL COMMENT 'فقط برای تست برنامه نویس',
    `itineries`                     text                                                             DEFAULT NULL COMMENT 'برنامه سفر from, to , date سرچ کاربر',
    `priceDiscountInternational`    tinyint(4)                                                       DEFAULT NULL COMMENT 'درصد تخفیف',
    `profit`                        int(11)                                                          DEFAULT NULL COMMENT 'سود خالص از این بلیط',
    `apiType`                       tinyint(4)                                                       DEFAULT NULL COMMENT '1=parto 2=iati 3=safarang',
    `apiId`                         varchar(500)                                                     DEFAULT NULL COMMENT 'آیدی وب سرویس که با این مراحل خرید انجام میشه fareSourceCode in parto',
    `orderIdWebservice`             varchar(150)                                                     DEFAULT NULL COMMENT 'شماره تیکت وب سرویس',
    `provider`                      VARCHAR(500)                                            NULL COMMENT 'سایت مالکیت بلیط',
    `statusSanad`                   TINYINT(1)                                              NOT NULL DEFAULT '0',
    `salesDaftarRuzname`            varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `salesDaftarRuznameReturn`      varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `smsDaftarRuzname`              varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `paymentDaftarRuzname`          VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `eskargozar_price_admin`        INT                                                     NOT NULL,
    `esrequest_NOTpricekargozar`    TINYINT(1)                                              NOT NULL DEFAULT '0',
    `esrequest_userId_damage`       INT                                                     NULL     DEFAULT NULL,
    `flagapi`                       tinyint(4)                                                       DEFAULT NULL COMMENT '1 if request from webservice (tour)',
    `esrequest_price_Return`        INT                                                     NOT NULL,
    `eskargozar_price_Return`       INT                                                     NOT NULL,
    `eskargozar_price_admin_Return` INT                                                     NOT NULL,
    `eskargozar_countSanad`         TINYINT(1)                                              NOT NULL DEFAULT '0',
    `returnDaftarRuzname`           VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `priceSource2` INT NULL DEFAULT NULL ,
    `priceReturn` INT NULL DEFAULT NULL ,
    `finalPriceSource` INT NULL DEFAULT NULL ,
    `finalPriceReturn` INT NULL DEFAULT NULL,
    `personelDaftarRuzname` BIGINT(20) NOT NULL,
    `profitDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `baseFareSource` int(11) DEFAULT NULL COMMENT 'tiket->baseFareSource jakoja',
    `baseFareReturn` int(11) DEFAULT NULL COMMENT 'tiket->baseFareReturn jakoja',
    `mobile2` varchar(25) DEFAULT NULL,
    `email2` varchar(125) DEFAULT NULL,
    `buyhand_id_return` int(11) DEFAULT NULL,
    `source_url` varchar(50) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;



ALTER TABLE `respina_tickets_kh`
    ADD `new` INT NULL;
ALTER TABLE `respina_tickets_kh`
    ADD `priceapi`  INT NULL COMMENT 'قیمت خام وب سرویس' AFTER `new`,
    ADD `profitapi` INT NULL COMMENT 'سود کل وب سرویس finalprice-price';
ALTER TABLE `respina_tickets_kh`
    ADD `tafzilprovider` INT NULL;
ALTER TABLE `respina_tickets_kh`
    ADD `apisafarang` VARCHAR(500) NULL COMMENT 'charter | system';
ALTER TABLE `respina_tickets_kh`
    ADD `link` VARCHAR(500) NULL COMMENT 'safarang->info->link';
ALTER TABLE `respina_tickets_kh`
    ADD logSanad TEXT NULL DEFAULT '';
ALTER TABLE `respina_tickets_kh`
    ADD `totalDiscount` VARCHAR(20) NULL COMMENT 'fprice - finalprice';
alter table `respina_tickets_kh`
    add COLUMN `priceapiSource`         int(11)                             DEFAULT 0,
    add COLUMN `priceapiReturn`         int(11)                             DEFAULT 0 after `priceapi`,
    add COLUMN `tafzilTarafHesab`       int(11)                             DEFAULT 0,
    add COLUMN `tafzilTarafHesabReturn` int(11)                             DEFAULT 0,
    add COLUMN `tafzilHazine`           int(11)                             DEFAULT 0,
    add COLUMN `tafzilHazineReturn`     int(11)                             DEFAULT 0,
    add COLUMN `tafzilDaramad`          int(11)                             DEFAULT 0,
    add COLUMN `tafzilDaramadReturn`    int(11)                             DEFAULT 0,
    add COLUMN `typeService`            varchar(20) COLLATE utf8_persian_ci DEFAULT 'flightI',
    add COLUMN `hamiSegment`            int(11)                             DEFAULT 0,
    add COLUMN `providerSegment`        int(11)                             DEFAULT 0;
ALTER TABLE `respina_tickets_kh`
    ADD `convertTripType2ToTripType1` TINYINT NULL;

ALTER TABLE `respina_tickets_kh`
    ADD `pidtypeReturn`        VARCHAR(100) NULL AFTER `tafzilTarafHesabReturn`,
    ADD `providerReturn`       VARCHAR(500) NULL AFTER `pidtypeReturn`,
    ADD `tafzilproviderReturn` INT          NULL AFTER `providerReturn`,
    ADD `apisafarangReturn`    VARCHAR(100) NULL AFTER `tafzilproviderReturn`,
    ADD `backsiteReturn`       VARCHAR(500) NULL AFTER `apisafarangReturn`;

ALTER TABLE `respina_tickets_kh`
    ADD `discountPrice` TEXT NULL COMMENT 'خروجی متد discountPrice';

ALTER TABLE `respina_tickets_kh`
    ADD `sytemidiscount` DOUBLE NULL;
ALTER TABLE `respina_tickets_kh`
    ADD `sytemidiscountReturn` DOUBLE NULL;
ALTER TABLE `respina_tickets_kh`
    ADD `linkReturn`        VARCHAR(500) NULL,
    ADD `random`            INT          NULL,
    ADD `priceSource`       INT          NULL,
    ADD `priceSourceReturn` INT          NULL;

ALTER TABLE `respina_tickets_kh`
    ADD `fpriceSource` INT NULL COMMENT 'fprice source safarang' AFTER `fprice`,
    ADD `fpriceReturn` INT NULL COMMENT 'fprice return safarang';

ALTER TABLE `respina_tickets_kh`
    ADD `refundRequest_status` TINYINT NULL COMMENT '1: به منظور درخواست شده 2 : به منظور تکمیل شده';
ALTER TABLE `respina_passengers_kh`
    ADD `refundRequest_status` TINYINT NULL COMMENT '1: به منظور درخواست شده 2 : به منظور تکمیل شده';

alter table `respina_tickets_kh`
    add column `adl_price_increase`   int(11) DEFAULT 0,
    add COLUMN `chd_price_increase`   int(11) DEFAULT 0,
    add COLUMN `inf_price_increase`   int(11) DEFAULT 0,
    add COLUMN `total_price_increase` int(11) DEFAULT 0,
    add COLUMN `admin_reserve_flight` int(11) DEFAULT 0;

--
-- Dumping data for table `respina_tickets_kh`
--

INSERT INTO `respina_tickets_kh` (`id`, `regdate`, `searchId`, `followId`, `eticket`, `ip`, `from`, `to`, `price`,
                                  `baseFare`, `fprice`, `finalprice`, `tdate`, `ttime`, `status`, `fnumber`, `airline`,
                                  `carrierCode`, `mobile`, `email`, `emailed`, `class`, `pnr`, `api`, `numberp`,
                                  `error`, `code_error`, `adl`, `chd`, `inf`, `paymentID`, `payment_status`,
                                  `payment_rand`, `webservice_error`, `apilist_id`, `user_id`, `user_name`,
                                  `tickets_paydescribe`, `ReservationItems`, `operatorDescription`, `user_cellphone`,
                                  `namep1`, `payment_type`, `discount`, `discount_id`, `markup`, `credit`,
                                  `payment_kind`, `pidtype`, `refund`, `tripType`, `redate`, `retime`, `refnumber`,
                                  `reairline`, `recarrierCode`, `apiResult`, `legs`, `baggage`, `sessionId`)
VALUES (__________, 1486622665, '', '', NULL, '', '', '', 0, '0', 0, '0', '', '', 1, '', '', '', '', '', 0, '', '', '',
        1, '', 0, 1, 0, 0, 0, 0, '', '', 0, __________, '', '', NULL, NULL, '', '', 0, 0, 0, 0, 0, '', NULL, 0, 2, '',
        '', '', '', '', '', '', '', '');


CREATE TABLE `international_airline_markup`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `regdate`     varchar(30)  DEFAULT NULL COMMENT 'تاریخ ثبت رکورد',
    `airlineCode` varchar(10)  DEFAULT NULL COMMENT 'کد ایرلاین W5,IR,...',
    `airlineName` varchar(100) DEFAULT NULL COMMENT 'نام ایرلاین mahan,iran air,...',
    `markup`      int(11)      DEFAULT NULL COMMENT 'روکشی مخصوص این ایرلاین',
    `active`      tinyint(4)   DEFAULT NULL COMMENT 'فعال یا عدم فعال بودن',
    `lastUpdate`  varchar(30)  DEFAULT NULL COMMENT 'آخرین باری که رکورد ویرایش شده',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = latin1 COMMENT ='روکشی به ازای هر ایرلاین';



-- --------------------------------------------------------

--
-- Stand-in structure for view `passengers_report_dakheli`
-- (See below for the actual view)
--

CREATE VIEW `passengers_report_dakheli` AS
select `T1`.`id`                     AS `id`,
       `T1`.`ticket_id`              AS `ticket_id`,
       `T1`.`gender`                 AS `gender`,
       `T1`.`name`                   AS `name`,
       `T1`.`family`                 AS `family`,
       `T1`.`ename`                  AS `ename`,
       `T1`.`efamily`                AS `efamily`,
       `T1`.`nid`                    AS `nid`,
       `T1`.`dob`                    AS `dob`,
       `T1`.`type`                   AS `type`,
       `T1`.`meli`                   AS `meli`,
       `T1`.`price`                  AS `price`,
       `T1`.`fprice`                 AS `fprice`,
       `T1`.`nationality`            AS `nationality`,
       `T1`.`nationalitycode`        AS `nationalitycode`,
       `T1`.`expdate`                AS `expdate`,
       `T1`.`vilcher`                AS `vilcher`,
       `T1`.`ticket_number`          AS `ticket_number`,
       `T1`.`ticket_link`            AS `ticket_link`,
       `T1`.`pnr`                    AS `pnr`,
       `T1`.`ticket_iduser`          AS `ticket_iduser`,
       `T1`.`tktinfo`                AS `tktinfo`,
       `T1`.`tfc`                    AS `tfc`,
       `T1`.`pda`                    AS `pda`,
       `T1`.`passport_number`        AS `passport_number`,
       `T1`.`user_id`                AS `user_id`,
       `T1`.`finalprice`             AS `finalprice`,
       `T2`.`discount`               AS `discount`,
       `T1`.`refund`                 AS `refund`,
       `T1`.`jarimerefund`           AS `jarimerefund`,
       `T1`.`pnrrefund`              AS `pnrrefund`,
       `T1`.`daterefund`             AS `daterefund`,
       `T1`.`user_id_refund`         AS `user_id_refund`,
       `T1`.`user_type_refund`       AS `user_type_refund`,
       `T1`.`pricejarime`            AS `pricejarime`,
       `T1`.`ticketrefund`           AS `ticketrefund`,
       `T1`.`sacnumber`              AS `sacnumber`,
       `T1`.`expnr`                  AS `expnr`,
       `T1`.`refundprice`            AS `refundprice`,
       `T1`.`dmmd`                   AS `dmmd`,
       `T1`.`serviceprovidersIdtype` AS `serviceprovidersIdtype`,
       `T2`.`airline`                AS `tickets_airline`,
       `T2`.`fnumber`                AS `tickets_fnumber`,
       `T2`.`status`                 AS `tickets_status`,
       `T2`.`from`                   AS `tickets_from`,
       `T2`.`to`                     AS `tickets_to`,
       `T2`.`pnr`                    AS `tickets_pnr`,
       `T2`.`regdate`                AS `tickets_regdate`,
       `T2`.`paymentID`              AS `paymentID`,
       `T2`.`payment_type`           AS `tickets_payment_type`,
       `T2`.`tdate`                  AS `tickets_tdate`,
       `T2`.`ttime`                  AS `tickets_ttime`,
       `T2`.`api`                    AS `tickets_api`,
       `T2`.`class`                  AS `tickets_class`,
       `T2`.`mobile`                 AS `tickets_mobile`,
       `T2`.`fprice`                 AS `tickets_fprice`,
       `T2`.`priceapi`               AS `tickets_priceapi`,
       `T2`.`discount`               AS `tickets_discount`,
       `T2`.`sytemidiscount`         AS `tickets_sytemidiscount`,
       `T2`.`price`                  AS `tickets_price`,
       `T2`.`numberp`                AS `tickets_numberp`,
       `T2`.`payment_status`         AS `tickets_payment_status`,
       `T2`.`user_id`                AS `tickets_user_id`,
       `T2`.`user_name`              AS `tickets_user_name`,
       `T2`.`user_cellphone`         AS `tickets_user_cellphone`,
       `T2`.`pidtype`                AS `tickets_pidtype`,
       `T2`.`markup`                 AS `tickets_markup`,
       `discounttype`                as `discounttype`,
       `discounttotal`               as `discounttotal`
from (`respina_passengers` `T1` left join `respina_tickets` `T2` on ((`T1`.`ticket_id` = `T2`.`id`)));

-- --------------------------------------------------------
--
-- Table structure for table `parvazc_inter`
--

CREATE TABLE `parvazc_inter`
(
    `parvazcID`              bigint(20)                           NOT NULL,
    `parvazc_type`           int(11)                              NOT NULL,
    `parvazc_type1`          int(11)                              NOT NULL,
    `parvazc_masir`          text COLLATE utf8_persian_ci         NOT NULL,
    `parvazc_shomareparvaz`  int(11)                              NOT NULL,
    `parvazc_airline`        varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_tarikhraft`     varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `parvazc_tarikhbargasht` varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `parvazc_pcount`         int(11)                              NOT NULL,
    `parvazc_class`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_price`          bigint(20)                           NOT NULL,
    `parvazc_file`           text COLLATE utf8_persian_ci         NOT NULL,
    `parvazc_varizt`         varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_varizd`         text COLLATE utf8_persian_ci         NOT NULL,
    `parvazc_cellphone`      varchar(15) COLLATE utf8_persian_ci  NOT NULL,
    `parvazc_describe`       text COLLATE utf8_persian_ci         NOT NULL,
    `parvazc_status`         int(11)                              NOT NULL,
    `parvazc_priceall`       bigint(20)                           NOT NULL,
    `parvazc_date`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `parvazc_admin_des`      text COLLATE utf8_persian_ci         NOT NULL,
    `parvazc_user_des`       text COLLATE utf8_persian_ci         NOT NULL,
    `user_id`                bigint(20)                           NOT NULL,
    `parvazc_psargoroh`      varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_ptell`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_namekart`       varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_shaba`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_t`              tinyint(4)                           NOT NULL,
    `parvazc_shomarekart`    varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_tiket`          int(11)                              NOT NULL,
    `parvazc_babat`          int(11)                              NOT NULL,
    `parvazc_refrens`        varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `parvazc_adminid`        int(11)                              NOT NULL,
    `parvazc_paytype`        tinyint(4)                           NOT NULL,
    `hesabdariID`            bigint(20)                           NOT NULL,
    `ticketid`               int(11)                              NOT NULL,
    `allpassengers`          tinyint(4)                           NOT NULL,
    `user_name`              varchar(250) COLLATE utf8_persian_ci NOT NULL,
    `user_cellphone`         varchar(11) COLLATE utf8_persian_ci  NOT NULL,
    `desc_type`              int(11) DEFAULT NULL,
    `parvazc_triptype`       int(2)  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `respina_tickets_bus_eshteraki`
(
    `id`                    int(11)                                                 NOT NULL,
    `regdate`               varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `searchId`              varchar(20)                                                      DEFAULT NULL,
    `orderId`               varchar(200)                                            NOT NULL,
    `ip`                    varchar(20)                                             NOT NULL,
    `from`                  varchar(100)                                                     DEFAULT NULL,
    `to`                    varchar(100)                                                     DEFAULT NULL,
    `price`                 int(20)                                                 NOT NULL,
    `fprice`                int(11)                                                 NOT NULL,
    `finalprice`            int(11)                                                 NOT NULL,
    `tdate`                 varchar(15)                                             NOT NULL,
    `ttime`                 varchar(10)                                             NOT NULL,
    `chairs`                varchar(100)                                            NOT NULL,
    `status`                tinyint(2)                                              NOT NULL,
    `busnumber`             varchar(40)                                             NOT NULL,
    `bustype`               varchar(1000)                                                    DEFAULT NULL,
    `company`               varchar(100)                                                     DEFAULT NULL,
    `mobile`                varchar(15)                                             NOT NULL,
    `email`                 varchar(125)                                            NOT NULL,
    `emailed`               tinyint(1)                                              NOT NULL,
    `pnr`                   varchar(200)                                                     DEFAULT NULL,
    `api`                   varchar(10)                                             NOT NULL,
    `numberp`               tinyint(2)                                              NOT NULL,
    `error`                 text                                                    NOT NULL,
    `code_error`            int(4)                                                  NOT NULL,
    `salesby`               varchar(50)                                                      DEFAULT '',
    `device`                varchar(50)                                                      DEFAULT '',
    `os`                    varchar(50)                                                      DEFAULT '',
    `browser`               varchar(50)                                                      DEFAULT '',
    `paymentID`             int(11)                                                 NOT NULL,
    `payment_status`        tinyint(4)                                              NOT NULL,
    `payment_rand`          varchar(10)                                             NOT NULL,
    `webservice_error`      text                                                    NOT NULL,
    `user_id`               int(11)                                                 NOT NULL,
    `user_name`             varchar(100)                                            NOT NULL,
    `tickets_paydescribe`   text                                                    NOT NULL,
    `ReservationItems`      text                                                    NOT NULL,
    `name`                  varchar(100)                                            NOT NULL,
    `gender`                tinyint(1)                                              NOT NULL,
    `nid`                   varchar(20)                                             NOT NULL,
    `payment_type`          tinyint(2)                                              NOT NULL,
    `discount`              int(11)                                                 NOT NULL,
    `discount_id`           int(11)                                                 NOT NULL,
    `markup`                int(8)                                                  NOT NULL,
    `credit`                int(11)                                                 NOT NULL,
    `payment_kind`          varchar(10)                                             NOT NULL,
    `pidtype`               varchar(10)                                                      DEFAULT NULL,
    `refund`                tinyint(4)                                              NOT NULL,
    `backlink`              varchar(400) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `discountCode`          varchar(50)                                                      DEFAULT NULL,
    `discountCodeAmount`    varchar(50)                                                      DEFAULT NULL,
    `discountAmount`        varchar(50)                                                      DEFAULT NULL,
    `new_bus`               tinyint(1)                                                       DEFAULT 0,
    `SRCID`                 varchar(50)                                                      DEFAULT NULL,
    `DSTID`                 varchar(50)                                                      DEFAULT NULL,
    `user_rank`             tinyint(1)                                                       DEFAULT NULL,
    `reminder_sms_status`   tinyint(2)                                                       DEFAULT NULL,
    `lottery`               text                                                             DEFAULT NULL,
    `provider`              varchar(100)                                                     DEFAULT NULL,
    `serviceProviderTypeId` int(11)                                                          DEFAULT NULL,
    `hesabSood`             int(11)                                                          DEFAULT NULL,
    `group`                 varchar(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci         DEFAULT NULL,
    `admin_reserve`         varchar(30) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `comment`               text CHARACTER SET utf8 COLLATE utf8_persian_ci                  DEFAULT NULL,
    `is_tour`               int(11)                                                          DEFAULT 0,
    `sendsmslink`           tinyint(1)                                                       DEFAULT 0,
    `sendSmsPayment`        tinyint(1)                                                       DEFAULT 0,
    `priceapi`              int(11)                                                          DEFAULT NULL,
    `profitapi`             int(11)                                                          DEFAULT NULL,
    `tafzilprovider`        int(11)                                                          DEFAULT NULL,
    `logSanad`              text                                                             DEFAULT '',
    `totalDiscount`         varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT '',
    `typeService`           varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT 'busD',
    `tafzilTarafHesab`      int(11)                                                          DEFAULT 0,
    `tafzilHazine`          int(11)                                                          DEFAULT 0,
    `tafzilDaramad`         int(11)                                                          DEFAULT 0,
    `hamiSegment`           int(11)                                                          DEFAULT 0,
    `providerSegment`       int(11)                                                          DEFAULT 0,
    `profit`                int(11)                                                          DEFAULT 0,
    `statusSanad`           tinyint(1)                                              NOT NULL DEFAULT 0,
    `salesDaftarRuzname`    varchar(500)                                                     DEFAULT NULL,
    `smsDaftarRuzname`      varchar(500)                                                     DEFAULT NULL,
    `refundPriceBroker`     int(11)                                                          DEFAULT 0,
    `refundPricePassenger`  int(11)                                                          DEFAULT 0,
    `refundPriceApi`        int(11)                                                          DEFAULT 0,
    `paymentDaftarRuzname`  varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL,
    `hesabdariID`           int(11)                                                          DEFAULT NULL,
    `typeSanad`             varchar(20)                                                      DEFAULT NULL,
    `refundPercent`         TINYINT(2) UNSIGNED                                     NULL,
    `refundTime`            VARCHAR(15)                                             NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


ALTER TABLE `respina_tickets_bus_eshteraki`
    ADD PRIMARY KEY (`id`),
    ADD KEY `regdate` (`regdate`),
    ADD KEY `orderId` (`orderId`),
    ADD KEY `status` (`status`),
    ADD KEY `pnr` (`pnr`),
    ADD KEY `numberp` (`numberp`),
    ADD KEY `mobile` (`mobile`),
    ADD KEY `paymentID` (`paymentID`),
    ADD KEY `refund` (`refund`),
    ADD KEY `emailed` (`emailed`),
    ADD KEY `user_id` (`user_id`),
    ADD KEY `admin_reserve` (`admin_reserve`);


ALTER TABLE `respina_tickets_bus_eshteraki`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



CREATE TABLE `train_tickets_eshteraki`
(
    `id`                     int(11)                              NOT NULL,
    `regdate`                varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `ticketid`               varchar(20) COLLATE utf8_persian_ci  NOT NULL,
    `rticketid`              varchar(20) COLLATE utf8_persian_ci           DEFAULT NULL,
    `ip`                     varchar(20) COLLATE utf8_persian_ci  NOT NULL,
    `from`                   varchar(15) COLLATE utf8_persian_ci  NOT NULL,
    `to`                     varchar(15) COLLATE utf8_persian_ci  NOT NULL,
    `price`                  int(20)                              NOT NULL,
    `fprice`                 int(11)                              NOT NULL,
    `tdate`                  date                                 NOT NULL,
    `ttime`                  varchar(5) COLLATE utf8_persian_ci   NOT NULL,
    `arrive_time`            varchar(10) COLLATE utf8_persian_ci           DEFAULT NULL,
    `status`                 tinyint(2)                           NOT NULL,
    `fnumber`                varchar(10) COLLATE utf8_persian_ci  NOT NULL,
    `airline`                varchar(15) COLLATE utf8_persian_ci  NOT NULL,
    `mobile`                 varchar(15) COLLATE utf8_persian_ci  NOT NULL,
    `email`                  varchar(125) COLLATE utf8_persian_ci NOT NULL,
    `class`                  varchar(20) COLLATE utf8_persian_ci  NOT NULL,
    `pnr`                    varchar(40) COLLATE utf8_persian_ci  NOT NULL,
    `rpnr`                   varchar(40) COLLATE utf8_persian_ci           DEFAULT NULL,
    `api`                    varchar(30) COLLATE utf8_persian_ci  NOT NULL,
    `ticketp`                text COLLATE utf8_persian_ci         NOT NULL,
    `numberp`                tinyint(2)                           NOT NULL,
    `systemiparams`          text COLLATE utf8_persian_ci         NOT NULL,
    `error`                  text COLLATE utf8_persian_ci         NOT NULL,
    `code_error`             tinyint(4)                           NOT NULL,
    `salesby`                varchar(50) COLLATE utf8_persian_ci           DEFAULT '',
    `device`                 varchar(50) COLLATE utf8_persian_ci           DEFAULT '',
    `os`                     varchar(50) COLLATE utf8_persian_ci           DEFAULT '',
    `browser`                varchar(50) COLLATE utf8_persian_ci           DEFAULT '',
    `train_userID`           int(11)                              NOT NULL,
    `ticket_iduser`          int(11)                              NOT NULL,
    `adl`                    tinyint(2)                           NOT NULL,
    `ch`                     tinyint(2)                           NOT NULL,
    `in`                     tinyint(2)                           NOT NULL,
    `wagon`                  int(11)                              NOT NULL,
    `cope`                   int(11)                              NOT NULL,
    `iscope`                 tinyint(1)                           NOT NULL,
    `passenger_sepehr`       longtext COLLATE utf8_persian_ci     NOT NULL,
    `paymentID`              int(11)                              NOT NULL,
    `payment_status`         tinyint(4)                           NOT NULL,
    `user_id`                int(11)                              NOT NULL,
    `user_name`              varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `train_paydescribe`      text COLLATE utf8_persian_ci         NOT NULL,
    `user_cellphone`         varchar(11) COLLATE utf8_persian_ci  NOT NULL,
    `namep1`                 varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `print_ticket`           text COLLATE utf8_persian_ci         NOT NULL,
    `payment_type`           tinyint(2)                           NOT NULL,
    `discount`               int(11)                              NOT NULL,
    `random`                 decimal(11, 0)                       NOT NULL,
    `priceapi`               int(11)                              NOT NULL,
    `markup`                 int(8)                               NOT NULL,
    `webservice_error`       text COLLATE utf8_persian_ci         NOT NULL,
    `payment_kind`           varchar(10) COLLATE utf8_persian_ci  NOT NULL,
    `refund`                 tinyint(4)                           NOT NULL,
    `refundstatus`           tinyint(4)                           NOT NULL,
    `refunddate`             varchar(50) CHARACTER SET utf8       NOT NULL,
    `statusoff`              tinyint(2)                           NOT NULL,
    `backlink`               varchar(400) COLLATE utf8_persian_ci NOT NULL,
    `discountCode`           varchar(50) COLLATE utf8_persian_ci           DEFAULT NULL,
    `discountCodeAmount`     varchar(50) COLLATE utf8_persian_ci           DEFAULT NULL,
    `isreturn`               tinyint(1)                                    DEFAULT NULL,
    `sellmasterid`           varchar(20) COLLATE utf8_persian_ci           DEFAULT NULL,
    `rapi`                   varchar(30) COLLATE utf8_persian_ci           DEFAULT NULL,
    `rticketp`               longtext COLLATE utf8_persian_ci              DEFAULT NULL,
    `rwagon`                 int(11)                                       DEFAULT NULL,
    `rcope`                  int(11)                                       DEFAULT NULL,
    `rtdate`                 date                                          DEFAULT NULL,
    `rttime`                 varchar(5) COLLATE utf8_persian_ci            DEFAULT NULL,
    `rfnumber`               varchar(10) COLLATE utf8_persian_ci           DEFAULT NULL,
    `iscar`                  tinyint(1)                                    DEFAULT 0,
    `user_rank`              tinyint(1)                                    DEFAULT NULL,
    `reminder_sms_status`    tinyint(2)                                    DEFAULT NULL,
    `lottery`                text CHARACTER SET utf8                       DEFAULT NULL,
    `pidtype`                varchar(10) COLLATE utf8_persian_ci           DEFAULT '',
    `provider`               varchar(100) CHARACTER SET utf8               DEFAULT NULL,
    `serviceProviderTypeId`  int(11)                                       DEFAULT NULL,
    `hesabSood`              int(11)                                       DEFAULT NULL,
    `logs`                   text COLLATE utf8_persian_ci                  DEFAULT NULL,
    `hesabdariID`            int(11)                                       DEFAULT NULL,
    `esrequest_status`       tinyint(1)                                    DEFAULT NULL,
    `admin_id`               varchar(25) COLLATE utf8_persian_ci           DEFAULT NULL,
    `esrequest_type`         tinyint(1)                                    DEFAULT NULL,
    `esrequest_reason`       tinyint(1)                                    DEFAULT NULL,
    `esrequest_date`         varchar(50) COLLATE utf8_persian_ci           DEFAULT NULL,
    `esrequest_datetakmil`   varchar(50) COLLATE utf8_persian_ci           DEFAULT NULL,
    `esrequest_paytype`      tinyint(1)                           NOT NULL DEFAULT 0,
    `esrequest_description`  text COLLATE utf8_persian_ci         NOT NULL,
    `esrequest_price`        int(11)                                       DEFAULT NULL,
    `eskargozar_price`       int(11)                                       DEFAULT NULL,
    `eskargozar_statusprice` tinyint(1)                           NOT NULL DEFAULT 1,
    `eskargozar_date`        varchar(50) COLLATE utf8_persian_ci           DEFAULT NULL,
    `est_status`             tinyint(2)                                    DEFAULT 0,
    `buyhand_id`             int(11)                                       DEFAULT NULL,
    `is_tour`                int(11)                                       DEFAULT 0,
    `sendsmslink`            tinyint(1)                                    DEFAULT 0,
    `sendSmsPayment`         tinyint(1)                                    DEFAULT 0,
    `compartmentCapicity`    tinyint(4)                                    DEFAULT NULL,
    `isCompartment`          tinyint(4)                                    DEFAULT NULL,
    `api_pid`                tinyint(4)                                    DEFAULT 0,
    `wagonname`              varchar(1000) COLLATE utf8_persian_ci         DEFAULT NULL,
    `typeTicket`             varchar(30) COLLATE utf8_persian_ci           DEFAULT '',
    `adultPrice`             varchar(30) COLLATE utf8_persian_ci           DEFAULT '',
    `profitapi`              int(11)                                       DEFAULT NULL,
    `tafzilprovider`         int(11)                                       DEFAULT NULL,
    `logSanad`               text COLLATE utf8_persian_ci                  DEFAULT '',
    `totalDiscount`          varchar(20) COLLATE utf8_persian_ci           DEFAULT '',
    `typeService`            varchar(20) COLLATE utf8_persian_ci           DEFAULT 'trainD',
    `tafzilTarafHesab`       int(11)                                       DEFAULT 0,
    `tafzilHazine`           int(11)                                       DEFAULT 0,
    `tafzilDaramad`          int(11)                                       DEFAULT 0,
    `hamiSegment`            int(11)                                       DEFAULT 0,
    `providerSegment`        int(11)                                       DEFAULT 0,
    `profit`                 int(11)                                       DEFAULT 0,
    `statusSanad`            tinyint(1)                           NOT NULL DEFAULT 0,
    `salesDaftarRuzname`     varchar(500) COLLATE utf8_persian_ci          DEFAULT NULL,
    `smsDaftarRuzname`       varchar(500) COLLATE utf8_persian_ci          DEFAULT NULL,
    `refundPriceBroker`      int(11)                                       DEFAULT 0,
    `refundPricePassenger`   int(11)                                       DEFAULT 0,
    `refundPriceApi`         int(11)                                       DEFAULT 0,
    `paymentDaftarRuzname`   varchar(500) COLLATE utf8_persian_ci          DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


ALTER TABLE `train_tickets_eshteraki`
    ADD PRIMARY KEY (`id`),
    ADD KEY `regdate` (`regdate`),
    ADD KEY `ticketid` (`ticketid`),
    ADD KEY `status` (`status`),
    ADD KEY `pnr` (`pnr`),
    ADD KEY `numberp` (`numberp`),
    ADD KEY `mobile` (`mobile`),
    ADD KEY `paymentID` (`paymentID`),
    ADD KEY `refund` (`refund`),
    ADD KEY `user_id` (`user_id`);


ALTER TABLE `train_tickets_eshteraki`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



CREATE TABLE `train_passengers_eshteraki`
(
    `id`               int(11)                              NOT NULL,
    `ticket_id`        int(11)                              NOT NULL,
    `gender`           tinyint(4)                           NOT NULL,
    `name`             varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `family`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `ename`            varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `efamily`          varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `nid`              varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `dob`              varchar(10) COLLATE utf8_persian_ci  NOT NULL,
    `type`             varchar(7) COLLATE utf8_persian_ci   NOT NULL,
    `meli`             tinyint(4)                           NOT NULL,
    `price`            int(11)                              NOT NULL,
    `fprice`           int(11)                              NOT NULL,
    `food`             int(11)                                       DEFAULT 0,
    `food_name`        varchar(1000) COLLATE utf8_persian_ci         DEFAULT '',
    `nationality`      varchar(10) COLLATE utf8_persian_ci  NOT NULL,
    `nationalitycode`  varchar(10) COLLATE utf8_persian_ci  NOT NULL,
    `expdate`          date                                 NOT NULL,
    `vilcher`          tinyint(4)                           NOT NULL,
    `ticket_number`    varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `ticket_link`      text COLLATE utf8_persian_ci         NOT NULL,
    `pnr`              varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `ticket_iduser`    int(11)                              NOT NULL,
    `tktinfo`          text COLLATE utf8_persian_ci         NOT NULL,
    `tfc`              varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `pda`              text COLLATE utf8_persian_ci         NOT NULL,
    `passport_number`  varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `user_id`          int(11)                              NOT NULL,
    `refund`           tinyint(4)                           NOT NULL,
    `jarimerefund`     int(11)                              NOT NULL,
    `daterefund`       varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `user_id_refund`   int(11)                              NOT NULL,
    `user_type_refund` varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `ticketrefund`     tinyint(4)                           NOT NULL,
    `refundprice`      int(11)                              NOT NULL,
    `rpnr`             varchar(100) COLLATE utf8_persian_ci          DEFAULT '',
    `rfood`            tinyint(4)                                    DEFAULT 0,
    `cardata`          text COLLATE utf8_persian_ci                  DEFAULT NULL,
    `est_status`       tinyint(2)                           NOT NULL DEFAULT 0
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


ALTER TABLE `train_passengers_eshteraki`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`),
    ADD KEY `name` (`name`),
    ADD KEY `family` (`family`),
    ADD KEY `ename` (`ename`),
    ADD KEY `efamily` (`efamily`),
    ADD KEY `nid` (`nid`),
    ADD KEY `user_id` (`user_id`);

ALTER TABLE `train_passengers_eshteraki`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



CREATE TABLE `respina_tickets_hotel_eshteraki`
(
    `id`                       bigint(20) UNSIGNED                                    NOT NULL,
    `regdate`                  bigint(20)                                                      DEFAULT NULL,
    `orderId`                  varchar(200)                                                    DEFAULT NULL COMMENT 'شماره آیدی رسم سفر',
    `numberp`                  varchar(50)                                                     DEFAULT '1' COMMENT 'تعداد نفرات',
    `ip`                       varchar(20)                                                     DEFAULT NULL,
    `hotelId`                  varchar(20)                                                     DEFAULT NULL COMMENT 'آیدی هتل',
    `cityName`                 varchar(100)                                                    DEFAULT NULL COMMENT 'شهر هتل',
    `hotelStar`                varchar(10)                                                     DEFAULT NULL COMMENT 'تعداد ستاره هتل',
    `hotelAddress`             varchar(500)                                                    DEFAULT NULL COMMENT 'آدرس هتل',
    `hotelEmail`               varchar(150)                                                    DEFAULT NULL COMMENT 'ایمیل هتل',
    `paymentDeadline`          bigint(20)                                                      DEFAULT NULL COMMENT 'مدت زمان تا زمان پرداخت',
    `price`                    int(20)                                                         DEFAULT NULL,
    `fprice`                   int(11)                                                         DEFAULT NULL,
    `discount`                 int(11)                                                         DEFAULT NULL COMMENT 'تخفیف',
    `finalprice`               int(11)                                                         DEFAULT NULL,
    `markup`                   varchar(10)                                                     DEFAULT NULL COMMENT 'مارک آپ که تو تنظیمات بوده',
    `profit`                   int(11)                                                         DEFAULT NULL COMMENT 'سود',
    `status`                   tinyint(4)                                                      DEFAULT NULL,
    `mobile`                   varchar(20)                                                     DEFAULT NULL COMMENT 'موبایل مسافر',
    `email`                    varchar(100)                                                    DEFAULT NULL COMMENT 'ایمیل مسافر',
    `emailed`                  tinyint(4)                                                      DEFAULT NULL COMMENT 'ایمیل شده یا نه',
    `error`                    varchar(300)                                                    DEFAULT NULL COMMENT 'کد ارور خودم',
    `error_msg`                varchar(300)                                                    DEFAULT NULL COMMENT 'متن ارور خودم',
    `salesby`                  varchar(150)                                                    DEFAULT NULL,
    `device`                   varchar(150)                                                    DEFAULT NULL,
    `os`                       varchar(150)                                                    DEFAULT NULL,
    `browser`                  varchar(150)                                                    DEFAULT NULL,
    `paymentID`                int(11)                                                         DEFAULT NULL,
    `payment_status`           tinyint(4)                                                      DEFAULT 0,
    `payment_rand`             varchar(20)                                                     DEFAULT NULL,
    `webservice_error`         varchar(1000)                                                   DEFAULT NULL,
    `msgRasmesafar`            text                                                            DEFAULT NULL COMMENT 'msg رسم سفر',
    `steps`                    text                                                            DEFAULT NULL COMMENT 'مراحل خرید',
    `user_id`                  int(20)                                                         DEFAULT NULL,
    `user_name`                varchar(200)                                                    DEFAULT NULL,
    `user_cellphone`           varchar(50)                                                     DEFAULT NULL COMMENT 'شماره خریدار از سشن',
    `tickets_paydescribe`      text                                                            DEFAULT NULL,
    `payment_type`             int(20)                                                         DEFAULT NULL,
    `payment_kind`             varchar(20)                                                     DEFAULT NULL,
    `backlink`                 varchar(300)                                                    DEFAULT NULL COMMENT 'طرف از کجا اومده تو سایت',
    `roomId`                   varchar(15)                                                     DEFAULT NULL COMMENT 'آیدی اتاق',
    `roomCount`                int(11)                                                         DEFAULT 1,
    `extraPerson`              varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'نفر اضافه',
    `totalPrice`               int(20)                                                         DEFAULT NULL COMMENT 'قیمت وب سرویس',
    `phone`                    varchar(20)                                                     DEFAULT NULL,
    `inDate`                   varchar(20)                                                     DEFAULT NULL COMMENT 'تاریخ رزرو',
    `description`              varchar(200)                                                    DEFAULT NULL COMMENT 'توضیحات',
    `trackingCode`             varchar(1000)                                                   DEFAULT NULL COMMENT 'کد پیگیری ',
    `reservationStatus`        varchar(300)                                                    DEFAULT NULL COMMENT 'reservationStatus from  web service ',
    `reservationMessage`       varchar(300)                                                    DEFAULT NULL COMMENT 'reservationMessage from web service ',
    `hotelNameFa`              varchar(100)                                                    DEFAULT NULL COMMENT 'hotelNameFa from web service',
    `hotelDescription`         text                                                            DEFAULT NULL COMMENT 'توضیحات هتل',
    `nid`                      varchar(20)                                                     DEFAULT NULL COMMENT 'کد ملی مسافر',
    `nationality`              varchar(10) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL,
    `nationalitycode`          varchar(10) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL,
    `meliat`                   tinyint(4)                                                      DEFAULT 1,
    `name`                     varchar(150)                                                    DEFAULT NULL COMMENT 'نام مسافر',
    `family`                   varchar(35)                                                     DEFAULT NULL COMMENT 'فامیل مسافر',
    `ename`                    varchar(30)                                                     DEFAULT NULL COMMENT 'نام انگلیسی مسافر',
    `efamily`                  varchar(30)                                                     DEFAULT NULL COMMENT 'نام فارسی مسافر',
    `roomFullBoard`            varchar(10)                                                     DEFAULT NULL COMMENT 'اتاق فول برد هست یا نه',
    `priceHamkar`              int(10) UNSIGNED                                                DEFAULT NULL COMMENT 'قیمت همکار',
    `priceBoard`               int(10) UNSIGNED                                                DEFAULT NULL COMMENT 'قیمت برد',
    `priceExtraPerson`         int(10) UNSIGNED                                                DEFAULT NULL COMMENT 'قیمت نفر اضافه برای اتاق',
    `roomPersons`              tinyint(4)                                                      DEFAULT NULL COMMENT 'تعداد نفرات اتاق',
    `roomBeds`                 tinyint(4)                                                      DEFAULT NULL COMMENT 'تعداد تخت اتاق',
    `numberOfNights`           tinyint(4)                                                      DEFAULT NULL COMMENT 'تعداد شب اقامت',
    `hotelName`                varchar(150)                                                    DEFAULT NULL,
    `roomDoubleBeds`           tinyint(4)                                                      DEFAULT NULL COMMENT 'تعداد تخت دوبل',
    `roomExtraPerson`          tinyint(4)                                                      DEFAULT NULL COMMENT 'تعداد نفر اضافی اتاق',
    `roomOnlineReservation`    tinyint(4)                                                      DEFAULT NULL,
    `roomNameFa`               varchar(100)                                                    DEFAULT NULL COMMENT 'نام اتاق',
    `hotelLatitude`            varchar(100)                                                    DEFAULT NULL COMMENT 'موقعیت هتل عرض',
    `hotelLongitude`           varchar(100)                                                    DEFAULT NULL COMMENT 'موقعیت هتل طول',
    `roomSingleBeds`           tinyint(20)                                                     DEFAULT NULL COMMENT 'نام اتاق ',
    `onlineReservation`        varchar(100)                                                    DEFAULT NULL COMMENT 'اتاقی که رزرو شده آنلاین رزرو بوده',
    `requestReserve`           text                                                            DEFAULT NULL COMMENT 'پارامترهایی که به رسم سفر رفته',
    `responseReserve`          text                                                            DEFAULT NULL COMMENT 'پاسخ هایی که از رسم سفر گرفته',
    `requestPayment`           text                                                            DEFAULT NULL,
    `responsePayment`          text                                                            DEFAULT NULL,
    `HotelApiType`             varchar(30)                                                     DEFAULT NULL COMMENT 'از کدوم وب سرویس خریده',
    `pidtype`                  varchar(100)                                                    DEFAULT NULL,
    `unuse1`                   int(11)                                                         DEFAULT NULL,
    `unuse3`                   int(11)                                                         DEFAULT NULL,
    `unused4`                  int(11)                                                         DEFAULT NULL,
    `esrequest_status`         tinyint(1)                                                      DEFAULT NULL,
    `esrequest_date`           bigint(20)                                                      DEFAULT NULL,
    `esrequest_type`           tinyint(1)                                                      DEFAULT NULL,
    `esrequest_reason`         tinyint(1)                                                      DEFAULT NULL,
    `esrequest_numberOfNights` int(11)                                                NOT NULL,
    `esrequest_fromDate`       bigint(20)                                             NOT NULL,
    `esrequest_toDate`         bigint(20)                                             NOT NULL,
    `esrequest_adminId`        int(11)                                                NOT NULL,
    `esrequest_price`          int(11)                                                NOT NULL,
    `esrequest_paytype`        int(1)                                                 NOT NULL DEFAULT 0,
    `eskargozar_price`         int(11)                                                NOT NULL,
    `eskargozar_statusprice`   tinyint(1)                                             NOT NULL DEFAULT 1,
    `eskargozar_date`          varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `discountCode`             varchar(50)                                                     DEFAULT NULL,
    `discountCodeAmount`       varchar(50)                                                     DEFAULT NULL,
    `roomApiType`              int(11)                                                         DEFAULT 2 COMMENT 'اتاق مال کدوم وب سرویسه 1 حامی | 2 اقامت 24',
    `capacityId`               int(11)                                                         DEFAULT NULL COMMENT 'آیدی ظرفیت',
    `capacityRoomSaleType`     varchar(200)                                                    DEFAULT NULL COMMENT 'نوع فروش اتاق چه طوری بوده',
    `capacitySelf`             tinyint(4)                                                      DEFAULT NULL COMMENT 'آیا مال خودش بوده این اتاق یا نه',
    `roomBreakfast`            tinyint(4)                                                      DEFAULT NULL COMMENT 'آیا اتاق مورد نظر صبونه میده',
    `roomLunch`                tinyint(4)                                                      DEFAULT NULL COMMENT 'آیا اتاق مورد نظر ناهار میده',
    `roomDinner`               tinyint(4)                                                      DEFAULT NULL COMMENT 'آیا اتاق مورد نظر شام میده',
    `needToConfirmId`          int(11)                                                         DEFAULT NULL COMMENT 'آیدی needToConfirm in hotel_needToConfirm',
    `needToConfirmStatus`      varchar(200)                                                    DEFAULT NULL COMMENT 'آیدی needToConfirmStatus in hotel_needToConfirm',
    `sendSmsDenyOrAccept`      tinyint(4)                                                      DEFAULT NULL COMMENT 'آیا اس ام اس ارسال شده',
    `hotelCityName`            varchar(150)                                                    DEFAULT NULL,
    `needToConfirmSecond`      int(11)                                                         DEFAULT NULL,
    `capacityCommission`       int(11)                                                         DEFAULT NULL,
    `dateStartMiladi`          date                                                            DEFAULT NULL,
    `dateEndMiladi`            date                                                            DEFAULT NULL,
    `provides_by`              text                                                            DEFAULT NULL,
    `flagapi`                  tinyint(4)                                                      DEFAULT NULL COMMENT '1 if request from webservice (tour)',
    `user_rank`                tinyint(1)                                                      DEFAULT NULL,
    `reminder_sms_status`      tinyint(2)                                                      DEFAULT NULL,
    `lottery`                  text                                                            DEFAULT NULL,
    `capacityNeedReserveAdmin` tinyint(4)                                                      DEFAULT NULL COMMENT 'capacityNeedReserveAdmin in hotel_caapcity must updated if change in rasmesafar',
    `buyhand_id`               int(11)                                                         DEFAULT NULL,
    `go_transfer_vehicle`      varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT '',
    `go_transfer_hour`         varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT '',
    `go_transfer_number`       varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT '',
    `return_transfer_vehicle`  varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT '',
    `return_transfer_hour`     varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT '',
    `return_transfer_number`   varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT '',
    `esrequest_lock`           int(1)                                                 NOT NULL DEFAULT 0,
    `esrequest_datetakmil`     varchar(50)                                                     DEFAULT NULL,
    `esrequest_description`    text                                                            DEFAULT NULL,
    `esrequest_changeRoom`     tinyint(1)                                                      DEFAULT NULL,
    `esrequest_selectRoom`     varchar(100)                                                    DEFAULT NULL,
    `esrequest_transfer`       tinyint(1)                                                      DEFAULT NULL,
    `sendVoteSms`              tinyint(1)                                                      DEFAULT 0,
    `sendsmslink`              tinyint(1)                                                      DEFAULT 0,
    `is_tour`                  int(11)                                                         DEFAULT 0,
    `sendSmsPayment`           tinyint(1)                                                      DEFAULT 0,
    `priceapi`                 int(11)                                                         DEFAULT NULL,
    `profitapi`                int(11)                                                         DEFAULT NULL,
    `tafzilprovider`           int(11)                                                         DEFAULT NULL,
    `logSanad`                 text                                                            DEFAULT '',
    `totalDiscount`            varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT '',
    `typeService`              varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT 'hotelD',
    `tafzilTarafHesab`         int(11)                                                         DEFAULT 0,
    `tafzilHazine`             int(11)                                                         DEFAULT 0,
    `tafzilDaramad`            int(11)                                                         DEFAULT 0,
    `hamiSegment`              int(11)                                                         DEFAULT 0,
    `providerSegment`          int(11)                                                         DEFAULT 0,
    `provider`                 varchar(150) CHARACTER SET utf8 COLLATE utf8_persian_ci         DEFAULT NULL,
    `serviceProviderTypeId`    int(11)                                                         DEFAULT NULL,
    `hesabSood`                int(11)                                                         DEFAULT NULL,
    `statusSanad`              tinyint(1)                                             NOT NULL DEFAULT 0,
    `salesDaftarRuzname`       varchar(500)                                                    DEFAULT NULL,
    `smsDaftarRuzname`         varchar(500)                                                    DEFAULT NULL,
    `paymentDaftarRuzname`     varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci         DEFAULT NULL,
    `hesabdariID`              int(11)                                                         DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='لیست خرید های هتل داخلی';


ALTER TABLE `respina_tickets_hotel_eshteraki`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `orderId` (`orderId`) USING BTREE,
    ADD KEY `regdate` (`regdate`),
    ADD KEY `paymentID` (`paymentID`),
    ADD KEY `sendVoteSms` (`sendVoteSms`);


ALTER TABLE `respina_tickets_hotel_eshteraki`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;



CREATE TABLE `respina_passengers_hotel_eshteraki`
(
    `id`               bigint(20)                                              NOT NULL,
    `ticket_id`        varchar(50) CHARACTER SET latin1                                 DEFAULT NULL,
    `name`             varchar(150)                                                     DEFAULT NULL,
    `family`           varchar(30)                                                      DEFAULT NULL,
    `ename`            varchar(30)                                                      DEFAULT NULL,
    `efamily`          varchar(30)                                                      DEFAULT NULL,
    `regdate`          varchar(50) CHARACTER SET latin1                                 DEFAULT NULL,
    `email`            varchar(100) CHARACTER SET latin1                                DEFAULT NULL,
    `price`            varchar(50) CHARACTER SET latin1                                 DEFAULT NULL,
    `fprice`           varchar(50) CHARACTER SET latin1                                 DEFAULT NULL,
    `finalprice`       varchar(50) CHARACTER SET latin1                                 DEFAULT NULL,
    `mobile`           varchar(20) CHARACTER SET latin1                                 DEFAULT NULL,
    `gender`           tinyint(4)                                                       DEFAULT NULL,
    `nid`              varchar(30)                                                      DEFAULT NULL,
    `type`             varchar(10)                                                      DEFAULT NULL,
    `nationality`      varchar(10)                                                      DEFAULT NULL,
    `nationalitycode`  varchar(10) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `meliat`           tinyint(4)                                                       DEFAULT 1,
    `user_id`          int(15)                                                          DEFAULT NULL,
    `discount`         tinyint(4)                                                       DEFAULT NULL,
    `refund`           tinyint(4)                                                       DEFAULT NULL,
    `jarimerefund`     int(11)                                                          DEFAULT NULL,
    `pnrrefund`        varchar(40)                                                      DEFAULT NULL,
    `daterefund`       varchar(50)                                                      DEFAULT NULL,
    `user_id_refund`   int(15)                                                          DEFAULT NULL,
    `user_type_refund` varchar(100)                                                     DEFAULT NULL,
    `pricejarime`      int(11)                                                          DEFAULT NULL,
    `refundprice`      int(11)                                                          DEFAULT NULL,
    `esrequest_select` tinyint(1)                                              NOT NULL DEFAULT 0,
    `esrequest_name`   varchar(150) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `esrequest_family` varchar(30) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `esrequest_nid`    varchar(30)                                             NOT NULL,
    `expdate`          varchar(30) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT ''
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


ALTER TABLE `respina_passengers_hotel_eshteraki`
    ADD PRIMARY KEY (`id`),
    ADD KEY `enameIndexs` (`ename`),
    ADD KEY `efamilyIndexe` (`efamily`),
    ADD KEY `familyIndex` (`family`),
    ADD KEY `regdate` (`regdate`),
    ADD KEY `user_id` (`user_id`),
    ADD KEY `ticket_id` (`ticket_id`);


ALTER TABLE `respina_passengers_hotel_eshteraki`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;



CREATE TABLE `respina_tickets_hotel_kh_eshteraki`
(
    `id`                       bigint(11)                                              NOT NULL,
    `city_name`                varchar(120)                                                     DEFAULT NULL,
    `country_name`             varchar(120)                                                     DEFAULT NULL,
    `regdate`                  varchar(20)                                                      DEFAULT NULL,
    `searchId`                 varchar(200)                                                     DEFAULT NULL,
    `orderId`                  varchar(200)                                                     DEFAULT NULL,
    `vatNumber`                varchar(50)                                                      DEFAULT NULL,
    `supplierName`             varchar(50)                                                      DEFAULT NULL,
    `board`                    varchar(200)                                                     DEFAULT '',
    `ip`                       varchar(20)                                                      DEFAULT NULL,
    `nationality`              varchar(50)                                                      DEFAULT NULL,
    `rooms`                    tinyint(2)                                                       DEFAULT NULL,
    `rooms_result`             text                                                             DEFAULT NULL,
    `hotelId`                  varchar(20)                                                      DEFAULT NULL,
    `hotelName`                varchar(50)                                                      DEFAULT NULL,
    `hotelRating`              varchar(10)                                                      DEFAULT NULL,
    `hotelAddress`             varchar(50)                                                      DEFAULT NULL,
    `hotelEmail`               varchar(50)                                                      DEFAULT NULL,
    `hotelUrl`                 varchar(50)                                                      DEFAULT NULL,
    `hotelPhone`               varchar(50)                                                      DEFAULT NULL,
    `hotelFax`                 varchar(50)                                                      DEFAULT NULL,
    `paymentDeadline`          varchar(50)                                                      DEFAULT NULL,
    `night`                    tinyint(2)                                                       DEFAULT NULL,
    `checkin`                  varchar(20)                                                      DEFAULT NULL,
    `checkout`                 varchar(20)                                                      DEFAULT NULL,
    `price`                    int(11)                                                 NOT NULL,
    `fprice`                   int(11)                                                 NOT NULL,
    `finalprice`               int(11)                                                 NOT NULL,
    `status`                   tinyint(3)                                              NOT NULL,
    `mobile`                   varchar(15)                                             NOT NULL,
    `email`                    varchar(125)                                            NOT NULL,
    `emailed`                  tinyint(1)                                              NOT NULL,
    `api`                      varchar(10)                                             NOT NULL,
    `numberp`                  tinyint(2)                                              NOT NULL,
    `error`                    text                                                    NOT NULL,
    `code_error`               tinyint(3)                                              NOT NULL,
    `adl`                      tinyint(2)                                                       DEFAULT NULL,
    `chd`                      tinyint(2)                                                       DEFAULT NULL,
    `inf`                      tinyint(2)                                                       DEFAULT NULL,
    `salesby`                  varchar(50)                                                      DEFAULT '',
    `device`                   varchar(50)                                                      DEFAULT '',
    `os`                       varchar(50)                                                      DEFAULT '',
    `browser`                  varchar(50)                                                      DEFAULT '',
    `paymentID`                int(11)                                                 NOT NULL,
    `payment_status`           tinyint(4)                                              NOT NULL,
    `payment_rand`             varchar(10)                                             NOT NULL,
    `webservice_error`         text                                                    NOT NULL,
    `user_id`                  int(11)                                                 NOT NULL,
    `user_name`                varchar(100)                                            NOT NULL,
    `tickets_paydescribe`      text                                                    NOT NULL,
    `ReservationItems`         text                                                    NOT NULL,
    `namep1`                   varchar(100)                                            NOT NULL,
    `payment_type`             tinyint(2)                                              NOT NULL,
    `discount`                 int(11)                                                 NOT NULL,
    `markup`                   int(8)                                                  NOT NULL,
    `credit`                   int(11)                                                 NOT NULL,
    `payment_kind`             varchar(10)                                             NOT NULL,
    `pidtype`                  varchar(10)                                                      DEFAULT NULL,
    `refund`                   tinyint(4)                                              NOT NULL,
    `backlink`                 varchar(400) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `sessionId`                varchar(100)                                                     DEFAULT NULL,
    `roomInfo`                 varchar(1000)                                                    DEFAULT NULL,
    `esrequest_status`         tinyint(1)                                                       DEFAULT NULL,
    `esrequest_date`           varchar(20)                                                      DEFAULT NULL,
    `esrequest_type`           tinyint(1)                                                       DEFAULT NULL,
    `esrequest_reason`         tinyint(1)                                                       DEFAULT NULL,
    `esrequest_numberOfNights` tinyint(3)                                                       DEFAULT NULL,
    `esrequest_fromDate`       varchar(20)                                                      DEFAULT NULL,
    `esrequest_toDate`         varchar(20)                                                      DEFAULT NULL,
    `esrequest_adminId`        int(11)                                                          DEFAULT NULL,
    `esrequest_price`          int(11)                                                          DEFAULT NULL,
    `esrequest_paytype`        tinyint(1)                                              NOT NULL DEFAULT 0,
    `eskargozar_price`         int(11)                                                 NOT NULL,
    `eskargozar_statusprice`   tinyint(1)                                              NOT NULL DEFAULT 1,
    `eskargozar_date`          varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `discountCode`             varchar(50)                                                      DEFAULT NULL,
    `discountCodeAmount`       varchar(50)                                                      DEFAULT NULL,
    `api_type`                 varchar(30)                                                      DEFAULT NULL,
    `user_rank`                tinyint(1)                                                       DEFAULT NULL,
    `reminder_sms_status`      tinyint(2)                                                       DEFAULT NULL,
    `lottery`                  text                                                             DEFAULT NULL,
    `hotelPolicies`            text CHARACTER SET utf8 COLLATE utf8_persian_ci                  DEFAULT NULL,
    `timeArrival`              varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `provider`                 varchar(100)                                                     DEFAULT NULL,
    `serviceProviderTypeId`    int(11)                                                          DEFAULT NULL,
    `hesabSood`                int(11)                                                          DEFAULT NULL,
    `confirm_buy`              tinyint(1)                                                       DEFAULT 0,
    `Alerts`                   text CHARACTER SET utf8 COLLATE utf8_persian_ci                  DEFAULT NULL,
    `buyhand_id`               int(11)                                                          DEFAULT NULL,
    `esrequest_description`    text CHARACTER SET utf8 COLLATE utf8_persian_ci                  DEFAULT NULL,
    `esrequest_datetakmil`     varchar(50)                                                      DEFAULT NULL,
    `priceapi`                 int(11)                                                          DEFAULT NULL,
    `profitapi`                int(11)                                                          DEFAULT NULL,
    `tafzilprovider`           int(11)                                                          DEFAULT NULL,
    `logSanad`                 text                                                             DEFAULT '',
    `totalDiscount`            varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT '',
    `typeService`              varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT 'hotelI',
    `tafzilTarafHesab`         int(11)                                                          DEFAULT 0,
    `tafzilHazine`             int(11)                                                          DEFAULT 0,
    `tafzilDaramad`            int(11)                                                          DEFAULT 0,
    `hamiSegment`              int(11)                                                          DEFAULT 0,
    `providerSegment`          int(11)                                                          DEFAULT 0,
    `profit`                   int(11)                                                          DEFAULT 0,
    `statusSanad`              tinyint(1)                                              NOT NULL DEFAULT 0,
    `salesDaftarRuzname`       varchar(500)                                                     DEFAULT NULL,
    `smsDaftarRuzname`         varchar(500)                                                     DEFAULT NULL,
    `paymentDaftarRuzname`     varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL,
    `hesabdariID`              int(11)                                                          DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


ALTER TABLE `respina_tickets_hotel_kh_eshteraki`
    ADD PRIMARY KEY (`id`),
    ADD KEY `orderId` (`orderId`),
    ADD KEY `regdate` (`regdate`),
    ADD KEY `status` (`status`),
    ADD KEY `numberp` (`numberp`),
    ADD KEY `mobile` (`mobile`),
    ADD KEY `paymentID` (`paymentID`),
    ADD KEY `refund` (`refund`),
    ADD KEY `emailed` (`emailed`),
    ADD KEY `user_id` (`user_id`),
    ADD KEY `user_id_2` (`user_id`),
    ADD KEY `user_id_3` (`user_id`);


ALTER TABLE `respina_tickets_hotel_kh_eshteraki`
    MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;



CREATE TABLE `respina_passengers_hotel_kh_eshteraki`
(
    `id`               int(11)        NOT NULL,
    `ticket_id`        bigint(11)     NOT NULL,
    `name`             varchar(100)   NOT NULL,
    `family`           varchar(100)   NOT NULL,
    `title`            varchar(10)             DEFAULT NULL,
    `nationality`      varchar(10)             DEFAULT NULL,
    `passport_number`  varchar(50)             DEFAULT NULL,
    `type`             varchar(7)     NOT NULL,
    `age`              tinyint(2)              DEFAULT NULL,
    `room`             tinyint(2)              DEFAULT NULL,
    `price`            int(11)        NOT NULL,
    `fprice`           int(11)        NOT NULL,
    `finalprice`       decimal(10, 0) NOT NULL,
    `tktinfo`          text           NOT NULL,
    `user_id`          int(11)                 DEFAULT NULL,
    `esrequest_select` tinyint(1)     NOT NULL DEFAULT 0
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


ALTER TABLE `respina_passengers_hotel_kh_eshteraki`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ind1` (`ticket_id`) USING BTREE,
    ADD KEY `user_id` (`user_id`),
    ADD KEY `name` (`name`),
    ADD KEY `family` (`family`);


ALTER TABLE `respina_passengers_hotel_kh_eshteraki`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



CREATE TABLE `respina_tickets_train_kh_eshteraki`
(
    `id`                    int(11)                                                 NOT NULL,
    `regdate`               varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `searchId`              varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `followId`              varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `eticket`               varchar(100) CHARACTER SET utf8                                  DEFAULT NULL,
    `orderId`               VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `ip`                    varchar(20) CHARACTER SET utf8                                   DEFAULT NULL,
    `from`                  varchar(15) CHARACTER SET utf8                                   DEFAULT NULL,
    `to`                    varchar(15) CHARACTER SET utf8                                   DEFAULT NULL,
    `price`                 int(20)                                                          DEFAULT NULL,
    `fprice`                int(11)                                                          DEFAULT NULL,
    `finalprice`            decimal(10, 0)                                                   DEFAULT NULL,
    `tdate`                 date                                                             DEFAULT NULL,
    `ttime`                 varchar(10) CHARACTER SET utf8                                   DEFAULT NULL,
    `status`                tinyint(3)                                                       DEFAULT NULL,
    `code`                  varchar(10) CHARACTER SET utf8                                   DEFAULT '',
    `operator`              varchar(15) CHARACTER SET utf8                                   DEFAULT NULL,
    `mobile`                varchar(15) CHARACTER SET utf8                                   DEFAULT NULL,
    `email`                 varchar(125) CHARACTER SET utf8                                  DEFAULT NULL,
    `emailed`               tinyint(1)                                                       DEFAULT 0,
    `class`                 varchar(20) CHARACTER SET utf8                                   DEFAULT NULL,
    `api`                   varchar(10) CHARACTER SET utf8                                   DEFAULT NULL,
    `numberp`               tinyint(2)                                                       DEFAULT NULL,
    `error`                 text CHARACTER SET utf8                                          DEFAULT NULL,
    `code_error`            tinyint(4)                                                       DEFAULT NULL,
    `salesby`               varchar(50) CHARACTER SET utf8                                   DEFAULT '',
    `device`                varchar(50) CHARACTER SET utf8                                   DEFAULT '',
    `os`                    varchar(50) CHARACTER SET utf8                                   DEFAULT '',
    `browser`               varchar(50) CHARACTER SET utf8                                   DEFAULT '',
    `adl`                   tinyint(2)                                                       DEFAULT NULL,
    `chd`                   tinyint(2)                                                       DEFAULT NULL,
    `inf`                   tinyint(2)                                                       DEFAULT NULL,
    `paymentID`             int(11)                                                          DEFAULT NULL,
    `payment_status`        tinyint(4)                                                       DEFAULT NULL,
    `payment_rand`          varchar(10) CHARACTER SET utf8                          NOT NULL,
    `webservice_error`      text CHARACTER SET utf8                                          DEFAULT NULL,
    `apilist_id`            int(11)                                                          DEFAULT NULL,
    `user_id`               int(11)                                                          DEFAULT NULL,
    `user_name`             varchar(100) CHARACTER SET utf8                                  DEFAULT NULL,
    `tickets_paydescribe`   text CHARACTER SET utf8                                          DEFAULT NULL,
    `ReservationItems`      text CHARACTER SET utf8                                          DEFAULT NULL,
    `operatorDescription`   varchar(300) CHARACTER SET utf8                                  DEFAULT NULL,
    `user_cellphone`        varchar(12) CHARACTER SET utf8                                   DEFAULT NULL,
    `namep1`                varchar(100) CHARACTER SET utf8                                  DEFAULT NULL,
    `payment_type`          tinyint(2)                                                       DEFAULT NULL,
    `discount`              int(11)                                                          DEFAULT NULL,
    `discount_id`           int(11)                                                          DEFAULT NULL,
    `markup`                int(11)                                                          DEFAULT 0,
    `credit`                int(11)                                                          DEFAULT 0,
    `payment_kind`          varchar(10) CHARACTER SET utf8                                   DEFAULT '',
    `pidtype`               varchar(10) CHARACTER SET utf8                                   DEFAULT NULL,
    `refund`                tinyint(4)                                                       DEFAULT 0,
    `tripType`              tinyint(1)                                                       DEFAULT NULL,
    `redate`                date                                                             DEFAULT NULL,
    `retime`                varchar(10) CHARACTER SET utf8                                   DEFAULT NULL,
    `recode`                varchar(10) CHARACTER SET utf8                                   DEFAULT '',
    `reoperator`            varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `apiResult`             text CHARACTER SET utf8                                          DEFAULT NULL,
    `legs`                  text CHARACTER SET utf8                                          DEFAULT NULL,
    `baggage`               text CHARACTER SET utf8                                          DEFAULT NULL,
    `sessionId`             varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `refundstatus`          tinyint(4)                                                       DEFAULT NULL,
    `refunddate`            varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `discountCode`          varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `discountCodeAmount`    varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `user_rank`             tinyint(1)                                                       DEFAULT NULL,
    `lottery`               text CHARACTER SET utf8                                          DEFAULT NULL,
    `backlink`              varchar(400) CHARACTER SET utf8                                  DEFAULT NULL,
    `provider`              varchar(100) CHARACTER SET utf8                                  DEFAULT NULL,
    `serviceProviderTypeId` int(11)                                                          DEFAULT NULL,
    `hesabSood`             int(11)                                                          DEFAULT NULL,
    `priceapi`              int(11)                                                          DEFAULT NULL,
    `profitapi`             int(11)                                                          DEFAULT NULL,
    `tafzilprovider`        int(11)                                                          DEFAULT NULL,
    `logSanad`              text                                                             DEFAULT '',
    `totalDiscount`         varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT '',
    `typeService`           varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT 'trainI',
    `tafzilTarafHesab`      int(11)                                                          DEFAULT 0,
    `tafzilHazine`          int(11)                                                          DEFAULT 0,
    `tafzilDaramad`         int(11)                                                          DEFAULT 0,
    `hamiSegment`           int(11)                                                          DEFAULT 0,
    `providerSegment`       int(11)                                                          DEFAULT 0,
    `profit`                int(11)                                                          DEFAULT 0,
    `statusSanad`           tinyint(1)                                              NOT NULL DEFAULT 0,
    `salesDaftarRuzname`    varchar(500)                                                     DEFAULT NULL,
    `smsDaftarRuzname`      varchar(500)                                                     DEFAULT NULL,
    `paymentDaftarRuzname`  varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


ALTER TABLE `respina_tickets_train_kh_eshteraki`
    ADD PRIMARY KEY (`id`),
    ADD KEY `user_id` (`user_id`),
    ADD KEY `regdate` (`regdate`),
    ADD KEY `followId` (`followId`),
    ADD KEY `status` (`status`),
    ADD KEY `eticket` (`eticket`),
    ADD KEY `numberp` (`numberp`),
    ADD KEY `mobile` (`mobile`),
    ADD KEY `paymentID` (`paymentID`),
    ADD KEY `refund` (`refund`),
    ADD KEY `emailed` (`emailed`);


ALTER TABLE `respina_tickets_train_kh_eshteraki`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



CREATE TABLE `respina_passengers_train_kh_eshteraki`
(
    `id`                  int(11)                         NOT NULL,
    `ticket_id`           int(11)                         NOT NULL,
    `gender`              tinyint(4)                      NOT NULL,
    `name`                varchar(100) CHARACTER SET utf8 DEFAULT NULL,
    `family`              varchar(100) CHARACTER SET utf8 DEFAULT NULL,
    `ename`               varchar(100) CHARACTER SET utf8 DEFAULT NULL,
    `efamily`             varchar(100) CHARACTER SET utf8 DEFAULT NULL,
    `nid`                 varchar(50) CHARACTER SET utf8  NOT NULL,
    `dob`                 varchar(10) CHARACTER SET utf8  NOT NULL,
    `type`                varchar(7) CHARACTER SET utf8   NOT NULL,
    `price`               int(11)                         NOT NULL,
    `fprice`              int(11)                         NOT NULL,
    `finalprice`          decimal(10, 0)                  NOT NULL,
    `nationality`         varchar(10) CHARACTER SET utf8  NOT NULL,
    `passport_issue_date` date                            DEFAULT NULL,
    `expdate`             date                            NOT NULL,
    `vilcher`             tinyint(4)                      NOT NULL,
    `ticket_number`       varchar(100) CHARACTER SET utf8 NOT NULL,
    `tktinfo`             text CHARACTER SET utf8         NOT NULL,
    `passport_number`     varchar(100) CHARACTER SET utf8 NOT NULL,
    `user_id`             int(11)                         NOT NULL,
    `refund`              tinyint(4)                      NOT NULL,
    `jarimerefund`        int(11)                         NOT NULL,
    `daterefund`          varchar(100) CHARACTER SET utf8 NOT NULL,
    `user_id_refund`      int(11)                         NOT NULL,
    `user_type_refund`    varchar(100) CHARACTER SET utf8 NOT NULL,
    `ticketrefund`        tinyint(4)                      NOT NULL,
    `refundprice`         int(11)                         NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


ALTER TABLE `respina_passengers_train_kh_eshteraki`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ind1` (`ticket_id`) USING BTREE,
    ADD KEY `ticket_id` (`ticket_id`),
    ADD KEY `user_id` (`user_id`),
    ADD KEY `name` (`name`),
    ADD KEY `family` (`family`),
    ADD KEY `ename` (`ename`),
    ADD KEY `efamily` (`efamily`),
    ADD KEY `nid` (`nid`),
    ADD KEY `passport_number` (`passport_number`);


ALTER TABLE `respina_passengers_train_kh_eshteraki`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



CREATE TABLE `respina_tickets_tourism_eshteraki`
(
    `id`                   int(20)                             NOT NULL,
    `regdate`              int(11)                             NOT NULL COMMENT 'تاریخ ثبت درخواست',
    `api_ticket_id`        int(11)                                      DEFAULT NULL COMMENT 'آیدی درخواست در رسم سفر',
    `user_id`              int(11)                             NOT NULL COMMENT 'آیدی کاربر ثبت کننده',
    `user_name`            varchar(50) COLLATE utf8_persian_ci NOT NULL COMMENT 'نام کاربر ثبت کننده',
    `user_level`           tinyint(1)                          NOT NULL COMMENT 'سطح دسترسی کاربر',
    `user_mobile`          varchar(10) COLLATE utf8_persian_ci NOT NULL COMMENT 'شماره موبایل کاربر',
    `status`               tinyint(1)                          NOT NULL DEFAULT 1 COMMENT 'وضعیت درخواست (1-ثبت 2-آماده 3-موفق)',
    `numberp`              tinyint(4)                          NOT NULL DEFAULT 1 COMMENT 'تعداد مهمان',
    `gender`               varchar(6) COLLATE utf8_persian_ci           DEFAULT NULL COMMENT 'جنسیت مهمان (male,female)',
    `nid`                  varchar(10) COLLATE utf8_persian_ci NOT NULL COMMENT 'کد ملی مهمان ',
    `first_name`           varchar(50) COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'نام مهمان',
    `last_name`            varchar(70) COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'نام خانوادگی مهمان',
    `cellphone`            varchar(10) COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'تلفن همراه مهمان',
    `discount_code`        varchar(10) COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'کد تخفیف',
    `date`                 int(11)                             NOT NULL COMMENT 'تاریخ رزرو (تاریخ استفاده از محصول گردشگری)',
    `date_shamsi`          varchar(10) COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'تاریخ شمسی (yyyy/mm/dd)',
    `product_id`           int(11)                             NOT NULL COMMENT 'آیدی محصول گردشگری',
    `city_name`            varchar(100) COLLATE utf8_persian_ci         DEFAULT NULL COMMENT 'شهر مقصد خدمت گردشگری',
    `service_id`           int(11)                                      DEFAULT NULL COMMENT 'آیدی خدمت گردشگری',
    `service_title`        varchar(100) COLLATE utf8_persian_ci         DEFAULT NULL COMMENT 'عنوان خدمت گردشگری',
    `product_name`         varchar(100) COLLATE utf8_persian_ci         DEFAULT NULL COMMENT 'نام محصول گردشگری',
    `product_time`         varchar(50) COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'ساعت استفاده ازمحصول گردشگری',
    `product_price_adult`  INT(11)                             NULL     DEFAULT NULL COMMENT 'قیمت محصول گردشگری بزرگسال',
    `product_price_child`  INT                                 NULL COMMENT 'قیمت محصول گردشگری کودک',
    `product_price_infant` INT                                 NULL COMMENT 'قیمت محصول گردشگری نوزاد',
    `price`                int(11)                             NOT NULL DEFAULT 0 COMMENT 'قیمت کل',
    `fprice`               int(11)                             NOT NULL DEFAULT 0 COMMENT 'قیمت نهایی',
    `discount`             int(11)                             NOT NULL DEFAULT 0 COMMENT 'تخفیف',
    `finalprice`           int(11)                             NOT NULL DEFAULT 0 COMMENT 'مبلغ قابل پرداخت',
    `markup`               int(11)                                      DEFAULT 0 COMMENT 'روکشی (fprice-price)',
    `profit`               int(11)                                      DEFAULT 0 COMMENT 'سود (finalprice-price)',
    `totalDiscount`        varchar(20) COLLATE utf8_persian_ci          DEFAULT NULL,
    `payment_type`         tinyint(1)                                   DEFAULT NULL COMMENT 'نوع پرداخت',
    `paymentID`            int(11)                                      DEFAULT NULL COMMENT ' شماره سفارش بانک',
    `payment_status`       tinyint(1)                                   DEFAULT 0 COMMENT 'وضعیت پرداخت (0-پرداخت نشده 1-پرداخت شده)',
    `pidtype`              varchar(10) COLLATE utf8_persian_ci          DEFAULT NULL COMMENT ' مالکیت محصول (self,provider)',
    `tafzilprovider`       int(11)                                      DEFAULT NULL COMMENT 'حساب تفضیل تامین کننده',
    `provider`             varchar(100) COLLATE utf8_persian_ci         DEFAULT NULL COMMENT 'سایت حامی تامین کننده',
    `tafzilTarafHesab`     int(11)                                      DEFAULT NULL,
    `tafzilHazine`         int(11)                                      DEFAULT NULL,
    `tafzilDaramad`        int(11)                                      DEFAULT NULL,
    `typeService`          varchar(10) COLLATE utf8_persian_ci          DEFAULT 'tourism',
    `hamiSegment`          int(11)                                      DEFAULT NULL,
    `providerSegment`      int(11)                                      DEFAULT NULL,
    `logSanad`             text COLLATE utf8_persian_ci                 DEFAULT '',
    `tickets_paydescribe`  varchar(2000) COLLATE utf8_persian_ci        DEFAULT NULL COMMENT 'توضیحات پرداخت',
    `payment_kind`         varchar(10) CHARACTER SET utf8               DEFAULT NULL COMMENT 'شیوه پرداخت (self,hami)',
    `error_code`           varchar(100) COLLATE utf8_persian_ci         DEFAULT NULL,
    `api_error`            text COLLATE utf8_persian_ci                 DEFAULT NULL COMMENT 'پیام خطای دریافتی از حامی پرو',
    `error`                text COLLATE utf8_persian_ci                 DEFAULT NULL COMMENT 'خطا',
    `priceapi`             int(11)                                      DEFAULT NULL COMMENT 'سهم تأمین کننده',
    `profitapi`            int(11)                                      DEFAULT NULL COMMENT 'سود API (حامی پرو)',
    `refund`               varchar(3) COLLATE utf8_persian_ci           DEFAULT NULL,
    `refund_date`          varchar(15) COLLATE utf8_persian_ci          DEFAULT NULL,
    `refund_status`        varchar(2) COLLATE utf8_persian_ci           DEFAULT NULL,
    `refund_desc`          varchar(300) COLLATE utf8_persian_ci         DEFAULT NULL,
    `steps_log`            text COLLATE utf8_persian_ci                 DEFAULT NULL,
    `salesby`              varchar(50) COLLATE utf8_persian_ci          DEFAULT NULL,
    `device`               varchar(50) COLLATE utf8_persian_ci          DEFAULT NULL,
    `os`                   varchar(50) COLLATE utf8_persian_ci          DEFAULT NULL,
    `browser`              varchar(50) COLLATE utf8_persian_ci          DEFAULT NULL,
    `webservice_type`      varchar(30) COLLATE utf8_persian_ci          DEFAULT NULL COMMENT 'نام وبسرویس',
    `webservice_reference` int(11)                                      DEFAULT NULL COMMENT 'شناسه رزرو وبسرویس (آیدی جدول رزروهای وبسرویس)',
    `tracking_code`        varchar(200) COLLATE utf8_persian_ci         DEFAULT NULL COMMENT 'کد پیگیری تأمین کننده نهایی',
    `statusSanad`          tinyint(1)                          NOT NULL DEFAULT 0,
    `salesDaftarRuzname`   varchar(500) COLLATE utf8_persian_ci         DEFAULT NULL,
    `smsDaftarRuzname`     varchar(500) COLLATE utf8_persian_ci         DEFAULT NULL,
    `paymentDaftarRuzname` varchar(500) COLLATE utf8_persian_ci         DEFAULT NULL,
    `price_id`             INT                                 NOT NULL,
    `sub_price_id`         INT                                 NOT NULL,
    `adl_count`            INT                                 NOT NULL,
    `chd_count`            INT                                 NOT NULL,
    `inf_count`            INT                                 NOT NULL,
    `sendsmslink`          TINYINT(1)                          NULL     DEFAULT '0',
    `sendSmsPayment`       TINYINT(1)                          NULL     DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci COMMENT ='درخواست های خرید محصول گردشگری';


ALTER TABLE `respina_tickets_tourism_eshteraki`
    ADD PRIMARY KEY (`id`);


ALTER TABLE `respina_tickets_tourism_eshteraki`
    MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;



CREATE TABLE `respina_passengers_tourism_eshteraki`
(
    `id`          int(11)                             NOT NULL,
    `regdate`     varchar(10) COLLATE utf8_persian_ci NOT NULL COMMENT 'تاریخ ثبت',
    `ticket_id`   int(11)                             NOT NULL COMMENT 'آیدی درخواست اصلی (در جدول respina_tickets_tourism)',
    `user_id`     int(11)                               DEFAULT NULL COMMENT 'آیدی کاربر ثبت کننده',
    `nid`         varchar(10) COLLATE utf8_persian_ci NOT NULL COMMENT 'کد ملی',
    `gender`      varchar(6) COLLATE utf8_persian_ci  NOT NULL COMMENT 'جنسیت (male,female)',
    `first_name`  varchar(50) COLLATE utf8_persian_ci   DEFAULT NULL COMMENT 'نام مهمان',
    `last_name`   varchar(70) COLLATE utf8_persian_ci   DEFAULT NULL COMMENT 'نام خانوادگی',
    `nationality` tinyint(1)                            DEFAULT 1 COMMENT 'ملیت (1-ایرانی 2-خارجی)',
    `passport_no` varchar(10) COLLATE utf8_persian_ci   DEFAULT NULL COMMENT 'شماره پاسپورت',
    `age_type`    tinyint(1)                            DEFAULT 1 COMMENT '(1-بزرگسال 2-کودک 3-نوزاد)',
    `ticket_link` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci COMMENT ='مهمان های خدمات گردشگری';


ALTER TABLE `respina_passengers_tourism_eshteraki`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`);


ALTER TABLE `respina_passengers_tourism_eshteraki`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


CREATE TABLE `insurance_saman_register_eshteraki`
(
    `id`                    int(20)                        NOT NULL,
    `ticketid`              varchar(20)                                             DEFAULT NULL,
    `nationalCode`          varchar(20) CHARACTER SET utf8 NOT NULL COMMENT 'کد ملی',
    `persianFirstName`      varchar(80) CHARACTER SET utf8 NOT NULL COMMENT 'نام بیمه گزار',
    `persianLastName`       varchar(200) CHARACTER SET utf8                         DEFAULT NULL COMMENT 'نام خانوادگی بیمه گزار',
    `englishFirstName`      varchar(80)                    NOT NULL COMMENT 'نام انگلیسی بیمه گزار',
    `englishLastName`       varchar(100)                   NOT NULL COMMENT 'نام خانوادگی انگلیسی بیمه گزار',
    `birthDate`             varchar(50)                    NOT NULL COMMENT 'تاریخ تولد بیمه گزار',
    `mobile`                varchar(20)                                             DEFAULT NULL COMMENT 'شماره موبایل بیمه گزار',
    `email`                 varchar(100)                                            DEFAULT NULL COMMENT 'ایمیل بیمه گزار',
    `gender`                tinyint(4)                                              DEFAULT NULL COMMENT 'جنسیت بیمه گزار',
    `passportNo`            varchar(30)                    NOT NULL COMMENT ' شماره پاسپورت بیمه گزار',
    `countryCode`           varchar(30)                    NOT NULL COMMENT 'کد کشور بیمه گزار',
    `countryName`           varchar(70) CHARACTER SET utf8                          DEFAULT NULL,
    `durationOfStay`        varchar(10)                    NOT NULL COMMENT 'مدت زمان اقامت بیمه گزار',
    `travelKind`            tinyint(4)                     NOT NULL COMMENT '1=single 2= multi نوع ویزا',
    `planCode`              varchar(20)                    NOT NULL COMMENT 'کد طرح بیمه گزار',
    `customerCode`          varchar(20)                                             DEFAULT NULL COMMENT 'شماره مشتری ',
    `cancelDate`            varchar(50)                                             DEFAULT NULL,
    `policyNo`              varchar(100)                                            DEFAULT NULL,
    `bimehNo`               varchar(20)                                             DEFAULT NULL COMMENT 'شماره بیمه ',
    `agentCode`             varchar(20)                                             DEFAULT NULL,
    `regdate`               varchar(50)                    NOT NULL COMMENT 'زمان ثبت بیمه گزار',
    `status`                tinyint(4)                                              DEFAULT 1 COMMENT 'وضعیت بیمه گزار',
    `registerInput`         text                                                    DEFAULT NULL COMMENT 'خروجی از وب سرویس',
    `registerOutput`        text                                                    DEFAULT NULL COMMENT 'جیسون ورودی به سرویس',
    `confirmInput`          text                                                    DEFAULT NULL COMMENT 'ورودی تایید شده جیسون',
    `confirmOutput`         text                                                    DEFAULT NULL COMMENT 'خروجی تایید شده جیسون',
    `pidtype`               varchar(10) CHARACTER SET utf8                          DEFAULT 'hami',
    `payment_rand`          varchar(10) CHARACTER SET utf8                          DEFAULT NULL,
    `payment_type`          int(11)                                                 DEFAULT NULL,
    `payment_status`        tinyint(4)                                              DEFAULT 0,
    `payment_kind`          varchar(20)                                             DEFAULT NULL,
    `tickets_paydescribe`   varchar(200)                                            DEFAULT NULL,
    `price`                 int(20)                                                 DEFAULT NULL,
    `fprice`                int(11)                                                 DEFAULT NULL,
    `finalprice`            int(11)                                                 DEFAULT NULL,
    `paymentID`             int(11)                                                 DEFAULT NULL,
    `emailed`               tinyint(4)                                              DEFAULT 0,
    `pnr`                   varchar(200) CHARACTER SET utf8                         DEFAULT NULL,
    `os`                    varchar(50) CHARACTER SET utf8                          DEFAULT NULL,
    `browser`               varchar(50) CHARACTER SET utf8                          DEFAULT NULL,
    `device`                varchar(50) CHARACTER SET utf8                          DEFAULT NULL,
    `salesby`               varchar(60)                                             DEFAULT NULL,
    `user_id`               int(11)                                                 DEFAULT NULL,
    `user_name`             varchar(100) CHARACTER SET utf8                         DEFAULT NULL,
    `error`                 int(11)                                                 DEFAULT NULL,
    `code_error`            int(11)                                                 DEFAULT NULL,
    `ip`                    varchar(20)                                             DEFAULT NULL,
    `priceGross`            int(11)                                                 DEFAULT NULL COMMENT 'قیمت طرح',
    `priceAvarez`           int(11)                                                 DEFAULT NULL COMMENT 'عوارض طرح',
    `priceTax`              int(11)                                                 DEFAULT NULL COMMENT 'مالیات طرح',
    `priceDiscount`         int(11)                                                 DEFAULT NULL COMMENT 'تخفیف طرح',
    `priceTotal`            int(11)                                                 DEFAULT NULL COMMENT 'قیمت کل طرح',
    `priceMarkup`           int(11)                                                 DEFAULT NULL,
    `orderId`               int(11)                                                 DEFAULT NULL,
    `credit`                varchar(20)                                             DEFAULT NULL,
    `pdfPolicy`             varchar(500)                                            DEFAULT NULL,
    `pdfCoveredItems`       varchar(500)                                            DEFAULT NULL,
    `pdfPublicConditions`   varchar(500)                                            DEFAULT NULL,
    `user_rank`             tinyint(1)                                              DEFAULT NULL,
    `lottery`               text CHARACTER SET utf8                                 DEFAULT NULL,
    `backlink`              varchar(400) CHARACTER SET utf8                         DEFAULT NULL,
    `esrequest_status`      tinyint(1)                                              DEFAULT NULL,
    `esrequest_date`        varchar(100)                                            DEFAULT NULL,
    `esrequest_adminId`     int(11)                                                 DEFAULT NULL,
    `esrequest_price`       int(11)                                                 DEFAULT NULL,
    `esrequest_paytype`     tinyint(1)                     NOT NULL                 DEFAULT 0,
    `esrequest_description` text                           NOT NULL,
    `markup`                int(11)                                                 DEFAULT 0,
    `profit`                int(11)                                                 DEFAULT 0,
    `statusSanad`           tinyint(2)                                              DEFAULT NULL,
    `typeSanad`             varchar(20) CHARACTER SET utf8                          DEFAULT NULL,
    `logSanad`              text CHARACTER SET utf8                                 DEFAULT NULL,
    `salesDaftarRuzname`    varchar(500) CHARACTER SET utf8                         DEFAULT NULL,
    `smsDaftarRuzname`      varchar(500) CHARACTER SET utf8                         DEFAULT NULL,
    `priceapi`              int(11)                                                 DEFAULT NULL,
    `tafzilprovider`        int(11)                                                 DEFAULT NULL,
    `totalDiscount`         varchar(20) CHARACTER SET utf8                          DEFAULT NULL,
    `typeService`           varchar(20) CHARACTER SET utf8                          DEFAULT 'insurance',
    `tafzilTarafHesab`      int(11)                                                 DEFAULT 0,
    `tafzilHazine`          int(11)                                                 DEFAULT 0,
    `tafzilDaramad`         int(11)                                                 DEFAULT 0,
    `hamiSegment`           int(11)                                                 DEFAULT 0,
    `providerSegment`       int(11)                                                 DEFAULT 0,
    `refundPriceBroker`     int(11)                                                 DEFAULT 0,
    `refundPricePassenger`  int(11)                                                 DEFAULT 0,
    `refundPriceApi`        int(11)                                                 DEFAULT 0,
    `provider`              varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `paymentDaftarRuzname`  varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


ALTER TABLE `insurance_saman_register_eshteraki`
    ADD PRIMARY KEY (`id`);


ALTER TABLE `insurance_saman_register_eshteraki`
    MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;



CREATE TABLE `tour_international_city_hotels`
(
    `id`            int(11) NOT NULL,
    `city_id`       varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `city_name_fa`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `city_name_en`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `hotel_id`      varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `hotel_api_id`  varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `hotel_name`    varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `has_available` varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci COMMENT ='انتخاب هتل های شهرها توسط ادمین';



CREATE TABLE `tour_international_search`
(
    `id`            int(11)    NOT NULL,
    `origin_name`   varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `origin_id`     varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `dest_name`     varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `dest_id`       varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `carriage_type` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `user_mobile`   varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `adl`           varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `chd`           varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `inf`           varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `room_count`    varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `ip`            varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `date`          varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `visited`       varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL,
    `admin_comment` text COLLATE utf8_persian_ci,
    `isTourPackage` TINYINT(1) NULL                      DEFAULT '0',
    `data`          text COLLATE utf8_persian_ci
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

CREATE TABLE `tour_international_city_comment`
(
    `id`      int(11)                              NOT NULL,
    `city`    varchar(150) COLLATE utf8_persian_ci NOT NULL,
    `name`    varchar(200) COLLATE utf8_persian_ci NOT NULL,
    `comment` text COLLATE utf8_persian_ci         NOT NULL,
    `rate`    tinyint(4)                           NOT NULL,
    `mobile`  varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `time`    int(11)                              NOT NULL,
    `admin`   varchar(200) COLLATE utf8_persian_ci DEFAULT NULL,
    `logs`    text COLLATE utf8_persian_ci,
    `status`  tinyint(4)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `tour_international_tickets`
(
    `id`                         int(11)                                                 NOT NULL,
    `tour_id`                    varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `api_ticket_id`              varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `crg_pkg_id`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `htl_pkg_id`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tvl_pkg_id`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `go_crg_id`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `return_crg_id`              varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_from`                  varchar(120) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_to`                    varchar(120) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_from_name`             varchar(200) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_to_name`               varchar(200) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_name`                  varchar(70) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_start_date`            varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_end_date`              varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_night_count`           varchar(5) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `tour_day_count`             varchar(5) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `tour_kind`                  varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_type`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_comment`               text COLLATE utf8_persian_ci,
    `need_confirm`               varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `confirm`                    varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `user_id`                    varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_level`                 varchar(12) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_name`                  varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_name_family`           varchar(40) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_mobile`                varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_email`                 varchar(40) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_markup`                varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `passengers_count`           varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `tour_go_type`               varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_return_type`           varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_sell_type`             varchar(15) COLLATE utf8_persian_ci                     NOT NULL,
    `adl`                        varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `chd`                        varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `inf`                        varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `price`                      varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `fprice`                     varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `final_price`                varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `price_adl`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `price_chd`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `price_inf`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `discount`                   varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `regdate`                    varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy_date`                   varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `status`                     varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `payment_status`             varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `pidtype`                    varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `pnr`                        varchar(40) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `paymentID`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `refund`                     varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `refund_date`                varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `refund_status`              varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `payment_type`               varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `payment_kind`               varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tickets_paydescribe`        mediumtext COLLATE utf8_persian_ci,
    `payment_rand`               varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `refund_desc`                varchar(300) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `provided_by`                varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `need_to_reserve`            varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `reserver_user_id`           varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserver_user_name`         varchar(70) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `sold_by`                    varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_hami_markup`           varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_creator_hami_user_id`  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_account_api_hami_user` varchar(70) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `needaction_id`              varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `needaction_status`          varchar(3) COLLATE utf8_persian_ci                           DEFAULT '',
    `error_code`                 varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `error`                      varchar(500) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `system_params`              mediumtext COLLATE utf8_persian_ci,
    `steps_log`                  text COLLATE utf8_persian_ci,
    `salesby`                    varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `device`                     varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `os`                         varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `browser`                    varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy`                        varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `buy_type`                   varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy_status`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy_error`                  varchar(1000) COLLATE utf8_persian_ci                        DEFAULT NULL,
    `has_hotel`                  varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `has_go_carriage`            varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `has_return_carriage`        varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `has_insurance`              tinyint(1)                                                   DEFAULT '0',
    `reserved1`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `reserved2`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `reserved3`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `reserved4`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `reserved5`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `user_rank`                  tinyint(1)                                                   DEFAULT NULL,
    `lottery`                    text CHARACTER SET utf8,
    `backlink`                   varchar(400) CHARACTER SET utf8                              DEFAULT NULL,
    `provider`                   varchar(100) CHARACTER SET utf8                              DEFAULT NULL,
    `sellUsername`               VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL,
    `sellPassword`               VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL,
    `user_isToken`               TINYINT(1)                                              NULL DEFAULT '0',
    `priceapi`                   INT                                                     NULL,
    `profitapi`                  INT                                                     NULL,
    `tafzilprovider`             INT                                                     NULL,
    `logSanad`                   TEXT                                                    NULL DEFAULT '',
    `totalDiscount`              VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT '',
    `typeService`                VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT 'tourI',
    `tafzilTarafHesab`           INT                                                     NULL DEFAULT '0',
    `tafzilHazine`               INT                                                     NULL DEFAULT '0',
    `tafzilDaramad`              INT                                                     NULL DEFAULT '0',
    `hamiSegment`                INT                                                     NULL DEFAULT '0',
    `providerSegment`            INT                                                     NULL DEFAULT '0',
    `profit`                     INT                                                     NULL DEFAULT '0',
    `markup`                     INT                                                     NULL DEFAULT '0',
    paymentDaftarRuzname         VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL,
    `returnDaftarRuzname`        VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `personelDaftarRuzname` BIGINT(20) NOT NULL,
    `profitDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `tour_international_tickets_carriages`
(
    `id`                  int(11) NOT NULL,
    `ticket_id`           int(11) NOT NULL,
    `package_id`          varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `carriage_id`         varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `transfer_type`       varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `from`                varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `from_fa`             varchar(60) COLLATE utf8_persian_ci  DEFAULT NULL,
    `to`                  varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `to_fa`               varchar(60) COLLATE utf8_persian_ci  DEFAULT NULL,
    `is_api`              varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `online_sell`         varchar(2) COLLATE utf8_persian_ci   DEFAULT NULL,
    `api_id`              varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `allowed_cargo`       varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `adl`                 varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `chd`                 varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `inf`                 varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `adl_price`           varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `chd_price`           varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `inf_price`           varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_adl_price`     varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_chd_price`     varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_inf_price`     varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_price`         varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `date`                varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `clock`               varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `arrive_date`         varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `arrive_clock`        varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `type`                varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `company`             varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
    `company_fa`          varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `company_img`         varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
    `class`               varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `number`              varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `reserve`             varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `reserve_id`          varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `auto_buy`            varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `buy`                 varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `buy_error`           varchar(800) COLLATE utf8_persian_ci DEFAULT NULL,
    `buy_logs`            text COLLATE utf8_persian_ci,
    `carriage_api_json`   text COLLATE utf8_persian_ci,
    `return_company`      varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
    `return_company_fa`   varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `return_company_img`  varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
    `return_arrive_clock` varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `return_arrive_date`  int(11)                              DEFAULT NULL,
    `return_date`         int(11)                              DEFAULT NULL,
    `return_clock`        varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `tour_international_tickets_hotels`
(
    `id`             int(11)                      NOT NULL,
    `ticket_id`      int(11)                      NOT NULL,
    `hotel_id`       varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `hotel_name`     varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `city_id`        varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `city_name`      varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `first_date`     varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `last_date`      varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `transfer`       varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `Catering`       varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `meals`          varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `hotel_api_json` text COLLATE utf8_persian_ci NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `tour_international_tickets_insurance`
(
    `id`                  int(11) NOT NULL,
    `ticket_id`           int(11) NOT NULL,
    `plan_code`           int(11)                              DEFAULT NULL,
    `country_code`        int(11)                              DEFAULT NULL,
    `country_name`        varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
    `title`               varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
    `title_english`       varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
    `cover_limit`         varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
    `price`               int(11)                              DEFAULT NULL,
    `discount`            int(11)                              DEFAULT NULL,
    `discount_percentage` tinyint(4)                           DEFAULT NULL,
    `duration_value`      int(11)                              DEFAULT NULL,
    `duration_title`      varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
    `gender`              tinyint(1)                           DEFAULT NULL,
    `age_level`           tinyint(1)                           DEFAULT NULL,
    `national_code`       varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
    `passport_number`     varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
    `persian_first_name`  varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
    `persian_last_name`   varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
    `english_first_name`  varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
    `english_last_name`   varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
    `travel_kind`         tinyint(1)                           DEFAULT NULL,
    `birth_date`          varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `carriage_api_json`   text COLLATE utf8_persian_ci,
    `reserve`             tinyint(1)                           DEFAULT NULL,
    `reserve_id`          int(11)                              DEFAULT NULL,
    `reserve_logs`        text COLLATE utf8_persian_ci,
    `buy`                 tinyint(1)                           DEFAULT NULL,
    `buy_error`           varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
    `buy_logs`            text COLLATE utf8_persian_ci
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `tour_international_tickets_rooms`
(
    `id`                          int(11)                            NOT NULL,
    `ticket_id`                   int(11)                              DEFAULT NULL,
    `ticket_hotel_id`             int(11)                            NOT NULL,
    `hotel_id`                    varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `hotel_api_id`                varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `package_id`                  varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `room_id`                     varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `room_api_type`               varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `room_api_id`                 varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `room_name`                   varchar(150) COLLATE utf8_persian_ci DEFAULT NULL,
    `room_count`                  varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `type`                        varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `extra_service_count`         varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `ex_service_price_one_night`  varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `ex_service_price_all_nights` varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `adl`                         varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `chd`                         varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `inf`                         varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `price_single`                varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `price_adl`                   varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `price_chd`                   varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `price_inf`                   varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_price_single`          varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_price_adl`             varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_price_chd`             varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_price_inf`             varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_price`                 varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `night_count`                 varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `first_date`                  varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `last_date`                   varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `period`                      varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL,
    `reserve`                     varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `reserve_id`                  varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `auto_buy`                    varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `buy`                         varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `buy_error`                   varchar(800) COLLATE utf8_persian_ci DEFAULT NULL,
    `buy_logs`                    text COLLATE utf8_persian_ci,
    `room_api_json`               mediumtext COLLATE utf8_persian_ci NOT NULL,
    `search_id`                   varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `room_info_request`           varchar(2) COLLATE utf8_persian_ci   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `tour_international_tickets_travels`
(
    `id`              int(11) NOT NULL,
    `ticket_id`       int(11) NOT NULL,
    `ticket_hotel_id` int(11) NOT NULL,
    `travel_id`       varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `title`           varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `descs`           varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
    `single_price`    varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `adl_price`       varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `chd_price`       varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `inf_price`       varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `force`           varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `tour_international_ticket_passengers`
(
    `id`                   int(11) NOT NULL,
    `ticket_id`            int(11)                              DEFAULT NULL,
    `price`                varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `user_id`              varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `persian_name`         varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `persian_family`       varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `latin_name`           varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `latin_family`         varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `meli_code`            varchar(20) COLLATE utf8_persian_ci  DEFAULT '',
    `birthdate`            varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `gender`               varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL,
    `passport_number`      varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `passport_expire_date` varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `passport_country`     varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `nationality`          varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `age_level`            varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL,
    `Iranian`              tinyint(1)                           DEFAULT NULL,
    `room`                 tinyint(1)                           DEFAULT NULL,
    `desc`                 varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
    `insurance`            tinyint(4)                           DEFAULT '0',
    `travel_kind`          tinyint(1)                           DEFAULT NULL,
    `reserved1`            varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved2`            varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved3`            varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved4`            varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved5`            varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserve`              varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `buy`                  varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


INSERT INTO `tour_international_tickets` (`id`, `tour_id`, `api_ticket_id`, `crg_pkg_id`, `htl_pkg_id`, `tvl_pkg_id`,
                                          `go_crg_id`, `return_crg_id`, `tour_from`, `tour_to`, `tour_from_name`,
                                          `tour_to_name`, `tour_name`, `tour_start_date`, `tour_end_date`,
                                          `tour_night_count`, `tour_day_count`, `tour_kind`, `tour_type`,
                                          `tour_comment`, `need_confirm`, `confirm`, `user_id`, `user_level`,
                                          `user_name`, `user_name_family`, `user_mobile`, `user_email`, `user_markup`,
                                          `passengers_count`, `tour_go_type`, `tour_return_type`, `tour_sell_type`,
                                          `adl`, `chd`, `inf`, `price`, `fprice`, `final_price`, `price_adl`,
                                          `price_chd`, `price_inf`, `discount`, `regdate`, `buy_date`, `status`,
                                          `payment_status`, `pidtype`, `pnr`, `paymentID`, `refund`, `refund_date`,
                                          `refund_status`, `payment_type`, `payment_kind`, `tickets_paydescribe`,
                                          `payment_rand`, `refund_desc`, `provided_by`, `need_to_reserve`,
                                          `reserver_user_id`, `reserver_user_name`, `sold_by`, `tour_hami_markup`,
                                          `tour_creator_hami_user_id`, `tour_account_api_hami_user`, `needaction_id`,
                                          `needaction_status`, `error_code`, `error`, `system_params`, `steps_log`,
                                          `salesby`, `device`, `os`, `browser`, `buy`, `buy_type`, `buy_status`,
                                          `buy_error`, `has_hotel`, `has_go_carriage`, `has_return_carriage`,
                                          `has_insurance`, `reserved1`, `reserved2`, `reserved3`, `reserved4`,
                                          `reserved5`, `user_rank`, `lottery`, `backlink`, `provider`)
VALUES (__________, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',
        '', 0, '', '', '', '', '', NULL, '', '', '');



-- --------------------------------------------------------
--
-- Table structure for table `send_massage`
--

CREATE TABLE `send_massage`
(
    `sendMassage_id`      bigint(20)                          NOT NULL,
    `sendMassage_user_id` bigint(20)                          NOT NULL,
    `sendMassage_type`    varchar(20) COLLATE utf8_persian_ci NOT NULL,
    `sendMassage_ip`      varchar(20) COLLATE utf8_persian_ci NOT NULL,
    `sendMassage_info`    text COLLATE utf8_persian_ci        NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serviceproviders`
--

CREATE TABLE `serviceproviders`
(
    `id`       int(64)     NOT NULL,
    `typeId`   int(16)          DEFAULT NULL,
    `name`     varchar(100)     DEFAULT NULL,
    `balance`  decimal(15, 0)   DEFAULT NULL,
    `edit`     tinyint(4)  NOT NULL,
    `nature`   tinyint(1)       DEFAULT '1',
    `lock`     TINYINT(1)  NULL DEFAULT '0',
    `add`      INT(1)      NULL DEFAULT '1',
    `sub`      INT(1)      NULL DEFAULT '1',
    `mahiyat`  VARCHAR(20) NOT NULL COMMENT 'ماهیت بدهکار یا بستانکار ',
    `afzayesh` VARCHAR(20) NOT NULL COMMENT 'با افزایش بدهکار نمایش داده می شود یا بستانکار',
    `kahesh`   VARCHAR(20) NOT NULL COMMENT 'با کاهش بدهکار نمایش داده می شود یا بستانکار'


) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `serviceproviders`
--

INSERT INTO `serviceproviders` (`id`, `typeId`, `name`, `balance`, `edit`, `nature`, `lock`, `add`, `sub`, `mahiyat`,
                                `afzayesh`, `kahesh`)
VALUES (1, 0, 'حامی همراه', '0', 1, 1, 0, -1, 1, 'bestankar', 'bedehkar', 'bestankar'),
       (2, 0, 'دریافتها و پرداخت ها', '0', 1, -1, 0, -1, 1, 'bedehkar', 'bedehkar', 'bestankar'),
       (3, 0, 'طرف حساب ها', '0', 1, 1, 0, 1, -1, 'bestankar', 'bestankar', 'bedehkar'),
       (4, 0, 'هزینه ها', '0', 1, -1, 0, -1, 1, 'bedehkar', 'bedehkar', 'bestankar'),
       (5, 0, 'درآمد', '0', 1, 1, 0, 1, -1, 'bestankar', 'bestankar', 'bedehkar'),
       (6, 0, 'کاربران', '0', 1, 1, 0, 1, -1, 'bestankar', 'bestankar', 'bedehkar'),
       (7, 0, 'حساب موقت مسدودی کاربران', '0', 1, 1, 0, 1, -1, 'bestankar', 'bestankar', 'bedehkar');

-- --------------------------------------------------------

--
-- Table structure for table `serviceproviders_transactions`
--

CREATE TABLE `serviceproviders_transactions`
(
    `id`                   int(11)                                                 NOT NULL,
    `serviceprovidersId`   int(11)                                                          DEFAULT NULL,
    `paymentId`            varchar(50) CHARACTER SET utf8 COLLATE utf8_bin                  DEFAULT NULL,
    `amount`               decimal(15, 0)                                                   DEFAULT NULL,
    `cash`                 decimal(15, 0)                                                   DEFAULT NULL,
    `description`          varchar(200)                                            NOT NULL DEFAULT '',
    `refrenceId`           int(11)                                                          DEFAULT '0',
    `ticketTypeId`         int(4)                                                           DEFAULT '0',
    `typeCash`             decimal(15, 0)                                                   DEFAULT '0',
    `bankId`               tinyint(1)                                                       DEFAULT NULL,
    `transactionTypeId`    tinyint(1)                                                       DEFAULT NULL,
    `payment_rand`         varchar(10)                                                      DEFAULT NULL,
    `ticketOwner`          varchar(10)                                                      DEFAULT NULL,
    `documentId`           INT(11)                                                          DEFAULT '0',
    `createDate`           timestamp                                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `description_transfer` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `card_number`          VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `user_namekart`        VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `date_transaction`     VARCHAR(50)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `serviceproviders_type`
--

CREATE TABLE `serviceproviders_type`
(
    `id`          int(64)        NOT NULL,
    `title`       varchar(255)            DEFAULT NULL,
    `balance`     DECIMAL(15, 0) NULL     DEFAULT '0',
    `edit`        tinyint(4)     NOT NULL,
    `type`        varchar(50)    NOT NULL,
    `description` varchar(500)   NOT NULL,
    `typeId`      int(11)        NOT NULL,
    `Islimit`     TINYINT(1)     NOT NULL DEFAULT '0',
    `is_report`     TINYINT(1)     NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


INSERT INTO `serviceproviders_type` (`id`, `title`, `balance`, `edit`, `type`, `description`, `typeId`)
VALUES (1, 'حساب مشترک حامی و رسپینا', '0', 0, '', '', 1),
       (200001, 'درگاه اختصاصی به پرداخت ملت', '0', 0, '', '', 2),
       (200002, 'درگاه اختصاصی سامان', '0', 0, '', '', 2),
       (200003, 'درگاه اختصاصی پارسیان', '0', 0, '', '', 2),
       (200004, 'درگاه اختصاصی پاسارگاد', '0', 0, '', '', 2),
       (200005, 'درگاه اختصاصی ایران کیش', '0', 0, '', '', 2),
       (200006, 'درگاه اختصاصی سداد', '0', 0, '', '', 2),
       (200007, 'حساب متصل به درگاه به پرداخت ملت', '0', 0, '', '', 2),
       (200008, 'حساب متصل به درگاه سامان', '0', 0, '', '', 2),
       (200009, 'حساب متصل به درگاه پارسیان', '0', 0, '', '', 2),
       (200010, 'حساب متصل به درگاه پاسارگاد', '0', 0, '', '', 2),
       (200011, 'حساب متصل به درگاه ایران کیش', '0', 0, '', '', 2),
       (200012, 'حساب متصل به درگاه سداد', '0', 0, '', '', 2),
       (200013, 'بدهی معوق کاربران', '0', 0, '', '', 2),
       (200014, 'حساب واریزی های حامی', '0', 0, '', '', 2),
       (200015, 'حساب کنترل حامی', '0', 0, '', '', 2),
       (200016, 'حساب خریدهای ناموفق', '0', 0, '', '', 2),
       (200017, 'چک های در جریان وصول', '0', 0, '', '', 2),
       (300002, 'هواپیمایی آسمان', '0', 0, '', '', 3),
       (300003, 'هواپیمایی ایران ایر', '0', 0, '', '', 3),
       (300004, 'هواپیمایی زاگرس', '0', 0, '', '', 3),
       (300005, 'هواپیمایی کاسپین', '0', 0, '', '', 3),
       (300006, 'هواپیمایی آتا', '0', 0, '', '', 3),
       (300007, 'هواپیمایی کارون', '0', 0, '', '', 3),
       (300008, 'هواپیمایی تابان', '0', 0, '', '', 3),
       (300009, 'هواپیمایی وارش', '0', 0, '', '', 3),
       (300010, 'هواپیمایی ساها', '0', 0, '', '', 3),
       (300011, 'هواپیمایی قشم ایر', '0', 0, '', '', 3),
       (300012, 'هواپیمایی ماهان', '0', 0, '', '', 3),
       (300013, 'هواپیمایی کیش ایر', '0', 0, '', '', 3),
       (300014, 'هواپیمایی سپهران', '0', 0, '', '', 3),
       (300015, 'هواپیمایی ایرتور', '0', 0, '', '', 3),
       (300016, 'هواپیمایی معراج', '0', 0, '', '', 3),
       (300017, 'مقیم', '0', 0, '', '', 3),
       (300018, 'راویس', '0', 0, '', '', 3),
       (300019, 'hgh724.ir', '0', 0, '', '', 3),
       (300020, 'sepidparvaz.ir', '0', 0, '', '', 3),
       (300021, 'sorenagasht.ir', '0', 0, '', '', 3),
       (300022, 'thr.ttgroup.ir', '0', 0, '', '', 3),
       (300023, 'eram2mhd.ir', '0', 0, '', '', 3),
       (300024, 'samensafar.com', '0', 0, '', '', 3),
       (300025, 'khpc24.ir', '0', 0, '', '', 3),
       (300026, 'payamesaba24.ir', '0', 0, '', '', 3),
       (300027, 'sepehr.tahaparvaz24.ir', '0', 0, '', '', 3),
       (300028, 'opo24.ir', '0', 0, '', '', 3),
       (300029, 'dayansafar.com', '0', 0, '', '', 3),
       (300030, 'ashgezari24.ir', '0', 0, '', '', 3),
       (300031, 'mbk1.ir', '0', 0, '', '', 3),
       (300032, 'peikkhorshid24.ir', '0', 0, '', '', 3),
       (300033, 'marcotravel.ir', '0', 0, '', '', 3),
       (300034, 'sepehrreservation.iranhrc.ir', '0', 0, '', '', 3),
       (300035, 'hamanseir.ir', '0', 0, '', '', 3),
       (300036, 'sepehr.abtingasht.ir', '0', 0, '', '', 3),
       (300037, 'mhd24.ir', '0', 0, '', '', 3),
       (300038, 'iranianbastan.ir', '0', 0, '', '', 3),
       (300039, 'ata24.ir', '0', 0, '', '', 3),
       (300040, 'markazetour.ir', '0', 0, '', '', 3),
       (300041, 'mata24.com', '0', 0, '', '', 3),
       (300042, 'apk724.tsptick.ir', '0', 0, '', '', 3),
       (300043, 'sepehr.behshadgasht.net', '0', 0, '', '', 3),
       (300044, 'toc24.net', '0', 0, '', '', 3),
       (300045, 'sepehr.forouzangasht.ir', '0', 0, '', '', 3),
       (300046, 'mtk121.ir', '0', 0, '', '', 3),
       (300047, 'chabaharan.ir', '0', 0, '', '', 3),
       (300048, 'hic514.ir', '0', 0, '', '', 3),
       (300049, 'sp360.ir', '0', 0, '', '', 3),
       (300050, 'khorshid724.ir', '0', 0, '', '', 3),
       (300051, 'sepehr.sabzgasht.com', '0', 0, '', '', 3),
       (300052, 'bmd24.ir', '0', 0, '', '', 3),
       (300053, 'persiaseir.ir', '0', 0, '', '', 3),
       (300054, 'nasimbeheshtkish.ir', '0', 0, '', '', 3),
       (300055, 'mata724.com', '0', 0, '', '', 3),
       (300056, 'barbodparvaz.ir', '0', 0, '', '', 3),
       (300057, 'persiancharter.ir', '0', 0, '', '', 3),
       (300058, 'mehrabseir.ir', '0', 0, '', '', 3),
       (300059, 'arshaseman.ir', '0', 0, '', '', 3),
       (300060, 'navid24.ir', '0', 0, '', '', 3),
       (300061, 'tabatoos24.ir', '0', 0, '', '', 3),
       (300062, 'egp24.ir', '0', 0, '', '', 3),
       (300063, 'apstour.net', '0', 0, '', '', 3),
       (300064, 'apk24.tsptick.ir', '0', 0, '', '', 3),
       (300065, 'aoatour.ir', '0', 0, '', '', 3),
       (300066, 'sepehr.bgm24.ir', '0', 0, '', '', 3),
       (300067, 'haftvadi.net', '0', 0, '', '', 3),
       (300068, 'tafarojgasht.ir', '0', 0, '', '', 3),
       (300069, 'shadshargh.ir', '0', 0, '', '', 3),
       (300070, 'setareh24.ir', '0', 0, '', '', 3),
       (300071, 'هواپیمایی پارس ایر', '0', 0, '', '', 3),
       (300072, 'ags724.ir', '0', 0, '', '', 3),
       (300073, 'aysan724.com', '0', 0, '', '', 3),
       (300074, 'safarme24.ir', '0', 0, '', '', 3),
       (300075, 'yasna724.ir', '0', 0, '', '', 3),
       (300076, 'sepehr.lachinseir.com', '0', 0, '', '', 3),
       (300077, 'ashraf24.ir', '0', 0, '', '', 3),
       (300078, 'tkt24.com', '0', 0, '', '', 3),
       (300079, 'satrapgroups.com', '0', 0, '', '', 3),
       (300080, 'fardadgasht.com', '0', 0, '', '', 3),
       (300081, 'sepehr.haftorang.org', '0', 0, '', '', 3),
       (300082, 'janan724.ir', '0', 0, '', '', 3),
       (300083, 'atrotravel24.ir', '0', 0, '', '', 3),
       (300084, 'flight.mdsafar.ir', '0', 0, '', '', 3),
       (300085, 'shervin724.ir', '0', 0, '', '', 3),
       (300086, 'elimaa.ir', '0', 0, '', '', 3),
       (300087, 'dpg724.ir', '0', 0, '', '', 3),
       (300088, 'nbi24.ir', '0', 0, '', '', 3),
       (300089, 'sepehr724.ir', '0', 0, '', '', 3),
       (300090, 'rpta.ir', '0', 0, '', '', 3),
       (300091, 'sbook.rahbal.com', '0', 0, '', '', 3),
       (300092, 'sahlangasht.ir', '0', 0, '', '', 3),
       (300093, 'sainaticket.ir', '0', 0, '', '', 3),
       (300094, 'gitirose.net', '0', 0, '', '', 3),
       (300095, 'roshanseir.ir', '0', 0, '', '', 3),
       (300096, 'rsp24.ir', '0', 0, '', '', 3),
       (300097, 'kn24.ir', '0', 0, '', '', 3),
       (300098, 'tkt.safardoustan.com', '0', 0, '', '', 3),
       (300099, 'tak111.ir', '0', 0, '', '', 3),
       (300100, 'gardeshgaranonline.ir', '0', 0, '', '', 3),
       (300101, 'saliparvaz.ir', '0', 0, '', '', 3),
       (300102, 'pooyakish.ir', '0', 0, '', '', 3),
       (300103, 'darvishi724.ir', '0', 0, '', '', 3),
       (300104, 'sepehr.charter717.com', '0', 0, '', '', 3),
       (300105, 'lipar24.ir', '0', 0, '', '', 3),
       (300106, 'radantravel.ir', '0', 0, '', '', 3),
       (300107, 'ava-seir.com', '0', 0, '', '', 3),
       (300108, 'aps.taksetareh.net', '0', 0, '', '', 3),
       (300109, 'psavin.ir', '0', 0, '', '', 3),
       (300110, 'sepehr.goldentour.ir', '0', 0, '', '', 3),
       (300111, 'sepehr.kiaparvaz.ir', '0', 0, '', '', 3),
       (300112, 'iaz724.ir', '0', 0, '', '', 3),
       (300113, 'alrawdatain-co.com', '0', 0, '', '', 3),
       (300115, 'artimankish.ir', '0', 0, '', '', 3),
       (300116, 'gf24.ir', '0', 0, '', '', 3),
       (300117, 'booking.afshid724.ir', '0', 0, '', '', 3),
       (300118, 'dgsyz.ir', '0', 0, '', '', 3),
       (300119, 'azingashtsoheil.ir', '0', 0, '', '', 3),
       (300120, 'mehrabgasht.ir', '0', 0, '', '', 3),
       (300121, 'bartarin24.com', '0', 0, '', '', 3),
       (300122, 'sepehr.atratravel.com', '0', 0, '', '', 3),
       (300123, 'samandargasht.ir', '0', 0, '', '', 3),
       (300124, 'zandseir.ir', '0', 0, '', '', 3),
       (300125, 'ptravels.ir', '0', 0, '', '', 3),
       (300126, 'khayyamgasht.net', '0', 0, '', '', 3),
       (300127, 'ticket.behshadgasht.net', '0', 0, '', '', 3),
       (300128, 'hermesrose.ir', '0', 0, '', '', 3),
       (300129, 'sepehr.sanamparvaz.net', '0', 0, '', '', 3),
       (300130, 'online.omidanparvaz.com', '0', 0, '', '', 3),
       (300131, 'ati724.ir', '0', 0, '', '', 3),
       (300132, 'تشریفات فرودگاهی CIP', '0', 0, '', '', 3),
       (300995, 'هزینه سگمنت خدمات گردشگری', '0', 0, '', '', 3),
       (300996, 'حساب سگمنت مقیم', '0', 0, '', '', 3),
       (300997, 'حساب سگمنت راویس', '0', 0, '', '', 3),
       (300998, 'حساب سگمنت سپهر', '0', 0, '', '', 3),
       (300999, 'سایر چارتری های سپهر', '0', 0, '', '', 3),
       (301001, 'پرتو', '0', 0, '', '', 3),
       (301002, 'یاتی', '0', 0, '', '', 3),
       (301003, 'رجا', '0', 0, '', '', 3),
       (301004, 'سفیر', '0', 0, '', '', 3),
       (301005, 'فدک', '0', 0, '', '', 3),
       (301006, 'پایانه', '0', 0, '', '', 3),
       (301007, 'سفر724', '0', 0, '', '', 3),
       (301008, 'پایانه ها', '0', 0, '', '', 3),
       (301009, 'دبلیو سفر', '0', 0, '', '', 3),
       (301010, 'بیمه سامان', '0', 0, '', '', 3),
       (301011, 'نوین شارژ', '0', 0, '', '', 3),
       (301012, 'اقامت24', '0', 0, '', '', 3),
       (301013, 'ثبت موقت خرید دستی', '0', 0, '', '', 3),
       (301014, 'آی تورز', '0', 0, '', '', 3),
       (301015, 'وجوه دریافتنی از چارتر کنندگان', '0', 0, '', '', 3),
       (301016, 'وجوه دریافتنی از ایرلاین ها', '0', 0, '', '', 3),

       (301018, 'وجوه دریافتنی از چارتر کنندگان (پرواز خارجی)', '0', 0, '', '', 3),
       (301019, 'وجوه دریافتنی از ایرلاین ها (پرواز خارجی)', '0', 0, '', '', 3),

       (301020, 'ریل پرداز نوآفرین', '0', 0, '', '', 3),
       (301021, 'جوپار', '0', 0, '', '', 3),
       (301022, 'مالیات بر ارزش افزوده', '0', 0, '', '', 3),
       (301023, 'هتل حامی', '0', 0, '', '', 3),
       (301024, ' هواپیمایی فلای پرشیا', '0', 0, '', '', 3),
       (301025, 'ebooking.zagrosairlines.com', '0', 0, '', '', 3),
       (301026, 'حساب افزایش موجودی کارشناس', '0', 0, '', '', 3),
       (301027, 'هواپیمایی پویا ایر', '0', 0, '', '', 3),
       (301047, 'هواپیمایی یزد ایر', '0', 0, '', '', 3),

       (400002, 'حساب تخفیف هواپیمایی آسمان', '0', 0, '', '', 4),
       (400003, 'حساب تخفیف هواپیمایی ایران ایر', '0', 0, '', '', 4),
       (400004, 'حساب تخفیف هواپیمایی زاگرس', '0', 0, '', '', 4),
       (400005, 'حساب تخفیف هواپیمایی کاسپین', '0', 0, '', '', 4),
       (400006, 'حساب تخفیف هواپیمایی آتا', '0', 0, '', '', 4),
       (400007, 'حساب تخفیف هواپیمایی کارون', '0', 0, '', '', 4),
       (400008, 'حساب تخفیف هواپیمایی تابان', '0', 0, '', '', 4),
       (400009, 'حساب تخفیف هواپیمایی وارش', '0', 0, '', '', 4),
       (400010, 'حساب تخفیف هواپیمایی ساها', '0', 0, '', '', 4),
       (400011, 'حساب تخفیف هواپیمایی قشم ایر', '0', 0, '', '', 4),
       (400012, 'حساب تخفیف هواپیمایی ماهان', '0', 0, '', '', 4),
       (400013, 'حساب تخفیف هواپیمایی کیش ایر', '0', 0, '', '', 4),
       (400014, 'حساب تخفیف هواپیمایی سپهران', '0', 0, '', '', 4),
       (400015, 'حساب تخفیف هواپیمایی ایرتور', '0', 0, '', '', 4),
       (400016, 'حساب تخفیف هواپیمایی معراج', '0', 0, '', '', 4),
       (400017, 'حساب هزینه سگمنت پرواز داخلی', '0', 0, '', '', 4),
       (400018, 'حساب هزینه سگمنت پرواز خارجی', '0', 0, '', '', 4),
       (400019, 'حساب هزینه سگمنت اتوبوس', '0', 0, '', '', 4),
       (400020, 'حساب هزینه ارسال اس ام اس', '0', 0, '', '', 4),
       (400021, 'حساب هزینه فروش تور', '0', 0, '', '', 4),
       (400022, 'حساب هزینه کارت شارژ هدیه', '0', 0, '', '', 4),
       (400023, 'حساب هزینه سگمنت چارتری', '0', 0, '', '', 4),
       (400024, 'حساب هزینه انتقال وجه حامی', '0', 0, '', '', 4),
       (400025, 'حساب تخفیف هواپیمایی پارس ایر', '0', 0, '', '', 4),
       (400026, 'حساب تخفیف پرواز خارجی', '0', 0, '', '', 4),
       (400027, 'حساب هزینه سگمنت پرواز خارجی', '0', 0, '', '', 4),
       (400028, 'حساب تخفیف قطار', '0', 0, '', '', 4),
       (400030, 'هزینه انتقال وجه بانک', '0', 0, '', '', 4),
       (400031, 'هزینه کارمزد حامی', '0', 0, '', '', 4),
       (400032, 'هزینه تخفیف تبلیغات', '0', 0, '', '', 4),
       (409999, 'سایر تراکنش های حامی', '0', 0, '', '', 4),
       (400033, 'حساب تخفیف هواپیمایی فلای پرشیا', '0', 0, '', '', 4),
       (400034, 'حساب تخفیف ebooking.zagros', '0', 0, '', '', 4),
       (400035, 'حساب تخفیف هواپیمایی پویا ایر', '0', 0, '', '', 4),
       (400036, 'حساب هزینه سگمنت درگاه اشتراکی', '0', 0, '', '', 4),

       (410068, 'حساب تخفیف اتوبوس', '0', 0, '', '', 4),
       (410067, 'هزینه کارمزد حامی', '0', 0, '', '', 4),
       (500002, 'درآمد فروش هواپیمایی آسمان اختصاصی', '0', 0, '', '', 5),
       (500003, 'درآمد فروش هواپیمایی ایران ایر اختصاصی', '0', 0, '', '', 5),
       (500004, 'درآمد فروش هواپیمایی زاگرس اختصاصی', '0', 0, '', '', 5),
       (500005, 'درآمد فروش هواپیمایی کاسپین اختصاصی', '0', 0, '', '', 5),
       (500006, 'درآمد فروش هواپیمایی آتا اختصاصی', '0', 0, '', '', 5),
       (500007, 'درآمد فروش هواپیمایی کارون اختصاصی', '0', 0, '', '', 5),
       (500008, 'درآمد فروش هواپیمایی تابان اختصاصی', '0', 0, '', '', 5),
       (500009, 'درآمد فروش هواپیمایی وارش اختصاصی', '0', 0, '', '', 5),
       (500010, 'درآمد فروش هواپیمایی ساها اختصاصی', '0', 0, '', '', 5),
       (500011, 'درآمد فروش هواپیمایی قشم ایر اختصاصی', '0', 0, '', '', 5),
       (500012, 'درآمد فروش هواپیمایی ماهان اختصاصی', '0', 0, '', '', 5),
       (500013, 'درآمد فروش هواپیمایی کیش ایر اختصاصی', '0', 0, '', '', 5),
       (500014, 'درآمد فروش هواپیمایی سپهران اختصاصی', '0', 0, '', '', 5),
       (500015, 'درآمد فروش هواپیمایی ایرتور اختصاصی', '0', 0, '', '', 5),
       (500016, 'درآمد فروش هواپیمایی معراج اختصاصی', '0', 0, '', '', 5),
       (500017, 'درآمد فروش چارتری', '0', 0, '', '', 5),
       (500018, 'درآمد فروش پرواز خارجی', '0', 0, '', '', 5),
       (500019, 'درآمد فروش قطار رجا', '0', 0, '', '', 5),
       (500020, 'درآمد فروش قطار سفیر', '0', 0, '', '', 5),
       (500021, 'درآمد فروش قطار فدک', '0', 0, '', '', 5),
       (500022, 'درآمد فروش اتوبوس', '0', 0, '', '', 5),
       (500023, 'درآمد فروش هتل داخلی', '0', 0, '', '', 5),
       (500024, 'درآمد فروش هتل خارجی', '0', 0, '', '', 5),
       (500025, 'درآمد فروش قطار خارجی', '0', 0, '', '', 5),
       (500026, 'درآمد فروش بیمه مسافرتی', '0', 0, '', '', 5),
       (500027, 'درآمد فروش شارژ', '0', 0, '', '', 5),
       (500028, 'درآمد حامی پرو', '0', 0, '', '', 5),
       (500029, 'سود/ زیان مازاد هتل داخلی', '0', 0, '', '', 5),
       (500030, 'درآمد فروش پرواز چارتری اشتراکی', '0', 0, '', '', 5),
       (500031, 'درآمد فروش هواپیمایی پارس ایر اختصاصی', '0', 0, '', '', 5),
       (500032, 'درآمد فروش پرواز خارجی اشتراکی', '0', 0, '', '', 5),
       (500033, 'درآمد استفاده از درگاه اشتراکی', '0', 0, '', '', 5),
       (500034, 'درآمد فروش هواپیمایی آسمان اشتراکی', '0', 0, '', '', 5),
       (500035, 'درآمد فروش هواپیمایی ایران ایر اشتراکی', '0', 0, '', '', 5),
       (500036, 'درآمد فروش هواپیمایی زاگرس اشتراکی', '0', 0, '', '', 5),
       (500037, 'درآمد فروش هواپیمایی کاسپین اشتراکی', '0', 0, '', '', 5),
       (500038, 'درآمد فروش هواپیمایی آتا اشتراکی', '0', 0, '', '', 5),
       (500039, 'درآمد فروش هواپیمایی کارون اشتراکی', '0', 0, '', '', 5),
       (500040, 'درآمد فروش هواپیمایی تابان اشتراکی', '0', 0, '', '', 5),
       (500041, 'درآمد فروش هواپیمایی وارش اشتراکی', '0', 0, '', '', 5),
       (500042, 'درآمد فروش هواپیمایی ساها اشتراکی', '0', 0, '', '', 5),
       (500043, 'درآمد فروش هواپیمایی قشم ایر اشتراکی', '0', 0, '', '', 5),
       (500044, 'درآمد فروش هواپیمایی ماهان اشتراکی', '0', 0, '', '', 5),
       (500045, 'درآمد فروش هواپیمایی کیش ایر اشتراکی', '0', 0, '', '', 5),
       (500046, 'درآمد فروش هواپیمایی سپهران اشتراکی', '0', 0, '', '', 5),
       (500047, 'درآمد فروش هواپیمایی ایرتور اشتراکی', '0', 0, '', '', 5),
       (500048, 'درآمد فروش هواپیمایی معراج اشتراکی', '0', 0, '', '', 5),
       (500049, 'درآمد فروش هواپیمایی پارس ایر اشتراکی', '0', 0, '', '', 5),
       (500050, 'درآمد فروش خدمات گردشگری', '0', 0, '', '', 5),
       (500051, 'درآمد فروش خدمات گردشگری اشتراکی', '0', 0, '', '', 5),
       (500052, 'درآمد کارمزد انتقال وجه بانک', '0', 0, '', '', 5),
       (500053, 'درآمد کارمزد انتقال وجه حامی', '0', 0, '', '', 5),

       (500054, 'سود / زیان مازاد پروازهای چارتری', '0', 0, '', '', 5),
       (500055, 'سود / زیان مازاد پروازهای سیستمی', '0', 0, '', '', 5),

       (500056, 'سود/ زیان مازاد هتل داخلی', '0', 0, '', '', 5),
       (500057, 'سود/ زیان مازاد پرواز خارجی', '0', 0, '', '', 5),
       (500063, 'سود/ زیان مازاد پرواز داخلی', '0', 0, '', '', 5),
       (500064, 'سود/ زیان مازاد هتل خارجی', '0', 0, '', '', 5),
       (500065, 'سود/ زیان مازاد قطار', '0', 0, '', '', 5),
       (500066, 'سود/ زیان مازاد اتوبوس', '0', 0, '', '', 5),

       (500058, 'درآمد پرواز داخلی gds', '0', 0, '', '', 5),
       (500059, 'درآمد پرواز خارجی gds', '0', 0, '', '', 5),
       (500060, 'درآمد تور داخلی gds', '0', 0, '', '', 5),
       (500061, 'درآمد هتل داخلی gds', '0', 0, '', '', 5),
       (500062, 'خدمات گردشگری gds', '0', 0, '', '', 5),

        (500067, 'درآمد فروش هواپیمایی فلای پرشیا اختصاصی', '0', 0, '', '', 5),
        (500068, 'درآمد فروش هواپیمایی فلای پرشیا اشتراکی', '0', 0, '', '', 5),
        (500069, 'درآمد کارمزد فروش اقساطی', '0', 0, '', '', 5),
        (500070, 'درآمد فروش هواپیمایی  پویا ایر اختصاصی', '0', 0, '', '', 5),
        (500071, 'درآمد فروش هواپیمایی  پویا ایر اشتراکی', '0', 0, '', '', 5),

        (500072, 'سود / زیان مازاد استرداد', '0', 0, '', '', 5),


       (210087, 'بانک انتقال وجه حامی', '0', 0, '', '', 2),
       (510012, 'درآمد انتقال وجه حامی', '0', 0, '', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `subtiket`
--

CREATE TABLE `subtiket`
(
    `subtiketID`          bigint(20)                            NOT NULL,
    `subtiket_text`       text COLLATE utf8_persian_ci          NOT NULL,
    `tiketsID`            bigint(20)                            NOT NULL,
    `user_id`             bigint(20)                            NOT NULL,
    `admin_id`            INT                                   NULL COMMENT 'این ساب تیکت رو ادمین ایجاد کرده (خودم) ',
    `subtiket_date`       varchar(50) COLLATE utf8_persian_ci   NOT NULL,
    `subtiket_type`       int(11)                               NOT NULL,
    `subtiket_visitnotif` varchar(50) COLLATE utf8_persian_ci   NOT NULL,
    `sendSms`             tinyint(4)                            NULL,
    `sendSmsText`         tinyint(4)                            NULL,
    `view_by`             VARCHAR(5000) COLLATE utf8_persian_ci NULL DEFAULT '',
    `reply_id` INT NULL COMMENT 'شناسه سابتیکت پاسخ این سابتیکت'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `subtasks`
(
    `id`          int(11)                                                  NOT NULL,
    `tiketsID`    int(11)                                                  NOT NULL,
    `admidID`     int(11)                                                  NOT NULL,
    `adminVaheds` varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `regDate`     int(11)                                                  NOT NULL,
    `editDate`    int(11)                                                  NOT NULL,
    `endDate`     int(11)                                                  NOT NULL,
    `time`        int(11)                                                  NOT NULL,
    `status`      tinyint(4)                                               NOT NULL,
    `log`         text CHARACTER SET utf8 COLLATE utf8_persian_ci          NOT NULL,
    `des`         varchar(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tarkonesh`
--

CREATE TABLE `tarkonesh`
(
    `tarkoneshID`         bigint(20)                           NOT NULL,
    `user_id`             bigint(20)                           NOT NULL,
    `tarkonesh_date`      varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `tarkonesh_price`     int(11)                              NOT NULL,
    `tarkonesh_bedehkar`  int(11)                              NOT NULL,
    `tarkonesh_bestankar` int(11)                              NOT NULL,
    `tarkonesh_type`      varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `tarkonesh_describe`  text COLLATE utf8_persian_ci         NOT NULL,
    `tarkonesh_status`    tinyint(4)                           NOT NULL,
    `tarkonesh_subject`   tinyint(4)                           NOT NULL,
    `tarkonesh_mojodi`    int(11)                              NOT NULL,
    `tarkonesh_id`        int(11)                              NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;
-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket`
(
    `tiketID`          bigint(20)                           NOT NULL,
    `tiket_text`       text COLLATE utf8_persian_ci         NOT NULL,
    `tiket_type`       varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `user_id`          bigint(20)                           NOT NULL,
    `user_type`        varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `tiket_status`     int(11)                              NOT NULL,
    `tiket_id`         bigint(20)                           NOT NULL,
    `tiket_date`       varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_name`        varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `tiket_visitadmin` varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `tiket_visituser`  tinyint(4)                           NOT NULL,
    `tiket_file`       text COLLATE utf8_persian_ci         NOT NULL,
    `tiket_sms`        int(11)                              NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tiketall`
--

CREATE TABLE `tiketall`
(
    `tiketallID`          bigint(20)                           NOT NULL,
    `tiketall_text`       text COLLATE utf8_persian_ci         NOT NULL,
    `tiketall_type`       varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `tiketall_status`     int(11)                              NOT NULL,
    `tiketall_date`       varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_name`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `tiketall_visitadmin` varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `tiketall_visituser`  tinyint(4)                           NOT NULL,
    `tiketall_file`       text COLLATE utf8_persian_ci         NOT NULL,
    `tiketall_sms`        int(11)                              NOT NULL,
    `user_id`             int(11)                              NOT NULL,
    `user_type`           varchar(10) COLLATE utf8_persian_ci  NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tikets`
--


CREATE TABLE `tikets` (
 `tiketsID` bigint(20) NOT NULL AUTO_INCREMENT,
 `user_id` bigint(20) NOT NULL COMMENT ' این تیکت رو کاربر ایجاد کرده',
 `reserveId` varchar(100) COLLATE utf8_persian_ci DEFAULT '',
 `category` varchar(1000) COLLATE utf8_persian_ci DEFAULT NULL,
 `admin_id` int(11) DEFAULT NULL COMMENT 'این تیکت  رو ادمین ایجاد کرده  (خودم)',
 `tikets_vahed` varchar(500) COLLATE utf8_persian_ci NOT NULL COMMENT 'admin_id لیست پشتیبان ها',
 `tikets_assign_user` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'کارشناس مسئول تیکت',
 `tikets_date` varchar(50) COLLATE utf8_persian_ci NOT NULL COMMENT 'تاریخ ثبت رکورد',
 `tikets_title` varchar(255) COLLATE utf8_persian_ci NOT NULL COMMENT 'عنوان تیکت',
 `tikets_status` int(11) NOT NULL COMMENT 'وضعیت تیکت (0=باز 1=بسته 2=بررسی سایرین 3=اطلاع رسانی 4=در انتظار مدرک 5=حسابداری 6=استرداد آنلاین مرحله 1 7=استرداد آنلاین مرحله 2)',
 `tikets_edit` varchar(50) COLLATE utf8_persian_ci NOT NULL COMMENT 'تاریخ ارسال آخرین تیکت',
 `tikets_visituser` int(11) NOT NULL COMMENT 'آیا تیکتی برای نمایش وجود دارد؟(کاربر) ',
 `tikets_visitadmin` int(11) NOT NULL COMMENT 'آیا تیکتی برای نمایش وجود دارد؟(مدیر)',
 `tikets_olaviat` int(11) NOT NULL COMMENT '0=low 1-middle 2=emergency',
 `tikets_status2` int(11) NOT NULL COMMENT 'صفر در انتظار پاسخ  و  1 پاسخ داده شده',
 `tikets_type` varchar(15) COLLATE utf8_persian_ci NOT NULL COMMENT ''''' , api , hami , self , onlinechat',
 `tikets_typeuser` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
 `tikets_temp` varchar(255) COLLATE utf8_persian_ci NOT NULL,
 `notif_adminid` varchar(5000) COLLATE utf8_persian_ci NOT NULL,
 `tableName` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'نام جدول',
 `ticketId` int(11) DEFAULT NULL COMMENT 'آیدی جدول',
 `orderId` int(11) DEFAULT NULL COMMENT 'آیدی سمت سفرنگ',
 `sendSmsCount` int(11) DEFAULT NULL COMMENT 'تعداد اس ام اس هایی که برای این تیکت ارسال شده؟',
 `task_time` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
 `task_hour` int(11) DEFAULT 1,
 `task_end_time` int(11) DEFAULT 0,
 `score` int(11) DEFAULT 0 COMMENT 'صفر بدون امتیاز - پنج خوب - ده عالی - بیست تیکت مقایسه شده با تماس ها',
 `score_status` tinyint(4) DEFAULT 0,
 `pending_users` varchar(500) COLLATE utf8_persian_ci DEFAULT '',
 `visited_users` varchar(500) COLLATE utf8_persian_ci DEFAULT '',
 `pinned_users` varchar(250) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'تیکت برای این کاربران پین شده است(CSV)',
 `responsible_user` varchar(25) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'کارشناس مسئول تیکت (با اولین پیام کاربر روی تیکت ثبت میشود)',
 `response` tinyint(1) DEFAULT 0,
 `source` varchar(200) COLLATE utf8_persian_ci NOT NULL DEFAULT '',
 `gds_id` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
 `service_price` int(11) DEFAULT NULL,
 `service_start` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
 `service_end` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
 `service_status` tinyint(4) DEFAULT 0,
 `buyhand_id` int(11) DEFAULT NULL,
 `gds_buyhand_status` tinyint(1) DEFAULT 0,
 `gds_backmoney_status` tinyint(1) DEFAULT 0,
 `buyhandinfo` longtext COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'اطلاعات اضافی تیکت با توجه به مقدار source (JSON)',
 `gds_change5_status` tinyint(1) DEFAULT 0,
 `gds_change9_status` tinyint(1) DEFAULT 0,
 `hesabdari_status` tinyint(1) DEFAULT 0,
 `pnr` varchar(30) COLLATE utf8_persian_ci DEFAULT '',
 `mobile` varchar(30) COLLATE utf8_persian_ci DEFAULT '',
 `sms_status` tinyint(1) DEFAULT 0 COMMENT 'وضعیت پیامک (1-درانتظار ارسال 2-ارسال شده)',
 `sms_waiting` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'پیامک انتظار مسافر جهت صدور بلیط',
 `email_status` tinyint(1) DEFAULT 0 COMMENT 'وضعیت ایمیل (1-درانتظار ارسال 2-ارسال شده)',
 `call_status` tinyint(1) DEFAULT 0 COMMENT 'وضعیت تماس (1-درانتظار پاسخ 2-پاسخ داده شده 3-پاسخ داده نشده)',
 `call_count` int(11) DEFAULT 0,
 `id_passengers` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
 `counter_cron` int(11) DEFAULT 0,
 `accounting_document` tinyint(1) DEFAULT NULL,
 `refundOnline` tinyint(1) DEFAULT 0,
 `main_source` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'safarang,userPanel,...',
 `service` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'flightD,bus,train,...',
 `type` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'esterdad,gds,rules,message,...',
 PRIMARY KEY (`tiketsID`),
 KEY `tikets_type` (`tikets_type`),
 KEY `tikets_vahed` (`tikets_vahed`(255)),
 KEY `tikets_visituser` (`tikets_visituser`),
 KEY `tikets_visitadmin` (`tikets_visitadmin`),
 KEY `tikets_status` (`tikets_status`),
 KEY `tikets_typeuser` (`tikets_typeuser`),
 KEY `pending_users` (`pending_users`(255)),
 KEY `visited_users` (`visited_users`(255)),
 KEY `tikets_edit` (`tikets_edit`),
 KEY `group1` (`tikets_status`,`tikets_type`,`pending_users`,`user_id`,`tikets_vahed`),
 KEY `group2` (`tikets_type`,`user_id`,`tikets_vahed`),
 KEY `reserveId` (`reserveId`),
 KEY `category` (`category`),
 KEY `user_id` (`user_id`),
 KEY `service_status` (`service_status`),
 KEY `pnr` (`pnr`),
 KEY `sms_status` (`sms_status`),
 KEY `email_status` (`email_status`),
 KEY `mobile` (`mobile`),
 KEY `id_passengers` (`id_passengers`),
 KEY `counter_cron` (`counter_cron`),
 KEY `accounting_document` (`accounting_document`),
 KEY `refundOnline` (`refundOnline`),
 KEY `group3` (`source`,`counter_cron`,`tikets_status`,`tikets_date`),
 KEY `group4` (`source`,`counter_cron`,`tikets_status`,`tikets_date`,`tikets_typeuser`),
 KEY `source` (`source`),
 KEY `tikets_date` (`tikets_date`,`tikets_status`,`tikets_typeuser`,`source`,`counter_cron`),
 KEY `service` (`service`),
 KEY `main_source` (`main_source`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;


CREATE TABLE `sendFile_tiket`
(
    `id`       int(11)                             NOT NULL,
    `tiketsID` int(11)                             NOT NULL,
    `mobile`   varchar(15) COLLATE utf8_persian_ci NOT NULL,
    `links`    text COLLATE utf8_persian_ci        NOT NULL,
    `status`   tinyint(1)                          NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


ALTER TABLE `sendFile_tiket`
    ADD PRIMARY KEY (`id`);


ALTER TABLE `sendFile_tiket`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
-- --------------------------------------------------------

--
-- Stand-in structure for view `total_credit`
-- (See below for the actual view)
--
CREATE TABLE `total_credit`
(
    `balance` decimal(16, 0)
);

-- --------------------------------------------------------

--
-- Table structure for table `total_profit`
--

CREATE TABLE `total_profit`
(
    `id`      int(64) NOT NULL,
    `name`    varchar(100)   DEFAULT NULL,
    `type`    int(1)         DEFAULT NULL,
    `balance` decimal(15, 0) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------
INSERT INTO `total_profit` (`id`, `name`, `type`, `balance`)
VALUES (1, '|||||||||||||||', '1', '0');
--
-- Table structure for table `train_passengers`
--

CREATE TABLE `train_passengers`
(
    `id`                   int(11)                                                  NOT NULL,
    `ticket_id`            int(11)                                                  NOT NULL,
    `gender`               tinyint(4)                                               NOT NULL,
    `name`                 varchar(50) COLLATE utf8_persian_ci                      NOT NULL,
    `family`               varchar(50) COLLATE utf8_persian_ci                      NOT NULL,
    `ename`                varchar(50) COLLATE utf8_persian_ci                      NOT NULL,
    `efamily`              varchar(50) COLLATE utf8_persian_ci                      NOT NULL,
    `nid`                  varchar(50) COLLATE utf8_persian_ci                      NOT NULL,
    `dob`                  varchar(10) COLLATE utf8_persian_ci                      NOT NULL,
    `type`                 varchar(7) COLLATE utf8_persian_ci                       NOT NULL,
    `meli`                 tinyint(4)                                               NOT NULL,
    `price`                int(11)                                                  NOT NULL,
    `fprice`               int(11)                                                  NOT NULL,
    `food`                 int(11)                                                  NULL     DEFAULT '0',
    `food_name`            VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT '',
    `nationality`          varchar(10) COLLATE utf8_persian_ci                      NOT NULL,
    `nationalitycode`      varchar(10) COLLATE utf8_persian_ci                      NOT NULL,
    `expdate`              date                                                     NOT NULL,
    `vilcher`              tinyint(4)                                               NOT NULL,
    `ticket_number`        varchar(100) COLLATE utf8_persian_ci                     NOT NULL,
    `ticket_link`          text COLLATE utf8_persian_ci                             NOT NULL,
    `pnr`                  varchar(100) COLLATE utf8_persian_ci                     NOT NULL,
    `ticket_iduser`        int(11)                                                  NOT NULL,
    `tktinfo`              text COLLATE utf8_persian_ci                             NOT NULL,
    `tfc`                  varchar(255) COLLATE utf8_persian_ci                     NOT NULL,
    `pda`                  text COLLATE utf8_persian_ci                             NOT NULL,
    `passport_number`      varchar(100) COLLATE utf8_persian_ci                     NOT NULL,
    `user_id`              int(11)                                                  NOT NULL,
    `refund`               tinyint(4)                                               NOT NULL,
    `jarimerefund`         int(11)                                                  NOT NULL,
    `daterefund`           varchar(100) COLLATE utf8_persian_ci                     NOT NULL,
    `user_id_refund`       int(11)                                                  NOT NULL,
    `user_type_refund`     varchar(100) COLLATE utf8_persian_ci                     NOT NULL,
    `ticketrefund`         tinyint(4)                                               NOT NULL,
    `refundprice`          int(11)                                                  NOT NULL,
    `rpnr`                 varchar(100) COLLATE utf8_persian_ci                              DEFAULT '',
    `rfood`                tinyint(4)                                                        DEFAULT '0',
    `cardata`              text COLLATE utf8_persian_ci,
    `refundRequest_status` TINYINT(2)                                               NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Dumping data for table `train_passengers`
--

INSERT INTO `train_passengers` (`id`, `ticket_id`, `gender`, `name`, `family`, `ename`, `efamily`, `nid`, `dob`, `type`,
                                `meli`, `price`, `fprice`, `nationality`, `nationalitycode`, `expdate`, `vilcher`,
                                `ticket_number`, `ticket_link`, `pnr`, `ticket_iduser`, `tktinfo`, `tfc`, `pda`,
                                `passport_number`, `user_id`, `refund`, `jarimerefund`, `daterefund`, `user_id_refund`,
                                `user_type_refund`, `ticketrefund`, `refundprice`)
VALUES (__________, __________, 0, '', '', '', '', '', '', '1', 1, 0, 0, '1', '', '', 0, '', '', '', 0, '', '', '', '',
        0, 0, 0, '', 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `train_tickets`
--

CREATE TABLE `train_tickets`
(
    `id`                    int(11)                                                  NOT NULL,
    `regdate`               varchar(50) COLLATE utf8_persian_ci                      NOT NULL,
    `ticketid`              varchar(20) COLLATE utf8_persian_ci                      NOT NULL,
    `rticketid`             varchar(20) COLLATE utf8_persian_ci                               DEFAULT NULL,
    `ip`                    varchar(20) COLLATE utf8_persian_ci                      NOT NULL,
    `from`                  varchar(15) COLLATE utf8_persian_ci                      NOT NULL,
    `to`                    varchar(15) COLLATE utf8_persian_ci                      NOT NULL,
    `price`                 int(20)                                                  NOT NULL,
    `fprice`                int(11)                                                  NOT NULL,
    `tdate`                 date                                                     NOT NULL,
    `ttime`                 varchar(5) COLLATE utf8_persian_ci                       NOT NULL,
    `arrive_time`           VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_persian_ci   NULL,
    `status`                tinyint(2)                                               NOT NULL,
    `fnumber`               varchar(10) COLLATE utf8_persian_ci                      NOT NULL,
    `airline`               varchar(15) COLLATE utf8_persian_ci                      NOT NULL,
    `mobile`                varchar(15) COLLATE utf8_persian_ci                      NOT NULL,
    `email`                 varchar(125) COLLATE utf8_persian_ci                     NOT NULL,
    `emailed`               TINYINT                                                  NULL     DEFAULT '0',
    `class`                 varchar(20) COLLATE utf8_persian_ci                      NOT NULL,
    `pnr`                   varchar(40) COLLATE utf8_persian_ci                      NOT NULL,
    `rpnr`                  varchar(40) COLLATE utf8_persian_ci                               DEFAULT NULL,
    `api`                   varchar(30) COLLATE utf8_persian_ci                      NOT NULL,
    `ticketp`               text COLLATE utf8_persian_ci                             NOT NULL,
    `numberp`               tinyint(2)                                               NOT NULL,
    `systemiparams`         text COLLATE utf8_persian_ci                             NOT NULL,
    `error`                 text COLLATE utf8_persian_ci                             NOT NULL,
    `code_error`            tinyint(4)                                               NOT NULL,
    `salesby`               varchar(50)                                                       DEFAULT '',
    `device`                varchar(50)                                                       DEFAULT '',
    `os`                    varchar(50)                                                       DEFAULT '',
    `browser`               varchar(50)                                                       DEFAULT '',
    `train_userID`          int(11)                                                  NOT NULL,
    `ticket_iduser`         int(11)                                                  NOT NULL,
    `adl`                   tinyint(2)                                               NOT NULL,
    `ch`                    tinyint(2)                                               NOT NULL,
    `in`                    tinyint(2)                                               NOT NULL,
    `wagon`                 int(11)                                                  NOT NULL,
    `cope`                  int(11)                                                  NOT NULL,
    `iscope`                tinyint(1)                                               NOT NULL,
    `passenger_sepehr`      longtext COLLATE utf8_persian_ci                         NOT NULL,
    `paymentID`             int(11)                                                  NOT NULL,
    `payment_status`        tinyint(4)                                               NOT NULL,
    `user_id`               int(11)                                                  NOT NULL,
    `user_name`             varchar(100) COLLATE utf8_persian_ci                     NOT NULL,
    `train_paydescribe`     text COLLATE utf8_persian_ci                             NOT NULL,
    `user_cellphone`        varchar(11) COLLATE utf8_persian_ci                      NOT NULL,
    `namep1`                varchar(100) COLLATE utf8_persian_ci                     NOT NULL,
    `print_ticket`          text COLLATE utf8_persian_ci                             NOT NULL,
    `payment_type`          tinyint(2)                                               NOT NULL,
    `discount`              int(11)                                                  NOT NULL,
    `random`                decimal(11, 0)                                           NOT NULL,
    `priceapi`              int(11)                                                  NOT NULL,
    `markup`                int(8)                                                   NOT NULL,
    `webservice_error`      text COLLATE utf8_persian_ci                             NOT NULL,
    `payment_kind`          varchar(10) COLLATE utf8_persian_ci                      NOT NULL,
    `refund`                tinyint(4)                                               NOT NULL,
    `refundstatus`          tinyint(4)                                               NOT NULL,
    `refunddate`            varchar(50) CHARACTER SET utf8                           NOT NULL,
    `statusoff`             tinyint(2)                                               NOT NULL,
    `backlink`              VARCHAR(400) COLLATE utf8_persian_ci                     NOT NULL,
    `discountCode`          varchar(50)                                                       DEFAULT NULL,
    `discountCodeAmount`    varchar(50)                                                       DEFAULT NULL,
    `isreturn`              tinyint(1)                                                        DEFAULT NULL,
    `sellmasterid`          varchar(20) COLLATE utf8_persian_ci                               DEFAULT NULL,
    `rapi`                  varchar(30) COLLATE utf8_persian_ci                               DEFAULT NULL,
    `rticketp`              longtext COLLATE utf8_persian_ci,
    `rwagon`                int(11)                                                           DEFAULT NULL,
    `rcope`                 int(11)                                                           DEFAULT NULL,
    `rtdate`                date                                                              DEFAULT NULL,
    `rttime`                varchar(5) COLLATE utf8_persian_ci                                DEFAULT NULL,
    `rfnumber`              varchar(10) COLLATE utf8_persian_ci                               DEFAULT NULL,
    `iscar`                 tinyint(1)                                                        DEFAULT '0',
    `user_rank`             TINYINT(1)                                               NULL,
    `reminder_sms_status`   TINYINT(2)                                               NULL,
    `lottery`               TEXT CHARACTER SET utf8 COLLATE utf8_general_ci          NULL,
    `pidtype`               VARCHAR(10) COLLATE utf8_persian_ci                               DEFAULT '',
    `provider`              varchar(100) CHARACTER SET utf8                                   DEFAULT NULL,
    `serviceProviderTypeId` int(11)                                                           DEFAULT NULL,
    `hesabSood`             int(11)                                                           DEFAULT NULL,
    `logs`                  text COLLATE utf8_persian_ci,
    `sendsmslink`           TINYINT(1)                                               NULL     DEFAULT '0',
    `sendSmsPayment`        TINYINT(1)                                               NULL     DEFAULT '0',
    `compartmentCapicity`   TINYINT                                                  NULL,
    `isCompartment`         TINYINT                                                  NULL,
    `api_pid`               TINYINT                                                  NULL     DEFAULT '0',
    `wagonname`             VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `typeTicket`            VARCHAR(30)                                              NULL     DEFAULT '',
    `adultPrice`            VARCHAR(30)                                              NULL     DEFAULT '',
    `profitapi`             INT                                                      NULL,
    `tafzilprovider`        INT                                                      NULL,
    `logSanad`              TEXT                                                     NULL     DEFAULT '',
    `totalDiscount`         VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci   NULL     DEFAULT '',
    `typeService`           VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci   NULL     DEFAULT 'trainD',
    `tafzilTarafHesab`      INT                                                      NULL     DEFAULT '0',
    `tafzilHazine`          INT                                                      NULL     DEFAULT '0',
    `tafzilDaramad`         INT                                                      NULL     DEFAULT '0',
    `hamiSegment`           INT                                                      NULL     DEFAULT '0',
    `providerSegment`       INT                                                      NULL     DEFAULT '0',
    `profit`                INT                                                      NULL     DEFAULT '0',
    `statusSanad`           tinyint(1)                                               NOT NULL DEFAULT 0,
    `salesDaftarRuzname`    varchar(500)                                                      DEFAULT NULL,
    `smsDaftarRuzname`      varchar(500)                                                      DEFAULT NULL,
    `refundPriceBroker`     INT                                                      NULL     DEFAULT '0',
    `refundPricePassenger`  INT                                                      NULL     DEFAULT '0',
    `refundPriceApi`        INT                                                      NULL     DEFAULT '0',
    `paymentDaftarRuzname`  VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL     DEFAULT NULL,
    `returnDaftarRuzname`   VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL,
    `refundRequest_status`  TINYINT(2)                                               NOT NULL DEFAULT '0',
    `personelDaftarRuzname` BIGINT(20) NOT NULL,
    `backup_email` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL ,
    `backup_mobile` VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL ,
    `second_connection` TINYINT(1) NULL DEFAULT '0',
    `profitDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Dumping data for table `train_tickets`
--

INSERT INTO `train_tickets` (`id`, `regdate`, `ticketid`, `ip`, `from`, `to`, `price`, `fprice`, `tdate`, `ttime`,
                             `status`, `fnumber`, `airline`, `mobile`, `email`, `class`, `pnr`, `api`, `ticketp`,
                             `numberp`, `systemiparams`, `error`, `code_error`, `train_userID`, `ticket_iduser`, `adl`,
                             `ch`, `in`, `wagon`, `cope`, `iscope`, `passenger_sepehr`, `paymentID`, `payment_status`,
                             `user_id`, `user_name`, `train_paydescribe`, `user_cellphone`, `namep1`, `print_ticket`,
                             `payment_type`, `discount`, `random`, `priceapi`, `markup`, `webservice_error`,
                             `payment_kind`, `refund`, `refundstatus`, `refunddate`)
VALUES (__________, '', '', '', '', '', 0, 0, '', '', 1, '', '', '', '', '', '', '', '', 1, '', '', 0, 0, 0, 0, 0, 0, 0,
        0, 0, '', 0, 0, __________, '', '', '', '', '', 0, 0, '0', 0, 0, '', '', 0, 0, '');

-- --------------------------------------------------------
--
-- Table structure for table `trainc`
--

CREATE TABLE `train_ip_log`
(
    `id`        INT         NOT NULL,
    `ip`        VARCHAR(30) NOT NULL,
    `user_id`   VARCHAR(20) NOT NULL,
    `steps`     INT         NOT NULL,
    `last_time` VARCHAR(20) NOT NULL,
    `block`     TINYINT     NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  CHARSET = utf8
  COLLATE utf8_persian_ci;



CREATE TABLE `trainc`
(
    `traincID`              bigint(20)                           NOT NULL,
    `trainc_type`           int(11)                              NOT NULL,
    `trainc_type1`          int(11)                              NOT NULL,
    `trainc_masir`          text COLLATE utf8_persian_ci         NOT NULL,
    `trainc_shomareparvaz`  int(11)                              NOT NULL,
    `trainc_airline`        varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `trainc_tarikhraft`     varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `trainc_tarikhbargasht` varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `trainc_pcount`         int(11)                              NOT NULL,
    `trainc_class`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `trainc_price`          bigint(20)                           NOT NULL,
    `trainc_file`           text COLLATE utf8_persian_ci         NOT NULL,
    `trainc_varizt`         varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `trainc_varizd`         text COLLATE utf8_persian_ci         NOT NULL,
    `trainc_cellphone`      varchar(15) COLLATE utf8_persian_ci  NOT NULL,
    `trainc_describe`       text COLLATE utf8_persian_ci         NOT NULL,
    `trainc_status`         int(11)                              NOT NULL,
    `trainc_priceall`       bigint(20)                           NOT NULL,
    `trainc_date`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `trainc_admin_des`      text COLLATE utf8_persian_ci         NOT NULL,
    `trainc_user_des`       text COLLATE utf8_persian_ci         NOT NULL,
    `user_id`               bigint(20)                           NOT NULL,
    `trainc_psargoroh`      varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `trainc_ptell`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `trainc_namekart`       varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `trainc_shaba`          varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `trainc_t`              tinyint(4)                           NOT NULL,
    `trainc_shomarekart`    varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `trainc_tiket`          int(11)                              NOT NULL,
    `trainc_babat`          int(11)                              NOT NULL,
    `trainc_refrens`        varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `trainc_adminid`        int(11)                              NOT NULL,
    `trainc_paytype`        tinyint(4)                           NOT NULL,
    `hesabdariID`           bigint(20)                           NOT NULL,
    `ticketid`              int(11)                              NOT NULL,
    `allpassengers`         tinyint(4)                           NOT NULL,
    `user_name`             varchar(250) COLLATE utf8_persian_ci NOT NULL,
    `user_cellphone`        varchar(11) COLLATE utf8_persian_ci  NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



-- --------------------------------------------------------

--
-- Table structure for table `respina_tickets_train_kh`
--


CREATE TABLE `respina_tickets_train_kh`
(
    `id`                    int(11)                                                 NOT NULL,
    `regdate`               varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `searchId`              varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `followId`              varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `eticket`               varchar(100) CHARACTER SET utf8                                  DEFAULT NULL,
    `orderId`               VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `ip`                    varchar(20) CHARACTER SET utf8                                   DEFAULT NULL,
    `from`                  varchar(15) CHARACTER SET utf8                                   DEFAULT NULL,
    `to`                    varchar(15) CHARACTER SET utf8                                   DEFAULT NULL,
    `price`                 int(20)                                                          DEFAULT NULL,
    `fprice`                int(11)                                                          DEFAULT NULL,
    `finalprice`            decimal(10, 0)                                                   DEFAULT NULL,
    `tdate`                 date                                                             DEFAULT NULL,
    `ttime`                 varchar(10) CHARACTER SET utf8                                   DEFAULT NULL,
    `status`                tinyint(3)                                                       DEFAULT NULL,
    `code`                  varchar(10) CHARACTER SET utf8                                   DEFAULT '',
    `operator`              varchar(15) CHARACTER SET utf8                                   DEFAULT NULL,
    `mobile`                varchar(15) CHARACTER SET utf8                                   DEFAULT NULL,
    `email`                 varchar(125) CHARACTER SET utf8                                  DEFAULT NULL,
    `emailed`               tinyint(1)                                                       DEFAULT '0',
    `class`                 varchar(20) CHARACTER SET utf8                                   DEFAULT NULL,
    `api`                   varchar(10) CHARACTER SET utf8                                   DEFAULT NULL,
    `numberp`               tinyint(2)                                                       DEFAULT NULL,
    `error`                 text CHARACTER SET utf8,
    `code_error`            tinyint(4)                                                       DEFAULT NULL,
    `salesby`               varchar(50) CHARACTER SET utf8                                   DEFAULT '',
    `device`                varchar(50) CHARACTER SET utf8                                   DEFAULT '',
    `os`                    varchar(50) CHARACTER SET utf8                                   DEFAULT '',
    `browser`               varchar(50) CHARACTER SET utf8                                   DEFAULT '',
    `adl`                   tinyint(2)                                                       DEFAULT NULL,
    `chd`                   tinyint(2)                                                       DEFAULT NULL,
    `inf`                   tinyint(2)                                                       DEFAULT NULL,
    `paymentID`             int(11)                                                          DEFAULT NULL,
    `payment_status`        tinyint(4)                                                       DEFAULT NULL,
    `payment_rand`          varchar(10) CHARACTER SET utf8                          NOT NULL,
    `webservice_error`      text CHARACTER SET utf8,
    `apilist_id`            int(11)                                                          DEFAULT NULL,
    `user_id`               int(11)                                                          DEFAULT NULL,
    `user_name`             varchar(100) CHARACTER SET utf8                                  DEFAULT NULL,
    `tickets_paydescribe`   text CHARACTER SET utf8,
    `ReservationItems`      text CHARACTER SET utf8,
    `operatorDescription`   varchar(300) CHARACTER SET utf8                                  DEFAULT NULL,
    `user_cellphone`        varchar(12) CHARACTER SET utf8                                   DEFAULT NULL,
    `namep1`                varchar(100) CHARACTER SET utf8                                  DEFAULT NULL,
    `payment_type`          tinyint(2)                                                       DEFAULT NULL,
    `discount`              int(11)                                                          DEFAULT NULL,
    `discount_id`           int(11)                                                          DEFAULT NULL,
    `markup`                int(11)                                                          DEFAULT '0',
    `credit`                int(11)                                                          DEFAULT '0',
    `payment_kind`          varchar(10) CHARACTER SET utf8                                   DEFAULT '',
    `pidtype`               varchar(10) CHARACTER SET utf8                                   DEFAULT NULL,
    `refund`                tinyint(4)                                                       DEFAULT '0',
    `tripType`              tinyint(1)                                                       DEFAULT NULL,
    `redate`                date                                                             DEFAULT NULL,
    `retime`                varchar(10) CHARACTER SET utf8                                   DEFAULT NULL,
    `recode`                varchar(10) CHARACTER SET utf8                                   DEFAULT '',
    `reoperator`            varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `apiResult`             text CHARACTER SET utf8,
    `legs`                  text CHARACTER SET utf8,
    `baggage`               text CHARACTER SET utf8,
    `sessionId`             varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `refundstatus`          tinyint(4)                                                       DEFAULT NULL,
    `refunddate`            varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `discountCode`          varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `discountCodeAmount`    varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `user_rank`             TINYINT(1)                                              NULL,
    `lottery`               TEXT CHARACTER SET utf8 COLLATE utf8_general_ci         NULL,
    `backlink`              VARCHAR(400) CHARACTER SET utf8 COLLATE utf8_general_ci,
    `provider`              varchar(100) CHARACTER SET utf8                                  DEFAULT NULL,
    `serviceProviderTypeId` int(11)                                                          DEFAULT NULL,
    `hesabSood`             int(11)                                                          DEFAULT NULL,
    `priceapi`              INT                                                     NULL,
    `profitapi`             INT                                                     NULL,
    `tafzilprovider`        INT                                                     NULL,
    `logSanad`              TEXT                                                    NULL     DEFAULT '',
    `totalDiscount`         VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL     DEFAULT '',
    `typeService`           VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL     DEFAULT 'trainI',
    `tafzilTarafHesab`      INT                                                     NULL     DEFAULT '0',
    `tafzilHazine`          INT                                                     NULL     DEFAULT '0',
    `tafzilDaramad`         INT                                                     NULL     DEFAULT '0',
    `hamiSegment`           INT                                                     NULL     DEFAULT '0',
    `providerSegment`       INT                                                     NULL     DEFAULT '0',
    `profit`                INT                                                     NULL     DEFAULT '0',
    `statusSanad`           tinyint(1)                                              NOT NULL DEFAULT 0,
    `salesDaftarRuzname`    varchar(500)                                                     DEFAULT NULL,
    `smsDaftarRuzname`      varchar(500)                                                     DEFAULT NULL,
    `paymentDaftarRuzname`  VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `returnDaftarRuzname`   VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `refundRequest_status`  TINYINT(2)                                              NOT NULL DEFAULT '0',
    `personelDaftarRuzname` BIGINT(20) NOT NULL,
    `profitDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Dumping data for table `respina_tickets_train_kh`
--

INSERT INTO `respina_tickets_train_kh` (`id`, `regdate`, `searchId`, `followId`, `eticket`, `ip`, `from`, `to`, `price`,
                                        `fprice`, `finalprice`, `tdate`, `ttime`, `status`, `code`, `operator`,
                                        `mobile`, `email`, `emailed`, `class`, `api`, `numberp`, `error`, `code_error`,
                                        `salesby`, `device`, `os`, `browser`, `adl`, `chd`, `inf`, `paymentID`,
                                        `payment_status`, `payment_rand`, `webservice_error`, `apilist_id`, `user_id`,
                                        `user_name`, `tickets_paydescribe`, `ReservationItems`, `operatorDescription`,
                                        `user_cellphone`, `namep1`, `payment_type`, `discount`, `discount_id`, `markup`,
                                        `credit`, `payment_kind`, `pidtype`, `refund`, `tripType`, `redate`, `retime`,
                                        `recode`, `reoperator`, `apiResult`, `legs`, `baggage`, `sessionId`,
                                        `refundstatus`, `refunddate`, `discountCode`, `discountCodeAmount`)
VALUES (__________, 1486622665, '', '', NULL, '', '', '', 0, 0, '', '', '', 1, '', '', '', '', 0, '', '', 0, '', 0, '',
        '', '', '', 0, 0, 0, __________, 0, '', '', 0, __________, '', NULL, NULL, NULL, '', '', 0, 0, 0, 0, 0, '', '',
        0, 0, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL);


-- --------------------------------------------------------

--
-- Table structure for table `respina_passengers_train_kh`
--

CREATE TABLE `respina_passengers_train_kh`
(
    `id`                   int(11)                         NOT NULL,
    `ticket_id`            int(11)                         NOT NULL,
    `gender`               tinyint(4)                      NOT NULL,
    `name`                 varchar(100) CHARACTER SET utf8          DEFAULT NULL,
    `family`               varchar(100) CHARACTER SET utf8          DEFAULT NULL,
    `ename`                varchar(100) CHARACTER SET utf8          DEFAULT NULL,
    `efamily`              varchar(100) CHARACTER SET utf8          DEFAULT NULL,
    `nid`                  varchar(50) CHARACTER SET utf8  NOT NULL,
    `dob`                  varchar(10) CHARACTER SET utf8  NOT NULL,
    `type`                 varchar(7) CHARACTER SET utf8   NOT NULL,
    `price`                int(11)                         NOT NULL,
    `fprice`               int(11)                         NOT NULL,
    `finalprice`           decimal(10, 0)                  NOT NULL,
    `nationality`          varchar(10) CHARACTER SET utf8  NOT NULL,
    `passport_issue_date`  date                                     DEFAULT NULL,
    `expdate`              date                            NOT NULL,
    `vilcher`              tinyint(4)                      NOT NULL,
    `ticket_number`        varchar(100) CHARACTER SET utf8 NOT NULL,
    `tktinfo`              text CHARACTER SET utf8         NOT NULL,
    `passport_number`      varchar(100) CHARACTER SET utf8 NOT NULL,
    `user_id`              int(11)                         NOT NULL,
    `refund`               tinyint(4)                      NOT NULL,
    `jarimerefund`         int(11)                         NOT NULL,
    `daterefund`           varchar(100) CHARACTER SET utf8 NOT NULL,
    `user_id_refund`       int(11)                         NOT NULL,
    `user_type_refund`     varchar(100) CHARACTER SET utf8 NOT NULL,
    `ticketrefund`         tinyint(4)                      NOT NULL,
    `refundprice`          int(11)                         NOT NULL,
    `refundRequest_status` TINYINT(2)                      NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Dumping data for table `respina_passengers_train_kh`
--

INSERT INTO `respina_passengers_train_kh` (`id`, `ticket_id`, `gender`, `name`, `family`, `ename`, `efamily`, `nid`,
                                           `dob`, `type`, `price`, `fprice`, `finalprice`, `nationality`,
                                           `passport_issue_date`, `expdate`, `vilcher`, `ticket_number`, `tktinfo`,
                                           `passport_number`, `user_id`, `refund`, `jarimerefund`, `daterefund`,
                                           `user_id_refund`, `user_type_refund`, `ticketrefund`, `refundprice`)
VALUES (__________, __________, 1, '', '', '', '', '', '', '1', 0, 0, '0', '', NULL, '', 0, '', '', '', __________, 0,
        0, '', 0, '', 0, 0);


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users`
(
    `user_id`               bigint(20)                                              NOT NULL,
    `user_name`             varchar(30) COLLATE utf8_persian_ci                     NOT NULL,
    `user_cellphone`        varchar(11) COLLATE utf8_persian_ci                     NOT NULL,
    `user_pass`             varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `user_isToken`          TINYINT(1)                                              NULL DEFAULT '0',
    `user_email`            varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `user_tell`             varchar(15) COLLATE utf8_persian_ci                     NOT NULL,
    `user_tell2`            varchar(15) COLLATE utf8_persian_ci                     NOT NULL,
    `user_state`            varchar(20) COLLATE utf8_persian_ci                     NOT NULL,
    `user_city`             varchar(20) COLLATE utf8_persian_ci                     NOT NULL,
    `user_type`             varchar(10) COLLATE utf8_persian_ci                     NOT NULL,
    `user_sec`              varchar(10) COLLATE utf8_persian_ci                     NOT NULL,
    `user_image`            varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `user_imageb`           varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `user_active`           tinyint(4)                                              NOT NULL,
    `user_accept`           tinyint(1)                                              NOT NULL,
    `user_status`           tinyint(2)                                              NOT NULL,
    `user_lat`              double                                                  NOT NULL,
    `user_lng`              double                                                  NOT NULL,
    `user_date_register`    varchar(30) COLLATE utf8_persian_ci                     NOT NULL,
    `user_showcell`         tinyint(4)                                              NOT NULL,
    `user_showtell`         tinyint(4)                                              NOT NULL,
    `user_showtell2`        tinyint(4)                                              NOT NULL,
    `user_showmap`          tinyint(4)                                              NOT NULL,
    `user_add`              text COLLATE utf8_persian_ci                            NOT NULL,
    `user_meli`             varchar(10) COLLATE utf8_persian_ci                     NOT NULL,
    `user_posti`            varchar(10) COLLATE utf8_persian_ci                     NOT NULL,
    `user_site`             text COLLATE utf8_persian_ci                            NOT NULL,
    `user_nameAM`           varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `user_nameAN`           varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `user_EmailAM`          varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `user_EmailAN`          varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `user_cellphoneAM`      varchar(11) COLLATE utf8_persian_ci                     NOT NULL,
    `user_cellphoneAN`      varchar(11) COLLATE utf8_persian_ci                     NOT NULL,
    `user_nameA`            varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `user_about`            text COLLATE utf8_persian_ci                            NOT NULL,
    `user_namekart`         varchar(255) COLLATE utf8_persian_ci                    NOT NULL,
    `user_shomarekart`      varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `user_rezerv`           varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `user_esterdad`         varchar(50) COLLATE utf8_persian_ci                     NOT NULL,
    `user_shomareshaba`     varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `user_esterdadstatus`   int(11)                                                 NOT NULL,
    `user_mojodi`           decimal(11, 0)                                          NOT NULL,
    `user_discount`         tinyint(4)                                              NOT NULL,
    `user_limit`            tinyint(4)                                              NOT NULL,
    `user_level`            tinyint(4)                                              NOT NULL,
    `user_etebar`           decimal(11, 0)                                          NOT NULL,
    `user_etebarDisposable` DECIMAL(11, 0)                                          NOT NULL,
    `user_mojodiblock`      decimal(11, 0)                                          NOT NULL,
    `user_mojodiReturn`     DECIMAL(11, 0)                                          NOT NULL,
    `user_hami`             varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `user_rank`             TINYINT(11)                                             NOT NULL,
    `user_grade`            int(11)                                                 NOT NULL,
    `farasoo`               varchar(100) COLLATE utf8_persian_ci                    NOT NULL,
    `user_allowtell`        tinyint(4)                                              NOT NULL,
    `user_dakheli`          VARCHAR(20) COLLATE utf8_persian_ci                     NOT NULL,
    `user_unit_id`          VARCHAR(10) COLLATE utf8_persian_ci                     NOT NULL,
    `user_unit_name`        VARCHAR(50) COLLATE utf8_persian_ci                     NOT NULL,
    `vacation`              VARCHAR(5) COLLATE utf8_persian_ci                      NOT NULL,
    `vac_per_month`         VARCHAR(20) COLLATE utf8_persian_ci                     NOT NULL,
    `supervisor`            tinyint(1)                                              NOT NULL,
    `userSendSmsTime`       VARCHAR(50)                                             NULL COMMENT 'آخرین باری که اس ام اس رفته برای کاربر',
    `user_profit`           VARCHAR(50) COLLATE utf8_persian_ci                     NOT NULL,
    `user_regNumber`        VARCHAR(10)                                             NULL DEFAULT NULL,
    `user_namabar`          VARCHAR(20)                                             NULL DEFAULT NULL,
    `user_os`               VARCHAR(255)                                            NULL DEFAULT '',
    `old_pass`              VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `delay`    TINYINT(1) NOT NULL DEFAULT '0',
    `starttime` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
    `endtime` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
    `vacation_salary` varchar(5) COLLATE utf8_persian_ci NOT NULL COMMENT 'مرخصی بدون حقوق',
    `vacation_salary2` varchar(10) COLLATE utf8_persian_ci NOT NULL,
    `group_id` tinyint(11) unsigned NOT NULL,
    `user_banks` text COLLATE utf8_persian_ci NOT NULL,
    `economic_code` varchar(25) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'کد اقتصادی',
    `user_birthdate` datetime DEFAULT NULL COMMENT 'تاریخ تولد',
    `user_shomarehesab` varchar(30) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'شماره حساب',
    `user_calllog_services` varchar(10) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'سرویسهای ثبت شده برای کاربر در مرکز تماس'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_cellphone`, `user_pass`, `user_email`, `user_tell`, `user_tell2`,
                     `user_state`, `user_city`, `user_type`, `user_sec`, `user_image`, `user_imageb`, `user_active`,
                     `user_accept`, `user_status`, `user_lat`, `user_lng`, `user_date_register`, `user_showcell`,
                     `user_showtell`, `user_showtell2`, `user_showmap`, `user_add`, `user_meli`, `user_posti`,
                     `user_site`, `user_nameAM`, `user_nameAN`, `user_EmailAM`, `user_EmailAN`, `user_cellphoneAM`,
                     `user_cellphoneAN`, `user_nameA`, `user_about`, `user_namekart`, `user_shomarekart`, `user_rezerv`,
                     `user_esterdad`, `user_shomareshaba`, `user_esterdadstatus`, `user_mojodi`, `user_discount`,
                     `user_limit`, `user_level`, `user_etebar`, `user_mojodiblock`)
VALUES (__________, 'sdgaaasf', '9151017126', 'e10adc3949ba59abbe56e057f20f883e', 'asas@sad.com', '', '', '', '',
        'user', '94329', '/basefile/|||||||||||||||/images/def-avatar.png',
        '/basefile/|||||||||||||||/images/def-avatar.png', 1, 1, 1, 0, 0, '1487232323', 1, 1, 1, 1, '', '', '', '', '',
        '', '', '', '', '', '', '', '', '', '', '', '', 0, '0', 0, 0, 0, '0', '0');


-- --------------------------------------------------------

--
-- Table structure for table `users_transactions`
--


CREATE TABLE `users_transactions`
(
    `id`                int(11)                            NOT NULL,
    `userId`            int(11)                                         DEFAULT NULL,
    `paymentId`         varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
    `amount`            decimal(15, 0)                                  DEFAULT NULL,
    `cash`              decimal(15, 0)                                  DEFAULT NULL,
    `cashblock`         decimal(11, 0)                     NOT NULL,
    `description`       varchar(200)                       NOT NULL     DEFAULT '',
    `refrenceId`        int(11)                                         DEFAULT '0',
    `ticketTypeId`      int(4)                                          DEFAULT '0',
    `bankId`            tinyint(2)                                      DEFAULT '0',
    `transactionTypeId` tinyint(2)                                      DEFAULT '0',
    `createDate`        timestamp                          NOT NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `date`              varchar(5) COLLATE utf8_persian_ci NOT NULL,
    `documentId`        INT(11)                                         DEFAULT '0',
    `date_transaction`  varchar(50)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
/*PARTITION BY RANGE (userId)
        (
        PARTITION p0 VALUES LESS THAN (PARTITION_1 *) ENGINE =InnoDB,
        PARTITION p1 VALUES LESS THAN (PARTITION_2 *) ENGINE =InnoDB,
        PARTITION p2 VALUES LESS THAN (PARTITION_3 *) ENGINE =InnoDB,
        PARTITION p3 VALUES LESS THAN (PARTITION_4 *) ENGINE =InnoDB,
        PARTITION p4 VALUES LESS THAN (PARTITION_5 *) ENGINE =InnoDB,
        PARTITION p5 VALUES LESS THAN (PARTITION_6 *) ENGINE =InnoDB,
        PARTITION p6 VALUES LESS THAN (PARTITION_7 *) ENGINE =InnoDB,
        PARTITION p7 VALUES LESS THAN (PARTITION_8 *) ENGINE =InnoDB,
        PARTITION p8 VALUES LESS THAN (PARTITION_9 *) ENGINE =InnoDB,
        PARTITION p9 VALUES LESS THAN (PARTITION_10 *) ENGINE =InnoDB,
        PARTITION p10 VALUES LESS THAN (PARTITION_11 *) ENGINE =InnoDB,
        PARTITION p11 VALUES LESS THAN (PARTITION_12 *) ENGINE =InnoDB,
        PARTITION p12 VALUES LESS THAN (PARTITION_13 *) ENGINE =InnoDB,
        PARTITION p13 VALUES LESS THAN (PARTITION_14 *) ENGINE =InnoDB,
        PARTITION p14 VALUES LESS THAN (PARTITION_15 *) ENGINE =InnoDB,
        PARTITION p15 VALUES LESS THAN (PARTITION_16 *) ENGINE =InnoDB
        )*/
-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info`
(
    `user_info_id`             bigint(20)                           NOT NULL,
    `user_id`                  bigint(20)                           NOT NULL,
    `user_id_create`           bigint(20)                           NOT NULL,
    `user_type_create`         varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_ip_create`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `date_create`              varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_type_active`         varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_ip_active`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_id_active`           bigint(20)                           NOT NULL,
    `date_active`              varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_type_deactive`       varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_id_deactive`         bigint(20)                           NOT NULL,
    `user_ip_deactive`         varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `date_deactive`            varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `info_deactive`            text COLLATE utf8_persian_ci         NOT NULL,
    `user_id_edit`             bigint(20)                           NOT NULL,
    `user_type_edit`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_ip_edit`             varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `date_last_edit`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_id_accept`           bigint(20)                           NOT NULL,
    `user_type_accept`         varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `date_accept`              varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_ip_accept`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `date_expire`              varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `date_status`              varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_ip_status`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_id_status`           bigint(20)                           NOT NULL,
    `user_type_status`         varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `text_deactive`            text COLLATE utf8_persian_ci         NOT NULL,
    `text_status`              text COLLATE utf8_persian_ci         NOT NULL,
    `user_sendmassage_ch`      tinyint(4)                           NOT NULL,
    `user_sendmassage_date_ch` varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_sendmassage`         tinyint(4)                           NOT NULL,
    `user_sendmassage_date`    varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `invalid_pass`             tinyint(4)                           NOT NULL,
    `disable_date`             varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `user_date_login`          varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `invalid_secCode`          tinyint(4)                           NOT NULL,
    `invalid_secCode_date`     varchar(50) COLLATE utf8_persian_ci  NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_info_id`, `user_id`, `user_id_create`, `user_type_create`, `user_ip_create`,
                         `date_create`, `user_type_active`, `user_ip_active`, `user_id_active`, `date_active`,
                         `user_type_deactive`, `user_id_deactive`, `user_ip_deactive`, `date_deactive`, `info_deactive`,
                         `user_id_edit`, `user_type_edit`, `user_ip_edit`, `date_last_edit`, `user_id_accept`,
                         `user_type_accept`, `date_accept`, `user_ip_accept`, `date_expire`, `date_status`,
                         `user_ip_status`, `user_id_status`, `user_type_status`, `text_deactive`, `text_status`,
                         `user_sendmassage_ch`, `user_sendmassage_date_ch`, `user_sendmassage`, `user_sendmassage_date`,
                         `invalid_pass`, `disable_date`, `user_date_login`, `invalid_secCode`, `invalid_secCode_date`)
VALUES (451, __________, __________, 'user', '2.180.121.183', '1487232323', '0', '2.180.121.183', 0, '1487232323', '',
        0, '', '', '', __________, 'user', '2.180.121.183', '1487232323', 0, '', '1487232323', '', '', '', '', 0, '',
        '', '', 0, '', 0, '1487232323', 0, '1487232323', '1487232323', 0, '1487232323');

-- --------------------------------------------------------

--
-- Table structure for table `user_ip`
--

CREATE TABLE `user_ip`
(
    `user_ip_id`  bigint(20)                          NOT NULL,
    `user_id`     bigint(20)                          NOT NULL,
    `user_ip`     varchar(20) COLLATE utf8_persian_ci NOT NULL,
    `time_login`  varchar(30) COLLATE utf8_persian_ci NOT NULL,
    `time_logout` varchar(30) COLLATE utf8_persian_ci NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_limit`
--

CREATE TABLE `user_limit`
(
    `user_id`           bigint(20) NOT NULL,
    `user_imageProfile` tinyint(4) NOT NULL,
    `user_product`      tinyint(4) NOT NULL,
    `user_takhfif`      tinyint(4) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

--
-- Dumping data for table `user_limit`
--

INSERT INTO `user_limit` (`user_id`, `user_imageProfile`, `user_product`, `user_takhfif`)
VALUES (__________, 5, 0, 0);

-- --------------------------------------------------------
--
-- Table structure for table `apk_version`
--

CREATE TABLE `apk_version`
(
    `version` int(11) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Dumping data for table `apk_version`
--

INSERT INTO `apk_version` (`version`)
VALUES (1);
-- --------------------------------------------------------

CREATE TABLE `tour_tickets`
(
    `id`                      int(11)                                                 NOT NULL,
    `regdate`                 varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `apiTicketId`             varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `price`                   int(20)                                                      DEFAULT NULL,
    `fprice`                  int(11)                                                      DEFAULT NULL,
    `status`                  int(11)                                                      DEFAULT NULL,
    `refund`                  tinyint(4)                                                   DEFAULT NULL,
    `mobile`                  varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `email`                   varchar(125) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `pnr`                     varchar(40) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `numberp`                 tinyint(2)                                                   DEFAULT NULL,
    `systemiparams`           text COLLATE utf8_persian_ci,
    `error`                   longtext COLLATE utf8_persian_ci,
    `code_error`              varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `request_api`             text COLLATE utf8_persian_ci,
    `user_id`                 int(11)                                                      DEFAULT NULL,
    `adl`                     tinyint(2)                                                   DEFAULT NULL,
    `chd`                     tinyint(2)                                                   DEFAULT NULL,
    `inf`                     tinyint(2)                                                   DEFAULT NULL,
    `paymentID`               varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `payment_status`          tinyint(2)                                                   DEFAULT '0',
    `user_level`              varchar(12) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_markup`             int(11)                                                      DEFAULT NULL,
    `all_error`               text COLLATE utf8_persian_ci,
    `payment_type`            tinyint(2)                                                   DEFAULT NULL,
    `namep1`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `namep2`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `finalprice`              int(11)                                                      DEFAULT NULL,
    `refunddate`              varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `refundstatus`            tinyint(2)                                                   DEFAULT NULL,
    `refunddescribe`          varchar(500) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `needaction_status`       tinyint(1)                                                   DEFAULT '0',
    `needaction_id`           int(11)                                                      DEFAULT '0',
    `comment`                 varchar(500) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `discount`                int(4)                                                       DEFAULT NULL,
    `tourID`                  int(11)                                                      DEFAULT NULL,
    `tour_name`               varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_return_by`          varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_go_by`              varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_start_date`         bigint(20)                                                   DEFAULT NULL,
    `tour_end_date`           bigint(20)                                                   DEFAULT NULL,
    `tour_night_count`        tinyint(2)                                                   DEFAULT NULL,
    `tour_day_count`          tinyint(2)                                                   DEFAULT NULL,
    `tour_price_inf`          int(11)                                                      DEFAULT NULL,
    `tour_price_chd`          int(11)                                                      DEFAULT NULL,
    `tour_price_adl`          int(11)                                                      DEFAULT NULL,
    `tour_atba_price_adl`     int(11)                                                      DEFAULT NULL,
    `tour_atba_price_chd`     int(11)                                                      DEFAULT NULL,
    `tour_atba_price_inf`     int(11)                                                      DEFAULT NULL,
    `tour_to`                 varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_from`               varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_stay_in`            varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_CreatorHamiUserId`  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_accountApiHamiUser` varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_kind`               varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tickets_paydescribe`     text COLLATE utf8_persian_ci,
    `pidtype`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `payment_kind`            varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_name`               varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `sold_by`                 varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `provides_by`             varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_hami_markup`        int(11)                                                      DEFAULT NULL,
    `os`                      varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `device`                  varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `salesby`                 varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `browser`                 varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `follower_user_id`        int(11)                                                      DEFAULT NULL,
    `follower_user_name`      varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `ticket1_from`            varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `ticket1_to`              varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `ticket1_date`            bigint(20)                                                   DEFAULT NULL,
    `ticket1_time`            varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `ticket1_airline`         varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `ticket1_class`           varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `ticket1_number`          int(11)                                                      DEFAULT NULL,
    `ticket2_from`            varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `ticket2_to`              varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `ticket2_date`            bigint(20)                                                   DEFAULT NULL,
    `ticket2_time`            varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `ticket2_airline`         varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `ticket2_class`           varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `ticket2_number`          int(11)                                                      DEFAULT NULL,
    `hotel_adrs`              varchar(200) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `hotel_name`              varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `hotel_enter_date`        bigint(20)                                                   DEFAULT NULL,
    `hotel_leave_date`        bigint(20)                                                   DEFAULT NULL,
    `hotel_services`          varchar(200) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `hotel_room_count`        tinyint(2)                                                   DEFAULT NULL,
    `hotel_rooms_type`        varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_comment`            varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `user_rank`               TINYINT(1)                                              NULL,
    `lottery`                 TEXT CHARACTER SET utf8 COLLATE utf8_general_ci         NULL,
    `backlink`                VARCHAR(400) CHARACTER SET utf8 COLLATE utf8_general_ci,
    `provider`                varchar(100) CHARACTER SET utf8                              DEFAULT NULL,
    `priceapi`                INT                                                     NULL,
    `profitapi`               INT                                                     NULL,
    `tafzilprovider`          INT                                                     NULL,
    `logSanad`                TEXT                                                    NULL DEFAULT '',
    `totalDiscount`           VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT '',
    `typeService`             VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT 'tourD',
    `tafzilTarafHesab`        INT                                                     NULL DEFAULT '0',
    `tafzilHazine`            INT                                                     NULL DEFAULT '0',
    `tafzilDaramad`           INT                                                     NULL DEFAULT '0',
    `hamiSegment`             INT                                                     NULL DEFAULT '0',
    `providerSegment`         INT                                                     NULL DEFAULT '0',
    `profit`                  INT                                                     NULL DEFAULT '0',
    `markup`                  INT                                                     NULL DEFAULT '0',
    paymentDaftarRuzname      VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL,
    `profitDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci
  ROW_FORMAT = COMPACT;

CREATE TABLE `tour_ticket_passengers`
(
    `id`             int(11) NOT NULL,
    `ticketID`       int(11)                                                DEFAULT NULL,
    `gender`         varchar(10)                                            DEFAULT NULL,
    `name`           varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `Lname`          varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `latinName`      varchar(50)                                            DEFAULT NULL,
    `latinLName`     varchar(50)                                            DEFAULT NULL,
    `faName`         varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `b_day`          varchar(20)                                            DEFAULT NULL,
    `Mcode`          varchar(20)                                            DEFAULT NULL,
    `passID`         varchar(50)                                            DEFAULT NULL,
    `passStartDate`  bigint(20)                                             DEFAULT NULL,
    `passEndDate`    bigint(20)                                             DEFAULT NULL,
    `price`          int(11)                                                DEFAULT NULL,
    `fprice`         int(11)                                                DEFAULT NULL,
    `final_price`    int(11)                                                DEFAULT NULL,
    `userID`         int(11)                                                DEFAULT NULL,
    `link`           varchar(100)                                           DEFAULT NULL,
    `jarimeRefund`   int(11)                                                DEFAULT NULL,
    `pnrRefund`      varchar(50)                                            DEFAULT NULL,
    `dateRefund`     bigint(20)                                             DEFAULT NULL,
    `refund`         int(11)                                                DEFAULT NULL,
    `userIdRefund`   int(11)                                                DEFAULT NULL,
    `userTypeRefund` tinyint(2)                                             DEFAULT NULL,
    `age_level`      varchar(10)                                            DEFAULT NULL,
    `nationality`    varchar(50)                                            DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

CREATE TABLE `tour_shared`
(
    `id`      int(11) NOT NULL,
    `hami_id` varchar(20) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

INSERT INTO `tour_shared` (`id`, `hami_id`)
VALUES (1, 'NONE');


CREATE TABLE `respina_tickets_hotel_kh`
(
    `id`                       bigint(11)                                              NOT NULL,
    `city_name`                varchar(120)                                                     DEFAULT NULL,
    `country_name`             varchar(120)                                                     DEFAULT NULL,
    `regdate`                  varchar(20)                                                      DEFAULT NULL,
    `searchId`                 varchar(200)                                                     DEFAULT NULL,
    `orderId`                  varchar(200)                                                     DEFAULT NULL,
    `webservice_id`            VARCHAR(50)                                             NULL,
    `vatNumber`                varchar(50)                                                      DEFAULT NULL,
    `supplierName`             varchar(50)                                                      DEFAULT NULL,
    `board`                    varchar(200)                                                     DEFAULT NULL,
    `ip`                       varchar(20)                                                      DEFAULT NULL,
    `nationality`              varchar(50)                                                      DEFAULT NULL,
    `rooms`                    tinyint(2)                                                       DEFAULT NULL,
    `rooms_result`             text                                                    NOT NULL,
    `hotelId`                  varchar(20)                                                      DEFAULT NULL,
    `hotelName`                varchar(50)                                                      DEFAULT NULL,
    `hotelRating`              varchar(10)                                                      DEFAULT NULL,
    `hotelAddress`             varchar(50)                                                      DEFAULT NULL,
    `hotelEmail`               varchar(50)                                                      DEFAULT NULL,
    `hotelUrl`                 varchar(50)                                                      DEFAULT NULL,
    `hotelPhone`               varchar(50)                                                      DEFAULT NULL,
    `hotelFax`                 varchar(50)                                                      DEFAULT NULL,
    `paymentDeadline`          varchar(50)                                                      DEFAULT NULL,
    `night`                    tinyint(2)                                                       DEFAULT NULL,
    `checkin`                  varchar(20)                                                      DEFAULT NULL,
    `checkout`                 varchar(20)                                                      DEFAULT NULL,
    `price`                    int(11)                                                 NOT NULL,
    `fprice`                   int(11)                                                 NOT NULL,
    `finalprice`               int(11)                                                 NOT NULL,
    `status`                   tinyint(3)                                              NOT NULL,
    `mobile`                   varchar(15)                                             NOT NULL,
    `email`                    varchar(125)                                            NOT NULL,
    `emailed`                  tinyint(1)                                              NOT NULL,
    `api`                      varchar(10)                                             NOT NULL,
    `numberp`                  tinyint(2)                                              NOT NULL,
    `error`                    text                                                    NOT NULL,
    `code_error`               tinyint(3)                                              NOT NULL,
    `adl`                      tinyint(2)                                                       DEFAULT NULL,
    `chd`                      tinyint(2)                                                       DEFAULT NULL,
    `inf`                      tinyint(2)                                                       DEFAULT NULL,
    `salesby`                  varchar(50)                                                      DEFAULT '',
    `device`                   varchar(50)                                                      DEFAULT '',
    `os`                       varchar(50)                                                      DEFAULT '',
    `browser`                  varchar(50)                                                      DEFAULT '',
    `paymentID`                int(11)                                                 NOT NULL,
    `payment_status`           tinyint(4)                                              NOT NULL,
    `payment_rand`             varchar(10)                                             NOT NULL,
    `webservice_error`         text                                                    NOT NULL,
    `user_id`                  int(11)                                                 NOT NULL,
    `user_name`                varchar(100)                                            NOT NULL,
    `tickets_paydescribe`      text                                                    NOT NULL,
    `ReservationItems`         text                                                    NOT NULL,
    `namep1`                   varchar(100)                                            NOT NULL,
    `payment_type`             tinyint(2)                                              NOT NULL,
    `discount`                 int(11)                                                 NOT NULL,
    `markup`                   int(8)                                                  NOT NULL,
    `credit`                   int(11)                                                 NOT NULL,
    `payment_kind`             varchar(10)                                             NOT NULL,
    `pidtype`                  varchar(10)                                                      DEFAULT NULL,
    `refund`                   tinyint(4)                                              NOT NULL,
    `backlink`                 varchar(400) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `sessionId`                varchar(100)                                                     DEFAULT NULL,
    `roomInfo`                 varchar(1000)                                                    DEFAULT NULL,
    `esrequest_status`         tinyint(1)                                                       DEFAULT NULL,
    `esrequest_date`           varchar(20)                                                      DEFAULT NULL,
    `esrequest_type`           tinyint(1)                                                       DEFAULT NULL,
    `esrequest_reason`         tinyint(1)                                                       DEFAULT NULL,
    `esrequest_numberOfNights` tinyint(3)                                                       DEFAULT NULL,
    `esrequest_fromDate`       varchar(20)                                                      DEFAULT NULL,
    `esrequest_toDate`         varchar(20)                                                      DEFAULT NULL,
    `esrequest_adminId`        int(11)                                                          DEFAULT NULL,
    `esrequest_price`          int(11)                                                          DEFAULT NULL,
    `esrequest_paytype`        tinyint(1)                                              NOT NULL DEFAULT '0',
    `eskargozar_price`         int(11)                                                 NOT NULL,
    `eskargozar_statusprice`   tinyint(1)                                              NOT NULL DEFAULT '1',
    `eskargozar_date`          varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `discountCode`             varchar(50)                                                      DEFAULT NULL,
    `discountCodeAmount`       varchar(50)                                                      DEFAULT NULL,
    `api_type`                 varchar(30)                                                      DEFAULT NULL,
    `user_rank`                TINYINT(1)                                              NULL,
    `reminder_sms_status`      TINYINT(2)                                              NULL,
    `lottery`                  TEXT CHARACTER SET utf8 COLLATE utf8_general_ci         NULL,
    `hotelPolicies`            TEXT CHARACTER SET utf8 COLLATE utf8_persian_ci         NULL,
    `timeArrival`              varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `provider`                 varchar(100)                                                     DEFAULT NULL,
    `serviceProviderTypeId`    int(11)                                                          DEFAULT NULL,
    `hesabSood`                int(11)                                                          DEFAULT NULL,
    `confirm_buy`              tinyint(1)                                                       DEFAULT '0',
    `Alerts`                   TEXT CHARACTER SET utf8 COLLATE utf8_persian_ci         NULL     DEFAULT '',
    `esrequest_description`    TEXT CHARACTER SET utf8 COLLATE utf8_persian_ci         NULL,
    `esrequest_datetakmil`     VARCHAR(50)                                             NULL     DEFAULT NULL,
    `hesabdariID`              INT                                                     NULL     DEFAULT NULL,
    `priceapi`                 INT                                                     NULL,
    `profitapi`                INT                                                     NULL,
    `tafzilprovider`           INT                                                     NULL,
    `logSanad`                 TEXT                                                    NULL     DEFAULT '',
    `totalDiscount`            VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL     DEFAULT '',
    `typeService`              VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL     DEFAULT 'hotelI',
    `tafzilTarafHesab`         INT                                                     NULL     DEFAULT '0',
    `tafzilHazine`             INT                                                     NULL     DEFAULT '0',
    `tafzilDaramad`            INT                                                     NULL     DEFAULT '0',
    `hamiSegment`              INT                                                     NULL     DEFAULT '0',
    `providerSegment`          INT                                                     NULL     DEFAULT '0',
    `profit`                   INT                                                     NULL     DEFAULT '0',
    `statusSanad`              tinyint(1)                                              NOT NULL DEFAULT 0,
    `salesDaftarRuzname`       varchar(500)                                                     DEFAULT NULL,
    `smsDaftarRuzname`         varchar(500)                                                     DEFAULT NULL,
    `paymentDaftarRuzname`     VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `returnDaftarRuzname`      VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `refundRequest_status`     TINYINT(2)                                              NOT NULL DEFAULT '0',
    `needToConfirmId`          INT                                                     NULL,
    `needToConfirmStatus`      VARCHAR(200)                                            NULL,
    `needToConfirmSecond`      INT                                                     NULL,
    `sendSmsDenyOrAccept`      TINYINT                                                 NULL,
    `personelDaftarRuzname` BIGINT(20) NOT NULL,
    `profitDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `respina_passengers_hotel_kh`
(
    `id`                   int(11)        NOT NULL,
    `ticket_id`            bigint(11)     NOT NULL,
    `name`                 varchar(100)   NOT NULL,
    `family`               varchar(100)   NOT NULL,
    `title`                varchar(10)             DEFAULT NULL,
    `nationality`          varchar(10)             DEFAULT NULL,
    `passport_number`      varchar(50)             DEFAULT NULL,
    `type`                 varchar(7)     NOT NULL,
    `age`                  tinyint(2)              DEFAULT NULL,
    `room`                 tinyint(2)              DEFAULT NULL,
    `price`                int(11)        NOT NULL,
    `fprice`               int(11)        NOT NULL,
    `finalprice`           decimal(10, 0) NOT NULL,
    `tktinfo`              text           NOT NULL,
    `user_id`              int(11)                 DEFAULT NULL,
    `esrequest_select`     tinyint(1)     NOT NULL DEFAULT '0',
    `refundRequest_status` TINYINT(2)     NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `respina_tickets_hotel`
(
    `id`                       bigint(20) UNSIGNED                                     NOT NULL,
    `regdate`                  bigint(20)                                                       DEFAULT NULL,
    `orderId`                  varchar(200)                                                     DEFAULT NULL COMMENT 'شماره آیدی رسم سفر',
    `numberp`                  varchar(50)                                                      DEFAULT '1' COMMENT 'تعداد نفرات',
    `ip`                       varchar(20)                                                      DEFAULT NULL,
    `hotelId`                  varchar(20)                                                      DEFAULT NULL COMMENT 'آیدی هتل',
    `cityName`                 varchar(100)                                                     DEFAULT NULL COMMENT 'شهر هتل',
    `hotelStar`                varchar(10)                                                      DEFAULT NULL COMMENT 'تعداد ستاره هتل',
    `hotelAddress`             varchar(500)                                                     DEFAULT NULL COMMENT 'آدرس هتل',
    `hotelEmail`               varchar(150)                                                     DEFAULT NULL COMMENT 'ایمیل هتل',
    `paymentDeadline`          bigint(20)                                                       DEFAULT NULL COMMENT 'مدت زمان تا زمان پرداخت',
    `price`                    int(20)                                                          DEFAULT NULL,
    `fprice`                   int(11)                                                          DEFAULT NULL,
    `discount`                 int(11)                                                          DEFAULT NULL COMMENT 'تخفیف',
    `finalprice`               int(11)                                                          DEFAULT NULL,
    `markup`                   varchar(10)                                                      DEFAULT NULL COMMENT 'مارک آپ که تو تنظیمات بوده',
    `profit`                   int(11)                                                          DEFAULT NULL COMMENT 'سود',
    `status`                   tinyint(4)                                                       DEFAULT NULL,
    `mobile`                   varchar(20)                                                      DEFAULT NULL COMMENT 'موبایل مسافر',
    `email`                    varchar(100)                                                     DEFAULT NULL COMMENT 'ایمیل مسافر',
    `emailed`                  tinyint(4)                                                       DEFAULT NULL COMMENT 'ایمیل شده یا نه',
    `error`                    varchar(300)                                                     DEFAULT NULL COMMENT 'کد ارور خودم',
    `error_msg`                varchar(300)                                                     DEFAULT NULL COMMENT 'متن ارور خودم',
    `salesby`                  varchar(150)                                                     DEFAULT NULL,
    `device`                   varchar(150)                                                     DEFAULT NULL,
    `os`                       varchar(150)                                                     DEFAULT NULL,
    `browser`                  varchar(150)                                                     DEFAULT NULL,
    `paymentID`                int(11)                                                          DEFAULT NULL,
    `payment_status`           tinyint(4)                                                       DEFAULT '0',
    `payment_rand`             varchar(20)                                                      DEFAULT NULL,
    `webservice_error`         varchar(1000)                                                    DEFAULT NULL,
    `msgRasmesafar`            text COMMENT 'msg رسم سفر',
    `steps`                    text COMMENT 'مراحل خرید',
    `user_id`                  int(20)                                                          DEFAULT NULL,
    `user_name`                varchar(200)                                                     DEFAULT NULL,
    `user_cellphone`           varchar(50)                                                      DEFAULT NULL COMMENT 'شماره خریدار از سشن',
    `tickets_paydescribe`      text,
    `payment_type`             int(20)                                                          DEFAULT NULL,
    `payment_kind`             varchar(20)                                                      DEFAULT NULL,
    `backlink`                 varchar(300)                                                     DEFAULT NULL COMMENT 'طرف از کجا اومده تو سایت',
    `roomId`                   varchar(15)                                                      DEFAULT NULL COMMENT 'آیدی اتاق',
    `roomCount`                INT                                                     NULL     DEFAULT '1',
    `extraPerson`              tinyint(4)                                                       DEFAULT NULL COMMENT 'نفر اضافه',
    `totalPrice`               int(20)                                                          DEFAULT NULL COMMENT 'قیمت وب سرویس',
    `phone`                    varchar(20)                                                      DEFAULT NULL,
    `inDate`                   varchar(20)                                                      DEFAULT NULL COMMENT 'تاریخ رزرو',
    `description`              varchar(200)                                                     DEFAULT NULL COMMENT 'توضیحات',
    `trackingCode`             varchar(1000)                                                    DEFAULT NULL COMMENT 'کد پیگیری ',
    `reservationStatus`        varchar(300)                                                     DEFAULT NULL COMMENT 'reservationStatus from  web service ',
    `reservationMessage`       varchar(300)                                                     DEFAULT NULL COMMENT 'reservationMessage from web service ',
    `hotelNameFa`              varchar(100)                                                     DEFAULT NULL COMMENT 'hotelNameFa from web service',
    `hotelDescription`         text COMMENT 'توضیحات هتل',
    `nid`                      varchar(20)                                                      DEFAULT NULL COMMENT 'کد ملی مسافر',
    `nationality`              VARCHAR(10)                                                      DEFAULT NULL,
    `nationalitycode`          VARCHAR(10)                                                      DEFAULT NULL,
    `meliat`                   TINYINT                                                 NULL     DEFAULT '1',
    `name`                     varchar(150)                                                     DEFAULT NULL COMMENT 'نام مسافر',
    `family`                   varchar(35)                                                      DEFAULT NULL COMMENT 'فامیل مسافر',
    `ename`                    varchar(30)                                                      DEFAULT NULL COMMENT 'نام انگلیسی مسافر',
    `efamily`                  varchar(30)                                                      DEFAULT NULL COMMENT 'نام فارسی مسافر',
    `roomFullBoard`            varchar(10)                                                      DEFAULT NULL COMMENT 'اتاق فول برد هست یا نه',
    `priceHamkar`              int(10) UNSIGNED                                                 DEFAULT NULL COMMENT 'قیمت همکار',
    `priceBoard`               int(10) UNSIGNED                                                 DEFAULT NULL COMMENT 'قیمت برد',
    `priceExtraPerson`         int(10) UNSIGNED                                                 DEFAULT NULL COMMENT 'قیمت نفر اضافه برای اتاق',
    `roomPersons`              tinyint(4)                                                       DEFAULT NULL COMMENT 'تعداد نفرات اتاق',
    `roomBeds`                 tinyint(4)                                                       DEFAULT NULL COMMENT 'تعداد تخت اتاق',
    `numberOfNights`           tinyint(4)                                                       DEFAULT NULL COMMENT 'تعداد شب اقامت',
    `hotelName`                varchar(150)                                                     DEFAULT NULL,
    `roomDoubleBeds`           tinyint(4)                                                       DEFAULT NULL COMMENT 'تعداد تخت دوبل',
    `roomExtraPerson`          tinyint(4)                                                       DEFAULT NULL COMMENT 'تعداد نفر اضافی اتاق',
    `roomOnlineReservation`    tinyint(4)                                                       DEFAULT NULL,
    `roomNameFa`               varchar(100)                                                     DEFAULT NULL COMMENT 'نام اتاق',
    `hotelLatitude`            varchar(100)                                                     DEFAULT NULL COMMENT 'موقعیت هتل عرض',
    `hotelLongitude`           varchar(100)                                                     DEFAULT NULL COMMENT 'موقعیت هتل طول',
    `roomSingleBeds`           tinyint(20)                                                      DEFAULT NULL COMMENT 'نام اتاق ',
    `onlineReservation`        varchar(100)                                                     DEFAULT NULL COMMENT 'اتاقی که رزرو شده آنلاین رزرو بوده',
    `requestReserve`           text COMMENT 'پارامترهایی که به رسم سفر رفته',
    `responseReserve`          text COMMENT 'پاسخ هایی که از رسم سفر گرفته',
    `requestPayment`           text,
    `responsePayment`          text,
    `HotelApiType`             varchar(30)                                                      DEFAULT NULL COMMENT 'از کدوم وب سرویس خریده',
    `pidtype`                  varchar(100)                                                     DEFAULT NULL,
    `unuse1`                   int(11)                                                          DEFAULT NULL,
    `unuse3`                   int(11)                                                          DEFAULT NULL,
    `unused4`                  int(11)                                                          DEFAULT NULL,
    `esrequest_status`         tinyint(1)                                                       DEFAULT NULL,
    `esrequest_date`           bigint(20)                                                       DEFAULT NULL,
    `esrequest_type`           tinyint(1)                                                       DEFAULT NULL,
    `esrequest_reason`         tinyint(1)                                                       DEFAULT NULL,
    `esrequest_numberOfNights` int(11)                                                 NOT NULL,
    `esrequest_fromDate`       bigint(20)                                              NOT NULL,
    `esrequest_toDate`         bigint(20)                                              NOT NULL,
    `esrequest_adminId`        int(11)                                                 NOT NULL,
    `esrequest_price`          int(11)                                                 NOT NULL,
    `esrequest_paytype`        int(1)                                                  NOT NULL DEFAULT '0',
    `hesabdariID`              INT                                                     NULL     DEFAULT NULL,
    `discountCode`             varchar(50)                                                      DEFAULT NULL,
    `discountCodeAmount`       varchar(50)                                                      DEFAULT NULL,
    `roomApiType`              INT(11)                                                 NULL     DEFAULT '2' COMMENT 'اتاق مال کدوم وب سرویسه 1 حامی | 2 اقامت 24',
    `capacityId`               int(11)                                                          DEFAULT NULL COMMENT 'آیدی ظرفیت',
    `capacityRoomSaleType`     varchar(200)                                                     DEFAULT NULL COMMENT 'نوع فروش اتاق چه طوری بوده',
    `capacitySelf`             tinyint(4)                                                       DEFAULT NULL COMMENT 'آیا مال خودش بوده این اتاق یا نه',
    `roomBreakfast`            tinyint(4)                                                       DEFAULT NULL COMMENT 'آیا اتاق مورد نظر صبونه میده',
    `roomLunch`                tinyint(4)                                                       DEFAULT NULL COMMENT 'آیا اتاق مورد نظر ناهار میده',
    `roomDinner`               tinyint(4)                                                       DEFAULT NULL COMMENT 'آیا اتاق مورد نظر شام میده',
    `needToConfirmId`          int(11)                                                          DEFAULT NULL COMMENT 'آیدی needToConfirm in hotel_needToConfirm',
    `needToConfirmStatus`      varchar(200)                                                     DEFAULT NULL COMMENT 'آیدی needToConfirmStatus in hotel_needToConfirm',
    `sendSmsDenyOrAccept`      tinyint(4)                                                       DEFAULT NULL COMMENT 'آیا اس ام اس ارسال شده',
    `hotelCityName`            varchar(150)                                                     DEFAULT NULL,
    `needToConfirmSecond`      int(11)                                                          DEFAULT NULL,
    `capacityCommission`       int(11)                                                          DEFAULT NULL,
    `dateStartMiladi`          DATE                                                             DEFAULT NULL,
    `dateEndMiladi`            DATE                                                             DEFAULT NULL,
    `provides_by`              text,
    `flagapi`                  TINYINT                                                 NULL COMMENT '1 if request from webservice (tour)',
    `capacityNeedReserveAdmin` tinyint(4)                                                       DEFAULT NULL COMMENT 'capacityNeedReserveAdmin in hotel_caapcity must updated if change in rasmesafar',
    `user_rank`                TINYINT(1)                                              NULL,
    `reminder_sms_status`      TINYINT(2)                                              NULL,
    `lottery`                  TEXT CHARACTER SET utf8 COLLATE utf8_general_ci         NULL,
    `provider`                 varchar(200)                                                     DEFAULT NULL,
    `serviceProviderTypeId`    int(11)                                                          DEFAULT NULL,
    `hesabSood`                int(11)                                                          DEFAULT NULL,
    `buyhand_id`               INT                                                     NULL,
    `go_transfer_vehicle`      VARCHAR(50) COLLATE utf8_persian_ci                     NULL     DEFAULT '',
    `go_transfer_hour`         VARCHAR(50) COLLATE utf8_persian_ci                     NULL     DEFAULT '',
    `go_transfer_number`       VARCHAR(50) COLLATE utf8_persian_ci                     NULL     DEFAULT '',
    `return_transfer_vehicle`  VARCHAR(50) COLLATE utf8_persian_ci                     NULL     DEFAULT '',
    `return_transfer_hour`     VARCHAR(50) COLLATE utf8_persian_ci                     NULL     DEFAULT '',
    `return_transfer_number`   VARCHAR(50) COLLATE utf8_persian_ci                     NULL     DEFAULT '',
    `sendVoteSms`              TINYINT(1)                                              NULL     DEFAULT '0',
    `sendsmslink`              TINYINT(1)                                              NULL     DEFAULT '0',
    `sendSmsPayment`           TINYINT(1)                                              NULL     DEFAULT '0',
    `is_tour`                  INT                                                     NULL     DEFAULT '0',
    `esrequest_changeRoom`     TINYINT(1)                                              NULL     DEFAULT NULL,
    `esrequest_selectRoom`     VARCHAR(100)                                            NULL     DEFAULT NULL,
    `esrequest_transfer`       TINYINT(1)                                              NULL     DEFAULT NULL,
    `priceapi`                 INT                                                     NULL,
    `profitapi`                INT                                                     NULL,
    `tafzilprovider`           INT                                                     NULL,
    `logSanad`                 TEXT                                                    NULL     DEFAULT '',
    `totalDiscount`            VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL     DEFAULT '',
    `typeService`              VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL     DEFAULT 'hotelD',
    `tafzilTarafHesab`         INT                                                     NULL     DEFAULT '0',
    `tafzilHazine`             INT                                                     NULL     DEFAULT '0',
    `tafzilDaramad`            INT                                                     NULL     DEFAULT '0',
    `hamiSegment`              INT                                                     NULL     DEFAULT '0',
    `providerSegment`          INT                                                     NULL     DEFAULT '0',
    `statusSanad`              tinyint(1)                                              NOT NULL DEFAULT 0,
    `salesDaftarRuzname`       varchar(500)                                                     DEFAULT NULL,
    `smsDaftarRuzname`         varchar(500)                                                     DEFAULT NULL,
    `paymentDaftarRuzname`     VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `price_increase`           INT                                                     NULL     DEFAULT '0',
    `price_increase_final`     INT                                                     NULL     DEFAULT '0',
    `admin_reserve_hotel`      VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL     DEFAULT '',
    `returnDaftarRuzname`      VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `refundRequest_status`     TINYINT(1)                                              NULL,
    `personelDaftarRuzname` BIGINT(20) NOT NULL,
    `profitDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='لیست خرید های هتل داخلی';

CREATE TABLE `respina_passengers_hotel`
(
    `id`                   bigint(20)                                              NOT NULL,
    `ticket_id`            varchar(50) CHARACTER SET latin1                                 DEFAULT NULL,
    `name`                 varchar(150)                                                     DEFAULT NULL,
    `family`               varchar(30)                                                      DEFAULT NULL,
    `ename`                varchar(30)                                                      DEFAULT NULL,
    `efamily`              varchar(30)                                                      DEFAULT NULL,
    `regdate`              varchar(50) CHARACTER SET latin1                                 DEFAULT NULL,
    `email`                varchar(100) CHARACTER SET latin1                                DEFAULT NULL,
    `price`                varchar(50) CHARACTER SET latin1                                 DEFAULT NULL,
    `fprice`               varchar(50) CHARACTER SET latin1                                 DEFAULT NULL,
    `finalprice`           varchar(50) CHARACTER SET latin1                                 DEFAULT NULL,
    `mobile`               varchar(20) CHARACTER SET latin1                                 DEFAULT NULL,
    `gender`               tinyint(4)                                                       DEFAULT NULL,
    `nid`                  varchar(30)                                                      DEFAULT NULL,
    `expdate`              VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL     DEFAULT '',
    `type`                 varchar(10)                                                      DEFAULT NULL,
    `age`                  TINYINT(3) UNSIGNED                                              DEFAULT NULL,
    `nationality`          varchar(10)                                                      DEFAULT NULL,
    `nationalitycode`      VARCHAR(10)                                                      DEFAULT NULL,
    `meliat`               TINYINT                                                 NULL     DEFAULT '1',
    `user_id`              int(15)                                                          DEFAULT NULL,
    `discount`             tinyint(4)                                                       DEFAULT NULL,
    `refund`               tinyint(4)                                                       DEFAULT NULL,
    `jarimerefund`         int(11)                                                          DEFAULT NULL,
    `pnrrefund`            varchar(40)                                                      DEFAULT NULL,
    `daterefund`           varchar(50)                                                      DEFAULT NULL,
    `user_id_refund`       int(15)                                                          DEFAULT NULL,
    `user_type_refund`     varchar(100)                                                     DEFAULT NULL,
    `pricejarime`          int(11)                                                          DEFAULT NULL,
    `refundprice`          int(11)                                                          DEFAULT NULL,
    `esrequest_select`     tinyint(1)                                              NOT NULL DEFAULT '0',
    `esrequest_name`       VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `esrequest_family`     VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `esrequest_nid`        VARCHAR(30)                                             NOT NULL,
    `refundRequest_status` TINYINT(1)                                              NULL


) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `ApiCharge`
(
    `id`                int(64)                         NOT NULL,
    `orderId`           int(11)                         NOT NULL,
    `base_id`           int(11)                         NOT NULL,
    `base_type`         varchar(50) CHARACTER SET utf8  NOT NULL,
    `user_id`           int(11)                         NOT NULL,
    `user_name`         varchar(100) CHARACTER SET utf8 NOT NULL,
    `user_cellphone`    varchar(12) CHARACTER SET utf8           DEFAULT NULL,
    `email`             varchar(100) CHARACTER SET utf8          DEFAULT NULL,
    `mount`             int(11)                         NOT NULL,
    `price`             int(11)                         NOT NULL,
    `fprice`            int(11)                         NOT NULL,
    `type`              varchar(100) CHARACTER SET utf8 NOT NULL,
    `status`            int(11)                         NOT NULL,
    `namep1`            varchar(100) CHARACTER SET utf8 NOT NULL,
    `paymentID`         int(11)                         NOT NULL,
    `payment_status`    int(11)                         NOT NULL,
    `payment_type`      varchar(50) CHARACTER SET utf8  NOT NULL,
    `markup`            int(11)                         NOT NULL,
    `discount`          int(11)                         NOT NULL,
    `discount_id`       int(11)                         NOT NULL,
    `credit`            int(11)                         NOT NULL,
    `payment_kind`      varchar(10) CHARACTER SET utf8  NOT NULL,
    `pidtype`           varchar(10) CHARACTER SET utf8  NOT NULL,
    `code_error`        int(11)                         NOT NULL,
    `error`             text CHARACTER SET utf8         NOT NULL,
    `webservice_error`  text CHARACTER SET utf8         NOT NULL,
    `CheckChargeStatus` varchar(50) CHARACTER SET utf8  NOT NULL,
    `date`              bigint(20)                      NOT NULL,
    `reg_date`          timestamp                       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `log`               text CHARACTER SET utf8         NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

CREATE TABLE `articleComment`
(
    `commentId`          int(11) NOT NULL,
    `commentArticleId`   int(11)     DEFAULT NULL COMMENT 'آیدی مقاله',
    `commentUserId`      int(11)     DEFAULT NULL COMMENT 'آیدی کسی که پست گذاشته',
    `commentUserName`    varchar(75) DEFAULT NULL COMMENT 'نام کسی که پست گذاشته',
    `commentDescription` text COMMENT 'متن کامل نظر',
    `commentIp`          varchar(30) DEFAULT NULL COMMENT 'آیپی طرف (هر آیپی یک نظر)',
    `commentStatus`      tinyint(4)  DEFAULT NULL COMMENT 'وضعیت نظر آیا بده یا نه',
    `commentRegdate`     varchar(50) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='این جدول نظرهای کاربران در باره مقاله ها ثبت میشود';

CREATE TABLE `articleCommentVote`
(
    `voteId`        int(11) NOT NULL,
    `voteCommentId` int(11)     DEFAULT NULL COMMENT 'آیدی نظر',
    `voteIp`        varchar(30) DEFAULT NULL COMMENT 'آیپی نظر',
    `voteLike`      tinyint(4)  DEFAULT NULL COMMENT 'لایک یا دیس لایک',
    `voteUserName`  varchar(30) DEFAULT NULL COMMENT 'نام کسی که لایک کرده',
    `voteUserId`    int(11)     DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='این جدول ثبت لایک و دیس لایک یک نظر ثبت می شود';


CREATE TABLE `jobs`
(
    `id`             int(11) NOT NULL,
    `regdate`        varchar(50)                     DEFAULT '',
    `gender`         varchar(20) CHARACTER SET utf8  DEFAULT '',
    `name`           varchar(100) CHARACTER SET utf8 DEFAULT NULL,
    `birthdate`      varchar(100) CHARACTER SET utf8 DEFAULT NULL,
    `city`           varchar(100) CHARACTER SET utf8 DEFAULT 'مشهد',
    `phone`          varchar(100) CHARACTER SET utf8 DEFAULT NULL,
    `address`        varchar(100) CHARACTER SET utf8 DEFAULT NULL,
    `education`      varchar(100) CHARACTER SET utf8 DEFAULT NULL,
    `fieldofstudy`   varchar(100) CHARACTER SET utf8 DEFAULT NULL,
    `job`            varchar(100) CHARACTER SET utf8 DEFAULT NULL,
    `skills`         text CHARACTER SET utf8,
    `havejob`        varchar(50) CHARACTER SET utf8  DEFAULT '',
    `sickness`       varchar(50) CHARACTER SET utf8  DEFAULT '',
    `job1`           text CHARACTER SET utf8,
    `job2`           text CHARACTER SET utf8,
    `job3`           text CHARACTER SET utf8,
    `job4`           text CHARACTER SET utf8,
    `job5`           text CHARACTER SET utf8,
    `timejob`        varchar(50) CHARACTER SET utf8  DEFAULT '',
    `timejobsuggest` varchar(50) CHARACTER SET utf8  DEFAULT '',
    `document`       text CHARACTER SET utf8,
    `desc`           text CHARACTER SET utf8,
    `fee`            varchar(100) CHARACTER SET utf8 DEFAULT '',
    `relationship`   varchar(50) CHARACTER SET utf8  DEFAULT NULL,
    `comment`        text CHARACTER SET utf8
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


-- start added kavousi

CREATE TABLE `blog`
(
    `blogId`              int(10) UNSIGNED NOT NULL COMMENT 'شناسه مقاله',
    `blogType`            varchar(100)          DEFAULT NULL COMMENT '''blog'' || ''video''',
    `blogTitle`           text COMMENT 'عنوان مقاله',
    `blogTitleEn`         text COMMENT 'عنوان انگلیسی مقاله',
    `blogDescription`     text COMMENT 'متن اصلی مقاله',
    `blogBrief`           text COMMENT 'خلاصه ای در باره مقاله',
    `blogCategory`        varchar(300)          DEFAULT NULL COMMENT 'category ids آیدی های دسته ها ',
    `blogCategoryText`    text COMMENT 'نام انگلیسی دسته ها(استفاده نمیشه دیداری)',
    `blogCategoryTextFa`  text COMMENT '(استفاده نمیشه  دیداری)نام فارسی دسته ها',
    `blogTag`             text COMMENT 'tag ids آیدی های تگ ها',
    `blogTagText`         text COMMENT 'استفاده نمیشه فقط دیداری',
    `blogImageUrlRandom`  tinyint(4)            DEFAULT '0' COMMENT 'آیا عکس نمایه رندمی باشه؟',
    `blogAdminId`         int(10) UNSIGNED      DEFAULT NULL COMMENT 'شناسه کاربر ایجاد کننده مقاله',
    `blogAdminName`       varchar(100)          DEFAULT NULL COMMENT 'نام کاربر ایجاد کننده مقاله ',
    `blogActive`          tinyint(4)            DEFAULT '0' COMMENT 'وضعیت مقاله',
    `blogHomePage`        tinyint(4)            DEFAULT '0' COMMENT 'نمایش در اول سایت',
    `blogHomePageOrder`   int(11)               DEFAULT NULL COMMENT 'ترتیب نمایش مقاله در اول سایت',
    `blogRegisterDate`    datetime              DEFAULT NULL COMMENT 'تاریخ ثبت مقاله',
    `blogSource`          text COMMENT 'منبع این مقاله',
    `blogCountLike`       int(11)               DEFAULT '0' COMMENT 'تعداد لایک هایی که این بلاگ خورده',
    `blogCountComment`    int(11)               DEFAULT '0' COMMENT 'تعداد کامنت هایی که این بلاگ دارد',
    `blogCountVisit`      int(11)               DEFAULT '0' COMMENT 'تعداد بازدید هایی که این مقاله داشته',
    `blogCountFavorite`   int(11)               DEFAULT '0' COMMENT 'چند نفر این مقاله را مورد علاقه کرده اند',
    `blogCountFile`       int(11)               DEFAULT '0' COMMENT 'تعداد فایل هایی که به این مقله وصله',
    `blogAuthor`          varchar(100)          DEFAULT NULL COMMENT 'نویسنده این مقاله کی بوده',
    `blogContributors`    text COMMENT 'چه کسایی روی این مقاله همکاری داشته اند',
    `blogKeywords`        text COMMENT 'keywords google با کاما از هم جدا بشه',
    `blogMetaDescription` text COMMENT 'توضیحات برای موتورهای جستجو',
    `blogDevice`          varchar(100)          DEFAULT NULL COMMENT 'کاربر با کدوم دستگاه مقاله ایجاد کرده',
    `blogOs`              varchar(100)          DEFAULT NULL COMMENT 'کاربر با کدوم سیستم عامل مقاله ایجاد کرده',
    `blogBrowser`         varchar(100)          DEFAULT NULL COMMENT 'کاربر با کدوم مرورگر مقاله ایجاد کرده',
    `blogOrder`           int(11)               DEFAULT NULL COMMENT 'ترتیب نمایش مقاله',
    `blogSuspend`         tinyint(4)            DEFAULT '0' COMMENT 'اگر وضعیت کلی برای یک دسته تغییر کرد',
    `blogUpdateDate`      datetime              DEFAULT NULL COMMENT 'زمان آپدیت مقاله',
    `blogUpdateAdminId`   int(11)               DEFAULT NULL COMMENT 'چه کسی مقاله رو آپدیت کرده',
    `blogUpdateAdminName` varchar(200)          DEFAULT NULL COMMENT 'نام کاربری کسی که مقاله رو آپدیت کرده',
    `blogCopy`            tinyint(4)            DEFAULT NULL COMMENT 'کپی از وبلاگ قبلی',
    `blogOldLink`         text COMMENT 'لینک قدیم وبلاگ',
    `blogUrlsRelated`     text COMMENT 'لینک های مرتبط با این مقاله',
    `blogUrlsTextRelated` text COMMENT 'عنوان لینک های مرتبط با این مقاله ',
    `blogFavorite`        tinyint(4) COMMENT 'blog favorite ',
    `blogSuggest`         tinyint(4) COMMENT 'مقاله های پیشنهادی که در صفحه اول سایت نمایش میدیم ',
    `blogMenu`            varchar(100) COMMENT 'کدام منو فعال باشد؟ ',
    `blogCanonical`       TEXT             NULL,
    `blogRelatedLinks`    TEXT             NULL,
    `blogSchemaQuestions` TEXT             NULL,
    `blogSitemap`         TINYINT          NULL DEFAULT '1',
    `blogH1`              TEXT             NULL,
    `blogTitleSourceHtml` TEXT             NULL,
    `blogPublishTime`     varchar(100)          DEFAULT NULL,
    `blogPublishTimeLog`  varchar(100)          DEFAULT NULL,
    `blogRedirectTo`      TEXT                  DEFAULT NULL
) ENGINE = MyISAM
  DEFAULT CHARSET = utf8 COMMENT ='این جدول تمام مقالات رو نگهداری میکنه';

ALTER TABLE `blog`
    ADD `blogBlogId` INT                 NULL COMMENT 'به آیدی مقاله اشاره داره یعنی خبری در باره مقاله می باشد',
    ADD `blogNews`   TINYINT DEFAULT '0' NULL COMMENT '0 | 1 یعنی این مقاله از نوع خبر می باشد';
ALTER TABLE `blog`
    ADD `blogBlogTitle` TEXT NULL COMMENT 'عنوان مقاله پدر این مقاله';

ALTER TABLE `blog`
    ADD `blogNewsCount` INT DEFAULT '0' NULL COMMENT 'تعداد خبر های این مقاله';


-- --------------------------------------------------------

--
-- Table structure for table `blogCategory`
--

CREATE TABLE `blogCategory`
(
    `categoryId`          int(10) UNSIGNED NOT NULL COMMENT 'شناسه دسته',
    `categoryNameEn`      varchar(150) DEFAULT NULL COMMENT 'نام انگلیسی دسته',
    `categoryNameFa`      varchar(150) DEFAULT NULL COMMENT 'نام دسته',
    `categoryType`        tinyint(4)   DEFAULT NULL COMMENT 'از سطح چندوم هستش',
    `categoryRootId`      int(11)      DEFAULT NULL COMMENT 'مال کدوم زیر دسته می باشد categoryId',
    `categoryMenu`        tinyint(4)   DEFAULT NULL COMMENT 'این دسته منویی می باشد',
    `categoryBlogConnect` tinyint(4)   DEFAULT '0' COMMENT 'آیا یک مقاله میتونه به این دسته وصل بشه؟ 0|1',
    `categoryOrder`       int(11)      DEFAULT '0' COMMENT 'ترتیب نمایش '
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='این جدول دسته های اصلی رو نگهداری میکنه';

--
-- Dumping data for table `blogCategory`
--

INSERT INTO `blogCategory` (`categoryId`, `categoryNameEn`, `categoryNameFa`, `categoryType`, `categoryRootId`,
                            `categoryMenu`, `categoryBlogConnect`, `categoryOrder`)
VALUES (1, 'article', 'مقالات', 0, 0, 1, 1, 0),
       (2, 'tourism', 'گردشگری', 0, 0, 1, 0, 0),
       (3, 'news', 'اخبار', 0, 0, 1, 1, 0),
       (6, 'external', 'گردشگری خارجی', 1, 2, 1, 0, 0),
       (7, 'internal', 'گردشگری داخلی', 1, 2, 1, 0, 0),
       (15, 'tour', 'تور', 0, 0, 1, 0, 0),
       (16, 'internal', 'تور داخلی', 1, 15, 1, 0, 0),
       (17, 'external', 'تور خارجی', 1, 15, 1, 0, 0),
       (18, 'travel-guide', 'راهنمای سفر', 0, 0, 1, 1, 0),
       (19, 'turkey', 'ترکیه', 2, 6, 1, 1, 0),
       (21, 'georgia', 'گرجستان', 2, 6, 1, 1, 0),
       (22, 'armenia', 'ارمنستان', 2, 6, 1, 1, 0),
       (23, 'tailand', 'تایلند', 2, 6, 1, 1, 0),
       (24, 'azerbaijan', 'آذربایجان', 2, 6, 1, 1, 0),
       (25, 'cyprus', 'قبرس', 2, 6, 1, 1, 0),
       (26, 'china', 'چین', 2, 6, 1, 1, 0),
       (27, 'india', 'هند', 2, 6, 1, 1, 0),
       (28, 'russia', 'روسیه', 2, 6, 1, 1, 0),
       (29, 'france', 'فرانسه', 2, 6, 1, 1, 0),
       (30, 'america', 'آمریکا', 2, 6, 1, 1, 0),
       (31, 'germany', 'آلمان', 2, 6, 1, 1, 0),
       (32, 'unitedarabemirates', 'امارات متحده عربی', 2, 6, 1, 1, 0),
       (33, 'spain', 'اسپانیا', 2, 6, 0, 1, 0),
       (34, 'england', 'انگلستان', 2, 6, 1, 1, 0),
       (35, 'italy', 'ایتالیا', 2, 6, 1, 1, 0),
       (36, 'bolivia', 'بولیوی', 2, 6, 0, 1, 0),
       (37, 'greece', 'یونان', 2, 6, 0, 1, 0),
       (38, 'costarica', 'کاستاریکا', 2, 6, 0, 1, 0),
       (39, 'vietnam', 'ویتنام', 2, 6, 0, 1, 0),
       (40, 'iceland', 'ایسلند', 2, 6, 0, 1, 0),
       (41, 'romania', 'رومانی', 2, 6, 0, 1, 0),
       (42, 'srilanka', 'سریلانکا', 2, 6, 1, 1, 0),
       (43, 'nepal', 'نپال', 2, 6, 0, 1, 0),
       (44, 'argentina', 'آرژانتین', 2, 6, 0, 1, 0),
       (45, 'fiji', 'فیجی', 2, 6, 0, 1, 0),
       (46, 'cambodia', 'کامبوج', 2, 6, 0, 1, 0),
       (47, 'portugal', 'پرتغال', 2, 6, 0, 1, 0),
       (48, 'peru', 'پرو', 2, 6, 0, 1, 0),
       (49, 'hungary', 'مجارستان', 2, 6, 0, 1, 0),
       (50, 'bulgaria', 'بلغارستان', 2, 6, 1, 1, 0),
       (51, 'austria', 'اتریش', 2, 6, 1, 1, 0),
       (52, 'canada', 'کانادا', 2, 6, 1, 1, 0),
       (53, 'japan', 'ژاپن', 2, 6, 1, 1, 0),
       (54, 'qatar', 'قطر', 2, 6, 1, 1, 0),
       (55, 'mashhad', 'مشهد', 2, 7, 1, 1, 0),
       (56, 'tehran', 'تهران', 2, 7, 1, 1, 0),
       (57, 'esfahan', 'اصفهان', 2, 7, 1, 1, 0),
       (58, 'gorgan', 'گرگان', 2, 7, 1, 1, 0),
       (59, 'shiraz', 'شیراز', 2, 7, 1, 1, 0),
       (60, 'yazd', 'یزد', 2, 7, 1, 1, 0),
       (61, 'tabriz', 'تبریز', 2, 7, 1, 1, 0),
       (62, 'ahvaz', 'اهواز', 2, 7, 1, 1, 0),
       (63, 'kish', 'کیش', 2, 7, 1, 1, 0),
       (64, 'bandarabbas', 'بندر عباس', 2, 7, 1, 1, 0),
       (65, 'kermanshah', 'کرمانشاه', 2, 7, 1, 1, 0),
       (66, 'qeshm', 'قشم', 2, 7, 1, 1, 0),
       (67, 'abadan', 'آبادان', 2, 7, 0, 1, 0),
       (68, 'orumieh', 'ارومیه', 2, 7, 0, 1, 0),
       (69, 'bushehr', 'بوشهر', 2, 7, 1, 1, 0),
       (70, 'sanandaj', 'سنندج', 2, 7, 1, 1, 0),
       (71, 'chabahar', 'چابهار', 2, 7, 1, 1, 0),
       (72, 'zahedan', 'زاهدان', 2, 7, 0, 1, 0),
       (73, 'kerman', 'کرمان', 2, 7, 1, 1, 0),
       (74, 'ardebil', 'اردبیل', 2, 7, 1, 1, 0),
       (75, 'rasht', 'رشت', 2, 7, 1, 1, 0),
       (76, 'dezful', 'دزفول', 2, 7, 0, 1, 0),
       (77, 'birjand', 'بیرجند', 2, 7, 0, 1, 0),
       (78, 'ilam', 'ایلام', 2, 7, 0, 1, 0),
       (79, 'ramsar', 'رامسر', 2, 7, 1, 1, 0),
       (80, 'lorestan', 'لرستان', 2, 7, 1, 1, 0),
       (81, 'zabul', 'زابل', 2, 7, 0, 1, 0),
       (82, 'sari', 'ساری', 2, 7, 1, 1, 0),
       (83, 'sirjan', 'سیرجان', 2, 7, 0, 1, 0),
       (84, 'bojnord', 'بجنورد', 2, 7, 1, 1, 0),
       (85, 'shahrud', 'شاهرود', 2, 7, 0, 1, 0),
       (86, 'shahrekord', 'شهرکرد', 2, 7, 0, 1, 0),
       (87, 'jiroft', 'جیرفت', 2, 7, 0, 1, 0),
       (88, 'rafsanjan', 'رفسنجان', 2, 7, 0, 1, 0),
       (89, 'sabzevar', 'سبزوار', 2, 7, 1, 1, 0),
       (90, 'khoy', 'خوی', 2, 7, 0, 1, 0),
       (91, 'kaleh', 'کلاله', 2, 7, 0, 1, 0),
       (92, 'bam', 'بم', 2, 7, 0, 1, 0),
       (93, 'gachsaran', 'گچساران', 2, 7, 0, 1, 0),
       (94, 'indonesia', 'اندونزی', 2, 6, 1, 1, 0),
       (95, 'mashhad', 'مشهد', 2, 16, 1, 1, 0),
       (96, 'kish', 'کیش', 2, 16, 1, 1, 0),
       (97, 'qeshm', 'قشم', 2, 16, 1, 1, 0),
       (98, 'shiraz', 'شیراز', 2, 16, 1, 1, 0),
       (99, 'esfahan', 'اصفهان', 2, 16, 0, 1, 0),
       (100, 'khazar', 'شمال', 2, 16, 0, 1, 0),
       (101, 'tabriz', 'تبریز', 2, 16, 0, 1, 0),
       (102, 'kermanshah', 'کرمانشاه', 2, 16, 0, 1, 0),
       (103, 'dubai', 'دبی', 2, 17, 1, 1, 0),
       (104, 'turkey', 'ترکیه', 2, 17, 1, 1, 0),
       (105, 'georgia', 'گرجستان', 2, 17, 1, 1, 0),
       (106, 'armenia', 'ارمنستان', 2, 17, 0, 1, 0),
       (107, 'russia', 'روسیه', 2, 17, 0, 1, 0),
       (108, 'malaysia', 'مالزی', 2, 17, 0, 1, 0),
       (109, 'thailand', 'تایلند', 2, 17, 1, 1, 0),
       (110, 'bali', 'بالی', 2, 17, 0, 1, 0),
       (111, 'maldiv', 'مالدیو', 2, 17, 0, 1, 0),
       (112, 'azerbaijan', 'آذربایجان', 2, 17, 0, 1, 0),
       (113, 'greece', 'یونان', 2, 17, 0, 1, 0),
       (114, 'china', 'چین', 2, 17, 0, 1, 0),
       (115, 'cyprus', 'قبرس', 2, 17, 0, 1, 0),
       (116, 'bulgaria', 'بلغارستان', 2, 17, 0, 1, 0),
       (117, 'india', 'هند', 2, 17, 0, 1, 0),
       (119, 'singaporetour', 'سنگاپور', 2, 17, 0, 1, 0),
       (120, 'greatbritain', 'بریتانیا', 2, 6, 0, 1, 0),
       (121, 'morocco', 'مراکش', 2, 6, 1, 1, 0),
       (122, 'kazakhstan', 'قزاقستان', 2, 6, 0, 1, 0),
       (123, 'lithuania', 'لیتوانی', 2, 6, 0, 1, 0),
       (124, 'luxembourg', 'لوکزامبورگ', 2, 6, 1, 1, 0),
       (125, 'macedonia', 'مقدونیه', 2, 6, 0, 1, 0),
       (126, 'malt', 'مالت', 2, 6, 0, 1, 0),
       (127, 'moldavia', 'مولداوی', 2, 6, 0, 1, 0),
       (128, 'munaco', 'موناکو', 2, 6, 0, 1, 0),
       (129, 'serbia', 'صربستان', 2, 6, 1, 1, 0),
       (130, 'albania', 'آلبانی', 2, 6, 0, 1, 0),
       (131, 'andorra', 'آندورا', 2, 6, 0, 1, 0),
       (132, 'belarus', 'بلاروس', 2, 6, 0, 1, 0),
       (133, 'belgium', 'بلژیک', 2, 6, 1, 1, 0),
       (134, 'bosnia', 'بوسنی', 2, 6, 0, 1, 0),
       (135, 'czechrepublic', 'جمهوری چک', 2, 6, 0, 1, 0),
       (136, 'estonia', 'استونی', 2, 6, 0, 1, 0),
       (137, 'finland', 'فنلاند', 2, 6, 1, 1, 0),
       (138, 'ireland', 'ایرلند', 2, 6, 0, 1, 0),
       (139, 'netherlands', 'هلند', 2, 6, 1, 1, 0),
       (140, 'norway', 'نروژ', 2, 6, 0, 1, 0),
       (141, 'poland', 'لهستان', 2, 6, 1, 1, 0),
       (142, 'sanmarino', 'سن مارینو', 2, 6, 0, 1, 0),
       (143, 'slovakia', 'اسلواکی', 2, 6, 0, 1, 0),
       (144, 'slovenia', 'اسلوونی', 2, 6, 0, 1, 0),
       (145, 'sweden', 'سوئد', 2, 6, 1, 1, 0),
       (146, 'swiss', 'سوئیس', 2, 6, 1, 1, 0),
       (147, 'ukraine', 'اوکراین', 2, 6, 0, 1, 0),
       (148, 'vatican', 'واتیکان', 2, 6, 0, 1, 0),
       (149, 'azerbaijan', 'آذربایجان', 2, 7, 0, 1, 0),
       (150, 'australia', 'استرالیا', 2, 6, 1, 1, 0),
       (151, 'hamedan', 'همدان', 2, 7, 0, 1, 0),
       (152, 'hormozgan', 'هرمزگان', 2, 7, 1, 1, 0),
       (153, 'singapore', 'سنگاپور', 2, 6, 1, 1, 0),
       (154, 'oman', 'عمان', 2, 6, 1, 1, 0),
       (155, 'bahrain', 'بحرین', 2, 6, 0, 1, 0),
       (156, 'malaysia', 'مالزی', 2, 6, 1, 1, 0),
       (157, 'lebanon', 'لبنان', 2, 6, 1, 1, 0),
       (158, 'bandaretorkaman', 'بندر ترکمن', 2, 7, 0, 1, 0),
       (159, 'ostanemarkazi', 'استان مرکزی', 2, 7, 0, 1, 0),
       (160, 'maldives', 'مالدیو', 2, 6, 0, 1, 0),
       (161, 'south africa', 'آفریقای جنوبی', 2, 6, 0, 1, 0),
       (162, 'newzealand', 'نیوزلند', 2, 6, 0, 1, 0),
       (163, 'kenya', 'کنیا', 2, 6, 0, 1, 0),
       (164, 'iraq', 'عراق', 2, 6, 0, 1, 0),
       (165, 'mazandaran', 'مازندران', 2, 7, 1, 1, 0),
       (166, 'qazvin', 'قزوین', 2, 7, 1, 1, 0),
       (167, 'gilan', 'گیلان', 2, 7, 1, 1, 0),
       (168, 'visa', 'ویزا', 2, 0, 1, 1, 0),
       (169, 'yazd', 'یزد', 2, 16, 1, 1, 0),
       (171, 'abadan', 'آبادان', 2, 7, 1, 0, 0),
       (172, 'serbia', 'صربستان', 2, 17, 1, 1, 0),
       (173, 'netherlands', 'هلند', 2, 17, 1, 1, 0),
       (174, 'ireland', 'ایرلند', 2, 17, 1, 1, 0),
       (175, 'belgium', 'بلژیک', 2, 17, 1, 1, 0),
       (176, 'poland', 'لهستان', 2, 17, 1, 1, 0),
       (177, 'newzealand', 'نیوزلند', 2, 17, 1, 1, 0),
       (178, 'lebanon', 'لبنان', 2, 17, 1, 1, 0),
       (179, 'australia', 'استرالیا', 2, 17, 1, 1, 0),
       (180, 'ukraine', 'اوکراین', 2, 17, 1, 1, 0),
       (181, 'kazakhstan', 'قزاقستان', 2, 17, 1, 1, 0),
       (182, 'morocco', 'مراکش', 2, 17, 1, 1, 0),
       (183, 'spain', 'اسپانیا', 2, 17, 1, 1, 0),
       (184, 'japan', 'ژاپن', 2, 17, 1, 1, 0),
       (185, 'hungary', 'مجارستان', 2, 17, 1, 1, 0),
       (186, 'iceland', 'ایسلند', 2, 17, 1, 1, 0),
       (187, 'argentina', 'آرژانتین', 2, 17, 1, 1, 0),
       (188, 'baku', 'باکو', 2, 17, 1, 1, 0),
       (189, 'baku', 'باکو', 2, 6, 0, 1, 0),
       (190, 'najaf', 'نجف', 2, 6, 0, 1, 0),
       (191, 'karbala', 'کربلا', 2, 6, 0, 1, 0),
       (192, 'uman', 'عمان', 2, 17, 1, 1, 0),
       (193, 'canada', 'کانادا', 2, 17, 1, 1, 0),
       (194, 'turkmenistan', 'ترکمنستان', 2, 17, 1, 1, 0),
       (195, 'austria', 'اتریش', 2, 17, 1, 1, 0),
       (196, 'uzbekistan', 'ازبکستان', 2, 17, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `blogComment`
--

CREATE TABLE `blogComment`
(
    `commentId`           int(10) UNSIGNED             NOT NULL COMMENT 'شناسه کامنت',
    `commentType`         varchar(150)     DEFAULT NULL COMMENT 'کامنت از کجا؟ blog,site,...',
    `commentItemId`       int(10) UNSIGNED DEFAULT NULL COMMENT 'blogId',
    `commentDescription`  text COMMENT 'توضیحات کامنت',
    `commentStatus`       tinyint(4)       DEFAULT NULL COMMENT 'وضعیت کامنت',
    `commentCountLike`    int(11)          DEFAULT '0' COMMENT 'تعداد لایک های یک یادداشت',
    `commentCountDislike` int(11)          DEFAULT '0' COMMENT 'تعداد دیس لایک برای این یادداشت',
    `commentUserId`       int(10) UNSIGNED DEFAULT NULL COMMENT 'شناسه کاربری ارسال کامنت از سشن',
    `commentUserName`     varchar(100)     DEFAULT NULL COMMENT 'نام کاربری ارسال کامنت از ورودی کاربر',
    `commentUserNameReal` varchar(200)     DEFAULT NULL COMMENT 'نام کاربری از سشن',
    `commentIpAddress`    varchar(30)      DEFAULT NULL COMMENT 'آیپی کامنت',
    `commentRegisterDate` datetime         DEFAULT NULL COMMENT 'تاریخ ثبت کامنت',
    `commentHashtag`      text COMMENT 'مکان یادداشت در صفحه جزئیات مقاله',
    `commentDevice`       varchar(100)     DEFAULT NULL COMMENT 'نام دستگاه',
    `commentOs`           varchar(100)     DEFAULT NULL COMMENT 'نام سیستم عامل',
    `commentBrowser`      varchar(100)     DEFAULT NULL COMMENT 'نام مرورگر',
    `commentCopy`         int(11)          DEFAULT NULL COMMENT 'کپی از کامنت سرویس قبلی',
    `commentMobile`       text COMMENT 'شماره موبایل',
    `commentOldLink`      text COMMENT 'لینک مقاله',
    `commentParrentId`    int(10)          DEFAULT '0' NULL COMMENT 'commentId this table ',
    `commentHasChild`     TINYINT(4)       DEFAULT '0' NULL COMMENT 'آیا این کامنت کامنت دیگری دارد یعنی حواب کامنت می باشد ',
    `commentRate`         TINYINT(4)       DEFAULT '0' NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT =' تمام کامنت هایی که کاربران برای مقاله ها داده اند';

-- --------------------------------------------------------

--
-- Table structure for table `blogFavorite`
--

CREATE TABLE `blogFavorite`
(
    `favoriteId`           int(10) UNSIGNED NOT NULL COMMENT 'شناسه',
    `favoriteType`         varchar(100)     DEFAULT 'blog' COMMENT 'نوع',
    `favoriteBlogId`       int(10) UNSIGNED DEFAULT NULL COMMENT 'شناسه مقاله',
    `favoriteUserId`       int(10) UNSIGNED DEFAULT NULL COMMENT 'شناسه کاربر از سشن',
    `favoriteUserName`     varchar(100)     DEFAULT NULL COMMENT 'نام کاربر از سشن',
    `favoriteRegisterDate` datetime         DEFAULT NULL COMMENT 'تاریخ ثبت '
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='این جدول مقاله های مورد علاقه یک کاربر ذخیره میگردد';

-- --------------------------------------------------------

--
-- Table structure for table `blogFile`
--

CREATE TABLE `blogFile`
(
    `fileId`           int(10) UNSIGNED NOT NULL,
    `fileAdminId`      int(10) UNSIGNED DEFAULT '0',
    `fileAdminName`    varchar(200)     DEFAULT NULL,
    `fileType`         varchar(100)     DEFAULT NULL,
    `fileBlogId`       int(10) UNSIGNED DEFAULT '0',
    `fileRegisterDate` datetime         DEFAULT NULL,
    `fileSize`         int(11) UNSIGNED DEFAULT NULL,
    `fileName`         varchar(400)     DEFAULT NULL,
    `fileUrl`          varchar(400)     DEFAULT NULL,
    `fileAlt`          text COMMENT 'alt برای موتور جستجو',
    `fileCopy`         tinyint(4)       DEFAULT NULL COMMENT 'کپی از وبلاگ قبلی',
    `fileDevice`       VARCHAR(200)     DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='تمام فایل های یک مقاله در این جدول ذخیره میشه';

-- --------------------------------------------------------

--
-- Table structure for table `blogLike`
--

CREATE TABLE `blogLike`
(
    `likeId`           int(10) UNSIGNED NOT NULL COMMENT 'شناسه لایک',
    `likeBlogId`       int(10) UNSIGNED DEFAULT NULL COMMENT 'شناسه مقاله',
    `likeUserId`       int(10) UNSIGNED DEFAULT NULL COMMENT 'شناسه کاربر از سشن',
    `likeUserName`     varchar(100)     DEFAULT NULL COMMENT 'نام کاربر از سشن',
    `likeRegisterDate` datetime         DEFAULT NULL COMMENT 'تاریخ ثبت لایک',
    `likeCount`        int(11)          DEFAULT '0' COMMENT 'تعداد لایک های یک مقاله که کاربر لایک کرده'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='لایک های یک مقاله در این جدول نگهداری میشه';

-- --------------------------------------------------------

--
-- Table structure for table `blogTag`
--

CREATE TABLE `blogTag`
(
    `tagId`           int(10) UNSIGNED NOT NULL,
    `tagNameFa`       varchar(150)     DEFAULT NULL COMMENT 'نام تگ',
    `tagNameEn`       varchar(150)     DEFAULT NULL COMMENT 'نام تگ انگلیسی',
    `tagRegisterDate` datetime         DEFAULT NULL COMMENT 'تاریخ ثبت تگ',
    `tagCountClick`   int(10) UNSIGNED DEFAULT '0' COMMENT 'تعداد کلیک هایی که روی این تگ خورده',
    `tagAdminId`      int(11)          DEFAULT NULL COMMENT 'شناسه کاربری که تگ رو ایجاد کرده',
    `tagAdminName`    varchar(100)     DEFAULT NULL COMMENT 'نام کاربری که تگ رو ایجاد کرده',
    `tagDeleted`      tinyint(4)       DEFAULT '0' COMMENT 'تگ حذف شده'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='این جدول تمام تگ ها رو نگهداری می کنه';

alter table blogTag
    add column `tagRedirectTo`                   text       DEFAULT NULL COMMENT 'تگ مورد نظر به این آدرس ریدایرکت میشه',
    add column `tagRedirectTo2`                  text       DEFAULT NULL COMMENT 'بدون اینکود شده',
    add column `tagRedirectManual`               tinyint(4) DEFAULT NULL COMMENT 'ریدایرکت دستی شده یا سیستمی؟ 0|1',
    add column `tagRedirectToSystemAutomaticLog` text       DEFAULT NULL COMMENT 'لاگ ریدایرکت به صورت سیستمی';

-- --------------------------------------------------------

--
-- Table structure for table `blogVisit`
--

CREATE TABLE `blogVisit`
(
    `visitId`           int(10) UNSIGNED NOT NULL COMMENT 'شناسه',
    `visitBlogType`     varchar(150)     DEFAULT 'blog' COMMENT 'video OR blog',
    `visitBlogId`       int(10) UNSIGNED DEFAULT NULL COMMENT 'شناسه مقاله',
    `visitUserId`       int(10) UNSIGNED DEFAULT NULL COMMENT 'شناسه کاربر از سشن',
    `visitUserName`     varchar(100)     DEFAULT NULL COMMENT 'نام کاربر از سشن',
    `visitCount`        int(11)          DEFAULT NULL COMMENT 'چند بار دیده شده',
    `visitRegisterDate` datetime         DEFAULT NULL COMMENT 'تاریخ ثبت'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='کسایی که یک مقاله را نگاه کرده اند';


CREATE TABLE `discount_code`
(
    `id`                int(11)     NOT NULL,
    `regdate`           varchar(50)          DEFAULT '',
    `startdate`         varchar(50)          DEFAULT '',
    `expdate`           varchar(50)          DEFAULT '',
    `code`              varchar(50)          DEFAULT '',
    `amount`            varchar(50)          DEFAULT '',
    `type`              tinyint(4)  NOT NULL DEFAULT '1',
    `status`            varchar(5)           DEFAULT '1',
    `admin`             varchar(20)          DEFAULT '',
    `logs`              text,
    `maxuse`            int(11)              DEFAULT '0',
    `counter`           int(11)              DEFAULT '0',
    `services`          varchar(200)         DEFAULT '',
    `masir`             text,
    `limitip`           tinyint(1)  NOT NULL DEFAULT '0',
    `salesby`           varchar(50)          DEFAULT '',
    `provider`          text,
    `fnumber`           text,
    `api`               varchar(100)         DEFAULT '',
    `cabin`             varchar(50)          DEFAULT '',
    `setting_id`        TINYINT(11) NOT NULL,
    `user_id`           INT(20)     NOT NULL,
    `sms_status`        TINYINT(11) NOT NULL,
    `sms_sent_at`       BIGINT(20)  NOT NULL,
    `user_limit`        varchar(50)          DEFAULT NULL,
    `admin_last_update` varchar(200)         DEFAULT NULL,
    `mobile` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'برای این شماره موبایلها (درصورت وجود) اعمال شود (CSV)'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


CREATE TABLE `freemelicode`
(
    `id`       int(11) NOT NULL,
    `ticketid` varchar(50) DEFAULT NULL,
    `nid`      varchar(50) DEFAULT NULL,
    `admin`    varchar(50) DEFAULT NULL,
    `time`     varchar(50) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


CREATE TABLE `console_log`
(
    `id`      int(11) NOT NULL,
    `regdate` varchar(50) DEFAULT NULL,
    `pid`     varchar(10) DEFAULT NULL,
    `com`     varchar(50) DEFAULT NULL,
    `res`     text,
    `admin`   varchar(50) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `contactus`
(
    `id`      int(11) NOT NULL,
    `regdate` varchar(50)  DEFAULT NULL,
    `name`    varchar(200) DEFAULT NULL,
    `phone`   varchar(50)  DEFAULT NULL,
    `content` text,
    `email`   varchar(200) DEFAULT NULL,
    `type`    varchar(100) DEFAULT NULL,
    `status`  varchar(100) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `insurance_saman_register`
(
    `id`                    int(20) UNSIGNED                                        NOT NULL,
    `ticketid`              varchar(20)                                                      DEFAULT NULL,
    `nationalCode`          varchar(20) CHARACTER SET utf8                          NOT NULL COMMENT 'کد ملی',
    `persianFirstName`      varchar(80) CHARACTER SET utf8                          NOT NULL COMMENT 'نام بیمه گزار',
    `persianLastName`       varchar(200) CHARACTER SET utf8                                  DEFAULT NULL COMMENT 'نام خانوادگی بیمه گزار',
    `englishFirstName`      varchar(80)                                             NOT NULL COMMENT 'نام انگلیسی بیمه گزار',
    `englishLastName`       varchar(100)                                            NOT NULL COMMENT 'نام خانوادگی انگلیسی بیمه گزار',
    `birthDate`             varchar(50)                                             NOT NULL COMMENT 'تاریخ تولد بیمه گزار',
    `mobile`                varchar(20)                                                      DEFAULT NULL COMMENT 'شماره موبایل بیمه گزار',
    `email`                 varchar(100)                                                     DEFAULT NULL COMMENT 'ایمیل بیمه گزار',
    `gender`                tinyint(4)                                                       DEFAULT NULL COMMENT 'جنسیت بیمه گزار',
    `passportNo`            varchar(30)                                             NOT NULL COMMENT ' شماره پاسپورت بیمه گزار',
    `countryCode`           varchar(30)                                             NOT NULL COMMENT 'کد کشور بیمه گزار',
    `countryName`           varchar(70) CHARACTER SET utf8                                   DEFAULT NULL,
    `durationOfStay`        varchar(10)                                             NOT NULL COMMENT 'مدت زمان اقامت بیمه گزار',
    `travelKind`            tinyint(4)                                              NOT NULL COMMENT '1=single 2= multi نوع ویزا',
    `planCode`              varchar(20)                                             NOT NULL COMMENT 'کد طرح بیمه گزار',
    `customerCode`          varchar(20)                                                      DEFAULT NULL COMMENT 'شماره مشتری ',
    `cancelDate`            varchar(50)                                                      DEFAULT NULL,
    `policyNo`              varchar(100)                                                     DEFAULT NULL,
    `bimehNo`               varchar(20)                                                      DEFAULT NULL COMMENT 'شماره بیمه ',
    `agentCode`             varchar(20)                                                      DEFAULT NULL,
    `regdate`               varchar(50)                                             NOT NULL COMMENT 'زمان ثبت بیمه گزار',
    `status`                tinyint(4)                                                       DEFAULT '1' COMMENT 'وضعیت بیمه گزار',
    `registerInput`         text COMMENT 'خروجی از وب سرویس',
    `registerOutput`        text COMMENT 'جیسون ورودی به سرویس',
    `confirmInput`          text COMMENT 'ورودی تایید شده جیسون',
    `confirmOutput`         text COMMENT 'خروجی تایید شده جیسون',
    `pidtype`               varchar(10) CHARACTER SET utf8                                   DEFAULT 'hami',
    `payment_rand`          varchar(10) CHARACTER SET utf8                                   DEFAULT NULL,
    `payment_type`          int(11)                                                          DEFAULT NULL,
    `payment_status`        tinyint(4)                                                       DEFAULT '0',
    `payment_kind`          varchar(20)                                                      DEFAULT NULL,
    `tickets_paydescribe`   varchar(200)                                                     DEFAULT NULL,
    `price`                 int(20)                                                          DEFAULT NULL,
    `fprice`                int(11)                                                          DEFAULT NULL,
    `finalprice`            int(11)                                                          DEFAULT NULL,
    `paymentID`             int(11)                                                          DEFAULT NULL,
    `emailed`               tinyint(4)                                                       DEFAULT '0',
    `pnr`                   varchar(200) CHARACTER SET utf8                                  DEFAULT NULL,
    `os`                    varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `browser`               varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `device`                varchar(50) CHARACTER SET utf8                                   DEFAULT NULL,
    `salesby`               varchar(60)                                                      DEFAULT NULL,
    `user_id`               int(11)                                                          DEFAULT NULL,
    `user_name`             varchar(100) CHARACTER SET utf8                                  DEFAULT NULL,
    `error`                 int(11)                                                          DEFAULT NULL,
    `code_error`            int(11)                                                          DEFAULT NULL,
    `ip`                    varchar(20)                                                      DEFAULT NULL,
    `priceGross`            int(11)                                                          DEFAULT NULL COMMENT 'قیمت طرح',
    `priceAvarez`           int(11)                                                          DEFAULT NULL COMMENT 'عوارض طرح',
    `priceTax`              int(11)                                                          DEFAULT NULL COMMENT 'مالیات طرح',
    `priceDiscount`         int(11)                                                          DEFAULT NULL COMMENT 'تخفیف طرح',
    `priceTotal`            int(11)                                                          DEFAULT NULL COMMENT 'قیمت کل طرح',
    `priceMarkup`           int(11)                                                          DEFAULT NULL,
    `orderId`               int(11)                                                          DEFAULT NULL,
    `credit`                varchar(20)                                                      DEFAULT NULL,
    `pdfPolicy`             varchar(500)                                                     DEFAULT NULL,
    `pdfCoveredItems`       varchar(500)                                                     DEFAULT NULL,
    `pdfPublicConditions`   varchar(500)                                                     DEFAULT NULL,
    `user_rank`             TINYINT(1)                                              NULL,
    `lottery`               TEXT CHARACTER SET utf8 COLLATE utf8_general_ci         NULL,
    `backlink`              VARCHAR(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `codeGroup`             int(11)                                                          DEFAULT NULL,
    `esrequest_status`      TINYINT(1)                                              NULL     DEFAULT NULL,
    `esrequest_date`        VARCHAR(100)                                            NULL     DEFAULT NULL,
    `esrequest_adminId`     INT                                                     NULL     DEFAULT NULL,
    `esrequest_price`       INT                                                     NULL     DEFAULT NULL,
    `esrequest_paytype`     TINYINT(1)                                              NOT NULL DEFAULT '0',
    `esrequest_description` TEXT                                                    NOT NULL,
    `markup`                INT                                                     NULL     DEFAULT '0',
    `profit`                INT                                                     NULL     DEFAULT '0',
    `statusSanad`           TINYINT(2)                                              NULL,
    `typeSanad`             VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL,
    `logSanad`              TEXT CHARACTER SET utf8 COLLATE utf8_general_ci         NULL,
    `salesDaftarRuzname`    VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `smsDaftarRuzname`      VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `priceapi`              INT                                                     NULL,
    `tafzilprovider`        INT                                                     NULL,
    `totalDiscount`         VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL,
    `typeService`           VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL     DEFAULT 'insurance',
    `tafzilTarafHesab`      INT                                                     NULL     DEFAULT '0',
    `tafzilHazine`          INT                                                     NULL     DEFAULT '0',
    `tafzilDaramad`         INT                                                     NULL     DEFAULT '0',
    `hamiSegment`           INT                                                     NULL     DEFAULT '0',
    `providerSegment`       INT                                                     NULL     DEFAULT '0',
    `refundPriceBroker`     INT                                                     NULL     DEFAULT '0',
    `refundPricePassenger`  INT                                                     NULL     DEFAULT '0',
    `refundPriceApi`        INT                                                     NULL     DEFAULT '0',
    `provider`              varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL,
    `paymentDaftarRuzname`  VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL,
    `buyhand_id`            INT                                                     NULL,
    `refundRequest_status`  TINYINT(1)                                              NOT NULL,
    `source_url` VARCHAR(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

ALTER TABLE `insurance_saman_register`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `insurance_saman_register`
    MODIFY `id` int(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;


CREATE TABLE `charge_mobile`
(
    `id`                    int(11)                                                 NOT NULL,
    `orderId`               varchar(200)                                                 DEFAULT NULL COMMENT 'شماره آیدی رسم سفر',
    `type`                  varchar(50)                                                  DEFAULT NULL COMMENT 'نوع سیم کارت',
    `name`                  varchar(150)                                                 DEFAULT NULL COMMENT 'نام مسافر',
    `family`                varchar(35)                                                  DEFAULT NULL COMMENT 'فامیل مسافر',
    `mobile`                varchar(20)                                                  DEFAULT NULL COMMENT 'شماره موبایل ',
    `email`                 varchar(110)                                                 DEFAULT NULL,
    `price`                 varchar(20)                                                  DEFAULT NULL COMMENT 'قیمت شارژ',
    `fprice`                int(11)                                                      DEFAULT NULL,
    `finalprice`            int(11)                                                      DEFAULT NULL,
    `regdate`               varchar(50)                                                  DEFAULT NULL COMMENT 'زمان ثبت رکورد',
    `status`                tinyint(4)                                                   DEFAULT NULL,
    `paymentID`             int(11)                                                      DEFAULT NULL COMMENT 'شماره پرداخت',
    `payment_status`        tinyint(4)                                                   DEFAULT 0 COMMENT 'وضعیت پرداخت ',
    `user_id`               int(11)                                                      DEFAULT NULL,
    `user_name`             varchar(100)                                                 DEFAULT NULL COMMENT 'نام کاربری که شارژ میخره',
    `steps`                 text                                                         DEFAULT NULL COMMENT 'تو چه مرحله ای هستش',
    `numberp`               varchar(50)                                                  DEFAULT '1' COMMENT 'تعداد نفرات',
    `ip`                    varchar(20)                                                  DEFAULT NULL,
    `discount`              int(11)                                                      DEFAULT NULL COMMENT 'تخفیف',
    `markup`                varchar(10)                                                  DEFAULT NULL COMMENT 'مارک آپ که تو تنظیمات بوده',
    `salesby`               varchar(150)                                                 DEFAULT NULL,
    `device`                varchar(150)                                                 DEFAULT NULL,
    `os`                    varchar(150)                                                 DEFAULT NULL,
    `browser`               varchar(150)                                                 DEFAULT NULL,
    `payment_rand`          varchar(20)                                                  DEFAULT NULL,
    `webservice_error`      varchar(1000)                                                DEFAULT NULL,
    `msgRasmesafar`         text                                                         DEFAULT NULL COMMENT 'msg رسم سفر',
    `tickets_paydescribe`   text                                                         DEFAULT NULL,
    `payment_type`          int(20)                                                      DEFAULT NULL,
    `payment_kind`          varchar(20)                                                  DEFAULT NULL,
    `description`           varchar(200)                                                 DEFAULT NULL COMMENT 'توضیحات',
    `pnr`                   varchar(40)                                                  DEFAULT NULL COMMENT 'کد پیگیری ',
    `requestParams`         text                                                         DEFAULT NULL COMMENT 'با چه پارامترهای اقدام به خرید شده ',
    `responsePrams`         text                                                         DEFAULT NULL COMMENT 'جواب وب سرویس چی بوده ',
    `backlink`              text                                                         DEFAULT NULL COMMENT 'طرف از کجا اومده تو سایت',
    `pidtype`               varchar(200)                                                 DEFAULT NULL,
    `profit`                int(11)                                                      DEFAULT NULL COMMENT 'سود',
    `user_rank`             tinyint(1)                                                   DEFAULT NULL,
    `lottery`               text                                                         DEFAULT NULL,
    `priceapi`              int(11)                                                      DEFAULT NULL COMMENT 'قیمت خام وب سرویس',
    `profitapi`             int(11)                                                      DEFAULT NULL COMMENT 'سود کل وب سرویس finalprice-price',
    `tafzilprovider`        int(11)                                                      DEFAULT NULL,
    `logSanad`              text                                                         DEFAULT NULL,
    `totalDiscount`         varchar(20)                                                  DEFAULT NULL COMMENT 'fprice - finalprice',
    `hamiSegment`           int(11)                                                      DEFAULT NULL,
    `providerSegment`       int(11)                                                      DEFAULT NULL,
    `totalSegment`          int(11)                                                      DEFAULT NULL,
    `provider`              varchar(500)                                                 DEFAULT NULL,
    `tafzilTarafHesab`      int(11)                                                      DEFAULT NULL COMMENT '301011 novinWays',
    `typeService`           varchar(20)                                                  DEFAULT 'chargemobile',
    `statusSanad`           TINYINT(2)                                              NULL DEFAULT '0',
    `typeSanad`             varchar(20)                                                  DEFAULT NULL,
    `salesDaftarRuzname`    varchar(500)                                                 DEFAULT NULL,
    `smsDaftarRuzname`      varchar(500)                                                 DEFAULT NULL,
    `tafzilHazine`          int(11)                                                      DEFAULT 0,
    `tafzilDaramad`         int(11)                                                      DEFAULT 0,
    `refundPriceBroker`     int(11)                                                      DEFAULT 0,
    `refundPricePassenger`  int(11)                                                      DEFAULT 0,
    `refundPriceApi`        int(11)                                                      DEFAULT 0,
    `hesabSood`             int(11)                                                      DEFAULT NULL,
    `serviceProviderTypeId` int(11)                                                      DEFAULT NULL,
    `paymentDaftarRuzname`  VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='این جدول برای شارژ موبایل استفاده میشه';



CREATE TABLE `smsgroup`
(
    `id`                int(11)      NOT NULL AUTO_INCREMENT,
    `regdate`           varchar(50)  NOT NULL,
    `text`              text         NOT NULL,
    `count`             int(11)      NOT NULL,
    `type`              varchar(20)  NOT NULL DEFAULT 'group' COMMENT 'group(پیام گروهی) userCall(پیامک مرکز تماس)',
    `startuser`         varchar(50)  NOT NULL,
    `enduser`           varchar(50)  NOT NULL,
    `currentuser`       varchar(50)  NOT NULL,
    `totalprice`        varchar(50)  NOT NULL,
    `status`            tinyint(1)   NOT NULL DEFAULT 0,
    `admin`             varchar(50)  NOT NULL,
    `date_send_to`      varchar(100)          DEFAULT NULL COMMENT 'ارسال تنها در "تاریخ و ساعت ارسال"',
    `date_send`         varchar(100) NOT NULL COMMENT 'تاریخ ارسال',
    `formHour_send`     int(11)      NOT NULL,
    `toHour_send`       int(11)      NOT NULL,
    `offsetUser`        varchar(50)  NOT NULL,
    `limitUser`         int(11)      NOT NULL,
    `user_rank`         tinyint(1)            DEFAULT NULL,
    `user_call_service` tinyint(4)            DEFAULT NULL COMMENT 'سرویس (شناسه جدول user_call_services)',
    `user_call_type`    varchar(200)          DEFAULT NULL COMMENT 'لیست علتهای تماس (شناسه های جدول user_call_types)',
    `query_array` TEXT CHARACTER SET utf8 COLLATE utf8_persian_ci NULL COMMENT 'مربوط به type=userNotify',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;



CREATE TABLE `login`
(
    `loginId`        int(11) NOT NULL,
    `loginIp`        varchar(50)  DEFAULT NULL COMMENT 'آیپی ',
    `regdate`        int(11)      DEFAULT NULL COMMENT 'تاریخ درج رکورد',
    `loginAdminId`   int(11)      DEFAULT NULL COMMENT 'آیدی ',
    `loginAdminUser` varchar(300) DEFAULT NULL COMMENT 'نام کاربری',
    `loginAdminName` varchar(300) DEFAULT NULL COMMENT 'نام کاربر'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='هر بار یک نفر لاگین میشه یک رکورد درج میشه';


/******************************************** TOUR TABLES **********************************************/

CREATE TABLE `tour_tickets2`
(
    `id`                         int(11)                                                 NOT NULL,
    `tour_id`                    varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `api_ticket_id`              varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `crg_pkg_id`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `htl_pkg_id`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tvl_pkg_id`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `go_crg_id`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `return_crg_id`              varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_from`                  varchar(120) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_to`                    varchar(120) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_name`                  varchar(70) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_start_date`            varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_end_date`              varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_night_count`           varchar(5) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `tour_day_count`             varchar(5) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `tour_kind`                  varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_type`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_comment`               text COLLATE utf8_persian_ci,
    `need_confirm`               varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `confirm`                    varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `user_id`                    varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_level`                 varchar(12) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_name`                  varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_name_family`           varchar(40) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_mobile`                varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_email`                 varchar(40) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_markup`                varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `passengers_count`           varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `tour_go_type`               varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_return_type`           varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_sell_type`             varchar(15) COLLATE utf8_persian_ci                     NOT NULL,
    `adl`                        varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `chd`                        varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `inf`                        varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `price`                      varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `fprice`                     varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `final_price`                varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `price_adl`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `price_chd`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `price_inf`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `discount`                   varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reg_date`                   varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy_date`                   varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `status`                     varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `payment_status`             varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `pidtype`                    varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `pnr`                        varchar(40) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `paymentID`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `refund`                     varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `refund_date`                varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `refund_status`              varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `payment_type`               varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `payment_kind`               varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tickets_paydescribe`        mediumtext COLLATE utf8_persian_ci,
    `payment_rand`               varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `refund_desc`                varchar(300) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `provided_by`                varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `need_to_reserve`            varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `reserver_user_id`           varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserver_user_name`         varchar(70) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `sold_by`                    varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_hami_markup`           varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_creator_hami_user_id`  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_account_api_hami_user` varchar(70) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `needaction_id`              varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `needaction_status`          varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `error_code`                 varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `error`                      varchar(500) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `system_params`              mediumtext COLLATE utf8_persian_ci,
    `steps_log`                  text COLLATE utf8_persian_ci,
    `salesby`                    varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `device`                     varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `os`                         varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `browser`                    varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy`                        varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `buy_type`                   varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy_status`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy_error`                  varchar(1000) COLLATE utf8_persian_ci                        DEFAULT NULL,
    `reserved1`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `reserved2`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `reserved3`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `reserved4`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `reserved5`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `user_rank`                  TINYINT(1)                                              NULL,
    `lottery`                    TEXT CHARACTER SET utf8 COLLATE utf8_general_ci         NULL,
    `backlink`                   VARCHAR(400) CHARACTER SET utf8 COLLATE utf8_general_ci,
    `provider`                   varchar(100) CHARACTER SET utf8                              DEFAULT NULL,
    `systemiparams`              TEXT                                                    NULL,
    `request_api`                TEXT                                                    NULL,
    `all_error`                  TEXT                                                    NULL,
    `tour_return_by`             VARCHAR(100)                                            NULL,
    `tour_go_by`                 VARCHAR(100)                                            NULL,
    `tour_atba_price_adl`        INT                                                     NULL,
    `tour_atba_price_chd`        INT                                                     NULL,
    `tour_atba_price_inf`        INT                                                     NULL,
    `tour_stay_in`               VARCHAR(100)                                            NULL,
    `follower_user_id`           INT                                                     NULL,
    `follower_user_name`         VARCHAR(100)                                            NULL,
    `hotel_adrs`                 VARCHAR(200)                                            NULL,
    `hotel_name`                 VARCHAR(100)                                            NULL,
    `hotel_enter_date`           BIGINT                                                  NULL,
    `hotel_leave_date`           BIGINT                                                  NULL,
    `hotel_services`             VARCHAR(200)                                            NULL,
    `hotel_room_count`           TINYINT(2)                                              NULL,
    `hotel_rooms_type`           VARCHAR(100)                                            NULL,
    `ticket1_from`               VARCHAR(100)                                            NULL,
    `ticket1_to`                 VARCHAR(100)                                            NULL,
    `ticket1_date`               BIGINT(20)                                              NULL,
    `ticket1_time`               VARCHAR(20)                                             NULL,
    `ticket1_airline`            VARCHAR(100)                                            NULL,
    `ticket1_class`              VARCHAR(10)                                             NULL,
    `ticket1_number`             INT                                                     NULL,
    `ticket2_from`               VARCHAR(100)                                            NULL,
    `ticket2_to`                 VARCHAR(100)                                            NULL,
    `ticket2_date`               BIGINT(20)                                              NULL,
    `ticket2_time`               VARCHAR(20)                                             NULL,
    `ticket2_airline`            VARCHAR(100)                                            NULL,
    `ticket2_class`              VARCHAR(10)                                             NULL,
    `ticket2_number`             INT                                                     NULL,
    `ticket1_type`               VARCHAR(20)                                             NULL,
    `ticket2_type`               VARCHAR(20)                                             NULL,
    `priceapi`                   INT                                                     NULL,
    `profitapi`                  INT                                                     NULL,
    `tafzilprovider`             INT                                                     NULL,
    `logSanad`                   TEXT                                                    NULL DEFAULT '',
    `totalDiscount`              VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT '',
    `typeService`                VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT 'tourD',
    `tafzilTarafHesab`           INT                                                     NULL DEFAULT '0',
    `tafzilHazine`               INT                                                     NULL DEFAULT '0',
    `tafzilDaramad`              INT                                                     NULL DEFAULT '0',
    `hamiSegment`                INT                                                     NULL DEFAULT '0',
    `providerSegment`            INT                                                     NULL DEFAULT '0',
    `profit`                     INT                                                     NULL DEFAULT '0',
    `markup`                     INT                                                     NULL DEFAULT '0',
    paymentDaftarRuzname         VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL,
    `voucher_status`             TINYINT(1)                                           NULL DEFAULT '1',
    `personelDaftarRuzname` BIGINT(20) NOT NULL,
    `profitDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `tour_ticket_passengers2`
(
    `id`                  int(11)      NOT NULL,
    `ticket_id`           int(11)                              DEFAULT NULL,
    `price`               varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `user_id`             varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `persian_name`        varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `persian_family`      varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `latin_name`          varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `latin_family`        varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `meli_code`           varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `birthdate`           varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `gender`              varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL,
    `passport_number`     varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `passport_start_date` varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `passport_end_date`   varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `passport_country`    varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `nationality`         varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `age_level`           varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL,
    `desc`                varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved1`           varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved2`           varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved3`           varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved4`           varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved5`           varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserve`             varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `buy`                 varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `faName`              VARCHAR(50)  NULL,
    `fprice`              INT          NULL,
    `final_price`         INT          NULL,
    `link`                VARCHAR(100) NULL,
    `jarimeRefund`        INT          NULL,
    `pnrRefund`           VARCHAR(50)  NULL,
    `dateRefund`          BIGINT       NULL,
    `refund`              INT          NULL,
    `userIdRefund`        INT          NULL,
    `userTypeRefund`      TINYINT(2)   NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `tour_tickets_carriages`
(
    `id`                int(11) NOT NULL,
    `ticket_id`         int(11) NOT NULL,
    `package_id`        varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `carriage_id`       varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `transfer_type`     varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `from`              varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `from_fa`           varchar(60) COLLATE utf8_persian_ci  DEFAULT NULL,
    `to`                varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `to_fa`             varchar(60) COLLATE utf8_persian_ci  DEFAULT NULL,
    `is_api`            varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `online_sell`       varchar(2) COLLATE utf8_persian_ci   DEFAULT NULL,
    `api_id`            varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `allowed_cargo`     varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `adl`               varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `chd`               varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `inf`               varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `adl_price`         varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `chd_price`         varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `inf_price`         varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_adl_price`   varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_chd_price`   varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_inf_price`   varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_price`       varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `date`              varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `clock`             varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `arrive_date`       varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `arrive_clock`      varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `type`              varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `company`           varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
    `company_fa`        varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `company_img`       varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
    `class`             varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `number`            varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `reserve`           varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `reserve_id`        varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `auto_buy`          varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `buy`               varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `buy_error`         varchar(800) COLLATE utf8_persian_ci DEFAULT NULL,
    `carriage_api_json` text COLLATE utf8_persian_ci,
    `reserved1`         varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved2`         varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved3`         varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved4`         varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved5`         varchar(100) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `tour_tickets_hotels`
(
    `id`         int(11) NOT NULL,
    `ticket_id`  int(11) NOT NULL,
    `hotel_id`   varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `hotel_name` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `city_id`    varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `city_name`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `first_date` varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `last_date`  varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `transfer`   varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `Catering`   varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `meals`      varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved1`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved2`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved3`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved4`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved5`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `tour_tickets_rooms`
(
    `id`                          int(11)                            NOT NULL,
    `ticket_id`                   int(11)                              DEFAULT NULL,
    `ticket_hotel_id`             int(11)                            NOT NULL,
    `hotel_id`                    varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `hotel_api_id`                varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `package_id`                  varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `room_id`                     varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `room_api_type`               varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `room_api_id`                 varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `room_name`                   varchar(150) COLLATE utf8_persian_ci DEFAULT NULL,
    `room_count`                  varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `type`                        varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `extra_service_count`         varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `ex_service_price_one_night`  varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `ex_service_price_all_nights` varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `adl`                         varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `chd`                         varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `inf`                         varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `price_single`                varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `price_adl`                   varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `price_chd`                   varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `price_inf`                   varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_price_single`          varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_price_adl`             varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_price_chd`             varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_price_inf`             varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `total_price`                 varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `night_count`                 varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `first_date`                  varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `last_date`                   varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `period`                      varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL,
    `reserve`                     varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `reserve_id`                  varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `auto_buy`                    varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `buy`                         varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `buy_error`                   varchar(800) COLLATE utf8_persian_ci DEFAULT NULL,
    `room_api_json`               mediumtext COLLATE utf8_persian_ci NOT NULL,
    `search_id`                   varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `room_info_request`           varchar(2) COLLATE utf8_persian_ci   DEFAULT NULL,
    `reserved1`                   varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved2`                   varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved3`                   varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved4`                   varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved5`                   varchar(100) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `tour_tickets_travels`
(
    `id`              int(11) NOT NULL,
    `ticket_id`       int(11) NOT NULL,
    `ticket_hotel_id` int(11) NOT NULL,
    `travel_id`       varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `title`           varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `descs`           varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
    `single_price`    varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `adl_price`       varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `chd_price`       varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `inf_price`       varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `force`           varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL,
    `reserved1`       varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved2`       varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved3`       varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved4`       varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved5`       varchar(100) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `tour_shared2`
(
    `id`        int(11)                             NOT NULL,
    `hami_id`   varchar(20) COLLATE utf8_persian_ci NOT NULL,
    `reserved1` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved2` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved3` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved4` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved5` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `tour_domestic_city_hotels`
(
    `id`            int(11) NOT NULL,
    `city_id`       varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `city_name_fa`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `city_name_en`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `hotel_id`      varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `hotel_api_id`  varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `hotel_name`    varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `has_available` varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci COMMENT ='انتخاب هتل های شهرها توسط ادمین';



CREATE TABLE `tour_domestic_search`
(
    `id`            int(11)    NOT NULL,
    `origin_name`   varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `origin_id`     varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `dest_name`     varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `dest_id`       varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `carriage_type` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `user_mobile`   varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `adl`           varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `chd`           varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `inf`           varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `room_count`    varchar(10) COLLATE utf8_persian_ci  DEFAULT NULL,
    `ip`            varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `date`          varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `visited`       varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL,
    `admin_comment` text COLLATE utf8_persian_ci,
    `isTourPackage` TINYINT(1) NULL                      DEFAULT '0',
    `data`          text COLLATE utf8_persian_ci
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `tour_domestic_city_comment`
(
    `id`      int(11)                                                 NOT NULL,
    `city`    varchar(150) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `name`    varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `comment` text CHARACTER SET utf8 COLLATE utf8_persian_ci         NOT NULL,
    `rate`    tinyint(4)                                              NOT NULL,
    `mobile`  varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  DEFAULT NULL,
    `time`    int(11)                                                 NOT NULL,
    `admin`   varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `logs`    text CHARACTER SET utf8 COLLATE utf8_persian_ci,
    `status`  tinyint(4)                                              NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


CREATE TABLE `tour_domestic_tickets`
(
    `id`                         int(11)                                                 NOT NULL,
    `tour_id`                    varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `api_ticket_id`              varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `crg_pkg_id`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `htl_pkg_id`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tvl_pkg_id`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `go_crg_id`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `return_crg_id`              varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_from`                  varchar(120) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_to`                    varchar(120) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_name`                  varchar(70) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_start_date`            varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_end_date`              varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_night_count`           varchar(5) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `tour_day_count`             varchar(5) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `tour_kind`                  varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_type`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_comment`               text COLLATE utf8_persian_ci,
    `need_confirm`               varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `confirm`                    varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `user_id`                    varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_level`                 varchar(12) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_name`                  varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_name_family`           varchar(40) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_mobile`                varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_email`                 varchar(40) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `user_markup`                varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `passengers_count`           varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `tour_go_type`               varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_return_type`           varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_sell_type`             varchar(15) COLLATE utf8_persian_ci                     NOT NULL,
    `adl`                        varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `chd`                        varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `inf`                        varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `price`                      varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `fprice`                     varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `final_price`                varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `price_adl`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `price_chd`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `price_inf`                  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `discount`                   varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `regdate`                    varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy_date`                   varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `status`                     varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `payment_status`             varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `pidtype`                    varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `pnr`                        varchar(40) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `paymentID`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `refund`                     varchar(3) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `refund_date`                varchar(15) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `refund_status`              varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `payment_type`               varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `payment_kind`               varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tickets_paydescribe`        mediumtext COLLATE utf8_persian_ci,
    `payment_rand`               varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `refund_desc`                varchar(300) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `provided_by`                varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `need_to_reserve`            varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `reserver_user_id`           varchar(25) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserver_user_name`         varchar(70) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `sold_by`                    varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `tour_hami_markup`           varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_creator_hami_user_id`  varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `tour_account_api_hami_user` varchar(70) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `needaction_id`              varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `needaction_status`          varchar(3) COLLATE utf8_persian_ci                           DEFAULT '',
    `error_code`                 varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `error`                      varchar(500) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `system_params`              mediumtext COLLATE utf8_persian_ci,
    `steps_log`                  text COLLATE utf8_persian_ci,
    `salesby`                    varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `device`                     varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `os`                         varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `browser`                    varchar(50) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy`                        varchar(2) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `buy_type`                   varchar(10) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy_status`                 varchar(20) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy_error`                  varchar(1000) COLLATE utf8_persian_ci                        DEFAULT NULL,
    `has_hotel`                  varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `has_go_carriage`            varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `has_return_carriage`        varchar(1) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `reserved1`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `reserved2`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `reserved3`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `reserved4`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `reserved5`                  varchar(100) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `user_rank`                  TINYINT(1)                                              NULL,
    `lottery`                    TEXT CHARACTER SET utf8 COLLATE utf8_general_ci         NULL,
    `backlink`                   VARCHAR(400) CHARACTER SET utf8 COLLATE utf8_general_ci,
    `provider`                   varchar(100) CHARACTER SET utf8                              DEFAULT NULL,
    `sellUsername`               VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL,
    `sellPassword`               VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL,
    `user_isToken`               TINYINT(1)                                              NULL DEFAULT '0',
    `sendsmslink`                TINYINT(1)                                              NULL DEFAULT '0',
    `sendSmsPayment`             TINYINT(1)                                              NULL DEFAULT '0',
    `adl_price_increase`         VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT '0',
    `chd_price_increase`         VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT '0',
    `inf_price_increase`         VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT '0',
    `total_price_increase`       VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT '0',
    `admin_reserve_tour`         VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT '',
    `pay_price_increase`         TINYINT(1)                                              NULL DEFAULT '0',
    `tour_tell_status`           TINYINT(1)                                              NULL DEFAULT '0',
    `tour_tell_admin`            VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT '',
    `more_discount`              VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT '0',
    `father_name`                VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT '',
    `job`                        VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT '',
    `cellphone`                  VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT '',
    `address`                    VARCHAR(300) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT '',
    `pay_travels_price`          TINYINT(1)                                              NULL DEFAULT '0',
    `priceapi`                   INT                                                     NULL,
    `profitapi`                  INT                                                     NULL,
    `tafzilprovider`             INT                                                     NULL,
    `logSanad`                   TEXT                                                    NULL DEFAULT '',
    `totalDiscount`              VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT '',
    `typeService`                VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NULL DEFAULT 'tourD',
    `tafzilTarafHesab`           INT                                                     NULL DEFAULT '0',
    `tafzilHazine`               INT                                                     NULL DEFAULT '0',
    `tafzilDaramad`              INT                                                     NULL DEFAULT '0',
    `hamiSegment`                INT                                                     NULL DEFAULT '0',
    `providerSegment`            INT                                                     NULL DEFAULT '0',
    `profit`                     INT                                                     NULL DEFAULT '0',
    `markup`                     INT                                                     NULL DEFAULT '0',
    paymentDaftarRuzname         VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT NULL,
    `peygiri_sms`                TINYINT(1)                                              NULL DEFAULT '0',
    `returnDaftarRuzname`        VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `personelDaftarRuzname` BIGINT(20) NOT NULL,
    `profitDaftarRuzname` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `tour_domestic_ticket_passengers`
(
    `id`                  int(11) NOT NULL,
    `ticket_id`           int(11)                              DEFAULT NULL,
    `price`               varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `user_id`             varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `persian_name`        varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `persian_family`      varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `latin_name`          varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `latin_family`        varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `meli_code`           varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `birthdate`           varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `gender`              varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL,
    `passport_number`     varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `passport_start_date` varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `passport_end_date`   varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `passport_country`    varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `nationality`         varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `age_level`           varchar(1) COLLATE utf8_persian_ci   DEFAULT NULL,
    `desc`                varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
    `Iranian`             tinyint(1)                           DEFAULT NULL,
    `reserved1`           varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved2`           varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved3`           varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved4`           varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved5`           varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserve`             varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL,
    `buy`                 varchar(5) COLLATE utf8_persian_ci   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `tour_domestic_tickets_carriages`
(
    `id`                int(11)                                                  NOT NULL,
    `ticket_id`         int(11)                                                  NOT NULL,
    `package_id`        varchar(25) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `carriage_id`       varchar(25) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `transfer_type`     varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `from`              varchar(25) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `from_fa`           varchar(60) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `to`                varchar(25) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `to_fa`             varchar(60) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `is_api`            varchar(20) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `online_sell`       varchar(2) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `api_id`            varchar(20) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `allowed_cargo`     varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `adl`               varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `chd`               varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `inf`               varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `adl_price`         varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `chd_price`         varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `inf_price`         varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `total_adl_price`   varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `total_chd_price`   varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `total_inf_price`   varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `total_price`       varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `date`              varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `clock`             varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `arrive_date`       varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `arrive_clock`      varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `type`              varchar(10) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `company`           varchar(300) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `company_fa`        varchar(100) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `company_img`       varchar(300) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `class`             varchar(20) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `number`            varchar(20) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `reserve`           varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `reserve_id`        varchar(30) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `auto_buy`          varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `buy`               varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `buy_error`         varchar(800) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `buy_logs`          text COLLATE utf8_persian_ci                                  DEFAULT NULL,
    `carriage_api_json` text COLLATE utf8_persian_ci,
    `reserved1`         varchar(100) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserved2`         varchar(100) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserved3`         varchar(100) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserved4`         varchar(100) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserved5`         varchar(100) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `skip`              TINYINT(1)                                               NULL DEFAULT '0',
    `skip_comment`      VARCHAR(2000) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT ''
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `tour_domestic_tickets_hotels`
(
    `id`         int(11) NOT NULL,
    `ticket_id`  int(11) NOT NULL,
    `hotel_id`   varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `hotel_name` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `city_id`    varchar(25) COLLATE utf8_persian_ci  DEFAULT NULL,
    `city_name`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `first_date` varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `last_date`  varchar(15) COLLATE utf8_persian_ci  DEFAULT NULL,
    `transfer`   varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `Catering`   varchar(20) COLLATE utf8_persian_ci  DEFAULT NULL,
    `meals`      varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved1`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved2`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved3`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved4`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `reserved5`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `tour_domestic_tickets_rooms`
(
    `id`                          int(11)                                                  NOT NULL,
    `ticket_id`                   int(11)                                                       DEFAULT NULL,
    `ticket_hotel_id`             int(11)                                                  NOT NULL,
    `hotel_id`                    varchar(25) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `hotel_api_id`                varchar(30) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `package_id`                  varchar(25) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `room_id`                     varchar(25) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `room_api_type`               varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `room_api_id`                 varchar(20) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `room_name`                   varchar(150) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `room_count`                  varchar(25) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `type`                        varchar(10) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `extra_service_count`         varchar(20) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `ex_service_price_one_night`  varchar(25) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `ex_service_price_all_nights` varchar(25) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `adl`                         varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `chd`                         varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `inf`                         varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `price_single`                varchar(20) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `price_adl`                   varchar(20) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `price_chd`                   varchar(20) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `price_inf`                   varchar(20) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `total_price_single`          varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `total_price_adl`             varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `total_price_chd`             varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `total_price_inf`             varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `total_price`                 varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `night_count`                 varchar(10) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `first_date`                  varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `last_date`                   varchar(15) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `period`                      varchar(1) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `reserve`                     varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `reserve_id`                  varchar(30) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `auto_buy`                    varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `buy`                         varchar(5) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `buy_error`                   varchar(800) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `room_api_json`               mediumtext COLLATE utf8_persian_ci                       NOT NULL,
    `search_id`                   varchar(30) COLLATE utf8_persian_ci                           DEFAULT NULL,
    `room_info_request`           varchar(2) COLLATE utf8_persian_ci                            DEFAULT NULL,
    `reserved1`                   varchar(100) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserved2`                   varchar(100) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserved3`                   varchar(100) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserved4`                   varchar(100) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserved5`                   varchar(100) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserve_type`                VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_persian_ci   NULL DEFAULT 'online',
    `skip`                        TINYINT(1)                                               NULL DEFAULT '0',
    `skip_comment`                VARCHAR(2000) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL DEFAULT ''
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;



CREATE TABLE `tour_domestic_tickets_travels`
(
    `id`               int(11)                                                NOT NULL,
    `regdate`          VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `status`           TINYINT                                                NULL DEFAULT '1',
    `payment_status`   TINYINT                                                NULL DEFAULT '0',
    `esrequest_status` TINYINT                                                NULL,
    `ticket_id`        int(11)                                                NOT NULL,
    `ticket_hotel_id`  int(11)                                                NOT NULL,
    `travel_id`        varchar(25) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `title`            varchar(100) COLLATE utf8_persian_ci                        DEFAULT NULL,
    `descs`            varchar(300) COLLATE utf8_persian_ci                        DEFAULT NULL,
    `single_price`     varchar(25) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `adl_price`        varchar(20) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `chd_price`        varchar(20) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `inf_price`        varchar(20) COLLATE utf8_persian_ci                         DEFAULT NULL,
    `force`            varchar(1) COLLATE utf8_persian_ci                          DEFAULT NULL,
    `reserved1`        varchar(100) COLLATE utf8_persian_ci                        DEFAULT NULL,
    `reserved2`        varchar(100) COLLATE utf8_persian_ci                        DEFAULT NULL,
    `reserved3`        varchar(100) COLLATE utf8_persian_ci                        DEFAULT NULL,
    `reserved4`        varchar(100) COLLATE utf8_persian_ci                        DEFAULT NULL,
    `reserved5`        varchar(100) COLLATE utf8_persian_ci                        DEFAULT NULL,
    `adl_count`        TINYINT                                                NULL DEFAULT '0',
    `chd_count`        TINYINT                                                NULL DEFAULT '0',
    `inf_count`        TINYINT                                                NULL DEFAULT '0',
    `admin_status`     TINYINT(4)                                             NULL DEFAULT '0',
    `admin`            VARCHAR(30)                                            NULL DEFAULT ''
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `vacation_request`
(
    `id`                      int(11)    NOT NULL,
    `regdate`                 varchar(50)                                            DEFAULT NULL,
    `user_id`                 varchar(100)                                           DEFAULT NULL,
    `user_name`               varchar(100)                                           DEFAULT NULL,
    `start`                   varchar(50)                                            DEFAULT NULL,
    `end`                     varchar(50)                                            DEFAULT NULL,
    `type`                    varchar(1)                                             DEFAULT NULL,
    `status`                  tinyint(1)                                             DEFAULT '0',
    `supervisor_confirm_date` varchar(50)                                            DEFAULT NULL,
    `accounting_confirm_date` varchar(50)                                            DEFAULT NULL,
    `manager_confirm_date`    varchar(50)                                            DEFAULT NULL,
    `sub`                     varchar(5)                                             DEFAULT NULL,
    `vacation`                varchar(50)                                            DEFAULT NULL,
    `user_unit_id`            varchar(10) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `type_salary`             tinyint(1) NOT NULL                                    DEFAULT '0',
    `sub_price`               int(11)    NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;



CREATE TABLE `brb_events`
(
    `id`      int(11)     NOT NULL AUTO_INCREMENT,
    `user_id` int(11)     NOT NULL,
    `event`   varchar(20) NOT NULL,
    `time`    bigint(20)  NOT NULL,
    `cmnt`    varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci  DEFAULT NULL,
    `log`     varchar(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
    `loc`     varchar(12) CHARACTER SET utf8 COLLATE utf8_persian_ci   DEFAULT NULL COMMENT 'موقعیت کاربر (''حضوری'',''خارج از شرکت'')',
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `event` (`event`),
    KEY `time` (`time`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = latin1;



ALTER TABLE `tourism_cip`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`);


ALTER TABLE `tourism_cip`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tourism_cip_sub_services`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`),
    ADD KEY `cip_id` (`cip_id`);


ALTER TABLE `tourism_cip_sub_services`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


CREATE TABLE `sitemapExclude`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `type`         varchar(50)  DEFAULT NULL COMMENT 'sitemapFlight,sitemapBus,....',
    `url`          text         DEFAULT NULL COMMENT 'آدرس',
    `registerDate` datetime     DEFAULT NULL COMMENT 'تاریخ ثبت',
    `userId`       int(11)      DEFAULT NULL COMMENT 'آیدی کاربر',
    `userName`     varchar(200) DEFAULT NULL COMMENT 'نام و نام خانوادگی کاربر ',
    PRIMARY KEY (`id`)
) ENGINE = MyISAM
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8 COMMENT ='آدرسهایی که نباید تو سایت مپ بیادش';



ALTER TABLE `notifications_action`
    ADD PRIMARY KEY (`id`),
    ADD KEY `safarang_id` (`safarang_id`),
    ADD KEY `site` (`site`);


/******** tour_tickets ********/

ALTER TABLE `tour_tickets2`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `tour_tickets2`
    ADD INDEX (`reg_date`),
    ADD INDEX (`api_ticket_id`),
    ADD INDEX (`status`),
    ADD INDEX (`passengers_count`),
    ADD INDEX (`user_mobile`),
    ADD INDEX (`paymentID`),
    ADD INDEX (`refund`),
    ADD INDEX (`pnr`),
    ADD INDEX (`user_id`);

ALTER TABLE `tour_tickets2`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


/******** tour_ticket_passengers2 ********/

ALTER TABLE `tour_ticket_passengers2`
    ADD UNIQUE KEY `id` (`id`),
    ADD KEY `tour_ticket_passengers2_ibfk_1` (`ticket_id`);

ALTER TABLE `tour_ticket_passengers2`
    ADD INDEX (`persian_name`),
    ADD INDEX (`persian_family`),
    ADD INDEX (`latin_name`),
    ADD INDEX (`latin_family`),
    ADD INDEX (`meli_code`);

ALTER TABLE `tour_ticket_passengers2`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tour_ticket_passengers2`
    ADD CONSTRAINT `tour_ticket_passengers2_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_tickets2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


/******** tour_tickets_carriages ********/

ALTER TABLE `tour_tickets_carriages`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`);


ALTER TABLE `tour_tickets_carriages`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tour_tickets_carriages`
    ADD CONSTRAINT `tour_tickets_carriages_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_tickets2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


/******** tour_tickets_hotels ********/

ALTER TABLE `tour_tickets_hotels`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`);


ALTER TABLE `tour_tickets_hotels`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tour_tickets_hotels`
    ADD CONSTRAINT `tour_tickets_hotels_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_tickets2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


/******** tour_tickets_rooms ********/

ALTER TABLE `tour_tickets_rooms`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`),
    ADD KEY `ticket_hotel_id` (`ticket_hotel_id`);


ALTER TABLE `tour_tickets_rooms`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tour_tickets_rooms`
    ADD CONSTRAINT `tour_tickets_rooms_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_tickets2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `tour_tickets_rooms_ibfk_2` FOREIGN KEY (`ticket_hotel_id`) REFERENCES `tour_tickets_hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `instructions`
    ADD PRIMARY KEY (`id`),
    ADD KEY `subject` (`subject`(255));

ALTER TABLE `notepad_list`
    ADD PRIMARY KEY (`id`);

/******** tour_tickets_travels ********/

ALTER TABLE `tour_tickets_travels`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`),
    ADD KEY `ticket_hotel_id` (`ticket_hotel_id`);

ALTER TABLE `tour_tickets_travels`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tour_tickets_travels`
    ADD CONSTRAINT `tour_tickets_travels_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_tickets2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `tour_tickets_travels_ibfk_2` FOREIGN KEY (`ticket_hotel_id`) REFERENCES `tour_tickets_hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


/******** tour_shared2 ********/

INSERT INTO `tour_shared2` (`id`, `hami_id`, `reserved1`, `reserved2`, `reserved3`, `reserved4`, `reserved5`)
VALUES (1, 'ALL', NULL, NULL, NULL, NULL, NULL);

ALTER TABLE `tour_shared2`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `tour_shared2`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 2;

ALTER TABLE `tour_shared2`
    ADD INDEX (`hami_id`);


/******** tour_domestic_city_hotels ********/

ALTER TABLE `tour_domestic_city_hotels`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `tour_domestic_city_hotels`
    ADD INDEX (`city_id`),
    ADD INDEX (`hotel_id`),
    ADD INDEX (`hotel_api_id`);


ALTER TABLE `tour_domestic_city_hotels`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


/******** tour_domestic_tickets ********/

ALTER TABLE `tiket_groups`
    ADD PRIMARY KEY (`id`),
    ADD KEY `status` (`status`),
    ADD KEY `tiket_vaheds` (`tiket_vaheds`(1024)),
    ADD INDEX (`show`);

/******** tour_domestic_search ********/

ALTER TABLE `tour_domestic_search`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `tour_domestic_search`
    ADD INDEX (`origin_id`),
    ADD INDEX (`dest_id`),
    ADD INDEX (`user_mobile`);


ALTER TABLE `tour_domestic_search`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/******** tour_domestic_city_comment ********/

ALTER TABLE `tour_domestic_city_comment`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `tour_domestic_city_comment`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/******** tour_domestic_tickets ********/

ALTER TABLE `tour_domestic_tickets`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `tour_domestic_tickets`
    ADD INDEX (`tour_id`),
    ADD INDEX (`needaction_status`),
    ADD INDEX (`user_id`),
    ADD INDEX (`api_ticket_id`),
    ADD INDEX (`status`),
    ADD INDEX (`pnr`),
    ADD INDEX (`user_mobile`),
    ADD INDEX (`paymentID`),
    ADD INDEX (`admin_reserve_tour`),
    ADD INDEX (`tour_tell_admin`),
    ADD INDEX (`refund`);


ALTER TABLE `tour_domestic_tickets`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;


/******** tour_domestic_ticket_passengers ********/

ALTER TABLE `tour_domestic_ticket_passengers`
    ADD UNIQUE KEY `id` (`id`),
    ADD KEY `tour_domestic_ticket_passengers2_ibfk_1` (`ticket_id`);

ALTER TABLE `tour_domestic_ticket_passengers`
    ADD INDEX (`meli_code`);


ALTER TABLE `tour_domestic_ticket_passengers`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tour_domestic_ticket_passengers`
    ADD CONSTRAINT `tour_domestic_ticket_passengers_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_domestic_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


/******** tour_domestic_tickets_carriages ********/

ALTER TABLE `tour_domestic_tickets_carriages`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`);


ALTER TABLE `tour_domestic_tickets_carriages`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tour_domestic_tickets_carriages`
    ADD CONSTRAINT `tour_domestic_tickets_carriages_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_domestic_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


/******** tour_domestic_tickets_hotels ********/

ALTER TABLE `tour_domestic_tickets_hotels`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`);


ALTER TABLE `tour_domestic_tickets_hotels`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tour_domestic_tickets_hotels`
    ADD CONSTRAINT `tour_domestic_tickets_hotels_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_domestic_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


/******** tour_domestic_tickets_rooms ********/

ALTER TABLE `tour_domestic_tickets_rooms`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`),
    ADD KEY `ticket_hotel_id` (`ticket_hotel_id`);


ALTER TABLE `tour_domestic_tickets_rooms`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tour_domestic_tickets_rooms`
    ADD CONSTRAINT `tour_domestic_tickets_rooms_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_domestic_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `tour_domestic_tickets_rooms_ibfk_2` FOREIGN KEY (`ticket_hotel_id`) REFERENCES `tour_domestic_tickets_hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


/******** tour_domestic_tickets_travels ********/

ALTER TABLE `tour_domestic_tickets_travels`
    ADD PRIMARY KEY (`id`),
    ADD INDEX (`regdate`),
    ADD INDEX (`status`),
    ADD INDEX (`payment_status`),
    ADD INDEX (`esrequest_status`),
    ADD KEY `ticket_id` (`ticket_id`);


ALTER TABLE `tour_domestic_tickets_travels`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tour_domestic_tickets_travels`
    ADD CONSTRAINT `tour_domestic_tickets_travels_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_domestic_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/******************************************** END TOUR TABLES **********************************************/


/******************************************** SHORT LINK TABLES **********************************************/

/******* short_links ********/

CREATE TABLE `short_links`
(
    `id`   int(255) NOT NULL,
    `link` mediumtext COLLATE utf8_persian_ci
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

ALTER TABLE `short_links`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `short_links`
    MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;


/******* short_links_visits ********/

CREATE TABLE `short_links_visits`
(
    `id`      int(255) NOT NULL,
    `link_id` varchar(30) COLLATE utf8_persian_ci  DEFAULT NULL,
    `ip`      varchar(50) COLLATE utf8_persian_ci  DEFAULT NULL,
    `salesby` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `device`  varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `os`      varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
    `browser` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `user_password`
(
    `id`             bigint(20) UNSIGNED NOT NULL,
    `user_id`        varchar(50)  DEFAULT NULL,
    `user_cellphone` varchar(100) DEFAULT NULL,
    `time`           varchar(30)  DEFAULT NULL,
    `password`       varchar(10)  DEFAULT NULL,
    `tokengcm`       text CHARACTER SET utf8 COMMENT 'توکن گوگل نوتیفیکشن',
    `type`           varchar(10)  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1 COMMENT ='یک پیام یک بار مصرف اس ام اس می شه و ورود از این جدول بررسی ';



CREATE TABLE `discount_code_setting`
(
    `id`              int(11)                                                 NOT NULL AUTO_INCREMENT,
    `history`         TINYINT(11)                                             NULL,
    `service_id`      TINYINT(11)                                             NOT NULL,
    `service_name`    varchar(30) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `duration`        bigint(20)                                              NOT NULL,
    `type`            TINYINT(11)                                             NOT NULL,
    `amount`          int(11)                                                 NOT NULL,
    `expdate`         bigint(20)                                              NOT NULL,
    `services`        varchar(120)                                            NOT NULL,
    `salesby`         varchar(20)                                             NOT NULL,
    `created_by`      varchar(30) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `created_at`      bigint(30)                                              NOT NULL,
    `is_active`       TINYINT(11)                                             NOT NULL,
    `last_id`         bigint(20)                                              NOT NULL,
    `sms_template_id` TINYINT(11)                                             NOT NULL,
    `sms_custom_text` varchar(150) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
    `deleted_at`      bigint(20)                                              NOT NULL,
    `deleted_by`      varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci  NOT NULL,
    `code_type`       INT                                                     NOT NULL,
    `is_deleted`      TINYINT(11)                                             NOT NULL,
    `sample_sms_text` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = latin1;


CREATE TABLE `user_rank_settings`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `service_id`   TINYINT(11) DEFAULT NULL,
    `service_name` varchar(30) DEFAULT NULL,
    `bronze`       INT(11)     DEFAULT NULL,
    `silver`       INT(11)     DEFAULT NULL,
    `gold`         INT(11)     DEFAULT NULL,
    `is_active`    TINYINT(11) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = latin1;
ALTER TABLE user_rank_settings
    ADD UNIQUE serviceiduniqueindex (service_id);

INSERT INTO `user_rank_settings` (`id`, `service_id`, `service_name`, `bronze`, `silver`, `gold`, `is_active`)
VALUES (NULL, 0, NULL, '2', '3', '5', '0'),
       (NULL, '1', NULL, '2', '3', '5', '0'),
       (NULL, '2', NULL, '2', '3', '5', '0'),
       (NULL, '3', NULL, '2', '3', '5', '0'),
       (NULL, '4', NULL, '2', '3', '5', '0'),
       (NULL, '5', NULL, '2', '3', '5', '0'),
       (NULL, '6', NULL, '2', '3', '5', '0');


CREATE TABLE `lottery_settings`
(
    `id`                int(11)                                                NOT NULL AUTO_INCREMENT,
    `history`           TINYINT(11) DEFAULT NULL,
    `service`           varchar(40) DEFAULT NULL,
    `user_rank`         TINYINT(11) DEFAULT NULL,
    `gift`              TINYINT(11) DEFAULT NULL,
    `bonus_counter`     INT(11)     DEFAULT NULL,
    `bonus_ratio`       TINYINT(11)                                            NOT NULL,
    `max_bonus_counter` TINYINT(11) DEFAULT NULL,
    `no_of_success`     TINYINT(11) DEFAULT NULL,
    `expdate`           bigint(20)  DEFAULT NULL,
    `is_active`         TINYINT(11) DEFAULT NULL,
    `is_deleted`        TINYINT(11) DEFAULT NULL,
    `changed_by`        varchar(50) DEFAULT NULL,
    `changed_at`        int(11)     DEFAULT NULL,
    `request_counter`   INT(11)     DEFAULT NULL,
    `bonus_0`           VARCHAR(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `bonus_1`           VARCHAR(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `bonus_2`           VARCHAR(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `bonus_3`           VARCHAR(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `bonus_4`           VARCHAR(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = latin1;


CREATE TABLE `winners_history`
(
    `id`             int(11) NOT NULL AUTO_INCREMENT,
    `user_id`        INT(20)                         DEFAULT NULL,
    `lot_id`         TINYINT(11)                     DEFAULT NULL,
    `time`           bigint(20)                      DEFAULT NULL,
    `code`           varchar(10)                     DEFAULT NULL,
    `gift`           varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '????',
    `shomaresheba`   varchar(100)                    DEFAULT NULL,
    `account_owner`  varchar(150) CHARACTER SET utf8 DEFAULT NULL,
    `account_mobile` varchar(20)                     DEFAULT NULL,
    `status`         TINYINT(11)                     DEFAULT NULL,
    `log`            VARCHAR(500) CHARACTER SET utf8,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  DEFAULT CHARSET = latin1;


CREATE TABLE `adWords_discount`
(
    `id`      int(11)     NOT NULL AUTO_INCREMENT,
    `word`    varchar(80) CHARACTER SET utf8 DEFAULT NULL,
    `percent` TINYINT(11) NOT NULL,
    `admin`   varchar(30) CHARACTER SET utf8 DEFAULT NULL,
    `regdate` int(11)                        DEFAULT NULL,
    `status`  TINYINT(11) NOT NULL,
    `view`    INT(16)     NOT NULL           DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `word` (`word`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = latin1;

INSERT INTO `adWords_discount` (`id`, `word`, `percent`, `admin`, `regdate`, `status`, `view`)
VALUES (NULL, 'Sepehr360', '0', 'مدیر ', '1558621498', '1', '0');


CREATE TABLE `view_words`
(
    `id`      int(11) NOT NULL,
    `regdate` varchar(50) DEFAULT NULL,
    `word`    varchar(80) DEFAULT NULL,
    `ip`      varchar(50) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


CREATE TABLE `shifts_table`
(
    `id`                 int(11)       NOT NULL AUTO_INCREMENT,
    `date`               int(20)       NOT NULL,
    `user_id`            int(20)       NOT NULL,
    `group_id`           int(11)       NOT NULL,
    `shift_start`        mediumint(20) NOT NULL,
    `shift_end`          mediumint(20) NOT NULL,
    `duration`           mediumint(7)  NOT NULL,
    `weekday`            tinyint(11)   NOT NULL,
    `shift_type`         tinyint(11)   NOT NULL,
    `is_holiday`         tinyint(2)    NOT NULL,
    `timestamp`          timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `shift_start_backup` mediumint(20) NOT NULL,
    `shift_end_backup`   mediumint(20) NOT NULL,
    `duration_backup`    mediumint(20) NOT NULL,
    `is_test`            tinyint(2)    NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  COLLATE = utf8_general_ci;

CREATE TABLE `shifts_update_history`
(
    `id`          int(11)    NOT NULL AUTO_INCREMENT,
    `shift_id`    int(11)    NOT NULL,
    `updated_by`  bigint(20) NOT NULL,
    `updated_at`  timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `shift_start` bigint(20) NOT NULL,
    `shift_end`   bigint(20) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 419
  DEFAULT CHARSET = latin1;

CREATE TABLE `workgroups`
(
    `id`               int(11)                                                NOT NULL AUTO_INCREMENT,
    `group_id`         int(11)                                                NOT NULL,
    `group_name`       varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `condition_id`     tinyint(11)                                            NOT NULL,
    `condition_status` tinyint(11)                                            NOT NULL,
    `p1`               int(11)                                                NOT NULL,
    `p2`               int(11)                                                NOT NULL,
    `p3`               int(11)                                                NOT NULL,
    `p4`               int(11)                                                NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = latin1;

CREATE TABLE `workgroups_exceptions`
(
    `id`           int(11)    NOT NULL AUTO_INCREMENT,
    `group_id`     int(11)    NOT NULL,
    `condition_id` int(11)    NOT NULL,
    `user_id`      bigint(20) NOT NULL,
    `status`       int(11)    NOT NULL,
    `ent_date`     bigint(30) NOT NULL,
    `p1`           int(11) DEFAULT NULL,
    `p2`           int(11) DEFAULT NULL,
    `p3`           int(11) DEFAULT NULL,
    `p4`           int(11) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = latin1;


CREATE TABLE `work_hours`
(
    `id`         int(11)    NOT NULL AUTO_INCREMENT,
    `user_id`    bigint(20) NOT NULL,
    `weekday`    int(11)    NOT NULL,
    `start_hr`   int(11) DEFAULT NULL,
    `start_min`  int(11) DEFAULT NULL,
    `finish_hr`  int(11) DEFAULT NULL,
    `finish_min` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 299
  DEFAULT CHARSET = latin1;

CREATE TABLE `tour_sms_list`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `name`        varchar(50) DEFAULT NULL,
    `mobile`      varchar(15) DEFAULT NULL,
    `destination` varchar(50) DEFAULT NULL,
    `regdate`     varchar(15) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `tour_sms_links`
(
    `id`             int(11)                         NOT NULL,
    `destination`    varchar(100) CHARACTER SET utf8 NOT NULL,
    `link`           varchar(300) CHARACTER SET utf8 NOT NULL,
    `short_link`     varchar(100) CHARACTER SET utf8 NOT NULL,
    `short_link_id`  varchar(5) CHARACTER SET utf8   NOT NULL,
    `use_short_link` tinyint(4)                      NOT NULL,
    `status`         tinyint(4)                      NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


CREATE TABLE `phonebook` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
 `cellphone` varchar(15) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `fax` varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `internal_fax` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `address1` varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `address2` varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `postcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `interior` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `des` varchar(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `card` varchar(100) CHARACTER SET utf32 COLLATE utf32_persian_ci DEFAULT NULL,
 `shaba` varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `hesab` varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `bank` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `cardName` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
 `serviceproviders_type` int(11) DEFAULT NULL,
 `IshasabTrain` tinyint(1) NOT NULL DEFAULT 0,
 `hotelId` bigint(20) DEFAULT NULL,
 `nid` varchar(15) CHARACTER SET utf8 DEFAULT NULL COMMENT 'شناسه ملی/کد ملی',
 `reg_number` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'شماره ثبت//شناسنامه',
 `economic_code` varchar(25) CHARACTER SET utf8 DEFAULT NULL COMMENT 'کد اقتصادی',
 `type` tinyint(1) DEFAULT NULL COMMENT 'نوع (1-حقیقی 2-حقوقی 3-ایرلاین 4-شرکت ریلی)',
 `provider_code` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT 'کد تامین کننده (کد 2حرفی)',
 PRIMARY KEY (`id`),
 KEY `name` (`name`),
 KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



CREATE TABLE `letters`
(
    `id`                  int(11)                                                  NOT NULL AUTO_INCREMENT,
    `regdate`             int(11)                                                  NOT NULL,
    `subject`             varchar(500) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `date`                varchar(20) CHARACTER SET utf8 COLLATE utf8_persian_ci            DEFAULT NULL,
    `type`                varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci            DEFAULT NULL,
    `number`              varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `sarbarg`             varchar(5) CHARACTER SET utf8                                     DEFAULT NULL,
    `from`                varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `from_id`             int(11)                                                           DEFAULT '0',
    `to`                  varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `to_id`               int(11)                                                           DEFAULT '0',
    `attachment`          tinyint(1)                                                        DEFAULT NULL,
    `file`                varchar(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL,
    `file2`               VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `file3`               VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `file4`               VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,
    `scan`                tinyint(4)                                               NOT NULL DEFAULT '0',
    `transcripts`         text CHARACTER SET utf8 COLLATE utf8_persian_ci,
    `des`                 text CHARACTER SET utf8 COLLATE utf8_persian_ci,
    `comment`             varchar(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci          DEFAULT NULL,
    `letter_type`         varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `reg_by`              varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT NULL,
    `status`              tinyint(1)                                                        DEFAULT NULL,
    `sign_by`             varchar(100) CHARACTER SET utf8                                   DEFAULT NULL,
    `draft_id`            tinyint(4)                                               NOT NULL,
    `pdf`                 varchar(200) CHARACTER SET utf8                                   DEFAULT NULL,
    `val_status`          tinyint(4)                                               NOT NULL,
    `validator`           varchar(100) CHARACTER SET utf8                                   DEFAULT NULL,
    `emailed`             tinyint(4)                                               NOT NULL,
    `faxed`               tinyint(4)                                               NOT NULL,
    `fax_status`          tinyint(1)                                                        DEFAULT '0',
    `fax_cost`            tinyint(2)                                                        DEFAULT '0',
    `fax_try_count`       tinyint(4)                                                        DEFAULT '0',
    `fax_details`         text CHARACTER SET utf8,
    `is_deleted`          tinyint(4)                                               NOT NULL DEFAULT '0',
    `fax_logs`            text CHARACTER SET utf8 COLLATE utf8_persian_ci,
    `email_logs`          text CHARACTER SET utf8 COLLATE utf8_persian_ci,
    `archiveZonkenNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT '',
    `archiveLetterNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT '',
    `archiveRowNumber`    varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT '',
    `archiveLocation`     varchar(200) CHARACTER SET utf8 COLLATE utf8_persian_ci           DEFAULT '',
    `ticket_type`         VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_persian_ci   NULL     DEFAULT '',
    `ticket_id`           VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_persian_ci   NULL     DEFAULT '',
    `upload_link_mobile` VARCHAR(10) NULL COMMENT 'لینک آپلود به این شماره موبایل ارسال شده',
    `upload_link_status` BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'فایل ها از طریق لینک آپلود ضمیمه شدند؟',
    `download_link_mobile` VARCHAR(10) NULL COMMENT 'لینک دانلود نامه به این شماره موبایل ارسال شده',
    `sms_logs` TEXT CHARACTER SET utf8 COLLATE utf8_persian_ci NULL COMMENT 'لاگ پیامکهای ارسال شده',
    PRIMARY KEY (`id`),
    KEY `type` (`type`),
    KEY `letter_type` (`letter_type`),
    KEY `date` (`date`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = latin1;



CREATE TABLE `letters_draft`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT,
    `draft_type` varchar(50)  DEFAULT NULL,
    `draft_name` varchar(50)  DEFAULT NULL,
    `title`      varchar(200) DEFAULT NULL,
    `subject`    varchar(200) DEFAULT NULL,
    `body`       text,
    `closing`    varchar(200) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 21
  DEFAULT CHARSET = utf8;



CREATE TABLE `letters_texts`
(
    `id`             int(11)     NOT NULL AUTO_INCREMENT,
    `number`         varchar(50)  DEFAULT NULL,
    `date`           varchar(30) NOT NULL,
    `title`          varchar(200) DEFAULT NULL,
    `subject`        varchar(200) DEFAULT NULL,
    `body`           text        NOT NULL,
    `closing`        varchar(200) DEFAULT NULL,
    `signature`      varchar(200) DEFAULT NULL,
    `with_signature` tinyint(4)  NOT NULL,
    `stamp`          varchar(200) DEFAULT NULL,
    `with_stamp`     tinyint(4)  NOT NULL,
    `sarbarg`        varchar(200) DEFAULT NULL,
    `with_sarbarg`   tinyint(4)  NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 36
  DEFAULT CHARSET = utf8;



CREATE TABLE `letters_sarbarg_setting`
(
    `id`         int(11)      NOT NULL AUTO_INCREMENT,
    `sarbarg_id` int(11)      NOT NULL,
    `section`    varchar(100) NOT NULL,
    `ptop`       int(11)      NOT NULL DEFAULT '0',
    `pright`     int(11)      NOT NULL DEFAULT '0',
    `pbottom`    int(11)      NOT NULL DEFAULT '0',
    `pleft`      int(11)      NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 25
  DEFAULT CHARSET = utf8;


CREATE TABLE `letters_images`
(
    `id`   int(11) NOT NULL AUTO_INCREMENT,
    `type` varchar(20)  DEFAULT NULL,
    `name` varchar(100) DEFAULT NULL,
    `url`  varchar(300) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8;

CREATE TABLE `sms_messages`
(
    `id`      bigint(20) NOT NULL,
    `regdate` bigint(20)   DEFAULT 0,
    `text`    varchar(255) DEFAULT '',
    `from`    varchar(50)  DEFAULT '',
    `to`      varchar(50)  DEFAULT '',
    `method`  varchar(50)  DEFAULT '',
    `result`  varchar(255) DEFAULT ''
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;



CREATE TABLE `cooperations`
(
    `id`             int(11) NOT NULL AUTO_INCREMENT,
    `regdate`        int(11)                                                 DEFAULT NULL,
    `name`           varchar(100)                                            DEFAULT NULL COMMENT 'نام شخص حقیقی/حقوقی',
    `nid`            varchar(15)                                             DEFAULT NULL COMMENT 'شناسه ملی/کد ملی',
    `reg_number`     varchar(50)                                             DEFAULT NULL COMMENT 'شماره ثبت//شناسنامه',
    `state`          varchar(100)                                            DEFAULT NULL COMMENT 'استان',
    `city`           varchar(100)                                            DEFAULT NULL COMMENT 'شهر',
    `address`        varchar(250)                                            DEFAULT NULL COMMENT 'آدرس',
    `postal_code`    varchar(20)                                             DEFAULT NULL COMMENT 'کد پستی 10رقمی',
    `phone`          varchar(100)                                            DEFAULT NULL COMMENT 'تلفن',
    `fax`            varchar(100)                                            DEFAULT NULL COMMENT 'فکس',
    `email`          varchar(100)                                            DEFAULT NULL COMMENT 'ایمیل',
    `mobile_manager` varchar(15)                                             DEFAULT NULL COMMENT 'شماره همراه مدیریت',
    `mobile_agent`   varchar(15)                                             DEFAULT NULL COMMENT 'شماره همراه نماینده شرکت',
    `file_path`      varchar(250) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'مسیر فایل مدارک روی سرور',
    `comment`        text                                                    DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8;


CREATE TABLE `hotel_search`
(
    `id`            int(11)                                                  NOT NULL AUTO_INCREMENT,
    `city`          varchar(100)                                             NOT NULL,
    `fromDate`      varchar(100)                                             NOT NULL,
    `toDate`        varchar(100)                                             NOT NULL,
    `userCellphone` varchar(15)                                              NOT NULL,
    `regdate`       varchar(20)                                              NOT NULL,
    `admin_comment` varchar(200)                                             NOT NULL,
    `ip`            VARCHAR(30) CHARACTER SET utf32 COLLATE utf32_persian_ci NULL DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;


CREATE TABLE `payments_eshteraki`
(
    `paymentID`              bigint(20)                           NOT NULL AUTO_INCREMENT,
    `user_id`                bigint(20)                           NOT NULL,
    `payment_cellphone`      varchar(12) COLLATE utf8_persian_ci  NOT NULL,
    `payment_username`       varchar(150) COLLATE utf8_persian_ci NOT NULL,
    `payment_email`          varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `payment_describe`       text COLLATE utf8_persian_ci         NOT NULL,
    `peymentAmount`          bigint(20)                           NOT NULL,
    `peymentAmountD`         varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `payment_ip`             varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `paymentDate`            varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `bank_name`              varchar(150) COLLATE utf8_persian_ci NOT NULL,
    `payment_status`         tinyint(4)                           NOT NULL,
    `sanad_status`           tinyint(1) DEFAULT 0,
    `paymentType`            varchar(20) COLLATE utf8_persian_ci  NOT NULL,
    `paymentCode`            varchar(1000) COLLATE utf8_persian_ci NOT NULL,
    `paymentcodesale`        varchar(255) COLLATE utf8_persian_ci NOT NULL,
    `requestPay`             varchar(5) COLLATE utf8_persian_ci   NOT NULL,
    `payOnlineV`             varchar(20) COLLATE utf8_persian_ci  NOT NULL,
    `requestVer`             varchar(20) COLLATE utf8_persian_ci  NOT NULL,
    `payment_au`             varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `payment_rand`           varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `respinaID`              bigint(20)                           NOT NULL,
    `payment_au2`            varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `payment_rs`             varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `payment_urlback`        text COLLATE utf8_persian_ci         NOT NULL,
    `payment_describes`      text COLLATE utf8_persian_ci         NOT NULL,
    `payment_describesadmin` text COLLATE utf8_persian_ci         NOT NULL,
    `provider`               varchar(100) COLLATE utf8_persian_ci          DEFAULT NULL,
    `tafzilprovider`         INT(11)                              NULL     DEFAULT '0',
    `tafzilDargah`           INT(11)                              NULL     DEFAULT '0',
    `tasvieDargah`           tinyint(4)                           NOT NULL DEFAULT '0',
    `tasvieBank`             tinyint(4)                           NOT NULL DEFAULT '0',
    `ignore`                 tinyint(4)                           NOT NULL DEFAULT '0',
    `poshtiban`              tinyint(4)                           NOT NULL DEFAULT '0',
    `dargahLog`              text CHARACTER SET utf8,
    `bankLog`                text CHARACTER SET utf8,
    PRIMARY KEY (`paymentID`),
    KEY `paymentcodesalefkey1` (`paymentcodesale`),
    KEY `banknamefkey1` (`bank_name`),
    KEY `respinaIDfkey1` (`respinaID`),
    KEY `useridpaymentsfkey1` (`user_id`),
    KEY `paymentTypefkey` (`paymentType`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;


CREATE TABLE `token_password`
(
    `id`        bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `user_id`   bigint(20)                                              NOT NULL,
    `user_name` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `amount`    VARCHAR(50)                                             NULL     DEFAULT '0',
    `token`     varchar(20)                                             NOT NULL,
    `regdate`   varchar(50)                                             NOT NULL,
    `use`       tinyint(1)                                              NOT NULL DEFAULT '0',
    `buy`       tinyint(1)                                              NOT NULL DEFAULT '0',
    `admin_id`  BIGINT(20)                                              NULL     DEFAULT '0',
    `admin`     varchar(100)                                            NOT NULL DEFAULT '',
    `source`    VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL,

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;



--
-- Table structure for table `usersType_transactions`
--

CREATE TABLE `usersType_transactions`
(
    `id`                   int(11)                                                    NOT NULL,
    `regdate`              bigint(20)                                                 NOT NULL,
    `userId`               int(11)                                                    NOT NULL,
    `refrenceId`           int(11)                                                    NOT NULL,
    `refrenceId2`          VARCHAR(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 0,
    `typeService`          varchar(50)                                                NOT NULL,
    `typeAction`           varchar(10)                                                NOT NULL,
    `typeLoc`              varchar(5)                                                 NOT NULL,
    `paymentId`            varchar(50)                                                NOT NULL,
    `bedehkar`             decimal(15, 0)                                             NOT NULL,
    `bestankar`            decimal(15, 0)                                             NOT NULL,
    `mahiyat`              varchar(15)                                                NOT NULL,
    `resOperation`         varchar(15)                                                NOT NULL,
    `effectiveOperation`   varchar(15)                                                NOT NULL,
    `serviceprovidersCash` decimal(15, 0)                                             NOT NULL,
    `userCash`             decimal(15, 0)                                             NOT NULL,
    `userCashBlock`        decimal(15, 0)                                             NOT NULL,
    `userCashReturn`       DECIMAL(15, 0)                                             NOT NULL,
    `description`          text CHARACTER SET utf8 COLLATE utf8_persian_ci            NOT NULL,
    `effectiveDate`        bigint(20)                                                 NOT NULL,
    `cycleNumber`          tinyint(2)                                                 NOT NULL,
    `price`                int(11)                                                    NOT NULL COMMENT 'مبلغ با علامت تشخیصی',
    `year`                 int(11)                                                    NOT NULL,
    `typeApi`              VARCHAR(50)                                                NOT NULL DEFAULT 'self',
    `idDaftarSelf`         bigint(20)                                                 NOT NULL,
    `idDaftarHami`         bigint(20)                                                 NOT NULL,
    `mojodiManfi`          TINYINT(1)                                                 NOT NULL DEFAULT '0',
    `statusRefund`         TINYINT(1)                                                 NOT NULL DEFAULT '0' COMMENT 'آیا به ازای این بستانکاری موجودی صفر شده است یا خیر؟',
   `statusHesab` BIGINT(20) NOT NULL DEFAULT '0',
    `tableHesab` VARCHAR(100) NOT NULL

) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

ALTER TABLE `usersType_transactions`
    ADD PRIMARY KEY (`id`) USING BTREE,
    ADD UNIQUE KEY `userId` (`userId`, `refrenceId`, `refrenceId2`, `typeService`, `typeAction`, `bedehkar`,
                             `bestankar`, `effectiveOperation`) USING BTREE;

ALTER TABLE `usersType_transactions`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `usersType_transactions`
    ADD INDEX `indexRefund` (`userId`, `typeService`, `typeAction`, `refrenceId`);

ALTER TABLE `usersType_transactions`
    ADD INDEX `statusHesab` (`statusHesab`);


--
-- ALTER TABLE `usersType_transactions`
--   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
-- COMMIT;

--
-- Dumping data for table `usersType_transactions`
--

--
-- Table structure for table `serviceprovidersType_transactions`
--

CREATE TABLE `serviceprovidersType_transactions` (
  `id` int(11) NOT NULL,
  `regdate` bigint(20) NOT NULL,
  `serviceprovidersId` int(11) NOT NULL,
  `serviceprovidersTypeId` int(11) NOT NULL,
  `refrenceId` bigint(20) NOT NULL,
  `refrenceId2` varchar(40) NOT NULL DEFAULT '0',
  `typeService` varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `typeAction` varchar(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `typeLoc` varchar(10) NOT NULL,
  `paymentId` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `bedehkar` decimal(15,0) NOT NULL,
  `bestankar` decimal(15,0) NOT NULL,
  `mahiyat` varchar(15) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `resOperation` varchar(15) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `serviceprovidersCash` decimal(15,0) NOT NULL,
  `serviceprovidersTypeCash` decimal(15,0) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `effectiveDate` bigint(20) NOT NULL,
  `cycleNumber` tinyint(2) NOT NULL,
  `paymentOwner` varchar(10) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `ticketOwner` varchar(10) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `price` decimal(15,0) NOT NULL,
  `year` int(11) NOT NULL,
  `typeApi` varchar(50) NOT NULL DEFAULT 'self',
  `idDaftarSelf` bigint(20) NOT NULL,
  `idDaftarHami` int(11) NOT NULL,
  `statusHesab` bigint(20) DEFAULT 0 COMMENT 'شناسه منبع(جدولی) که مغیایرت با آن انجام شده است. مثل جدوال بانک ها',
  `tableHesab` varchar(100) DEFAULT NULL,
  `statusHesab_h` int(11) NOT NULL COMMENT 'شناسه حسابداری که تایید کرده است',
  `moeencash_effective` decimal(15,0) NOT NULL,
  `tafzilcash_effective` decimal(15,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `serviceprovidersType_transactions`
    ADD PRIMARY KEY (`id`);
ALTER TABLE `serviceprovidersType_transactions`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER IGNORE TABLE `serviceprovidersType_transactions`
    ADD UNIQUE (`serviceprovidersId`, `serviceprovidersTypeId`, `refrenceId`, `refrenceId2`, `typeService`,
                `typeAction`, `typeLoc`, `paymentId`, `bedehkar`, `bestankar`, `mahiyat`, `resOperation`, `description`,
                `effectiveDate`, `paymentOwner`, `ticketOwner`, `typeApi`, `idDaftarSelf`, `idDaftarHami`);
ALTER TABLE `serviceprovidersType_transactions`
    ADD INDEX (`statusHesab`);
ALTER TABLE `serviceprovidersType_transactions`
    ADD INDEX (`statusHesab_h`);

--
-- Dumping data for table `serviceprovidersType_transactions`
--



CREATE TABLE `sms_bulk` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL COMMENT 'این رکورد توسط کدام فرم یا کران جاب ثبت شده است (smsGroup-پیام گروهی,smsAuto-پیامک اتوماتیک,jobs-استخدام,userCall-مرکز تماس,userNotif-پیامک خبرم کن,userCallType-پیامک نوع تماس,smsAutoUserCallپیامک اتوماتیک مرکز تماس,userNotifTour-اطلاعرسانی تور)',
  `reg_date` int(11) NOT NULL COMMENT 'تاریخ ثبت',
  `date_from` int(11) NOT NULL COMMENT 'ارسال از تاریخ',
  `date_to` int(11) NOT NULL COMMENT 'ارسال تا تاریخ (تاریخ انقضا)',
  `sms_text` varchar(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL COMMENT 'متن پیام',
  `mobile_number` varchar(10) NOT NULL COMMENT 'شماره موبایل گیرنده پیام (10رقم)',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-ثبت اولیه1-ارسال موفق 2-ناموفق',
  `status_time` int(11) DEFAULT NULL COMMENT 'زمان آخرین تغییر وضعیت',
  `web_server` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'سرویس دهنده پیامک (-1mellipayamak)',
  `response` varchar(1000) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'پاسخ سرویس دهنده پیامک',
  `source_table` varchar(100) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'نام جدول منبع',
  `source_id` int(11) DEFAULT NULL COMMENT 'آی دی جدول منبع'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='پیام های ثبت شده در این جدول توسط کران جاب به سرویس دهنده پیامک ارسال میشوند';



CREATE TABLE `flight_discount_route`
(
    `id`         int(11)    NOT NULL,
    `regdate`    varchar(20) DEFAULT NULL,
    `from`       varchar(10) DEFAULT NULL,
    `to`         varchar(10) DEFAULT NULL,
    `airline`    varchar(20) DEFAULT NULL,
    `percent`    tinyint(4) NOT NULL,
    `admin_id`   varchar(5)  DEFAULT NULL,
    `admin_name` varchar(30) DEFAULT NULL,
    `status`     tinyint(4) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


ALTER TABLE `flight_discount_route`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `flight_discount_route`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `view_words`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `ipviewfkey` (`word`, `ip`);


ALTER TABLE `view_words`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



ALTER TABLE `short_links_visits`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `user_password`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `short_links_visits`
    MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

ALTER TABLE `user_password`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

/******************************************** END SHORT LINK TABLES **********************************************/

ALTER TABLE `hotel_price_markups`
    ADD PRIMARY KEY (`id`),
    ADD KEY `hotel_id` (`hotel_id`),
    ADD KEY `admin_id` (`admin_id`);

ALTER TABLE `hotel_price_markups`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `login`
    ADD PRIMARY KEY (`loginId`);

ALTER TABLE `login`
    MODIFY `loginId` int(11) NOT NULL AUTO_INCREMENT;


--
-- Indexes for table `accounting_documents`
--

--
-- Indexes for table `respina_passengers_hotel_kh`
--


ALTER TABLE `bus_votes`
    ADD PRIMARY KEY (`id`),
    ADD KEY `fromName` (`fromName`),
    ADD KEY `toName` (`toName`),
    ADD KEY `ip` (`ip`),
    ADD KEY `user_id` (`user_id`);


ALTER TABLE `bus_votes`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `train_votes`
    ADD PRIMARY KEY (`id`),
    ADD KEY `fromName` (`fromName`),
    ADD KEY `toName` (`toName`),
    ADD KEY `ip` (`ip`),
    ADD KEY `user_id` (`user_id`);


ALTER TABLE `train_votes`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `flight_votes`
    ADD PRIMARY KEY (`id`),
    ADD KEY `fromName` (`fromName`),
    ADD KEY `toName` (`toName`),
    ADD KEY `ip` (`ip`),
    ADD KEY `user_id` (`user_id`);


ALTER TABLE `flight_votes`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `hotel_votes`
    ADD PRIMARY KEY (`id`),
    ADD KEY `cityName` (`cityName`),
    ADD KEY `hotelId` (`hotelId`),
    ADD KEY `ip` (`ip`),
    ADD KEY `user_id` (`user_id`);


ALTER TABLE `hotel_votes`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `hotel_survey`
    ADD PRIMARY KEY (`id`);


ALTER TABLE `hotel_survey`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



ALTER TABLE `letters`
    ADD INDEX (`ticket_type`),
    ADD INDEX (`ticket_id`);




ALTER TABLE `respina_passengers_hotel_kh`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ind1` (`ticket_id`) USING BTREE;

ALTER TABLE `respina_passengers_hotel_kh`
    ADD INDEX (`user_id`),
    ADD INDEX (`name`),
    ADD INDEX (`family`);

ALTER TABLE `hotel_search`
    ADD INDEX (`ip`);
--
-- Indexes for table `respina_tickets_hotel_kh`
--
ALTER TABLE `respina_tickets_hotel_kh`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `respina_tickets_hotel_kh`
    ADD INDEX (`orderId`),
    ADD INDEX (`regdate`),
    ADD INDEX (`status`),
    ADD INDEX (`numberp`),
    ADD INDEX (`mobile`),
    ADD INDEX (`paymentID`),
    ADD INDEX (`refund`),
    ADD INDEX (`emailed`),
    ADD INDEX (`user_id`);


ALTER TABLE `respina_passengers_hotel`
    ADD PRIMARY KEY (`id`),
    ADD KEY `enameIndexs` (`ename`),
    ADD KEY `efamilyIndexe` (`efamily`),
    ADD KEY `familyIndex` (`family`);
ALTER TABLE `respina_passengers_hotel`
    ADD INDEX (`regdate`);
ALTER TABLE `respina_passengers_hotel`
    ADD INDEX (`user_id`);
ALTER TABLE `respina_passengers_hotel`
    ADD INDEX (`ticket_id`);

ALTER TABLE `respina_tickets_hotel`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `orderId` (`orderId`) USING BTREE;
ALTER TABLE `respina_tickets_hotel`
    ADD INDEX (`regdate`);
ALTER TABLE `respina_tickets_hotel`
    ADD INDEX (`paymentID`);
ALTER TABLE `respina_tickets_hotel`
    ADD INDEX (`sendVoteSms`);

ALTER TABLE `needactions`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `visa`
    ADD PRIMARY KEY (`visa_Id`);


ALTER TABLE `accounting_documents`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
    ADD PRIMARY KEY (`admin_id`);


ALTER TABLE `tiket_categories`
    ADD PRIMARY KEY (`id`),
    ADD KEY `status` (`status`),
    ADD KEY `name` (`name`);


ALTER TABLE `tiket_categories`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Indexes for table `adminlog`
--
ALTER TABLE `adminlog`
    ADD PRIMARY KEY (`adminlog`);

ALTER TABLE `personnel_notif`
    ADD PRIMARY KEY (`id`);
--
-- Indexes for table `admin_ip`
--
ALTER TABLE `admin_ip`
    ADD PRIMARY KEY (`admin_ip_id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
    ADD PRIMARY KEY (`articleID`);

ALTER TABLE `details_respina_tickets`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `ticketid` (`ticketid`);


--
-- Indexes for table `articles_tags`
--
ALTER TABLE `articles_tags`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_category`
--
ALTER TABLE `article_category`
    ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `article_connect`
--
ALTER TABLE `article_connect`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bankdraft`
--
ALTER TABLE `bankdraft`
    ADD PRIMARY KEY (`bankDraftID`);

--
-- Indexes for table `benefit_loss`
--
ALTER TABLE `benefit_loss`
    ADD UNIQUE KEY `f666` (`id`, `serviceprovidersId`, `userId`) USING BTREE;

--
-- Indexes for table `block`
--
ALTER TABLE `block`
    ADD PRIMARY KEY (`block_id`);

--
-- Indexes for table `city_routes`
--
ALTER TABLE `city_routes`
    ADD PRIMARY KEY (`city_routes_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
    ADD PRIMARY KEY (`session_id`),
    ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `contenttitlekey` (`title`);

--
-- Indexes for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `esterdad`
--
ALTER TABLE `esterdad`
    ADD PRIMARY KEY (`esterdadID`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
    ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `hesabdari`
--
ALTER TABLE `hesabdari`
    ADD PRIMARY KEY (`hesabdariID`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
    ADD PRIMARY KEY (`hotelID`);

--
-- Indexes for table `hotelc`
--
ALTER TABLE `hotelc`
    ADD PRIMARY KEY (`hotelcID`);

--
-- Indexes for table `hotelch`
--
ALTER TABLE `hotelch`
    ADD PRIMARY KEY (`hotelchID`);

--
-- Indexes for table `hotelgallery`
--
ALTER TABLE `hotelgallery`
    ADD PRIMARY KEY (`hotelgalleryID`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
    ADD PRIMARY KEY (`hotelsID`);

--
-- Indexes for table `listip`
--
ALTER TABLE `listip`
    ADD PRIMARY KEY (`listipID`),
    ADD KEY `listip_ip` (`listip_ip`);

--
-- Indexes for table `mojodi`
--
ALTER TABLE `mojodi`
    ADD PRIMARY KEY (`mojodiID`);

--
-- Indexes for table `mosafer`
--
ALTER TABLE `mosafer`
    ADD PRIMARY KEY (`mosaferID`);

--
-- Indexes for table `pardakht`
--
ALTER TABLE `pardakht`
    ADD PRIMARY KEY (`pardakhtID`);

--
-- Indexes for table `parvaz`
--
ALTER TABLE `parvaz`
    ADD PRIMARY KEY (`parvazID`);

--
-- Indexes for table `parvazc`
--
ALTER TABLE `parvazc`
    ADD PRIMARY KEY (`parvazcID`);

--
-- Indexes for table `parvazch`
--
ALTER TABLE `parvazch`
    ADD PRIMARY KEY (`parvazchID`);

--
-- Indexes for table `paymentrefund`
--
ALTER TABLE `paymentrefund`
    ADD PRIMARY KEY (`paymentrefundID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
    ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
    ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `permission_group`
--
ALTER TABLE `permission_group`
    ADD PRIMARY KEY (`permission_group_id`);

--
-- Indexes for table `price_routes`
--
ALTER TABLE `price_routes`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference`
--
ALTER TABLE `reference`
    ADD PRIMARY KEY (`reference_id`);

--
-- Indexes for table `refrespina`
--
ALTER TABLE `refrespina`
    ADD PRIMARY KEY (`refrespinaID`);

--
-- Indexes for table `respina_passengers`
--
ALTER TABLE `respina_passengers`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_number` (`ticket_number`),
    ADD KEY `name1` (`name`),
    ADD KEY `family1` (`family`),
    ADD KEY `ename1` (`ename`),
    ADD KEY `efamily1` (`id`),
    ADD KEY `ticket_id` (`ticket_id`);

ALTER TABLE `respina_passengers`
    ADD INDEX (`nid`);
ALTER TABLE `respina_passengers`
    ADD INDEX (`passport_number`);

--
-- Indexes for table `respina_passengers_kh`
--
ALTER TABLE `respina_passengers_kh`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ind1` (`ticket_id`) USING BTREE;

--
-- Indexes for table `respina_tickets`
--
ALTER TABLE `respina_tickets`
    ADD PRIMARY KEY (`id`);


ALTER TABLE `services_request_call`
    ADD PRIMARY KEY (`id`),
    ADD KEY `regdate` (`regdate`),
    ADD KEY `user_mobile` (`user_mobile`),
    ADD KEY `ip` (`ip`),
    ADD KEY `origin_name` (`origin_name`),
    ADD KEY `dest_name` (`dest_name`);
--
-- Indexes for table `respina_tickets_bus`
--
ALTER TABLE `respina_tickets_bus`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `respina_tickets_bus`
    ADD INDEX (`regdate`),
    ADD INDEX (`orderId`),
    ADD INDEX (`status`),
    ADD INDEX (`pnr`),
    ADD INDEX (`numberp`),
    ADD INDEX (`mobile`),
    ADD INDEX (`paymentID`),
    ADD INDEX (`refund`),
    ADD INDEX (`emailed`),
    ADD INDEX (`admin_reserve`),
    ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `respina_tickets_train_kh`
--
ALTER TABLE `respina_tickets_train_kh`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `respina_tickets_train_kh`
    ADD INDEX (`user_id`),
    ADD INDEX (`regdate`),
    ADD INDEX (`followId`),
    ADD INDEX (`status`),
    ADD INDEX (`eticket`),
    ADD INDEX (`numberp`),
    ADD INDEX (`mobile`),
    ADD INDEX (`paymentID`),
    ADD INDEX (`refund`),
    ADD INDEX (`emailed`);

--
-- Indexes for table `respina_passengers_train_kh`
--
ALTER TABLE `respina_passengers_train_kh`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ind1` (`ticket_id`) USING BTREE;

ALTER TABLE `respina_passengers_train_kh`
    ADD INDEX (`ticket_id`),
    ADD INDEX (`user_id`),
    ADD INDEX (`name`),
    ADD INDEX (`family`),
    ADD INDEX (`ename`),
    ADD INDEX (`efamily`),
    ADD INDEX (`nid`),
    ADD INDEX (`passport_number`);

--
-- Indexes for table `tour_list_cities`
--

ALTER TABLE `tour_list_cities`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `city` (`city`);

--
-- Indexes for table `respina_tickets_kh`
--
ALTER TABLE `respina_tickets_kh`
    ADD PRIMARY KEY (`id`);


--
-- Indexes for table `parvazc_inter`
--
ALTER TABLE `parvazc_inter`
    ADD PRIMARY KEY (`parvazcID`);

--
-- Indexes for table `send_massage`
--
ALTER TABLE `send_massage`
    ADD PRIMARY KEY (`sendMassage_id`);

--
-- Indexes for table `serviceproviders`
--
ALTER TABLE `serviceproviders`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `id` (`id`, `typeId`) USING BTREE;

--
-- Indexes for table `serviceproviders_transactions`
--
ALTER TABLE `serviceproviders_transactions`
    ADD UNIQUE KEY `f66` (`id`, `serviceprovidersId`) USING BTREE;

--
-- Indexes for table `serviceproviders_type`
--
ALTER TABLE `serviceproviders_type`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `subtiket`
--
ALTER TABLE `subtiket`
    ADD PRIMARY KEY (`subtiketID`),
    ADD INDEX (`tiketsID`),
    ADD INDEX (`user_id`);

ALTER TABLE `subtasks`
    ADD PRIMARY KEY (`id`),
    ADD KEY `tiketsID` (`tiketsID`);

--
-- Indexes for table `tarkonesh`
--
ALTER TABLE `tarkonesh`
    ADD PRIMARY KEY (`tarkoneshID`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
    ADD PRIMARY KEY (`tiketID`);

--
-- Indexes for table `tiketall`
--
ALTER TABLE `tiketall`
    ADD PRIMARY KEY (`tiketallID`);

--
-- Indexes for table `total_profit`
--
ALTER TABLE `total_profit`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `train_passengers`
--
ALTER TABLE `train_passengers`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `train_passengers`
    ADD INDEX (`ticket_id`),
    ADD INDEX (`name`),
    ADD INDEX (`family`),
    ADD INDEX (`ename`),
    ADD INDEX (`efamily`),
    ADD INDEX (`nid`),
    ADD INDEX (`user_id`);

--
-- Indexes for table `train_tickets`
--
ALTER TABLE `train_tickets`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `train_tickets`
    ADD INDEX (`regdate`),
    ADD INDEX (`ticketid`),
    ADD INDEX (`status`),
    ADD INDEX (`pnr`),
    ADD INDEX (`numberp`),
    ADD INDEX (`mobile`),
    ADD INDEX (`paymentID`),
    ADD INDEX (`refund`),
    ADD INDEX (`user_id`);

--
-- Indexes for table `trainc`
--
ALTER TABLE `trainc`
    ADD PRIMARY KEY (`traincID`);


ALTER TABLE `train_ip_log`
    ADD PRIMARY KEY (`id`);
--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`user_id`);

ALTER TABLE `users`
    ADD INDEX (`user_cellphone`);
ALTER TABLE `users`
    ADD INDEX (`user_level`);
ALTER TABLE `users`
    ADD INDEX (`user_active`);

--
-- Indexes for table `users_transactions`
--
ALTER TABLE `users_transactions`
    ADD UNIQUE KEY `f6` (`id`, `userId`) USING BTREE;

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
    ADD PRIMARY KEY (`user_info_id`);

--
-- Indexes for table `user_ip`
--
ALTER TABLE `user_ip`
    ADD PRIMARY KEY (`user_ip_id`);

--
-- Indexes for table `user_limit`
--
ALTER TABLE `user_limit`
    ADD PRIMARY KEY (`user_id`);

ALTER TABLE `tour_sms_links`
    ADD PRIMARY KEY (`id`);


ALTER TABLE `tour_international_city_hotels`
    ADD PRIMARY KEY (`id`),
    ADD KEY `city_id` (`city_id`),
    ADD KEY `hotel_id` (`hotel_id`),
    ADD KEY `hotel_api_id` (`hotel_api_id`);



ALTER TABLE `tour_international_search`
    ADD PRIMARY KEY (`id`),
    ADD KEY `origin_id` (`origin_id`),
    ADD KEY `dest_id` (`dest_id`),
    ADD KEY `user_mobile` (`user_mobile`);

ALTER TABLE `tour_international_city_comment`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `tour_international_tickets`
    ADD PRIMARY KEY (`id`),
    ADD KEY `tour_id` (`tour_id`),
    ADD KEY `user_id` (`user_id`),
    ADD KEY `api_ticket_id` (`api_ticket_id`),
    ADD KEY `status` (`status`),
    ADD KEY `pnr` (`pnr`),
    ADD KEY `user_mobile` (`user_mobile`),
    ADD KEY `paymentID` (`paymentID`),
    ADD KEY `needaction_status` (`needaction_status`),
    ADD KEY `refund` (`refund`);

ALTER TABLE `tour_international_tickets_carriages`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`);

ALTER TABLE `tour_international_tickets_hotels`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`);

ALTER TABLE `tour_international_tickets_insurance`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`);

ALTER TABLE `tour_international_tickets_rooms`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`),
    ADD KEY `ticket_hotel_id` (`ticket_hotel_id`);

ALTER TABLE `tour_international_tickets_travels`
    ADD PRIMARY KEY (`id`),
    ADD KEY `ticket_id` (`ticket_id`),
    ADD KEY `ticket_hotel_id` (`ticket_hotel_id`);

ALTER TABLE `tour_international_ticket_passengers`
    ADD UNIQUE KEY `id` (`id`),
    ADD KEY `tour_international_ticket_passengers2_ibfk_1` (`ticket_id`),
    ADD KEY `meli_code` (`meli_code`);



ALTER TABLE `tour_tickets`
    ADD PRIMARY KEY (`id`),
    ADD KEY `pnr` (`pnr`),
    ADD KEY `user_id` (`user_id`),
    ADD KEY `status` (`status`),
    ADD KEY `regdate` (`regdate`),
    ADD KEY `apiTicketId` (`apiTicketId`),
    ADD KEY `numberp` (`numberp`),
    ADD KEY `mobile` (`mobile`),
    ADD KEY `paymentID` (`paymentID`),
    ADD KEY `refund` (`refund`);

ALTER TABLE `tour_tickets`
    ADD INDEX (`regdate`),
    ADD INDEX (`apiTicketId`),
    ADD INDEX (`status`),
    ADD INDEX (`numberp`),
    ADD INDEX (`mobile`),
    ADD INDEX (`paymentID`),
    ADD INDEX (`refund`);


ALTER TABLE `tour_ticket_passengers`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `tour_ticket_passengers`
    ADD INDEX (`ticketID`),
    ADD INDEX (`name`),
    ADD INDEX (`Lname`),
    ADD INDEX (`latinName`),
    ADD INDEX (`latinLName`),
    ADD INDEX (`Mcode`);


ALTER TABLE `tour_shared`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `hami_id` (`hami_id`);

ALTER TABLE `ApiCharge`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `articleComment`
    ADD PRIMARY KEY (`commentId`);

ALTER TABLE `articleCommentVote`
    ADD PRIMARY KEY (`voteId`);

ALTER TABLE `jobs`
    ADD PRIMARY KEY (`id`);


--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounting_documents`
--

ALTER TABLE `details_respina_tickets`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `train_ip_log`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `notepad_list`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `instructions`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `personnel_notif`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `notifications_action`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `needactions`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `visa`
    MODIFY `visa_Id` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 10;

ALTER TABLE `accounting_documents`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1000;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
    MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 24;
--
-- AUTO_INCREMENT for table `adminlog`
--
ALTER TABLE `adminlog`
    MODIFY `adminlog` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 6;
--
-- AUTO_INCREMENT for table `admin_ip`
--
ALTER TABLE `admin_ip`
    MODIFY `admin_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 194;
--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
    MODIFY `articleID` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 89;
--
-- AUTO_INCREMENT for table `articles_tags`
--
ALTER TABLE `articles_tags`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1;
--
-- AUTO_INCREMENT for table `article_category`
--
ALTER TABLE `article_category`
    MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;
--
-- AUTO_INCREMENT for table `article_connect`
--
ALTER TABLE `article_connect`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 75;
--
-- AUTO_INCREMENT for table `bankdraft`
--
ALTER TABLE `bankdraft`
    MODIFY `bankDraftID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `benefit_loss`
--
ALTER TABLE `benefit_loss`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 405;
--
-- AUTO_INCREMENT for table `block`
--
ALTER TABLE `block`
    MODIFY `block_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `city_routes`
--
ALTER TABLE `city_routes`
    MODIFY `city_routes_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 41;
--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
    MODIFY `id` int(64) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 338;
--
-- AUTO_INCREMENT for table `esterdad`
--
ALTER TABLE `esterdad`
    MODIFY `esterdadID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
    MODIFY `image_id` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 8;
--
-- AUTO_INCREMENT for table `hesabdari`
--
ALTER TABLE `hesabdari`
    MODIFY `hesabdariID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;
--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
    MODIFY `hotelID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotelc`
--
ALTER TABLE `hotelc`
    MODIFY `hotelcID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotelch`
--
ALTER TABLE `hotelch`
    MODIFY `hotelchID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotelgallery`
--
ALTER TABLE `hotelgallery`
    MODIFY `hotelgalleryID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
    MODIFY `hotelsID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `listip`
--
ALTER TABLE `listip`
    MODIFY `listipID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 20;
--
-- AUTO_INCREMENT for table `mojodi`
--
ALTER TABLE `mojodi`
    MODIFY `mojodiID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mosafer`
--
ALTER TABLE `mosafer`
    MODIFY `mosaferID` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 38;
--
-- AUTO_INCREMENT for table `pardakht`
--
ALTER TABLE `pardakht`
    MODIFY `pardakhtID` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 3;
--
-- AUTO_INCREMENT for table `parvaz`
--
ALTER TABLE `parvaz`
    MODIFY `parvazID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `parvazc`
--
ALTER TABLE `parvazc`
    MODIFY `parvazcID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 22;
--
-- AUTO_INCREMENT for table `parvazch`
--

ALTER TABLE `tiket_groups`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `parvazch`
    MODIFY `parvazchID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paymentrefund`
--
ALTER TABLE `paymentrefund`
    MODIFY `paymentrefundID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
    MODIFY `paymentID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;
--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
    MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 43;
--
-- AUTO_INCREMENT for table `permission_group`
--
ALTER TABLE `permission_group`
    MODIFY `permission_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `price_routes`
--
ALTER TABLE `price_routes`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reference`
--
ALTER TABLE `reference`
    MODIFY `reference_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 13;
--
-- AUTO_INCREMENT for table `refrespina`
--
ALTER TABLE `refrespina`
    MODIFY `refrespinaID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `respina_passengers`
--
ALTER TABLE `respina_passengers`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;
--
-- AUTO_INCREMENT for table `respina_passengers_kh`
--
ALTER TABLE `respina_passengers_kh`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;
--
-- AUTO_INCREMENT for table `respina_tickets`
--
ALTER TABLE `respina_tickets`
    MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;
--
-- AUTO_INCREMENT for table `respina_tickets_bus`
--
ALTER TABLE `respina_tickets_bus`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;

--
-- AUTO_INCREMENT for table `tour_list_cities`
--

ALTER TABLE `tour_list_cities`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `respina_tickets_kh`
--
ALTER TABLE `respina_tickets_kh`
    MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;
--
-- AUTO_INCREMENT for table `parvazc_inter`
--
ALTER TABLE `parvazc_inter`
    MODIFY `parvazcID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1865;
--
-- AUTO_INCREMENT for table `send_massage`
--
ALTER TABLE `send_massage`
    MODIFY `sendMassage_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `serviceproviders`
--
ALTER TABLE `serviceproviders`
    MODIFY `id` int(64) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `serviceproviders_transactions`
--
ALTER TABLE `serviceproviders_transactions`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `serviceproviders_type`
--
ALTER TABLE `serviceproviders_type`
    MODIFY `id` int(64) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subtiket`
--
ALTER TABLE `subtiket`
    MODIFY `subtiketID` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `subtasks`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tarkonesh`
--
ALTER TABLE `tarkonesh`
    MODIFY `tarkoneshID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 45;
--
-- AUTO_INCREMENT for table `tiket`
--
ALTER TABLE `tiket`
    MODIFY `tiketID` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 107;
--
-- AUTO_INCREMENT for table `tiketall`
--
ALTER TABLE `tiketall`
    MODIFY `tiketallID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tikets`
--
ALTER TABLE `tikets`
    MODIFY `tiketsID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `total_profit`
--
ALTER TABLE `total_profit`
    MODIFY `id` int(64) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 2;
--
-- AUTO_INCREMENT for table `train_passengers`
--
ALTER TABLE `train_passengers`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;

--
-- AUTO_INCREMENT for table `respina_tickets_train_kh`
--
ALTER TABLE `respina_tickets_train_kh`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;

--
-- AUTO_INCREMENT for table `respina_passengers_train_kh`
--
ALTER TABLE `respina_passengers_train_kh`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;
--
-- AUTO_INCREMENT for table `train_tickets`
--
ALTER TABLE `train_tickets`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;
--
-- AUTO_INCREMENT for table `trainc`
--
ALTER TABLE `trainc`
    MODIFY `traincID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;
--
-- AUTO_INCREMENT for table `users_transactions`
--
ALTER TABLE `users_transactions`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1558;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
    MODIFY `user_info_id` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 452;
--
-- AUTO_INCREMENT for table `user_ip`
--
ALTER TABLE `user_ip`
    MODIFY `user_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 127;

ALTER TABLE `tour_sms_links`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1;

ALTER TABLE `tour_tickets`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;

ALTER TABLE `tour_ticket_passengers`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;


ALTER TABLE `tour_shared`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 2;

ALTER TABLE `respina_passengers_hotel_kh`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;


ALTER TABLE `respina_tickets_hotel_kh`
    MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;


ALTER TABLE `respina_passengers_hotel`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;


ALTER TABLE `respina_tickets_hotel`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;

ALTER TABLE `ApiCharge`
    MODIFY `id` int(64) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;

ALTER TABLE `charge_mobile`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `charge_mobile`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;

ALTER TABLE `articleCommentVote`
    MODIFY `voteId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `articleComment`
    MODIFY `commentId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `jobs`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `phonebook`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tour_international_city_hotels`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tour_international_search`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tour_international_city_comment`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tour_international_tickets`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT =_|_|_|_|_|;

ALTER TABLE `tour_international_tickets_carriages`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tour_international_tickets_hotels`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tour_international_tickets_insurance`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tour_international_tickets_rooms`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tour_international_tickets_rooms`
    ADD CONSTRAINT `tour_international_tickets_rooms_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_international_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `tour_international_tickets_rooms_ibfk_2` FOREIGN KEY (`ticket_hotel_id`) REFERENCES `tour_international_tickets_hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `tour_international_tickets_travels`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tour_international_tickets_travels`
    ADD CONSTRAINT `tour_international_tickets_travels_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_international_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `tour_international_tickets_travels_ibfk_2` FOREIGN KEY (`ticket_hotel_id`) REFERENCES `tour_international_tickets_hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `tour_international_ticket_passengers`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tour_international_ticket_passengers`
    ADD CONSTRAINT `tour_international_ticket_passengers_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tour_international_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;



--
-- Constraints for dumped tables
--

--
-- Constraints for table `respina_passengers_kh`
--
ALTER TABLE `respina_passengers_kh`
    ADD CONSTRAINT `f_key1` FOREIGN KEY (`ticket_id`) REFERENCES `respina_tickets_kh` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `respina_passengers_hotel_kh`
    ADD CONSTRAINT `f_key1754` FOREIGN KEY (`ticket_id`) REFERENCES `respina_tickets_hotel_kh` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
    ADD PRIMARY KEY (`blogId`);

ALTER TABLE `blog`
    ADD FULLTEXT (`blogTag`);
ALTER TABLE `blog`
    ADD FULLTEXT (`blogType`);
ALTER TABLE `blog`
    ADD FULLTEXT (`blogCategory`);
ALTER TABLE `blog`
    ADD INDEX (`blogSuggest`);

--
-- Indexes for table `blogCategory`
--
ALTER TABLE `blogCategory`
    ADD PRIMARY KEY (`categoryId`);

ALTER TABLE `freemelicode`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `console_log`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `contactus`
    ADD PRIMARY KEY (`id`);


ALTER TABLE `charge_mobile`
    ADD INDEX (`orderId`);
ALTER TABLE `charge_mobile`
    ADD INDEX (`regdate`);
ALTER TABLE `charge_mobile`
    ADD INDEX (`paymentID`);
ALTER TABLE `charge_mobile`
    ADD INDEX (`user_id`);

--
-- Indexes for table `blogComment`
--
ALTER TABLE `blogComment`
    ADD PRIMARY KEY (`commentId`);
ALTER TABLE `blogComment`
    ADD INDEX (`commentItemId`);
ALTER TABLE `blogComment`
    ADD INDEX (`commentUserId`);
--
-- Indexes for table `blogFavorite`
--
ALTER TABLE `blogFavorite`
    ADD PRIMARY KEY (`favoriteId`);
ALTER TABLE `blogFavorite`
    ADD INDEX (`favoriteBlogId`);
ALTER TABLE `blogFavorite`
    ADD INDEX (`favoriteUserId`);

--
-- Indexes for table `blogFile`
--
ALTER TABLE `blogFile`
    ADD PRIMARY KEY (`fileId`);

ALTER TABLE `blogFile`
    ADD INDEX (`fileBlogId`);

--
-- Indexes for table `blogLike`
--
ALTER TABLE `blogLike`
    ADD PRIMARY KEY (`likeId`);
ALTER TABLE `blogLike`
    ADD INDEX (`likeBlogId`);
ALTER TABLE `blogLike`
    ADD INDEX (`likeUserId`);

--
-- Indexes for table `blogTag`
--
ALTER TABLE `blogTag`
    ADD PRIMARY KEY (`tagId`);

--
-- Indexes for table `blogVisit`
--
ALTER TABLE `blogVisit`
    ADD PRIMARY KEY (`visitId`);
ALTER TABLE `blogVisit`
    ADD INDEX (`visitBlogId`);
ALTER TABLE `blogVisit`
    ADD INDEX (`visitUserId`);

ALTER TABLE `discount_code`
    ADD PRIMARY KEY (`id`),
    ADD INDEX (`regdate`),
    ADD INDEX (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

ALTER TABLE `services_request_call`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
    MODIFY `blogId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'شناسه مقاله',
    AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT for table `blogCategory`
--
ALTER TABLE `blogCategory`
    MODIFY `categoryId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'شناسه دسته',
    AUTO_INCREMENT = 188;

--
-- AUTO_INCREMENT for table `blogComment`
--
ALTER TABLE `blogComment`
    MODIFY `commentId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'شناسه کامنت';

--
-- AUTO_INCREMENT for table `blogFavorite`
--
ALTER TABLE `blogFavorite`
    MODIFY `favoriteId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'شناسه';

--
-- AUTO_INCREMENT for table `blogFile`
--
ALTER TABLE `blogFile`
    MODIFY `fileId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 2;

--
-- AUTO_INCREMENT for table `blogLike`
--
ALTER TABLE `blogLike`
    MODIFY `likeId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'شناسه لایک';

--
-- AUTO_INCREMENT for table `blogTag`
--
ALTER TABLE `blogTag`
    MODIFY `tagId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogVisit`
--
ALTER TABLE `blogVisit`
    MODIFY `visitId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'شناسه';
-- end added kavousi

ALTER TABLE `discount_code`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `freemelicode`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `console_log`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `contactus`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



ALTER TABLE `smsgroup`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `vacation_request`
    ADD PRIMARY KEY (`id`);


ALTER TABLE `vacation_request`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



ALTER TABLE `sms_messages`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `brb_events`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sms_messages`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


ALTER TABLE `respina_tickets`
    ADD INDEX `regdatefkeyin1` (`regdate`);
ALTER TABLE `respina_tickets`
    ADD INDEX `status` (`status`);
ALTER TABLE `respina_tickets`
    ADD INDEX `ticketi_idfkey` (`ticketid`);
ALTER TABLE `respina_tickets`
    ADD INDEX `pnrfkey1` (`pnr`);
ALTER TABLE `respina_tickets`
    ADD INDEX `numberpfkey1` (`numberp`);
ALTER TABLE `respina_tickets`
    ADD INDEX `mobilefkey1` (`mobile`);
ALTER TABLE `respina_tickets`
    ADD INDEX `paymentIDFKEY1` (`paymentID`);
ALTER TABLE `respina_tickets`
    ADD INDEX `refundfkey1` (`refund`);
ALTER TABLE `respina_tickets`
    ADD INDEX `emailedfkey1` (`emailed`);
ALTER TABLE `payments`
    ADD INDEX `paymentcodesalefkey1` (`paymentcodesale`);
ALTER TABLE `payments`
    ADD INDEX `banknamefkey1` (`bank_name`);
ALTER TABLE `payments`
    ADD INDEX `respinaIDfkey1` (`respinaID`);
ALTER TABLE `payments`
    ADD INDEX `useridpaymentsfkey1` (`user_id`);
ALTER TABLE `payments`
    ADD INDEX `paymentTypefkey` (`paymentType`);

ALTER TABLE train_tickets
    ADD hesabdariID            INT                                                    NULL     DEFAULT NULL,
    ADD esrequest_status       TINYINT(1)                                             NULL     DEFAULT NULL AFTER hesabdariID,
    ADD admin_id               VARCHAR(25)                                            NULL     DEFAULT NULL AFTER esrequest_status,
    ADD esrequest_type         TINYINT(1)                                             NULL     DEFAULT NULL AFTER admin_id,
    ADD esrequest_reason       TINYINT(1)                                             NULL     DEFAULT NULL AFTER esrequest_type,
    ADD esrequest_date         VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL AFTER esrequest_reason,
    ADD esrequest_datetakmil   VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL AFTER esrequest_date,
    ADD esrequest_paytype      TINYINT(1)                                             NOT NULL DEFAULT '0' AFTER esrequest_datetakmil,
    ADD esrequest_description  TEXT                                                   NOT NULL AFTER esrequest_paytype,
    ADD esrequest_price        INT                                                    NULL     DEFAULT NULL AFTER esrequest_description,
    ADD eskargozar_price       INT                                                    NULL     DEFAULT NULL AFTER esrequest_price,
    ADD eskargozar_statusprice TINYINT(1)                                             NOT NULL DEFAULT '1' AFTER eskargozar_price,
    ADD eskargozar_date        VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_persian_ci NULL     DEFAULT NULL AFTER eskargozar_statusprice;

ALTER TABLE train_passengers
    ADD est_status TINYINT(2) NOT NULL DEFAULT '0';

ALTER TABLE `train_tickets`
    ADD `buyhand_id` INT NULL DEFAULT NULL;

############ SEO contents ############


INSERT IGNORE INTO `contents` (`type`, `title`, `value`, `active`)
VALUES ('seo', 'meta_word', '', 1),
       ('seo', 'meta_descrip', '', 1),
       ('seo', 'metawordflightD', '', 1),
       ('seo', 'metadescribeflightD', '', 1),
       ('seo', 'metawordflightI', '', 1),
       ('seo', 'metadescribeflightI', '', 1),
       ('seo', 'metawordtrain', '', 1),
       ('seo', 'metadescribetrain', '', 1),
       ('seo', 'metawordhotel', '', 1),
       ('seo', 'metadescribehotel', '', 1),
       ('seo', 'metawordbus', '', 1),
       ('seo', 'metadescribebus', '', 1),
       ('seo', 'metawordtour', '', 1),
       ('seo', 'metadescribetour', '', 1),
       ('seo', 'metatitleflightD', '', 1),
       ('seo', 'metatitleflightI', '', 1),
       ('seo', 'metatitletrain', '', 1),
       ('seo', 'metatitlehotel', '', 1),
       ('seo', 'metatitletour', '', 1),
       ('seo', 'metatitlebus', '', 1),
       ('seo', 'metatitlehotelINT', '', 1),
       ('seo', 'metawordhotelINT', '', 1),
       ('seo', 'metadescribehotelINT', '', 1),
       ('seo', 'metatitletour2', '', 1),
       ('seo', 'metadescribetour2', '', 1),
       ('seo', 'metatitletourDomestic', '', 1),
       ('seo', 'metadescribetourDomestic', '', 1),
       ('seo', 'metawordtour2', '', 1),
       ('seo', 'metawordtourDomestic', '', 1),
       ('seo', 'metatitleinsurance', '', 1),
       ('seo', 'metawordinsurance', '', 1),
       ('seo', 'metadescribeinsurance', '', 1),
       ('seo', 'metatitleInternationalTrain', '', 1),
       ('seo', 'metadescribeInternationalTrain', '', 1),
       ('seo', 'metawordInternationalTrain', '', 1),
       ('seo', 'metatitleinternationalTour', '', 1),
       ('seo', 'metawordinternationalTour', '', 1),
       ('seo', 'metadescribeinternationalTour', '', 1),
       ('seo', 'landingFlight', '', 1),
       ('seo', 'landingInternationalFlight', '', 1),
       ('seo', 'landingTrain', '', 1),
       ('seo', 'landingInternationalTrain', '', 1),
       ('seo', 'landingBus', '', 1),
       ('seo', 'landingHotel', '', 1),
       ('seo', 'landingInternationalHotel', '', 1),
       ('seo', 'landingToor', '', 1),
       ('seo', 'landingTourDomestic', '', 1),
       ('seo', 'landingInternationalTour', '', 1),
       ('seo', 'landingTour', '', 1),
       ('seo', 'landingInsurance', '', 1),
       ('seo', 'landingChargeMobile', '', 1),
       ('seo', 'metatitlecharge', '', 1),
       ('seo', 'metawordcharge', '', 1),
       ('seo', 'metadescribecharge', '', 1),
       ('seo', 'meta_title_contact', '', 1),
       ('seo', 'meta_word_contact', '', 1),
       ('seo', 'meta_desc_contact', '', 1),
       ('seo', 'meta_title_aboutus', '', 1),
       ('seo', 'meta_word_aboutus', '', 1),
       ('seo', 'meta_desc_aboutus', '', 1),
       ('seo', 'meta_title_tips', '', 1),
       ('seo', 'meta_word_tips', '', 1),
       ('seo', 'meta_desc_tips', '', 1),
       ('seo', 'meta_title_follow', '', 1),
       ('seo', 'meta_word_follow', '', 1),
       ('seo', 'meta_desc_follow', '', 1),
       ('seo', 'meta_title_jobs', '', 1),
       ('seo', 'meta_word_jobs', '', 1),
       ('seo', 'meta_desc_jobs', '', 1),
       ('seo', 'meta_title_rules', '', 1),
       ('seo', 'meta_word_rules', '', 1),
       ('seo', 'meta_desc_rules', '', 1),
       ('seo', 'meta_title_login', '', 1),
       ('seo', 'meta_word_login', '', 1),
       ('seo', 'meta_desc_login', '', 1),
       ('seo', 'meta_title_register', '', 1),
       ('seo', 'meta_word_register', '', 1),
       ('seo', 'meta_desc_register', '', 1),
       ('seo', 'meta_title', '', 1),
       ('seo', 'meta_title_call', '', 1),
       ('seo', 'meta_word_call', '', 1),
       ('seo', 'meta_desc_call', '', 1),
       ('seo', 'meta_title_refund', '', 1),
       ('seo', 'meta_word_refund', '', 1),
       ('seo', 'meta_desc_refund', '', 1),
       ('seo', 'meta_title_hostrate', '', 1),
       ('seo', 'meta_word_hostrate', '', 1),
       ('seo', 'meta_desc_hostrate', '', 1),
       ('seo', 'meta_title_sheba', '', 1),
       ('seo', 'meta_word_sheba', '', 1),
       ('seo', 'meta_desc_sheba', '', 1),
       ('seo', 'meta_title_faq', '', 1),
       ('seo', 'meta_word_faq', '', 1),
       ('seo', 'meta_desc_faq', '', 1),
       ('seo', 'meta_title_widget', '', 1),
       ('seo', 'meta_word_widget', '', 1),
       ('seo', 'meta_desc_widget', '', 1),
       ('seo', 'schema_questions', '', 1),
       ('seo', 'related_links', '', 1),
       ('seo', 'schema_questions_flight', '', 1),
       ('seo', 'related_links_flight', '', 1),
       ('seo', 'schema_questions_flight_int', '', 1),
       ('seo', 'related_links_flight_int', '', 1),
       ('seo', 'schema_questions_train', '', 1),
       ('seo', 'related_links_train', '', 1),
       ('seo', 'schema_questions_train_int', '', 1),
       ('seo', 'related_links_train_int', '', 1),
       ('seo', 'schema_questions_bus', '', 1),
       ('seo', 'related_links_bus', '', 1),
       ('seo', 'schema_questions_hotel', '', 1),
       ('seo', 'related_links_hotel', '', 1),
       ('seo', 'schema_questions_hotel_int', '', 1),
       ('seo', 'related_links_hotel_int', '', 1),
       ('seo', 'schema_questions_tour', '', 1),
       ('seo', 'related_links_tour', '', 1),
       ('seo', 'schema_questions_insurance', '', 1),
       ('seo', 'related_links_insurance', '', 1),
       ('seo', 'schema_questions_charge', '', 1),
       ('seo', 'related_links_charge', '', 1),
       ('seo', 'related_links_h1', '', '1'),
       ('seo', 'related_links_h1_flight', '', '1'),
       ('seo', 'related_links_h1_flight_int', '', '1'),
       ('seo', 'related_links_h1_train', '', '1'),
       ('seo', 'related_links_h1_train_int', '', '1'),
       ('seo', 'related_links_h1_bus', '', '1'),
       ('seo', 'related_links_h1_hotel', '', '1'),
       ('seo', 'related_links_h1_hotel_int', '', '1'),
       ('seo', 'related_links_h1_tour', '', '1'),
       ('seo', 'related_links_h1_insurance', '', '1'),
       ('seo', 'related_links_h1_charge', '', '1'),
       ('seo', 'meta_title_passrecovery', '', 1),
       ('seo', 'meta_word_passrecovery', '', 1),
       ('seo', 'meta_desc_passrecovery', '', 1),
       ('seo', 'meta_title_rules_flight', '', 1),
       ('seo', 'meta_word_rules_flight', '', 1),
       ('seo', 'meta_desc_rules_flight', '', 1),
       ('seo', 'meta_title_rules_flight_int', '', 1),
       ('seo', 'meta_word_rules_flight_int', '', 1),
       ('seo', 'meta_desc_rules_flight_int', '', 1),
       ('seo', 'meta_title_rules_train', '', 1),
       ('seo', 'meta_word_rules_train', '', 1),
       ('seo', 'meta_desc_rules_train', '', 1),
       ('seo', 'meta_title_rules_bus', '', 1),
       ('seo', 'meta_word_rules_bus', '', 1),
       ('seo', 'meta_desc_rules_bus', '', 1),
       ('seo', 'meta_title_rules_hotel', '', 1),
       ('seo', 'meta_word_rules_hotel', '', 1),
       ('seo', 'meta_desc_rules_hotel', '', 1),
       ('seo', 'meta_title_app_download', '', 1),
       ('seo', 'meta_word_app_download', '', 1),
       ('seo', 'meta_desc_app_download', '', 1),
       ('seo', 'meta_title_app_help', '', 1),
       ('seo', 'meta_word_app_help', '', 1),
       ('seo', 'meta_desc_app_help', '', 1),
       ('seo', 'meta_h1_call', '', 1),
       ('seo', 'meta_h1_contact', '', 1),
       ('seo', 'meta_h1_aboutus', '', 1),
       ('seo', 'meta_h1_tips', '', 1),
       ('seo', 'meta_h1_follow', '', 1),
       ('seo', 'meta_h1_rules', '', 1),
       ('seo', 'meta_h1_jobs', '', 1),
       ('seo', 'meta_h1_login', '', 1),
       ('seo', 'meta_h1_register', '', 1),
       ('seo', 'meta_h1_passrecovery', '', 1),
       ('seo', 'meta_h1_refund', '', 1),
       ('seo', 'meta_h1_hostrate', '', 1),
       ('seo', 'meta_h1_sheba', '', 1),
       ('seo', 'meta_h1_faq', '', 1),
       ('seo', 'meta_h1_widget', '', 1),
       ('seo', 'meta_h1_rules_flight', '', 1),
       ('seo', 'meta_h1_rules_flight_int', '', 1),
       ('seo', 'meta_h1_rules_train', '', 1),
       ('seo', 'meta_h1_rules_bus', '', 1),
       ('seo', 'meta_h1_rules_hotel', '', 1),
       ('seo', 'meta_h1_app_download', '', 1),
       ('seo', 'meta_h1_app_help', '', 1),
       ('seo', 'meta_h1', '', 1),
       ('seo', 'metah1flightD', '', 1),
       ('seo', 'metah1flightI', '', 1),
       ('seo', 'metah1train', '', 1),
       ('seo', 'metah1InternationalTrain', '', 1),
       ('seo', 'metah1bus', '', 1),
       ('seo', 'metah1hotel', '', 1),
       ('seo', 'metah1hotelINT', '', 1),
       ('seo', 'metah1tour', '', 1),
       ('seo', 'metah1insurance', '', 1),
       ('seo', 'metah1charge', '', 1),
       ('seo', 'meta_title_media', '', 1),
       ('seo', 'meta_word_media', '', 1),
       ('seo', 'meta_desc_media', '', 1),
       ('seo', 'meta_h1_media', '', 1),
       ('seo', 'schema_organization', '', 1),
       ('seo', 'visa', '', 1),
       ('seo', 'metatitlevisa', '', 1),
       ('seo', 'metah1visa', '', 1),
       ('seo', 'metawordvisa', '', 1),
       ('seo', 'metadescribevisa', '', 1),
       ('seo', 'landingvisa', '', 1),
       ('seo', 'schema_questions_visa_int', '', 1),
       ('seo', 'related_links_visa_int', '', 1),
       ('seo', 'related_links_h1_visa_int', '', 1),
       ('seo', 'meta_canonical_contact', '', 1),
       ('seo', 'meta_canonical_aboutus', '', 1),
       ('seo', 'meta_canonical_tips', '', 1),
       ('seo', 'meta_canonical_follow', '', 1),
       ('seo', 'meta_canonical_rules', '', 1),
       ('seo', 'meta_canonical_jobs', '', 1),
       ('seo', 'meta_canonical_login', '', 1),
       ('seo', 'meta_canonical_register', '', 1),
       ('seo', 'meta_canonical_passrecovery', '', 1),
       ('seo', 'meta_canonical_call', '', 1),
       ('seo', 'meta_canonical_refund', '', 1),
       ('seo', 'meta_canonical_hostrate', '', 1),
       ('seo', 'meta_canonical_sheba', '', 1),
       ('seo', 'meta_canonical_faq', '', 1),
       ('seo', 'meta_canonical_widget', '', 1),
       ('seo', 'meta_canonical_rules_flight', '', 1),
       ('seo', 'meta_canonical_rules_flight_int', '', 1),
       ('seo', 'meta_canonical_rules_train', '', 1),
       ('seo', 'meta_canonical_rules_bus', '', 1),
       ('seo', 'meta_canonical_rules_hotel', '', 1),
       ('seo', 'meta_canonical_app_download', '', 1),
       ('seo', 'meta_canonical_app_help', '', 1),
       ('seo', 'meta_canonical_media', '', 1),
       ('seo', 'meta_title_cooperation', '', 1),
       ('seo', 'meta_word_cooperation', '', 1),
       ('seo', 'meta_desc_cooperation', '', 1),
       ('seo', 'meta_h1_cooperation', '', 1),
       ('seo', 'meta_canonical_cooperation', '', 1),
       ('seo', 'schema_rating_contact', '', 1),
       ('seo', 'schema_rating_aboutus', '', 1),
       ('seo', 'schema_rating_tips', '', 1),
       ('seo', 'schema_rating_follow', '', 1),
       ('seo', 'schema_rating_jobs', '', 1),
       ('seo', 'schema_rating_rules', '', 1),
       ('seo', 'schema_rating_login', '', 1),
       ('seo', 'schema_rating_register', '', 1),
       ('seo', 'schema_rating_passrecovery', '', 1),
       ('seo', 'schema_rating_call', '', 1),
       ('seo', 'schema_rating_refund', '', 1),
       ('seo', 'schema_rating_hostrate', '', 1),
       ('seo', 'schema_rating_sheba', '', 1),
       ('seo', 'schema_rating_faq', '', 1),
       ('seo', 'schema_rating_widget', '', 1),
       ('seo', 'schema_rating_rules_flight', '', 1),
       ('seo', 'schema_rating_rules_flight_int', '', 1),
       ('seo', 'schema_rating_rules_train', '', 1),
       ('seo', 'schema_rating_rules_bus', '', 1),
       ('seo', 'schema_rating_rules_hotel', '', 1),
       ('seo', 'schema_rating_app_download', '', 1),
       ('seo', 'schema_rating_app_help', '', 1),
       ('seo', 'schema_rating_media', '', 1),
       ('seo', 'schema_rating_cooperation', '', 1),
       ('seo', 'metaTitleTourService', '', 1),
       ('seo', 'metaWordTourService', '', 1),
       ('seo', 'metaDescribeTourService', '', 1),
       ('seo', 'metaH1TourService', '', 1),
       ('seo', 'landing_text_tips', '', 1),
       ('seo', 'landing_text_follow', '', 1),
       ('seo', 'landing_text_flight_information', '', 1),
       ('seo', 'landing_text_jobs', '', 1),
       ('seo', 'abstract', '', '1'),
       ('seo', 'abstractFlightD', '', '1'),
       ('seo', 'abstractFlightI', '', '1'),
       ('seo', 'abstractTrain', '', '1'),
       ('seo', 'abstractInternationalTrain', '', '1'),
       ('seo', 'abstractBus', '', '1'),
       ('seo', 'abstractHotel', '', '1'),
       ('seo', 'abstractHotelINT', '', '1'),
       ('seo', 'abstractTour', '', '1'),
       ('seo', 'abstractInsurance', '', '1'),
       ('seo', 'abstractCharge', '', '1'),
       ('seo', 'abstractVisa', '', '1'),
       ('module', 'tourismActive', 0, 1),
       ('eshteraki', 'discountEshterakiMahan', '0', 0),
       ('eshteraki', 'discountEshterakiAseman', '0', 1),
       ('eshteraki', 'discountEshterakiIranAir', '0', 1),
       ('eshteraki', 'discountEshterakiNaft', '0', 1),
       ('eshteraki', 'discountEshterakiAtrak', '0', 0),
       ('eshteraki', 'discountEshterakiAta', '0', 1),
       ('eshteraki', 'discountEshterakiZagros', '0', 1),
       ('eshteraki', 'discountEshterakiTaban', '0', 1),
       ('eshteraki', 'discountEshterakiQeshmAir', '0', 1),
       ('eshteraki', 'discountEshterakiMeraj', '0', 0),
       ('eshteraki', 'discountEshterakiCaspian', '0', 1),
       ('eshteraki', 'discountEshterakiAirtour', '0', 0),
       ('eshteraki', 'discountEshterakiKishAir', '0', 0),
       ('eshteraki', 'discountEshterakiVaresh', '0', 1),
       ('eshteraki', 'discountEshterakiSaha', '0', 1),
       ('eshteraki', 'siteEshterakiMahan', '0', 0),
       ('eshteraki', 'siteEshterakiAseman', '0', 0),
       ('eshteraki', 'siteEshterakiIranAir', '0', 0),
       ('eshteraki', 'siteEshterakiNaft', '0', 0),
       ('eshteraki', 'siteEshterakiAtrak', '0', 0),
       ('eshteraki', 'siteEshterakiAta', '0', 0),
       ('eshteraki', 'siteEshterakiZagros', '0', 0),
       ('eshteraki', 'siteEshterakiTaban', '0', 0),
       ('eshteraki', 'siteEshterakiQeshmAir', '0', 0),
       ('eshteraki', 'siteEshterakiMeraj', '0', 0),
       ('eshteraki', 'siteEshterakiCaspian', '0', 0),
       ('eshteraki', 'siteEshterakiAirtour', '0', 0),
       ('eshteraki', 'siteEshterakiKishAir', '0', 0),
       ('eshteraki', 'siteEshterakiVaresh', '0', 0),
       ('eshteraki', 'siteEshterakiSaha', '0', 0),
       ('accounting', 'userfund_cheque_wage', 15, 1),
       ('accounting', 'userfund_cheque_quantity_max', 12, 1);



/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;


DROP FUNCTION IF EXISTS `setNewBuy`;
DROP FUNCTION IF EXISTS `sabtTafzil`;



/*DELIMITER $$
CREATE DEFINER=`respina`@`localhost` FUNCTION `sabtTafzil`(`tafzilId_` INT(11), `amount_` DECIMAL(15,0), `transactionType_` INT(5), `paymentId_` BIGINT(20), `ticketTypeId_` INT(5), `refrenceId_` BIGINT(20), `description_` VARCHAR(500) CHARSET utf8) RETURNS int(11)
    NO SQL
    SQL SECURITY INVOKER
BEGIN
	SELECT typeId INTO @moein_id FROM serviceproviders_type WHERE id = tafzilId_;
	SELECT `add`,`sub` INTO @add_alamat,@sub_alamat FROM serviceproviders WHERE id = @moein_id;

	IF transactionType_ = 1 THEN
		SET amount_ = amount_ * @sub_alamat;
	END IF;
	IF transactionType_ = 2 THEN
		SET amount_ = amount_ * @add_alamat;
	END IF;

	UPDATE serviceproviders_type SET balance = balance + amount_ WHERE id = tafzilId_;
	UPDATE serviceproviders SET balance = balance + amount_ WHERE id = @moein_id;
	SELECT balance INTO @finalBalance FROM serviceproviders_type WHERE id = tafzilId_;
	INSERT INTO serviceproviders_transactions(serviceProvidersId,paymentId,amount,cash,description,refrenceId,ticketTypeId,typeCash,bankId,transactionTypeId,payment_rand,ticketOwner)
	VALUES(tafzilId_,paymentId_,amount_,@finalBalance,description_,refrenceId_,ticketTypeId_,0,0,0,'','');
	RETURN 1;
END$$
DELIMITER ;*/


/*DELIMITER $$
CREATE DEFINER=`respina`@`localhost` FUNCTION `setNewBuy`(`userId_` BIGINT(20), `serviceProvidersId_` INT(5), `paymentId_` BIGINT(20), `amount1_` DECIMAL(15,0), `amount2_` DECIMAL(15,0), `amount3_` DECIMAL(15,0), `refrenceId_` BIGINT(20), `ticketTypeId_` INT(5), `bankId_` INT(5), `transactionTypeId_` INT(5), `description_` VARCHAR(500) CHARSET utf8, `payment_rand_` VARCHAR(10) CHARSET utf8, `ticketOwner_` VARCHAR(10) CHARSET utf8, `amountServiceParvazDakheli_` DECIMAL(15,0), `tableName_` VARCHAR(50) CHARSET utf8) RETURNS int(5)
    NO SQL
    SQL SECURITY INVOKER
BEGIN
	DECLARE resultfinal INT;


	SET @amountSMS = 450;
	SELECT user_mojodi,user_etebar,user_mojodiblock INTO @user_mojodi,@user_etebar,@user_mojodiblock FROM users WHERE user_id = userId_;
	IF amount1_ < 0 THEN
		SET @ghabelbardasht = @user_mojodiblock+@user_etebar;
		IF @ghabelbardasht < ABS(amount1_) THEN
			SELECT -7 INTO resultfinal;
			RETURN resultfinal;
		END IF;
	END IF;

	UPDATE users SET user_mojodiblock = (@user_mojodiblock + amount1_) WHERE user_id = userId_;
	SET @updaterow = ROW_COUNT();
	UPDATE serviceproviders SET balance = (SELECT COALESCE(SUM(user_mojodiblock),0) FROM users WHERE user_mojodiblock > 0) WHERE id = 7;
	IF @updaterow > 0 THEN
		INSERT INTO users_transactions(userId,paymentId,amount,cash,cashblock,description,refrenceId,ticketTypeId,bankId,transactionTypeId)
		VALUES(userId_,paymentId_,amount1_,@user_mojodi,(@user_mojodiblock + amount1_),description_,refrenceId_,ticketTypeId_,bankId_,transactionTypeId_);
		SET @Last_Id = LAST_INSERT_ID();
		IF @Last_Id > 0 THEN
			SELECT balance INTO @serviceproviders_cash FROM serviceproviders WHERE id = serviceProvidersId_;
			SELECT typeCash INTO @typeCash FROM serviceproviders_transactions WHERE ticketTypeId = ticketTypeId_ ORDER BY id DESC LIMIT 1;

			IF ticketOwner_ = 'self' THEN
				IF payment_rand_ = 'self' THEN
					SET @Last_Id = 1;
				ELSE
					SET amount1_ = ABS(amount1_);
					UPDATE serviceproviders SET balance = (@serviceproviders_cash-amount1_) WHERE id = serviceProvidersId_;
					INSERT INTO serviceproviders_transactions(serviceProvidersId,paymentId,amount,cash,description,refrenceId,ticketTypeId,typeCash,bankId,transactionTypeId,payment_rand,ticketOwner)
					VALUES(serviceProvidersId_,paymentId_,(-1*amount1_),(@serviceproviders_cash-amount1_),description_,refrenceId_,ticketTypeId_,(@typeCash-amount1_),bankId_,transactionTypeId_,payment_rand_,ticketOwner_);
					SET @Last_Id = LAST_INSERT_ID();
				END IF;
			ELSE
				IF payment_rand_ = 'self' THEN
					UPDATE serviceproviders SET balance = (@serviceproviders_cash+amount2_) WHERE id = serviceProvidersId_;
					INSERT INTO serviceproviders_transactions(serviceProvidersId,paymentId,amount,cash,description,refrenceId,ticketTypeId,typeCash,bankId,transactionTypeId,payment_rand,ticketOwner)
					VALUES(serviceProvidersId_,paymentId_,amount2_,(@serviceproviders_cash+amount2_),description_,refrenceId_,ticketTypeId_,(@typeCash+amount2_),bankId_,transactionTypeId_,payment_rand_,ticketOwner_);
					SET @Last_Id = LAST_INSERT_ID();
				ELSE
					UPDATE serviceproviders SET balance = (@serviceproviders_cash-amount3_) WHERE id = serviceProvidersId_;
					INSERT INTO serviceproviders_transactions(serviceProvidersId,paymentId,amount,cash,description,refrenceId,ticketTypeId,typeCash,bankId,transactionTypeId,payment_rand,ticketOwner)
					VALUES(serviceProvidersId_,paymentId_,(-1*amount3_),(@serviceproviders_cash-amount3_),description_,refrenceId_,ticketTypeId_,(@typeCash-amount3_),bankId_,transactionTypeId_,payment_rand_,ticketOwner_);
					SET @Last_Id = LAST_INSERT_ID();
				END IF;
			END IF;

			IF @Last_Id > 0 THEN

				SELECT balance INTO @serviceproviders_cash FROM serviceproviders WHERE id = serviceProvidersId_;
				SELECT typeCash INTO @typeCashSms FROM serviceproviders_transactions WHERE ticketTypeId = 120 ORDER BY id DESC LIMIT 1;
				UPDATE serviceproviders SET balance = (@serviceproviders_cash+@amountSms) WHERE id = serviceProvidersId_;
				INSERT INTO serviceproviders_transactions(serviceProvidersId,paymentId,amount,cash,description,refrenceId,ticketTypeId,typeCash,bankId,transactionTypeId,payment_rand,ticketOwner)
				VALUES(serviceProvidersId_,paymentId_,@amountSms,(@serviceproviders_cash+@amountSms),CONCAT('بابت کسر اس ام اس ',description_),refrenceId_,ticketTypeId_,(@typeCashSms+@amountSms),bankId_,transactionTypeId_,payment_rand_,ticketOwner_);
				SELECT sabtTafzil(400020,@amountSMS,2,paymentId_,ticketTypeId_,refrenceId_,description_) INTO @tafzil;
				SET @Last_Id = LAST_INSERT_ID();

				IF ticketTypeId_ = 116 THEN
					SELECT numberp INTO @numberp FROM respina_tickets_bus WHERE id = refrenceId_;
					SET @amountServiceBus = amountServiceParvazDakheli_ * @numberp;
					SELECT balance INTO @serviceproviders_cash FROM serviceproviders WHERE id = serviceProvidersId_;
					SELECT typeCash INTO @typeCashBus FROM serviceproviders_transactions WHERE ticketTypeId = 121 ORDER BY id DESC LIMIT 1;
					UPDATE serviceproviders SET balance = (@serviceproviders_cash+@amountServiceBus) WHERE id = serviceProvidersId_;
					INSERT INTO serviceproviders_transactions(serviceProvidersId,paymentId,amount,cash,description,refrenceId,ticketTypeId,typeCash,bankId,transactionTypeId,payment_rand,ticketOwner)
					VALUES(serviceProvidersId_,paymentId_,@amountServiceBus,(@serviceproviders_cash+@amountServiceBus),CONCAT('بابت سگمنت فروش اتوبوس ',description_),refrenceId_,ticketTypeId_,(@typeCashBus+@amountServiceBus),bankId_,transactionTypeId_,payment_rand_,ticketOwner_);
					SELECT sabtTafzil(400019,@amountServiceBus,2,paymentId_,ticketTypeId_,refrenceId_,description_) INTO @tafzil;
					SET @Last_Id = LAST_INSERT_ID();
				END IF;
				IF ticketTypeId_ = 149 THEN
					SELECT numberp INTO @numberp FROM tour_tickets WHERE id = refrenceId_;
					SET @amountServiceTour = 1000 * @numberp;
					SELECT balance INTO @serviceproviders_cash FROM serviceproviders WHERE id = serviceProvidersId_;
					SELECT typeCash INTO @typeCashTour FROM serviceproviders_transactions WHERE ticketTypeId = 149 ORDER BY id DESC LIMIT 1;
					UPDATE serviceproviders SET balance = (@serviceproviders_cash+@amountServiceTour) WHERE id = serviceProvidersId_;
					INSERT INTO serviceproviders_transactions(serviceProvidersId,paymentId,amount,cash,description,refrenceId,ticketTypeId,typeCash,bankId,transactionTypeId,payment_rand,ticketOwner)
					VALUES(serviceProvidersId_,paymentId_,@amountServiceTour,(@serviceproviders_cash+@amountServiceTour),CONCAT('بابت سگمنت فروش تور ',description_),refrenceId_,ticketTypeId_,(@typeCashTour+@amountServiceTour),bankId_,transactionTypeId_,payment_rand_,ticketOwner_);
					SELECT sabtTafzil(400021,@amountServiceTour,2,paymentId_,ticketTypeId_,refrenceId_,description_) INTO @tafzil;
					SET @Last_Id = LAST_INSERT_ID();
				END IF;
				IF ((ticketTypeId_ = 110 OR ticketTypeId_ = 111) AND ticketOwner_ = 'self' AND amountServiceParvazDakheli_ > 0) THEN
					SET @text = '';
					IF ticketTypeId_ = 110 THEN
						SET @text = ' داخلی ';
						SELECT numberp INTO @numberp FROM respina_tickets WHERE id = refrenceId_;
						SET amountServiceParvazDakheli_ = amountServiceParvazDakheli_ * @numberp;
						SELECT sabtTafzil(400017,amountServiceParvazDakheli_,2,paymentId_,ticketTypeId_,refrenceId_,description_) INTO @tafzil;
					END IF;
					IF ticketTypeId_ = 111 THEN
						SET @text = ' خارجی ';
						SELECT numberp INTO @numberp FROM respina_tickets_kh WHERE id = refrenceId_;
						SET amountServiceParvazDakheli_ = 40000 * @numberp;
						SELECT sabtTafzil(400018,amountServiceParvazDakheli_,2,paymentId_,ticketTypeId_,refrenceId_,description_) INTO @tafzil;
					END IF;
					SELECT balance INTO @serviceproviders_cash FROM serviceproviders WHERE id = serviceProvidersId_;
					SELECT typeCash INTO @typeCashParvazDakheli FROM serviceproviders_transactions WHERE ticketTypeId = 121 ORDER BY id DESC LIMIT 1;
					UPDATE serviceproviders SET balance = (@serviceproviders_cash+amountServiceParvazDakheli_) WHERE id = serviceProvidersId_;
					INSERT INTO serviceproviders_transactions(serviceProvidersId,paymentId,amount,cash,description,refrenceId,ticketTypeId,typeCash,bankId,transactionTypeId,payment_rand,ticketOwner)
					VALUES(serviceProvidersId_,paymentId_,amountServiceParvazDakheli_,(@serviceproviders_cash+amountServiceParvazDakheli_),CONCAT('بابت سگمنت فروش پرواز ',@text,description_),refrenceId_,ticketTypeId_,(@typeCashParvazDakheli+amountServiceParvazDakheli_),bankId_,transactionTypeId_,payment_rand_,ticketOwner_);
					SET @Last_Id = LAST_INSERT_ID();
				END IF;

				IF tableName_ = 'respina_tickets' THEN
					UPDATE respina_tickets SET `status` = 3 WHERE id = refrenceId_;
				END IF;
				IF tableName_ = 'respina_tickets_kh' THEN
					UPDATE respina_tickets_kh SET `status` = 3 WHERE id = refrenceId_;
				END IF;
				IF tableName_ = 'train_tickets' THEN
					UPDATE train_tickets SET `status` = 3 WHERE id = refrenceId_;
				END IF;
				IF tableName_ = 'respina_tickets_bus' THEN
					UPDATE respina_tickets_bus SET `status` = 3 WHERE id = refrenceId_;
				END IF;
				IF tableName_ = 'insurance_saman_register' THEN
					UPDATE insurance_saman_register SET `status` = 3 WHERE id = refrenceId_;
				END IF;
				IF tableName_ = 'respina_tickets_hotel' THEN
					UPDATE respina_tickets_hotel SET `status` = 3 WHERE id = refrenceId_;
				END IF;
				IF tableName_ = 'respina_tickets_hotel_kh' THEN
					UPDATE respina_tickets_hotel_kh SET `status` = 3 WHERE id = refrenceId_;
				END IF;
				IF tableName_ = 'tour_tickets' THEN
					UPDATE tour_tickets SET `status` = 3 WHERE id = refrenceId_;
				END IF;
				IF tableName_ = 'charge_mobile' THEN
					UPDATE charge_mobile SET `status` = 3 WHERE id = refrenceId_;
				END IF;
				IF tableName_ = 'respina_tickets_train_kh' THEN
					UPDATE respina_tickets_train_kh SET `status` = 3 WHERE id = refrenceId_;
				END IF;

				SELECT @Last_Id INTO resultfinal;
				RETURN resultfinal;
			ELSE
				SELECT -12 INTO resultfinal;
				RETURN resultfinal;
			END IF;
		ELSE
			SELECT -9 INTO resultfinal;
			RETURN resultfinal;
		END IF;
	ELSE
		SELECT -8 INTO resultfinal;
		RETURN resultfinal;
	END IF;



END$$
DELIMITER ;*/


/*DELIMITER $$
CREATE DEFINER=`respina`@`localhost` FUNCTION `sabtTafzilHesabdari`(`regdate_` BIGINT(20), `serviceprovidersTypeId_` INT(11), `refrenceId_` BIGINT(20), `refrenceId2_` BIGINT(20), `typeService_` VARCHAR(20) CHARSET utf8, `typeAction_` VARCHAR(50) CHARSET utf8, `typeLoc_` VARCHAR(20) CHARSET utf8, `paymentId_` BIGINT(20), `bedehkar_` DECIMAL(15,0), `bestankar_` DECIMAL(15,0), `mahiyat_` VARCHAR(15) CHARSET utf8, `resOperation_` VARCHAR(15) CHARSET utf8, `description_` VARCHAR(500) CHARSET utf8, `effectiveDate_` BIGINT(20), `cycleNumber_` INT(3), `paymentOwner_` VARCHAR(10) CHARSET utf8, `ticketOwner_` VARCHAR(10) CHARSET utf8, `year_` INT(11), `typeApi_` VARCHAR(50) CHARSET utf8, `idDaftarSelf_` BIGINT(20), `idDaftarHami_` BIGINT(20)) RETURNS int(11)
    NO SQL
    SQL SECURITY INVOKER
BEGIN
SELECT typeId INTO @moein_id FROM serviceproviders_type WHERE id = serviceprovidersTypeId_;
SELECT `add`,`sub` INTO @add_alamat,@sub_alamat FROM serviceproviders WHERE id = @moein_id;



IF bedehkar_ > bestankar_ THEN
SET @amount = bedehkar_ * -1;
END IF;
IF bestankar_ > bedehkar_ THEN
SET @amount = bestankar_ * 1;
END IF;



UPDATE serviceproviders_type SET balance = balance + @amount WHERE id = serviceprovidersTypeId_;
UPDATE serviceproviders SET balance = balance + @amount WHERE id = @moein_id;


SELECT balance INTO @finalBalanceMoein FROM serviceproviders WHERE id = @moein_id;
SELECT balance INTO @finalBalanceTafzil FROM serviceproviders_type WHERE id = serviceprovidersTypeId_;



INSERT INTO serviceprovidersType_transactions(regdate,serviceprovidersId,serviceprovidersTypeId,refrenceId,refrenceId2,typeService,typeAction,typeLoc,paymentId,bedehkar,bestankar,mahiyat,resOperation,serviceprovidersCash,serviceprovidersTypeCash,description,effectiveDate,cycleNumber,price,year,typeApi,idDaftarSelf,idDaftarHami)
VALUES(regdate_,@moein_id,serviceprovidersTypeId_,refrenceId_,refrenceId2_,typeService_,typeAction_,typeLoc_,paymentId_,bedehkar_,bestankar_,mahiyat_,resOperation_,@finalBalanceMoein,@finalBalanceTafzil,description_,effectiveDate_,cycleNumber_,@amount,year_,typeApi_,idDaftarSelf_,idDaftarHami_);


SET @Last_Id = LAST_INSERT_ID();


IF @Last_Id > 0 THEN
RETURN @Last_Id;
ELSE
RETURN 0;
END IF;


END$$
DELIMITER ;*/



CREATE TABLE `daftar_roozname_transactions`
(
    `id`                     int(11)                              NOT NULL,
    `regdate`                bigint(20)                           NOT NULL,
    `isUser`                 tinyint(1)                           NOT NULL DEFAULT 0,
    `serviceprovidersId`     int(11)                              NOT NULL,
    `serviceprovidersTypeId` int(11)                              NOT NULL,
    `refrenceId`             bigint(20)                           NOT NULL,
    `refrenceId2`            varchar(40) COLLATE utf8_persian_ci  NOT NULL,
    `typeService`            varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `typeAction`             varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `typeLoc`                varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `paymentId`              varchar(100) COLLATE utf8_persian_ci NOT NULL,
    `bedehkar`               decimal(15, 0)                       NOT NULL,
    `bestankar`              decimal(15, 0)                       NOT NULL,
    `mahiyat`                varchar(15) COLLATE utf8_persian_ci  NOT NULL,
    `resOperation`           varchar(15) COLLATE utf8_persian_ci  NOT NULL,
    `description`            text COLLATE utf8_persian_ci         NOT NULL,
    `effectiveDate`          bigint(20)                           NOT NULL,
    `effectiveOperation`     varchar(15) COLLATE utf8_persian_ci  NOT NULL,
    `cycleNumber`            tinyint(2)                           NOT NULL,
    `paymentOwner`           varchar(10) COLLATE utf8_persian_ci  NOT NULL,
    `ticketOwner`            varchar(10) COLLATE utf8_persian_ci  NOT NULL,
    `year`                   int(11)                              NOT NULL,
    `typeApi`                varchar(50) COLLATE utf8_persian_ci  NOT NULL,
    `idDaftarSelf`           bigint(20)                           NOT NULL,
    `idDaftarHami`           bigint(20)                           NOT NULL,
    `status`                 tinyint(2)                           NOT NULL DEFAULT 0,
    `nameTafzil`             VARCHAR(200)                         NOT NULL,
    `statusHesab`            BIGINT                               NOT NULL DEFAULT '0',
    `tableHesab`             VARCHAR(100)                         NULL     DEFAULT NULL,
    `mojodiManfi`            TINYINT(1)                           NOT NULL DEFAULT '0',
    `Nolimit`                TINYINT(1)                           NOT NULL,
    `statusHesab_h` INT NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_persian_ci;

ALTER TABLE `daftar_roozname_transactions`
    ADD PRIMARY KEY (`id`);
ALTER TABLE `daftar_roozname_transactions`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 156;

ALTER TABLE `daftar_roozname_transactions`
    ADD INDEX (`idDaftarSelf`);
ALTER TABLE `daftar_roozname_transactions`
    ADD INDEX (`refrenceId`);

ALTER TABLE `refundonline_log`
  ADD INDEX(`id_passengers`),
  ADD INDEX(`id_ticket`),
  ADD INDEX(`status`),
  ADD INDEX(`counter_cron`);

ALTER TABLE `respina_passengers`
    ADD `manual_id` INT NULL ,
    ADD INDEX (`manual_id`);

ALTER TABLE `train_passengers`
    ADD `manual_id` INT NULL ,
    ADD INDEX (`manual_id`);


CREATE TABLE `payments_hami`
(
    `id`        int(11)     NOT NULL,
    `paymentID` bigint(11)  NOT NULL,
    `type`      VARCHAR(20) NOT NULL DEFAULT 'hami',
    `book_id` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
ALTER TABLE `payments_hami`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `paymentID` (`paymentID`, `type`);
ALTER TABLE `payments_hami`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 13;



ALTER TABLE `users`
    ADD `future_reserved1` VARCHAR(255) NULL COMMENT 'nid|user_passport|user_birthday|name_en||family_en|user_nationality|gender';

ALTER TABLE `respina_passengers_kh`
    ADD `priceSource`      INT NULL COMMENT 'قیمت خام پرواز رفت سفرنگ',
    ADD `fpriceSource`     INT NULL COMMENT 'قیمت خام پرواز برگشت سفرنگ',
    ADD `finalPriceSource` INT NULL,
    ADD `priceReturn`      INT NULL,
    ADD `fpriceReturn`     INT NULL,
    ADD `finalPriceReturn` INT NULL;
ALTER TABLE `respina_tickets_kh`
    ADD `markupSource` INT NULL COMMENT 'مارک آپ مسیر رفت سفرنگ',
    ADD `markupReturn` INT NULL COMMENT 'مارک آپ مسیر برگشت سفرنگ';
ALTER TABLE `hesabdari`
    ADD INDEX `indexRefund` (`hesabdari_id`, `hesabdari_typeService`, `hesabdari_typeAction`, `hesabdari_status`);


    CREATE TABLE `safarmarket` (
  `id` int(11) NOT NULL,
  `regdate` varchar(50) DEFAULT '',
  `safarmarketId` varchar(100) DEFAULT '',
  `status` tinyint(1) DEFAULT 0,
  `log` text DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `safarmarket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `safarmarketId` (`safarmarketId`);

  ALTER TABLE `safarmarket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- COMMIT;


COMMIT;
