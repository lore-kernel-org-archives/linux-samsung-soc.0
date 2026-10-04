Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66EE4A5EDD;
	Sun,  4 Oct 2026 20:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145043; cv=fail; b=tnIMUyFakcRxMbnI8lKEuJMuIGZ9donCNpYZSrL53fUqH37GURh1j/XA+vnmKlc+Siq6XEuoJ6NakEhtFESyqSuMvd0JOh3C7po/iD9Wgx7tT7qhFPbkcxlzmP1IRRXWMXkUyCuvxBOtbxsKySPgiR9DMDmaiuMlmmkbnOxYJHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145043; c=relaxed/simple;
	bh=12dBiPIPvNOyV5TSXtyJHrBKRlYTy6U/pCFKP/0of9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aTRlYjDilBbgf+OzEbJSuYQ3nejnpGH90imyL/e95/n0LyADVSTm1UAAMPRpTiEpHm5thriYZd491tc+DXRYItNQ1P11he0jub5aEi8ZlP8wUcXdVqb2zK5xLGHf+54KAeoUNBAft0ti2hL1EwlA21tCdyMrOAuOFbdvdRN6zHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=cqFsu/bP; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="cqFsu/bP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEdFcIaLLI1J3S9hDoWTmDefzQPmKMMMUMlfd90hWBfu/2mRVziPpdnYbS8mORi8fu4ij53K5jAN8+mC3pgzVJSHXHhOfZgnax6JJHKsf35pn4wsdd/tfmg1tDakZMnGcBW2dtrwZGANn+dlpiYPSQaK2AvsBbgaLucnT8i4I9OdMXECVzd3F2h9OsRiaAMZJXR5EEVuhyLNRy1GmHcuA/l88FwjY+s7iqxEtKrFUrDj7b1pne2vlvt+RM4PJMSGM4++ZAAION3qiXCMGDBXnOjb7gtOBWAbSsAY2ACAJuTKTDDiRXopR20+ghCEhJPvdC1xoXpIUluJxKpDwkY4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFDcVnIwA/5yJ8DHnUNx0lsJ9ki9JmtdAOVMqabk6gQ=;
 b=VcAi8qkT/4NXRG4n4Vh1SqITTrPw8LWaPJ2h4RhymWSZF1lQ4tM3wXpOGJliGOAIo4Hh8y/EMj9CyLaeWqLaaPM3UnJehhGUynL61V+ibVkwctTtzeXix4XQFR2w1YrfxWezPAAjNaHgOqW8GTM1RqI8Fx2GnIwxUsZhzOK54iqfhhJTevjGeIhFLP1kEX/rf6PuDgYarBqDhr7ofEC8BMhMkF+vJX64XvAEKe36zpJ6ZhIi0BbMKOxKmYzj388xYtXb/M5qp9++2tT//MWnzauAxJSFwCX5QU9yp2j28moDq1BQqKRQRDOr43/LgjF23acKcCETm7AUGsnL9WOwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFDcVnIwA/5yJ8DHnUNx0lsJ9ki9JmtdAOVMqabk6gQ=;
 b=cqFsu/bPgsJnkkhL787lbdUN623dwicJFeP/F5vWo8JFDFAam3RLfzlxeHt3ecjyep5PfK7rHe7xziNDR+FxCuKCtdXInZ44TGe3LFauAtJ46F9x+1W/eoUS3pfqyDrUZLRSI/V8VyTndFQJEuMhL7FPeJSQfW/GK4l3CyWcCRw=
Received: from DUZPR01CA0284.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::22) by GV2PR02MB9352.eurprd02.prod.outlook.com
 (2603:10a6:150:d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 20:17:13 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::57) by DUZPR01CA0284.outlook.office365.com
 (2603:10a6:10:4b7::22) with Microsoft SMTP Server (version=TLS1_3,
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
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 3799A4CEB;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id 06401803CDC7; Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:04 +0200
Subject: [PATCH 07/17] ARM: dts: samsung: exynos4210: sort all properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-7-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3393;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=12dBiPIPvNOyV5TSXtyJHrBKRlYTy6U/pCFKP/0of9U=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQxxhp93eWC6tBcjASJ3Gzq2GdBANDof+9pb
 jN4ulLgcuqJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0MQAKCRCwB25JC3Fh
 a+TPB/4g9gLSH0Lx5qp4Q0ce8UFNbRoow51F8WNUMy5sZc/VQZUtW0aagWIvvbpwtNiEFBA/lQx
 HhFQJXDXDxBBwAzS0dobYfuKLfmqsBm6o8K640ecbncsKX3YpSasmOHFuIwnwx0g6UUMvFLNUb/
 cb8Rdqz4Nl2o/kpkEMkFnzadPJsnCIsrytVUCp4nQpC2Bay7OBYC0sMjRlwWQrZK3cXHja8gH2f
 z7ZesUvX43X4tUSzNqkuEb6VmljHw+mBeMp+gXc/K91s6+j+rjGxIJdTuEwlX03Ff4QYnWibXj1
 6LYcaq5a5BwnQrgdnA90E9edWRhXlgyV5Jwg3IykvFFZOMqY
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|GV2PR02MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: 37bc27d4-9c8e-40fe-256e-08df22547a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|30052699003|1800799024|36860700016|376014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	BV0Q8hA1gzA2okKlE9fr/J5pr/BrGVCUzlxMSUsvqLvkxhGwuAzHFdtj4UgWzYRDnCVGJnPGd9llcoTCauX7Prde2alK1hCTX3eQ66eeDkkZGgJQi2YYs7UYNOsd5v3CKuz/3oQLK/Dzd0HQVdijdKeINTW+WgdYld98Oyo8rBkyA2NkPc7Gv81luVjDsxCm9KKBRAZ+m01Q/hbtyZ3xNctP17zANQFVgDOzs61+6PNE9rH9HhrWZbzZ6OvYhPS6uxMIA0/6CkvfLf2v2o8+2CttuEK/UvEtKZZxb2KvWILLcrCaVFJXBGrKmsfooMww8xKONkdnpZoEye9Xfou/Fg+TSCRf45okrMaOGehgLP0JVc7Gr/iKBtf9Bxy8Y+ZVYwLPQgFFwcHiUdmImNn7Q19p9CPuafs0Qdt0JFQR7Q/i2xT91M4t2HRLYWv2TTxatcFPOISDhO0OzB/3a+ImNQCe5mbE4DpRiMUsTPimJLixfyRaU6chYzqv08Loh4jQ+UaX6DnaRG62qgMvj3lSbjez+mbUd6SnnzXZKo7xIAF3BYMF0MGK4g5pF8dd85f7okDibPdylkqTsRD7gBhE7/jW840GN/ZEa6jEZ/SxY38AEZgoHDxePNfrhCJpeaIzHqySafQjSM3AYMZz87gsMs9T1pH5Tu5E4SyJUP6o2LvX1x+qNPDudvOCoNmSxEzZJSmEl5uyJvGr+3LeWJ50QA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(30052699003)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Miliy3ZcTMwNX3M8IdKqJ3ICipjKLQFw/lxfumu3MoT5copk4JlhM2QJadds+Gl26VRFw2jlTs2i2R6pSTOaPpbt8etGz+3UzbPE4GbuP1jBPqFX8+t09FvE0q6DjLlmdsecpI9o7U4su0dHYEMGuwoE9br9kLa3rz+Inz8PE2Rr/0xkR+OEfimu4LLO7R9Z7fgcqe9P2ObSnSCw13XIo2So9zL7ScGh+uMVcVjg0PgOhNgybH5nFh0O1fiO+tA4cvH1pmSgw3m0wvVHoglQNEa7wdbvVDadLo2XrOb7uRa5jnjon8ts9gfDxEantXij0R74U1x54VLQFEnLNSzhNs/+qpixqI2uUZFWXdaaRJhUnvJPJizX0+AyS+/pSDM2W8XmHlUWQ74k1VltsVjG9/xZ2NHR8YApDiMLBFYPSzZL//hhRjbhK3YlY7KWSNhU
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:13.1433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bc27d4-9c8e-40fe-256e-08df22547a28
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9352

Sort properties according to the preferred style for increased
readability.

Fixes dt-check-style property-order warnings in strict mode like:

  samsung/exynos4210.dtsi:393: [property-order] property 'reg' out of canonical order (should sort before 'interrupt-parent')
  samsung/exynos4210.dtsi:440: [property-order] property 'interrupts' out of canonical order (should sort before 'samsung,combiner-nr')
  samsung/exynos4.dtsi:745: [property-order] property 'interrupt-names' must be placed after 'interrupts'

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dts/samsung/exynos4210.dtsi
index 66f35c4ae6b1..d37ac0c97dbc 100644
--- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi
@@ -267,9 +267,9 @@ soc: soc {
 		sysram: sram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x20000>;
+			ranges = <0 0x02020000 0x20000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0x02020000 0x20000>;
 
 			smp-sram@0 {
 				compatible = "samsung,exynos4210-sysram";
@@ -359,11 +359,11 @@ pinctrl_2: pinctrl@3860000 {
 
 		sysmmu_fimd1: sysmmu@12220000 {
 			compatible = "samsung,exynos-sysmmu";
-			interrupt-parent = <&combiner>;
 			reg = <0x12220000 0x1000>;
+			interrupt-parent = <&combiner>;
 			interrupts = <5 3>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_FIMD1>, <&clock CLK_FIMD1>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_lcd1>;
 			#iommu-cells = <0>;
 		};
@@ -392,8 +392,8 @@ sysmmu_g2d: sysmmu@12a20000 {
 			reg = <0x12a20000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <4 7>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_G2D>, <&clock CLK_G2D>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_lcd0>;
 			#iommu-cells = <0>;
 		};
@@ -436,7 +436,6 @@ &camera {
 };
 
 &combiner {
-	samsung,combiner-nr = <16>;
 	interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 		     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
 		     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
@@ -453,6 +452,7 @@ &combiner {
 		     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
 		     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
 		     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+	samsung,combiner-nr = <16>;
 };
 
 &fimc_0 {
@@ -523,11 +523,11 @@ &mdma1 {
 };
 
 &mixer {
-	clock-names = "mixer", "hdmi", "sclk_hdmi", "vp", "mout_mixer",
-		      "sclk_mixer";
 	clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
 		 <&clock CLK_SCLK_HDMI>, <&clock CLK_VP>,
 		 <&clock CLK_MOUT_MIXER>, <&clock CLK_SCLK_MIXER>;
+	clock-names = "mixer", "hdmi", "sclk_hdmi", "vp", "mout_mixer",
+		      "sclk_mixer";
 };
 
 &pmu {
@@ -538,11 +538,11 @@ &pmu {
 };
 
 &pmu_system_controller {
-	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
-			"clkout4", "clkout8", "clkout9";
 	clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
 		<&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
 		<&clock CLK_OUT_CPU>, <&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
+	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
+			"clkout4", "clkout8", "clkout9";
 	#clock-cells = <1>;
 };
 

-- 
2.43.0

