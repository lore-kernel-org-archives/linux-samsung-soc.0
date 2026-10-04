Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010050.outbound.protection.outlook.com [52.101.84.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA814A5EDC;
	Sun,  4 Oct 2026 20:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145075; cv=fail; b=Ak8WSXJsKkDfiyuM1d0oZ8piyww4XBNnPN3/6H9tJdP6ifFv/e+tlu8hwT8hgLf6Vo7iEyZbVYOfoYfR+o2/KGY77dWqBKTHx9B8AEvM9Dz0hFKK0QT+en4v3kuBWx+CR7qGxXNZ2ngVSBtK1PvrqB/n1cZ7YQdg5gBhWKStz/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145075; c=relaxed/simple;
	bh=jHEjOv97lgsv6AQquPw6bPFmhlvuIt7C3xZ1jjfZ1UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bkpwNuuZSALtyo5HOqwBGF2ihoDiZH7oA9WLWmRc3t3itqsIYCZMpz1yO+v/NVen+2/NwmjzaV4psGj42tT5mEwcBLuXofo7anACHLsYBQt2dT66Vdh96eHatQqOtozIlcC+6345fw1k+V97RLpV+0ZRELhEMNS3iV264SjfhDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=ow1ejFwj; arc=fail smtp.client-ip=52.101.84.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="ow1ejFwj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNU6PsBXjr6qvyEDbd9nvdajqVIjFamDZo9HpDbKNGO4lFHP9ypcZI8FOD2N3LonWkf4o3HjDfo/c8TO7BtB6X598jpkEGNWMruEdmOsb2wBmuNoBT0cNip/zZ9AvJrllW+G5KXcPQ9IXi807yrSr3cZG760W6L/aqeza/Bpd9XQe9q20H518gYPIk+v3YvKYvjgw3VMywc23YyddaD90kO/qs1PBn3QN9X85I+RdNmHKel7Zg7IJmhamNhmryQJkLBq4tRgoxmG5ZTgiBFqginbwzcqhm9WVOpR8/pppLv0nLJZSeK3fJ729m2vyPhpRdYQMkNEI0f893WreE5ABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0TzU/95uskboWjItlmFUA2DDko2UkLtMPoW5S3lpfA=;
 b=cc0VVmuxAVVrXoS0Yj6FjOibmDcE2McnKFAIqc+scCENKDTnEBYb5A20Iy5UKKxqgNA2TigaM2kmpEdjbxP7h4prz9hTcFc+rocu6AxGmp3BP7UCndTs6DPDmC4HYGDMQ2n4knZkH07i1hIzTUja0ln4GPKcHqhjhZZds85aJPmUsIjHItb1j7o/baWqKjxVfa5zCdZ/3/TqSYdFtN0NUryoSpTGOBIJ1pOxua/r+2lmNeE7dMq4QtxPE3dTayhTVj2kdhhyXMJy4kX+LRm0xraQW7tlU+vo/x7WpakwDvySoL9cgRMcwG5C3ORSkRm1P3wSultIpcCiRQ3ZFynKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0TzU/95uskboWjItlmFUA2DDko2UkLtMPoW5S3lpfA=;
 b=ow1ejFwjFlJR6eFpo3+C5W9UsJB9nqP1Y4EGfm1RDUtAfIZv5A5hu6pYrV2mCbEthE0aky0pmYE+mmFJ9lP49LanwRnhW35YYDwa/ELwnVla8YD0QygsLta3S/VU6aVq3F/+q4aD24S1e8iV+RH+l0IAIGngdENLEA3cTRu0UjI=
Received: from DU7P194CA0014.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::31)
 by AM0PR02MB5857.eurprd02.prod.outlook.com (2603:10a6:208:183::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Sun, 4 Oct
 2026 20:17:42 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::62) by DU7P194CA0014.outlook.office365.com
 (2603:10a6:10:553::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:42 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:41 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:41 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6E6F81467;
	Sun,  4 Oct 2026 22:17:41 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id 250A78039B99; Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:12 +0200
Subject: [PATCH 15/17] ARM: dts: samsung: exynos4210-smdkv310: sort
 properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-15-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2555;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=jHEjOv97lgsv6AQquPw6bPFmhlvuIt7C3xZ1jjfZ1UQ=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrRBT8vYdTWAIFQXH0ULtJXSCW9lgdHr+sZRR
 TppvkA41JiJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0QQAKCRCwB25JC3Fh
 axzyB/9nL5blRXzShnSaoBWKks8WAZYtM16mdmA6MYLWCxObHPlhYUpXP5/06uVbwnjBi+PoDya
 NRVuzk0Rg2eEpmRc9z8gKrorvHauE1QyaMKNU/DgBW6SUIjRZXvwOnq2BBQKvQnYss1ewHaj/J9
 9qodW2bbfcmxKPQFv/wGGTFBQf0EQK5XtfYMV9vB48gV99YRJvKdpJOgOF/6YGGeL0BydPTVuoU
 tfAG+wmwnOT4cjc5Ax6CWvm9kEnkoyiC2H3Den0XtBsq+hdol8GvoJmNdg2uoaVitgIa5fq5Coz
 teoq3CJerk0BGe4lHaZRsECcjs5zF4khRCvPj/p997139EDO
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|AM0PR02MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa6b867-423a-4fda-1efd-08df22548b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|30052699003|1800799024|376014|82310400026|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Jks678ZKrwENAQX1fdU1EJ+5ZFhJxX8sNpsfoj0sJ5csQe5hhnpuEo0s2mxYEIcTVaH4AJ1F9iELM4+2AnXFMym9vJWov0T55mRfL+LSbla/E6nkICNcFOOK+o9bKnl9VQnYl2hasgDc+bnBo+YpQCYwYqvAICubBTNMVHZK3xyh5l5DpCp82KVlJoDIjC0570cxoanD7OzYZ6uAYuxqRfYf+vwMsfwRQEXl7eJm5QtoT766Ksh+01M4DPZ75Oy+6s8kYopMoLIZT7kDFU1iMyWQ4q47QqGb9DzsNAX9Tyn6fxQfngL7ncF08KjZtVnh3Wl3JlrAZ5jJ2mnRITmlaOg0k/joAr+jAsuOUD46COxuWuo2mdSwuBmMyrtG2e5SIHPSmHoGBNjLVD5RGpgDOy+RMZm6F2VbMKZMyF1DFQrNOaUxWLCxWEOxHDSkRfSWLAbV7J44EI9K0yZdVjRuAPoyNor4pGHt4veDQ0vlawcLWXP8/2QBgfzToPBX/dGxCFNRYhnN/n82OHHXhxZJy6674zBxPhl0fJ6UigF/G3GqgzPe4WiPhy4946Evm1+4q691iQK6sxMwuI0MauqXhMTus6Azwyuwy4Y48iB1SvjHwei3CqjJLjGdlxSitq7htjApBWeaXjicE/9425bSPF4Ur2Nwnt9J5YTDWdKlNHt1JD5VjKjx9868PENt4KNGQkkYEFrLS2mPcKz7rwBvmg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(30052699003)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E06Cm88JH/9CXvGwWKjxgRJomezbaiAYSWijtqG2ulP64m7mH1NNGutf9UDz8EhaFzh9mEpkmeopFK8jcF9m9KVB/2VnfSe+W1JEi13bF82Ze0dwWhqs4yPAg3a7k7FfwWhNlMiKMuHqty8MtCtWZ2y1yAH35B8mRpPZYESq7VAIRM1nfu36OVcANr+LzGpCheefFE4Z2BeyPdoL4TIcw8zXFHR4J3p9DDPnp781QBMJBmLwLeKEm2rxVIZOMKyX7GMOe6Hj1LilxaKH5jo0LhsDuM/xi4vmws5ru1VKmYRVlCUXuouFbUB0RML+W3fH956VYMNwDcOOTcUDv2BU8JXisOOBsFYB+9e1aZwWWmYERrhnPrW/0DPPf5o9MwFPegaGSrz1q0QJZTEJgOeKYOSfO40EuEFidzShB53RJzclaecjzKd6W87q3UcWgrRY
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:42.1126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa6b867-423a-4fda-1efd-08df22548b6c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5857

And add or delete newlines where applicable, and sort properties
according to the preferred style. Fixes warnings from dt-check-style
like:

  samsung/exynos4210-smdkv310.dts:90: [property-order] property 'wakeup-source' out of canonical order (should sort before 'linux,input-no-autorepeat')
  samsung/exynos4210-smdkv310.dts:91: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
  samsung/exynos4210-smdkv310.dts:93: [required-blank-lines] "status" must be preceded by a blank line

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
index a6b73a8967c6..609853bb840a 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
@@ -60,6 +60,7 @@ map0 {
 			/* Corresponds to 800MHz */
 			cooling-device = <&cpu0 2 2>;
 		};
+
 		map1 {
 			/* Corresponds to 200MHz */
 			cooling-device = <&cpu0 4 4>;
@@ -70,6 +71,7 @@ map1 {
 &i2c_0 {
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <100000>;
+
 	status = "okay";
 
 	eeprom@50 {
@@ -84,12 +86,13 @@ eeprom@52 {
 };
 
 &keypad {
+	wakeup-source;
+	pinctrl-0 = <&keypad_rows &keypad_cols>;
+	pinctrl-names = "default";
 	samsung,keypad-num-rows = <2>;
 	samsung,keypad-num-columns = <8>;
 	linux,input-no-autorepeat;
-	wakeup-source;
-	pinctrl-names = "default";
-	pinctrl-0 = <&keypad_rows &keypad_cols>;
+
 	status = "okay";
 
 	key-1 {
@@ -177,8 +180,9 @@ &rtc {
 
 &sdhci_2 {
 	bus-width = <4>;
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
@@ -200,13 +204,14 @@ &serial_3 {
 
 &spi_2 {
 	cs-gpios = <&gpc1 2 GPIO_ACTIVE_HIGH>;
+
 	status = "okay";
 
 	flash@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
 		compatible = "winbond,w25x80", "jedec,spi-nor";
 		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 		spi-max-frequency = <1000000>;
 
 		controller-data {
@@ -214,14 +219,14 @@ controller-data {
 		};
 
 		partition@0 {
-			label = "U-Boot";
 			reg = <0x0 0x40000>;
+			label = "U-Boot";
 			read-only;
 		};
 
 		partition@40000 {
-			label = "Kernel";
 			reg = <0x40000 0xc0000>;
+			label = "Kernel";
 		};
 	};
 };

-- 
2.43.0

