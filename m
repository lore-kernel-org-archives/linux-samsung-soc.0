Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916B04F68D7;
	Mon, 28 Sep 2026 22:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635106; cv=fail; b=bTu+U3y8LzxeJu9llzec1jYNwEPsWmd9l0kRRdC1nx1oayPonYplmN/y++2PB7cWCXLpwUpzdLN5DNYXzDmt6FdbLrI2l84ZRQcjPFni5HL6K/glvfLIgHLxc+BCTdMRUt+iOIBIY1qfpbsK4eyd+urvxZgKc8Qe6R9E4yKBgns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635106; c=relaxed/simple;
	bh=ZC+yK8znwkB43WqaFCAuPpXwCSLbF01+4uLUTom30Xw=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=uXRRfp1OGtwMk5dEUWjphXFUS/2rYJujhwiyF/7SD0f5tbDnbQR/9SyZGl3hsdiK8/sC5KK3IwVTKS4eJcg3K5jyoB9afOaEuZTUyFSrV/EAZoN4QAVenCOFM9ia8tWfRfEe4zimzbf6RWBUqsGuG3AisCwFHNurHH18gRAVqas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=n9MurdeZ; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="n9MurdeZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoYC/n2lr0f75Lj72MmuTqHCQp0nh3umPs6KExasjZK/BCXrkX5i7C1hGbDgrwaWLMEHSsOvakrGftlDBlkungGbXn42JpU55fwmFNfv+GzWCR33QC/xl70LEXIzH9RNXPz7e9BfBwQaqcyYRdSsLk2hzn8B6RbNoizwmZXBw0W8aq7cxlryXUNbR15YkbX5GynLZygsLPYO2SlyEw9JheHbbg6QLYH4iA+pWg+aeABOWAmSZm82aVE75mvYcRTontXQqYZECsfr4FJJelTY/oS5b5/oWVLu7+0w7faodHY6JasJ8imx7SsNJ7LH8xUAEb9OfEbIji2qm5JgRsZ9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLyeI1YyaiLRHWiV/agxA4HOxcKtrVcJ48UcZJT/KPg=;
 b=S0Yx7cENyciygus8930LT9caAUrmksE3Ms7Hjs8GZwJalxVS4uSEElfQIkxCFNKAfU8M+PSYWFgrMldYLZNTXHSwf0KNNj7EZcbhglDE88RpLlyP5RqKKpnt+pGn2Z+vz67Tpnf0OUWpp6PJ63w24pgozCNigTL8fySIUQJ5NJXFAq0oLTExNufsB3K86Nk9inFyw46qgxnOpzegcbMpof/g2hGVTG7V8JiMVHjyJ4UjKIMPhLWQHpi9pD7NUwF/XmZq7g9tA4bcNMLh7CKDD7+RflU2Fjen6spy8Wi4UPiYXAmHvrRz3xjitutA5iefBfq3jsJZztFxstWQoMCeJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLyeI1YyaiLRHWiV/agxA4HOxcKtrVcJ48UcZJT/KPg=;
 b=n9MurdeZFbG6bhhOYgt3AMCrfdEnySlfMme+cuaF6Oj+kpKXkgoIgN8tWjqh1+xHKwU9ytOWYfxTenJy7FZk0sQCxQPCAQj7nwy/6YfUto1Mbv52t4C7SolQjv2JLD2hAANVARWhB9CRM14aOnncEo4X3RjsBKYc48dhW7fhuxA=
Received: from DB9PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:10:1db::14)
 by MIYPR02MB12283.eurprd02.prod.outlook.com (2603:10a6:290:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 22:38:19 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::59) by DB9PR06CA0009.outlook.office365.com
 (2603:10a6:10:1db::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 22:38:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:19 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:14 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 03/16] arm64: dts: exynos7: Remove empty line at end of node
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <8fa13303ff3b3d93e824cbd008f8845219962901.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:14 +0200
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|MIYPR02MB12283:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9da413-0911-422c-defe-08df1db131d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HOOF7EHft3DUJpEEcB+MYChaajuL49R7w+5z1OB0BnGLdzpTypFLlrpNgzDnXMRjl3SjODDOWclqC7B66W9i2QcYYcMKEoPr7ymORoiD8T+Exlp0o2kVCtTiaD6rAEpV6DyhYcuGs+9W4lg3pmHbiLQ+JCIOjdjk/WNcq4GGQqQzyzYqxBzOLGvLmfqm8Dzj6kfaU6KjO8py8ZPJ0IJzkKpSz4Kcu+wqjrGAAjEXi4EYnE6bQoSjtsszoe9wLVZTIz86wn9Ur/a30Fu93ypC3cVskJtcCVYxXDFzkNvBGx93DTK0fAw8V3Vh9vG74tjZGm7XRgxStO85ACc+BfN25yTUOKxakIKUGXODRDLUYFLBk232p9DgscOQTt3AxHv2IpQocVkQZBSzSdr5ghqUEzBmlBaCxAhHkkIWB/aJFeO6RXLglM9Q5BnG5dAaXS5Xtr3O44iuH4byEqGfDJpRdpYb40CTnGz18M/6Yue3a5ZdLz6XSygf20E6XUAxRd9FJgiFfd2Sdd/mt63mPdaBiIm202xTIG/+dyCZD66/6HRYjVmoAwzNXUOxTrwGdDLT/KZ917hBKFyuDFQsDk3tb2G7kmAp6tK0+uKvvM3ynkvk1wf677r3FsPywYw3xkcs619cgW+DLUWtxmo+1EQxWxTC4kgkZGdXgKtKpWzkWI+vJcL7BjcaZWNh0NKtKBsqL8zLfI0irP6LGbg70QwnPA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KtC7z7mUGVfLnCL6evIXCPfVEmG9lL0LICv907n2a84MKWFpW4UubMPBkM0j3uQ7+PA1XM2GqrToHedc1LvIGNeqKg/nPghWCXGhRLmbcP7+bftQt5qZeIcWpvgG6EwJyZLbaNNGcWMDxZKykbPUrRHFkcytLkLLCCWiEHQwiVGoQHhvrQsXdqcTOcvW0PHWOLDnbpSQ+KDkPP5X5MsflU8Vaq3XpQNzmswmxM+79lE0DrqTVr6fJ/nk9B/7d/wdFoCQpU4YKy8dPKBuMzaBdvN8yo1oGl0XGew9iiSAgK2aQSfB6c2C9u+eeFnJ1jsAx9UIjxxDYT++mrCJDNgBxkdWbvtdTFzUbpq9XdVGq7nlF7iInwjIqXC6yGUOVs0qF9c1IsY6g2tVgLlMNrv+VwEIXYVP1w64T+NFab5XvhTAzbND+e4YR42IqYrUCvXg
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:19.1631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9da413-0911-422c-defe-08df1db131d7
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR02MB12283

There shouldn't be an empty line at end of node definition. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index b3d5b447aeb68..bbc5df5a1dace 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -52,7 +52,6 @@ usb3drd_boost_5v: regulator-usb3drd-boost {
 		pinctrl-0 = <&usb3drd_boost_en>;
 		enable-active-high;
 	};
-
 };
 
 &fin_pll {
-- 
2.43.0

