Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1C648CD50;
	Mon, 28 Sep 2026 22:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635099; cv=fail; b=K0OLam5b+As4suxS3cxmETbKYVbcEtYw8TwGjth3D084fbldQkRCG8nN3A/uwR/9/6O0BZWUWUUZkm9uVqlSxRhJPpVQvA+WRHjLo8H53fo9aU6uvfHtg4Ms4Urfk94vyzXf3ylQu0i4+VxeyDRdmLE8TqOC59TPe6Y4ERxe1WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635099; c=relaxed/simple;
	bh=mPhkzUjpOvR356y1tc6aY9oxz3DwE+ctaxJJEbkOyLU=;
	h=From:To:CC:Subject:Message-ID:Date:MIME-Version:Content-Type; b=sNXJHkxZItiTb6HsWjyyEER3nsdm1ufmQx/rkAcaWC7vRiPHU45UGyY8ILi2dDzO/Mqm+rae46TRUQv1CAUbYMnWsXs3vx+p9C3Fbm0pWYgeqs/fQs8j1vEJJv8+i57aUMTf9geBsIKALSWVWdyLqssqilhjLpM599bqAQ4U3SI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=qtTBzaq/; arc=fail smtp.client-ip=40.107.130.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="qtTBzaq/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDaeho9F2p1R4/vo762HTFFnBDOmN8bCc9w9XKNpXQpvH5M4GgZa5/gFRn6FcQySBr60QqTjFQ91v/2rdxEkDJe2Rhf9RG70Qnnktqq3Q24+X1GpqIG0xTwPArKTHUH7/EaNmlp59pC9jbtRyYTaJptBb1BMEFNtxgSYSP/z0ByT3V+33BLP3Lt1YrlRpZfa3dVHHM9rfh/j9Kn7nfsbZ3NG2fIpgg+DvP6GCzR2U0gNecpVcpp1qlmqbC3I/kEHiakN9uEpASxjeGPkLOuwg5SUBWlCZFjPCLBDV/awEC4c4KJ8P1/1cnEDR0bCRra3N3e39ePGzjWJFRNoar0OjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4lQU1srsBq2Zb2LiC2JhDTMZVYw2Y2uu8CnXp6z8h0=;
 b=dbyQ799WjjlciHDbDP8nshuppZDqXQY7zsbHbVyH3t0br48Ddq7eHpFTU2cd5hykwRWqOIxvfPqPQh5l9Fhvq04yhO02uPp0JvOoc811K55Zr8xy3vz6eB6vdMZXbe916bzgmoph6Yt6ysKvVFabwa+H3YRJa6JkJJWEXuLCVjwbIRwFa1GVBjgcSU3DbDHArYZU+wWGLknoC5uFDRZeGjbJ4PCqrUwNLErfUhMafxUowHDOthq1V7slJHWucMnF6II81Q4l6uSZhE7D4nlgnKiWtTZ2XzK1mJ5rG9G1cWppb2JegGl2ZAKuRtfyQ7XjQi+5fNzI3RnaEZLyt3V2Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4lQU1srsBq2Zb2LiC2JhDTMZVYw2Y2uu8CnXp6z8h0=;
 b=qtTBzaq/AJn7UXTsSNPPsd2q7YbwoDVYkHvz8it7tydY9JR5IpMl/bFWitjupy/diRe3Ev1Q5W74BEHmGX4O6jAkreZNXi0O9oKLbB+pRmDx2y+RNsjMEzGfwdjGwjpnKcv+Rjb+DyD9LMiAPJ9/vcAn+EAF18ZTlUWvYtMBZb8=
Received: from DB9PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:10:1db::16)
 by MRWPR02MB11801.eurprd02.prod.outlook.com (2603:10a6:501:92::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:14 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::1e) by DB9PR06CA0011.outlook.office365.com
 (2603:10a6:10:1db::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 22:38:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:13 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:11 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Peter Griffin <peter.griffin@linaro.org>, =?utf-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, Ivaylo Ivanov
	<ivo.ivanov.ivanov1@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 00/16] arm64: dts: exynos: Format with dtfmt
User-Agent: a.out
Message-ID: <cover.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:11 +0200
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|MRWPR02MB11801:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e95c44a-1a68-459f-caa4-08df1db12eaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|36860700016|82310400026|921020|10067099003|56012099006|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
	L4Wx3qqTj9WjTTCq2Luv4Yzx5kFrrJldjWQAc5qij3h/megevLIDSoEXf9ayRmHarafJvUmD/pnCBGLOJjVb1RoxB4WOD6onIUv5IAou9WTNss+RDt8xXUHjGiKTEuSBSmjkuBalCTHDsnY1Yo0VW3jSwxMP2Zg1PQ8Wgc67EKkPdPQ9GPWxQ74ywRuhZCEijtz/zG8XLA6ktSbG/FtAdNP4ldzVoHyRY6WxZjROJoYrLsjNYaXiP0THb0pd0jCOvG8ya66Fi3axRi3MpiQE2Px0AG4xMjEY6P894xxdjn849JtSlm0RipsOsNfj2xbPmB498wbnNQdL/vRUBAGZfbVvSMmUK02xcDm1anmfJgtFS+W9JBc2pEy036i3xB8vt0kgMc9H/S29V1YWHRJv5VsbDWE6VoHY0Pt90Z1AWq/wO3N0VqjgWJj5pKcSJyUWp9Kv9CU0GrflnA+t5OxpBnOTPnRgDOwiB7MFJPaWyy0kdWT8Dwg0LX7SP6Y1iegx5OSuu9qnMtwk1MV2rTFAGoH1ad2o7vAyZAPMLZpaVmbc/jY1/YKw3yjm2b9QK55NbRLcbWJn4pvW07qCPMdEJk98wLPVLh86sD6XZOr7RoFaTlZfWd0AMhDTk32oT/RTdznCAvT4SiWiJ7nBHt6DGEuGkUXDn8MGq/9hg28Ar8xsP1UGeDXvy370URuDV0g1fDJ0cpsZwMW7wxsVFaIRvQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(36860700016)(82310400026)(921020)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NYf76LVmNDuOPrd02hCdqz3pgnqzwHSQSdK68a8sm1DzwN6Y2SeoZ0GBu1I9/izLw12/K6NcMILzwyqPpEtX08IXOCWwpWf/KDX1MSC4OwXApO3wGfWKc8sg63GfGlFpE8AP7Ha8Zyf0lUJ1CWlp65wZBFdomN5vc5DClr4eQVsKvwVkgQebVwgVpZ5NQ6RHzFwiihcIdwFEZQWdjsvUCGDR6i8iP8i6i2whsu+1IRMekeCTxPs04Ev7+6saw8ciuMBIOo+tAiY7bEeKiw2eiA1BfGTHEtW+BvCc2HnidBxljou2X/bj/Wkg6pqhP22nCx21lGqI4qR8NjSmbZCIPwsPtF4hUvaxF7wzDKH+isd5wtbxvzCEffqktkfT8k/M4jOWg5xMNG16c+guuITne5eu3kQgrkqX8GsQjXsagFCONwEXx7TFx8OqYFsJk698
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:13.7790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e95c44a-1a68-459f-caa4-08df1db12eaf
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR02MB11801

I was looking through the notes for the last Devicetree microconference
at Linux Plumbers (LPC) 2025 [1], and realized that the tool I have been
working on might be of interest here: dtfmt - a Devicetree Source
formatter [2].

dtfmt uses a parser with lexical grammar (tree-sitter) directly ported
from the actual Device Tree Compiler's (dtc) lexer/parser, also
(hand)written by me [3]. It is primarily designed for the Linux kernel
and currently parses all 6872 devicetree files in the tree successfully
(found with `find . -iregex ".+\.dts[io]?$"`).

This tool was developed out of frustration when reviewing devicetree
patches internally at my company Axis. I would have published it earlier
if I was aware of the on-going discussions at LPC 2025. It only caught
my attention since I'm planning to attend LPC this year (especially the
Devicetree microconference and would therefore love to discuss this more
in-person!).

This patch series is only a small demonstration of dtfmt. Obviously one
can run dtfmt for all files and generate a much bigger diff, but I just
chose `arch/arm64/boot/dts/exynos/` here. Primarily to get Krzysztof in
the "To:"-field :)

Please note that since we don't currently have a _definitive_ style
guide for Devictree Source files, dtfmt tries to be pragmatic and try to
"guess" the intended style (e.g. alignment of arrays and comma separated
property data). Some things have been left out (for now), because it's
too hard to implement without any concrete style decisions in place
(e.g. alignment of comments, long line wrapping etc.). dtfmt will
continue to develop and will always align with the Linux kernel.
Feedback (and collaboration) is therefore greatly appreciated!

[1] https://lpc.events/event/19/sessions/237/attachments/1713/4459/Notes%20-%20Devicetree%20MC%20-%20LPC%202025.pdf
[1] https://codeberg.org/whame/dtfmt
    Mirror: https://github.com/whame/dtfmt
[2] https://codeberg.org/whame/tree-sitter-devicetree
    Mirror: https://github.com/whame/tree-sitter-devicetree

Waqar Hameed (16):
  arm64: dts: exynos2200: Remove empty line at end of node
  arm64: dts: exynos5433: Use tabs for indentation
  arm64: dts: exynos7: Remove empty line at end of node
  arm64: dts: exynos7: Align comments with minimal whitespace
  arm64: dts: exynos7885: Fix format of line comment
  arm64: dts: exynos7885: Align end of node definition brace
  arm64: dts: exynos850: Align end of node definition brace
  arm64: dts: exynos850: Use tabs for indentation
  arm64: dts: exynos8850: Add missing space in compatible
  arm64: dts: exynos8855: Remove empty line at end of node
  arm64: dts: exynos8855: Use tabs for indentation
  arm64: dts: exynosautov920: Add space before line comments
  arm64: dts: exynosautov920: Add missing space in compatible
  arm64: dts: exynosautov920: Remove empty line at end of node
  arm64: dts: exynos: gs101: Use tabs for indentation
  arm64: dts: exynos: gs101: Add space before line comments

 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi   |  2 --
 arch/arm64/boot/dts/exynos/exynos2200.dtsi           |  1 -
 .../arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi |  4 ++--
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts      |  1 -
 arch/arm64/boot/dts/exynos/exynos7.dtsi              |  8 ++++----
 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi   |  4 ++--
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi    |  2 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi            |  8 ++++----
 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts       |  3 +--
 arch/arm64/boot/dts/exynos/exynos8855.dtsi           |  8 ++++----
 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi   | 10 +++++-----
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi       |  9 ++++-----
 arch/arm64/boot/dts/exynos/google/gs101.dtsi         | 12 ++++++------
 13 files changed, 33 insertions(+), 39 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.43.0

