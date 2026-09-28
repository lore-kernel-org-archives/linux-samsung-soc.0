Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FC14E4326;
	Mon, 28 Sep 2026 22:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635120; cv=fail; b=JHXvKJwixFv5bYRWjMbQmpK41W36KrVecAvAXxAC5GAjP0FQukyPmVtJy9IEIKJJQ61gy168jIBfKDEsnqVSiQE85c9mO9j8yUJISS+2cOEMLpkFqtHURXaanN5R+Mqi4mVkaYlysTG5I/iiDel3xqtBP+1v7lmbsSpJgL5pBRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635120; c=relaxed/simple;
	bh=bC2v97hGTp3JJ7owDJPUC8l5Gq2P4UblKwGN6Ga8EH8=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=npWMBeJns7IJWYPhaav83ZCxF8DmqMVcAoFWDjZY4UHulwPdJqPC/aR39aNcULH6o179wdnqxQWkrgj8JVtjTyW0YYGeMcismabWwES150WnyIK8FkHo2Gv/NwSFVHDyb6C5gfi40vq3hhuCnJaMnjFCkkZNvYV3FNii8zdGne8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=QJHqhrAP; arc=fail smtp.client-ip=52.101.84.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="QJHqhrAP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIwK8cLEwxpGPwg9hjihj/sX2yOZvAZn2rxlfamX4LhT+CcUkwTGGBO1dNO/0aZFI8nuEP7OFmRhSNIh9DBGRJa0wLcdivF4Lo8QzYFz+LCHsoPyWpDtsvpP9Jt9CtK9FFFHNvh861lglVP6rmwONO5eAFobg3DFUnjU3xQTMMlf+dAyuv9BOFv56K9IA4erQR2oaKW7gW4fNC4cnWfpHLtj8ouuQjL/dmxmMRdwirMg3QwxM00C5i8/CSV8vSYpdhvSV6ttQ3JU5x1aJIqsJ8M3eTKd+ClLXnwTdGpxypnBwHYw1TGqxVmWqq7Pdv9S8K+kPikufq/0BQf6TWi8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cX+Yz62jmr1g+QIK9VyazykuAVfcxpcfS2LoiAMYAGU=;
 b=VsXae2Pw5UHxi2mvnjHYt1I6ooTC10FBYIuEeT5xOhial1PMUa+HKUoQ3Vw4tvYw9ZnwoJllP+R7x+wqSMFGVg2NjfRkChAKP+KfM3J5xLEUQTllzN63R+dM9DsoME6gIRjvQWEm4+1E9HWQUW26zcEN1xt80WRqPNizHCdW+mojG1WcKoSgrRYpT5+C+8hEPF01jCdIgaVQ7+1BrUhe8h9jAys+CAClllMfGAWWTFdwR7siNYJqR+qyW1PPQ0nymtk11/cw/JwEVEft+s5sqPU8iDu5EDtBC2EOTAhXbnHtDsKCCOiEj9f+2OeCPdhg+KDFas/ZR6M8nbomPp9+1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cX+Yz62jmr1g+QIK9VyazykuAVfcxpcfS2LoiAMYAGU=;
 b=QJHqhrAPb9fZH/rIDQDG8BAl4ialuEUiUc8qShJ1sq1T0Q7PbBJriMT7co1e/RyFJPjPL+O/+9abGOARquFkG+9WenhIHDML2Zrtyb7JBvt5ITaRgSilUoCGkqwFwxS0VYt1A9drCaP3O5pt9blDygJV6BEMFXrNLAMiSl/OIrU=
Received: from DU2PR04CA0341.eurprd04.prod.outlook.com (2603:10a6:10:2b4::30)
 by PR3PR02MB6153.eurprd02.prod.outlook.com (2603:10a6:102:64::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:31 +0000
Received: from MAD0EPF000008AD.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4:cafe::6a) by DU2PR04CA0341.outlook.office365.com
 (2603:10a6:10:2b4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AD.mail.protection.outlook.com (10.167.241.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:30 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:22 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 10/16] arm64: dts: exynos8855: Remove empty line at end of
 node
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <0fc681a7ee3b9b92f4c1df73cd5090344213590d.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:21 +0200
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AD:EE_|PR3PR02MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: a78f7468-901b-4778-cee4-08df1db138bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	JcE9EwO4ghwcS7Nn+MOai8qmOkHjlt3f2v5P/suLf2Bl9xVnHwtAG8tRh0yxSjWvalXVSb8Miake8yhNwV99rf1w1FnmVZK+rIz0CSKvr2CG2/NT0VjFD0rOL+SIyhP/od2ELg1000oY2jCmwb0dPpvqnuD3s8gfeSse+8G7fFr4Jr7u54mMOLOoGczcIEzcFj13cRGW5lnrhv6GAaJpFZoSKqCv/NkkU3WjfbeaCAx3uMidIfrEQ1WbDr9RFLqlXp1l6axgMF9yJDsm3esnMfGg2IfJ336+4hXuHIuhjI+qCFUEyrVTNBjdp5H1BlU2RcYT4ifDsJxv4sOU4PorjtzLJsR4h9jD4MRvwKmCVhoouALAwzTneAs9AXb0SFeAehlGBu/+POCz9ljZycdp46iSl3/3LKJOlVfrRQ8SYj9x1dQxkDO4aAhbGbrcRFzwVj1uwBvRbNIxJbHQeqb2fK+ktG37i80zFyJ5kcGSJ1823euTRHObQKjZXnGzLNLErG9LeVrh/v3gubLI4I1+EdEd4gQQVWGrd1l755oyHkB5OJ4EfAXCPiej1U1KetC/Z3xmkQXve+aYqrcfE6pLnDS9Rfik+IaahzyVAA8H0F4E5/0a1scmlo08tC3k0sonwMcwQUl6URhFAQ8pxRFB0zDA0c0L7gHQ3flrvHf23iNnfnSTw1LHBN9Uos6PZHw8DNWo4tcm7307Wk3OqfR9rw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Esku9Vjt8ShWIVuJvuxnCK+AmKL6dcN1gXN4S7uLazCyQ6U7gLI0QSid5eY4M6AQeyTp6IaOivor2gH8qhnxUETnF9Z6o6V1Inu3/0IZ5kO4JLrrekr4ywrRBimr4yXnv1lGL8JYJpg3IiWLMr7ZRdrGm9SHSP/2WWUGYkXjKwKJu3FMxGEFsFnypEGcVuJWb1TPbOJOukqRYeOUiHdX4+hUwyytRgojQQv5D5Eui0xL7ThqrpIAvmIjHt7ltwHj1eeEMP2qqFM5W9SKeIwsPoCEu23vHt66rYfjQ6TwlurnONQKjk5ni30xXMeXo1W/PAX1mCDSeBF25jOPIGk53SjDBdE2y40KrjXT3MjT7fz1MpfjzUXUEudC9mJ8CfDvHLKuxTUeYF27pvp7DuNjgnpdXtj3iQCr6J1GCEuQNgpKFiloYruBYJzECw+zHXOk
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:30.6781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a78f7468-901b-4778-cee4-08df1db138bc
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6153

There shouldn't be an empty line at end of node definition. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
index ec6db81536a4e..2dade82fe126c 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
+++ b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
@@ -23,7 +23,6 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x80000000>;
 	};
-
 };
 
 &oscclk {
-- 
2.43.0

