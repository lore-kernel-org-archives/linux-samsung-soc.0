Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2DF3D0C18;
	Sun,  4 Oct 2026 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145038; cv=fail; b=ZC5aDOs8eBMBNuRgTcXCGg+APz6nS9Hb5fkPx/O5wIiPZcDkbrpuXhz0ywDXZu8hvjeRVghLnzMck0q60/uHvgdUDLxD0wbs5ibdqLc812WsUdYsMg7VMyKbKI2AfYr7131lLrRsUVkAqCwwZajKcJbjC7noaGazJPP4M+mmsVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145038; c=relaxed/simple;
	bh=uROJw9hqoa8dF5BKM7bmaqS34skm09F9Y/4cNn1WkuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=huMjMnMCdz7b/Pk0vXrKFh7f26VuY95D5dj6gnNhaY6FkVikFrjRFUqSPzsojBgniGT97NQp0cARTBKvOQhFh8mOAUI9qWdfP2oSTZhs2AYwSqHr/n4vsNCkckQv3zCyvIcLEmYO3RyTVmxapkVqeN0QITdAAB7o0QY05+PNOnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=KJGzetkz; arc=fail smtp.client-ip=52.101.70.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="KJGzetkz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMHnn5xAfN2TchupTygZbq/SXF98Z4x6+Uqra46fWBqTOdQj7Y1p43GCsRU9VBkHMPwzR8xc/Wp7MeI2J2cWe2w9QsXVrZCY2+lWVMS3OONxf4BoMuBC7dGJKNH6E0A1bYujs+lTfGiXmfWeY5sOtOSwiPDY/skWIwHURmFjeru2wn8JahOjN/uOQOJU/YbJGZ1S1x7a0VWvyw8Cr1OozygqYHlaSuR/wroTSTedLX0HNZS16aNMFr3XBS/nsz5NSJnxl+gyt80wVFhJZcXeb1O+5DbwF+W1PiBX9rL5xpyqGbrEjqHgnaOsUlSeARxKimT4QqVTQrmNQ0SFtKtKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+OAbjDzu4lPy9cD9fWqkyreeVyiD7S8gW3xh6H5i0c=;
 b=jFvbmm37NKAiOWjt7WDm56FMEBZlE9zptEqDTGfGY7xPp+qc5MDL4mferwhT/yF1V3F9lp+tXzvmzr7S/VqBMwi7v3gvDvEhZyZblQREHWPoL0tasXzd5g6FxNLbFcq5r+3cASHKpUGZVILAt0QzKQiCye000dolnNF9iMTNSGJM1FvirBu5oMPxl231t41k6+XIYQwJp9mlGChv7flCbdpqv0XMt/zsXqPVrskjOfRx+Pfvwlgt7KNF1utjXro5kzdXIuqp4Ns8DndBTGveK3YpIvQwKZVjxU4jcT88YoJRNiRFNCQw6pyzIq4fQzYVnsR5y48x05Q3SZZIBXbqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+OAbjDzu4lPy9cD9fWqkyreeVyiD7S8gW3xh6H5i0c=;
 b=KJGzetkzDk2YOzra7m7M8ymkOlYg0359L4tkDrg4JEzQg+S+64Be+8ugfCwi+69pNJLr9h4otqH5/amxwTLtADR5SSZvwHeFZf/8JVd+/vNMI1UxqDL7Ll8RoHmnx7Ze30eVQOB9JJ3HpK0X/ckKz4lvzwprScQkWq5gamnc3ZM=
Received: from AS9PR04CA0139.eurprd04.prod.outlook.com (2603:10a6:20b:48a::13)
 by AS5PR02MB11413.eurprd02.prod.outlook.com (2603:10a6:20b:6c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 20:17:13 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:20b:48a:cafe::7f) by AS9PR04CA0139.outlook.office365.com
 (2603:10a6:20b:48a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:12 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 37BFE4CEC;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id 09CCD803CDC8; Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:05 +0200
Subject: [PATCH 08/17] ARM: dts: samsung: exynos4210: use
 operating-points-v2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-8-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2590;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=uROJw9hqoa8dF5BKM7bmaqS34skm09F9Y/4cNn1WkuM=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQz5bwFVpdNsfPItVnMFOA1diZ1bAZqIjT03
 Ublf820mL+JATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0MwAKCRCwB25JC3Fh
 a/Y1CACKbIJvXghBXDBmimDdCX29c6+0/3YCZr5t4cp/xYpMLI75t/N62P88L0OZjtZhphfUHvX
 zCWc0RjuPQtBvGfOziYkufYDhp+QXkd2BUop/GI1at9kF4ev0Ru4SEIXaGpy7o3y/BpSfQdzjnN
 Q2//uyXfK3hV6sL4ILZlcaNnlQeeYU902Xu2Ixdu4Q2X9kWB9aBn47SY7AQrST99BHeP8Xc6H1+
 1MZZoxxqMj6ftp7sokmEO/hbj4l1SGxh4KJeKEy4e6IG7RLjKGRQRVDht3CzGXNvgWvdWEtAKmX
 RHit/ived3f8TNWjVVi2e861dZl3WAMna4zV/Dh9R0aBbaiF
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|AS5PR02MB11413:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dfb4445-75be-4591-bd99-08df22547a10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|30052699003|36860700016|1800799024|18002099003|22082099003|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	nqXzx/75tn9UO4ueNkZszUMeKl1qk/+qb4dlsmi4zew7mZxSbaLGzoyC1+HuoWMRMXoGeDWv4Ap69i0diwD9WEoVXud5XezLvYAHbRCYjFIRNxBuSQjPB1KiIKT4E4FhrT10pCLCLpF1soB0y4j0xe4wjs3jC+PcDk8iSSZUQgAKtckZlELeugJXwxVvVHVsunYjsJGhGHT5/SFadFM4SzJj1+lUFlYCugAhPpygKFVXgWtVsww0u8pE4TX1QCZXEUVCPH+OqOxufLkxs6pvafeUv63xFMnMHBg9qKVopGMfP3J/KgK2KQH8Kbu+MJxIQgpogEGpx1BZGiCNr/32EfSuOG+czQWRJbHnlWi7n41PHh0PHOqZDvAksYcE2tvAicUB9nuBdFE0IzVI4Ko412XmG6uvANSFGVdg7T5ki7HaDE68b+imYpQE/nU9k3OSgjCc3EV8QyRljybKXA+2jylDs0/V+/B+3AIRVzMBvNit6QIG3pP+puQESsFrCU9aKLti3Y4cPjQC+HQZvv+rnf7pDcsgCiZaNdO/R1Qbwb+5BANSV+R/EatPhjCT73FqSHqHBZFCgKLWiutZLE5YmT1xR9VT9OGw/nMqwmK2XxRpc3hJ24Vv6vRKfK8ox2o+oT7xOnEZb1xvsPi310K0XOeT5CdZM4qZ9qAwHddG1xotjDiuOSoynYHD8zTcGodenzF9N+kwuADRgLBEn0FdKg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(30052699003)(36860700016)(1800799024)(18002099003)(22082099003)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gYGUXap641s8WHWEs27LP1Nakcm19jEPTj2pPa8wHOnamSdB3FbWvX6vOpjXhGVDj65gta8YezNkovLiPVxu2O4z/qFPY7CK5+/NwRUeJRZqCzuwn6bomUjxhfc8fEJrsV/hY9ZJuY4i4ORoUeQN+35w13RqauBDeg7ep4mycoT/dtMyg02/yOOXLrQtbGPfY4gl5uHoD4iEmDRw8rI4kwlBPPj+x7wx/NBdp5xdl6Umm68zWyG5zTgYFxZUzeRmumPHl1JMuahLcSrxN4KGEx0CUiJDzK47AohymtU4UT2dPlIAmXHwQO7WoLwlDyGYYH1PX4a8q3QswfT21X+t06ezp+l/94bhLo/WrFUVnJwMuU9yLz/A6NDy3/QihNxVur9xGm7rSC2qy6vpimJv4zIiDiHF6EVzmzwcP3FE3880erWKXQpFc21ds9QgZeZ2
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:12.9897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfb4445-75be-4591-bd99-08df22547a10
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR02MB11413

operating-points (v1) is deprecated, switch to v2 instead. This fixes
continuation-lines warnings from dt-check-style at the same time,
i.e. warnings like:

  samsung/exynos4210.dtsi:218: [continuation-alignment] continuation should align to column 45 (to the value under <)

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210.dtsi | 64 +++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dts/samsung/exynos4210.dtsi
index d37ac0c97dbc..4981bbb7cf31 100644
--- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi
@@ -212,16 +212,8 @@ cpu0: cpu@900 {
 			reg = <0x900>;
 			clocks = <&clock CLK_ARM_CLK>;
 			clock-names = "cpu";
-			clock-latency = <160000>;
-
-			operating-points = <
-				1200000 1250000
-				1000000 1150000
-				800000	1075000
-				500000	975000
-				400000	975000
-				200000	950000
-			>;
+
+			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 		};
 
@@ -231,16 +223,8 @@ cpu1: cpu@901 {
 			reg = <0x901>;
 			clocks = <&clock CLK_ARM_CLK>;
 			clock-names = "cpu";
-			clock-latency = <160000>;
-
-			operating-points = <
-				1200000 1250000
-				1000000 1150000
-				800000	1075000
-				500000	975000
-				400000	975000
-				200000	950000
-			>;
+
+			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 		};
 	};
@@ -263,6 +247,46 @@ opp-200000000 {
 		};
 	};
 
+	cpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <950000>;
+			clock-latency-ns = <160000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <975000>;
+			clock-latency-ns = <160000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <975000>;
+			clock-latency-ns = <160000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1075000>;
+			clock-latency-ns = <160000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <1150000>;
+			clock-latency-ns = <160000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1250000>;
+			clock-latency-ns = <160000>;
+		};
+	};
+
 	soc: soc {
 		sysram: sram@2020000 {
 			compatible = "mmio-sram";

-- 
2.43.0

