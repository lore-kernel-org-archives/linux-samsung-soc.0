Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011001.outbound.protection.outlook.com [52.101.65.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3CC48033B;
	Mon, 28 Sep 2026 22:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635122; cv=fail; b=ceQ7+wIszl7XnxEpzsX4azk2BSrlaULEZ5OvivoZ+6HK48N5bFRZxWOywJ5kAXzSFxLW9ldxIOIceULMgOTDPj+7xMmCqsmebatSoq2IzLFCv/hUtn8LIno2kGGWAY4YVtMGoyJ4//+KEiuuy7m2Jyh2jmy8hgL36ugbk0CL2Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635122; c=relaxed/simple;
	bh=G9fMxDprZKFLcL6vYUjHY8K79Dj5g1mriPUiq1MDT+E=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=dk87iLDmfjWitbydaehRAhZbdOk948tLkyUOibHHztcMKeNPU8fkyEAgsAVaweTAvjmzkeo3ClL2+2/UwwKJnppThHXftgfF1SRfSFMzEh7mDM90t+cXdsrm2bPDmB56kf/X7XyuDTA8IvEbPzLqbLlLj950TsUIxn8nMk4Ph3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=ODRPlCBz; arc=fail smtp.client-ip=52.101.65.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="ODRPlCBz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTsqt+bS+L0RPC2j5wqD0w5vxR0J57PL7Y2F3ZZ0C4imVs13ZPaYKVTDj4Ynx33irrdRUXfZ5mI7vOdW48KAJky/oJZd42GDa/evSJlZj3lLsuGmMHnYoxEW9Md2p8Kh7htbID5m1MbR4EWkWM14U2DQzminTCjNYP9g9Q4gmcrKgYhoZjgnVwUlqiRBtcQ7chAcht5vkjOzf2qaVyy/XZ0OeWWUqtwQIkX4KI/ed/eKiogv46KBXfX+4zW67TPuccWAdfRR9ydC3xogV9o+l4H79/1q+FaqvixP0RD7REaqozRybz+6r9W4G9fBVt1LCHZyQllM2VquqNitv4X4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0WD7KiNmciC2LKDjY64BC51rr7W6CvBAPcLYIAbNoE=;
 b=CtF8pnMSIHNgsB4HcEmNQi7S6OykUh6iSERwAEivDHgxxi4R2wmhRMgeIKiLVFNiwpELjyjZMlUz4orcw5DzCip3Y7TCMoI2GHPFx6YoPtkTxtpt2ndfYZroWdPShvO36o58cIwcdFL7lTuDF7TcgmSJ5DG0fq1dYKI+5CI7ry6+S3jEXYVQXJu81W89qfJrFp9MRUu+i8prhTebgJmLEINlEALIL5I/oL8mplb1EViLpPAr5ggYAsx7aDpOVkC43JcBRRYJCbvKs4+TON5TyjHTjypGMmYcXtvS+IySceyyoSg55Z6zr0vUaevXLf8BY7Zq6IXJOYWUKr8Hi0Q09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0WD7KiNmciC2LKDjY64BC51rr7W6CvBAPcLYIAbNoE=;
 b=ODRPlCBzklJzYZF6noTGyj0iRIiCT1w2dccQA2fwac6wnWM/TEXrmv3dxyo+HvrvvZpJdOKL59QKGIg/FdDCbZ0oAcS032DEOIZqtsljDnddVVWoKKPEYPJzZZHE2YzADQCIRXcwRX+bQ5gakfvA7LfLx87cmbKe1YQtTM+EuFw=
Received: from DU2PR04CA0350.eurprd04.prod.outlook.com (2603:10a6:10:2b4::22)
 by DB4PR02MB8534.eurprd02.prod.outlook.com (2603:10a6:10:38a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:37 +0000
Received: from MAD0EPF000008AD.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4:cafe::50) by DU2PR04CA0350.outlook.office365.com
 (2603:10a6:10:2b4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AD.mail.protection.outlook.com (10.167.241.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:37 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:25 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 14/16] arm64: dts: exynosautov920: Remove empty line at end of
 node
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <246845529886b0f8cc2ed8237d648dd83aff70fe.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:25 +0200
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AD:EE_|DB4PR02MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: 946d4f7c-785d-48d2-7985-08df1db13c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xL7rJfZEoHwG19YOJr1dQaie5jsJ4uV5wC51Qje/A5e+cMP+6SPtqNXQrA0nwpcRZ00p2tSXYtENMwsrJrK1gkEl71gi3SB6R9OKzTfZEE71l/aKQ09eoF5bvE7xnKjIUa1Z0YbZS1Csb5ooyNF3EjZRQUpLjnM82yNMjp5yA6WNOaY5xHMOOw3t1WztwQbLybX0iX0P37B6GTDadXfzslxiRlFE1gFweS/iN8VRuk6H6eC/7xITkqoJmXNjHCswU0SG9vB2H9M3jJx1e7i27BLqN9ADGnNk4U4kSb6uuZnm9dMwjbHnyJnMvyBeepn0YlLpDJjZN7iq1hEWg9pZBysiwsLwr14JyRIvpdJwNC2cuRnI9sCsThokBPYNsGc9bwg7Ggfh1WbftAoXvMsdg1jRWu6YftN5+2Ptl20eJSggOTK3CZbmx1vFdIzfphWlDe19VYeqFacmq3OJ0GMOz4zq3HuA+2NKzoJ+iX2hUfguChzNjkt33FVPI+tF9/K9wOrhUwMZoyfUXRJ3SxoA/WkG/5bckW+1bL8Ew4HnRg5Rw2tIsHPrcGYNhzUqhhp0sndljJpsDTDGUw7JUsdXCgB7+bwU+yAWVjeVv4Bt1LRtmtJ5SEM5FqYU9CHv8FOkcXKDyXkjG3pjjKN9dAR0vqhwoWZqXm2UBvviFyQpkAO45n/cwAaRSoZBqVH88Sw3+Sjdyo5zXLTXyZsDEEwlug==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IBP+UwlW8s9N8uV3lVkou73V30IBauS5IzW0wFMjX8YC/OZW7dF+6A+q9I2ryn+3EWXp0gjMKrwvV0eakfILx6z0jusH6IpJ4+4nrCEt2VQMDRjo9soigmNaEJ1Sfu/WXml2diRMojoxOf1HQk/ZZzG5BDQtk60Sh0Yto9BZc+6+BfH2fL+l8ho8gRInLWKUJCjQ2tQP/0qnLTAdg+SlfY208xP0cV8JpxE4zU0MqRF6aUL8LXWVxkwUOJKVIM//5Qa+MKqEC5C+J8zZ6W3n40+Q1pdyoPWc1wsIt0l4Qoq/TJOlTywPGSNgr7L4jiChJHGcr2W93UmxY7AT0OIly2mn2INMsmK9vwFLrwe4gZZnwlNt2B8a3MnhLN7B2BjpLyYUpeteJRSZG1NN1TL7X/Yf/llC9RVDu9HgvkDVRl1nun9tAEfAqPTd39TmsuNO
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:37.0384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 946d4f7c-785d-48d2-7985-08df1db13c8d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8534

There shouldn't be an empty line at end of node definition. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index ba02fc28e42eb..65a75b18d3739 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -901,7 +901,6 @@ spi_8: spi@10980000 {
 
 				status = "disabled";
 			};
-
 		};
 
 		pwm: pwm@109b0000 {
-- 
2.43.0

