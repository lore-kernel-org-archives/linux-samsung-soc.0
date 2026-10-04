Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010060.outbound.protection.outlook.com [52.101.84.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082547A89B;
	Sun,  4 Oct 2026 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145041; cv=fail; b=mw+VxIIhqwST4rFlfeqNvIXD8Xvw3ucaSxb4sRqlFOmCfz1k5c/lS50oNKGZc86r7GMr55C5vFxSg5PPW5BfnFW/BwoJ0oDsaMOdo6JhJXDrFHFCJ2BEkzAb/N5e2vj68dsY5VY2NOaxPmhLQ/AH6OapFa8o901RCMNgZzkATqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145041; c=relaxed/simple;
	bh=155hOZToryhTQVwsTExUuBBKOpX2mJ6uFedNiltgP8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Q6mslkpyzf1wQUTZqY+97h6LWnVT+sIipl7YNJvDPiTdgEB9zmLHrqyMCdmBdZ+1WjQWFBAQ6b+n8HdFNRiGmOI03atgiBNq7t5aNPwcSPYEjMaelghna9c5yyaVF2ettjW2lIpPrnqygNOPFjfZ3hfRWTBVCVA5L4tO7hfl3kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=EmPlFGXD; arc=fail smtp.client-ip=52.101.84.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="EmPlFGXD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzKDfSvRRUFDHsJ87C8jbWyEKxKwzmGli+lXW6WLzLySJPmDtgJOCUcLSWb5nQvN8itsgjCunQUXb/LM/g12K2vg5S/XkN+XzV+2EsLZHjGm9btOkYDVpaoykxjgq0Ke7hHBJnu3+uC8f53dvk36eCGun54NT2jq8qqHzKxdLNYeRPHoNtnaSk7aVFF2arbFqFwrqi07AEmUkPc4jSJLGxP4XwRR2iTV1ZgUVytkix/EpAtHXzxbze3eqawDlgBavlTfYWN4xXiKO/k68B0pG362jemVDA96ocq2jUCm4ph0t2EI2cU0FOVQ4mSQCcSFBfTWp6ky8xzU2gK1Q8Y3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHP/J59+E8YDwyyYeW2J97OeTqPD4JvCsWYeUWKz014=;
 b=Vi4fwUgbi8q4cfAkqG+Widp8ScvgdMcPdwY+zRBhWD1Um9a5vcdDMyqSZ4PYv2X/j5Lz415D9Sj090T71GdiJWmOdktztJdu4x8BHl4aASUi2XjLOQll+XLmz/bHmEHqbeZX05qfdC1hPsyLcFJbriPo3MCjJzanF+7c3h+T8Hjr8rIuXcLPw3Yl9xfFqatAzmiXhTrIiMyjcLs+AnQgjyMgsgW8DvNFh3bg8I61Yj5dKCKbCPJmHQ8FHfjM90ZfkTF61GhEHV2qG2W22nVCTCYyZiUA536Ty9FiEdu9TdaYUdND+61+OkFZ5k9S67EsIwhY6AydeoBhwADba6notw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHP/J59+E8YDwyyYeW2J97OeTqPD4JvCsWYeUWKz014=;
 b=EmPlFGXDxXdfgGicapLJibXw72S+7966laLUG1dJsakrzROgoK8UyA42zzFmQqrZZP5DBUPWBh2bwNeiCItUL4JUjxoFT1gfK7Sgv7OhiwJbqUpf4QG+ssgL1/3DXxlnwmEfeBFbNqpsM04DLb7Ysh+W9rCbcPs89raP4HukrNQ=
Received: from DUZPR01CA0301.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::18) by DU4PR02MB12226.eurprd02.prod.outlook.com
 (2603:10a6:10:62a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Sun, 4 Oct
 2026 20:17:15 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::8f) by DUZPR01CA0301.outlook.office365.com
 (2603:10a6:10:4b7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:15 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7C9094CE7;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id 19D82803CDCC; Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:09 +0200
Subject: [PATCH 12/17] ARM: dts: samsung: exynos4210-trats: sort properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-12-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5847;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=155hOZToryhTQVwsTExUuBBKOpX2mJ6uFedNiltgP8Q=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQ7WbZEat5WQR8HmvWpP+OOYcYSsD4IJjYop
 3uAyj1UZOOJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0OwAKCRCwB25JC3Fh
 a2+MCADKbfLQ3fpXJ9qj0mKu9V8x/T9SjIGeJj9/2/8z6YSMuy21fTA6nZjDuUGHlLHjvy2pUI7
 7h3V76VTibVI+W0XInaOwSGa3NPmBHLL+EUgjHu5edWU8JZQhmQZUUYRzboLgAnV/Vm7skB7vuv
 R+h52BrL1odGWQJZLB+OWsXC/JRd3NhbuUCwxy6i58N8bETInkccahhwVSSOVfYSQugKGkMNRim
 jIdwYQz5rlXf34tblHkNtdJUWatKamYgopMfIOKlcT4VOTnolj4nwvw8vNM6gVNTGMLnA3EVGsl
 CsokHD/H060Vby6GZfv1B1f4wEnva7HDNbYskhXsN3t1ICja
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|DU4PR02MB12226:EE_
X-MS-Office365-Filtering-Correlation-Id: 670d6fa0-11f9-4bae-4ae1-08df22547b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|30052699003|23010399003|376014|82310400026|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ne2VE7nJVmcFAAP9y7q3qIjMNPzkkj+8yLRCihbNdrdR6uo3xhIcnRoPHXu5nTZ66MMahGg3bbcZlc9z3qCQCPQUcrRom4jwEkRx1XnKKbCSQoDlsRRNZuHkxeqInyFrWpkHGhwM95muubBCHOvDaNVBwAJnH0Y5CzX+Kxzosj6m1xrP1vkCc+7CymlYPhE6LkzW1TcZro4W0fp6rF33NKL7yim4ISYLXzecJ1+L/Rv4rqxL9OLDfCXy+0uVM7oLLIqLNfGzxuDlKWDWkfTAeD/YgjtM4fNg6OUrqCEE/uiuEhJ3D0vMKUOnp0NCwV38e1SBfgcUsK/ICv8cuUG9XAWy9vI+62ngC/BfTCBHE3Nc1LgXDGAt0+gzQLOPGfo6DJ3JcbXpIx8YxqwiKrpWQb3uRMisMR0a7rXV3hBoxDSyNQk9ucApcGXBwVp+IR1QUYmvmh5R2HQQF/N4kcjoQcaQ85bZRKNt8QfVopsFyBi5BmzJLejZoJOk2XjrhvxGy+DAJaqfs5rOzZxW7PrsoiG6FsleEou0kzrE1ZEz7KFkkbj3foVcQlKE3Vhx02/D1v4DxMRDzL/xazf+5AW/fC1pyq3rYfhMTs3s9fz+hgHejm3u/vrbkx1jR7PRaYjv6lSTKIU/oJ+HrCBZHu0048xyw3bkton3CSf+H4bjgYBp7Bn/uQxcrB4/t/oLQmh0vM7lFbZvnFjWqdEoQ+pM4w==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(30052699003)(23010399003)(376014)(82310400026)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DJOk6LHIYH/0ZfzD0KxYUBNDngp852NxC12NPbmQgZaUnUabgqIQL5OOM8VDIg0L/wf0Eah51ZMkcjHjptjy9BsnYTgXYX4DFbRILnOqBhus0bs9ORqOEn4mg6WWWFcvNyWOvet+gp5/qcZK1HqMXMO6pL5jC/VPz8d6j0rmz+J9WmUSOPFsGU1j70uwLVUpW5GeoluS8iKb7quPB+mg5SLRHDTg+p1OKfp1ktbMQiAXrVS8wIRkppA0z+1GhfrusTjeJ8lRajDoLpWzrCKtXdVetcw0u2ql+5lZ8hRhs3Iphbe7yXB7e8oR0ZT1fF2oGxka4dtnysu5dT3XvqhwyoRKVrgftnrsdApOJb+eafpLoa8LDeCM1vt4eVH2Rf9RO6RA1oB9Q5OAtFAZOl4tf8xuOsGM9OpEu8cxNDxlZjPThumWHfZIEZssFTRieYpc
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:15.4573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 670d6fa0-11f9-4bae-4ae1-08df22547b89
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB12226

And add or delete newlines where applicable, and sort properties
according to the preferred style. Fixes warnings from dt-check-style
like:

  samsung/exynos4210-trats.dts:122: [property-order] property 'label' out of canonical order (should sort before 'linux,code')
  samsung/exynos4210-trats.dts:179: [required-blank-lines] "status" must be preceded by a blank line
  samsung/exynos4210-trats.dts:183: [property-order] property 'compatible' out of canonical order (should sort before 'reg')

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210-trats.dts | 60 ++++++++++++++++----------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-trats.dts b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
index 20fe148387fc..8d4ebcf86775 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
@@ -96,31 +96,31 @@ gpio-keys {
 
 		vol-down-key {
 			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
-			linux,code = <114>;
 			label = "volume down";
 			debounce-interval = <10>;
+			linux,code = <114>;
 		};
 
 		vol-up-key {
 			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
-			linux,code = <115>;
 			label = "volume up";
 			debounce-interval = <10>;
+			linux,code = <115>;
 		};
 
 		power-key {
 			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
-			linux,code = <116>;
 			label = "power";
 			debounce-interval = <10>;
 			wakeup-source;
+			linux,code = <116>;
 		};
 
 		ok-key {
 			gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
-			linux,code = <352>;
 			label = "ok";
 			debounce-interval = <10>;
+			linux,code = <352>;
 		};
 	};
 
@@ -163,6 +163,7 @@ map0 {
 			/* Corresponds to 800MHz at freq_table */
 			cooling-device = <&cpu0 2 2>, <&cpu1 2 2>;
 		};
+
 		map1 {
 			/* Corresponds to 200MHz at freq_table */
 			cooling-device = <&cpu0 4 4>, <&cpu1 4 4>;
@@ -176,11 +177,12 @@ &dsi_0 {
 	samsung,burst-clock-frequency = <500000000>;
 	samsung,esc-clock-frequency = <20000000>;
 	samsung,pll-clock-frequency = <24000000>;
+
 	status = "okay";
 
 	panel@0 {
-		reg = <0>;
 		compatible = "samsung,s6e8aa0";
+		reg = <0>;
 		vdd3-supply = <&vcclcd_reg>;
 		vci-supply = <&vlcd_reg>;
 		reset-gpios = <&gpy4 5 GPIO_ACTIVE_HIGH>;
@@ -209,40 +211,45 @@ timing-0 {
 };
 
 &exynos_usbphy {
-	status = "okay";
 	vbus-supply = <&safe1_sreg>;
+
+	status = "okay";
 };
 
 &fimc_0 {
-	status = "okay";
 	assigned-clocks = <&clock CLK_MOUT_FIMC0>,
 			  <&clock CLK_SCLK_FIMC0>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	status = "okay";
 };
 
 &fimc_1 {
-	status = "okay";
 	assigned-clocks = <&clock CLK_MOUT_FIMC1>,
 			  <&clock CLK_SCLK_FIMC1>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	status = "okay";
 };
 
 &fimc_2 {
-	status = "okay";
 	assigned-clocks = <&clock CLK_MOUT_FIMC2>,
 			  <&clock CLK_SCLK_FIMC2>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
-		assigned-clock-rates = <0>, <160000000>;
+	assigned-clock-rates = <0>, <160000000>;
+
+	status = "okay";
 };
 
 &fimc_3 {
-	status = "okay";
 	assigned-clocks = <&clock CLK_MOUT_FIMC3>,
 			  <&clock CLK_SCLK_FIMC3>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	status = "okay";
 };
 
 &fimd {
@@ -257,15 +264,18 @@ &hsotg {
 	vusb_d-supply = <&vusb_reg>;
 	vusb_a-supply = <&vusbdac_reg>;
 	dr_mode = "peripheral";
+
 	status = "okay";
 };
 
 &i2c_3 {
+	pinctrl-0 = <&i2c3_bus>;
+	pinctrl-names = "default";
+
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <400000>;
-	pinctrl-0 = <&i2c3_bus>;
-	pinctrl-names = "default";
+
 	status = "okay";
 
 	touchscreen@48 {
@@ -281,11 +291,13 @@ touchscreen@48 {
 };
 
 &i2c_5 {
+	pinctrl-0 = <&i2c5_bus>;
+	pinctrl-names = "default";
+
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
-	pinctrl-0 = <&i2c5_bus>;
-	pinctrl-names = "default";
+
 	status = "okay";
 
 	pmic@66 {
@@ -312,9 +324,9 @@ pmic@66 {
 						 <1000000>, <950000>;
 
 		max8997,pmic-buck2-dvs-voltage = <1100000>, <1000000>,
-						 <950000>,  <900000>,
+						 <950000>, <900000>,
 						 <1100000>, <1000000>,
-						 <950000>,  <900000>;
+						 <950000>, <900000>;
 
 		max8997,pmic-buck5-dvs-voltage = <1200000>, <1200000>,
 						 <1200000>, <1200000>,
@@ -488,9 +500,10 @@ bt_device_wakeup: bt-device-wakeup-pins {
 };
 
 &rtc {
-	status = "okay";
 	clocks = <&clock CLK_RTC>, <&pmic_ap_clk>;
 	clock-names = "rtc", "rtc_src";
+
+	status = "okay";
 };
 
 &sdhci_0 {
@@ -499,6 +512,7 @@ &sdhci_0 {
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus8>;
 	pinctrl-names = "default";
 	vmmc-supply = <&vemmc_reg>;
+
 	status = "okay";
 };
 
@@ -508,12 +522,11 @@ &sdhci_2 {
 	pinctrl-names = "default";
 	vmmc-supply = <&tflash_reg>;
 	cd-gpios = <&gpx3 4 GPIO_ACTIVE_LOW>;
+
 	status = "okay";
 };
 
 &sdhci_3 {
-	status = "okay";
-
 	#address-cells = <1>;
 	#size-cells = <0>;
 
@@ -523,8 +536,10 @@ &sdhci_3 {
 	mmc-pwrseq = <&wlan_pwrseq>;
 	vmmc-supply = <&tflash_reg>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd3_clk>, <&sd3_cmd>, <&sd3_bus4>;
+	pinctrl-names = "default";
+
+	status = "okay";
 
 	brcmf: wifi@1 {
 		compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
@@ -537,12 +552,13 @@ brcmf: wifi@1 {
 };
 
 &serial_0 {
-	status = "okay";
 	pinctrl-0 = <&uart0_data &uart0_fctl>;
 	pinctrl-names = "default";
 
 	uart-has-rtscts;
 
+	status = "okay";
+
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
 

-- 
2.43.0

