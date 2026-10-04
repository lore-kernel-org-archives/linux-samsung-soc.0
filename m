Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502944A6CD4;
	Sun,  4 Oct 2026 20:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145072; cv=fail; b=kFgtZb/oTUenF/EXWg97rU9m5zAStZdUDlweqAsd5ZFdcXthdbXuIj6p4hefIGbsuSDP+XKjRtpv1xSqAz3QC5GJHhzSvZ1uHgATD8IFCX5mof4EjR+jKRaqKA2F596uKc7clNabALKUjuSEzK5/erf6h1JU3EYjLJXDewK+H58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145072; c=relaxed/simple;
	bh=3tq1E1EVYIn/MH/e7Z0pnfEPq0fhTEUEHHBRIJFtTmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ay/nA5+oulqMlkGOk3jsMfYqDoAxfjaOKlGGPsRY9fZGi+E0r2lDsPSr/1lAKgFdOpt12PZJ4098+c5ZtuZh9euNRfJuhd7vPHQPQLdVY8IN+yDE6y+Euq+uYsJ2E7iu+W7NbmDHO0PIM77jEsGGjr//MiDmZ/BpW6aT5gKdjyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=F46WW20P; arc=fail smtp.client-ip=52.101.70.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="F46WW20P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foi0wvEFpgNk2Q9lKhjtRRtfDL8uJR263GAckoI8uDfarSaVX+w7xi/0V6G5y9NNmcEoSHcBrhqJQnkeX2CUzy0+xF9jiiMX5zAZoYNcbBBR3uOS6b6ywRgWpcMU6/7eCfbgIiCtmxFrNAglCwiZiI7U1pvw85XW0Gdc9h2MgzavVWEZyVuxmoi+WcOhTxlhvOjQnCRx031MDUp4I4b5l5BkmQsa3mNmYnrXj3tBHJId+ha7BtynTzZNAVlCpcRz48IvTZCN9dnKm+3N3bnHuJPYDk/A1W7ff01sYelTKMh4j9rDIWmmpgI9IIhGwP5y8Z3QwOewf0Xsc/pV08VGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFpmwPITavAi+mVFxqfyT299O6/p6th9oJChZ5LtH+0=;
 b=cszAbO9IbQS7+W131AQ1xhHxrPHrKsY3iooedacu1F2YjFU4cd2CfJrGJVZngIIR+1Ahss7VcLHKjsvka+guMSwbXk4MxRNNFK1HZC1wic7S9BWgz4BZlSuQh3leNqJA9TzNuE16582k/Xchdhaxvl2ufZAz2S0lVxp2JynMbroIHPS9K60A/5FVHwVVyDBksbqC1xnXBLRxWGcMFH7qN976pf6s0iQhciCcI4mgyKzGjTLvHPEqAot9xs8g0twWLVG5E9BqL/ku8WuoTN9CenlLA1xSxGY6WIWyoOTV0eX3DlYgM1u/aNDAcS06yhiA4OvovwQriCBCsOhhOlWoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFpmwPITavAi+mVFxqfyT299O6/p6th9oJChZ5LtH+0=;
 b=F46WW20PtIpCWzKg+e1wLDuFq4cef1DCW/eT6VpDMuSY6+UTSCSoGUPLwwlgreM+fNgZypgc04ijNVyCoznlQ2ygGk8r0Te2JYc8JxifzJDd0aw6oUunw7YFzIVGx1OCcZJIB2x3hDTow1fZevwiYQRbBF5gP6X7mqPxqtlJOgg=
Received: from DU2P250CA0014.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::19)
 by AS1PR02MB8163.eurprd02.prod.outlook.com (2603:10a6:20b:476::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Sun, 4 Oct
 2026 20:17:42 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::45) by DU2P250CA0014.outlook.office365.com
 (2603:10a6:10:231::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:41 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:41 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sun, 4 Oct
 2026 22:17:41 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:41 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 195FC1467;
	Sun,  4 Oct 2026 22:17:41 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id EF889803CDC3; Sun,  4 Oct 2026 22:17:10 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:00 +0200
Subject: [PATCH 03/17] ARM: dts: samsung: exynos4: sort all properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-3-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10467;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=3tq1E1EVYIn/MH/e7Z0pnfEPq0fhTEUEHHBRIJFtTmA=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQpsCfOtc+vzVfE87hLhiGbzF47ThJl1Dwvp
 LV5qOYP3SmJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0KQAKCRCwB25JC3Fh
 ayLqCACpR7MZwrXScDltekjeXXEKpd0Xu3bmXeFMyvYc5RJwLF4zlzLNfBrD70obFegopuBJyo+
 FT7bFitTxqeXqzd0F6llvy5o2E6eENm3Qw615ZqjiUdQR6MyxlJQFbj1M17/Pizt0p7AFnydqJn
 BYiGtTJgEE2wrDWSogfDAznmZIJA2RhWF0xNoWNJwOaJS+YHSJtgVnbzlvZmrCkX0CVgRtJgInX
 NW6wsp77wvzMCtdDPIwKxWxnV7BzsV8RkKpvamzUHg8cugyGaQYEdahgoLwvLojqBwweMco8wch
 zrRuwKJ2QuFgs/DFNEMJV6cHtBonXV856zuNqu5G/ySYPje1
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|AS1PR02MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 647e27cf-5f7a-4af2-21b9-08df22548b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|30052699003|36860700016|82310400026|23010399003|10067099003|3023799007|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rdvmaz0cd+vRKZzJZ6adcb7pJGFHBun2siYuHxFgNWB8AUkdcmm7HPToX3HlB9GwDElvvvmkVHFgba6hIaXmQnVPVD5Jf5ByaLOYlSsaX4W6YSxrg/1DKCTbvVUFSkvvebU+e0iGVQdOz5GTDtfS1fYozSJ7uzkgNO7FSbfnBUdNuTKjhBg5MJVkS0rymBoZielVgHrWrPuKI+w5rA83TUXFmMsmNaAzW/X9cEQ0yqaLBREGKKVfMVrPkuD84CKeHCjThkG3QMlEDMY2y5NIjmpdHSJjVYfiM4UJ/GeC8ktTtL+Q+dbfB+vndd6S8zXawPNEsFMNDF8IU9KhnFfFME539MqAB1G1GDW9gj/TY0Nt8wa4dGSowBrzoBiRHUksq0vFYeSx3fxaw41HBi2fRzxv/5/P1uRbQq9VPdTg97tgScutCb/D4m0CU7XKilw0UON3sBmeTV3u5gX5dm9QlF/FW7GtJ9kadGCR6wSeNbf/+FN2ccYfOJxOIU3wgZ+TtdfgWOYQ//AddFXw5yUztY6aQFdFCHxFIiFZ0FqegZRsQQCCFcG+0hoaw/Vz1c0BoXRzfqJ6ciadZGnXoARqBiWoUFEIrOUC/IpzjNh0CUfqavOlN1ZPKB5z2/i3KKqtyj/C+2eLc99QLNiRKPmvm2vrslZuEAr+AfuJD6ZV3vb/Vg2W94fsFjT0N5QykZPkoNFas32w9dLuck1zxkNuCQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(30052699003)(36860700016)(82310400026)(23010399003)(10067099003)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gD4i4cs7fEdTJ5GR6gG9HCI4dhpYEIvRjxkCdmDPCkfTonPuauIv5grUUW5+WV8Zi7QKW1zem5lRVHGoZcay3GsNQ9shcjjeRdtPb//18XA60TEbC66mAT4f8dOlq7TIbdotIdzaTfAVlnyqaEKeUgBZrOwHQiPb8QfVf1NlhYWybPVm/cOhFiq3SlXxXoel7qjfJdqCIsAqhtUiwaXjvquDV0pf8fpChyKyhFBjyW9fSuyZ5euZi596s8rg4g9azPSobTl3OYaV2A5ZTMCFd9QJ89ATTlFFQS7E+X0d91XiiKwqRn12gWWHDhjcNiZJWz2WexhgHNnrjVEYwVgB3LzI1FAly1+z6waSdrLFHkVsgiQgQIm7CSobzdlSEG47H2k3d9YsTGI41jbsvsYiW3OVYfXajxaGoDsWQ+htrR9ZagyfO+Hrb9iC3+04zO28
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:41.6879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 647e27cf-5f7a-4af2-21b9-08df22548b2b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB8163

Fixes dt-check-style in strict mode property-order warnings like:

  samsung/exynos4.dtsi:226: [property-order] property 'iommus' out of canonical order (should sort before 'samsung,sysreg')

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4.dtsi | 89 +++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
index f69b01423ae0..43cbbedbfe41 100644
--- a/arch/arm/boot/dts/samsung/exynos4.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
@@ -60,9 +60,9 @@ pmu: pmu {
 
 	soc: soc {
 		compatible = "simple-bus";
+		ranges;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges;
 
 		clock_audss: clock-controller@3810000 {
 			compatible = "samsung,exynos4210-audss-clock";
@@ -86,8 +86,8 @@ i2s0: i2s@3830000 {
 			clock-output-names = "i2s_cdclk0";
 			dmas = <&pdma0 12>, <&pdma0 11>, <&pdma0 10>;
 			dma-names = "tx", "rx", "tx-sec";
-			samsung,idma-addr = <0x03000000>;
 			#sound-dai-cells = <1>;
+			samsung,idma-addr = <0x03000000>;
 
 			status = "disabled";
 		};
@@ -159,16 +159,16 @@ pd_gps_alive: power-domain@10023d00 {
 
 		gic: interrupt-controller@10490000 {
 			compatible = "arm,cortex-a9-gic";
+			reg = <0x10490000 0x10000>, <0x10480000 0x10000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
-			reg = <0x10490000 0x10000>, <0x10480000 0x10000>;
 		};
 
 		combiner: interrupt-controller@10440000 {
 			compatible = "samsung,exynos4210-combiner";
+			reg = <0x10440000 0x1000>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			reg = <0x10440000 0x1000>;
 		};
 
 		sys_reg: syscon@10010000 {
@@ -198,22 +198,23 @@ dsi_0: dsi@11c80000 {
 			phy-names = "dsim";
 			clocks = <&clock CLK_DSIM0>, <&clock CLK_SCLK_MIPI0>;
 			clock-names = "bus_clk", "sclk_mipi";
-
-			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			status = "disabled";
 		};
 
 		camera: camera@11800000 {
 			compatible = "samsung,fimc";
 			ranges = <0x0 0x11800000 0xa0000>;
 
-			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			#clock-cells = <1>;
 			clock-output-names = "cam_a_clkout", "cam_b_clkout";
 
+			status = "disabled";
+
 			fimc_0: fimc@0 {
 				compatible = "samsung,exynos4210-fimc";
 				reg = <0x0 0x1000>;
@@ -221,9 +222,9 @@ fimc_0: fimc@0 {
 				clocks = <&clock CLK_FIMC0>,
 					 <&clock CLK_SCLK_FIMC0>;
 				clock-names = "fimc", "sclk_fimc";
+				iommus = <&sysmmu_fimc0>;
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
-				iommus = <&sysmmu_fimc0>;
 
 				status = "disabled";
 			};
@@ -235,9 +236,9 @@ fimc_1: fimc@10000 {
 				clocks = <&clock CLK_FIMC1>,
 					 <&clock CLK_SCLK_FIMC1>;
 				clock-names = "fimc", "sclk_fimc";
+				iommus = <&sysmmu_fimc1>;
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
-				iommus = <&sysmmu_fimc1>;
 
 				status = "disabled";
 			};
@@ -249,9 +250,9 @@ fimc_2: fimc@20000 {
 				clocks = <&clock CLK_FIMC2>,
 					 <&clock CLK_SCLK_FIMC2>;
 				clock-names = "fimc", "sclk_fimc";
+				iommus = <&sysmmu_fimc2>;
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
-				iommus = <&sysmmu_fimc2>;
 
 				status = "disabled";
 			};
@@ -263,9 +264,9 @@ fimc_3: fimc@30000 {
 				clocks = <&clock CLK_FIMC3>,
 					 <&clock CLK_SCLK_FIMC3>;
 				clock-names = "fimc", "sclk_fimc";
+				iommus = <&sysmmu_fimc3>;
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
-				iommus = <&sysmmu_fimc3>;
 
 				status = "disabled";
 			};
@@ -281,10 +282,10 @@ csis_0: csis@80000 {
 				power-domains = <&pd_cam>;
 				phys = <&mipi_phy 0>;
 				phy-names = "csis";
-
-				status = "disabled";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
+				status = "disabled";
 			};
 
 			csis_1: csis@90000 {
@@ -298,10 +299,10 @@ csis_1: csis@90000 {
 				power-domains = <&pd_cam>;
 				phys = <&mipi_phy 2>;
 				phy-names = "csis";
-
-				status = "disabled";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
+				status = "disabled";
 			};
 		};
 
@@ -370,10 +371,10 @@ sdhci_3: mmc@12540000 {
 		exynos_usbphy: usb-phy@125b0000 {
 			compatible = "samsung,exynos4210-usb2-phy";
 			reg = <0x125b0000 0x100>;
-			samsung,pmureg-phandle = <&pmu_system_controller>;
 			clocks = <&clock CLK_USB_DEVICE>, <&clock CLK_XUSBXTI>;
 			clock-names = "phy", "ref";
 			#phy-cells = <1>;
+			samsung,pmureg-phandle = <&pmu_system_controller>;
 
 			status = "disabled";
 		};
@@ -396,10 +397,10 @@ ehci: usb@12580000 {
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_USB_HOST>;
 			clock-names = "usbhost";
-
-			status = "disabled";
 			phys = <&exynos_usbphy 1>, <&exynos_usbphy 2>, <&exynos_usbphy 3>;
 			phy-names = "host", "hsic0", "hsic1";
+
+			status = "disabled";
 		};
 
 		ohci: usb@12590000 {
@@ -408,10 +409,10 @@ ohci: usb@12590000 {
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_USB_HOST>;
 			clock-names = "usbhost";
-
-			status = "disabled";
 			phys = <&exynos_usbphy 1>;
 			phy-names = "host";
+
+			status = "disabled";
 		};
 
 		gpu: gpu@13000000 {
@@ -517,10 +518,10 @@ serial_3: serial@13830000 {
 		};
 
 		i2c_0: i2c@13860000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x13860000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C0>;
 			clock-names = "i2c";
@@ -531,10 +532,10 @@ i2c_0: i2c@13860000 {
 		};
 
 		i2c_1: i2c@13870000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x13870000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C1>;
 			clock-names = "i2c";
@@ -545,10 +546,10 @@ i2c_1: i2c@13870000 {
 		};
 
 		i2c_2: i2c@13880000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x13880000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C2>;
 			clock-names = "i2c";
@@ -559,10 +560,10 @@ i2c_2: i2c@13880000 {
 		};
 
 		i2c_3: i2c@13890000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x13890000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C3>;
 			clock-names = "i2c";
@@ -573,10 +574,10 @@ i2c_3: i2c@13890000 {
 		};
 
 		i2c_4: i2c@138a0000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x138a0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C4>;
 			clock-names = "i2c";
@@ -587,10 +588,10 @@ i2c_4: i2c@138a0000 {
 		};
 
 		i2c_5: i2c@138b0000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x138b0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C5>;
 			clock-names = "i2c";
@@ -601,10 +602,10 @@ i2c_5: i2c@138b0000 {
 		};
 
 		i2c_6: i2c@138c0000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x138c0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C6>;
 			clock-names = "i2c";
@@ -615,10 +616,10 @@ i2c_6: i2c@138c0000 {
 		};
 
 		i2c_7: i2c@138d0000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x138d0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C7>;
 			clock-names = "i2c";
@@ -629,10 +630,10 @@ i2c_7: i2c@138d0000 {
 		};
 
 		i2c_8: i2c@138e0000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-hdmiphy-i2c";
 			reg = <0x138e0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C_HDMI>;
 			clock-names = "i2c";
@@ -740,8 +741,8 @@ mdma1: dma-controller@12850000 {
 
 		fimd: fimd@11c00000 {
 			compatible = "samsung,exynos4210-fimd";
-			interrupt-parent = <&combiner>;
 			reg = <0x11c00000 0x20000>;
+			interrupt-parent = <&combiner>;
 			interrupts = <11 0>, <11 1>, <11 2>;
 			interrupt-names = "fifo", "vsync", "lcd_sys";
 			clocks = <&clock CLK_SCLK_FIMD0>, <&clock CLK_FIMD0>;
@@ -754,12 +755,12 @@ fimd: fimd@11c00000 {
 		};
 
 		tmu: tmu@100c0000 {
-			interrupt-parent = <&combiner>;
 			reg = <0x100c0000 0x100>;
+			interrupt-parent = <&combiner>;
 			interrupts = <2 4>;
+			#thermal-sensor-cells = <0>;
 
 			status = "disabled";
-			#thermal-sensor-cells = <0>;
 		};
 
 		jpeg_codec: jpeg-codec@11840000 {
@@ -793,8 +794,8 @@ hdmi: hdmi@12d00000 {
 				      "sclk_hdmiphy", "mout_hdmi";
 			phy = <&hdmi_i2c_phy>;
 			power-domains = <&pd_tv>;
-			samsung,syscon-phandle = <&pmu_system_controller>;
 			#sound-dai-cells = <0>;
+			samsung,syscon-phandle = <&pmu_system_controller>;
 
 			status = "disabled";
 		};
@@ -805,18 +806,18 @@ hdmicec: cec@100b0000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_HDMI_CEC>;
 			clock-names = "hdmicec";
-			samsung,syscon-phandle = <&pmu_system_controller>;
 			hdmi-phandle = <&hdmi>;
 			pinctrl-0 = <&hdmi_cec>;
 			pinctrl-names = "default";
+			samsung,syscon-phandle = <&pmu_system_controller>;
 
 			status = "disabled";
 		};
 
 		mixer: mixer@12c10000 {
 			compatible = "samsung,exynos4210-mixer";
-			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0x12c10000 0x2100>, <0x12c00000 0x300>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&pd_tv>;
 			iommus = <&sysmmu_tv>;
 

-- 
2.43.0

