Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013042.outbound.protection.outlook.com [40.107.162.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BDD5038F3;
	Mon, 28 Sep 2026 22:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635123; cv=fail; b=LmjVdGRwMbTPt98VPI2VaMLzrenqdi1wCIOpzx+t/EsDUharDO7++c1blM9ID7MVbECTL30oIHDxWmmyXggID6nh14JFHxv3u7h0c8GM9vcQMnWXZgKU+0r17A6jglYk5pl2ouwrdTHEvsX8JCGNF/8Ow5pD2g/2J4qosF8cdG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635123; c=relaxed/simple;
	bh=U2it34qoe8L4aufO96mAG6Qyg3jBUviegk1s0ObBmZg=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=aRr2ev6PaREahL/7op4tGrQEdOPKsbDiYUnEBciUUP/b8CSDJ+CsSiBcG7IZVKp9N1JVDqIsjzByW2QBVpuOvjIA2/jVOCsNfRBKS82KIT1XDWWGhNA11fldt/+jdMf1alk/Fw3nQABQ5PdcJEPWQ7X4Xa1E9t06Dvi7QBtoBho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=ohBCIadP; arc=fail smtp.client-ip=40.107.162.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="ohBCIadP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQ3sxQMUBFUYBiDbyjOrd6WxG8D+FQ7nXKuAfW7GKr7SsLmkholjM41DjxrTRFFGma/mVbwpNoK3UJ/XUpXNVYKVGsvBoBXnK+sCOiCj5KPNsje3Kv8KWUpKqmJXUbXvs+rh3olQghusyc64TLe34bKfxSUj83ElGCNqh4pZz6GqrZtPAXIwOXtNhQc4jdILwertQ4CXn1guBgojLVG0I25cN58u4vG1SahwY1HHO0lYUVsPLLMW6yrcFKluzjK1A9pyHODBoV0CTbSPrSqEgf2gIBF+jANFE1FopIip9CBRszAH29zw89TohnvGLNKMN23slyXgSZbNKocxT23xxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVmqkhmFnXYXAb1La3pPrcIgCoNjBR9NYNQ9y0d8a3o=;
 b=E+y55Odwl14swREae3Pb6w/yyewRmm4nFaEdXViTEJxFvebiQGy9aATSvNx64n/Uh7qE/MwGhth6e7VGLELEL1MfFaocQ1guhVXuQe7N1FfEAx6jqtjScntQjBSDiE4Y+rB0NjtYdTOv8dhmi0asGdhQht6zoRfIejq7wYNywGed0jwjBe2kZN4jMLdnR1zBiRXk6Xv4tBHXIArRQ2YySTdCJjCfo86BQHWJoBacc9Pt1V8RbPhQ8Ttl+GODdafXI0UMCyJtyMFGP6V1/3SGctoprQ9DybXCnfnq9IFc/c4w205QAS+nzkt48CqJ3BPJPgLxLompgoAXfmt7xbqvnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVmqkhmFnXYXAb1La3pPrcIgCoNjBR9NYNQ9y0d8a3o=;
 b=ohBCIadPg9VuQ+XqBpkTmPrasFp/buUWUpVNwWwBbNFm/7gcC35eXcOEFFhtcpuY6E4j4cp3YR9TwyGPEmRH7P3RdkQ/Bv2Y9/ULGhK7PyZBZ54yGLlNqTdxbSc4//+aGOmrxSFWpKa3Lvigh2Vo7ZlzoubWIXer7L+UmaQUyxI=
Received: from DU2PR04CA0355.eurprd04.prod.outlook.com (2603:10a6:10:2b4::34)
 by GV2PR02MB8748.eurprd02.prod.outlook.com (2603:10a6:150:74::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 22:38:34 +0000
Received: from MAD0EPF000008AD.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4:cafe::67) by DU2PR04CA0355.outlook.office365.com
 (2603:10a6:10:2b4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 22:38:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AD.mail.protection.outlook.com (10.167.241.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:33 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:24 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 12/16] arm64: dts: exynosautov920: Add space before line
 comments
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <6bfaeb9cee6a950bae71dbb2f529e97417e660dc.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:23 +0200
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AD:EE_|GV2PR02MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c600c70-ecad-4092-03a0-08df1db13aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5zUR2isYDJsPeGRKqc3RrrT0lzO+GOfzJu5+AnlMiwX3cIohesvTDZmDepj71Dwa+SO+gcOyYSh0BrDVvwt92dW1WpeYD8dpv4tPpM/fhWaIw1v7+BjdGvcVUjTi1ltgcIPT26rZf56ljJXmq5pEOEH0Tuvf1MvBtPVy6kj0rdvWR33K+mUP4VcOoAAE1K7ng0wP1l8cKT0ulf2nfMumI7XmBSmSIkAnVmk2TfDfcKsOTO4nkzCBJDtAtE8gVDajrMH9KIntn6lAQ+z7TBWgQ7UKwSqYTyo9UY+VXZUkQJsALYhGpXMQcI6wp2Lav4NET4aHZfTqnfdpZSTwmNTla2IMlCsgLYW7fpR1vvFNg1mRilQeEflMAbfkf9zK0Cr5k5VHDbFsgsmSWDi6KN62g87KuuXqfsYX5fZO3FfoDFr8OztLxmffq8Ig8HzOohz3Bh22rReqtS9rAaDcZ79NL/XnGVg/vbUxC4xRnfOaTy19ORtNZ7uwXIyuInOuqETuMhnRLj2kAPkdJXjcfH2+9zcUvNjt73GDEI3P83T3fMhANv8ofzfKJqX2dDBXGjtkOFE+7mfxyib6lad62I+6Pnb67wMwwyKwjoLbI5mTL+huF7ajIEel7G1KCrEx03Ty+N2PGZG5f6iFv7pCLrGlwr+cKGZghBbI3Ru/42b+m1Kvi7LWkKWZ4LqoCIZ9NFoz1pdci8JaAbVNe33Ps2rWEw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/SJgBRaqNadxNUNMM2T+5f+HxqDMA4/1nSnuao0EtKXR/KWVyYGNjG3JJkbQU1NQnm6A8T42gUtR1RRbOT0lIV50KrIT+240rRAtlXAfdxhQFmSs2CyjXDMUZAHqowuyvoOoicbCguIiejXVoDWaMSmeAWSmdCuAxinzMhlzWvkNpJwSynqSobe4/x50P5KgrsYDUxuu4AEJG19CiQimvpl84owpbs5Aux4FwRuqdiS57LjIAUF4y3rtwldtFcb5ib+mWt6Rs2R2ah0VERyxzBBQchMXnbUL+yuDn/HV6cAi3KgyiGco31DVYS3AdzNSYC9d1RCJ3Ul2U8wfgWW9gXx7rHJHPBM4b9Li96jJ8VthGS/5QQYlQE2fVKC/t1NIAl5r92ZEuYHP4a6dDcf4IbfUfJIemaQvUIb4b20WqLA23bOaBWsCAa0TA2FvEcMV
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:33.8639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c600c70-ecad-4092-03a0-08df1db13aa5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8748

There should be a space before start of comment delimiter. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 399b56b4dbdd9..d2b694a7e6f9d 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -265,7 +265,7 @@ l3_cache_cl0: l3-cache0 {
 			compatible = "cache";
 			cache-level = <3>;
 			cache-unified;
-			cache-size = <0x200000>;/* 2MB L3 cache for cpu cluster-0 */
+			cache-size = <0x200000>; /* 2MB L3 cache for cpu cluster-0 */
 			cache-line-size = <64>;
 			cache-sets = <2048>;
 		};
@@ -274,7 +274,7 @@ l3_cache_cl1: l3-cache1 {
 			compatible = "cache";
 			cache-level = <3>;
 			cache-unified;
-			cache-size = <0x200000>;/* 2MB L3 cache for cpu cluster-1 */
+			cache-size = <0x200000>; /* 2MB L3 cache for cpu cluster-1 */
 			cache-line-size = <64>;
 			cache-sets = <2048>;
 		};
@@ -283,7 +283,7 @@ l3_cache_cl2: l3-cache2 {
 			compatible = "cache";
 			cache-level = <3>;
 			cache-unified;
-			cache-size = <0x100000>;/* 1MB L3 cache for cpu cluster-2 */
+			cache-size = <0x100000>; /* 1MB L3 cache for cpu cluster-2 */
 			cache-line-size = <64>;
 			cache-sets = <1365>;
 		};
-- 
2.43.0

