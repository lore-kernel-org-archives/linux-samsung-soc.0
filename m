Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013031.outbound.protection.outlook.com [40.107.159.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D51409266;
	Sun,  4 Oct 2026 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145039; cv=fail; b=InkoSWrxdfbH7AWvIqU6GD/XYCaXgMj5KpbgYMuqVRq4UJlNTZzjVOwBBLe/erF+uTWasKC24XGo9lQju8JveqINIshvnvqdAONq5OhujegUIo8jP75qIVKi9JUhewtOxSNRz3UZOUiqs3BdXxD8O3M8Il9dbLupFjotmG5zv6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145039; c=relaxed/simple;
	bh=h1qNj87CUpqTR3ZeixO5H2YkjVle34AB3p5Ir1fQVoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WDAetT1TLjFp+kS5nyNOwDebYgYn7/17TtOCPDge3ZRm6nykP4W/G+KOEqLPZRnhqv9OKSnIOcGsXFvKwo75WX6BWNL/E/kxa7Hp4bWARRwEwy+BLHWC0Fq4H2N0zE6mTFb+bJTHQKlTcG2MYBorN3smTFJdRlUas+rIQSMO8M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=R3OuBAHF; arc=fail smtp.client-ip=40.107.159.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="R3OuBAHF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMreQnSBSM9eewk8B1Le3cZgofLkmDVDCH5dkd8IciFmc/X6z8gTkMvwmoB8sAU7703itUlbkOvhS+TXLN4+Af2xqjHYILByEi36fxIjatjhaOL8WrZP3iU9dZwdvt6dmUc7HFxlrV4RMUAco8xiTlz/fRNPkazA19wtbOK3T/bEKjSXjJpD+pnZg4kFCm2N9lGgAW/Q/uU/ROGGUalk54UcPD6tR3QK5EJCyRG/jtD9Npnr1EtUJqMw5VWaa49gZPH7ufLON87jfxoqKvlBvA63Ik79HDo1jWue2l+29pFf2WPbwhiBc8UY0sjEb+y+FWCIDgNMfczTMEv+OmpLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5uHJVwM2uSey0SplBKm84/iSnqU2vlbXa7ohWoJT2o=;
 b=kfshTI0oUPkCKpJH9JcjGanQBe1RqbVYwx1+y044FZ8cwULOolBimg/8Bm9FVpQZj5o1Pi3zOLcRWGGNHYqWPz0YngEcoKW/nxv14dM0CvI8MPVR0q5jAKar5Nn9yr7ruZq32oDtjih9GjjXyhKxntda9/9K4VW6wHq4sYXqL+DjBF6MNuBfgA2gz6PRP6I7n2kRBuQwe4DNaXBQt+z8eWc/cm7Wbpt9eV+clTlheGcTnDyry0lwqgJvXMYmI/Z/xhAuPhLiKY7HoYgKVFDKgM7/2djplT0DL1F15+FC6vrxpdBt7wxo09HbkUan988bu0SiCN/ovQtfrvaqTdrg3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5uHJVwM2uSey0SplBKm84/iSnqU2vlbXa7ohWoJT2o=;
 b=R3OuBAHFPgNRA8w8Iovt0Bb9ktf21xOyVRBQ7xz9sqHmChiAPvI9z+o8+VgkjaApyhjIHrJDxejH0YYZQDy26yaXT1MVJfkVT89BXkKqaGWOKYklGdlATgLX9GFdMUjAPfYW1YzReGS1YAZxV9Git4Q+Cm76hMtjL4fem5UMo4U=
Received: from DUZPR01CA0298.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::15) by AS2PR02MB10440.eurprd02.prod.outlook.com
 (2603:10a6:20b:64d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 20:17:12 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::10) by DUZPR01CA0298.outlook.office365.com
 (2603:10a6:10:4b7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:12 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 371984CE5;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id 02EA8803CDC6; Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:03 +0200
Subject: [PATCH 06/17] ARM: dts: samsung: exynos4210: add or remove empty
 lines
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-6-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4989;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=h1qNj87CUpqTR3ZeixO5H2YkjVle34AB3p5Ir1fQVoM=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQviwvfvo8AdRShSPE839UxUaB3FCJTz+kHT
 CORqX/b/42JATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0LwAKCRCwB25JC3Fh
 azTjCACmVcl8Efotvvgl+lk5yhwAa2l5pJ5FdrHbaINjdziOcbh0QFmjsJLnPCZyiTCbRuDAs2h
 3off/J0iRw8rwA2N3ilZvMgzm4WHKpR6b6h9EjN2F6rQIs+5OR1N+Srxt4SKxsvHYQ7JYaploSn
 PQIN4dNSr6shD8YWqnhjqxbaXN+RkzWjLYDQLMYZhsXE7bEhWJ1IeIMHe3Pmk6VWEY+DOrZS8Vl
 VEyjU5gNREnz6r4pyKc399s3+ZK1em3g3OpJcwkhOwAEyaIZKFs9PqvGNLCd4VVREUSlqPSILeT
 3BXshW3/DXFpfVkL8KJmdwpQHLGUIrDHXLVosUkfSZAfjibH
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|AS2PR02MB10440:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4cf68b-f2f0-4be1-bff5-08df225479e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|36860700016|1800799024|82310400026|376014|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HtdC4tI1xlx/c9Jv83EgEyl9sAbXdAZjHuDv1r19Ef5MyIhACf/h8pd+oWcdJzfwT8AdcP5LE0nkWmqoKW5517a3TeTiGKX9o5ZghQEHxtFAGIMYKqeXlCr0Lxdar7bFlaw4pay+TpwwgbLJt7FAw+OnP5YZG2KgOLL8nyQhMtWEIIFImBkju9Zk14ske+ylTDC0/lsA1O1ODG9ENjRlav6QnoyLx2F7PZJ0T02smUGO/AFVQ4TY37zzfme/5kd2TlP7G7x8qSpspWiljAzLrRm8Yj1RD+86g7JrZsr6XmM5B0vHWKmeJfaavCIcJbRM9A7ykbJQvomOAXPRdgL2m3jaF5Yr2fulTNaT72TQA7i60iabKM/YMQzf9MhzAR6buZRCSM4dBZUakLWA2KPQXEa2jLJ1zrpZXqDzHX8Z6zaRT21gheBur0pclK0Fd9iZSh8JQ6CVFisqRFrbOB27ld+4nMMpHdfvic2WD1lNBT6M0qwivfWYhXS0Trx7tKqxqQVieX5iRnU1wD6dLCbC/2ee8vxzR+e4seEcpPCMB1eAQFXZehKccIG127Ohuwgsq0Q8GQHolgIGtGfLFynaOXM4+By/ooxCxEPc+1nhuApB0/aALj89L8VqYjLIFlrU9pa01ujXAZSn1EkRLcYakL9BGepAt7zd9L8D0Ue42jPsJbK2fiTekmGRybg0lvD+UYeoBT8qZ5kTV8FiGUWCpA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	owpg/hK2KjAMK7BIfVo30IWBTNJt8ay1Niu2DYRywtDM3KmtnqoRLsP6LqbRBiMKZSGxJ7HMot1lrUAJlHz/+/BVfRnK704jF/17quIHYsSSeRJzIO0FQwX6pHoKRebKBfQn8p1YQSGFhV2fUvqIFDHx/FmPnZsDMilRKpoBKYZKRhYoSDHmd7ObRuVukYeNQrhhXxRVxYzA6tBhAEEq6fNYIZaxTM9JBREKmDuFQv5QBZGRtbUec80NP4B/qpCRcTW1fU0VUmkuMVCG7m57SvsTyQwkSb0MhRgh1VtnqtrdEUv3SnHsjGLBNs3tYi8F+B+06LCV//K1rIi4drmstomL9kaf9GOtjobuoJoFIx4wcxkWquxfACI2svZJt15tjX9UikZdJKPpoQU++3lfdfMI8A12UIkmTR73LHj6Xi9SH0317NZi9Yipey51lap+
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:12.6997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4cf68b-f2f0-4be1-bff5-08df225479e4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10440

For better readability it is preferred to have an empty line before
the status property, as well as before every child node. Empty lines
do not really help at start of children nodes though. Add or remove
empty lines where applicable.

dt-check-style in strict mode reports the issues like:

  samsung/exynos4210.dtsi:36: [required-blank-lines] "status" must be preceded by a blank line
  samsung/exynos4210.dtsi:45: [required-blank-lines] child node must be preceded by a blank line

Fixed partially with the help of dtfmt (Devicetree Source formatter).

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dts/samsung/exynos4210.dtsi
index 66b1a55f703d..66f35c4ae6b1 100644
--- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi
@@ -33,6 +33,7 @@ bus_acp: bus-acp {
 		clocks = <&clock CLK_DIV_ACP>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_acp_opp_table>;
+
 		status = "disabled";
 
 		bus_acp_opp_table: opp-table {
@@ -42,9 +43,11 @@ bus_acp_opp_table: opp-table {
 			opp-134000000 {
 				opp-hz = /bits/ 64 <134000000>;
 			};
+
 			opp-160000000 {
 				opp-hz = /bits/ 64 <160000000>;
 			};
+
 			opp-200000000 {
 				opp-hz = /bits/ 64 <200000000>;
 			};
@@ -56,6 +59,7 @@ bus_display: bus-display {
 		clocks = <&clock CLK_ACLK160>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_display_opp_table>;
+
 		status = "disabled";
 
 		bus_display_opp_table: opp-table {
@@ -65,9 +69,11 @@ bus_display_opp_table: opp-table {
 			opp-100000000 {
 				opp-hz = /bits/ 64 <100000000>;
 			};
+
 			opp-134000000 {
 				opp-hz = /bits/ 64 <134000000>;
 			};
+
 			opp-160000000 {
 				opp-hz = /bits/ 64 <160000000>;
 			};
@@ -79,6 +85,7 @@ bus_dmc: bus-dmc {
 		clocks = <&clock CLK_DIV_DMC>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_dmc_opp_table>;
+
 		status = "disabled";
 
 		bus_dmc_opp_table: opp-table {
@@ -89,10 +96,12 @@ opp-134000000 {
 				opp-hz = /bits/ 64 <134000000>;
 				opp-microvolt = <1025000>;
 			};
+
 			opp-267000000 {
 				opp-hz = /bits/ 64 <267000000>;
 				opp-microvolt = <1050000>;
 			};
+
 			opp-400000000 {
 				opp-hz = /bits/ 64 <400000000>;
 				opp-microvolt = <1150000>;
@@ -106,6 +115,7 @@ bus_fsys: bus-fsys {
 		clocks = <&clock CLK_ACLK133>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_fsys_opp_table>;
+
 		status = "disabled";
 
 		bus_fsys_opp_table: opp-table {
@@ -115,6 +125,7 @@ bus_fsys_opp_table: opp-table {
 			opp-10000000 {
 				opp-hz = /bits/ 64 <10000000>;
 			};
+
 			opp-134000000 {
 				opp-hz = /bits/ 64 <134000000>;
 			};
@@ -126,6 +137,7 @@ bus_lcd0: bus-lcd0 {
 		clocks = <&clock CLK_ACLK200>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_leftbus_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -134,6 +146,7 @@ bus_leftbus: bus-leftbus {
 		clocks = <&clock CLK_DIV_GDL>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_leftbus_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -142,6 +155,7 @@ bus_mfc: bus-mfc {
 		clocks = <&clock CLK_SCLK_MFC>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_leftbus_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -150,6 +164,7 @@ bus_peri: bus-peri {
 		clocks = <&clock CLK_ACLK100>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_peri_opp_table>;
+
 		status = "disabled";
 
 		bus_peri_opp_table: opp-table {
@@ -159,6 +174,7 @@ bus_peri_opp_table: opp-table {
 			opp-5000000 {
 				opp-hz = /bits/ 64 <5000000>;
 			};
+
 			opp-100000000 {
 				opp-hz = /bits/ 64 <100000000>;
 			};
@@ -170,6 +186,7 @@ bus_rightbus: bus-rightbus {
 		clocks = <&clock CLK_DIV_GDR>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_leftbus_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -182,6 +199,7 @@ cluster0 {
 				core0 {
 					cpu = <&cpu0>;
 				};
+
 				core1 {
 					cpu = <&cpu1>;
 				};
@@ -234,9 +252,11 @@ bus_leftbus_opp_table: opp-table-0 {
 		opp-100000000 {
 			opp-hz = /bits/ 64 <100000000>;
 		};
+
 		opp-160000000 {
 			opp-hz = /bits/ 64 <160000000>;
 		};
+
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
 			opp-suspend;
@@ -353,6 +373,7 @@ ppmu_lcd1: ppmu@12240000 {
 			reg = <0x12240000 0x2000>;
 			clocks = <&clock CLK_PPMULCD1>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -489,6 +510,7 @@ opp-160000000 {
 			opp-hz = /bits/ 64 <160000000>;
 			opp-microvolt = <950000>;
 		};
+
 		opp-267000000 {
 			opp-hz = /bits/ 64 <267000000>;
 			opp-microvolt = <1050000>;
@@ -511,6 +533,7 @@ &mixer {
 &pmu {
 	interrupts = <2 2>, <3 2>;
 	interrupt-affinity = <&cpu0>, <&cpu1>;
+
 	status = "okay";
 };
 

-- 
2.43.0

