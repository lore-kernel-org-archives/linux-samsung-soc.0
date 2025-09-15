Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013010.outbound.protection.outlook.com [40.107.162.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B5E280A29;
	Mon, 15 Sep 2025 06:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757918284; cv=fail; b=kBJN16YtfIYp+5NtzAoE8kTjj1NiDPwTUquljy1LgvyrPk3jhKZbXwiO6ChccasrnkFrKGfem9TsP8kOFKqsAZrOfxxWkj0pl9/7wuPbqTmEHALFY+UwfhrESg/jdxOG3fAW2/aeNy3xi1QMqLk8FcpAiY74CQZ9OQmsWLceECM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757918284; c=relaxed/simple;
	bh=nCvmEQk6UBW82G3HOWsRLWFxDa1pF7tsml5LghXxZ84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nAk09hgw+V3Epc/hFVXMmYlFGZFHVVR3P0lJCXjM4rauzEyvKqq2MbH7jG44E3kcW2Y3kRnfdSo+DW0i0WNsdKuRaPeLShl9OqL+1zmTmlvD5nSKJ21Tl/bhiOaQgK+xI3+HhabB+TPxs9EiI4R9X9JJQl021DNFuVbm6nUMsZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=m2nmr0Fy; arc=fail smtp.client-ip=40.107.162.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="m2nmr0Fy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoMs2pmWhRFDRhnBMjsWboj42x1ld4ZJPyyvbRtppN0UOhP1ZLmkIk/DYCbNE9AmDyIJRLInq1UMxj7S8aoIgzuykkGhWD8UpIcIhyx2QDc91Mwbv+q4jHX2zSoWYWbe+BLXInnxQLluhY2gngJOdpXybNbIQWohARXDiobBl0M/0pO6a9ISmIpkXyTfX7p3afkUiEujFuuiWMO/3wxaGN2eQdhFrBFWku+uRxQvfBnojyX/yPjK5YW29a7wOoHcc4AhQM0NTs+DEiVV7zypojWdZsdik166B3azs2tBXV4eNtIHtcWN1p8g+WmTIHIO0EDNx7vYefLo1uBdn+m4WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xrx0EfT6GH6jFlkVO3Y55mn6U185la1UrvKWihG2MNY=;
 b=ani4iKd5I86VN7niY2jUneIIr4TDmAVNIVpdaTvx6nOhs4/c9YxFA5GM2bDi5nnnRaJjerAPn4LQj1IE37pj6NvPbRzmWG2VJGoLqQcqyRBA5pqIb6B90AD5Oh6P4ua6CQgfG6gTM2aLGpl0geeT7MUrFgKY7c4RDq3nlj9G5/JJ+bO373GHpDc8ZFAhkbWTtbDlfnBJjSepicAqQ1tOIDvjoILueHvihajDXQqoba4zXHeSGq/+bvU8PbRefDWiJAlSiZNjyw+4rO73Uo3lK5rNRpJsiyy4Bqsz4cI6y42iIPHE9U4lgHaO2znyvrNJe7rjVtQsE7/CA8Bj7LeDFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xrx0EfT6GH6jFlkVO3Y55mn6U185la1UrvKWihG2MNY=;
 b=m2nmr0Fy+jVHB6b4RnRbs2MdtrGMRaccGsO2dIscCL80GSZdi6rZTJQ3tISTIUVmo6ojn2VjY/8ugNt3e2yLrW75P2cTOT8cw+2M8t0O+eA+Uylu7EvXgVHLDdvSlccyqaqIFIv/W4RzSoJ+v669I1GZ+oPh0182Q1+WcPKjVc9ZPsK4iw1fPNQsWmVanxBgYn8NKYWDL8ERvT6YD5Q+ydKlg2wQN9QHp4jgt5IOkSzHTxc3hHPza2iL1JMGgojZkl2OdMUYa14LDfXTv9zyQ78fDXoiSIBhyUTyyOj3UkaMB+s6qh14iVth47yVJfYhbL0LJZrCQFtVWiC9tESF8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB7167.eurprd04.prod.outlook.com (2603:10a6:800:12a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 06:37:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.010; Mon, 15 Sep 2025
 06:37:58 +0000
Date: Mon, 15 Sep 2025 15:49:31 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/5] clk: samsung: introduce exynos8890 clock driver
Message-ID: <20250915074931.GD8224@nxa18884-linux.ap.freescale.net>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914122116.2616801-6-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914122116.2616801-6-ivo.ivanov.ivanov1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: a3eccddb-0bcc-45bb-26a0-08ddf42268cd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p+jQCjH15n9AFhe0WKsI34m42ucUts4Dxh/FfdRs+v4NX74rJRDRzRLHOa0U?=
 =?us-ascii?Q?Wbp5Ap/qatr5YyaIuUHADULDbureNFSBE6t9I0s1FD9BCUKjWi8n+Kpx0z8i?=
 =?us-ascii?Q?2r11TLXYyxdXrjsFC6mg1WJqticmj7EO9dv+6Pgg9Dh4hrHoskjJxiwylFkM?=
 =?us-ascii?Q?qxqAUI7fv9lrSNvOOWDcwQUQSdHWD9Jc0QqChzLdHGlLpng+sEry1I4YIO85?=
 =?us-ascii?Q?zkRAH37RfC58uHUw/4dsOBWqo3l1SxHZkZwWmAxdHh74PN8VzKrAzyUsQOFg?=
 =?us-ascii?Q?DvyeSOcBhLH4yWMKOS/odAxVrftfq/HnNwnp3G3p61s/MVPMpWaHFR5vbqHj?=
 =?us-ascii?Q?u29tB9h15RxtK08JjtdaCjOhPTiAIRRUxizwO7AZFlxBPfgj2xId+jCEErGA?=
 =?us-ascii?Q?cBZyoTePJgS1hwEl5lAVCAldUqzxAnTkB4nb8FCbPWOIVHJFO2C/Y6LMDvOI?=
 =?us-ascii?Q?v+cpgx31M1SEO0Wul8t3uaJUn5Jzb//3KyoXlpQI8ZUiCMdCAXEz2r9eH/Nh?=
 =?us-ascii?Q?aRrqy4djMsYimHSslnX/5dchgVJLrvUoNr73IMYoQ9dbHM698P5AaZE6j+HT?=
 =?us-ascii?Q?bnryBJpLTu8AGOichBOLRgr1+sLLzjA1RTrNeAe/aafYNzbomLsfzFr+EoNu?=
 =?us-ascii?Q?OyCjF+rs7fDPjtNpplz7iTBas+3bpivYB5Pj8nmN4JzctX7drJYI0Jwj0efI?=
 =?us-ascii?Q?Lf7PLXLDIE3TSthzl1KINgArWzh5mIB21l2l4NxFx+K+cByCr75JVRBQIJW6?=
 =?us-ascii?Q?i6bkB8pM7xz2fw+XckAN5c5c5TSBbgADHDB2uMbOXjg/ejaZLBEv+Q2thKm3?=
 =?us-ascii?Q?5m6DbuzaIcHYraOrsO8vOOE83v7iVUluVnN8M3CJaolodkt63huy4rGwbuKx?=
 =?us-ascii?Q?fOnC6M0Q/NvOv+QmCMcFn8L6uyqZYZJ/6dxwd9I3L8SvJf7/IgtSqG5giv8D?=
 =?us-ascii?Q?q7XcU/xPFhkVRz4F4D+dDGb2q/YjnKbtT52eDcSjR1Pa+8T1r7nQpE4UvcMJ?=
 =?us-ascii?Q?NalN5RBwS3uV+IQIonVIysj4F8niQpHJN3XztA/9K06a5AVR1W/Yj3mCI5ZG?=
 =?us-ascii?Q?2I4etLQmYwEdY0fQ12SXTutP5WRObbDR1H3W09mOp8OVAwdDe471TQGWKeRZ?=
 =?us-ascii?Q?3iZUpsxkWbWJ13deNOSx+tt3kF6JwREzXm5wwqd+FIJPC0GvLvDYo5KOF6kh?=
 =?us-ascii?Q?Sd3YUQ58q/dOlUWnp72pR/t1dm873nuBo78dK1Gz7sPOXwtEE0n+TASGLRTc?=
 =?us-ascii?Q?heKTDinfIyNeLBRHRK9It7NSe2EryqpL1WFoQSBv1O5/kpBa8alRRzX6BNa/?=
 =?us-ascii?Q?X6nqyuKuy8VljqlKbe5aqgjo/tRnPju7jI2+x/SlCSKHk4ek4K/+fHkBEgyk?=
 =?us-ascii?Q?eAo4i5CajwLseFlxP+qg/tHKuRps85IoNhEJXXL+DgIfBs1LYAzNcP4WWHjd?=
 =?us-ascii?Q?mxve6d0RGG//E8B/96vzfzUowLEu1Lcem6ZWFipuMpV2GQ4F5vp4sg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aIBDbAVcu0QW4hyNYGl0I7ATZ6eeMG3CG4Uu+ImuHx2FzH1cxnY9zAhPUnI2?=
 =?us-ascii?Q?aECZFgzwvGvHO29jkvPrXxn4oCbHgPOah1Tp6yY8JZGkKo4iqok1AlJigCOT?=
 =?us-ascii?Q?EafzuiIIJEVh4KOoz9p3+jIMK9bWQ+D709vT5egUti1xofHOoHGXcti8L3tj?=
 =?us-ascii?Q?Csu7OLhEjdGlXqPG4SL1+BMhJIyS1OMcG574WGRjy+EzjO2WX/UCtgjtXJaq?=
 =?us-ascii?Q?NcxcBb2Ohbohb3bfsSZwoetgq106Xvhob4scwPAH+5rxzHnPxRwEtzU5tu4x?=
 =?us-ascii?Q?+cLy2zYNtlJa+XW/W/y+vBT5vHjW54KhU8/DhS1gZ7FzkO+YTO+lrfX8600k?=
 =?us-ascii?Q?lEFoknC5070meL5QZGenPxpOkXqJW+SZQaY1N4cs+1ZJkJD4NWwW392v02a/?=
 =?us-ascii?Q?6l6vTJpgtGxKuGKop0wKUWQ8xNqlS94XXN4bwYMRQqAsDmILHTkK43Ol3qQ/?=
 =?us-ascii?Q?n3HGUJuayxIuNa1yMRcx3BY6O5cAqICWIBZwkgJbF6GrwYndaqs3/aoqUBmN?=
 =?us-ascii?Q?4GYy17Xc+vWEZiTYG+rt2AVemRtTDE26MWd2I+6J0sSmPzyqril58UjGU9kC?=
 =?us-ascii?Q?AIOlhcax/ip4QhZP8ZZ73iNH5eFdzrj3txyN/wKUWpO++Mi7Yg/MaQR1JD/1?=
 =?us-ascii?Q?Gd/TXzg3SfDjfB2rigyMyJkMRVzEF8bmV36VKwk/fPo36hK5G1K+LLztFsfJ?=
 =?us-ascii?Q?kT/jiD2rXfdOrTAxEg7obrio76V4K8yklt46U9X98VLnNC8u4ej1QflU40IT?=
 =?us-ascii?Q?/aVDD777V3nmYgRzVxLoPCcZdwRU5dQao4yB7Ap/aCKVe6o4or07iVPCoip1?=
 =?us-ascii?Q?uPUZwcZ5wVGJX7tA/XzG+TJcNg6zVwPdYhaMqdGLQM3KUclVRMxgto7Pgeba?=
 =?us-ascii?Q?cWjX7aAXqR2SxWdBWFd1UJ6KOESEcEMU7cPctct+1EoOHG8b+NS3CtVRfKMm?=
 =?us-ascii?Q?8+vHa7Ix3VgfD0A3Meia12zWC5BvqJP0RD3SL2ppjAWGGa/3fZzDuS1M2f33?=
 =?us-ascii?Q?qYtI48jqEqCRKTZfMEfoD5s6WnX+1pxsAE03MjJMs6qxOei7MmDW6c6G4vTS?=
 =?us-ascii?Q?9bvKiT1D0I2EMfxhkcjDmwzTyzdtroPD7wjcLCeEeiMfRUpfPVNvnyUSk/2F?=
 =?us-ascii?Q?iBk70IEdXZ6xpCVrS0AyNPqPwqfbit20SkT/fdA2ZKb0+BiTH0y7eSn/Dmuj?=
 =?us-ascii?Q?h6EpriVLaW5rpLt4jKwpOM6a5TyeaK54H3ikdUVdExozkjY6+05xhQ1o3kHg?=
 =?us-ascii?Q?N+u6jGnubKRVaqhLo2rv/+E4YBrYv57IINujZbQ1JsZjElLc1kDUi0yJ+pTL?=
 =?us-ascii?Q?FWohCJWjVYAcdKlXb5XmpHLjb1sRkv3P+q8AzB30UEKmXnMf5vZ9npEVX/2h?=
 =?us-ascii?Q?4h6yEiZAM3pCYEzA1Pp6KECzCkV0auJ1xfk2h71kRyqP/FwsIE+yVOwmrbXz?=
 =?us-ascii?Q?84EFT7EgjaKd41+zk8+F3RpDRlW2IyAly50fgTdTntY+vxrE082ef0O0wZrk?=
 =?us-ascii?Q?G27ab+Wmo4+0pwJioR5FHgPVn/S011BhK7G4ICNyedFZwccBUl+sL83WPzFv?=
 =?us-ascii?Q?rCbXejNNadDAVHSxdpVoaJnDnADW6owLYeuXqIVI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3eccddb-0bcc-45bb-26a0-08ddf42268cd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 06:37:58.4722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RoW7r4eMGrjLyZ1MssmOUdvxcYHZrrHw1NY6cQiIlwKqjzz3MVzAqjXedO9XxrAohbsAxqmeCGOSVcAu2KwFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7167

On Sun, Sep 14, 2025 at 03:21:16PM +0300, Ivaylo Ivanov wrote:
>Introduce a clocks management driver for exynos8890, providing clocks
>for the peripherals of that SoC.
>
>As exynos8890 is the first SoC to have HWACG, it differs a bit from the

Hardware Auto Clock Gating(HWACG), if I understand correctly.

>newer SoCs. Q-channel and Q-state bits are separate registers, unlike
>the CLK_CON_GAT_* ones that feature HWACG bits in the same register
>that controls manual gating. Hence, don't use the clk-exynos-arm64
>helper, but implement logic that enforces manual gating according to
>how HWACG is implemented here.
>
>Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>---
> drivers/clk/samsung/Makefile         |    1 +
> drivers/clk/samsung/clk-exynos8890.c | 8695 ++++++++++++++++++++++++++
> 2 files changed, 8696 insertions(+)
> create mode 100644 drivers/clk/samsung/clk-exynos8890.c
>
>diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
>index b77fe288e..982dc7c64 100644
>--- a/drivers/clk/samsung/Makefile
>+++ b/drivers/clk/samsung/Makefile
>@@ -22,6 +22,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7870.o
> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7885.o
> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
>+obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos8890.o
> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos8895.o
> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos990.o
> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
>diff --git a/drivers/clk/samsung/clk-exynos8890.c b/drivers/clk/samsung/clk-exynos8890.c
>new file mode 100644
>index 000000000..670587bae
>--- /dev/null
>+++ b/drivers/clk/samsung/clk-exynos8890.c
>@@ -0,0 +1,8695 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+/*
>+ * Copyright (C) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>+ * Author: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>+ *
>+ * Common Clock Framework support for Exynos8890 SoC.
>+ */
>+
>+#include <linux/clk-provider.h>
>+#include <linux/mod_devicetable.h>
>+#include <linux/of_address.h>
>+#include <linux/of.h>
>+#include <linux/platform_device.h>
>+
>+#include <dt-bindings/clock/samsung,exynos8890-cmu.h>
>+
>+#include "clk.h"
>+
>+/* NOTE: Must be equal to the last clock ID increased by one */
>+#define TOP_NR_CLK	(CLK_GOUT_TOP_SCLK_PROMISE_DISP + 1)
>+#define PERIS_NR_CLK	(CLK_GOUT_PERIS_SCLK_PROMISE_PERIS + 1)
>+#define APOLLO_NR_CLK	(CLK_GOUT_APOLLO_SCLK_PROMISE_APOLLO + 1)
>+#define AUD_NR_CLK	(CLK_GOUT_AUD_SCLK_I2S_BCLK + 1)
>+#define BUS0_NR_CLK	(CLK_GOUT_BUS0_ACLK_TREX_P_BUS0 + 1)
>+#define BUS1_NR_CLK	(CLK_GOUT_BUS1_ACLK_TREX_P_BUS1 + 1)
>+#define CCORE_NR_CLK	(CLK_GOUT_CCORE_SCLK_PROMISE + 1)
>+#define DISP0_NR_CLK	(CLK_GOUT_DISP0_OSCCLK_DP_I_CLK_24M + 1)
>+#define DISP1_NR_CLK	(CLK_GOUT_DISP1_SCLK_PROMISE_DISP1 + 1)
>+#define FSYS0_NR_CLK	(CLK_GOUT_FSYS0_SCLK_USBHOST20_REF_CLK + 1)
>+#define FSYS1_NR_CLK	(CLK_GOUT_FSYS1_SCLK_PROMISE_FSYS1 + 1)
>+#define G3D_NR_CLK	(CLK_GOUT_G3D_SCLK_ASYNCAXI_G3D + 1)
>+#define MIF0_NR_CLK	(CLK_GOUT_MIF0_RCLK_DREX + 1)
>+#define MIF1_NR_CLK	(CLK_GOUT_MIF1_RCLK_DREX + 1)
>+#define MIF2_NR_CLK	(CLK_GOUT_MIF2_RCLK_DREX + 1)
>+#define MIF3_NR_CLK	(CLK_GOUT_MIF3_RCLK_DREX + 1)
>+#define MNGS_NR_CLK	(CLK_GOUT_MNGS_SCLK_PROMISE0_MNGS + 1)
>+#define PERIC0_NR_CLK	(CLK_GOUT_PERIC0_SCLK_PWM + 1)
>+#define PERIC1_NR_CLK	(CLK_GOUT_PERIC1_SCLK_UART5 + 1)
>+
>+/*
>+ * As exynos8890 first introduced hwacg, cmu registers are mapped similarly
>+ * to exynos7, with the exception of the new q-state and q-ch registers that
>+ * can set the behavior of automatic gates.
>+ */
>+
>+/* decoded magic number from downstream */
>+#define QCH_EN_MASK		BIT(0)
>+#define QCH_MASK		(GENMASK(19, 16) | BIT(12))
>+#define QCH_DIS			(QCH_MASK | FIELD_PREP(QCH_EN_MASK, 0))

Nit: align code.

>+
>+/* q-channel registers offsets range */
>+#define QCH_OFF_START		0x2000
>+#define QCH_OFF_END		0x23ff
>+
>+/* q-state registers offsets range */
>+#define QSTATE_OFF_START	0x2400
>+#define QSTATE_OFF_END		0x2fff

Nit: Align.

>+
>+/* check if the register offset is a QCH register */
>+static bool is_qch_reg(unsigned long off)
>+{
>+	return off >= QCH_OFF_START && off <= QCH_OFF_END;
>+}
>+
>+/* check if the register offset is a QSTATE register */
>+static bool is_qstate_reg(unsigned long off)
>+{
>+	return off >= QSTATE_OFF_START && off <= QSTATE_OFF_END;
>+}
>+
>+static void __init exynos8890_init_clocks(struct device_node *np,
>+					  const struct samsung_cmu_info *cmu)
>+{
>+	const unsigned long *reg_offs = cmu->clk_regs;
>+	size_t reg_offs_len = cmu->nr_clk_regs;
>+	void __iomem *reg_base;
>+	size_t i;
>+
>+	reg_base = of_iomap(np, 0);
>+	if (!reg_base)
>+		panic("%s: failed to map registers\n", __func__);
>+
>+	for (i = 0; i < reg_offs_len; ++i) {
>+		void __iomem *reg = reg_base + reg_offs[i];
>+		u32 val;
>+
>+		if (is_qch_reg(reg_offs[i])) {
>+			val = QCH_DIS;
>+			writel(val, reg);
>+		} else if (is_qstate_reg(reg_offs[i])) {
>+			val = 0;
>+			writel(val, reg);
>+		}

This seems to disable qchannel and set qstate to 0 for disable HWACG.
If this is true, a comment is preferred.

>+	}
>+
>+	iounmap(reg_base);
>+}
>+
>+/* ---- CMU_TOP ------------------------------------------------------------- */
>+
>+#define MIF_CLK_CTRL1						0x1084
>+#define MIF_CLK_CTRL2						0x1088
>+#define MIF_CLK_CTRL3						0x108C
>+#define MIF_CLK_CTRL4						0x1090
>+#define ACD_PSCDC_CTRL_0					0x1094
>+#define ACD_PSCDC_CTRL_1					0x1098
>+#define ACD_PSCDC_STAT						0x109C
>+#define CMU_TOP_SPARE0						0x1100
>+#define CMU_TOP_SPARE1						0x1104
>+#define CMU_TOP_SPARE2						0x1108
>+#define CMU_TOP_SPARE3						0x110C

Some of the registers not aligned.

>+
[...]
>+static void __init exynos8890_cmu_top_init(struct device_node *np)
>+{
>+	exynos8890_init_clocks(np, &top_cmu_info);
>+	samsung_cmu_register_one(np, &top_cmu_info);
>+}
>+
>+/* Register CMU_TOP early, as it's a dependency for other early domains */
>+CLK_OF_DECLARE(exynos8890_cmu_top, "samsung,exynos8890-cmu-top",
>+	       exynos8890_cmu_top_init);

Not sure you need to run Android GKI, without module built, this platform
will not able to support GKI.

It would be better to update to use platform drivers.

>+
>+/* ---- CMU_PERIS ---------------------------------------------------------- */
>+
>+#define QSTATE_CTRL_TMU				0x2474
>+#define QSTATE_CTRL_CHIPID			0x2484
>+#define QSTATE_CTRL_PROMISE_PERIS		0x2488

Not aligned.

>+
>+
>+/* Register CMU_PERIS early, as it's needed for MCT timer */
>+CLK_OF_DECLARE(exynos8890_cmu_peris, "samsung,exynos8890-cmu-peris",
>+	       exynos8890_cmu_peris_init);

Same as above.

>+
>+/* ---- CMU_APOLLO --------------------------------------------------------- */
>+
>+/* Register Offset definitions for CMU_APOLLO (0x11900000) */
>+#define APOLLO_PLL_LOCK				0x0000
>+#define APOLLO_PLL_CON0				0x0100
>+#define APOLLO_PLL_CON1				0x0104
>+#define APOLLO_PLL_FREQ_DET			0x010C

Not align.

>+
>+#define CLKOUT_CMU_AUD			0x0D00
>+#define CLKOUT_CMU_AUD_DIV_STAT		0x0D04
>+#define CLK_ENABLE_PDN_AUD		0x0E00
>+#define AUD_SFR_IGNORE_REQ_SYSCLK	0x0F28

Ditto.

>+
>+#define QCH_CTRL_TREX_D_BUS1		0x2000
>+#define QCH_CTRL_FSYS0_D		0x2004
>+#define QCH_CTRL_MFC0_D			0x2008
>+#define QCH_CTRL_MFC1_D			0x200C
>+#define QCH_CTRL_MSCL0_D		0x2010

Ditto. Seems this was generated by tools, better to align all.

>+
>+
>+
>+static int __init exynos8890_cmu_init(void)
>+{
>+	return platform_driver_register(&exynos8890_cmu_driver);
>+}
>+core_initcall(exynos8890_cmu_init);

So early initcall. Not sure about this. But I think devlink or defer probe
could handle correctly for clock stuff. Not block the use of this, a
comment would be preferred.

Regards
Peng
