Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBA449B1EF;
	Mon, 28 Sep 2026 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635109; cv=fail; b=RF80ZY6EvhdaVOFH/RELcZKktpU4kzASpMgtXmhYlvfB+3JJ+j/ggCObwwThfWlUhtKZ9g1RmDeE3wBfyql9CzcIY7aHtXi9AWBUOE5837LblODsI1+QjMJI7h9r2ETySMiXQDxVJXyZM8crD87stjzh+MRFMru2aXUR+lilE7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635109; c=relaxed/simple;
	bh=SWeFvaw3K7CIrDHhOxN0N1Konbg4l13HZGjFgMS6i2s=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=CMRc++9ILjsdZO4z3UTb+RdbCeV45kUzIxUU+b4DCq/MA5CIuRrXfGaHe59fhcUSP0u3HyJpj/Qh4sfrDWfLqgnsbe1XpXCpTmoqy3uiYxTmw5uMByqROfrH+Y1Nbgrf2pB+QzZhIa/SONj1jIGr1MJCX0yVVB56DwSPPMczvrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=IDJD5WGm; arc=fail smtp.client-ip=52.101.69.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="IDJD5WGm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3kkTXHJ8XGwTbNXqIi+1Qj5yBWoRTlOA4BJ+fgvsqgK36uGSojay8KtFszA8c0CPL+shjJrjjO/LVRalQY/MTe5Mn+Sszk/k0cBVdg+Dr36gCo9DkbhgU+gMBnZDY3oF/e97SZvWUwQYxula3OdHBLU5YcehNZ+fLJ4jnT0lB0sg6qQHWzlE9cnp8fDElCEbX0O4u5f3CbRCS2R6p20Y+b8wMcW/7Ndl+DDDS7RyMBabk5DsrKfTAYx4u9LY0+CUFFFFcLG/v7P16jA8IS5vCYpA4aIKG+PrsUyIwhFiC8ERwlH2vgbjtZw3dDk8liaYhSmWa+U6fby1a6H91jJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiZXlagZkm6y+zux8YPMx4naf87MH3EBqhCJWS0OmnE=;
 b=Inl+5KelVV0u0AXU3C7jPdrV25LK7VrqW1Ao0+/U+4r8y40HrokbnUcDStN6GRIaHWp1HzjXbBx+Rv2MZBSXCFIsPCQPG5bqJNAhJ7BMjLFoA7pJptqKIMctZj2STgtZH89G7juc/eBP423n6+zd+s9uuxf1RkWPiC5vKIEvMjSqb/EcP5lESrQIHnFyrUOWxJq6GaGt/tXFD2fL3vZdhVs98OMbzFXTgKCTfCE6BR3aJgtztusPfDvKlcjX/xoVs0Grmts7+wE0/Iw4nJwvnM97YtgocWQKINJQOjhOMehhcpkf/0D/P7e6RKvht0Cs28nnUnfWAbf+Bv9wf5DGTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiZXlagZkm6y+zux8YPMx4naf87MH3EBqhCJWS0OmnE=;
 b=IDJD5WGmcbsSSYxA/E9cut3PsUyVfX/99/PxpFMjiilZZYeFEsLTgcbVJoXbYazw934fa3NUZh5RWrP+kXIKLw89poIEJGkBj5rL7iyMVIOsOgVgoPp/J2O5X8R9ch8kOL3Edw0Mle4akfkFrYDeo4u/g0Kb73FVB7s1kJIw/Qk=
Received: from DB9PR06CA0022.eurprd06.prod.outlook.com (2603:10a6:10:1db::27)
 by GV2PR02MB12411.eurprd02.prod.outlook.com (2603:10a6:150:36f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:21 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::59) by DB9PR06CA0022.outlook.office365.com
 (2603:10a6:10:1db::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:21 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:16 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 04/16] arm64: dts: exynos7: Align comments with minimal
 whitespace
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <656be573bbf45015cfa9e56cb43fbf268fec0851.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:15 +0200
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|GV2PR02MB12411:EE_
X-MS-Office365-Filtering-Correlation-Id: aae4796f-8bd7-4e96-0796-08df1db132fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|30052699003|36860700016|23010399003|82310400026|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aMR5vL7Qu6JPYqCzvky8q2FS4VpXlKBfI7rKYeuNlIkNe4saKYqgu8LJDxs7gr7+lFX2A4SKta1gvwXcC2/HEu9zMQ6/wJQm38gw4qjfQCJxfL6q8p0e8naNE5d++AwJXKnG99tNxpBkcgysv0unWKt4RHKpFQ2nn+oGXPEIwm+s2nTEQmPVyciuuqR7kRc0xiD6skjOcK0T6wP58o3a6w5Zp0WsZk67+DlZQBEDn4ybwWhXM1Ba0VROdKtnWJNiWA79FpXts3Hvhhg4m15pOBF+HkecHParyw89/7C5HA4S7JQfsBL3Z4syvdxoh4GE78xPZ6nDoQ4ARP8NrKylQ5uirXIGQMzkFNjIipyE0HGTpwBcQKwt5ZWhIBLWTZlwqtPFz9UtYXn5zvBNJqLFMErsMvWx4lnGSUVAhQw0IlycPmHoRYWsWGkyDfJ7fNGlgk/D69FNDJT9L4+QKleXqzj93a5jwPG1MOtWwS2JgEFTk65PJhYLGCafq9CSXxF8Op3ciEucHnNOoGwdiRGWdXmCtcIkETbX+tXlPa0sON3Uw7EMKAdNy9HkI5uFNWMjxv1Xpl4/XtVe03RSIxGWTBcXw4cqyZZmg0+sUHKvW42yQydZNeRELCiTCIDDUkluzWjqjqJ6W1bw7Jr7kduYRi3GtBzVLnzuldcQcCrrixmrpRrOfonfy0Oj/jqbtSuJzGd2I8bQ0gelH7ynIbNHcg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(30052699003)(36860700016)(23010399003)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cZOrrAQB2oIQImejQKYpNfLsa65tCXwPxq1X33PE7LujcKwP+TpEJcQfpVtp6DpSZcBwOWCNh5ZxgiR+opLJbwWcSSFHWTbQHqcPOd5m3Is21RBCjJvek07ShZuz+86doDk3SNqQ/WrydyPaHDZevbu5gya0BjQMP4LkEBC1S98U6TYNpVnnmi6rk2PHh7HIC6vxc54pYhwROwD+XvmQWsrEEL6RcaOmdp+LY5eL6+X3su0drIDuq/bySGoTBHCgRWoarsFX+JzV/SjB9j/3QMdhEup5B0PZZAv6tBaVzJv+PITWLFoE4LtlTY2EpM7TzGozYNyz4bZKi7txqB7Lf20KzPpeEIULBeSsuflofteOPPL+xgiCZqYyReo2OxroFTwLaTPancjgRDRXFS1QV15HJlbAJZoLWPkUQr4oY0NYXLnzXJToeELOtKa3rZbG
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:21.0454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aae4796f-8bd7-4e96-0796-08df1db132fa
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB12411

There is no need to have superfluous whitespace to align comments. Use
minimal amount to achieve the same thing. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 20e24db952fa6..865add183ea2b 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -669,10 +669,10 @@ tmuctrl_0: tmu@10060000 {
 
 		ufs: ufs@15570000 {
 			compatible = "samsung,exynos7-ufs";
-			reg = <0x15570000 0x100>,  /* 0: HCI standard */
-			      <0x15570100 0x100>,  /* 1: Vendor specified */
-			      <0x15571000 0x200>,  /* 2: UNIPRO */
-			      <0x15572000 0x300>;  /* 3: UFS protector */
+			reg = <0x15570000 0x100>, /* 0: HCI standard */
+			      <0x15570100 0x100>, /* 1: Vendor specified */
+			      <0x15571000 0x200>, /* 2: UNIPRO */
+			      <0x15572000 0x300>; /* 3: UFS protector */
 			reg-names = "hci", "vs_hci", "unipro", "ufsp";
 			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_fsys1 ACLK_UFS20_LINK>,
-- 
2.43.0

