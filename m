Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9D0503BE8;
	Mon, 28 Sep 2026 22:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635124; cv=fail; b=Zb40V3zQ6+Hpng+VZQG9BRKhzD0p66fmBNU5WD0pZ3U5sX15k2P2w56zbS3S1eoFV7G9L7JWC2vLrcMNlYIrWkLBANN8/tu87VFwhoWKcPbyTs2QnSN1MhSdzUGhwMzsJFZPm2DBnSjlMG+OnHwOkuw/RIH8CIWtRALzxaQomZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635124; c=relaxed/simple;
	bh=+SJkCUSx1i9F8/JdQoRVqr/QdJf6AmMDFj4Spomn2tc=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=B4E/Jya+klfyrl4gRCN62LI0iGa83zsIzkDthQsJB8hzXc8vbi29odquFrSE/VBYgjCEI5MtVIvjPYA2SdGnUZFFKybPsGjFCyJLPEMRLcHyUg1JVTDq2JzlGsvlBTXD71KV9iz2OQUllf5CN4XrcGxNx1pALLdohJoH16qDmVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=CThyLgK7; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="CThyLgK7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geUQ2fXrnA8rer4AU2Y2LAerMs4voE3dXddK9N1HZGR7eoWKof6h1ThHTPO3favUiCj5+utQq8gvEvbjZvfQvWokMTTNzMY1pF3dpbHUhgjT6QBPtLO1iVpbJ3XIrLkmUCbMs56MKX755CmN/W+RQ8Z4WbvGI70WHSkRUCfnq8Rfdm742s6Sl89bQ8gh6ELSrqwRRwgHbt2A0N5Dg2kvKwJDHxhj/ZPCngibRL6sH0Ku5j32pEII9kuDh/ESwQzVKS9TAlOziSQnYuie0WzOi9Qsp6ZGR7GJKrjoBPCGLiGl8NOD15CqrlensSJHkFpzQbuqf2ENW6NgK4WpEl84Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qfyj9tfAbxeaD3KQoEbvF3k8IWTvrl4mHWgJRP+KqJ4=;
 b=XdJMNu+Y/q/SJq5d8N9sEQevU7nodJgWy5fUC69Cpz57pxiPMrbo2F+Af+yBVRlVM7A8OOQ9mHSX7jrO0cizt34wEhNDcUOn+hz32eg3w3cX7UGlT4A3WbRqMjqRU3p06FGRmg3ul4Sm5O6nY3LRhhdOQ/Sg0+cJ97trrEW4wFkwFozfMyEgKEJJbxGaxQExpa8gM63y9swrjzacJiDNVcYaVKGRS5XDf0RWdq5z1Zdl3zY0spkZLB6xhWJgTxtdMHvK0aXTGyY1HyopCvTTtzAx1pLe8wINQjXSCnWk+IKU45Th70WuPaf0m1uGQSOTTewG6YVyannjBbGuLMqgfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qfyj9tfAbxeaD3KQoEbvF3k8IWTvrl4mHWgJRP+KqJ4=;
 b=CThyLgK7XEKIqsEkEDWJjhbB4wC3nE0W0xWmoyWLh4uJ+sBebf0Uuaq3nmKJbXKzLfPdql4cpkfaNnGBlRwhg6yENFumfGsUK5Jr+tP3jjvegrAP756Ju+hyFMco3qzdw4IstO+PIuCS2a0j9ZPpst3MLyxhTLlkUUaGPDGQd7w=
Received: from DU2PR04CA0358.eurprd04.prod.outlook.com (2603:10a6:10:2b4::31)
 by DU5PR02MB10488.eurprd02.prod.outlook.com (2603:10a6:10:51c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:38 +0000
Received: from MAD0EPF000008AD.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4:cafe::70) by DU2PR04CA0358.outlook.office365.com
 (2603:10a6:10:2b4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AD.mail.protection.outlook.com (10.167.241.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:38 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:27 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Peter Griffin <peter.griffin@linaro.org>, =?utf-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 15/16] arm64: dts: exynos: gs101: Use tabs for indentation
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <2d6a35257c0356270788c00579c1fc6113dbd352.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:26 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AD:EE_|DU5PR02MB10488:EE_
X-MS-Office365-Filtering-Correlation-Id: f45f73ec-d689-4ebc-bca1-08df1db13d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	YldEREumEF4wRi7axXDVrfwVO1ZNlHz/KM9AQ3aS7GaIcexLAxn3OJKUM+STReAtJ5v9X4+t/gaNag9YFnIIW2+D3SPrnstcXfPjHUJWDj/W95vdwSeI6kXyFTmP9wE/IHgMLqXc4znXHYg0cKEcB1HlbUD6irsPyVcgIFdK5FtECqmpw1jETCP2J3XK70MvNKbhHAyrFjlsNsbShkebcQ84b+Lo2AOBFRslbWyZTr2vzpDuG6bY5b+T0gTYPEUT9nBtgVj+R+xoPlwI80TDQEs8vg8hyaXB0h2CqG1Kz5hrsqHN0d6zqQAHdZjtA3R4frWQZPWD9Jt3z3rDhn3bMXILC3rwI0eSXYV/dP7tfI7uZyUtRginnJp+KxQs9UXgmHaSRSACzrnFpIkshhK4HwWRRpNDCCrIZf5cAmppmepMjo4OMxC8ZyKYFV0nhidJ4bAhvFKlh5X8TSM56gPjP/ynapJLqLxxJcvGQ+qpJZGAOgvZ3QjCQ/YQWH0+8L15CT1iAt3u+BMQMdkZJHdzGMD9XLDU64RviPUNErLhDD0X38qCdaQJa4oXRDJ0n5N8+p/+Y9/Tj8HhvHQkmOlfSszZNqAl83fs1bCe0frSnvOxV7VrG7xXvAj98T74j1i8iO708xJmgNMZo7qT3u5uCOa87DvgFCoFz3cOxjkG4mpvCxvKCf/QiA2gaGej4FoyRgKtb5+Jl6A0GhKykxwkXw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b4TGVr7UBaTU47aTk+kyDI0SOhPOQMyI2yA1P/w7KLjzyhGsDVE38AL5SqwWEewvKAMmb5lCMDQ3iA88glCek5tgYLdSF7yK8n22dGQ27L22R7M3K1om7k6VtaACTsFkF7Zu4Xk8senXLDtAazNi7exLqzt0d5///DVM8PtP1fEvIF+OkSVhMjgl+oBbXWA4m4GTVJYUoaEqPEseLFPOj14mlT60jpj6GL4qffy+joVcpck7j82mXqrXfMIWh3KKO0ij0DRxYRYG2KXvBe6v9J8To8C1uFQ93zJPOpkWkIS87vBJNpE1V1gfkHWdljS50lb9JI22FWi2yRfzUtqmGO5XpSih8fpoihdvc8VZl3imBaVGzCzQyiKoQZ2ODYMWBOiE3ioBGWxCFTEL1dwBjTricc4igqRM6fG5BStIl2yZWFIwkZMrUbCJ7QqXEFoB
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:38.4221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f45f73ec-d689-4ebc-bca1-08df1db13d53
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10488

Tabs should be used instead of whitespace for indentation. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index bfceea5486f46..b67d98ff99fc4 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1928,11 +1928,11 @@ apm_sram: sram@2039000 {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts =
-		   <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
+			<GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+			<GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
 	};
 };
 
-- 
2.43.0

