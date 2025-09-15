Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7529F86344;
	Mon, 15 Sep 2025 06:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757916797; cv=fail; b=lkY5YuAJS3FQixqNdsPMMdnZMylm6+V2A0KpLc2UMOdzwpNx1ZwXEoBGUdZZVKx5+TAtmyx4O8WTro9WRBk7K//e+q0pkxBfCYGqJhK9kGTBPNj6WLQjFGBQ/jh5aAQPvN14l0RUN+82Pq7GbUYbDSe0iOgokkTp3FsfvdI+vv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757916797; c=relaxed/simple;
	bh=mSzFtAezMoQE4W2HcaZb8wYYjEJFWGj8ajjhSwldmz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GWD0gWZo0oEC1APM5PrH9Pg96418G8CxqCq6oxPkYx0vK8Ltr7JwA6j6slHk3dBisz4nOF8IWtOgB+CBmslEA3pfVTxbfDaaizneeFFPUs4Mh13sxozpEADzOpn1sj/ApvXyVnnQ4Ps0Gsxa8z0tBmBS7F7ahvExVigVHZwD67E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LEkHAMXA; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LEkHAMXA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGMvTUjKzR1wj9TDmi50fPbIOBmCk6xjG4fMdBgekzKRUucdQy6+6EKalcf0aeKSa/NsfRnZss4cJ83zj1BY4hcOG68cCpuKLnl4zxJR5BTENR6E1pnYYYjGiZHPSjV0n6+LS4qi2bJ47KGLZD4pZ6+WAhtk9h6XC9hNjjlQonUOlV9GXyMVpDvTsxtI2am0dxBQWVJfilC2IWRGzxiCmOP7pTA8mWRIKjGGytBuaq1l5khzMwLDTIr1v0hhGy6CxRNe148vSJcn5onJZfAY3aFS/P3RDB3CfyvY8eloPnMpwiHWTbJWSevJKq68B51CHDeeThGAY7kYCzCoyeRjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpYL6iqWtxQ96LMUqjE2FZ64GoH2ifpjMnmYpc66Ncs=;
 b=nnIXebcjceHoBffcEvcjfvzE5Ta0goY2IV3otaYTSXkAFweG48DfUfAT+wwtCvzw78svuthgPhrberUKV6f1BPArToFESFT9ISARz5Ktxy/EpWxIWIbeNNhgpvfS5w3j/A+yZcxhUCEEAT1/7W9trWHnwJ46UM4FWx47TPsakzSPrDsVnnvK/3me5+tUOvfgXJ4BlHwOGawsdsZRr7jMe/MTNLs1AoUjRruWu+zlXMltvlWrd1pNjhoYHA9BjCznpISdHcGCx/Llt5qOCMarOIwABK3bWza43qWkBfUmNMLWyXJzO2OI0K72Z2dbR4Mxz1g6Lf4+ymIlY1GLDRELxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpYL6iqWtxQ96LMUqjE2FZ64GoH2ifpjMnmYpc66Ncs=;
 b=LEkHAMXAt4VQg63gpZijNzCDbpXroiPVoL2ze6o8jkfsV+jXYtDhgOe8RnAlZrJsKAufTDgO1MM+dNvNRl9LRv9Q/014Bv5eJq1InXRhmpX5pqdec1aAhbL8r26hozcwoHDt++RuV+6kcxNLBTIzNwxJOwculyl8OFzQr/lW8f5euRnD5kx3bRP2fQ9AOC2dlkmue1GaBHvCOYugjRsaysVP0ZV/wj6lBEhEl+BFG8MdOtT6sbeZw+ueCHZkDU5hZhRjY2a7GW8o0ywa/Ns/gxDG+WIyWdM5LncW5UAqsPvP0ci6+lYX+w9++nboqdPE9vfjkvf+PXVponQ7KP+Pjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7845.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 06:13:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.010; Mon, 15 Sep 2025
 06:13:12 +0000
Date: Mon, 15 Sep 2025 15:24:41 +0800
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
Subject: Re: [PATCH v1 2/5] clk: samsung: clk-pll: Add support for pll_141xx
Message-ID: <20250915072441.GA8224@nxa18884-linux.ap.freescale.net>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914122116.2616801-3-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914122116.2616801-3-ivo.ivanov.ivanov1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e3fecd-296e-442e-02e8-08ddf41ef2e8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8kGj8tqNrquAUB7l26Nat5In3sNWmFKW92dKfSh1wrZckQ/tFWm41wushHot?=
 =?us-ascii?Q?ggnyRswOPjA0vbhvIyBJ5WjVP/kdboSkVDP0rkNfq/nFUKUuyHAoc6vcyFkb?=
 =?us-ascii?Q?IBzioswfDfZphpx0ARis84aEOC2tqUjsx2S2F1eu1QXfFn2UKVh/+YN1XP8b?=
 =?us-ascii?Q?+wKSUdQxbqLNFSqzq8MCYxeWMxqg5b47DXd/JrH79sLH8C9MdYoCEe9xQINJ?=
 =?us-ascii?Q?QdLku5UmbKuzDjarbdXnIsf0pSAcJtZoP5782PiOM32Zf8mWTDHuhxMK0tWn?=
 =?us-ascii?Q?I+wXO76Q32fmtQTghtI20lQvVlt+g5Z4Zqhk1kv9F/GRsJB5KcMAQDZR6EFo?=
 =?us-ascii?Q?0HP+JBeyU5JdA+7kI1n/NJklKHNf4l0uoTeySqjqo7I5ZPrOvAhDfvKIJ3bb?=
 =?us-ascii?Q?CXG26+pvUFcgD8psA7VdAnyqKeZSOzxY5btpyUTKwbz9nx2sW7EQTipvNXLd?=
 =?us-ascii?Q?EpIj9z3v5VcKZbYFh8a0QnMa9Q7Md7v0zgzKTV5/qYvDM7WzRIXjza/efP+v?=
 =?us-ascii?Q?gTm+8zrLeJWEPvosk+mIzGATImSjGAPTGAk0YKxsiooV6gvIecDceT49ABEQ?=
 =?us-ascii?Q?ABfOGVk9sQtKLPQfL3Z46jOXVlY52B2SDlvV5BM7yBH1QHl9NUuSxOvJ3Yn5?=
 =?us-ascii?Q?4jsEnGetiawAnas2i72g7BKNB5hlv/9yIifuHVhvI0w1pHHfJ4mC8Tcuvteo?=
 =?us-ascii?Q?XL3flsn14jodYng3NonBe4il0n2nnBJbum7OjcocIBjaUzOu0u0AlPh3hVhT?=
 =?us-ascii?Q?y3EvPyQgDQ2JkJ0Jrpi4uHF8g9pnDdmgQ+1COfir9KUZam7T00PHI2yotNxN?=
 =?us-ascii?Q?y34h0eaWiJIIzZSFGL4TZM2DN7cTQtP9eu5x7m9TRo/qkftmNUTaaPUH9Caw?=
 =?us-ascii?Q?RHpy0t7IoLUuCzqUeckserHDzqPc7xQ3PHVZojNazIdG6SUrIsQwM9CfknDM?=
 =?us-ascii?Q?rrSWUWYRlz5/qKekOuXKGmI5HJC3QiilQ8ciP8iwl4FSLobj/t5jjeiMYceP?=
 =?us-ascii?Q?dC/w99tDjETq2RKFSSuvnZCTGM36TmaklF7mgDy30SvLPMfBggOIT534UdC2?=
 =?us-ascii?Q?Zrf+KWkKAvhCAgo3vCIXbPh8r8UIMZKWAeYNdNahjOpOhEwZY26kD0y2cYhu?=
 =?us-ascii?Q?ra8AEPzI5ygSClVaptBQlFzh1FxSrkfy+6RFfbLUq+SThLHkugiyKw1p/pRW?=
 =?us-ascii?Q?1+deelF8+TxkYypEfpRw7hG40bw/g91et2viaTfo+2y+2jsfiv7RwwHuSvNG?=
 =?us-ascii?Q?4QKC5EHveYjFx2W/L9HvL4jiwqzO876yjmgm57MrGx/E9KfN9S5kYfLtPUio?=
 =?us-ascii?Q?Qa7LBFfoDX+jQapu8NLUdBpmWSZFFfJ2yLluB0ANmfgOk1b/yw8bheSHTOzX?=
 =?us-ascii?Q?0y04s+lyACyua/Q0UiEKxmpbeGWanvhh2lCecwYsON27wzO7QkFPDCfYt5vy?=
 =?us-ascii?Q?SFJaBJq5ob4W34ihL+eC7Ux3ADedcQiqZZ1ev/F0REKuIT7ICk1cpQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6HgXxH3GOgCcUpXTq1O9P+I07Q+i7EbQhPL5OZIXOebvqY6PoIBwybLWWQUF?=
 =?us-ascii?Q?Y8XoLPLear7tzZH8Ory8FTn9QvYHzEO9RR40TyJSmfA7Adx8fQ0H7EGFvTg5?=
 =?us-ascii?Q?6GB2TSUzT8LmF2O2Sutrzq1DmbXVoR/OUDf8mF98wm+u3WTsk+xfG6Tfb6Ee?=
 =?us-ascii?Q?uA/MvUNUiV1zDi7AxFRdhFKhzclBCPEeIWuU9il4TG5zTttF/UrGPQ7gNGnc?=
 =?us-ascii?Q?ZJMYR5TGvbXlyGjdyjJc8eVija3xfmCphm193dj7PW7SeEdhVFsiYTQNkP6o?=
 =?us-ascii?Q?r8wey68zeJexWfuYQH5u4Jm31qiAQ4rXbLo1FDfE3/ZnUAUlPucAKq5lNU9K?=
 =?us-ascii?Q?mFD4K+DFt9w48YVMbH6ecQWoXTZmlG2hb5URW2LLBgsaPcRxgc3lvd5W6dGF?=
 =?us-ascii?Q?J2d/BYHAkAzSfuRWLg0iEFQbQHp0sV5GS5Z6c1T4nnF3Ru4TJVlnCvZrWSLW?=
 =?us-ascii?Q?4ykVp9UObd45I8eEuDg8Rs9WVZESJp9HNLI4n4R77bwocUQoS3Nw9LyrO9yw?=
 =?us-ascii?Q?BZeiKnHA9U/dBLu8nQVOM0oHNAtUMyhOCDGQyatD5Zk6h8dQ0Id88j4Y5K5C?=
 =?us-ascii?Q?teREkK8DzcODpLtH/jKqqHqrzEiRMKh5VSnK7rVwa17WsDypGREPTTHc4uF0?=
 =?us-ascii?Q?CtNNmZcF6vL/buep21KfGz793cB4tmBS0ZHKXsz7GN1N3U8UHovDaHYmZ9AD?=
 =?us-ascii?Q?KrLD8klMMRHJH1gOs4g4qym5Vf1oJope4yJmAjIk7Lzxiycy7JIK6HSjaF5h?=
 =?us-ascii?Q?eAIwxpuZJfKzhBOuhbKBZ1P+PwE6Fbsb9jbjp6CvH7OEPKrCnY2xcKpDORom?=
 =?us-ascii?Q?2BpOfpCPsFCFl2CDak7tDdF8HZdxLg24XoDRoIuujXP5qL1xFO2kGHyNx9pL?=
 =?us-ascii?Q?UtZxOboO7zHBq1KLAEMwklMRDqt8aU8fGO5CVvs2CcPZ3N+1UXCrxKV8HegI?=
 =?us-ascii?Q?sX4kv5BcWNwEB7t8w6RYsQ55yRvzNHdgjtyN0qKmPEWFZqHcJoHHQgiJlseP?=
 =?us-ascii?Q?hKwiHM4aGrslQCXpm8YE2oiYgpL1ZXKotprTWcgM9ARhNRo/F+OrqPDUx5mJ?=
 =?us-ascii?Q?4a7lSBjd6hC0YlI+lhZN4+Do2TnVuhB0VAUaZhVVEsh/QCV5Ht+zfE27VQhn?=
 =?us-ascii?Q?cZv+H5BXoSuLa/zFX0fXepB/9jwrF8s6Pvxm09a9niPRCJdRBmGwNnWNuWok?=
 =?us-ascii?Q?WQT/rDiCfxHgpLN+nF/TW/tq1HUjWcxdrbLOW3AuN5xija6jmyssHOww3u4u?=
 =?us-ascii?Q?FUe/5LUYgoqYq5MOAtmtMtAQ7kxW6kX5Y8qeFLcOX49/3lcauCog9kdIM5TP?=
 =?us-ascii?Q?gFxffGxWkKuT4T2a8vpPF+g/6BdXshXEI4YlWxObXY9iVvjTgjwNQNtX0+69?=
 =?us-ascii?Q?+TS6HGFeIZ95J1FxS53PnQDf+6Ufir1Z06AhwDQYWWxgfCx8n8knQw8n06nT?=
 =?us-ascii?Q?LW9M75KYR8C9AtgGSHFSdUOTZhcSgPcz1RlIBkLNYvzPGiaeVcwmymHVhdh9?=
 =?us-ascii?Q?cHWuKvx4oU8TPVSDnVJWKahjIIj2G7vAOi4oLz1PrLvZ9Pqr5AF0ovkBfBqb?=
 =?us-ascii?Q?bLM/AlxLrCme6xwUsaMTJFOOx4kqJlmPw6tx7Zmj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e3fecd-296e-442e-02e8-08ddf41ef2e8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 06:13:12.5030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vY+6CLeyFUBkiTyItpcf02c5P3Z5m/pVJXOXqKEnw41DkeRSyVW7eoIoAJ/lkQvcA3mbEcNQ/oPTM9tFJoNKGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7845

On Sun, Sep 14, 2025 at 03:21:13PM +0300, Ivaylo Ivanov wrote:
>diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
>index e4faf02b6..acb366f14 100644
>--- a/drivers/clk/samsung/clk-pll.c
>+++ b/drivers/clk/samsung/clk-pll.c
>@@ -273,7 +273,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
> 	}
> 
> 	/* Set PLL lock time. */
>-	if (pll->type == pll_142xx)
>+	if (pll->type == pll_142xx || pll->type == pll_141xx)
> 		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
> 			pll->lock_reg);
> 	else
>@@ -287,6 +287,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
> 	tmp |= (rate->mdiv << PLL35XX_MDIV_SHIFT) |
> 			(rate->pdiv << PLL35XX_PDIV_SHIFT) |
> 			(rate->sdiv << PLL35XX_SDIV_SHIFT);
>+

Nit: unrelated change.

Regards,
Peng
