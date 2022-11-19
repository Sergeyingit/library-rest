-- MySQL dump 10.13  Distrib 5.7.38, for Linux (x86_64)
--
-- Host: localhost    Database: dev_keycloak_db
-- ------------------------------------------------------
-- Server version	5.7.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('011ef687-e1d6-4cdd-bc2e-e219c49ac97a',NULL,'conditional-user-configured','master','b611f8bd-c2b5-4a53-95e2-af52d3d50597',0,10,_binary '\0',NULL,NULL),('06c13093-a47b-4dc7-9849-67080267a61a',NULL,NULL,'master','f18dc3de-fd3b-4957-abf1-2acbb972a2c4',1,30,_binary '','9e73b7b9-1e75-489d-a2e6-65c2b9be0c26',NULL),('0b18f604-6a74-4f9c-b03e-7b0bbed58213',NULL,'conditional-user-configured','my_realm','2a4c5ff2-1141-4758-8f1d-85d6f96cfdaf',0,10,_binary '\0',NULL,NULL),('0db45af8-77ab-4dbb-b5ee-a411b90491c4',NULL,'reset-otp','master','02ab2d80-cf0c-4cc1-8c9a-345a193ced5f',0,20,_binary '\0',NULL,NULL),('0e363edb-59d3-4d38-b6ea-1fbb07b2a998',NULL,'identity-provider-redirector','master','77d77a8a-082f-46c5-b06f-121b0559924d',2,25,_binary '\0',NULL,NULL),('0ec0ef33-9eac-4890-8840-9fe36d77fb0d',NULL,NULL,'master','77d77a8a-082f-46c5-b06f-121b0559924d',2,30,_binary '','48f324f8-29bb-49ba-ad3d-d98a3097bbd5',NULL),('0f9f70dc-dbe3-4aa8-962a-d5f19b820a13',NULL,'basic-auth-otp','master','58213540-681e-476a-ad8a-9d3d456ead47',3,20,_binary '\0',NULL,NULL),('10b766e9-88b1-4bc2-b42f-8805d0751f0e',NULL,'client-secret','my_realm','f8a74798-3b62-4eea-8669-7361969715c6',2,10,_binary '\0',NULL,NULL),('14532e03-24d1-44af-90aa-bfde43139e1a',NULL,NULL,'master','a57b8438-efcf-41e5-b1d7-59bacbb43c7c',0,20,_binary '','109b6518-fff4-414a-98fd-0c906fad040f',NULL),('1794f10f-e2d2-40a4-8953-7bea330bff51',NULL,'direct-grant-validate-otp','my_realm','5be9b3f3-d4b3-45e2-834d-629d43f6c57c',0,20,_binary '\0',NULL,NULL),('19bf78ff-c372-40e0-b3ec-4596f3a92f1e',NULL,'conditional-user-configured','my_realm','11a5c51a-0cd3-440c-adc9-4d3917ae7ae7',0,10,_binary '\0',NULL,NULL),('21cd24d9-8850-4d25-963f-2f1537249a70',NULL,'registration-user-creation','my_realm','f7dd7c28-2836-4f6f-9ea8-73da170ff635',0,20,_binary '\0',NULL,NULL),('24d4c70d-a44f-4b5a-9b5e-02c03624875b',NULL,'direct-grant-validate-username','my_realm','d38d65a9-83f1-4abb-8f73-a0dc1b501fb9',0,10,_binary '\0',NULL,NULL),('29038f56-553c-432d-928c-bf92bf18224a',NULL,NULL,'master','48f324f8-29bb-49ba-ad3d-d98a3097bbd5',1,20,_binary '','b611f8bd-c2b5-4a53-95e2-af52d3d50597',NULL),('29aabf69-256d-408c-b678-e479b1b03360',NULL,'http-basic-authenticator','my_realm','58d471ec-6420-453d-a232-a56c04f233f6',0,10,_binary '\0',NULL,NULL),('2a56159b-4097-4475-aad0-994875cdc9cb',NULL,'auth-spnego','my_realm','cf2ff9c2-837b-486e-a84e-82b4f7a869f6',3,20,_binary '\0',NULL,NULL),('2bc57dd2-f077-4fa7-83d9-3cbcd801d8b4',NULL,'registration-recaptcha-action','master','9f03800c-c557-4bb9-a10b-90c5a632c766',3,60,_binary '\0',NULL,NULL),('2d24c0dc-6c17-4c55-afb7-557764666cd2',NULL,'reset-password','my_realm','9a7a2b97-24c2-4ed8-b15c-b555eedc82f3',0,30,_binary '\0',NULL,NULL),('2d8fec90-ec56-4f05-a844-baeedb233f18',NULL,'auth-otp-form','master','b611f8bd-c2b5-4a53-95e2-af52d3d50597',0,20,_binary '\0',NULL,NULL),('3269dded-53c0-474a-95cc-8b5195a84de1',NULL,NULL,'master','ce25c34d-59fe-4cc8-a177-8c91e2d50e0e',2,20,_binary '','a57b8438-efcf-41e5-b1d7-59bacbb43c7c',NULL),('3450f073-4bcc-442c-9d6e-212e2acfb146',NULL,'idp-confirm-link','my_realm','1e6443bf-2de9-42e7-bc8a-d89c16bf7ab5',0,10,_binary '\0',NULL,NULL),('35e9bec6-44a1-4322-a848-590a2cc24f89',NULL,'auth-spnego','master','77d77a8a-082f-46c5-b06f-121b0559924d',3,20,_binary '\0',NULL,NULL),('36807e82-2877-40d4-b4e8-eb7c7d67d815',NULL,NULL,'master','fdd2fba9-4608-4c69-9b57-e24b39f9ade6',1,40,_binary '','02ab2d80-cf0c-4cc1-8c9a-345a193ced5f',NULL),('36d0bd6f-f80f-4031-8be2-9f8d4f8edf66',NULL,'registration-profile-action','master','9f03800c-c557-4bb9-a10b-90c5a632c766',0,40,_binary '\0',NULL,NULL),('37de6611-6494-498e-9b68-2fc88719c991',NULL,NULL,'my_realm','535f2000-b8df-4e69-9b8b-ff6a9fa97681',0,20,_binary '','afd3d35b-28d5-43c8-981f-49eb3041667b',NULL),('403b6dbd-547e-468b-a5ea-ccf560130e99',NULL,NULL,'my_realm','1e6443bf-2de9-42e7-bc8a-d89c16bf7ab5',0,20,_binary '','43010548-67e5-4768-bbd8-a4679091f40f',NULL),('422ca7e9-8c7b-44cd-a9b9-961d132b9663',NULL,NULL,'master','bae8eee8-9ab5-4e90-9766-4df75f806804',1,20,_binary '','fe5da0c9-8cb7-4a0d-b75f-1e73049fbbef',NULL),('438708f2-bed4-409a-a4b1-7788d6760b83',NULL,'client-secret','master','82927845-0995-4ac9-a18e-bac570dde46a',2,10,_binary '\0',NULL,NULL),('443f9798-0185-40b8-97ab-8bddf87de95e',NULL,'reset-credential-email','master','fdd2fba9-4608-4c69-9b57-e24b39f9ade6',0,20,_binary '\0',NULL,NULL),('4769f4a1-6e12-43da-9b77-d25f8828cbff',NULL,'reset-credentials-choose-user','master','fdd2fba9-4608-4c69-9b57-e24b39f9ade6',0,10,_binary '\0',NULL,NULL),('49183cad-8def-42fa-b5ca-b1d016331fe1',NULL,'auth-otp-form','my_realm','2a4c5ff2-1141-4758-8f1d-85d6f96cfdaf',0,20,_binary '\0',NULL,NULL),('49619000-2815-40e4-9fc6-5e5e6f76cf22',NULL,'conditional-user-configured','master','9e73b7b9-1e75-489d-a2e6-65c2b9be0c26',0,10,_binary '\0',NULL,NULL),('4cc6a4c8-62c0-496d-8eda-eb3cec3767ba',NULL,'auth-username-password-form','my_realm','3fc21c83-cc88-425d-be0a-ff343f10bb07',0,10,_binary '\0',NULL,NULL),('4d5d2526-d62c-47c2-8b19-0b7383395bfb',NULL,'direct-grant-validate-otp','master','9e73b7b9-1e75-489d-a2e6-65c2b9be0c26',0,20,_binary '\0',NULL,NULL),('567f7ca5-c1b3-434e-a5fa-9e0f518cba85',NULL,'reset-credential-email','my_realm','9a7a2b97-24c2-4ed8-b15c-b555eedc82f3',0,20,_binary '\0',NULL,NULL),('57cf81a9-fc2e-4eae-8e0e-459f55226d20',NULL,'reset-password','master','fdd2fba9-4608-4c69-9b57-e24b39f9ade6',0,30,_binary '\0',NULL,NULL),('5948ff1c-e4a2-405d-bf60-f44b498036de',NULL,'reset-otp','my_realm','1ca9fce9-6832-43ff-8e9e-68858dd30016',0,20,_binary '\0',NULL,NULL),('5af2ae44-fe95-4a0c-8eb7-b5653029702e',NULL,'auth-username-password-form','master','48f324f8-29bb-49ba-ad3d-d98a3097bbd5',0,10,_binary '\0',NULL,NULL),('687556a8-0a19-4103-bcb3-060aaa38a47a',NULL,'docker-http-basic-authenticator','master','72891068-e28a-4b1e-8163-8e0027f1e900',0,10,_binary '\0',NULL,NULL),('75844c50-a214-4174-8eaf-c67283a5a5b3',NULL,NULL,'master','d4b00307-1f8d-433f-94f6-eeec51760a4e',0,20,_binary '','58213540-681e-476a-ad8a-9d3d456ead47',NULL),('761ec8bb-0178-48ad-9bf2-ffffcfbd52ae',NULL,NULL,'my_realm','d38d65a9-83f1-4abb-8f73-a0dc1b501fb9',1,30,_binary '','5be9b3f3-d4b3-45e2-834d-629d43f6c57c',NULL),('763d9e24-de30-46a1-8fd7-f5608d3aad09',NULL,'no-cookie-redirect','my_realm','535f2000-b8df-4e69-9b8b-ff6a9fa97681',0,10,_binary '\0',NULL,NULL),('772edbd6-6072-44c6-8036-d1e8c669c7f5',NULL,'registration-password-action','master','9f03800c-c557-4bb9-a10b-90c5a632c766',0,50,_binary '\0',NULL,NULL),('78c45263-3872-4f5e-a57b-7b05ab5ef53d',NULL,'auth-cookie','my_realm','cf2ff9c2-837b-486e-a84e-82b4f7a869f6',2,10,_binary '\0',NULL,NULL),('7a03d854-0a55-41e0-b6cc-0e9c1e39d893',NULL,'conditional-user-configured','my_realm','5be9b3f3-d4b3-45e2-834d-629d43f6c57c',0,10,_binary '\0',NULL,NULL),('7a6e783d-2f56-407f-a3d9-c5d06cb36217',NULL,'docker-http-basic-authenticator','my_realm','d91b075d-ec7b-41b2-8ca3-c53710ee365d',0,10,_binary '\0',NULL,NULL),('7ac57d91-af2d-4659-9803-64028cc9698c',NULL,'auth-spnego','master','58213540-681e-476a-ad8a-9d3d456ead47',3,30,_binary '\0',NULL,NULL),('7b035fad-64e9-407b-a5da-4a0187fec4ad',NULL,NULL,'master','109b6518-fff4-414a-98fd-0c906fad040f',2,20,_binary '','bae8eee8-9ab5-4e90-9766-4df75f806804',NULL),('7b6c863e-00e9-4834-ab17-b86adf27edba',NULL,NULL,'my_realm','43010548-67e5-4768-bbd8-a4679091f40f',2,20,_binary '','86486652-7cf8-4f76-bf0c-6b5d6c7fd5b8',NULL),('7caa6b57-e245-4ecf-9ac7-0b6aab446070',NULL,NULL,'master','6534c5e3-ebfb-4593-97f8-8f1ed8225ab1',0,20,_binary '','ce25c34d-59fe-4cc8-a177-8c91e2d50e0e',NULL),('7cff4db5-4ae2-4c2e-83c0-d2242618bf7d',NULL,'client-x509','master','82927845-0995-4ac9-a18e-bac570dde46a',2,40,_binary '\0',NULL,NULL),('7e6f753b-d626-41fe-b8c1-52be9f94135d',NULL,NULL,'my_realm','3fc21c83-cc88-425d-be0a-ff343f10bb07',1,20,_binary '','11a5c51a-0cd3-440c-adc9-4d3917ae7ae7',NULL),('90987e48-d98b-4081-9862-21bc99162826',NULL,'client-x509','my_realm','f8a74798-3b62-4eea-8669-7361969715c6',2,40,_binary '\0',NULL,NULL),('93c6a915-1332-47fb-a28e-01c38c761dc0',NULL,'registration-password-action','my_realm','f7dd7c28-2836-4f6f-9ea8-73da170ff635',0,50,_binary '\0',NULL,NULL),('9e29733e-b936-48a0-83c5-93bbf7e8ac58',NULL,'idp-confirm-link','master','a57b8438-efcf-41e5-b1d7-59bacbb43c7c',0,10,_binary '\0',NULL,NULL),('9f795575-99db-41cf-90fd-f82e41185c3d',NULL,'conditional-user-configured','master','02ab2d80-cf0c-4cc1-8c9a-345a193ced5f',0,10,_binary '\0',NULL,NULL),('9fd0a203-b406-46b0-b67c-c56ad0aaab23',NULL,NULL,'my_realm','bd28bf24-c799-4fab-a9b4-6313269be9b8',2,20,_binary '','1e6443bf-2de9-42e7-bc8a-d89c16bf7ab5',NULL),('a1bde951-5b0e-4805-b8b5-d795a18bd35e',NULL,'idp-email-verification','master','109b6518-fff4-414a-98fd-0c906fad040f',2,10,_binary '\0',NULL,NULL),('a58b9a2c-74c4-4348-805c-55306905709c',NULL,'direct-grant-validate-password','master','f18dc3de-fd3b-4957-abf1-2acbb972a2c4',0,20,_binary '\0',NULL,NULL),('aa161942-6e15-4df4-946b-c5145a511635',NULL,'conditional-user-configured','my_realm','1ca9fce9-6832-43ff-8e9e-68858dd30016',0,10,_binary '\0',NULL,NULL),('ad9d4940-6782-47b4-a6a3-142741c0cdc9',NULL,'registration-user-creation','master','9f03800c-c557-4bb9-a10b-90c5a632c766',0,20,_binary '\0',NULL,NULL),('b57f6c3d-e4c9-4f12-ae3f-f74fca91dffa',NULL,NULL,'my_realm','9a7a2b97-24c2-4ed8-b15c-b555eedc82f3',1,40,_binary '','1ca9fce9-6832-43ff-8e9e-68858dd30016',NULL),('b7092cab-39ce-4280-93ab-d38125449441',NULL,'basic-auth','my_realm','afd3d35b-28d5-43c8-981f-49eb3041667b',0,10,_binary '\0',NULL,NULL),('b72d559c-c09e-4124-87ad-e3953abf06b6',NULL,'client-secret-jwt','master','82927845-0995-4ac9-a18e-bac570dde46a',2,30,_binary '\0',NULL,NULL),('ba02b9e3-a49d-4d57-977f-62e776cc8e4a',NULL,'identity-provider-redirector','my_realm','cf2ff9c2-837b-486e-a84e-82b4f7a869f6',2,25,_binary '\0',NULL,NULL),('ba0df981-0809-4c70-9b15-89c00cd349fe',NULL,'client-secret-jwt','my_realm','f8a74798-3b62-4eea-8669-7361969715c6',2,30,_binary '\0',NULL,NULL),('bbe36afe-fee2-4c51-a42f-3a2b2b7bcd1a',NULL,'reset-credentials-choose-user','my_realm','9a7a2b97-24c2-4ed8-b15c-b555eedc82f3',0,10,_binary '\0',NULL,NULL),('bd7714e6-1a97-4ae2-866e-73429ae80597',NULL,'auth-cookie','master','77d77a8a-082f-46c5-b06f-121b0559924d',2,10,_binary '\0',NULL,NULL),('bde7dba8-8d76-463e-94e0-26591d84b95b',NULL,'idp-review-profile','my_realm','619121ec-e655-4cf2-895e-0b48ab9920f3',0,10,_binary '\0',NULL,'ee4e33d6-5ca1-49b4-aeb3-2d909dd3c485'),('c0c5d754-bb77-4a4e-a6d6-3dd8ed71d330',NULL,'auth-otp-form','my_realm','11a5c51a-0cd3-440c-adc9-4d3917ae7ae7',0,20,_binary '\0',NULL,NULL),('c22e559f-dd90-4ddf-9659-da7f1e7a7f6c',NULL,NULL,'my_realm','cf2ff9c2-837b-486e-a84e-82b4f7a869f6',2,30,_binary '','3fc21c83-cc88-425d-be0a-ff343f10bb07',NULL),('c3c9d5ad-4d5f-4ae9-90c5-082e14750960',NULL,'idp-username-password-form','master','bae8eee8-9ab5-4e90-9766-4df75f806804',0,10,_binary '\0',NULL,NULL),('c601159f-1d31-46e2-87a8-3b85472f9227',NULL,'registration-profile-action','my_realm','f7dd7c28-2836-4f6f-9ea8-73da170ff635',0,40,_binary '\0',NULL,NULL),('c6a018f1-11d1-4067-aa14-052408418505',NULL,'direct-grant-validate-password','my_realm','d38d65a9-83f1-4abb-8f73-a0dc1b501fb9',0,20,_binary '\0',NULL,NULL),('c7655f77-3b2e-40b1-a66c-7cd0c3000cc2',NULL,'idp-review-profile','master','6534c5e3-ebfb-4593-97f8-8f1ed8225ab1',0,10,_binary '\0',NULL,'0b103e47-2d23-41da-b992-ec468610f7d7'),('ca17b05e-7a2a-4c86-a437-bb96e851f4ae',NULL,'no-cookie-redirect','master','d4b00307-1f8d-433f-94f6-eeec51760a4e',0,10,_binary '\0',NULL,NULL),('d5bb7e43-448a-4be0-a6d4-300040861bd5',NULL,NULL,'my_realm','86486652-7cf8-4f76-bf0c-6b5d6c7fd5b8',1,20,_binary '','2a4c5ff2-1141-4758-8f1d-85d6f96cfdaf',NULL),('d5f0c2d3-730e-4b4d-b370-44f28413b49c',NULL,'registration-page-form','my_realm','98b56f97-ef53-4152-9f49-630beb95c85e',0,10,_binary '','f7dd7c28-2836-4f6f-9ea8-73da170ff635',NULL),('d6f6a9a4-b7a7-42b1-a6ad-0e06a82c308e',NULL,'client-jwt','master','82927845-0995-4ac9-a18e-bac570dde46a',2,20,_binary '\0',NULL,NULL),('d9dc31ca-c655-4727-9dd5-e5730f7c899a',NULL,'registration-recaptcha-action','my_realm','f7dd7c28-2836-4f6f-9ea8-73da170ff635',3,60,_binary '\0',NULL,NULL),('db019706-2123-4c92-95a7-d4640005841b',NULL,'http-basic-authenticator','master','fbc763d7-cd9f-48e8-b8b2-c0c4011989ef',0,10,_binary '\0',NULL,NULL),('dd26f5a6-a523-49fc-98e9-744e184d9759',NULL,'auth-otp-form','master','fe5da0c9-8cb7-4a0d-b75f-1e73049fbbef',0,20,_binary '\0',NULL,NULL),('dd7193dc-66eb-43b1-bc6f-85f7d50ac5d5',NULL,'idp-create-user-if-unique','master','ce25c34d-59fe-4cc8-a177-8c91e2d50e0e',2,10,_binary '\0',NULL,'d0a97095-9215-4f65-aa17-b6c103a8c896'),('de23b237-3c38-47a2-a363-aa8bc3254686',NULL,'client-jwt','my_realm','f8a74798-3b62-4eea-8669-7361969715c6',2,20,_binary '\0',NULL,NULL),('e11c057a-c02d-4743-b958-9e97efa63fc5',NULL,'idp-create-user-if-unique','my_realm','bd28bf24-c799-4fab-a9b4-6313269be9b8',2,10,_binary '\0',NULL,'6d459938-bdef-4eb1-b145-4f6e9e75d9c0'),('e8a1b0e8-3122-486e-9a2b-09656a5fa2ef',NULL,'conditional-user-configured','master','fe5da0c9-8cb7-4a0d-b75f-1e73049fbbef',0,10,_binary '\0',NULL,NULL),('eb31eb5f-9f22-4f8e-aa72-6fd63a6a64f3',NULL,'idp-email-verification','my_realm','43010548-67e5-4768-bbd8-a4679091f40f',2,10,_binary '\0',NULL,NULL),('ec0c9efe-e953-4c02-8369-a792b867e8c7',NULL,'basic-auth-otp','my_realm','afd3d35b-28d5-43c8-981f-49eb3041667b',3,20,_binary '\0',NULL,NULL),('eda0eeb6-134e-45ba-8cdf-1e527ba7c88c',NULL,'direct-grant-validate-username','master','f18dc3de-fd3b-4957-abf1-2acbb972a2c4',0,10,_binary '\0',NULL,NULL),('f0596461-1122-4d43-abae-3b6922669812',NULL,NULL,'my_realm','619121ec-e655-4cf2-895e-0b48ab9920f3',0,20,_binary '','bd28bf24-c799-4fab-a9b4-6313269be9b8',NULL),('f48ae6ac-02cf-4e94-9ecf-78f4b8bcd8a2',NULL,'idp-username-password-form','my_realm','86486652-7cf8-4f76-bf0c-6b5d6c7fd5b8',0,10,_binary '\0',NULL,NULL),('f66a0753-6f9f-468b-b4c5-a92f1df9383e',NULL,'basic-auth','master','58213540-681e-476a-ad8a-9d3d456ead47',0,10,_binary '\0',NULL,NULL),('f8253b11-f46c-4b04-89b2-df73dc28ea9d',NULL,'auth-spnego','my_realm','afd3d35b-28d5-43c8-981f-49eb3041667b',3,30,_binary '\0',NULL,NULL),('fad5f000-7ec9-4269-b444-70a1eb89fb1e',NULL,'registration-page-form','master','1b1dd3d0-ed6d-4054-97e7-f6349e35ceed',0,10,_binary '','9f03800c-c557-4bb9-a10b-90c5a632c766',NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('02ab2d80-cf0c-4cc1-8c9a-345a193ced5f','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('109b6518-fff4-414a-98fd-0c906fad040f','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('11a5c51a-0cd3-440c-adc9-4d3917ae7ae7','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','my_realm','basic-flow',_binary '\0',_binary ''),('1b1dd3d0-ed6d-4054-97e7-f6349e35ceed','registration','registration flow','master','basic-flow',_binary '',_binary ''),('1ca9fce9-6832-43ff-8e9e-68858dd30016','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','my_realm','basic-flow',_binary '\0',_binary ''),('1e6443bf-2de9-42e7-bc8a-d89c16bf7ab5','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','my_realm','basic-flow',_binary '\0',_binary ''),('2a4c5ff2-1141-4758-8f1d-85d6f96cfdaf','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','my_realm','basic-flow',_binary '\0',_binary ''),('3fc21c83-cc88-425d-be0a-ff343f10bb07','forms','Username, password, otp and other auth forms.','my_realm','basic-flow',_binary '\0',_binary ''),('43010548-67e5-4768-bbd8-a4679091f40f','Account verification options','Method with which to verity the existing account','my_realm','basic-flow',_binary '\0',_binary ''),('48f324f8-29bb-49ba-ad3d-d98a3097bbd5','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('535f2000-b8df-4e69-9b8b-ff6a9fa97681','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','my_realm','basic-flow',_binary '',_binary ''),('58213540-681e-476a-ad8a-9d3d456ead47','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('58d471ec-6420-453d-a232-a56c04f233f6','saml ecp','SAML ECP Profile Authentication Flow','my_realm','basic-flow',_binary '',_binary ''),('5be9b3f3-d4b3-45e2-834d-629d43f6c57c','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','my_realm','basic-flow',_binary '\0',_binary ''),('619121ec-e655-4cf2-895e-0b48ab9920f3','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','my_realm','basic-flow',_binary '',_binary ''),('6534c5e3-ebfb-4593-97f8-8f1ed8225ab1','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('72891068-e28a-4b1e-8163-8e0027f1e900','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('77d77a8a-082f-46c5-b06f-121b0559924d','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('82927845-0995-4ac9-a18e-bac570dde46a','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('86486652-7cf8-4f76-bf0c-6b5d6c7fd5b8','Verify Existing Account by Re-authentication','Reauthentication of existing account','my_realm','basic-flow',_binary '\0',_binary ''),('98b56f97-ef53-4152-9f49-630beb95c85e','registration','registration flow','my_realm','basic-flow',_binary '',_binary ''),('9a7a2b97-24c2-4ed8-b15c-b555eedc82f3','reset credentials','Reset credentials for a user if they forgot their password or something','my_realm','basic-flow',_binary '',_binary ''),('9e73b7b9-1e75-489d-a2e6-65c2b9be0c26','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('9f03800c-c557-4bb9-a10b-90c5a632c766','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('a57b8438-efcf-41e5-b1d7-59bacbb43c7c','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('afd3d35b-28d5-43c8-981f-49eb3041667b','Authentication Options','Authentication options.','my_realm','basic-flow',_binary '\0',_binary ''),('b611f8bd-c2b5-4a53-95e2-af52d3d50597','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('bae8eee8-9ab5-4e90-9766-4df75f806804','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('bd28bf24-c799-4fab-a9b4-6313269be9b8','User creation or linking','Flow for the existing/non-existing user alternatives','my_realm','basic-flow',_binary '\0',_binary ''),('ce25c34d-59fe-4cc8-a177-8c91e2d50e0e','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('cf2ff9c2-837b-486e-a84e-82b4f7a869f6','browser','browser based authentication','my_realm','basic-flow',_binary '',_binary ''),('d38d65a9-83f1-4abb-8f73-a0dc1b501fb9','direct grant','OpenID Connect Resource Owner Grant','my_realm','basic-flow',_binary '',_binary ''),('d4b00307-1f8d-433f-94f6-eeec51760a4e','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('d91b075d-ec7b-41b2-8ca3-c53710ee365d','docker auth','Used by Docker clients to authenticate against the IDP','my_realm','basic-flow',_binary '',_binary ''),('f18dc3de-fd3b-4957-abf1-2acbb972a2c4','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('f7dd7c28-2836-4f6f-9ea8-73da170ff635','registration form','registration form','my_realm','form-flow',_binary '\0',_binary ''),('f8a74798-3b62-4eea-8669-7361969715c6','clients','Base authentication for clients','my_realm','client-flow',_binary '',_binary ''),('fbc763d7-cd9f-48e8-b8b2-c0c4011989ef','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('fdd2fba9-4608-4c69-9b57-e24b39f9ade6','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('fe5da0c9-8cb7-4a0d-b75f-1e73049fbbef','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('0b103e47-2d23-41da-b992-ec468610f7d7','review profile config','master'),('6d459938-bdef-4eb1-b145-4f6e9e75d9c0','create unique user config','my_realm'),('d0a97095-9215-4f65-aa17-b6c103a8c896','create unique user config','master'),('ee4e33d6-5ca1-49b4-aeb3-2d909dd3c485','review profile config','my_realm');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('0b103e47-2d23-41da-b992-ec468610f7d7','missing','update.profile.on.first.login'),('6d459938-bdef-4eb1-b145-4f6e9e75d9c0','false','require.password.update.after.registration'),('d0a97095-9215-4f65-aa17-b6c103a8c896','false','require.password.update.after.registration'),('ee4e33d6-5ca1-49b4-aeb3-2d909dd3c485','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('05ec4677-8779-4ed6-a8ac-2d526f9b8b13',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('22d30a34-7627-44cc-8bd6-0ad095f469a5',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','my_realm','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('35ff55ed-6b05-4f1d-9a45-4d37686fceb0',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e',_binary '',_binary '','my_client',0,_binary '',NULL,NULL,_binary '\0','http://localhost:8081',_binary '\0','my_realm','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','http://localhost:8081',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('407df944-fb12-4eee-9717-f4d30985a2dc',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/my_realm/account/',_binary '\0',NULL,_binary '\0','my_realm','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('428a10e5-2a55-4755-98d8-33eacea29622',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4bad9f0a-5b3c-421a-bbb5-9c6e5d38babf',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','my_realm','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7db41db7-451e-4ef3-b43d-a0b36520a013',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('a2e55aff-efe4-4a48-821a-d1fc1b5c9b74',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/my_realm/account/',_binary '\0',NULL,_binary '\0','my_realm','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '',_binary '\0','my_realm-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','my_realm Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c171b309-ca29-4f16-8487-5498090c2090',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','my_realm','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('f77b567f-3e3b-4e33-96d9-2f020100279c',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/my_realm/console/',_binary '\0',NULL,_binary '\0','my_realm','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('35ff55ed-6b05-4f1d-9a45-4d37686fceb0','S256','pkce.code.challenge.method'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','backchannel.logout.revoke.offline.tokens'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','true','backchannel.logout.session.required'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','client_credentials.use_refresh_token'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','display.on.consent.screen'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','exclude.session.state.from.auth.response'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','id.token.as.detached.signature'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','oauth2.device.authorization.grant.enabled'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','oidc.ciba.grant.enabled'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','require.pushed.authorization.requests'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','saml.artifact.binding'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','saml.assertion.signature'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','saml.authnstatement'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','saml.client.signature'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','saml.encrypt'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','saml.force.post.binding'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','saml.multivalued.roles'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','saml.onetimeuse.condition'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','saml.server.signature'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','saml.server.signature.keyinfo.ext'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','saml_force_name_id_format'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','false','tls.client.certificate.bound.access.tokens'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','true','use.refresh.tokens'),('428a10e5-2a55-4755-98d8-33eacea29622','S256','pkce.code.challenge.method'),('a2e55aff-efe4-4a48-821a-d1fc1b5c9b74','S256','pkce.code.challenge.method'),('f77b567f-3e3b-4e33-96d9-2f020100279c','S256','pkce.code.challenge.method');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('1662418f-49b8-4655-8e50-f1fe7c968d15','roles','my_realm','OpenID Connect scope for add user roles to the access token','openid-connect'),('185940b2-91ae-466d-89c8-0458100832b3','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('33db900f-9b17-4c0a-86bf-24463b90645c','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('3767e133-f7db-4dfc-bdbf-7ed98049a5b2','address','my_realm','OpenID Connect built-in scope: address','openid-connect'),('7211dc2c-83c6-4716-9fa8-11160f89d4ea','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('73e048a4-a28b-4ae1-8547-e044d500c637','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('7e689b50-e700-45e4-9d55-97396bf0461b','phone','my_realm','OpenID Connect built-in scope: phone','openid-connect'),('88ff7e16-7d55-44f5-8ab1-741dd5c6625a','email','my_realm','OpenID Connect built-in scope: email','openid-connect'),('94220b17-606b-4c17-920e-4d201faa861b','role_list','my_realm','SAML role list','saml'),('9bcf60b3-c479-46dd-b56d-f2e2a75d29ad','address','master','OpenID Connect built-in scope: address','openid-connect'),('a6aa1b39-1150-4c02-8a2e-a5b4a9201d65','profile','my_realm','OpenID Connect built-in scope: profile','openid-connect'),('a9ff3d62-c055-47e0-9008-83b9bc3ba1a7','microprofile-jwt','my_realm','Microprofile - JWT built-in scope','openid-connect'),('bed01d8b-e1cd-4910-9fb4-80a5948925af','offline_access','my_realm','OpenID Connect built-in scope: offline_access','openid-connect'),('bf519f00-2ff9-430f-a751-f26fc5a664af','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('ced25b99-4df8-481b-9ad1-da5ee35acf2d','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('dd793fc3-02dd-45fc-b929-48eefbe73272','web-origins','my_realm','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('eb57ce1a-b89e-4f82-950c-47a85482a670','email','master','OpenID Connect built-in scope: email','openid-connect'),('ecce35c3-545b-4f8e-a278-8e3d78cf8f24','role_list','master','SAML role list','saml');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('1662418f-49b8-4655-8e50-f1fe7c968d15','${rolesScopeConsentText}','consent.screen.text'),('1662418f-49b8-4655-8e50-f1fe7c968d15','true','display.on.consent.screen'),('1662418f-49b8-4655-8e50-f1fe7c968d15','false','include.in.token.scope'),('185940b2-91ae-466d-89c8-0458100832b3','${profileScopeConsentText}','consent.screen.text'),('185940b2-91ae-466d-89c8-0458100832b3','true','display.on.consent.screen'),('185940b2-91ae-466d-89c8-0458100832b3','true','include.in.token.scope'),('33db900f-9b17-4c0a-86bf-24463b90645c','false','display.on.consent.screen'),('33db900f-9b17-4c0a-86bf-24463b90645c','true','include.in.token.scope'),('3767e133-f7db-4dfc-bdbf-7ed98049a5b2','${addressScopeConsentText}','consent.screen.text'),('3767e133-f7db-4dfc-bdbf-7ed98049a5b2','true','display.on.consent.screen'),('3767e133-f7db-4dfc-bdbf-7ed98049a5b2','true','include.in.token.scope'),('7211dc2c-83c6-4716-9fa8-11160f89d4ea','${rolesScopeConsentText}','consent.screen.text'),('7211dc2c-83c6-4716-9fa8-11160f89d4ea','true','display.on.consent.screen'),('7211dc2c-83c6-4716-9fa8-11160f89d4ea','false','include.in.token.scope'),('73e048a4-a28b-4ae1-8547-e044d500c637','','consent.screen.text'),('73e048a4-a28b-4ae1-8547-e044d500c637','false','display.on.consent.screen'),('73e048a4-a28b-4ae1-8547-e044d500c637','false','include.in.token.scope'),('7e689b50-e700-45e4-9d55-97396bf0461b','${phoneScopeConsentText}','consent.screen.text'),('7e689b50-e700-45e4-9d55-97396bf0461b','true','display.on.consent.screen'),('7e689b50-e700-45e4-9d55-97396bf0461b','true','include.in.token.scope'),('88ff7e16-7d55-44f5-8ab1-741dd5c6625a','${emailScopeConsentText}','consent.screen.text'),('88ff7e16-7d55-44f5-8ab1-741dd5c6625a','true','display.on.consent.screen'),('88ff7e16-7d55-44f5-8ab1-741dd5c6625a','true','include.in.token.scope'),('94220b17-606b-4c17-920e-4d201faa861b','${samlRoleListScopeConsentText}','consent.screen.text'),('94220b17-606b-4c17-920e-4d201faa861b','true','display.on.consent.screen'),('9bcf60b3-c479-46dd-b56d-f2e2a75d29ad','${addressScopeConsentText}','consent.screen.text'),('9bcf60b3-c479-46dd-b56d-f2e2a75d29ad','true','display.on.consent.screen'),('9bcf60b3-c479-46dd-b56d-f2e2a75d29ad','true','include.in.token.scope'),('a6aa1b39-1150-4c02-8a2e-a5b4a9201d65','${profileScopeConsentText}','consent.screen.text'),('a6aa1b39-1150-4c02-8a2e-a5b4a9201d65','true','display.on.consent.screen'),('a6aa1b39-1150-4c02-8a2e-a5b4a9201d65','true','include.in.token.scope'),('a9ff3d62-c055-47e0-9008-83b9bc3ba1a7','false','display.on.consent.screen'),('a9ff3d62-c055-47e0-9008-83b9bc3ba1a7','true','include.in.token.scope'),('bed01d8b-e1cd-4910-9fb4-80a5948925af','${offlineAccessScopeConsentText}','consent.screen.text'),('bed01d8b-e1cd-4910-9fb4-80a5948925af','true','display.on.consent.screen'),('bf519f00-2ff9-430f-a751-f26fc5a664af','${phoneScopeConsentText}','consent.screen.text'),('bf519f00-2ff9-430f-a751-f26fc5a664af','true','display.on.consent.screen'),('bf519f00-2ff9-430f-a751-f26fc5a664af','true','include.in.token.scope'),('ced25b99-4df8-481b-9ad1-da5ee35acf2d','${offlineAccessScopeConsentText}','consent.screen.text'),('ced25b99-4df8-481b-9ad1-da5ee35acf2d','true','display.on.consent.screen'),('dd793fc3-02dd-45fc-b929-48eefbe73272','','consent.screen.text'),('dd793fc3-02dd-45fc-b929-48eefbe73272','false','display.on.consent.screen'),('dd793fc3-02dd-45fc-b929-48eefbe73272','false','include.in.token.scope'),('eb57ce1a-b89e-4f82-950c-47a85482a670','${emailScopeConsentText}','consent.screen.text'),('eb57ce1a-b89e-4f82-950c-47a85482a670','true','display.on.consent.screen'),('eb57ce1a-b89e-4f82-950c-47a85482a670','true','include.in.token.scope'),('ecce35c3-545b-4f8e-a278-8e3d78cf8f24','${samlRoleListScopeConsentText}','consent.screen.text'),('ecce35c3-545b-4f8e-a278-8e3d78cf8f24','true','display.on.consent.screen');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('05ec4677-8779-4ed6-a8ac-2d526f9b8b13','185940b2-91ae-466d-89c8-0458100832b3',_binary ''),('05ec4677-8779-4ed6-a8ac-2d526f9b8b13','33db900f-9b17-4c0a-86bf-24463b90645c',_binary '\0'),('05ec4677-8779-4ed6-a8ac-2d526f9b8b13','7211dc2c-83c6-4716-9fa8-11160f89d4ea',_binary ''),('05ec4677-8779-4ed6-a8ac-2d526f9b8b13','73e048a4-a28b-4ae1-8547-e044d500c637',_binary ''),('05ec4677-8779-4ed6-a8ac-2d526f9b8b13','9bcf60b3-c479-46dd-b56d-f2e2a75d29ad',_binary '\0'),('05ec4677-8779-4ed6-a8ac-2d526f9b8b13','bf519f00-2ff9-430f-a751-f26fc5a664af',_binary '\0'),('05ec4677-8779-4ed6-a8ac-2d526f9b8b13','ced25b99-4df8-481b-9ad1-da5ee35acf2d',_binary '\0'),('05ec4677-8779-4ed6-a8ac-2d526f9b8b13','eb57ce1a-b89e-4f82-950c-47a85482a670',_binary ''),('22d30a34-7627-44cc-8bd6-0ad095f469a5','1662418f-49b8-4655-8e50-f1fe7c968d15',_binary ''),('22d30a34-7627-44cc-8bd6-0ad095f469a5','3767e133-f7db-4dfc-bdbf-7ed98049a5b2',_binary '\0'),('22d30a34-7627-44cc-8bd6-0ad095f469a5','7e689b50-e700-45e4-9d55-97396bf0461b',_binary '\0'),('22d30a34-7627-44cc-8bd6-0ad095f469a5','88ff7e16-7d55-44f5-8ab1-741dd5c6625a',_binary ''),('22d30a34-7627-44cc-8bd6-0ad095f469a5','a6aa1b39-1150-4c02-8a2e-a5b4a9201d65',_binary ''),('22d30a34-7627-44cc-8bd6-0ad095f469a5','a9ff3d62-c055-47e0-9008-83b9bc3ba1a7',_binary '\0'),('22d30a34-7627-44cc-8bd6-0ad095f469a5','bed01d8b-e1cd-4910-9fb4-80a5948925af',_binary '\0'),('22d30a34-7627-44cc-8bd6-0ad095f469a5','dd793fc3-02dd-45fc-b929-48eefbe73272',_binary ''),('35ff55ed-6b05-4f1d-9a45-4d37686fceb0','185940b2-91ae-466d-89c8-0458100832b3',_binary ''),('35ff55ed-6b05-4f1d-9a45-4d37686fceb0','33db900f-9b17-4c0a-86bf-24463b90645c',_binary '\0'),('35ff55ed-6b05-4f1d-9a45-4d37686fceb0','7211dc2c-83c6-4716-9fa8-11160f89d4ea',_binary ''),('35ff55ed-6b05-4f1d-9a45-4d37686fceb0','73e048a4-a28b-4ae1-8547-e044d500c637',_binary ''),('35ff55ed-6b05-4f1d-9a45-4d37686fceb0','9bcf60b3-c479-46dd-b56d-f2e2a75d29ad',_binary '\0'),('35ff55ed-6b05-4f1d-9a45-4d37686fceb0','bf519f00-2ff9-430f-a751-f26fc5a664af',_binary '\0'),('35ff55ed-6b05-4f1d-9a45-4d37686fceb0','ced25b99-4df8-481b-9ad1-da5ee35acf2d',_binary '\0'),('35ff55ed-6b05-4f1d-9a45-4d37686fceb0','eb57ce1a-b89e-4f82-950c-47a85482a670',_binary ''),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','1662418f-49b8-4655-8e50-f1fe7c968d15',_binary ''),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','3767e133-f7db-4dfc-bdbf-7ed98049a5b2',_binary '\0'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','7e689b50-e700-45e4-9d55-97396bf0461b',_binary '\0'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','88ff7e16-7d55-44f5-8ab1-741dd5c6625a',_binary ''),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','a6aa1b39-1150-4c02-8a2e-a5b4a9201d65',_binary ''),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','a9ff3d62-c055-47e0-9008-83b9bc3ba1a7',_binary '\0'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','bed01d8b-e1cd-4910-9fb4-80a5948925af',_binary '\0'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','dd793fc3-02dd-45fc-b929-48eefbe73272',_binary ''),('407df944-fb12-4eee-9717-f4d30985a2dc','1662418f-49b8-4655-8e50-f1fe7c968d15',_binary ''),('407df944-fb12-4eee-9717-f4d30985a2dc','3767e133-f7db-4dfc-bdbf-7ed98049a5b2',_binary '\0'),('407df944-fb12-4eee-9717-f4d30985a2dc','7e689b50-e700-45e4-9d55-97396bf0461b',_binary '\0'),('407df944-fb12-4eee-9717-f4d30985a2dc','88ff7e16-7d55-44f5-8ab1-741dd5c6625a',_binary ''),('407df944-fb12-4eee-9717-f4d30985a2dc','a6aa1b39-1150-4c02-8a2e-a5b4a9201d65',_binary ''),('407df944-fb12-4eee-9717-f4d30985a2dc','a9ff3d62-c055-47e0-9008-83b9bc3ba1a7',_binary '\0'),('407df944-fb12-4eee-9717-f4d30985a2dc','bed01d8b-e1cd-4910-9fb4-80a5948925af',_binary '\0'),('407df944-fb12-4eee-9717-f4d30985a2dc','dd793fc3-02dd-45fc-b929-48eefbe73272',_binary ''),('428a10e5-2a55-4755-98d8-33eacea29622','185940b2-91ae-466d-89c8-0458100832b3',_binary ''),('428a10e5-2a55-4755-98d8-33eacea29622','33db900f-9b17-4c0a-86bf-24463b90645c',_binary '\0'),('428a10e5-2a55-4755-98d8-33eacea29622','7211dc2c-83c6-4716-9fa8-11160f89d4ea',_binary ''),('428a10e5-2a55-4755-98d8-33eacea29622','73e048a4-a28b-4ae1-8547-e044d500c637',_binary ''),('428a10e5-2a55-4755-98d8-33eacea29622','9bcf60b3-c479-46dd-b56d-f2e2a75d29ad',_binary '\0'),('428a10e5-2a55-4755-98d8-33eacea29622','bf519f00-2ff9-430f-a751-f26fc5a664af',_binary '\0'),('428a10e5-2a55-4755-98d8-33eacea29622','ced25b99-4df8-481b-9ad1-da5ee35acf2d',_binary '\0'),('428a10e5-2a55-4755-98d8-33eacea29622','eb57ce1a-b89e-4f82-950c-47a85482a670',_binary ''),('4bad9f0a-5b3c-421a-bbb5-9c6e5d38babf','185940b2-91ae-466d-89c8-0458100832b3',_binary ''),('4bad9f0a-5b3c-421a-bbb5-9c6e5d38babf','33db900f-9b17-4c0a-86bf-24463b90645c',_binary '\0'),('4bad9f0a-5b3c-421a-bbb5-9c6e5d38babf','7211dc2c-83c6-4716-9fa8-11160f89d4ea',_binary ''),('4bad9f0a-5b3c-421a-bbb5-9c6e5d38babf','73e048a4-a28b-4ae1-8547-e044d500c637',_binary ''),('4bad9f0a-5b3c-421a-bbb5-9c6e5d38babf','9bcf60b3-c479-46dd-b56d-f2e2a75d29ad',_binary '\0'),('4bad9f0a-5b3c-421a-bbb5-9c6e5d38babf','bf519f00-2ff9-430f-a751-f26fc5a664af',_binary '\0'),('4bad9f0a-5b3c-421a-bbb5-9c6e5d38babf','ced25b99-4df8-481b-9ad1-da5ee35acf2d',_binary '\0'),('4bad9f0a-5b3c-421a-bbb5-9c6e5d38babf','eb57ce1a-b89e-4f82-950c-47a85482a670',_binary ''),('59d88e1f-2ab1-4ea1-b821-7194056fe51e','1662418f-49b8-4655-8e50-f1fe7c968d15',_binary ''),('59d88e1f-2ab1-4ea1-b821-7194056fe51e','3767e133-f7db-4dfc-bdbf-7ed98049a5b2',_binary '\0'),('59d88e1f-2ab1-4ea1-b821-7194056fe51e','7e689b50-e700-45e4-9d55-97396bf0461b',_binary '\0'),('59d88e1f-2ab1-4ea1-b821-7194056fe51e','88ff7e16-7d55-44f5-8ab1-741dd5c6625a',_binary ''),('59d88e1f-2ab1-4ea1-b821-7194056fe51e','a6aa1b39-1150-4c02-8a2e-a5b4a9201d65',_binary ''),('59d88e1f-2ab1-4ea1-b821-7194056fe51e','a9ff3d62-c055-47e0-9008-83b9bc3ba1a7',_binary '\0'),('59d88e1f-2ab1-4ea1-b821-7194056fe51e','bed01d8b-e1cd-4910-9fb4-80a5948925af',_binary '\0'),('59d88e1f-2ab1-4ea1-b821-7194056fe51e','dd793fc3-02dd-45fc-b929-48eefbe73272',_binary ''),('5ba90ecf-7dac-4c04-b2be-19ea7afe2eee','185940b2-91ae-466d-89c8-0458100832b3',_binary ''),('5ba90ecf-7dac-4c04-b2be-19ea7afe2eee','33db900f-9b17-4c0a-86bf-24463b90645c',_binary '\0'),('5ba90ecf-7dac-4c04-b2be-19ea7afe2eee','7211dc2c-83c6-4716-9fa8-11160f89d4ea',_binary ''),('5ba90ecf-7dac-4c04-b2be-19ea7afe2eee','73e048a4-a28b-4ae1-8547-e044d500c637',_binary ''),('5ba90ecf-7dac-4c04-b2be-19ea7afe2eee','9bcf60b3-c479-46dd-b56d-f2e2a75d29ad',_binary '\0'),('5ba90ecf-7dac-4c04-b2be-19ea7afe2eee','bf519f00-2ff9-430f-a751-f26fc5a664af',_binary '\0'),('5ba90ecf-7dac-4c04-b2be-19ea7afe2eee','ced25b99-4df8-481b-9ad1-da5ee35acf2d',_binary '\0'),('5ba90ecf-7dac-4c04-b2be-19ea7afe2eee','eb57ce1a-b89e-4f82-950c-47a85482a670',_binary ''),('7db41db7-451e-4ef3-b43d-a0b36520a013','185940b2-91ae-466d-89c8-0458100832b3',_binary ''),('7db41db7-451e-4ef3-b43d-a0b36520a013','33db900f-9b17-4c0a-86bf-24463b90645c',_binary '\0'),('7db41db7-451e-4ef3-b43d-a0b36520a013','7211dc2c-83c6-4716-9fa8-11160f89d4ea',_binary ''),('7db41db7-451e-4ef3-b43d-a0b36520a013','73e048a4-a28b-4ae1-8547-e044d500c637',_binary ''),('7db41db7-451e-4ef3-b43d-a0b36520a013','9bcf60b3-c479-46dd-b56d-f2e2a75d29ad',_binary '\0'),('7db41db7-451e-4ef3-b43d-a0b36520a013','bf519f00-2ff9-430f-a751-f26fc5a664af',_binary '\0'),('7db41db7-451e-4ef3-b43d-a0b36520a013','ced25b99-4df8-481b-9ad1-da5ee35acf2d',_binary '\0'),('7db41db7-451e-4ef3-b43d-a0b36520a013','eb57ce1a-b89e-4f82-950c-47a85482a670',_binary ''),('a2e55aff-efe4-4a48-821a-d1fc1b5c9b74','1662418f-49b8-4655-8e50-f1fe7c968d15',_binary ''),('a2e55aff-efe4-4a48-821a-d1fc1b5c9b74','3767e133-f7db-4dfc-bdbf-7ed98049a5b2',_binary '\0'),('a2e55aff-efe4-4a48-821a-d1fc1b5c9b74','7e689b50-e700-45e4-9d55-97396bf0461b',_binary '\0'),('a2e55aff-efe4-4a48-821a-d1fc1b5c9b74','88ff7e16-7d55-44f5-8ab1-741dd5c6625a',_binary ''),('a2e55aff-efe4-4a48-821a-d1fc1b5c9b74','a6aa1b39-1150-4c02-8a2e-a5b4a9201d65',_binary ''),('a2e55aff-efe4-4a48-821a-d1fc1b5c9b74','a9ff3d62-c055-47e0-9008-83b9bc3ba1a7',_binary '\0'),('a2e55aff-efe4-4a48-821a-d1fc1b5c9b74','bed01d8b-e1cd-4910-9fb4-80a5948925af',_binary '\0'),('a2e55aff-efe4-4a48-821a-d1fc1b5c9b74','dd793fc3-02dd-45fc-b929-48eefbe73272',_binary ''),('c171b309-ca29-4f16-8487-5498090c2090','1662418f-49b8-4655-8e50-f1fe7c968d15',_binary ''),('c171b309-ca29-4f16-8487-5498090c2090','3767e133-f7db-4dfc-bdbf-7ed98049a5b2',_binary '\0'),('c171b309-ca29-4f16-8487-5498090c2090','7e689b50-e700-45e4-9d55-97396bf0461b',_binary '\0'),('c171b309-ca29-4f16-8487-5498090c2090','88ff7e16-7d55-44f5-8ab1-741dd5c6625a',_binary ''),('c171b309-ca29-4f16-8487-5498090c2090','a6aa1b39-1150-4c02-8a2e-a5b4a9201d65',_binary ''),('c171b309-ca29-4f16-8487-5498090c2090','a9ff3d62-c055-47e0-9008-83b9bc3ba1a7',_binary '\0'),('c171b309-ca29-4f16-8487-5498090c2090','bed01d8b-e1cd-4910-9fb4-80a5948925af',_binary '\0'),('c171b309-ca29-4f16-8487-5498090c2090','dd793fc3-02dd-45fc-b929-48eefbe73272',_binary ''),('f77b567f-3e3b-4e33-96d9-2f020100279c','1662418f-49b8-4655-8e50-f1fe7c968d15',_binary ''),('f77b567f-3e3b-4e33-96d9-2f020100279c','3767e133-f7db-4dfc-bdbf-7ed98049a5b2',_binary '\0'),('f77b567f-3e3b-4e33-96d9-2f020100279c','7e689b50-e700-45e4-9d55-97396bf0461b',_binary '\0'),('f77b567f-3e3b-4e33-96d9-2f020100279c','88ff7e16-7d55-44f5-8ab1-741dd5c6625a',_binary ''),('f77b567f-3e3b-4e33-96d9-2f020100279c','a6aa1b39-1150-4c02-8a2e-a5b4a9201d65',_binary ''),('f77b567f-3e3b-4e33-96d9-2f020100279c','a9ff3d62-c055-47e0-9008-83b9bc3ba1a7',_binary '\0'),('f77b567f-3e3b-4e33-96d9-2f020100279c','bed01d8b-e1cd-4910-9fb4-80a5948925af',_binary '\0'),('f77b567f-3e3b-4e33-96d9-2f020100279c','dd793fc3-02dd-45fc-b929-48eefbe73272',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('bed01d8b-e1cd-4910-9fb4-80a5948925af','2fdf17f8-d882-475a-8aac-32715bfe4424'),('ced25b99-4df8-481b-9ad1-da5ee35acf2d','28ac635f-879d-40f3-bf6f-a7fc1b312a02');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('018c0017-cd60-4ec2-aaf4-a7bc0c677af2','Allowed Client Scopes','my_realm','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','my_realm','anonymous'),('052e2dde-443c-4636-9ded-03a54d0e4272','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('0f5faea8-68c9-4663-a76c-a10cafa3e195','Allowed Client Scopes','my_realm','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','my_realm','authenticated'),('1865d0c5-2815-4b4f-8e24-cd24096933c4','Allowed Protocol Mapper Types','my_realm','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','my_realm','authenticated'),('2ebbf726-e7f8-49dd-8d74-f9d7d2cb523f','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('3e70fa7e-9943-4a33-ac51-d6e5f98da230','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('4a13b4f2-4cd4-456b-9359-0b001ea44282','Max Clients Limit','my_realm','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','my_realm','anonymous'),('4da5a8ee-1ffa-4c3f-a6d0-f2fa1d9a783f','Allowed Protocol Mapper Types','my_realm','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','my_realm','anonymous'),('5133de00-e1cf-4842-b858-af1897808cd2','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL),('58604501-034c-4a09-bf5c-fbd3950a8b7e','rsa-generated','my_realm','rsa-generated','org.keycloak.keys.KeyProvider','my_realm',NULL),('66bcb1e4-f360-4fc5-837f-63fda6193f1a','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('7199e0c2-e94e-41b5-902b-05a587fc9e3b','aes-generated','my_realm','aes-generated','org.keycloak.keys.KeyProvider','my_realm',NULL),('72bcc074-73ee-4ae1-88e5-51c8389c9015','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('9291b3de-e415-40ca-a1e9-61cb94f60a7c','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('9cfdbc6c-7cbe-41c2-a22d-cde924410ef9','Trusted Hosts','my_realm','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','my_realm','anonymous'),('9eb93b0e-8586-458d-ad2c-a6ee43bd2234','Full Scope Disabled','my_realm','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','my_realm','anonymous'),('a7777171-d9d7-456e-a548-3948aa455d93','hmac-generated','my_realm','hmac-generated','org.keycloak.keys.KeyProvider','my_realm',NULL),('aa7e2c88-1acd-441e-aa12-d3954021f40f','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('ca81c993-efaf-4790-8056-86f8a544fdff','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('db30bcc4-5bba-4198-889e-d519cc5563ab','rsa-enc-generated','my_realm','rsa-enc-generated','org.keycloak.keys.KeyProvider','my_realm',NULL),('e43a4c96-2307-4186-bf73-07559fa86164','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('e7ed28ac-5e27-4d99-ab94-22e7579294a8','Consent Required','my_realm','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','my_realm','anonymous'),('f0987a5a-716a-4fd7-a706-bdc1eeb49722','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('f9e923b1-cb08-429d-b445-34ce75824319','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('0751a936-c291-494f-b22f-757338e4515c','e43a4c96-2307-4186-bf73-07559fa86164','allow-default-scopes','true'),('0b28afa0-92c9-48c5-9f9c-f502ec6f1f74','f0987a5a-716a-4fd7-a706-bdc1eeb49722','allowed-protocol-mapper-types','oidc-address-mapper'),('0bfb7dda-6ee7-461a-b892-3a94aa1d953b','66bcb1e4-f360-4fc5-837f-63fda6193f1a','kid','8b69148d-6c85-478a-9436-f0b59cad2198'),('0ce68322-dcbc-40ed-98b0-9e70831fe5d4','a7777171-d9d7-456e-a548-3948aa455d93','kid','ba82c630-7d09-461b-a6d0-99b032cecc3e'),('148c391d-2b23-401b-892d-4f3d17f37b3a','7199e0c2-e94e-41b5-902b-05a587fc9e3b','secret','XTgu766v7mY6P57pEXGKAw'),('18505406-5c0c-4dd4-9a60-b96ee71afc3d','5133de00-e1cf-4842-b858-af1897808cd2','priority','100'),('21dc171b-5212-4ca9-82fa-d0817b7db032','1865d0c5-2815-4b4f-8e24-cd24096933c4','allowed-protocol-mapper-types','oidc-address-mapper'),('250be1d1-a34b-4073-b738-ec7c09fbc5c9','db30bcc4-5bba-4198-889e-d519cc5563ab','privateKey','MIIEpAIBAAKCAQEAsFRLMf2DhIjG/aYscB5Srtt6TtAGOqeZ5iefJoL/ICmXb4rNXMnCSJEvejl0d1WG+FoteGcdIV4kzH6OzsJs/cFiJV+exAMQT9F0OgNbnePGCF/1rvWGCL7kYNCUyskTS8lvl8llh3zPFGAjomKyVpffwXRhhIDAHDzD+K/kgK/nM62Nk1GsWPj8NGf34kZvqxl/pnYcyN47SH1tjl8qW8cpYwaj4r+hFWhRdKbmJEb3AB7Oi6HQorEhoG6N3QsPIoafNobsjmhMc02ZUYf3ogb68KqtOJ/KALQMLYSq6XhEWHe6u1rCm7fcwdRkef50eCMW4sm5S0cTsFI8oEgRcwIDAQABAoIBAFtQW9yYj8pL1tk2fB7X5TO+X1l/Kyqm7vEcpbOY9Swfvde6xtz9cwqHfVHLfT/rX8kvUgrfQ1urWF06URRL5YuH4R6/pQWXHJRpQMpmQMTEVyKxJxci+PWAfd6RRey6Mq71sz+kwVpnzQmdO/b1K6viXLLfZTzsPBCje01HMYteLUDiCbCf1wocSGUPIAZnTYwwW4m2P+A92mmwAdn6wsqRRc3db2Lx8BVd6n8HVVnu57SPU05T06bhsHX+61ALNEpKjY0xAL+1TujUPjACTMqr//bjRVMtqGUDqH6Pl2Z7O66jUuDtFUyF5pYSvp1wFNwbAsb2cy1innoi6yh6m5ECgYEA/isWB7hjrjsLPJg1N44UKRYLtVVwmDAyLeHfiH4D7s/JMltjbsS0TpAbSrvPnxxeNS7zZ0X4oEWjuXXaWIQ4g5Sv6ho0eMKjTZ7oERM/2Sw+X0a4rpDBFMdxgkJ11Xv3KjBxV/pmmxDeGdwPw18sy0x8ir3A3mcQyxx2ZQPASzkCgYEAsZmaUSXMA6ODBu8ED1CLCpy0AEsUTiPhERfCeVfb3yiLnmBmrlZP6P4b0x0Wg7/lEFP8kf2MoakknSxH4QZQVhfttvIMF5nKHrZxQugZkq6XU0CfEtRpQosQEKf6Vv4Lg5PYABM1t05sLyOUfCxSJxNwTpgtCZk+h2tw0CvNhgsCgYEAlt4SXJDJsmDfwZ8Db6+JLf4lAwTtKZjqICwD2Gwcf4OdBKQUeGqQMFX/rTOgAO0AyobM+g8hjljn3y0iZwpM1WXLqaTWYpv9/RQG4iPP8WP+veUnuI653VCpgs1aTlcgFk3c6YD7qK2xeB4UyT5UQ3RqNJx/wEPjRvzlFf7NBJkCgYEAggDDUmVNithVYGzz1tYJgZIlvRU4Xt6qsJ1o0PQ8UYVXdm5wm2s5AX+JFKd1RKniXmpsNt2X5Ppwf9DbKOA7TFolu0ZBDcGYj5TTIbvOhG3i/aEPEHSGPJyY/OhJOwapnP5LHfrx1iXE0VjFJ4Q1+r6i9hU02pLfj7dZFDkML/MCgYAw/E1E2ip18AouWiPIAk6yNrHJyE0XVkoniJ6sRRZsve6oEOhX9025hxdkfh5Eu6KCt+4lEsozNxrIX1+8RhNtRdjb7LRxP1lqT+ullcA4v/FzeDL43g6nLOpPSGNK2LC/iOCY78GqxAzX2tYBCIBomgY3cZHITw3JArKP5fIjrA=='),('25f94811-96b1-43bb-8484-206ea29b192e','a7777171-d9d7-456e-a548-3948aa455d93','secret','hpC7oI7pKtckRZbbYpXGdUBiC0iA3n0PMJ3rC_Usdkj8zh8id2W93_jLef-bc-Nh1ErMo9AI2XDEk52E3ShriA'),('25fde3b8-c982-4bb0-a488-f584944afbfa','3e70fa7e-9943-4a33-ac51-d6e5f98da230','secret','J8yC3QeAcnpIXwY15oN-HYUs2nzZGJSgjX0JBq6w73RdD8gim5XmXx7fFnEql6_EP6k722wfxQqwjkRgFltFVA'),('2714d686-28ef-4bac-9319-4df6a425de9e','f0987a5a-716a-4fd7-a706-bdc1eeb49722','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('292669c0-740d-414c-8f90-4c6ebca05cab','052e2dde-443c-4636-9ded-03a54d0e4272','host-sending-registration-request-must-match','true'),('3c60d0ab-c507-48e9-afa4-87b80b2de5ac','66bcb1e4-f360-4fc5-837f-63fda6193f1a','secret','qcD_mfHybCjm1lW3NkxeFw'),('3e9da701-1bfa-443f-8728-159cfadf7fba','4da5a8ee-1ffa-4c3f-a6d0-f2fa1d9a783f','allowed-protocol-mapper-types','saml-user-property-mapper'),('3eed4636-32da-41c0-8dd6-dadbdd89ba2e','ca81c993-efaf-4790-8056-86f8a544fdff','allowed-protocol-mapper-types','saml-user-property-mapper'),('40bffc99-ea9f-441f-b9a0-ad4c2f477193','1865d0c5-2815-4b4f-8e24-cd24096933c4','allowed-protocol-mapper-types','saml-user-property-mapper'),('41201714-4017-45f7-9d5b-4f9b75c62953','2ebbf726-e7f8-49dd-8d74-f9d7d2cb523f','certificate','MIICmzCCAYMCBgGEVg03JzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIxMTA4MDcwMTU3WhcNMzIxMTA4MDcwMzM3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCkhQWaZxuGxtoKDfcgLnHK2xYtwKs8HuP6/fs64ukw9THlDtIWHKi2e+bUa8hGcjkKpHbB3kDdNcu5FRJDsarsOKS/tAUYcgIDGCdMhJe+S4/1KSd+2D4HJumv/cJYRTRZNGTMyfDG7LlplCQayb/SE7BqCnQbzGN8TBKWoD6c4jIaUUnGnuB7sErVJ/GzUZ3meY0y13woCApbe+y4HdOHHicg5AAus6oaqj/LLfQC4Hkd9/Hxz5nKaa/ObjDCNopTwT6Jyo2VT3gB4FCDqzPsCvZ+I93MBx1OfoEagdeqpqZUzFZc9dc4cDoPGMHdYqca+dYOw4LSmImqsqESe3XPAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAon/aVUQWw3Z6F11oawXY1FS0HIMNjrJqmhGdrVFPZghwRKRjNQcZmyaHlcfU3yaKdzt2Satley7TR3C+9hlFMCDg+ClUDpfLf1zM98M/SveLChbTfNl+lSei4Zod8AiS5XaTBCAJIM+MIJI1NC98+YWwrx/7zyiNUoUWHwk7/rNjttFvwTb+y1ubIyXhcl7OS8q80KuSr6V8ENzv6ofZm4/UXpqP6WAGVHbtpoNXudp1RtROM/hIh2zD4Tw2CC8vWa77z0gB3ECGGY4opDghzkWNo8TExmz/5FCMnco/L7iWsMKk4RqXwj9E6528fgfhzywhEC8W6IMs1OdtPasss='),('46923913-8880-4762-870c-28d0a085b4a9','4da5a8ee-1ffa-4c3f-a6d0-f2fa1d9a783f','allowed-protocol-mapper-types','oidc-address-mapper'),('4aa99364-dcaf-4653-bb86-eddcb81ea0fd','a7777171-d9d7-456e-a548-3948aa455d93','priority','100'),('4e119712-a118-4b12-9469-5e7aa22da6e7','052e2dde-443c-4636-9ded-03a54d0e4272','client-uris-must-match','true'),('52c3e20a-2413-40c9-89cf-f9c01a7e557e','1865d0c5-2815-4b4f-8e24-cd24096933c4','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('56ebf6f0-60c8-4da1-b2c6-35e1244721da','ca81c993-efaf-4790-8056-86f8a544fdff','allowed-protocol-mapper-types','oidc-full-name-mapper'),('56fe848b-b7df-46c1-8deb-50ed53974824','4da5a8ee-1ffa-4c3f-a6d0-f2fa1d9a783f','allowed-protocol-mapper-types','saml-role-list-mapper'),('689b8612-13af-4b20-a4f7-ae2d046eef5d','7199e0c2-e94e-41b5-902b-05a587fc9e3b','kid','c9f4a3ca-c616-4cfe-9cd5-067e0e203a6b'),('6a652db4-46d8-4b88-9713-1b9d28bfd3df','58604501-034c-4a09-bf5c-fbd3950a8b7e','privateKey','MIIEowIBAAKCAQEAlugYK94RvED5eyanfeMS/QaSXlS8lQjhy7pdI+JPWUs9ywKcZKNaaQ5wXfHYLqNeZu2Zdj8y/VfVazRcHBLYbsBbn1HefrToD/ARB5FHmCXTzIPvgVMHfs82Sm2/FIgKg4SRApYMxZYl57AiXNhjexybMAJCzv59jxulZ9nOlxeOrOAz5al3XuHJQ3zSudwJe96LXi4AFME5cWdaYwbY3nFgz1OedDmGUJjWJKcYPclRgzfhp4Qa0TxpYm/4psRVJHVBgl009JTeiaakgOrSuQA6Vfgu/5ymx07Le/aAhTI80t5IbyZUgZm7icxKuFw0GRIdGeTmYDaQv5Ytb3SbuwIDAQABAoIBADI8d3d7CNprouHNX2q4AiU7X9SJTvIqL8i7dLAycYnfU2XWq6uQ+dMJXHzZusbj2dRX+oNzzIysBb8XgiZSW7yayqWCApiZrrtHhtPHGFddGGH39e5ObqtXXdJvMHIsS5u2sPN0cjIApwO3Delsm8lrH3pe9lCkRbYzVN/6kRyY1K0Z68CrBRtcEwvisi4sG8wVOuTfYPJHiLbfm12e2EqoLMorc7ac3+489n0jc3L7oi7Dvdg2kOiEU2VI3yRFTU/6RYTmzao0fzyF3k8Qp39duKjZOl3RNv1nR2/U4br3o/O0VSl3Y1kQ6xgcGU5RZ1X9DLlqRlKMPOArh7irXBkCgYEA7rsAeKA8tTUJeEnSnq/EgzD9tgostaFSVKaL1Aj9emrl1EsbWIs15D+F0LImM+6il+j80bOJyYh1nIJ4SsMYxiau7/vaGsa7DuFl82vBLOK6uScuv/k93nGa/PPeB3lnpGIrtUm3OZf8aMVHWVMiB1Ig7SWTdI1Yhg8844DIQu8CgYEAodKzlw2h6n0Yagobb3A1kFulUaL4sSON7h27E9xXAH3XkWrQHK0g/C6oKclD4UnYtzQ9bOj6bvVhaHjMn1BnVJaLSm+jikAJXR8p3AGdRInnfeP77yXGd1b0anaJr/N5aLnR//ssbFRI8UUQC1WW2pZ58DjDLF9XAJTE6f44Q/UCgYANUkAHeyGIFwqNPMlU84fqriwqIU03YWYftR9uWIYUc6yZeQtwmGwMbYMBDz/UfAd0pJqe9P7GUSgG8LzXpyVVwUjXuV0FS3uaq/ctayDfaVN0C3yvV7AdHofAf7cvAZZH9PZtakygGRwLmJ6PnHT0pZ+SvBsLUOvUpzsFkuUZ3wKBgHoSVgOW9xPKtkYXxcZ04RM67yT8SZpm9cQwjVVYHBF03M8HwmI/f+h80cJj317ttBvPvp6PyYs2c/q5VbLAlpJK1lyahsXdtLKYtZ0PYrG3Tfe7qesnleWkpNBDB27Bvk5wDqiJs2Ms2bGXpZjHQfs3FFlQmHq6mQkJMNpLOeqZAoGBAM61sHDcz5WCxN83UuSME+vDc6J0uYw28+fQKNJHNd68+t2LcsfNab4PseXa274MvkJ1lcTaK2ue4ZoYjHlvTdhfZ6Fl0g8alDRpXt7xkUpkifwEwyJl6GfAqqG4b0C8b70hr/6sw9yY5+uCAdtm227KRiMrfCCTzFesc0PZ+tsO'),('6ab556f3-81e4-4cc1-b4ab-f84de847a00c','3e70fa7e-9943-4a33-ac51-d6e5f98da230','kid','61a49ec8-d7d4-4b46-9de1-9da8f3e1af92'),('6bf9b365-0da6-466c-b1e0-0962958842c3','f0987a5a-716a-4fd7-a706-bdc1eeb49722','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('6db9d9e9-a0c5-4b75-b88a-fb4da3138963','3e70fa7e-9943-4a33-ac51-d6e5f98da230','algorithm','HS256'),('6f0af34d-6738-4570-92b2-7706a7d84075','ca81c993-efaf-4790-8056-86f8a544fdff','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('7be7b9ef-2084-4a2e-98a3-7a3f756680dd','ca81c993-efaf-4790-8056-86f8a544fdff','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('7c80f4f0-5af7-4e1d-9788-1bc0516f8ef5','58604501-034c-4a09-bf5c-fbd3950a8b7e','keyUse','SIG'),('7e4c8f3d-0c15-45a0-bf26-20092beb985e','1865d0c5-2815-4b4f-8e24-cd24096933c4','allowed-protocol-mapper-types','oidc-full-name-mapper'),('827b1a91-e7df-47e2-a6c3-0f083f013e6d','1865d0c5-2815-4b4f-8e24-cd24096933c4','allowed-protocol-mapper-types','saml-role-list-mapper'),('829b5f02-acc1-41f5-a832-1c6162e85a6a','9cfdbc6c-7cbe-41c2-a22d-cde924410ef9','host-sending-registration-request-must-match','true'),('83bef136-41f4-4563-931f-3ac894384579','f0987a5a-716a-4fd7-a706-bdc1eeb49722','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('89e98141-16a8-4cf6-a1df-b6ab672defa8','4da5a8ee-1ffa-4c3f-a6d0-f2fa1d9a783f','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('8d576933-9e4a-4256-8d6d-a7d6a37a78e8','4da5a8ee-1ffa-4c3f-a6d0-f2fa1d9a783f','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('95101c5f-912d-42b5-b714-7971d7d5b9f1','9291b3de-e415-40ca-a1e9-61cb94f60a7c','max-clients','200'),('9adcfd56-2df3-45bc-bb95-b28e32c7b5dc','4da5a8ee-1ffa-4c3f-a6d0-f2fa1d9a783f','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('9ddae668-f1d7-4b74-abf2-daf53960df5e','2ebbf726-e7f8-49dd-8d74-f9d7d2cb523f','keyUse','SIG'),('a5c0939e-a28a-4df5-b3f0-7469969d0a99','1865d0c5-2815-4b4f-8e24-cd24096933c4','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('aaafba15-ad85-4e13-8f07-5f9651ef165a','1865d0c5-2815-4b4f-8e24-cd24096933c4','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('ab8bd25f-1952-477b-8fa2-5bd9bdb0f42f','ca81c993-efaf-4790-8056-86f8a544fdff','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('b051c13e-75cf-4ce3-9669-c2148e218202','5133de00-e1cf-4842-b858-af1897808cd2','algorithm','RSA-OAEP'),('b4bed730-4360-42fe-82a2-4461f9edb1b0','5133de00-e1cf-4842-b858-af1897808cd2','keyUse','ENC'),('b99a8aa3-6bcf-46fa-8324-9f0b5c961ec1','2ebbf726-e7f8-49dd-8d74-f9d7d2cb523f','privateKey','MIIEpQIBAAKCAQEApIUFmmcbhsbaCg33IC5xytsWLcCrPB7j+v37OuLpMPUx5Q7SFhyotnvm1GvIRnI5CqR2wd5A3TXLuRUSQ7Gq7Dikv7QFGHICAxgnTISXvkuP9Sknftg+Bybpr/3CWEU0WTRkzMnwxuy5aZQkGsm/0hOwagp0G8xjfEwSlqA+nOIyGlFJxp7ge7BK1Sfxs1Gd5nmNMtd8KAgKW3vsuB3Thx4nIOQALrOqGqo/yy30AuB5Hffx8c+Zymmvzm4wwjaKU8E+icqNlU94AeBQg6sz7Ar2fiPdzAcdTn6BGoHXqqamVMxWXPXXOHA6DxjB3WKnGvnWDsOC0piJqrKhEnt1zwIDAQABAoIBAQCixHSpsQ8bxcrcnbp8nVa5sw37UB5ZydoWbYdMWEkLxdqKW6JgfBQzDtxuFwC7KbDjpZlU7xXPhbS7tWwviyymrtfYTjuoVstE0nW3D4utmsafcAsCROEBZG9ZTj8j47wJ8Xs03SoZNQWvvgAGfMoKBq7ICvWatxlKVV0ipwGrZcnI8xFukUqanpQqbrNbzvtfq73dvo6ydw32fduoyy0cQltXYA/FG6fz8+AX7Vk67tCp+JnBYdus/Pa/KECS8MaD/6FCrCmyvhfCxevZAbND2GRyrMo6PbJG+Rx2e2RfkfDgueFn6vFG84HwZtyxONRC/k27lxWtLfPtG0xZpyShAoGBAOen3j7l8eQbi+NCBmOdWs9GN5MYqUjqkTHwBEKNCL03VFde6csMSTDfW2Vz2Qv6QlBTOROt8CvXbul/q7H1CKD7Cw3xzXAmFCIlWILVF4WHWoNFcLyKH72pI3OkuBlzNlI1cPQY7hjoUk/ah7O6sZkbHsKhHtTBMbXeg2m0s7mfAoGBALXPBTqCunnvFWbxZlmZjb1hp2m9pdeKx5jZ2F1MIz/3xLI62ecImsWr0VmX/oSrzmuX1f6AqVKTm3gWrMv+JuXLQ+9BzAVl4hdgioqDxpnB9bySVvNh+MJ2u7o8mzOlMdeLghWAOkq+kdr7NRWjB/UfTSA4lGNx9xuEZIcOzTXRAoGBAJ9IN3I8HXRg1HCwR0BbQ8NdXn0P6eYvEyKpC+TOoIGp954TruFkUzb9fRRm8YhgzRP6BTbY1FjwylxW4rF78DDwLIusBTvlktZfo1piNsgjZ0L3jiq1NlnsYGn1inhFVcZ05HOSaLRLmb06XzBfYBoMIbxlmJNlO0737pfSHfm1AoGAN/n/cB5j77ru6f0VOC0Q+OgiNWpQr2ZpQeSAu2j/yWgtxXpdMMbzcD0QffdQQ+Tp7zKWjn9qoqQT0AubNEuSClplFjs558eQrwXoYfFkql6PnHmqD9FwV99auWKDnokUKXsomBoc2HqISdXiaEED6DK0+mCxP1UNcgl3MiYahKECgYEAiVpUNgYYFq2VACfHK7Ti+hrsmo5ivXI5q8sew+kD9q3dM7Hirw8yusX0mNULX0prnD6P9C88C9ajP6zqnZ/qhGwgWWsPjLj8HUEJ8trEKTG1WjTilFYsZYc4W8kyaP00QJYqNvrFuYs9VxBd5SuQUuYdxwMvZpYzt7oaPKiAAls='),('bc37cd92-e392-41cf-992c-48616ff64146','9cfdbc6c-7cbe-41c2-a22d-cde924410ef9','client-uris-must-match','true'),('c02afe87-0fd0-44d4-a459-85c38ea1101a','ca81c993-efaf-4790-8056-86f8a544fdff','allowed-protocol-mapper-types','oidc-address-mapper'),('c0612628-4e9c-4b7d-bcc2-ff63bf33e28a','db30bcc4-5bba-4198-889e-d519cc5563ab','algorithm','RSA-OAEP'),('c0a3932f-565d-4ef4-9175-1eeb1d03f7fd','4a13b4f2-4cd4-456b-9359-0b001ea44282','max-clients','200'),('c0b8690f-75de-41b1-8b7f-ceef97b27fd9','3e70fa7e-9943-4a33-ac51-d6e5f98da230','priority','100'),('c3dc290c-175e-4622-9f84-d1ee2ba64afb','ca81c993-efaf-4790-8056-86f8a544fdff','allowed-protocol-mapper-types','saml-role-list-mapper'),('c67636f0-87a8-42d2-9a5d-77c38bc109ff','1865d0c5-2815-4b4f-8e24-cd24096933c4','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('c9bbe87c-814a-48d9-9f61-628e67ea2896','58604501-034c-4a09-bf5c-fbd3950a8b7e','certificate','MIICnzCCAYcCBgGEVg2ifjANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhteV9yZWFsbTAeFw0yMjExMDgwNzAyMjRaFw0zMjExMDgwNzA0MDRaMBMxETAPBgNVBAMMCG15X3JlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlugYK94RvED5eyanfeMS/QaSXlS8lQjhy7pdI+JPWUs9ywKcZKNaaQ5wXfHYLqNeZu2Zdj8y/VfVazRcHBLYbsBbn1HefrToD/ARB5FHmCXTzIPvgVMHfs82Sm2/FIgKg4SRApYMxZYl57AiXNhjexybMAJCzv59jxulZ9nOlxeOrOAz5al3XuHJQ3zSudwJe96LXi4AFME5cWdaYwbY3nFgz1OedDmGUJjWJKcYPclRgzfhp4Qa0TxpYm/4psRVJHVBgl009JTeiaakgOrSuQA6Vfgu/5ymx07Le/aAhTI80t5IbyZUgZm7icxKuFw0GRIdGeTmYDaQv5Ytb3SbuwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBOhwRmdkqj95jJO2+nXuxpa1jQApgclpVf9MtNfSOdF/iKfMGKlZcjNQf+jHCgge2qdihyE4VUUgastw+jXBcy2rtwV+LL0qq/BkypVDMxYWtZmXIfVMMQjCogx44CeVT64rHtN1Zzm9lD0Q/A5Uif5RHVB0u0CNcrYTlrSHkqIx10vI3/v/imyJaQoRb4SyJ939xuaBIjKkfqzNee5Jz8AGv8/p0n5DQzm78o4V+LOJnRvACKjjnhFVWho4049BTvoCbwJUSrAjp8l96PGr2eIoxeXzgVa2EHDt5q9yLvyclnq0NOQZcTt/ZxVMAWi8mdFbh1N8sikEXJ6kSl8olS'),('ca505a79-ce14-45b3-a6e3-a918cddb3a1c','db30bcc4-5bba-4198-889e-d519cc5563ab','certificate','MIICnzCCAYcCBgGEVg2lMjANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhteV9yZWFsbTAeFw0yMjExMDgwNzAyMjVaFw0zMjExMDgwNzA0MDVaMBMxETAPBgNVBAMMCG15X3JlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsFRLMf2DhIjG/aYscB5Srtt6TtAGOqeZ5iefJoL/ICmXb4rNXMnCSJEvejl0d1WG+FoteGcdIV4kzH6OzsJs/cFiJV+exAMQT9F0OgNbnePGCF/1rvWGCL7kYNCUyskTS8lvl8llh3zPFGAjomKyVpffwXRhhIDAHDzD+K/kgK/nM62Nk1GsWPj8NGf34kZvqxl/pnYcyN47SH1tjl8qW8cpYwaj4r+hFWhRdKbmJEb3AB7Oi6HQorEhoG6N3QsPIoafNobsjmhMc02ZUYf3ogb68KqtOJ/KALQMLYSq6XhEWHe6u1rCm7fcwdRkef50eCMW4sm5S0cTsFI8oEgRcwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQCVKV3JGgYoX1xODWg+ZxYanyTan+dn4+PBZPtS5XcgH3YZb3wGvh0XWq/kMhzG26Mn5eQbQ4XcnVuoYHoNqD6LgDQIWM3ydkCbJONxkg62Ji1jDnmBDNw65CylQAmbJuYwLRwcXJ9ZUzdDeXuliIzqVpM4Rnt8nKGb4C71eOokWgfqNglUbtyveEvSx+2hJsizTTH5tox78PH1dQqM5it38FM7rKaq6Fndb7Ly7P3lLN2Z/CZULzM6vzJNcyN3tkgLFaKly2wXqz/ml1yk0Z8aM6hkPfqmDJ6j89L/TMUJdAaKn4uFzesLfSswqmtqsXxtrSnsmrY++wtf1cw3pLtA'),('cbb6ee7c-65cb-412c-bd82-0dc2658fc504','f0987a5a-716a-4fd7-a706-bdc1eeb49722','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('d17ffd02-028a-4856-8d84-076b20273a94','4da5a8ee-1ffa-4c3f-a6d0-f2fa1d9a783f','allowed-protocol-mapper-types','oidc-full-name-mapper'),('d33557a5-8653-454a-82d1-34fc09e0c432','58604501-034c-4a09-bf5c-fbd3950a8b7e','priority','100'),('d7e2b431-a2ec-4c89-bc4d-2aaa0fd0efa6','0f5faea8-68c9-4663-a76c-a10cafa3e195','allow-default-scopes','true'),('d82717eb-1313-4661-ad31-23edc3db41a1','66bcb1e4-f360-4fc5-837f-63fda6193f1a','priority','100'),('dce7b48b-0d97-4f8f-8667-f1dc73d2e065','018c0017-cd60-4ec2-aaf4-a7bc0c677af2','allow-default-scopes','true'),('dff7b909-031a-4de2-988e-80a2be4917af','db30bcc4-5bba-4198-889e-d519cc5563ab','keyUse','ENC'),('e0907bee-1eed-4810-9a44-d813cb36074c','5133de00-e1cf-4842-b858-af1897808cd2','privateKey','MIIEpQIBAAKCAQEA70e9W1mGaaq5YlOFtJ1hpPqUyar2yzHTqUHysoD3o8eNtJygf3kMIHEC72jvnzfRvSknjCKJC+QBJc+mUMMVtXtJxtlPAAN/xXZja3gAc3YnvECTIrrlvmX/UsMaDF95E19ggxnbZyNLmhOXze1lQLWWEbblR2cnYk5PNQTRVP5AvzCe/9jwAZzvrwbzmOoyJIhJ/ntVPJU8JptHmcJR7MSJqn6r82bUZOA6ITZnNps7rrzrfdDywYfFGCEYOKQG4OsKT+hJcZffYRVuPqbx+Av94AUUZ9Q4b2H6ftmkRITysnPbKRcZ4+IeId2h7Ok56lzQUifvVvmaLAj7qWvVkwIDAQABAoIBAGRuFPEpgzwIlyTI756eS+SF9Dss0cb5U+B/uJDphocsc7Kx5r96G/fl1xiLT7/hGtwtUNcFi8X83epz3Febehog9BdNEFZuIYvMo+/wfyf3GLhv1hHGpjUi9GZVUzKMQ/I4nvaHvMnuS4YQ4S9ii5P8Y09uF4+/oQ0m1yHmssHb4Y2v+8vkv8r3Se3zhtoMQkMyBxPGLEU4M/uooMlD9QxR7Rn+6zdv3JH9KsG+o0MpGLpm/NgZ2iM0A7a/OBUAnnCllk3VWbRXmAUc5tilk/KbO66/E1MUnzG3GKmB1xoQWUgtpymkzkVt1iSt+aNuA9P2zYwUMvnVrJi2drRQLSkCgYEA/2dQBTvp4DLykLWmm6QvfibZkXcDKuCxRWIcaPjzDueW9Y5wnS/YsHjYxEEbF2J1L2XNItBNHwn51xkA9CwQYjvPwHCoIeFILrOalA13Y3M+HgOjV4iGLZwrB46imuF6MeONv24s6evbuFtXzytnCWfp2B5zsHr1DrWLDjdRLnUCgYEA79bJwegJ8UZLGVuMd/TZaZH2u9NapOWbYQFMzf0dtuxuhFXeOnvKVgykcHWwoPnUBQL/0SyLk8njIiwbBhHzEfWQHcXddggTo8pjJgJGpCL2AJojh+8nmlwHsfsqERWdfTChHUp4pWrg1I7SJ28ZyyjY8EOyBU5ttOuzQEvWAucCgYEAk1JZoxtDNbLNnlFZsE+NoZvxReo7ZoFDX/1O2/I16bQGrNAj/1d5C5o5l0LiyKNfax6yrFExGyVa+wsONMoyDSfpF10kbp6PT3kEQkBeTHxOKWv5zWUP2MFLRMmu294R6TMUMYbw22HUVMxDo1mqzo8lISe3neXe80Qe2O1po30CgYEA4iugs3UH+zkYlN8aRfzmEYIONO2I6zuDHSVGsnHhVaD8T1tSZ8BY/HCLmWnCmOs/H0LGzxC8xy95O75v9XdzyxnRP+JZh3byXmD6wtselqZJaiPxIb1LkWr77sE12EqT63yyUpbp0sRJJOlSENHadxUcDucnt41QM26Z6SYauT0CgYEAg1FvUaXhG0RrtREAyXeYwm3SWs4eWvo8Nd0FeaC2zRxCmmxcKiN8gX13H6q20jOmNpXGVF+fXzZ5iGHXjjo+lowQPyNE6eq2sTpzaE2sRRwtatVQX+OCOMOOiD3vB1Xrz5XO/OKv7x4BPGxKFZQ0VRSxbPtK02oyo0jJXTr1niw='),('e1bbcfc5-6693-42ae-96f4-2421d416ab92','f0987a5a-716a-4fd7-a706-bdc1eeb49722','allowed-protocol-mapper-types','saml-user-property-mapper'),('e6913067-ac9f-4548-95ec-2f5b67d1ed33','a7777171-d9d7-456e-a548-3948aa455d93','algorithm','HS256'),('e696efde-8323-4ecb-bf63-0711a799f2fb','4da5a8ee-1ffa-4c3f-a6d0-f2fa1d9a783f','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('eb0c0c20-0c1e-496e-be1f-dce003012ba3','db30bcc4-5bba-4198-889e-d519cc5563ab','priority','100'),('ecaf1bff-0cef-4999-9825-c88142de31b1','f9e923b1-cb08-429d-b445-34ce75824319','allow-default-scopes','true'),('ece8b1b2-aa61-476c-a7f2-571ead757e41','7199e0c2-e94e-41b5-902b-05a587fc9e3b','priority','100'),('ef8844c2-81a5-450d-9bb1-4e00dbf3b806','f0987a5a-716a-4fd7-a706-bdc1eeb49722','allowed-protocol-mapper-types','oidc-full-name-mapper'),('f5f1f5d6-9482-4610-a842-bbd2233a3a02','ca81c993-efaf-4790-8056-86f8a544fdff','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('f7622bbe-215d-46db-bf7a-2372a7005628','5133de00-e1cf-4842-b858-af1897808cd2','certificate','MIICmzCCAYMCBgGEVg04MzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIxMTA4MDcwMTU3WhcNMzIxMTA4MDcwMzM3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDvR71bWYZpqrliU4W0nWGk+pTJqvbLMdOpQfKygPejx420nKB/eQwgcQLvaO+fN9G9KSeMIokL5AElz6ZQwxW1e0nG2U8AA3/FdmNreABzdie8QJMiuuW+Zf9SwxoMX3kTX2CDGdtnI0uaE5fN7WVAtZYRtuVHZydiTk81BNFU/kC/MJ7/2PABnO+vBvOY6jIkiEn+e1U8lTwmm0eZwlHsxImqfqvzZtRk4DohNmc2mzuuvOt90PLBh8UYIRg4pAbg6wpP6Elxl99hFW4+pvH4C/3gBRRn1DhvYfp+2aREhPKyc9spFxnj4h4h3aHs6TnqXNBSJ+9W+ZosCPupa9WTAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAJQ5Z3SdqD9s0f31iXlEqVwg7f9ii8R43o/aMPP4KdPyFa2ylGX2I2W9i0TkK2mKXSNVEW0BDQDQv0jqnjbIipD46tfiULIjN/g0gK+8iWIQ6KN0q0abSbWbrqZq5Wed9FZZ9t02vGKiEnBFkl6LKcR10y8QQAl44OhUvDu1M+VgDSXCV58wc5oF/fhDAl6RjRikR3RwSMy9h3069ncAj8r3f8SbZUDtgulQ5zCn/lg/YXu6D78/9HBjZ51PkkPQXxo+G1Dj3Y7+cNUcRUxza/+fxs5YTRsZ9R38hJaKm396WfuVYk5A0AL6KqFabO1NeeABdmlbMRhgRm9RJS/Goqw='),('fe82e4e9-4823-43f0-bf89-3e4de132f2bd','f0987a5a-716a-4fd7-a706-bdc1eeb49722','allowed-protocol-mapper-types','saml-role-list-mapper'),('fecbe7dd-e3e8-46cf-a6f5-57e2ad0398dd','2ebbf726-e7f8-49dd-8d74-f9d7d2cb523f','priority','100');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('055f6272-a29d-4033-8319-0a7fd720db17','31569bd3-436c-4bdd-b4c1-fdfb96b7a24f'),('1128cb03-154a-4486-b425-8c93c34d5777','1e11de89-b6a4-4f46-b00f-41af20048e78'),('1128cb03-154a-4486-b425-8c93c34d5777','6fa3365f-2939-45b8-958b-fbaed16f9347'),('1638716f-3a7b-4aee-bcc2-a2d989ac8566','8903f323-feb1-4879-acd3-c635c61976ad'),('1638716f-3a7b-4aee-bcc2-a2d989ac8566','b71e1cf6-6fbf-4b18-946c-ac334db1ec72'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','0ecbd559-c380-4e7a-ba7c-1d0f898d457f'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','10603b3a-ac5e-493b-95d1-7cc75a5559e3'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','137679c0-4006-4043-b09e-4e8d1df6ecb7'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','1638716f-3a7b-4aee-bcc2-a2d989ac8566'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','20a7d92c-075a-4d38-acc9-b25f284dc39b'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','21073c4b-5b0f-46ad-9498-f32bcdfb0536'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','2903830f-5fc8-4799-b3ab-a9d25f2d3351'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','32844465-d621-4467-a96c-4d357547f708'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','330841fb-d675-46e2-8c34-47a7198a7281'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','335f6e01-f684-4117-b0b0-66fa58609d22'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','38e5ba63-8976-415f-a648-e41358b46df9'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','52414ef3-c15b-4dad-af8a-2b66f3d8fe50'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','53794efc-bf28-4247-8d71-59923d0758a2'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','6865554d-0386-49b6-9f0f-a12ee2e3035d'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','6a3950f5-9256-47dd-b58c-c632d2b21b7e'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','75197aca-3c05-4650-8d0a-0a7649c70b06'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','86d6c462-1417-49fb-8b82-f0de5a0a7dc2'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','8903f323-feb1-4879-acd3-c635c61976ad'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','8f1abc0a-2769-44df-a441-ba21e4a22756'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','94b416aa-2b6c-4d2d-8ffd-a3ed17cc5bf2'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','b71e1cf6-6fbf-4b18-946c-ac334db1ec72'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','b8e14e4a-59e1-4c54-a73d-458f59d7667c'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','c30b6224-daf9-4940-87d6-ee0a832000c9'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','c572400f-785d-40bd-921d-805bbd1d43bb'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','cb614433-2a37-4f89-80f9-4988781a7106'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','d0052cbe-2cf1-405c-9c0c-fe3ce3311b41'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','d45b6042-3c27-4b61-a262-2de81dd88c99'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','d4b382f1-e9a9-4e69-ab2e-6936ee837064'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','d89c6034-7944-40cc-8854-87bddee1e81f'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','db2e8b93-d20f-4305-9c93-aecc04609c8e'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','e34810e5-02a1-418b-8939-752e56b47771'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','e509e0a4-7cac-4b15-ac02-ff8e936ee334'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','e7884cbe-64a0-4300-8df2-d1b2cf9abc9b'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','ee257df1-8614-4c5c-b260-6411db6b7dc3'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','ef80c086-e08c-4a7a-8e63-e4afdf9d44fb'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','facfe2b6-db35-4b96-9cf3-7ad2f163c08c'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','ff08aeb3-cb45-4fcf-87db-bcd81e7fb944'),('2bc5fb9b-e7ce-49a4-913d-25081356eda2','8cd7e4f0-53a3-4322-b420-514f4a13166b'),('3cecfd49-3aa0-42ee-95d1-8b30504bb7fa','e51978d9-3704-4d5f-a983-e686bab626e0'),('75197aca-3c05-4650-8d0a-0a7649c70b06','6865554d-0386-49b6-9f0f-a12ee2e3035d'),('75197aca-3c05-4650-8d0a-0a7649c70b06','d4b382f1-e9a9-4e69-ab2e-6936ee837064'),('7c39290d-63fe-442f-b43f-3ed989fc6aa7','28ac635f-879d-40f3-bf6f-a7fc1b312a02'),('7c39290d-63fe-442f-b43f-3ed989fc6aa7','2bc5fb9b-e7ce-49a4-913d-25081356eda2'),('7c39290d-63fe-442f-b43f-3ed989fc6aa7','b00a13ea-06ca-492a-acda-ea9b9208e1ab'),('7c39290d-63fe-442f-b43f-3ed989fc6aa7','fcafdb45-c7c0-4118-8bdd-74913c85de76'),('86db45ac-166f-4897-88e9-c428b6def5ad','1128cb03-154a-4486-b425-8c93c34d5777'),('86db45ac-166f-4897-88e9-c428b6def5ad','1e11de89-b6a4-4f46-b00f-41af20048e78'),('86db45ac-166f-4897-88e9-c428b6def5ad','273d2df1-21ac-479b-9fde-31225e18304e'),('86db45ac-166f-4897-88e9-c428b6def5ad','45428607-36fe-4b9b-bbfc-78203d2cc9df'),('86db45ac-166f-4897-88e9-c428b6def5ad','4ea591ba-c4b3-4673-aedf-f69951ba7532'),('86db45ac-166f-4897-88e9-c428b6def5ad','613dc2d1-b859-4d40-9aa3-291c4a728d53'),('86db45ac-166f-4897-88e9-c428b6def5ad','6fa3365f-2939-45b8-958b-fbaed16f9347'),('86db45ac-166f-4897-88e9-c428b6def5ad','722653eb-1866-4332-9705-5acf06300019'),('86db45ac-166f-4897-88e9-c428b6def5ad','7fbbf5d3-0b81-471a-ac36-0e89866f5a7c'),('86db45ac-166f-4897-88e9-c428b6def5ad','904a829f-f448-481c-8ab5-c0f49ecde1f5'),('86db45ac-166f-4897-88e9-c428b6def5ad','b357a406-c38a-4e22-8c42-223ecc4025a7'),('86db45ac-166f-4897-88e9-c428b6def5ad','b6366460-d8b4-42af-b5c5-8d75c3454a64'),('86db45ac-166f-4897-88e9-c428b6def5ad','b829eba2-2637-4a71-9dc7-defb18893a78'),('86db45ac-166f-4897-88e9-c428b6def5ad','cfb09876-4fee-4735-b2e4-241597b46eac'),('86db45ac-166f-4897-88e9-c428b6def5ad','d7a10496-e5ef-4744-9049-a4b06707b298'),('86db45ac-166f-4897-88e9-c428b6def5ad','d7cbff93-a122-4d38-ad61-b2ba3f6e5e6a'),('86db45ac-166f-4897-88e9-c428b6def5ad','dbb8d138-38fe-4fe1-9d39-074c4efb257a'),('86db45ac-166f-4897-88e9-c428b6def5ad','f6da9b7e-0cd6-401c-91b4-01e4233c0f2f'),('c30b6224-daf9-4940-87d6-ee0a832000c9','d89c6034-7944-40cc-8854-87bddee1e81f'),('ca77f092-68ac-4b5d-8e3b-ae76bfc8b409','9aec40a5-19e6-4ea9-ae0b-4ef38e065a38'),('d7cbff93-a122-4d38-ad61-b2ba3f6e5e6a','45428607-36fe-4b9b-bbfc-78203d2cc9df'),('db2e8b93-d20f-4305-9c93-aecc04609c8e','b8e14e4a-59e1-4c54-a73d-458f59d7667c'),('de2eee6b-d9eb-456d-9805-86e8be6b48a3','055f6272-a29d-4033-8319-0a7fd720db17'),('de2eee6b-d9eb-456d-9805-86e8be6b48a3','1fb26579-547a-424b-92b7-5f0051e2e04c'),('de2eee6b-d9eb-456d-9805-86e8be6b48a3','2fdf17f8-d882-475a-8aac-32715bfe4424'),('de2eee6b-d9eb-456d-9805-86e8be6b48a3','c2ba8ea6-0e67-42ed-a350-70253ded683e');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('410efb2f-d9a3-4529-81bb-a4c5c5e5fa55',NULL,'password','21003e73-dd47-4dbb-beb9-0a1d6155ad63',1667891129175,NULL,'{\"value\":\"UEP8zEsa/og3qv7TPa0lTrx+JPZ25p1LiTnbGOHEGGAAHjDxXDwB0lTtwgsJHZdnYnNEHi2R7TBlKK4imZvDiw==\",\"salt\":\"tnqyFyRxje56l5dVcY+l9w==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('78886eda-db97-4b18-b206-6947977f6106',NULL,'password','136022cc-a27a-4172-befd-3895e1f4141a',1667891167752,NULL,'{\"value\":\"GXt6voxUE0SI9n7F8geAPHlEGqtlTl1UdkedIGMBSt+G5Mas9hTr8MGdl5i36BmQ9k+olMdc0d7BqBQG9v774w==\",\"salt\":\"0/BYelRsrEraSduJt22SUw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('8db224a9-6e3c-4172-954c-324cc0e59b42',NULL,'password','c8c87b33-d40d-42ee-a836-75862c3dac22',1667891101719,NULL,'{\"value\":\"31ZeRqcHiECX5vIpUngyYMTldsQeoWiPMmciVsh7D3j6RMkgU1+5Arly9OVlJ9VQdGLc0vRLhRGtew0KTg012A==\",\"salt\":\"9zZ0eWeSABf0dRzq48wrOw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('be77409b-555e-45a4-9feb-5a35dca6c41c',NULL,'password','9fe3e27f-5aac-4f71-9cf5-9728e8df2502',1667891018741,NULL,'{\"value\":\"T2BctfjG5czCmkP2aQx1o1u14E7zzv0XzWPNw950ZExvVTg6+1w6XZ2W35sKGiZ6SFN6sVjqybChzEnGhEIu2g==\",\"salt\":\"Ue+m2IDIR6d9phsGrU2CsQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2022-11-08 07:03:08',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2022-11-08 07:03:08',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2022-11-08 07:03:08',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2022-11-08 07:03:08',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2022-11-08 07:03:09',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2022-11-08 07:03:09',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2022-11-08 07:03:10',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2022-11-08 07:03:10',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2022-11-08 07:03:10',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2022-11-08 07:03:11',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2022-11-08 07:03:12',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2022-11-08 07:03:12',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2022-11-08 07:03:12',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-11-08 07:03:12',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-11-08 07:03:12',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-11-08 07:03:12',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-11-08 07:03:12',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2022-11-08 07:03:13',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2022-11-08 07:03:14',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2022-11-08 07:03:14',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2022-11-08 07:03:14',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2022-11-08 07:03:14',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2022-11-08 07:03:14',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2022-11-08 07:03:14',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2022-11-08 07:03:14',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7890985756'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2022-11-08 07:03:14',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2022-11-08 07:03:16',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2022-11-08 07:03:16',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'7890985756'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2022-11-08 07:03:18',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2022-11-08 07:03:18',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2022-11-08 07:03:18',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2022-11-08 07:03:19',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'7890985756'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-11-08 07:03:19',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7890985756'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-11-08 07:03:19',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-11-08 07:03:19',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2022-11-08 07:03:19',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7890985756'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-11-08 07:03:19',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7890985756'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2022-11-08 07:03:19',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'7890985756'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2022-11-08 07:03:19',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7890985756'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-11-08 07:03:19',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'7890985756'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-11-08 07:03:19',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'7890985756'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2022-11-08 07:03:19',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'7890985756'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-11-08 07:03:20',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2022-11-08 07:03:20',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'7890985756'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-11-08 07:03:21',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'7890985756'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-11-08 07:03:21',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'7890985756'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-11-08 07:03:21',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'7890985756'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-11-08 07:03:21',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-11-08 07:03:21',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7890985756'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2022-11-08 07:03:22',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2022-11-08 07:03:23',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2022-11-08 07:03:23',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7890985756'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2022-11-08 07:03:23',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7890985756'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2022-11-08 07:03:23',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7890985756'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-11-08 07:03:23',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'7890985756'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-11-08 07:03:23',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'7890985756'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-11-08 07:03:23',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-11-08 07:03:25',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2022-11-08 07:03:25',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2022-11-08 07:03:25',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'7890985756'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-11-08 07:03:25',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-11-08 07:03:25',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'7890985756'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2022-11-08 07:03:25',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7890985756'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2022-11-08 07:03:25',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7890985756'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2022-11-08 07:03:25',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'7890985756'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2022-11-08 07:03:25',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2022-11-08 07:03:25',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'7890985756'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2022-11-08 07:03:26',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7890985756'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2022-11-08 07:03:26',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2022-11-08 07:03:26',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7890985756'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2022-11-08 07:03:26',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'7890985756'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-11-08 07:03:26',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7890985756'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-11-08 07:03:26',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7890985756'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-11-08 07:03:26',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7890985756'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-11-08 07:03:26',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-11-08 07:03:26',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'7890985756'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-11-08 07:03:26',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7890985756'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-11-08 07:03:26',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-11-08 07:03:27',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-11-08 07:03:27',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-11-08 07:03:27',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7890985756'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-11-08 07:03:27',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7890985756'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-11-08 07:03:27',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7890985756'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-11-08 07:03:27',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7890985756'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-11-08 07:03:27',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'7890985756'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2022-11-08 07:03:27',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'7890985756'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2022-11-08 07:03:27',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2022-11-08 07:03:27',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'7890985756'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-11-08 07:03:27',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'7890985756'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-11-08 07:03:27',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'7890985756'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-11-08 07:03:27',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7890985756'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-11-08 07:03:27',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-11-08 07:03:27',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'7890985756'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-11-08 07:03:27',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'7890985756'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-11-08 07:03:27',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'7890985756'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-11-08 07:03:27',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'7890985756'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-11-08 07:03:27',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7890985756'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-11-08 07:03:27',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7890985756'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-11-08 07:03:28',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7890985756'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-11-08 07:03:28',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7890985756'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-11-08 07:03:28',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7890985756'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-11-08 07:03:28',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'7890985756'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-11-08 07:03:28',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'7890985756'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2022-11-08 07:03:28',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'7890985756');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('master','185940b2-91ae-466d-89c8-0458100832b3',_binary ''),('master','33db900f-9b17-4c0a-86bf-24463b90645c',_binary '\0'),('master','7211dc2c-83c6-4716-9fa8-11160f89d4ea',_binary ''),('master','73e048a4-a28b-4ae1-8547-e044d500c637',_binary ''),('master','9bcf60b3-c479-46dd-b56d-f2e2a75d29ad',_binary '\0'),('master','bf519f00-2ff9-430f-a751-f26fc5a664af',_binary '\0'),('master','ced25b99-4df8-481b-9ad1-da5ee35acf2d',_binary '\0'),('master','eb57ce1a-b89e-4f82-950c-47a85482a670',_binary ''),('master','ecce35c3-545b-4f8e-a278-8e3d78cf8f24',_binary ''),('my_realm','1662418f-49b8-4655-8e50-f1fe7c968d15',_binary ''),('my_realm','3767e133-f7db-4dfc-bdbf-7ed98049a5b2',_binary '\0'),('my_realm','7e689b50-e700-45e4-9d55-97396bf0461b',_binary '\0'),('my_realm','88ff7e16-7d55-44f5-8ab1-741dd5c6625a',_binary ''),('my_realm','94220b17-606b-4c17-920e-4d201faa861b',_binary ''),('my_realm','a6aa1b39-1150-4c02-8a2e-a5b4a9201d65',_binary ''),('my_realm','a9ff3d62-c055-47e0-9008-83b9bc3ba1a7',_binary '\0'),('my_realm','bed01d8b-e1cd-4910-9fb4-80a5948925af',_binary '\0'),('my_realm','dd793fc3-02dd-45fc-b929-48eefbe73272',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('055f6272-a29d-4033-8319-0a7fd720db17','407df944-fb12-4eee-9717-f4d30985a2dc',_binary '','${role_manage-account}','manage-account','my_realm','407df944-fb12-4eee-9717-f4d30985a2dc',NULL),('0ecbd559-c380-4e7a-ba7c-1d0f898d457f','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_view-realm}','view-realm','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('10603b3a-ac5e-493b-95d1-7cc75a5559e3','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_query-realms}','query-realms','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('1128cb03-154a-4486-b425-8c93c34d5777','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_view-users}','view-users','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('137679c0-4006-4043-b09e-4e8d1df6ecb7','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_manage-authorization}','manage-authorization','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('14db4fcd-31ad-46d0-bb26-0f5deb3966bc','4bad9f0a-5b3c-421a-bbb5-9c6e5d38babf',_binary '','${role_read-token}','read-token','master','4bad9f0a-5b3c-421a-bbb5-9c6e5d38babf',NULL),('1638716f-3a7b-4aee-bcc2-a2d989ac8566','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_view-users}','view-users','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('1e11de89-b6a4-4f46-b00f-41af20048e78','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_query-groups}','query-groups','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('1fb26579-547a-424b-92b7-5f0051e2e04c','my_realm',_binary '\0','${role_uma_authorization}','uma_authorization','my_realm',NULL,NULL),('20397f26-6df4-4ce3-8269-4bb4c2074da0','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('20a7d92c-075a-4d38-acc9-b25f284dc39b','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_create-client}','create-client','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('21073c4b-5b0f-46ad-9498-f32bcdfb0536','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_view-realm}','view-realm','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('273d2df1-21ac-479b-9fde-31225e18304e','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_manage-users}','manage-users','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('28ac635f-879d-40f3-bf6f-a7fc1b312a02','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('2903830f-5fc8-4799-b3ab-a9d25f2d3351','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_view-identity-providers}','view-identity-providers','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('2bc5fb9b-e7ce-49a4-913d-25081356eda2','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',_binary '','${role_manage-account}','manage-account','master','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',NULL),('2c48d9d2-8c4c-4d9b-ac3d-1b6bcf437d8f','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',_binary '','${role_view-applications}','view-applications','master','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',NULL),('2fdf17f8-d882-475a-8aac-32715bfe4424','my_realm',_binary '\0','${role_offline-access}','offline_access','my_realm',NULL,NULL),('31569bd3-436c-4bdd-b4c1-fdfb96b7a24f','407df944-fb12-4eee-9717-f4d30985a2dc',_binary '','${role_manage-account-links}','manage-account-links','my_realm','407df944-fb12-4eee-9717-f4d30985a2dc',NULL),('32844465-d621-4467-a96c-4d357547f708','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('330841fb-d675-46e2-8c34-47a7198a7281','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_view-authorization}','view-authorization','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('335f6e01-f684-4117-b0b0-66fa58609d22','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('38e5ba63-8976-415f-a648-e41358b46df9','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_manage-events}','manage-events','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('3cecfd49-3aa0-42ee-95d1-8b30504bb7fa','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',_binary '','${role_manage-consent}','manage-consent','master','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',NULL),('45428607-36fe-4b9b-bbfc-78203d2cc9df','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_query-clients}','query-clients','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('4ea591ba-c4b3-4673-aedf-f69951ba7532','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_view-identity-providers}','view-identity-providers','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('52414ef3-c15b-4dad-af8a-2b66f3d8fe50','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_manage-users}','manage-users','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('53794efc-bf28-4247-8d71-59923d0758a2','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_manage-realm}','manage-realm','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('613dc2d1-b859-4d40-9aa3-291c4a728d53','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_impersonation}','impersonation','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('6865554d-0386-49b6-9f0f-a12ee2e3035d','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_query-groups}','query-groups','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('6a3950f5-9256-47dd-b58c-c632d2b21b7e','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_view-events}','view-events','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('6b4c5ea9-cabc-4062-9f6f-f9a22a66d049','22d30a34-7627-44cc-8bd6-0ad095f469a5',_binary '','${role_read-token}','read-token','my_realm','22d30a34-7627-44cc-8bd6-0ad095f469a5',NULL),('6fa3365f-2939-45b8-958b-fbaed16f9347','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_query-users}','query-users','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('722653eb-1866-4332-9705-5acf06300019','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_view-realm}','view-realm','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('75197aca-3c05-4650-8d0a-0a7649c70b06','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_view-users}','view-users','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('7c39290d-63fe-442f-b43f-3ed989fc6aa7','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('7fbbf5d3-0b81-471a-ac36-0e89866f5a7c','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_query-realms}','query-realms','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('8198a814-19e6-4fec-95d6-7c8594e1747d','my_realm',_binary '\0',NULL,'ADMIN','my_realm',NULL,NULL),('86d6c462-1417-49fb-8b82-f0de5a0a7dc2','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_manage-clients}','manage-clients','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('86db45ac-166f-4897-88e9-c428b6def5ad','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_realm-admin}','realm-admin','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('88c79822-07c7-40f2-b567-b7bc5040a869','my_realm',_binary '\0',NULL,'USER','my_realm',NULL,NULL),('8903f323-feb1-4879-acd3-c635c61976ad','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_query-users}','query-users','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('8cd7e4f0-53a3-4322-b420-514f4a13166b','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',_binary '','${role_manage-account-links}','manage-account-links','master','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',NULL),('8f1abc0a-2769-44df-a441-ba21e4a22756','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_manage-events}','manage-events','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('904a829f-f448-481c-8ab5-c0f49ecde1f5','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_view-events}','view-events','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('94b416aa-2b6c-4d2d-8ffd-a3ed17cc5bf2','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_create-client}','create-client','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('9aec40a5-19e6-4ea9-ae0b-4ef38e065a38','407df944-fb12-4eee-9717-f4d30985a2dc',_binary '','${role_view-consent}','view-consent','my_realm','407df944-fb12-4eee-9717-f4d30985a2dc',NULL),('b00a13ea-06ca-492a-acda-ea9b9208e1ab','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('b357a406-c38a-4e22-8c42-223ecc4025a7','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_manage-events}','manage-events','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('b5119089-d93b-4833-9866-fb1121635437','407df944-fb12-4eee-9717-f4d30985a2dc',_binary '','${role_view-applications}','view-applications','my_realm','407df944-fb12-4eee-9717-f4d30985a2dc',NULL),('b6366460-d8b4-42af-b5c5-8d75c3454a64','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_manage-authorization}','manage-authorization','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('b71e1cf6-6fbf-4b18-946c-ac334db1ec72','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_query-groups}','query-groups','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('b829eba2-2637-4a71-9dc7-defb18893a78','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_view-authorization}','view-authorization','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('b8e14e4a-59e1-4c54-a73d-458f59d7667c','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_query-clients}','query-clients','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('c2ba8ea6-0e67-42ed-a350-70253ded683e','407df944-fb12-4eee-9717-f4d30985a2dc',_binary '','${role_view-profile}','view-profile','my_realm','407df944-fb12-4eee-9717-f4d30985a2dc',NULL),('c30b6224-daf9-4940-87d6-ee0a832000c9','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_view-clients}','view-clients','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('c572400f-785d-40bd-921d-805bbd1d43bb','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('ca77f092-68ac-4b5d-8e3b-ae76bfc8b409','407df944-fb12-4eee-9717-f4d30985a2dc',_binary '','${role_manage-consent}','manage-consent','my_realm','407df944-fb12-4eee-9717-f4d30985a2dc',NULL),('cb614433-2a37-4f89-80f9-4988781a7106','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_manage-users}','manage-users','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('cfb09876-4fee-4735-b2e4-241597b46eac','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_manage-identity-providers}','manage-identity-providers','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('d0052cbe-2cf1-405c-9c0c-fe3ce3311b41','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_query-realms}','query-realms','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('d45b6042-3c27-4b61-a262-2de81dd88c99','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_manage-authorization}','manage-authorization','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('d4b382f1-e9a9-4e69-ab2e-6936ee837064','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_query-users}','query-users','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('d7a10496-e5ef-4744-9049-a4b06707b298','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_create-client}','create-client','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('d7cbff93-a122-4d38-ad61-b2ba3f6e5e6a','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_view-clients}','view-clients','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('d89c6034-7944-40cc-8854-87bddee1e81f','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_query-clients}','query-clients','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('db2e8b93-d20f-4305-9c93-aecc04609c8e','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_view-clients}','view-clients','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('dbb8d138-38fe-4fe1-9d39-074c4efb257a','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_manage-clients}','manage-clients','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('de2eee6b-d9eb-456d-9805-86e8be6b48a3','my_realm',_binary '\0','${role_default-roles}','default-roles-my_realm','my_realm',NULL,NULL),('e27ddec5-dc1b-4597-870b-201ac2dcef41','407df944-fb12-4eee-9717-f4d30985a2dc',_binary '','${role_delete-account}','delete-account','my_realm','407df944-fb12-4eee-9717-f4d30985a2dc',NULL),('e34810e5-02a1-418b-8939-752e56b47771','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_view-events}','view-events','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('e509e0a4-7cac-4b15-ac02-ff8e936ee334','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_manage-realm}','manage-realm','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('e51978d9-3704-4d5f-a983-e686bab626e0','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',_binary '','${role_view-consent}','view-consent','master','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',NULL),('e7884cbe-64a0-4300-8df2-d1b2cf9abc9b','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_view-authorization}','view-authorization','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('ece9266d-9624-43ac-8cfe-cceabe077731','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',_binary '','${role_delete-account}','delete-account','master','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',NULL),('ee257df1-8614-4c5c-b260-6411db6b7dc3','b0fcddf1-943f-432f-bc29-14d47503a0ee',_binary '','${role_impersonation}','impersonation','master','b0fcddf1-943f-432f-bc29-14d47503a0ee',NULL),('ef80c086-e08c-4a7a-8e63-e4afdf9d44fb','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_view-identity-providers}','view-identity-providers','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('f6da9b7e-0cd6-401c-91b4-01e4233c0f2f','59d88e1f-2ab1-4ea1-b821-7194056fe51e',_binary '','${role_manage-realm}','manage-realm','my_realm','59d88e1f-2ab1-4ea1-b821-7194056fe51e',NULL),('facfe2b6-db35-4b96-9cf3-7ad2f163c08c','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_manage-clients}','manage-clients','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL),('fcafdb45-c7c0-4118-8bdd-74913c85de76','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',_binary '','${role_view-profile}','view-profile','master','05ec4677-8779-4ed6-a8ac-2d526f9b8b13',NULL),('ff08aeb3-cb45-4fcf-87db-bcd81e7fb944','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',_binary '','${role_impersonation}','impersonation','master','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('jkve0','16.1.1',1667891013);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('02128ac0-d7b7-46b4-95ca-24ff1715542a','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('03f198c3-a67d-4cc6-8d1f-9eb93ac16b8f','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'a9ff3d62-c055-47e0-9008-83b9bc3ba1a7'),('07bf92c1-e8d8-4c0c-ac7c-f69f789d768a','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('07ebf692-4044-4352-9d3e-a30c591ef1db','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('11c068fd-1192-451e-a443-3c19b4e67663','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('1a44d706-8bfc-41b5-9f2b-004c5f53f743','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('21f3306d-c86e-47bf-9dc8-36eebaee448b','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('22d22b86-5389-4cb0-9d73-dd984fb11f62','role list','saml','saml-role-list-mapper',NULL,'ecce35c3-545b-4f8e-a278-8e3d78cf8f24'),('26308791-3b53-4a8a-9d98-7ee5cce4417c','address','openid-connect','oidc-address-mapper',NULL,'3767e133-f7db-4dfc-bdbf-7ed98049a5b2'),('31e9f452-06b9-4630-9470-2fadd458f3ef','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('3618abdb-eba0-4205-8408-3a19a299a103','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('3d8e2b70-6fe5-4306-8d72-8d666351592e','full name','openid-connect','oidc-full-name-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('3dacc2a0-1890-4b85-82fc-00ba00612ca8','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('41231ab5-46d3-4a6e-823b-6abfe7968b56','email','openid-connect','oidc-usermodel-property-mapper',NULL,'eb57ce1a-b89e-4f82-950c-47a85482a670'),('4246a2cf-77db-4f17-8317-ec62e06be0f7','username','openid-connect','oidc-usermodel-property-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('43e4a656-432a-41e0-b3ed-93662597d637','address','openid-connect','oidc-address-mapper',NULL,'9bcf60b3-c479-46dd-b56d-f2e2a75d29ad'),('44a248f0-8ee7-4ccc-9ab1-2d4b03f76808','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('46cfc9ba-1187-447a-a4d8-9ada69bbda67','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('4c8dd460-f093-4929-a6df-d5972bbb05fa','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'33db900f-9b17-4c0a-86bf-24463b90645c'),('531bdd90-0d7c-4399-bdf1-1af6a190a750','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('53c52a63-6a9d-4e70-9b70-7da3e92df293','audience resolve','openid-connect','oidc-audience-resolve-mapper','428a10e5-2a55-4755-98d8-33eacea29622',NULL),('55b7eb1b-697d-40ae-bed2-f2c2cc9fd9ed','full name','openid-connect','oidc-full-name-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('58355a7f-97b3-45de-bbd5-b56aa98d5598','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('59e45149-3b63-4b0f-ab87-b647af99c6b2','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'1662418f-49b8-4655-8e50-f1fe7c968d15'),('5b3e5ce8-d68f-41f5-afab-9412cfb451ae','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('5e28b1c4-15ae-41d4-9fd3-9fc1a1cbaabe','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'dd793fc3-02dd-45fc-b929-48eefbe73272'),('6c8f3b66-856f-42d5-92b7-51456b515b37','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('6d24cecb-07d8-47a6-91b9-605d3d555046','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('7c55cabf-8449-42b0-993d-dbd24c8c6108','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'eb57ce1a-b89e-4f82-950c-47a85482a670'),('8398adc5-2e21-4467-b0de-6ec8d7a43f69','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'73e048a4-a28b-4ae1-8547-e044d500c637'),('84011d5d-407a-4647-a21c-e8ac9a371ba8','email','openid-connect','oidc-usermodel-property-mapper',NULL,'88ff7e16-7d55-44f5-8ab1-741dd5c6625a'),('86af9834-a293-42ab-b31b-8bbce4a5c3bd','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7e689b50-e700-45e4-9d55-97396bf0461b'),('8dcd4bbc-3183-4856-96ec-770785b7d704','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('9029acdb-e7a4-4d08-b735-f1aab6f081bd','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('96ed9934-712a-432e-8951-2d6dfe50808b','role list','saml','saml-role-list-mapper',NULL,'94220b17-606b-4c17-920e-4d201faa861b'),('994a7fb9-2649-408a-9570-a0f6e0f45e07','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('99fdc1c5-ddba-4f60-bf7b-9974238a3e0d','locale','openid-connect','oidc-usermodel-attribute-mapper','35ff55ed-6b05-4f1d-9a45-4d37686fceb0',NULL),('9e7f1c5b-4026-444c-95e6-059d309814ae','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'33db900f-9b17-4c0a-86bf-24463b90645c'),('a5902e8f-7b2d-4a38-b7c6-df20a7ec8195','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('a6016821-7c3c-4696-9168-9c4fc6b5e426','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('a6c0b938-6e0d-4da4-8aab-58d663df491d','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('ab3608e5-808f-47b5-a050-c8fd7280cf68','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'7211dc2c-83c6-4716-9fa8-11160f89d4ea'),('b296c3d6-047f-4f15-bb6c-6fe268b9fe18','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'a9ff3d62-c055-47e0-9008-83b9bc3ba1a7'),('b9cf3d60-bfaa-4812-bd64-d96f2a6d66eb','audience resolve','openid-connect','oidc-audience-resolve-mapper','a2e55aff-efe4-4a48-821a-d1fc1b5c9b74',NULL),('bafcf8c8-b821-45e3-8786-b0f0176e0612','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'1662418f-49b8-4655-8e50-f1fe7c968d15'),('bec470c2-2434-4f53-a30e-1d7c5a42ff76','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'185940b2-91ae-466d-89c8-0458100832b3'),('bf9a5658-264e-4bdd-be67-d0ff3a8a1de1','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'7211dc2c-83c6-4716-9fa8-11160f89d4ea'),('c6ef90f0-cb21-4169-b12f-e22323250bbc','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'88ff7e16-7d55-44f5-8ab1-741dd5c6625a'),('d2f69481-af57-4d7d-8868-ae6a60b7071e','username','openid-connect','oidc-usermodel-property-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65'),('d65159ed-8c4e-441d-8b1e-6c9aa0015711','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'bf519f00-2ff9-430f-a751-f26fc5a664af'),('e1950d40-ce6c-4478-a397-841ebd098e61','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7e689b50-e700-45e4-9d55-97396bf0461b'),('e28fe1b5-492a-427c-8b5b-dab32fdcf962','locale','openid-connect','oidc-usermodel-attribute-mapper','f77b567f-3e3b-4e33-96d9-2f020100279c',NULL),('e7c1f973-2ef6-42d5-b5cf-b9b607ca8320','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'7211dc2c-83c6-4716-9fa8-11160f89d4ea'),('e8330bb0-e720-429c-b8d7-96d2db608d20','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'bf519f00-2ff9-430f-a751-f26fc5a664af'),('e89d3a85-4ea9-4975-9899-67a0b5c3b3f4','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'1662418f-49b8-4655-8e50-f1fe7c968d15'),('f8fd080c-e6cc-4767-a766-1f354c840609','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a6aa1b39-1150-4c02-8a2e-a5b4a9201d65');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('02128ac0-d7b7-46b4-95ca-24ff1715542a','true','access.token.claim'),('02128ac0-d7b7-46b4-95ca-24ff1715542a','picture','claim.name'),('02128ac0-d7b7-46b4-95ca-24ff1715542a','true','id.token.claim'),('02128ac0-d7b7-46b4-95ca-24ff1715542a','String','jsonType.label'),('02128ac0-d7b7-46b4-95ca-24ff1715542a','picture','user.attribute'),('02128ac0-d7b7-46b4-95ca-24ff1715542a','true','userinfo.token.claim'),('03f198c3-a67d-4cc6-8d1f-9eb93ac16b8f','true','access.token.claim'),('03f198c3-a67d-4cc6-8d1f-9eb93ac16b8f','groups','claim.name'),('03f198c3-a67d-4cc6-8d1f-9eb93ac16b8f','true','id.token.claim'),('03f198c3-a67d-4cc6-8d1f-9eb93ac16b8f','String','jsonType.label'),('03f198c3-a67d-4cc6-8d1f-9eb93ac16b8f','true','multivalued'),('03f198c3-a67d-4cc6-8d1f-9eb93ac16b8f','foo','user.attribute'),('07bf92c1-e8d8-4c0c-ac7c-f69f789d768a','true','access.token.claim'),('07bf92c1-e8d8-4c0c-ac7c-f69f789d768a','given_name','claim.name'),('07bf92c1-e8d8-4c0c-ac7c-f69f789d768a','true','id.token.claim'),('07bf92c1-e8d8-4c0c-ac7c-f69f789d768a','String','jsonType.label'),('07bf92c1-e8d8-4c0c-ac7c-f69f789d768a','firstName','user.attribute'),('07bf92c1-e8d8-4c0c-ac7c-f69f789d768a','true','userinfo.token.claim'),('07ebf692-4044-4352-9d3e-a30c591ef1db','true','access.token.claim'),('07ebf692-4044-4352-9d3e-a30c591ef1db','website','claim.name'),('07ebf692-4044-4352-9d3e-a30c591ef1db','true','id.token.claim'),('07ebf692-4044-4352-9d3e-a30c591ef1db','String','jsonType.label'),('07ebf692-4044-4352-9d3e-a30c591ef1db','website','user.attribute'),('07ebf692-4044-4352-9d3e-a30c591ef1db','true','userinfo.token.claim'),('11c068fd-1192-451e-a443-3c19b4e67663','true','access.token.claim'),('11c068fd-1192-451e-a443-3c19b4e67663','nickname','claim.name'),('11c068fd-1192-451e-a443-3c19b4e67663','true','id.token.claim'),('11c068fd-1192-451e-a443-3c19b4e67663','String','jsonType.label'),('11c068fd-1192-451e-a443-3c19b4e67663','nickname','user.attribute'),('11c068fd-1192-451e-a443-3c19b4e67663','true','userinfo.token.claim'),('1a44d706-8bfc-41b5-9f2b-004c5f53f743','true','access.token.claim'),('1a44d706-8bfc-41b5-9f2b-004c5f53f743','profile','claim.name'),('1a44d706-8bfc-41b5-9f2b-004c5f53f743','true','id.token.claim'),('1a44d706-8bfc-41b5-9f2b-004c5f53f743','String','jsonType.label'),('1a44d706-8bfc-41b5-9f2b-004c5f53f743','profile','user.attribute'),('1a44d706-8bfc-41b5-9f2b-004c5f53f743','true','userinfo.token.claim'),('21f3306d-c86e-47bf-9dc8-36eebaee448b','true','access.token.claim'),('21f3306d-c86e-47bf-9dc8-36eebaee448b','birthdate','claim.name'),('21f3306d-c86e-47bf-9dc8-36eebaee448b','true','id.token.claim'),('21f3306d-c86e-47bf-9dc8-36eebaee448b','String','jsonType.label'),('21f3306d-c86e-47bf-9dc8-36eebaee448b','birthdate','user.attribute'),('21f3306d-c86e-47bf-9dc8-36eebaee448b','true','userinfo.token.claim'),('22d22b86-5389-4cb0-9d73-dd984fb11f62','Role','attribute.name'),('22d22b86-5389-4cb0-9d73-dd984fb11f62','Basic','attribute.nameformat'),('22d22b86-5389-4cb0-9d73-dd984fb11f62','false','single'),('26308791-3b53-4a8a-9d98-7ee5cce4417c','true','access.token.claim'),('26308791-3b53-4a8a-9d98-7ee5cce4417c','true','id.token.claim'),('26308791-3b53-4a8a-9d98-7ee5cce4417c','country','user.attribute.country'),('26308791-3b53-4a8a-9d98-7ee5cce4417c','formatted','user.attribute.formatted'),('26308791-3b53-4a8a-9d98-7ee5cce4417c','locality','user.attribute.locality'),('26308791-3b53-4a8a-9d98-7ee5cce4417c','postal_code','user.attribute.postal_code'),('26308791-3b53-4a8a-9d98-7ee5cce4417c','region','user.attribute.region'),('26308791-3b53-4a8a-9d98-7ee5cce4417c','street','user.attribute.street'),('26308791-3b53-4a8a-9d98-7ee5cce4417c','true','userinfo.token.claim'),('31e9f452-06b9-4630-9470-2fadd458f3ef','true','access.token.claim'),('31e9f452-06b9-4630-9470-2fadd458f3ef','picture','claim.name'),('31e9f452-06b9-4630-9470-2fadd458f3ef','true','id.token.claim'),('31e9f452-06b9-4630-9470-2fadd458f3ef','String','jsonType.label'),('31e9f452-06b9-4630-9470-2fadd458f3ef','picture','user.attribute'),('31e9f452-06b9-4630-9470-2fadd458f3ef','true','userinfo.token.claim'),('3618abdb-eba0-4205-8408-3a19a299a103','true','access.token.claim'),('3618abdb-eba0-4205-8408-3a19a299a103','zoneinfo','claim.name'),('3618abdb-eba0-4205-8408-3a19a299a103','true','id.token.claim'),('3618abdb-eba0-4205-8408-3a19a299a103','String','jsonType.label'),('3618abdb-eba0-4205-8408-3a19a299a103','zoneinfo','user.attribute'),('3618abdb-eba0-4205-8408-3a19a299a103','true','userinfo.token.claim'),('3d8e2b70-6fe5-4306-8d72-8d666351592e','true','access.token.claim'),('3d8e2b70-6fe5-4306-8d72-8d666351592e','true','id.token.claim'),('3d8e2b70-6fe5-4306-8d72-8d666351592e','true','userinfo.token.claim'),('3dacc2a0-1890-4b85-82fc-00ba00612ca8','true','access.token.claim'),('3dacc2a0-1890-4b85-82fc-00ba00612ca8','updated_at','claim.name'),('3dacc2a0-1890-4b85-82fc-00ba00612ca8','true','id.token.claim'),('3dacc2a0-1890-4b85-82fc-00ba00612ca8','String','jsonType.label'),('3dacc2a0-1890-4b85-82fc-00ba00612ca8','updatedAt','user.attribute'),('3dacc2a0-1890-4b85-82fc-00ba00612ca8','true','userinfo.token.claim'),('41231ab5-46d3-4a6e-823b-6abfe7968b56','true','access.token.claim'),('41231ab5-46d3-4a6e-823b-6abfe7968b56','email','claim.name'),('41231ab5-46d3-4a6e-823b-6abfe7968b56','true','id.token.claim'),('41231ab5-46d3-4a6e-823b-6abfe7968b56','String','jsonType.label'),('41231ab5-46d3-4a6e-823b-6abfe7968b56','email','user.attribute'),('41231ab5-46d3-4a6e-823b-6abfe7968b56','true','userinfo.token.claim'),('4246a2cf-77db-4f17-8317-ec62e06be0f7','true','access.token.claim'),('4246a2cf-77db-4f17-8317-ec62e06be0f7','preferred_username','claim.name'),('4246a2cf-77db-4f17-8317-ec62e06be0f7','true','id.token.claim'),('4246a2cf-77db-4f17-8317-ec62e06be0f7','String','jsonType.label'),('4246a2cf-77db-4f17-8317-ec62e06be0f7','username','user.attribute'),('4246a2cf-77db-4f17-8317-ec62e06be0f7','true','userinfo.token.claim'),('43e4a656-432a-41e0-b3ed-93662597d637','true','access.token.claim'),('43e4a656-432a-41e0-b3ed-93662597d637','true','id.token.claim'),('43e4a656-432a-41e0-b3ed-93662597d637','country','user.attribute.country'),('43e4a656-432a-41e0-b3ed-93662597d637','formatted','user.attribute.formatted'),('43e4a656-432a-41e0-b3ed-93662597d637','locality','user.attribute.locality'),('43e4a656-432a-41e0-b3ed-93662597d637','postal_code','user.attribute.postal_code'),('43e4a656-432a-41e0-b3ed-93662597d637','region','user.attribute.region'),('43e4a656-432a-41e0-b3ed-93662597d637','street','user.attribute.street'),('43e4a656-432a-41e0-b3ed-93662597d637','true','userinfo.token.claim'),('44a248f0-8ee7-4ccc-9ab1-2d4b03f76808','true','access.token.claim'),('44a248f0-8ee7-4ccc-9ab1-2d4b03f76808','family_name','claim.name'),('44a248f0-8ee7-4ccc-9ab1-2d4b03f76808','true','id.token.claim'),('44a248f0-8ee7-4ccc-9ab1-2d4b03f76808','String','jsonType.label'),('44a248f0-8ee7-4ccc-9ab1-2d4b03f76808','lastName','user.attribute'),('44a248f0-8ee7-4ccc-9ab1-2d4b03f76808','true','userinfo.token.claim'),('46cfc9ba-1187-447a-a4d8-9ada69bbda67','true','access.token.claim'),('46cfc9ba-1187-447a-a4d8-9ada69bbda67','middle_name','claim.name'),('46cfc9ba-1187-447a-a4d8-9ada69bbda67','true','id.token.claim'),('46cfc9ba-1187-447a-a4d8-9ada69bbda67','String','jsonType.label'),('46cfc9ba-1187-447a-a4d8-9ada69bbda67','middleName','user.attribute'),('46cfc9ba-1187-447a-a4d8-9ada69bbda67','true','userinfo.token.claim'),('4c8dd460-f093-4929-a6df-d5972bbb05fa','true','access.token.claim'),('4c8dd460-f093-4929-a6df-d5972bbb05fa','groups','claim.name'),('4c8dd460-f093-4929-a6df-d5972bbb05fa','true','id.token.claim'),('4c8dd460-f093-4929-a6df-d5972bbb05fa','String','jsonType.label'),('4c8dd460-f093-4929-a6df-d5972bbb05fa','true','multivalued'),('4c8dd460-f093-4929-a6df-d5972bbb05fa','foo','user.attribute'),('531bdd90-0d7c-4399-bdf1-1af6a190a750','true','access.token.claim'),('531bdd90-0d7c-4399-bdf1-1af6a190a750','family_name','claim.name'),('531bdd90-0d7c-4399-bdf1-1af6a190a750','true','id.token.claim'),('531bdd90-0d7c-4399-bdf1-1af6a190a750','String','jsonType.label'),('531bdd90-0d7c-4399-bdf1-1af6a190a750','lastName','user.attribute'),('531bdd90-0d7c-4399-bdf1-1af6a190a750','true','userinfo.token.claim'),('55b7eb1b-697d-40ae-bed2-f2c2cc9fd9ed','true','access.token.claim'),('55b7eb1b-697d-40ae-bed2-f2c2cc9fd9ed','true','id.token.claim'),('55b7eb1b-697d-40ae-bed2-f2c2cc9fd9ed','true','userinfo.token.claim'),('58355a7f-97b3-45de-bbd5-b56aa98d5598','true','access.token.claim'),('58355a7f-97b3-45de-bbd5-b56aa98d5598','middle_name','claim.name'),('58355a7f-97b3-45de-bbd5-b56aa98d5598','true','id.token.claim'),('58355a7f-97b3-45de-bbd5-b56aa98d5598','String','jsonType.label'),('58355a7f-97b3-45de-bbd5-b56aa98d5598','middleName','user.attribute'),('58355a7f-97b3-45de-bbd5-b56aa98d5598','true','userinfo.token.claim'),('5b3e5ce8-d68f-41f5-afab-9412cfb451ae','true','access.token.claim'),('5b3e5ce8-d68f-41f5-afab-9412cfb451ae','nickname','claim.name'),('5b3e5ce8-d68f-41f5-afab-9412cfb451ae','true','id.token.claim'),('5b3e5ce8-d68f-41f5-afab-9412cfb451ae','String','jsonType.label'),('5b3e5ce8-d68f-41f5-afab-9412cfb451ae','nickname','user.attribute'),('5b3e5ce8-d68f-41f5-afab-9412cfb451ae','true','userinfo.token.claim'),('6c8f3b66-856f-42d5-92b7-51456b515b37','true','access.token.claim'),('6c8f3b66-856f-42d5-92b7-51456b515b37','gender','claim.name'),('6c8f3b66-856f-42d5-92b7-51456b515b37','true','id.token.claim'),('6c8f3b66-856f-42d5-92b7-51456b515b37','String','jsonType.label'),('6c8f3b66-856f-42d5-92b7-51456b515b37','gender','user.attribute'),('6c8f3b66-856f-42d5-92b7-51456b515b37','true','userinfo.token.claim'),('6d24cecb-07d8-47a6-91b9-605d3d555046','true','access.token.claim'),('6d24cecb-07d8-47a6-91b9-605d3d555046','locale','claim.name'),('6d24cecb-07d8-47a6-91b9-605d3d555046','true','id.token.claim'),('6d24cecb-07d8-47a6-91b9-605d3d555046','String','jsonType.label'),('6d24cecb-07d8-47a6-91b9-605d3d555046','locale','user.attribute'),('6d24cecb-07d8-47a6-91b9-605d3d555046','true','userinfo.token.claim'),('7c55cabf-8449-42b0-993d-dbd24c8c6108','true','access.token.claim'),('7c55cabf-8449-42b0-993d-dbd24c8c6108','email_verified','claim.name'),('7c55cabf-8449-42b0-993d-dbd24c8c6108','true','id.token.claim'),('7c55cabf-8449-42b0-993d-dbd24c8c6108','boolean','jsonType.label'),('7c55cabf-8449-42b0-993d-dbd24c8c6108','emailVerified','user.attribute'),('7c55cabf-8449-42b0-993d-dbd24c8c6108','true','userinfo.token.claim'),('84011d5d-407a-4647-a21c-e8ac9a371ba8','true','access.token.claim'),('84011d5d-407a-4647-a21c-e8ac9a371ba8','email','claim.name'),('84011d5d-407a-4647-a21c-e8ac9a371ba8','true','id.token.claim'),('84011d5d-407a-4647-a21c-e8ac9a371ba8','String','jsonType.label'),('84011d5d-407a-4647-a21c-e8ac9a371ba8','email','user.attribute'),('84011d5d-407a-4647-a21c-e8ac9a371ba8','true','userinfo.token.claim'),('86af9834-a293-42ab-b31b-8bbce4a5c3bd','true','access.token.claim'),('86af9834-a293-42ab-b31b-8bbce4a5c3bd','phone_number','claim.name'),('86af9834-a293-42ab-b31b-8bbce4a5c3bd','true','id.token.claim'),('86af9834-a293-42ab-b31b-8bbce4a5c3bd','String','jsonType.label'),('86af9834-a293-42ab-b31b-8bbce4a5c3bd','phoneNumber','user.attribute'),('86af9834-a293-42ab-b31b-8bbce4a5c3bd','true','userinfo.token.claim'),('8dcd4bbc-3183-4856-96ec-770785b7d704','true','access.token.claim'),('8dcd4bbc-3183-4856-96ec-770785b7d704','profile','claim.name'),('8dcd4bbc-3183-4856-96ec-770785b7d704','true','id.token.claim'),('8dcd4bbc-3183-4856-96ec-770785b7d704','String','jsonType.label'),('8dcd4bbc-3183-4856-96ec-770785b7d704','profile','user.attribute'),('8dcd4bbc-3183-4856-96ec-770785b7d704','true','userinfo.token.claim'),('9029acdb-e7a4-4d08-b735-f1aab6f081bd','true','access.token.claim'),('9029acdb-e7a4-4d08-b735-f1aab6f081bd','website','claim.name'),('9029acdb-e7a4-4d08-b735-f1aab6f081bd','true','id.token.claim'),('9029acdb-e7a4-4d08-b735-f1aab6f081bd','String','jsonType.label'),('9029acdb-e7a4-4d08-b735-f1aab6f081bd','website','user.attribute'),('9029acdb-e7a4-4d08-b735-f1aab6f081bd','true','userinfo.token.claim'),('96ed9934-712a-432e-8951-2d6dfe50808b','Role','attribute.name'),('96ed9934-712a-432e-8951-2d6dfe50808b','Basic','attribute.nameformat'),('96ed9934-712a-432e-8951-2d6dfe50808b','false','single'),('994a7fb9-2649-408a-9570-a0f6e0f45e07','true','access.token.claim'),('994a7fb9-2649-408a-9570-a0f6e0f45e07','birthdate','claim.name'),('994a7fb9-2649-408a-9570-a0f6e0f45e07','true','id.token.claim'),('994a7fb9-2649-408a-9570-a0f6e0f45e07','String','jsonType.label'),('994a7fb9-2649-408a-9570-a0f6e0f45e07','birthdate','user.attribute'),('994a7fb9-2649-408a-9570-a0f6e0f45e07','true','userinfo.token.claim'),('99fdc1c5-ddba-4f60-bf7b-9974238a3e0d','true','access.token.claim'),('99fdc1c5-ddba-4f60-bf7b-9974238a3e0d','locale','claim.name'),('99fdc1c5-ddba-4f60-bf7b-9974238a3e0d','true','id.token.claim'),('99fdc1c5-ddba-4f60-bf7b-9974238a3e0d','String','jsonType.label'),('99fdc1c5-ddba-4f60-bf7b-9974238a3e0d','locale','user.attribute'),('99fdc1c5-ddba-4f60-bf7b-9974238a3e0d','true','userinfo.token.claim'),('9e7f1c5b-4026-444c-95e6-059d309814ae','true','access.token.claim'),('9e7f1c5b-4026-444c-95e6-059d309814ae','upn','claim.name'),('9e7f1c5b-4026-444c-95e6-059d309814ae','true','id.token.claim'),('9e7f1c5b-4026-444c-95e6-059d309814ae','String','jsonType.label'),('9e7f1c5b-4026-444c-95e6-059d309814ae','username','user.attribute'),('9e7f1c5b-4026-444c-95e6-059d309814ae','true','userinfo.token.claim'),('a5902e8f-7b2d-4a38-b7c6-df20a7ec8195','true','access.token.claim'),('a5902e8f-7b2d-4a38-b7c6-df20a7ec8195','locale','claim.name'),('a5902e8f-7b2d-4a38-b7c6-df20a7ec8195','true','id.token.claim'),('a5902e8f-7b2d-4a38-b7c6-df20a7ec8195','String','jsonType.label'),('a5902e8f-7b2d-4a38-b7c6-df20a7ec8195','locale','user.attribute'),('a5902e8f-7b2d-4a38-b7c6-df20a7ec8195','true','userinfo.token.claim'),('a6016821-7c3c-4696-9168-9c4fc6b5e426','true','access.token.claim'),('a6016821-7c3c-4696-9168-9c4fc6b5e426','given_name','claim.name'),('a6016821-7c3c-4696-9168-9c4fc6b5e426','true','id.token.claim'),('a6016821-7c3c-4696-9168-9c4fc6b5e426','String','jsonType.label'),('a6016821-7c3c-4696-9168-9c4fc6b5e426','firstName','user.attribute'),('a6016821-7c3c-4696-9168-9c4fc6b5e426','true','userinfo.token.claim'),('a6c0b938-6e0d-4da4-8aab-58d663df491d','true','access.token.claim'),('a6c0b938-6e0d-4da4-8aab-58d663df491d','zoneinfo','claim.name'),('a6c0b938-6e0d-4da4-8aab-58d663df491d','true','id.token.claim'),('a6c0b938-6e0d-4da4-8aab-58d663df491d','String','jsonType.label'),('a6c0b938-6e0d-4da4-8aab-58d663df491d','zoneinfo','user.attribute'),('a6c0b938-6e0d-4da4-8aab-58d663df491d','true','userinfo.token.claim'),('ab3608e5-808f-47b5-a050-c8fd7280cf68','true','access.token.claim'),('ab3608e5-808f-47b5-a050-c8fd7280cf68','resource_access.${client_id}.roles','claim.name'),('ab3608e5-808f-47b5-a050-c8fd7280cf68','String','jsonType.label'),('ab3608e5-808f-47b5-a050-c8fd7280cf68','true','multivalued'),('ab3608e5-808f-47b5-a050-c8fd7280cf68','foo','user.attribute'),('b296c3d6-047f-4f15-bb6c-6fe268b9fe18','true','access.token.claim'),('b296c3d6-047f-4f15-bb6c-6fe268b9fe18','upn','claim.name'),('b296c3d6-047f-4f15-bb6c-6fe268b9fe18','true','id.token.claim'),('b296c3d6-047f-4f15-bb6c-6fe268b9fe18','String','jsonType.label'),('b296c3d6-047f-4f15-bb6c-6fe268b9fe18','username','user.attribute'),('b296c3d6-047f-4f15-bb6c-6fe268b9fe18','true','userinfo.token.claim'),('bafcf8c8-b821-45e3-8786-b0f0176e0612','true','access.token.claim'),('bafcf8c8-b821-45e3-8786-b0f0176e0612','realm_access.roles','claim.name'),('bafcf8c8-b821-45e3-8786-b0f0176e0612','String','jsonType.label'),('bafcf8c8-b821-45e3-8786-b0f0176e0612','true','multivalued'),('bafcf8c8-b821-45e3-8786-b0f0176e0612','foo','user.attribute'),('bec470c2-2434-4f53-a30e-1d7c5a42ff76','true','access.token.claim'),('bec470c2-2434-4f53-a30e-1d7c5a42ff76','updated_at','claim.name'),('bec470c2-2434-4f53-a30e-1d7c5a42ff76','true','id.token.claim'),('bec470c2-2434-4f53-a30e-1d7c5a42ff76','String','jsonType.label'),('bec470c2-2434-4f53-a30e-1d7c5a42ff76','updatedAt','user.attribute'),('bec470c2-2434-4f53-a30e-1d7c5a42ff76','true','userinfo.token.claim'),('bf9a5658-264e-4bdd-be67-d0ff3a8a1de1','true','access.token.claim'),('bf9a5658-264e-4bdd-be67-d0ff3a8a1de1','realm_access.roles','claim.name'),('bf9a5658-264e-4bdd-be67-d0ff3a8a1de1','String','jsonType.label'),('bf9a5658-264e-4bdd-be67-d0ff3a8a1de1','true','multivalued'),('bf9a5658-264e-4bdd-be67-d0ff3a8a1de1','foo','user.attribute'),('c6ef90f0-cb21-4169-b12f-e22323250bbc','true','access.token.claim'),('c6ef90f0-cb21-4169-b12f-e22323250bbc','email_verified','claim.name'),('c6ef90f0-cb21-4169-b12f-e22323250bbc','true','id.token.claim'),('c6ef90f0-cb21-4169-b12f-e22323250bbc','boolean','jsonType.label'),('c6ef90f0-cb21-4169-b12f-e22323250bbc','emailVerified','user.attribute'),('c6ef90f0-cb21-4169-b12f-e22323250bbc','true','userinfo.token.claim'),('d2f69481-af57-4d7d-8868-ae6a60b7071e','true','access.token.claim'),('d2f69481-af57-4d7d-8868-ae6a60b7071e','preferred_username','claim.name'),('d2f69481-af57-4d7d-8868-ae6a60b7071e','true','id.token.claim'),('d2f69481-af57-4d7d-8868-ae6a60b7071e','String','jsonType.label'),('d2f69481-af57-4d7d-8868-ae6a60b7071e','username','user.attribute'),('d2f69481-af57-4d7d-8868-ae6a60b7071e','true','userinfo.token.claim'),('d65159ed-8c4e-441d-8b1e-6c9aa0015711','true','access.token.claim'),('d65159ed-8c4e-441d-8b1e-6c9aa0015711','phone_number','claim.name'),('d65159ed-8c4e-441d-8b1e-6c9aa0015711','true','id.token.claim'),('d65159ed-8c4e-441d-8b1e-6c9aa0015711','String','jsonType.label'),('d65159ed-8c4e-441d-8b1e-6c9aa0015711','phoneNumber','user.attribute'),('d65159ed-8c4e-441d-8b1e-6c9aa0015711','true','userinfo.token.claim'),('e1950d40-ce6c-4478-a397-841ebd098e61','true','access.token.claim'),('e1950d40-ce6c-4478-a397-841ebd098e61','phone_number_verified','claim.name'),('e1950d40-ce6c-4478-a397-841ebd098e61','true','id.token.claim'),('e1950d40-ce6c-4478-a397-841ebd098e61','boolean','jsonType.label'),('e1950d40-ce6c-4478-a397-841ebd098e61','phoneNumberVerified','user.attribute'),('e1950d40-ce6c-4478-a397-841ebd098e61','true','userinfo.token.claim'),('e28fe1b5-492a-427c-8b5b-dab32fdcf962','true','access.token.claim'),('e28fe1b5-492a-427c-8b5b-dab32fdcf962','locale','claim.name'),('e28fe1b5-492a-427c-8b5b-dab32fdcf962','true','id.token.claim'),('e28fe1b5-492a-427c-8b5b-dab32fdcf962','String','jsonType.label'),('e28fe1b5-492a-427c-8b5b-dab32fdcf962','locale','user.attribute'),('e28fe1b5-492a-427c-8b5b-dab32fdcf962','true','userinfo.token.claim'),('e8330bb0-e720-429c-b8d7-96d2db608d20','true','access.token.claim'),('e8330bb0-e720-429c-b8d7-96d2db608d20','phone_number_verified','claim.name'),('e8330bb0-e720-429c-b8d7-96d2db608d20','true','id.token.claim'),('e8330bb0-e720-429c-b8d7-96d2db608d20','boolean','jsonType.label'),('e8330bb0-e720-429c-b8d7-96d2db608d20','phoneNumberVerified','user.attribute'),('e8330bb0-e720-429c-b8d7-96d2db608d20','true','userinfo.token.claim'),('e89d3a85-4ea9-4975-9899-67a0b5c3b3f4','true','access.token.claim'),('e89d3a85-4ea9-4975-9899-67a0b5c3b3f4','resource_access.${client_id}.roles','claim.name'),('e89d3a85-4ea9-4975-9899-67a0b5c3b3f4','String','jsonType.label'),('e89d3a85-4ea9-4975-9899-67a0b5c3b3f4','true','multivalued'),('e89d3a85-4ea9-4975-9899-67a0b5c3b3f4','foo','user.attribute'),('f8fd080c-e6cc-4767-a766-1f354c840609','true','access.token.claim'),('f8fd080c-e6cc-4767-a766-1f354c840609','gender','claim.name'),('f8fd080c-e6cc-4767-a766-1f354c840609','true','id.token.claim'),('f8fd080c-e6cc-4767-a766-1f354c840609','String','jsonType.label'),('f8fd080c-e6cc-4767-a766-1f354c840609','gender','user.attribute'),('f8fd080c-e6cc-4767-a766-1f354c840609','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','5ba90ecf-7dac-4c04-b2be-19ea7afe2eee',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','77d77a8a-082f-46c5-b06f-121b0559924d','1b1dd3d0-ed6d-4054-97e7-f6349e35ceed','f18dc3de-fd3b-4957-abf1-2acbb972a2c4','fdd2fba9-4608-4c69-9b57-e24b39f9ade6','82927845-0995-4ac9-a18e-bac570dde46a',2592000,_binary '\0',900,_binary '',_binary '\0','72891068-e28a-4b1e-8163-8e0027f1e900',0,_binary '\0',0,0,'7c39290d-63fe-442f-b43f-3ed989fc6aa7'),('my_realm',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'my_realm',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','b0fcddf1-943f-432f-bc29-14d47503a0ee',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','cf2ff9c2-837b-486e-a84e-82b4f7a869f6','98b56f97-ef53-4152-9f49-630beb95c85e','d38d65a9-83f1-4abb-8f73-a0dc1b501fb9','9a7a2b97-24c2-4ed8-b15c-b555eedc82f3','f8a74798-3b62-4eea-8669-7361969715c6',2592000,_binary '\0',900,_binary '',_binary '\0','d91b075d-ec7b-41b2-8ca3-c53710ee365d',0,_binary '\0',0,0,'de2eee6b-d9eb-456d-9805-86e8be6b48a3');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('actionTokenGeneratedByAdminLifespan','my_realm','43200'),('actionTokenGeneratedByUserLifespan','my_realm','300'),('bruteForceProtected','master','false'),('bruteForceProtected','my_realm','false'),('cibaAuthRequestedUserHint','my_realm','login_hint'),('cibaBackchannelTokenDeliveryMode','my_realm','poll'),('cibaExpiresIn','my_realm','120'),('cibaInterval','my_realm','5'),('defaultSignatureAlgorithm','master','RS256'),('defaultSignatureAlgorithm','my_realm','RS256'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','master','30'),('failureFactor','my_realm','30'),('maxDeltaTimeSeconds','master','43200'),('maxDeltaTimeSeconds','my_realm','43200'),('maxFailureWaitSeconds','master','900'),('maxFailureWaitSeconds','my_realm','900'),('minimumQuickLoginWaitSeconds','master','60'),('minimumQuickLoginWaitSeconds','my_realm','60'),('oauth2DeviceCodeLifespan','my_realm','600'),('oauth2DevicePollingInterval','my_realm','5'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespan','my_realm','5184000'),('offlineSessionMaxLifespanEnabled','master','false'),('offlineSessionMaxLifespanEnabled','my_realm','false'),('parRequestUriLifespan','my_realm','60'),('permanentLockout','master','false'),('permanentLockout','my_realm','false'),('quickLoginCheckMilliSeconds','master','1000'),('quickLoginCheckMilliSeconds','my_realm','1000'),('waitIncrementSeconds','master','60'),('waitIncrementSeconds','my_realm','60'),('webAuthnPolicyAttestationConveyancePreference','my_realm','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','my_realm','not specified'),('webAuthnPolicyAuthenticatorAttachment','my_realm','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','my_realm','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','my_realm','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','my_realm','false'),('webAuthnPolicyCreateTimeout','my_realm','0'),('webAuthnPolicyCreateTimeoutPasswordless','my_realm','0'),('webAuthnPolicyRequireResidentKey','my_realm','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','my_realm','not specified'),('webAuthnPolicyRpEntityName','my_realm','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','my_realm','keycloak'),('webAuthnPolicyRpId','my_realm',''),('webAuthnPolicyRpIdPasswordless','my_realm',''),('webAuthnPolicySignatureAlgorithms','my_realm','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','my_realm','ES256'),('webAuthnPolicyUserVerificationRequirement','my_realm','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','my_realm','not specified'),('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','my_realm','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.contentSecurityPolicyReportOnly','my_realm',''),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','my_realm','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xContentTypeOptions','my_realm','nosniff'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xFrameOptions','my_realm','SAMEORIGIN'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xRobotsTag','my_realm','none'),('_browser_header.xXSSProtection','master','1; mode=block'),('_browser_header.xXSSProtection','my_realm','1; mode=block');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('master','jboss-logging'),('my_realm','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','master'),('password','password',_binary '',_binary '','my_realm');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('05ec4677-8779-4ed6-a8ac-2d526f9b8b13','/realms/master/account/*'),('35ff55ed-6b05-4f1d-9a45-4d37686fceb0','/admin/master/console/*'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','http://localhost:8081/*'),('407df944-fb12-4eee-9717-f4d30985a2dc','/realms/my_realm/account/*'),('428a10e5-2a55-4755-98d8-33eacea29622','/realms/master/account/*'),('a2e55aff-efe4-4a48-821a-d1fc1b5c9b74','/realms/my_realm/account/*'),('f77b567f-3e3b-4e33-96d9-2f020100279c','/admin/my_realm/console/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0837cde9-618e-4b11-8ec9-39c9f6f23ea6','delete_account','Delete Account','my_realm',_binary '\0',_binary '\0','delete_account',60),('212a81f4-bcd0-4557-9f53-8bed3744274f','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('39f76f36-8499-4250-9943-e8f87597ca05','UPDATE_PASSWORD','Update Password','my_realm',_binary '',_binary '\0','UPDATE_PASSWORD',30),('45190c6c-911c-4a43-832f-912dc2370c2f','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('53445c73-611b-40f3-8b3a-227a73fccd24','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('5431e81b-da2e-43ae-b6b0-7cada447cada','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('62564ed8-a246-4308-b7f3-2fcc01e86e4e','CONFIGURE_TOTP','Configure OTP','my_realm',_binary '',_binary '\0','CONFIGURE_TOTP',10),('6eec2270-9dd4-4b4c-b5c5-8f356ecea6f7','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('899a070b-3121-4fe8-b017-ccf3c468a255','terms_and_conditions','Terms and Conditions','my_realm',_binary '\0',_binary '\0','terms_and_conditions',20),('a118753b-5323-4e92-9873-19786ae4d8af','update_user_locale','Update User Locale','my_realm',_binary '',_binary '\0','update_user_locale',1000),('ac5559d4-37d9-40f0-9114-5e2480ae968f','VERIFY_EMAIL','Verify Email','my_realm',_binary '',_binary '\0','VERIFY_EMAIL',50),('b20c511f-2ef5-4841-bff2-e53ab83812f5','UPDATE_PROFILE','Update Profile','my_realm',_binary '',_binary '\0','UPDATE_PROFILE',40),('b2ce0c01-4e54-47ad-b5a2-d5f71f89f072','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('edde3aa0-1fed-497d-a6f2-81f32631eb6b','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('a2e55aff-efe4-4a48-821a-d1fc1b5c9b74','055f6272-a29d-4033-8319-0a7fd720db17'),('428a10e5-2a55-4755-98d8-33eacea29622','2bc5fb9b-e7ce-49a4-913d-25081356eda2');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('136022cc-a27a-4172-befd-3895e1f4141a',NULL,'a36d852d-04ec-460e-9102-b005cd3486d3',_binary '\0',_binary '',NULL,NULL,NULL,'my_realm','demo',1667891157092,NULL,0),('21003e73-dd47-4dbb-beb9-0a1d6155ad63',NULL,'4f081710-9ef8-4ae6-9b23-ac833ef0a379',_binary '\0',_binary '',NULL,NULL,NULL,'my_realm','user',1667891117601,NULL,0),('9fe3e27f-5aac-4f71-9cf5-9728e8df2502',NULL,'182a0554-3522-444c-a053-d685ced54385',_binary '\0',_binary '',NULL,NULL,NULL,'master','admin',1667891018670,NULL,0),('c8c87b33-d40d-42ee-a836-75862c3dac22',NULL,'d2bc1037-dee7-4476-bfb1-60769055bbc3',_binary '\0',_binary '',NULL,NULL,NULL,'my_realm','admin',1667891089493,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('88c79822-07c7-40f2-b567-b7bc5040a869','136022cc-a27a-4172-befd-3895e1f4141a'),('de2eee6b-d9eb-456d-9805-86e8be6b48a3','136022cc-a27a-4172-befd-3895e1f4141a'),('88c79822-07c7-40f2-b567-b7bc5040a869','21003e73-dd47-4dbb-beb9-0a1d6155ad63'),('de2eee6b-d9eb-456d-9805-86e8be6b48a3','21003e73-dd47-4dbb-beb9-0a1d6155ad63'),('137679c0-4006-4043-b09e-4e8d1df6ecb7','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('20397f26-6df4-4ce3-8269-4bb4c2074da0','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('21073c4b-5b0f-46ad-9498-f32bcdfb0536','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('2903830f-5fc8-4799-b3ab-a9d25f2d3351','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('330841fb-d675-46e2-8c34-47a7198a7281','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('335f6e01-f684-4117-b0b0-66fa58609d22','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('52414ef3-c15b-4dad-af8a-2b66f3d8fe50','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('6865554d-0386-49b6-9f0f-a12ee2e3035d','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('6a3950f5-9256-47dd-b58c-c632d2b21b7e','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('75197aca-3c05-4650-8d0a-0a7649c70b06','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('7c39290d-63fe-442f-b43f-3ed989fc6aa7','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('86d6c462-1417-49fb-8b82-f0de5a0a7dc2','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('8f1abc0a-2769-44df-a441-ba21e4a22756','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('94b416aa-2b6c-4d2d-8ffd-a3ed17cc5bf2','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('c30b6224-daf9-4940-87d6-ee0a832000c9','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('d0052cbe-2cf1-405c-9c0c-fe3ce3311b41','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('d4b382f1-e9a9-4e69-ab2e-6936ee837064','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('d89c6034-7944-40cc-8854-87bddee1e81f','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('e509e0a4-7cac-4b15-ac02-ff8e936ee334','9fe3e27f-5aac-4f71-9cf5-9728e8df2502'),('8198a814-19e6-4fec-95d6-7c8594e1747d','c8c87b33-d40d-42ee-a836-75862c3dac22'),('88c79822-07c7-40f2-b567-b7bc5040a869','c8c87b33-d40d-42ee-a836-75862c3dac22'),('de2eee6b-d9eb-456d-9805-86e8be6b48a3','c8c87b33-d40d-42ee-a836-75862c3dac22');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('35ff55ed-6b05-4f1d-9a45-4d37686fceb0','+'),('3ded5560-f942-4b34-8f38-5dc8a32abc2e','http://localhost:8081'),('f77b567f-3e3b-4e33-96d9-2f020100279c','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-19 12:02:59
