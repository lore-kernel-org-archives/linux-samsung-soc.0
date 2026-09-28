Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D23F4F68D7;
	Mon, 28 Sep 2026 22:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635118; cv=fail; b=sTbehlz9tdMzUcu1R3DtR+guNOq1E+XjTsYRNgAGASbGWyMofQYmH6t15x8TLMAmtQj+K9EuWuQp/vW5LujtYGim9z6fbMvU5uNhIMNXYtOJ0vBMVMyj4P5PfL6MzEIPpDsngRQ8DAbB6X1v5glfDB/RSBedI0shfMzx9tzz+zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635118; c=relaxed/simple;
	bh=adaplshOtjwI85IbUlUQJ7xGqvj1AI8evzYtdQ9YLFc=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=AQKkFCV13yJzGB7w3n1hhCxrk7UjfogC34E5d0Y/4zNxvEMLfYmWy7qMwbzbk/KAhdqmMSvbMcatb8G6AQMNG9h7O47HAn58euMWNqKFgwEdnECwAt98il3SyS1LL0SUNO/ROdeTvo8eBMt3kOV6x4dmg7j2k0kE+4N/PB69vvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=T+zRt2j5; arc=fail smtp.client-ip=40.107.162.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="T+zRt2j5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViL1QPeUckwN4+FOoZiaU9DhOKhBa31lrqQuMPHowZrkN6MhyfxeZmgcI33ZSY5pMZata4DkfVdiJWNs/0QOWFbG8OJbgW+QFXazRSR8xU6x73XRqcbtaIUA/hYgxkdo1YdUDCARBOo/GUxe0/ukyXxz1yPQzhid2ksN1Gq8eFmbs5LojgosaUYO4XTJKMiXFhkhRFqzNUmOscoD5gGpjA6bs3g5lPJuWLbgYYtQ2inWfH1xl/V4/5hKRhNhCA8WFJzBHnC/chPzb60p4tFJ68yqd+JkkUPo5Bdlz6ypRAgTSarENArcQ2nZ6SVMt0bmhu66YYAZjqJhYTYg5nMbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Du1ON2cn/gA5rG1J/LCA3a0N7IBbDdNX/e5FSwy4JU=;
 b=w0wTS2EjxfmelRs5+bZQLt0sT4lL7VtcCz6PXXA6Fl29pSGzHiLw8smtVNyzHuJh+DRFQaZjQZICSuyZ+Y0ttDsz6k5zaBRuztJv8kl/SMaof1DW/dc0FHjcbqcclSGynzo/o48XHf0ZKjKOBONgECSaAYaDB/OazvMtm1Az/Al1Nz8uz3/mbI9bAdpHwTjtxcV3ykloot51d3h/g3T3DtZSKAEdxhd74V9O8nf3hHpQ5vWYAGfnmv1X3IhwgyAfF8Z2/zvHbsTITuFIeTwFDsOEWAmDhGhr31P8eHIrmZh3psQSofuf7i55qFpPEn9iNUctTvIUGQDFd8nt07olkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Du1ON2cn/gA5rG1J/LCA3a0N7IBbDdNX/e5FSwy4JU=;
 b=T+zRt2j5z5Odr363OyHxqNuXIw0vuiFcQYxf5ljs8iF9V49YCmj4Lqp1oOhseTScVy/Tvq4gJUEZZB0UYqmuheQYItYPfD7QncHUHGaxfoSMCV7IeSpRuijFNxTpLF0zClFCLAZBOt7+eWFRT5yK8mmDHQHQ8iViwHyqmNSzLE8=
Received: from DB9PR06CA0021.eurprd06.prod.outlook.com (2603:10a6:10:1db::26)
 by GV1PR02MB8809.eurprd02.prod.outlook.com (2603:10a6:150:89::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 22:38:29 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::6) by DB9PR06CA0021.outlook.office365.com
 (2603:10a6:10:1db::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 22:38:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:28 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:21 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 09/16] arm64: dts: exynos8850: Add missing space in compatible
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <5e580526e283d90c2b4c13ef5bc0633fd20e41a5.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:20 +0200
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|GV1PR02MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 450d2942-6236-4a1f-c57b-08df1db13790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|1800799024|23010399003|376014|36860700016|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VIq7zx+JZ4BFs6qn9lB4pGRyW5hy/bs+rSlgehtAhSUez8DWCVBJAt56tUogJlB8GSiBLTWUZ8L4FRznUCPfYZcBjDST3dXHF+bsjwK7e7iYaWsKr3gPMz5Q/p6cGQr/7kJNyWeNZNeZGOaNCDzMeVUp/Gw656omO+y06h17c0/kFSaTURitYU0ZzuDp3tS0SlZdXWkyD1W0hfuQNkzkxUIl+0YB0xcdlCDgX8Z86Jb7NSC5lyN5jhZhEQd3fS1KO7ImA6Y47MVJJZIrk0qyQCpPeiGFFwMMl5v/2qjVR7kbUjIrgiFLGKQ46ur33cmBk+ENcz+CG/6Swg6fvQT4xy7j9IDmXx+KUr+ubdktH7U2ORsiizHW7bA/JxlK9doHjoVm6a6tR02rF9ljxveXJUk2aYi2g9Mw+YxLjRk8VLPRmK4D4gm8WMqEYQSim5jtJuo2KtytvEfq15Ic3Q3GL8JiP1l/vdtr0i4NlVVRb13Pe5cLLjFlBXpKLs+8y1fUbjvH3rgO/hYPDeWnCg73fy3BN+RiXiBZmuay6+Zz6rK6/gmfL3w2LWVqD3eSI+OVeWWkeRWnIqX3HK9RNdtXCkeb9a+seU5SMOx3bemMI45bBmXBLv+FHkmPmTN1zLDt3Kl2EFCDbE7yWj2dlrB69R6lme81kfzLf1NbVd/b4u7e8+D196WWbGyLORFIVYoLZgZVj4/dWt6EmlU2o1eT8g==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XQ5vEN2aFUWvLLVr1LQLFET7V5KlDq2UxemFdmk47TVyqGz2OOwKg8VIKhlc2XUrLUKUvdVeJkMhWnnhGN40bivlRmw0UdUALpvltZuayp4Gm4uqWXECrEAXtqnBTyP60SdUJtM5mdNVtGDEZ4MH3MXERDxjc4FuqNTs5BflTG7jtIVCRE3wI5S5furpS13N1YykeAr9K7NMQsnFBmyrYN9XxmSHFyhGF3OMTODDkGj1hLHfeJZp6z2XVbkBx7HEfx5k6T8VZvGzxyjOfh6acfnJIN3fOK6Fb3H4gPbsPlL8xAACy3YVF/l51xp4yEcXK/GaU13mft9AUJdaLCS1++VHc3WCp6gOZtkKc01asaKC2ZbNV8F+Pj4u9rPtD+oqH5freapxHDHehhJXEGRDCrNNISJNBQN8qYn3hqU5v/HQteCymS7phkXGLGwOPP0K
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:28.7556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450d2942-6236-4a1f-c57b-08df1db13790
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8809

Tabs should be a space between multiple property data. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
index e74ff8a1bbcf6..ec6db81536a4e 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
+++ b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
@@ -14,7 +14,7 @@
 
 / {
 	model = "Samsung Exynos8855 SMDK board";
-	compatible = "samsung,exynos8855-smdk","samsung,exynos8855";
+	compatible = "samsung,exynos8855-smdk", "samsung,exynos8855";
 
 	chosen {
 	};
-- 
2.43.0

