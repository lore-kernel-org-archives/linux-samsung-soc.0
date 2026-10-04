Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010013.outbound.protection.outlook.com [52.101.84.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94404A4F01;
	Sun,  4 Oct 2026 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145040; cv=fail; b=Ll9uKdy5C+oHcvTQsW8eeD5fzV1ffjkL7k6QUpFUghjBV760E2PVg9T3NZt/kc3eLXG3Wac22hKy0iH9NJ0cg4q7K4IVR4nKcVOFK1APLrvgVGGlW0sWp7zC7AvnZXETok5XzzGnW8yhdjFOpLKSOLwvAfsysj0y6xa+mfv8pc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145040; c=relaxed/simple;
	bh=/hF3K6HTKAvLdUkP31b/VGe1ZT/mF89Cg8vRm02RM98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FJPixAl5c/HMjruYbc103kehorG0bDWuqpw+3rjOAmVDT+z4yfwspOa0P+8lNblB/NtNCgANvF1RDHLpIX1SVXciOoQPEMuW7aBjjQMHlWS8QcOooDNEAJxFqQXXkWjL3viE6v6ZAYgMsyxowAklLVv0Q1GM6J5ifiwkX8LNX7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=TbFWtQTg; arc=fail smtp.client-ip=52.101.84.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="TbFWtQTg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1hbAH76zeVMFLGDQNFNV3kvor+bBP0MVmXIyss74BZNOcQiA9LqYDx4EgIhDTOBmWh/wsUJRi+snbTMDR2ySfLibWriVfMu4K/o5sgs6wDwSFw86VK1Hkr97oqvbxPnEqSqS/t5h5zrdrRKDQGMTH92oBCY8xaPKCtmgLk3VHc+U9ecz5ZhgkStolPau/H+2gc8otqYKompSPvUqsHJ0CBS7eGn1tQsr6aGeGfqS9dYFk59BMFwzLrkZEIWCT68LDPEe1r8rQtUvB1wNTwqKJ9B7Mfr7Oo1XStgMxhNPSFVxx7o4pPRy9RAwWuKEvd/r6qLbCu+fUEPvvpeZcPEjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzJpiRS4PacuVntKL2nLkD+JjK08O6nsNB0aeqTFVDY=;
 b=Zhhc9E7S9ImtJYHWxBOGbNiGlvT0u/AuKbeKd6Zz3Q+DU90+ke5ciUEM62CCwc2+GxMGErrexSS6tuWB+RzTmLhk0D24QWZFCbJpB7cGN+gSR4koOjSbXfxfYk8/5+GFkjwsQ6u6wSxhCbe+wdjtt9g7Jq5kHPatNlWOiruci0tJGGorgf/Jp5grWmDIemz9KLW14VT/mAU9n+IY0iv68tg0q33raoHxBAxFjHwQmd6cbhcVfqtJzyktQbKmlXXBKPXjTURiR5KXUTx6HrDXc2EhMc8AHv7/aKLXYDHkBEVA/MMBo+Sjr2Y2U+2tz1BB5LdxjGiYRTIkB6LhIwc8PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzJpiRS4PacuVntKL2nLkD+JjK08O6nsNB0aeqTFVDY=;
 b=TbFWtQTgHKyWE4XF2aThs8dpXqw5zf+ytAKuHVQnaH2kBOmJyLjqtdXbXpkLh5e0ut0/EDSp25hsFtOvBYxLPSxoxAfV7d+PfDvpFCkiqJcV1z2dfHrz0pQiJFmts2r1sMzkF3Lrvv7s1eVan4sxEw9wUJg4L17Sqh441wVwWKU=
Received: from DUZPR01CA0286.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::12) by PAWPR02MB10142.eurprd02.prod.outlook.com
 (2603:10a6:102:363::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Sun, 4 Oct
 2026 20:17:11 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::af) by DUZPR01CA0286.outlook.office365.com
 (2603:10a6:10:4b7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:11 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 166954BBC;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id EDD96803CDC0; Sun,  4 Oct 2026 22:17:10 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:15:58 +0200
Subject: [PATCH 01/17] ARM: dts: samsung: exynos4: add or remove empty
 lines
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-1-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11956;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=/hF3K6HTKAvLdUkP31b/VGe1ZT/mF89Cg8vRm02RM98=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQln0Tgs71RXr0OoxfsKDoQvgjH1tb2ht90v
 i/E2TJuA+qJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0JQAKCRCwB25JC3Fh
 ay+xCACYJLFiGrUAxtXlvjsLBy1wgT//BLM/2kpG1n0dHCEM5AziM/bkAJ18oOauVJ/YErV3Lqb
 yaxLjBmo7jySFUmQlkj26G15HjsaXm/2BzO4UGt5M4wj+ysHR7dZKnCEnrnUCBTjCKIOVSKYueI
 oDqP3xrngLs8fzIln2Jytn/jmQrjkoKa6Tl5xrVNkN8U8g5JEusWeGVLFrv09YSXQp9Q0vRedZV
 mVkeEBjI/P79BNt+hazslvhk0XmBn2mWKWENUaFFZCvLfiiG12m5TUFK3quzEE82tWC8TT9GJGy
 FoKqCNVZrX5Cyr7zbj7sqI8lzMT/OSriQPpJkqhQHUCv4Pqo
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|PAWPR02MB10142:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc77a3d-5a90-436a-7c22-08df22547933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|376014|23010399003|1800799024|36860700016|82310400026|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	E7cJ3Mao4zcxUwGQ04E3JCAu1yu1wfYrKceRFsIMQa8jPFxixbrOERzA1ti9ruDjmp4iAlKG+vwsajLeprKhwquf2L8pPEoQet4BJb2vcdljz+dOeO0ZHXxnG4bAP7JF9G+eS70jgfiC2MyPortHk5rZWrs2LS8QFsrqQr/W61IFhn8QNGmAwW2ZWJh7CdkQcGqbJvGDu10pmz8OaXqw58N4y1I4DN9Of5tRG64r5WjzcZrn7Kzvl5GTVchBIQ2q4OguQGVHw9jfrmoCh0q6WIiybcmSyY6vncLkic46pgfC6cC38Hwx2stZYqzy0onhZFzqRqCMbpb314o5qVD5oDYjmnoywHag4CgDMfoyP49iMvMmBKz9WAa9MHPwt9aVBHvXYfGLNXTe507LN7QtHT9FG6v3sIDTuOvVqR2yRVMwPQz6MSDNsexPCFKciJOCLvzRvSjL6AGL3OC6X2tZuo2mn4wTbSAgjE6CUZ5BlYUQANNfXNiGVKDUfgxO6ZLr0yTu38RgpcALg/6vORsOLjHdZEANCpR5RVaQ2+MEhNOnYcD+kRHD9xkGCG+YXG61ovyCoxMDrJXv2WGA6CZGqcguZtsArIFGitpVBQz0hoYp9NlNKE2BCWLMYKG6/JB5WXom7SNYrjVGL38fzTlL/tMtrR7FVXGESfZDmtjzBqcw8z0JmapqGTApoa7OhP1R22lbuPdD5MSIWdR0MXcZJA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p0FgLTWv3Z1S017LmrhgWnc9hqDCQD0D9aM4yWub3MhdIjROBFtWNaoQEvickqEUtDZfJEuznBPsZ/YnbuLLaM3/le4BLCjGOwvhJYnFFhmca07Z40oHcijh8N3j0wpY6FtnA/qSdts3NKzZTk60Gk4Odx4NBdX4Bjl13gp+vmVl7L/BNt0DCLMJXe9H/7gIGEDT/DIR1742/Lc3KNGgNNs3b12UC324sWuQC/jREOUOFUjc8FBCM/u1dmjIMOiinUZskJyb91x8RDQEkghPeRs2K+gc1FcQPkgBrzs89UptXsBMrh4Mx5OVaRfIwUMCZo/drdAiRD+wt4OtekKr2Tuwwv9LX2vMYFJfrt+IyBdf1MN7XrWZBwlFGW5dhsnkGKPPGMFREP0EhTcsIOIyFOvm0aao3twAT/aUytnyCnZgW3vRi2e8yMQ0zdk8RG6x
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:11.5395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc77a3d-5a90-436a-7c22-08df22547933
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10142

For better readability it is preferred to have an empty line before
the status property, as well as before every child node. Empty lines
do not really help at start of children nodes though. Add or remove
empty lines where applicable.

dt-check-style when run in strict mode reports the issues like:

  samsung/exynos4.dtsi:90: [required-blank-lines] "status" must be preceded by a blank line

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4.dtsi | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
index ed47d0ce04e1..c38489a05e15 100644
--- a/arch/arm/boot/dts/samsung/exynos4.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
@@ -54,6 +54,7 @@ aliases {
 	pmu: pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupt-parent = <&combiner>;
+
 		status = "disabled";
 	};
 
@@ -87,6 +88,7 @@ i2s0: i2s@3830000 {
 			dma-names = "tx", "rx", "tx-sec";
 			samsung,idma-addr = <0x03000000>;
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -196,6 +198,7 @@ dsi_0: dsi@11c80000 {
 			phy-names = "dsim";
 			clocks = <&clock CLK_DSIM0>, <&clock CLK_SCLK_MIPI0>;
 			clock-names = "bus_clk", "sclk_mipi";
+
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -204,6 +207,7 @@ dsi_0: dsi@11c80000 {
 		camera: camera@11800000 {
 			compatible = "samsung,fimc";
 			ranges = <0x0 0x11800000 0xa0000>;
+
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -220,6 +224,7 @@ fimc_0: fimc@0 {
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
 				iommus = <&sysmmu_fimc0>;
+
 				status = "disabled";
 			};
 
@@ -233,6 +238,7 @@ fimc_1: fimc@10000 {
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
 				iommus = <&sysmmu_fimc1>;
+
 				status = "disabled";
 			};
 
@@ -246,6 +252,7 @@ fimc_2: fimc@20000 {
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
 				iommus = <&sysmmu_fimc2>;
+
 				status = "disabled";
 			};
 
@@ -259,6 +266,7 @@ fimc_3: fimc@30000 {
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
 				iommus = <&sysmmu_fimc3>;
+
 				status = "disabled";
 			};
 
@@ -273,6 +281,7 @@ csis_0: csis@80000 {
 				power-domains = <&pd_cam>;
 				phys = <&mipi_phy 0>;
 				phy-names = "csis";
+
 				status = "disabled";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -289,6 +298,7 @@ csis_1: csis@90000 {
 				power-domains = <&pd_cam>;
 				phys = <&mipi_phy 2>;
 				phy-names = "csis";
+
 				status = "disabled";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -303,6 +313,7 @@ rtc: rtc@10070000 {
 				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_RTC>;
 			clock-names = "rtc";
+
 			status = "disabled";
 		};
 
@@ -312,6 +323,7 @@ keypad: keypad@100a0000 {
 			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_KEYIF>;
 			clock-names = "keypad";
+
 			status = "disabled";
 		};
 
@@ -321,6 +333,7 @@ sdhci_0: mmc@12510000 {
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_SDMMC0>, <&clock CLK_SCLK_MMC0>;
 			clock-names = "hsmmc", "mmc_busclk.2";
+
 			status = "disabled";
 		};
 
@@ -330,6 +343,7 @@ sdhci_1: mmc@12520000 {
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_SDMMC1>, <&clock CLK_SCLK_MMC1>;
 			clock-names = "hsmmc", "mmc_busclk.2";
+
 			status = "disabled";
 		};
 
@@ -339,6 +353,7 @@ sdhci_2: mmc@12530000 {
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_SDMMC2>, <&clock CLK_SCLK_MMC2>;
 			clock-names = "hsmmc", "mmc_busclk.2";
+
 			status = "disabled";
 		};
 
@@ -348,6 +363,7 @@ sdhci_3: mmc@12540000 {
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_SDMMC3>, <&clock CLK_SCLK_MMC3>;
 			clock-names = "hsmmc", "mmc_busclk.2";
+
 			status = "disabled";
 		};
 
@@ -358,6 +374,7 @@ exynos_usbphy: usb-phy@125b0000 {
 			clocks = <&clock CLK_USB_DEVICE>, <&clock CLK_XUSBXTI>;
 			clock-names = "phy", "ref";
 			#phy-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -369,6 +386,7 @@ hsotg: usb@12480000 {
 			clock-names = "otg";
 			phys = <&exynos_usbphy 0>;
 			phy-names = "usb2-phy";
+
 			status = "disabled";
 		};
 
@@ -378,6 +396,7 @@ ehci: usb@12580000 {
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_USB_HOST>;
 			clock-names = "usbhost";
+
 			status = "disabled";
 			phys = <&exynos_usbphy 1>, <&exynos_usbphy 2>, <&exynos_usbphy 3>;
 			phy-names = "host", "hsic0", "hsic1";
@@ -389,6 +408,7 @@ ohci: usb@12590000 {
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_USB_HOST>;
 			clock-names = "usbhost";
+
 			status = "disabled";
 			phys = <&exynos_usbphy 1>;
 			phy-names = "host";
@@ -405,6 +425,7 @@ gpu: gpu@13000000 {
 				 <&clock CLK_SCLK_G3D>;
 			clock-names = "bus", "core";
 			power-domains = <&pd_g3d>;
+
 			status = "disabled";
 		};
 
@@ -418,6 +439,7 @@ i2s1: i2s@13960000 {
 			dmas = <&pdma1 12>, <&pdma1 11>;
 			dma-names = "tx", "rx";
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -431,6 +453,7 @@ i2s2: i2s@13970000 {
 			dmas = <&pdma0 14>, <&pdma0 13>;
 			dma-names = "tx", "rx";
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -453,6 +476,7 @@ serial_0: serial@13800000 {
 			clock-names = "uart", "clk_uart_baud0";
 			dmas = <&pdma0 15>, <&pdma0 16>;
 			dma-names = "rx", "tx";
+
 			status = "disabled";
 		};
 
@@ -464,6 +488,7 @@ serial_1: serial@13810000 {
 			clock-names = "uart", "clk_uart_baud0";
 			dmas = <&pdma1 15>, <&pdma1 16>;
 			dma-names = "rx", "tx";
+
 			status = "disabled";
 		};
 
@@ -475,6 +500,7 @@ serial_2: serial@13820000 {
 			clock-names = "uart", "clk_uart_baud0";
 			dmas = <&pdma0 17>, <&pdma0 18>;
 			dma-names = "rx", "tx";
+
 			status = "disabled";
 		};
 
@@ -486,6 +512,7 @@ serial_3: serial@13830000 {
 			clock-names = "uart", "clk_uart_baud0";
 			dmas = <&pdma1 17>, <&pdma1 18>;
 			dma-names = "rx", "tx";
+
 			status = "disabled";
 		};
 
@@ -499,6 +526,7 @@ i2c_0: i2c@13860000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c0_bus>;
+
 			status = "disabled";
 		};
 
@@ -512,6 +540,7 @@ i2c_1: i2c@13870000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c1_bus>;
+
 			status = "disabled";
 		};
 
@@ -525,6 +554,7 @@ i2c_2: i2c@13880000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c2_bus>;
+
 			status = "disabled";
 		};
 
@@ -538,6 +568,7 @@ i2c_3: i2c@13890000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c3_bus>;
+
 			status = "disabled";
 		};
 
@@ -551,6 +582,7 @@ i2c_4: i2c@138a0000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c4_bus>;
+
 			status = "disabled";
 		};
 
@@ -564,6 +596,7 @@ i2c_5: i2c@138b0000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c5_bus>;
+
 			status = "disabled";
 		};
 
@@ -577,6 +610,7 @@ i2c_6: i2c@138c0000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c6_bus>;
+
 			status = "disabled";
 		};
 
@@ -590,6 +624,7 @@ i2c_7: i2c@138d0000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c7_bus>;
+
 			status = "disabled";
 		};
 
@@ -601,6 +636,7 @@ i2c_8: i2c@138e0000 {
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C_HDMI>;
 			clock-names = "i2c";
+
 			status = "disabled";
 
 			hdmi_i2c_phy: hdmi-phy@38 {
@@ -622,6 +658,7 @@ spi_0: spi@13920000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_bus>;
 			fifo-depth = <256>;
+
 			status = "disabled";
 		};
 
@@ -638,6 +675,7 @@ spi_1: spi@13930000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_bus>;
 			fifo-depth = <64>;
+
 			status = "disabled";
 		};
 
@@ -654,6 +692,7 @@ spi_2: spi@13940000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi2_bus>;
 			fifo-depth = <64>;
+
 			status = "disabled";
 		};
 
@@ -668,6 +707,7 @@ pwm: pwm@139d0000 {
 			clocks = <&clock CLK_PWM>;
 			clock-names = "timers";
 			#pwm-cells = <3>;
+
 			status = "disabled";
 		};
 
@@ -709,6 +749,7 @@ fimd: fimd@11c00000 {
 			power-domains = <&pd_lcd0>;
 			iommus = <&sysmmu_fimd0>;
 			samsung,sysreg = <&sys_reg>;
+
 			status = "disabled";
 		};
 
@@ -716,6 +757,7 @@ tmu: tmu@100c0000 {
 			interrupt-parent = <&combiner>;
 			reg = <0x100c0000 0x100>;
 			interrupts = <2 4>;
+
 			status = "disabled";
 			#thermal-sensor-cells = <0>;
 		};
@@ -753,6 +795,7 @@ hdmi: hdmi@12d00000 {
 			power-domains = <&pd_tv>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -766,6 +809,7 @@ hdmicec: cec@100b0000 {
 			hdmi-phandle = <&hdmi>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&hdmi_cec>;
+
 			status = "disabled";
 		};
 
@@ -775,6 +819,7 @@ mixer: mixer@12c10000 {
 			reg = <0x12c10000 0x2100>, <0x12c00000 0x300>;
 			power-domains = <&pd_tv>;
 			iommus = <&sysmmu_tv>;
+
 			status = "disabled";
 		};
 
@@ -783,6 +828,7 @@ ppmu_dmc0: ppmu@106a0000 {
 			reg = <0x106a0000 0x2000>;
 			clocks = <&clock CLK_PPMUDMC0>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -791,6 +837,7 @@ ppmu_dmc1: ppmu@106b0000 {
 			reg = <0x106b0000 0x2000>;
 			clocks = <&clock CLK_PPMUDMC1>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -799,6 +846,7 @@ ppmu_cpu: ppmu@106c0000 {
 			reg = <0x106c0000 0x2000>;
 			clocks = <&clock CLK_PPMUCPU>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -807,6 +855,7 @@ ppmu_rightbus: ppmu@112a0000 {
 			reg = <0x112a0000 0x2000>;
 			clocks = <&clock CLK_PPMURIGHT>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -815,6 +864,7 @@ ppmu_leftbus: ppmu@116a0000 {
 			reg = <0x116a0000 0x2000>;
 			clocks = <&clock CLK_PPMULEFT>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -823,6 +873,7 @@ ppmu_camif: ppmu@11ac0000 {
 			reg = <0x11ac0000 0x2000>;
 			clocks = <&clock CLK_PPMUCAMIF>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -831,12 +882,14 @@ ppmu_lcd0: ppmu@11e40000 {
 			reg = <0x11e40000 0x2000>;
 			clocks = <&clock CLK_PPMULCD0>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
 		ppmu_fsys: ppmu@12630000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x12630000 0x2000>;
+
 			status = "disabled";
 		};
 
@@ -845,6 +898,7 @@ ppmu_image: ppmu@12aa0000 {
 			reg = <0x12aa0000 0x2000>;
 			clocks = <&clock CLK_PPMUIMAGE>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -853,6 +907,7 @@ ppmu_tv: ppmu@12e40000 {
 			reg = <0x12e40000 0x2000>;
 			clocks = <&clock CLK_PPMUTV>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -861,6 +916,7 @@ ppmu_g3d: ppmu@13220000 {
 			reg = <0x13220000 0x2000>;
 			clocks = <&clock CLK_PPMUG3D>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -869,6 +925,7 @@ ppmu_mfc_left: ppmu@13660000 {
 			reg = <0x13660000 0x2000>;
 			clocks = <&clock CLK_PPMUMFC_L>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -877,6 +934,7 @@ ppmu_mfc_right: ppmu@13670000 {
 			reg = <0x13670000 0x2000>;
 			clocks = <&clock CLK_PPMUMFC_R>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 

-- 
2.43.0

