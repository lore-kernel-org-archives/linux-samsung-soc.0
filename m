Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010068.outbound.protection.outlook.com [52.101.69.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB594A6897;
	Sun,  4 Oct 2026 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145041; cv=fail; b=NGOulJ8BR/xGRKGL4JSWS4D1uTexwPSO7G6sz3FMBJY7WAGJQsnKt1LHXdmB6wStAjJguXnrN/LeB0GB2xGDLkb+Cp77dMAlSahZ1Ws8FUxxDd6u7H11fi+tqxD+W91zwRFTeThpyWyEUQnyOaNNOaHFlUb9Ai+ptJ/iPhyqdQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145041; c=relaxed/simple;
	bh=DaYtl3gAOpmcudyLZsqwuWU+FH7+McQd6ybF+24p3gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=POTJUJxEPb2n/iVlKA7MiOgJAtvYJ+2WTeUVHlpizG/6jrgjsK9qyJUkVWrtdKm1RCmmXfKYvox54Nr5Q/WnLKvjyPeKj1FzG6o9s5UZBi+mmi/v2YbBMyesHJ0dMyjfO576l7f24ZV5zA7d90zcoFO35U2PYMMK+YlzTCY5TBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=HcjZA5vk; arc=fail smtp.client-ip=52.101.69.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="HcjZA5vk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uy/uwG9vopal8MlM4Qw2s3azNkTg75sVh0/a4uODvjPrPsUjRhhGWgaVYh3kXmwtJr55F6dESt1B9jWL+i2X9AbTogajxiOBCTEyWH3KkufNeXGWNGLAye1IprSCq4dcslG2HhsGJdjIXiM5lkXPBS6V8WSYLyMVRkFU9dF6ntK8pFiK5ZHzwSnvhnlkkmFmWT0fGye3Z0bxq0GxNgKlBTP0wPx218TfbRwl4yY9qAwz4evP1RU/JSzX57kpoO3Zcp/YvX8MMq99DyVwI876yYfQnhvUJ18Ub3yBW9mJ1Z6GC5u9hTcK57EAuD1E6vSAEM929UZQsece3o1EOEaZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5p+OpphxSVpMgtxT944ASlf3h3HGnIn0+AZAZYBx1o=;
 b=wbnk0DjT1yzco2ovKX2pih8nNM/FBHc56Y1Gj77RznhQ29eCigyf3HZt/GTQzM5dA6utPJkrQE5FFFVV+LrWwkMzY8DPt6KeSYont+f+qexiu3PCCvaQE1f8Hm9keQlN5D/XOdMziaZ/k/V9Q7xeqeuVazeoUwizeYm+MKTa5QtbSJBsjrHHt76HOw1y9Iy3AMC0o/cCRfJptgvgOzM5U/1ghZlREhqAvVczkpjQ3XTXMaPhINCMWdvhfDWHa7jM+xyDrdZpJkSAtCwIkHEBznVXYxmz4Z257azIDRtKH1KMgHHXdlhjvrtRI+7wgK1fwDFKpyJj6axIOwmBuVXXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5p+OpphxSVpMgtxT944ASlf3h3HGnIn0+AZAZYBx1o=;
 b=HcjZA5vkHiXAII4hp09u0lljZj/kTtwNsqxlSQ+by2V9yiByHSR9d3wfPCwTLY3Jfk1su+TTHOx9iNC7gvh0SYBMqBLKbX6RChqyFwynT1f67pUHG2vR+W9MCAGAIzFqXbKxNZROVhMWbVlELtJ+dsjDhRzNBsPnfxe14t7AC9w=
Received: from DUZPR01CA0294.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::13) by GV2PR02MB9637.eurprd02.prod.outlook.com
 (2603:10a6:150:dd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 20:17:14 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::a2) by DUZPR01CA0294.outlook.office365.com
 (2603:10a6:10:4b7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:13 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7BE4117DE;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id 1D78D803CDCD; Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:10 +0200
Subject: [PATCH 13/17] ARM: dts: samsung: exynos4210-origen: sort
 properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-13-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3932;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=DaYtl3gAOpmcudyLZsqwuWU+FH7+McQd6ybF+24p3gw=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQ964UR76t/CEtwyyeMtYau4W1xMO0HOJxS0
 HCxVm+m2iyJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0PQAKCRCwB25JC3Fh
 a0RmB/499fsYVHNXyW0pQWL7j9Dci3KjYAfVlPZgCJ5BLC3Kki3osN2NpizAHngk2TDkXjDnSLA
 dSWyFtfFzRpCq/CUIBuvyzZao5rH7VfjykUSqjTz1DeHAihlRi1jUwHvd8kyRCjOZweNHwergfe
 UXaRaLvLKx8nVEA+AYreeCOZExrdIIwVVrrtv1R/mHerdxB7xPVBns3mMPp5123TbcVZ7nqciML
 pEIOGjsg0jL7xxS3EjidxtKpADnQHgzgboEM3uGyWDmtbK4G5KNqaMFsunXV3OTTxDz/v5dJgos
 EStXNmsfCM0Lf+3JEXj+phygIaqeVjMx2ywZQZBfAZTdR2r0
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|GV2PR02MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d44be24-6bf3-4f67-5e99-08df22547a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|30052699003|376014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	TRa61i5ucUJMyeFYvsSIWK6VYpUWmehH5LSxwGmnRTtB15ECI3Eu5RdASpaR2WAgrlTL4HUNpp4w8zR3xto1trZNU8978CWYURSjOUJJguELT/6uMc8937pzhSy5DOlsd2hpf2mXf0L8+Z2kygDWkSGIGdJ4HQOX0V0Q1D8OrpdzzaXMl75I1dPArfFmcmWFUGhFlCGtPQ1xYHFjivfot0NmeVJGULriUz4HTsyEng4N2xZxXSe51gUWQXGpj+SABQDJ3eXYu8KvCmePCsdw3asIEOwPhFR4gqM9bRrXhR9cyvMV/RpTQ+m/ndeoCXeLnODJzWafIvw4chuXvPVHbGUqh+Vpnf+f3ZthCmchgQf6gHrGS2iBPiSKj9O6bTA+0EVBvDo+yj2bPyF7DEM9MlQ8VcBaO7b9VXqqia6ghhZaZ/WXMKMlhnseQMm4w+RZQ6y48Zsi5AFYWuoTFauqmFBGYZC/CD/Y8SN0FX8Zh+jG41234Wqw2mDvXUfnXZEk+OhTHh3vwMEwo4QCDQIZZYQctHlaSqtlVIdHeFrAJ7UCVS/mnHxyUiZECW4uUc/azRoVxOEmZMFDP+rWAVigcA5wE1xc1G1emp5U/h2/ysxXRJ6aaNFbLxlzOrI2/05G+Awye3OXkKPB7WHIOLMZRJJ0IJc88oQND+tu8mAmG/ep/8MXJfOTFBPn84/zBw+vEIHXsOoxaq2OJ8iqZxCq7w==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(30052699003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S4AJv3oR75uZevyxs9mws0zxVsSI+96gTEbN7FWCncqB7w94HumLzorSEiWfWB14trUILuIeY5rtrpEQc/vl0PJRQ/vjEZmPLbFn0o6gE6m/LByExo0DpP8IZ5PJ0Fq5QuHowiuL0NtV5kqPxnChTBrOl3DPKte5DGSsplUcKbPuc5eA7WzLF2USyD5LrQYBzwkGg1f80T9tbOt/UChDHPt8OWcR1bEfsJL9z0om9uwNr1DNe42kXI3IFweOJ0NcRV2/fZqXtcM73dCLZ27YB9tQ4yl2l6mB4MrGxAHnyf2qwBpv++HFWLRcUc68QEyWiGt6TAjWzFr3v8i7P5PexgTMRUm4ROkmYJoGl7Z0KBMhfKgEz42ncKHGQ6YzQKCZuzwazxG8RYPMf1uR2YN19oxfDjCdixL1bKYWbEEaeOQskb/7HeMssjeiNtp2ocQD
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:13.9124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d44be24-6bf3-4f67-5e99-08df22547a9d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9637

And add or delete newlines where applicable, and sort properties
according to the preferred style. Fixes warnings from dt-check-style
like:

  samsung/exynos4210-origen.dts:171: [required-blank-lines] "status" must be preceded by a blank line
  samsung/exynos4210-origen.dts:176: [property-order] property 'samsung,i2c-sda-delay' out of canonical order (should sort before 'status')
  samsung/exynos4210-origen.dts:178: [property-order] property 'pinctrl-0' out of canonical order (should sort before 'samsung,i2c-max-bus-freq')

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210-origen.dts | 30 ++++++++++++++++---------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-origen.dts b/arch/arm/boot/dts/samsung/exynos4210-origen.dts
index f1927ca15e08..78c77d00d138 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-origen.dts
@@ -55,41 +55,42 @@ gpio-keys {
 		key-up {
 			label = "Up";
 			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_UP>;
 			wakeup-source;
+			linux,code = <KEY_UP>;
 		};
 
 		key-down {
 			label = "Down";
 			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_DOWN>;
 			wakeup-source;
+			linux,code = <KEY_DOWN>;
 		};
 
 		key-back {
 			label = "Back";
 			gpios = <&gpx1 7 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_BACK>;
 			wakeup-source;
+			linux,code = <KEY_BACK>;
 		};
 
 		key-home {
 			label = "Home";
 			gpios = <&gpx1 6 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_HOME>;
 			wakeup-source;
+			linux,code = <KEY_HOME>;
 		};
 
 		key-menu {
 			label = "Menu";
 			gpios = <&gpx1 5 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_MENU>;
 			wakeup-source;
+			linux,code = <KEY_MENU>;
 		};
 	};
 
 	leds {
 		compatible = "gpio-leds";
+
 		led-status {
 			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
 			function = LED_FUNCTION_HEARTBEAT;
@@ -118,6 +119,7 @@ pmic_ap_clk: pmic-ap-clk {
 
 	display-timings {
 		native-mode = <&timing0>;
+
 		timing0: timing {
 			clock-frequency = <47500000>;
 			hactive = <1024>;
@@ -142,6 +144,7 @@ map0 {
 			/* Corresponds to 800MHz */
 			cooling-device = <&cpu0 2 2>;
 		};
+
 		map1 {
 			/* Corresponds to 200MHz */
 			cooling-device = <&cpu0 4 4>;
@@ -156,11 +159,13 @@ &exynos_usbphy {
 &fimd {
 	pinctrl-0 = <&lcd_en &lcd_clk &lcd_data24 &pwm0_out>;
 	pinctrl-names = "default";
+
 	status = "okay";
 };
 
 &gpu {
 	mali-supply = <&buck3_reg>;
+
 	status = "okay";
 };
 
@@ -168,23 +173,25 @@ &hsotg {
 	vusb_d-supply = <&ldo3_reg>;
 	vusb_a-supply = <&ldo8_reg>;
 	dr_mode = "peripheral";
+
 	status = "okay";
 };
 
 &i2c_0 {
-	status = "okay";
-	samsung,i2c-sda-delay = <100>;
-	samsung,i2c-max-bus-freq = <20000>;
 	pinctrl-0 = <&i2c0_bus>;
 	pinctrl-names = "default";
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-max-bus-freq = <20000>;
+
+	status = "okay";
 
 	pmic@66 {
 		compatible = "maxim,max8997-pmic";
 		reg = <0x66>;
 		interrupt-parent = <&gpx0>;
 		interrupts = <4 IRQ_TYPE_NONE>, <3 IRQ_TYPE_NONE>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&max8997_irq>;
+		pinctrl-names = "default";
 
 		max8997,pmic-buck1-dvs-voltage = <1350000>;
 		max8997,pmic-buck2-dvs-voltage = <1100000>;
@@ -334,6 +341,7 @@ &sdhci_0 {
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_cd>;
 	pinctrl-names = "default";
 	vmmc-supply = <&mmc_reg>;
+
 	status = "okay";
 };
 
@@ -342,6 +350,7 @@ &sdhci_2 {
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
 	pinctrl-names = "default";
 	vmmc-supply = <&mmc_reg>;
+
 	status = "okay";
 };
 
@@ -362,9 +371,10 @@ &serial_3 {
 };
 
 &rtc {
-	status = "okay";
 	clocks = <&clock CLK_RTC>, <&pmic_ap_clk>;
 	clock-names = "rtc", "rtc_src";
+
+	status = "okay";
 };
 
 &tmu {

-- 
2.43.0

