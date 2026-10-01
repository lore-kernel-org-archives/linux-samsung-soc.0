Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BE84BD798;
	Thu,  1 Oct 2026 08:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844359; cv=fail; b=VgOzS7MZBcmShxlUbwtPNwpItPx+AJOuwGUWbtDdIjhJVXgtWA++lKwYsJ+HCm3Kow3RTkCApakczGLEqatCfEn/CdCNZmG6fd1iuuUMqi79EW7pGmL7mdescnUFnIzhj9D8TI5yV0TaChhfk5eH4O0Y7Yb8NrUf8EhZ8LFj0oI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844359; c=relaxed/simple;
	bh=Di/PKCIXPKzFI+j3A0bKuLQE/z/cnCPklUZDxXqHHMY=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IzXWN3QiMaNiPYz+l1LCtZwWKddTiOy+alv1O0jevqe9J9OUmKcvpU8gTRFlmmve8cHVmXhyehLFkkyqjuaf/Exq505WexWmN9YxsWByt+8E0XvBYCJ6ceGRlyXUCZpPKl/3sd33DOR1cy2cc+gpIchoZm2cq9dRzpf5EIL4fNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=DtGa2OLm; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="DtGa2OLm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJ1J/qcbb9cK9d8k/566yl9HjJ8g6pzbebgceVfOLzkL/qCVvZh39OepWMCJ1Q/93dCnypZX4ANzXASCNZed3pAY9Y5ENumC/wrBw4WZYI3JWhOgv1mSydM5WZ91YgWJNR9PuZmgDdCQIlVVqdQ3tdpJKwVz+ho00U7LdkE7CP8e9wJJX5t2fk1bMKEqMdyNlOCI82Er6S5Fq3uG9PeskakY6L28v+gxnlnlTOyVRlwUQ7bVrb2cfJi8/IjJtcvzgjUaw3hjwzS7QGkAECPxSFYIR5dRixhZeJ9I7SZg95Jkp5ILmC7Ogt0GX0HwSjqZ3zc8gcidW9aF3MRrjQudYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Xrs85Ebn0nGM0UWSvtiEb02s9P71GwQWjUWGiLgHJM=;
 b=kEU+5fuwnngqa7QL2EP90e8hU64Qp2++XX53f/c2syHdCbbZeaAB2ygf74a2uBaXJ6lP0boEk8Rv5xyJi23P6hFGFy8BPycZN3bBqLQGtGZ8bO8P1DrICPdCFa0deJQlGz2CAQhwmit0RBiw2rHQtaNjWmgOBbYyBqJWQOELEuM/n0Xt4cgnrVJPNv8Mvpzk/M3U3htTPe7C1tduGMgZeuPEZppBVFN5Aqrut2r6LtZbBnDuC31fWY36RYFDDKgkwP/wHAE4NsDNxvW6HKJ3vOvr8xAN7IJzXWmlQ07oz/xz09vd8rCNGs5sEY8GTKOxRtbrP96Pq6jtr0PtvafxVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Xrs85Ebn0nGM0UWSvtiEb02s9P71GwQWjUWGiLgHJM=;
 b=DtGa2OLmv9lqQSxGlRpL1ICCV8dhb1UjP6anhQaufGv2rzFaIrDuna/LzNO6jmQtLRVIf6IngbfzqleXW6uaPiGxbMVG+0SMX5LStjKfXWa/CtGm4oxo5UvGAqxW/XU8zdhj3SMRKegeLSKDB4C0bHOEqTIGx/pWV4T9cmVk7TY=
Received: from GVYP280CA0043.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:f9::18)
 by AS8PR02MB9912.eurprd02.prod.outlook.com (2603:10a6:20b:617::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 08:45:44 +0000
Received: from WA1PEPF00009B3A.eurprd05.prod.outlook.com
 (2603:10a6:150:f9:cafe::ac) by GVYP280CA0043.outlook.office365.com
 (2603:10a6:150:f9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 08:45:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 WA1PEPF00009B3A.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:45:44 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 1 Oct
 2026 10:45:41 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: Peter Griffin <peter.griffin@linaro.org>, =?utf-8?Q?Andr=C3=A9?= Draszik
	<andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, Ivaylo Ivanov
	<ivo.ivanov.ivanov1@gmail.com>, <kernel@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/16] arm64: dts: exynos: Format with dtfmt
In-Reply-To: <ba1939f5-c528-42b8-971a-4b16998c37f9@kernel.org>
References: <cover.1790629313.git.waqar.hameed@axis.com>
	<ba1939f5-c528-42b8-971a-4b16998c37f9@kernel.org>
User-Agent: a.out
Date: Thu, 1 Oct 2026 10:45:41 +0200
Message-ID: <pndy0chstai.a.out@axis.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail10w.axis.com (10.20.40.10) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3A:EE_|AS8PR02MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8c8d3e-f98c-4345-6dd0-08df1f9861bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|30052699003|23010399003|7416014|82310400026|376014|36860700016|22082099003|18002099003|13003099007|4143699003|10067099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Kf+sxnawRR9yPrHmDjSluSqPWjmQALnk54rVLpj/6T6XftonDXOpi+svcUj0GgEz9xTYdGlSUjIDuDX+CH4/Gooogxt1pwlVYDDBHPt6Z2SbFSxAh4cmU+oViyKb+lYEoJEzR9cdCz7DTbQLg7sPS25aEKnl4IUmOHy38/tWlvbqYsaoFpbietTgOPD41o8/OvBWlfkZH+XGViE8Q08b3p9SujENwUkq9mEHa5o3gfAKHYS8sVGV2nFgcbaT42+jb+BOElsuXQORZqv02xYVUWvodXyW5sK+VrMEVkW5a7/VTWiFhvgT9uKTpXBQXktVIy1CmAjcGrpzYkb3DhB6hL+ruGid+RWhrfQSd3GF8Gsk/2qTYkqj2W/szGV28i79ByhvTFURrTdFtWvufL2RoZWA3tJellyPjPi5SCJ1Vd7IHC5LVgaWNN0Zttn77m9y3tz3rX5vgde32V7AxWNS+O8xU+Qy2fDfLJaOFWlg0/fHQPxzH0DwynkveKC5JSK73vIFWHFWefZbqI9a9TQDLl3upkvKeyZpFFZLx40feTPLY6Td3HEHVB21fyIKdFMRDn2Uk7EZ99jjVQgRI6FJcO7zhOgtAYXO93pXteVju8mnAawv4ECy7DAwUg7Uohk/UEqE2tLisw6x211ofpwuiRLJJ1mXXMBb6Vxb+mNgLvdj9JvSlXE8rroo3zPs08/WlUIOvY5Z3R7SvMg3xoSozQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(30052699003)(23010399003)(7416014)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(13003099007)(4143699003)(10067099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o/JuxvyLFCEsMY/YH8z3AdiJnEw8MSsidM6ztnPdUCo8ibohu5LIxqLq6u+XigNY3ttHIPDQcdvS8DIGAPOMSfrVJUQIVCdH0v07Yn7ABH2NKXVdUZAKHG472V4USGUgN3xYlEoGgBLACD+m/ce9n38z4NrsnPTRtITM7U1Mr13PhXWG6fpv2NSmwL2joC9axBCA1wuYMtdTj/SBf3Fud+1Bu2PtjiMZfwzHB9XZjZVLd5GlyTRr7GkoJx6xyTUknqtoweABXTHYYxxbyHU/sy6+fhcgoDVn5bP7mTB2zAN56ONAmro3+EWzmi1trBxNdqU11A7/kCYYe6tTgx5hLngFJuZp1+ZZd/ANe5O8nDnQOusP42RRulHpnpEurfdBoHzHA+tUKjME4zlCcICbUdewBjMS/i7eRNgMv1t/LrYEYaeOX7PP4cnyFE6QuBCJ
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:45:44.4799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8c8d3e-f98c-4345-6dd0-08df1f9861bf
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9912

On Tue, Sep 29, 2026 at 07:43 +0200 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 29/09/2026 00:38, Waqar Hameed wrote:
>> I was looking through the notes for the last Devicetree microconference
>> at Linux Plumbers (LPC) 2025 [1], and realized that the tool I have been
>> working on might be of interest here: dtfmt - a Devicetree Source
>> formatter [2].
>> 
>> dtfmt uses a parser with lexical grammar (tree-sitter) directly ported
>
> We do not use dtfmt. 

Not sure what you mean here. We couldn't have used dtfmt since it didn't
exist until I published it? Are you maybe referring to "formatters" as
in general?

I'm not going to argue _why_ formatters (for Devicetree Source) are good
thing to have, Konrad Dybcio did a very good job of that during his
presentation [1].

> I think you missed entire recent work and recent
> commits, where `git log` would point you.
>
> https://lore.kernel.org/all/20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com/

I did a `git pull` on `master` and started from there. Nevertheless,
maybe it was good to "miss it" and do the "double work" here, to show
what dtfmt caught that previous work missed.

Let me know if you want me to run it on `arch/arm/boot/dts/samsung` to
show some more examples. Or even better, you could play with it yourself
:)

[1] https://www.youtube.com/live/2Gput2daq4c?si=A4F2CvstRef1qD6e&t=28246
