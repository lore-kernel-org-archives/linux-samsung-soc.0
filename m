Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6874750AC2D;
	Mon, 28 Sep 2026 22:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635125; cv=fail; b=coj1t9Gs7h1SKkm9tm4VoydtL81RWWG3UpLeHrvCvk8n26jyRCeAeuzUa62i3p/zqSmLpT4tU64VaV5CyBmRSFIrPZjd+soVPMgXf3kYSgAq0LJL+LU2yLEgQFo0Ys2svN5U41W+AzuUzOqYPPUnOMVZgy307j4VmkYx6H2hHoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635125; c=relaxed/simple;
	bh=zFmwXayU1cXfsqHBSquGbALfy31gATaMSDRMpFNB/Ig=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=HGUiQqp8LXYP49VE9BD+TCaSc9LeQ6z2HblrpBvAGmwuxzveaetNB9Mnj82YwKQVcgL6oX+1A/+hse9GvzfiHi0PcIoW2eH1EwQzUha7Ia+1XScNtRLgaxXsLmHT6hty8DO77SbaWezFjaFaS7e0Xl8bDsISMBiDwv8IZWgI/8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=M9IHvQfG; arc=fail smtp.client-ip=52.101.66.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="M9IHvQfG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/USXO4f+NMKbfgygAn2CTrBFUZ2Xneg4O3JqUI/JuphyKG0T55DUI0fqwfDooqEF8X3o+jT331UqJI4XxXArpTRyAR+DyunN+2A988VQofhqyc/scFh+bE6fuhYN1IV2xx/pjfs7Dn3d1aUE3CCNzRV3qRw0w++d2Ci0UyA0fq1mSCxFx1Pr7WaC7k/CTTe2AQUVxwRXkIuesx9B0TqKz+Yr1cxFMhFkEcGYQD/QHfSyv9qR5ie2AfQ4SewElBhz4PWbdMJ0bVZQ/QIZQaCXM5PqYYYKQdjTB5Ds9UbbTpvwoQ9NakjFmtYexTEw3eialk7m6SnlbTOOhuKuxZ3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Taczx4EuxBhk6tbPphLZ4zBmKXAIBhM8RCEuArAq+Wg=;
 b=X3N6kh4MzELLBOiecr2H1Id3y3VYvWSDpKgFfLBzANOfqUvdNCpoqYP/Cz5+QknW6TldFD0t9O1VaUJ7jzZa1RLikLciU1wAbXhToVEjgTm0jxVGtUyHVmjn024uYkbIjIPviwYCacJ614XMDrZITbNI97oiuORtRTJWebaZAhr8cyTS4BwSMtFTuB0x2wsMRlMJYh5T3tcF561+T9ijUfde42+hji7+maI+YaCkPPUuvo9DYsik0V8GidHAhL/XjQaizIWxEvZ7dgO5lF7EdxGEHDQ3jQFZk6bXDq25FjFzfrc0+zGfog4JjHMOj+KXeKSG7TyARzQHfuGeEfcmYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Taczx4EuxBhk6tbPphLZ4zBmKXAIBhM8RCEuArAq+Wg=;
 b=M9IHvQfG1AVm5TGW0wfQVxiXGWrrdkZE/LTOAMLCktigC0StsIEXFqBd8OWWTzkgtOX3QXG3yhrp07pwoRjRmAIE+WjJHrNHyCAVzuV4DwPDJTvqVDO9D8mTMXhX4d6ugscm2qnPQGovjqwZQPQRRnuYUKzJq1NYfUw4PPk7Hto=
Received: from DU2PR04CA0352.eurprd04.prod.outlook.com (2603:10a6:10:2b4::23)
 by DB5PR02MB10216.eurprd02.prod.outlook.com (2603:10a6:10:4a3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:40 +0000
Received: from MAD0EPF000008AD.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4:cafe::77) by DU2PR04CA0352.outlook.office365.com
 (2603:10a6:10:2b4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AD.mail.protection.outlook.com (10.167.241.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:40 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:28 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Peter Griffin <peter.griffin@linaro.org>, =?utf-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 16/16] arm64: dts: exynos: gs101: Add space before line
 comments
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <2134325f4cc601585513ee5f95fc9ef2666064cd.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:27 +0200
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AD:EE_|DB5PR02MB10216:EE_
X-MS-Office365-Filtering-Correlation-Id: 333f6f43-fa99-440d-398f-08df1db13e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|23010399003|260925021311599003|260925021911599003|56012099006|260925022911599003|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VzS/5knCQUE4htXPFFHe3PtRyNCS4j3pprQVhWe8vpZm4jyhdYIAFkU5LJENZT1DGhaClX4a2ZckWFVEeXjqQMyoO4YuDBVY1x+tRFjA9YqHz+RJJ2ApxWLun9LW428LFqnUHbIThqufor8ZI1ucsli7tBeXwhQNGpr6QyB4wgVbReSpVIQEh1lA/2xU5h/x1UNfb2jYyTXXR8+YE7R1TAuzwKrkOZZp+pr0flOlS3mp4x9p1kek6jR09+s/xrxzTag65pAIywHYKINwl2AvtMNnwZOyhy5M183c4l9SDzyzjD66D9q1F68BLZBSzq76/yCjOOWz6+oAoGb+2bCvToKk55gHNEBEvUXqgYwd+wV/MAjWyh6AkTt986qBmQKA7zveKKWeazrUN+/THWaRGF8PlLaBOGhmNoX0sfD+D09MDotsGJdctfWnCXxHTK8S7trjj8Ut96fFA16yaGz5DH0+Ntk1UATuX8aYDEmBUgbQSiCOmiGevM9LTsJAvPnFg9mJnUYTbYjUxy2oiQCGWgQuUkuIUhBar4wS3R545afzTYI4bNuD/ALJUhCShP11FwGLSHPxY7aQn4LxUhsp1m5wl8bovCMNsMtLwEw9ASd29AhFpm44BpCdfhC57VCz++2s/dfI4R6IUJu9pRFV/EsHeLDW9qnS3MyaKuqMIlC0JFj3knT156LKXzT7XC+o
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(260925021311599003)(260925021911599003)(56012099006)(260925022911599003)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tyTLmSLFPeXX9zR7Xegrq+QOPkkq71l9+fMnx7Sr/zb+2yBVn6pGzBnJgk+b7WjoV0PF9g2BvA2d4YGf/fSumQsiFgH8c+DslO2g6/bMTdZYnX8pZdUBpVZXtxQObox6IBgQ2W3f0vlNX2Vw0/KYV9J47aLSh0RAy9ot8n2YX7vr60LXaKWDz/MxY/MU4md/Qi3Gy0CZcq3X5+xdFG2ORmaSwNpTQaEZu8O1nY/aiQ6133Etksn3XJHwErc1i50Wc6knRv6E+WPi8EHRuVIV/Z6C7dKsOnwbwflIpAfRpv8WuEjBTaaNOc6IRJ7zwmuz6YtSGa16alWg9MU+gza2Ybrf2uNLp6/ueT/rQ2uOlggPt8N2Z/PsbTFtLnEdehJCZkGi1rbW1nfsG2WaKDJ0Tm6Y6zwyiUIah5cOgA2Lo9+wVficKaMrxWjTTazVUJij
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:40.0050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 333f6f43-fa99-440d-398f-08df1db13e57
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10216

There should be a space before start of comment delimiter. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index b67d98ff99fc4..1af8087838467 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -661,7 +661,7 @@ gic: interrupt-controller@10400000 {
 			#interrupt-cells = <4>;
 			interrupt-controller;
 			reg = <0x10400000 0x10000>, /* GICD */
-			      <0x10440000 0x100000>;/* GICR * 8 */
+			      <0x10440000 0x100000>; /* GICR * 8 */
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
 
 			ppi-partitions {
-- 
2.43.0

