Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013037.outbound.protection.outlook.com [52.101.83.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D733279DB6;
	Mon, 15 Sep 2025 06:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757916967; cv=fail; b=IL4y+LdR1hjLLZH4YH+Yd/immAifvyRqDJDvBfJt8MDQ9A5mCS+YVmG+CDjAA9UuvaYgdDMum3NPEUPpEdohrbf73A6Bwcf0RBzvHFSoVObH3TEeuBrGFsoRNe6aN9z6h7P9Q6gzOnZAY3i15bBhYaqzbxB5E16ND6YD9CL2jmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757916967; c=relaxed/simple;
	bh=HDfLlGOu/XcP9w+S3s2cGrQgwavKQpTPA70aP/fXDj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mPpVmIpvOPz+L+S77pl367M8I1z33A4QC6Jf3D9u0AIQe+lxtybgzaZrVM0K69tBMY2VpPXuqupjJPIZfUlAD75vnyVekJioyeaDBDqEMBzcvf1ydplFFXb87vWlwFqLN4ro6ENEv343BYqWpasxL6KE9sfZ6c9AsjPhAJSxXiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NX8DIDTz; arc=fail smtp.client-ip=52.101.83.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NX8DIDTz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwAmWAo4UytmDQfk37GTnL35F4VMBKv6zFANZFT9fyghUnBsHEdPP+vKpyOX+FyjxPvPigg/r6ZTYRUl/0Y+x93SzZJJ5OO4z3q21uabhAWPynm4iyPLV1jv8Ic9xLxSfmeKxlQYF53KLUPOBhSJlOq1eCXXgPkomFZU4PGwtE1/YABICjCNV7hMwmRxIe6SyWg+U0+tP25kwzQaNA8/DVvcylnmMwbKf3Sghcnww+AxbvU7ddVDXo52b92wDp4x7hJj0iHNLDabQ7XIzyrZmgVs/noJSFULDqmaNe8+Hp8W7mCGQH2W/p1WAEi/78FdrHwuUdoNUIbZes+c2wjpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8EO6Pvpg1gX9RGCgyAeUFDYCf4jGcbk7yfNaY45ulw=;
 b=sXB8bLQ130zGAWkIx+OjFLalA0BbAU5bD1ANcUUS5y72id4v6ljbpzu3ocGcCxjk9LU7qPyP+Gzmbb6+npG1IWjMLPFSsMbMSN8rF6mtv2CAdJqgu1YbYeoCI7fZT0LggOnpck65HK+GvbSZfiMm2MX8hNvuSHn3JQ8/1S7IJqlCWX8a17eAfQ9l/zgFyLMtRud9Z4RBpp8HnOdPAqi0UUKFETHr7Uc2wBsS57F8nYTsJeMgaM7ZjnBI6dKDuYKiYIXus2DLv1/9mUGsFvfeTP/Fg4j2ZGpPYLFQI2ZTVYjKJxk5CUaywPt4mLy1Yu4FMpPJ6TbXnD+ZaYLYNd0Nsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8EO6Pvpg1gX9RGCgyAeUFDYCf4jGcbk7yfNaY45ulw=;
 b=NX8DIDTzO3Zo6NDBuC9608rgfPcSJyGHmg1kZnN0AtTQDbAHDOyLAdFbwhudY6Bsj3mhFih7u/8DKN2Gz2e6b6gzVl4zbPwE8f3psvC7+LUd76kUzwPLfSfygsmqQslQ4lHJKbKMAXPP9V8bKTqWS/wfKekhpfO1yAqikh+WN0VYyjd0WZV50wk+SpjZgdudFAv7cOYN7/oRQYF9VkwdPr4j/mOHZDXreJhwX6v3dbUjlTik/lhDAxqBkUwijI1tqYegid1Sc00v/IxKQB1pw5JloFQzvgHtwAbmeSUitONB2xvlSylzoGOYOACQo8JrdZ3GfkJUPVNfdPsVxP9DxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB11685.eurprd04.prod.outlook.com (2603:10a6:150:2a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 06:16:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.010; Mon, 15 Sep 2025
 06:16:02 +0000
Date: Mon, 15 Sep 2025 15:27:36 +0800
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
Subject: Re: [PATCH v1 4/5] clk: samsung: clk-pll: Add support for pll_1431x
Message-ID: <20250915072736.GC8224@nxa18884-linux.ap.freescale.net>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914122116.2616801-5-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914122116.2616801-5-ivo.ivanov.ivanov1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV2PR04MB11685:EE_
X-MS-Office365-Filtering-Correlation-Id: d5901729-8486-47af-6255-08ddf41f5861
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|7416014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pl57DV3899ChyyEaS4/KnA8KlYuh7hIJSC7reFvFQSYJ1a9B5g/auC08ojvb?=
 =?us-ascii?Q?9/yAee1eDLz1+cSa1Jxrx+qwrFdTyx84W/fm/z37EEmJobSoHmjKHubNY1SU?=
 =?us-ascii?Q?nvGqKexB4k6Xi/aztPm40Wnc/kQ1RrfBR9W2SaZx6ZFR94dfP/QWZVNr2l1Z?=
 =?us-ascii?Q?nyAMBtSWaEhLBTJSKEQ6winOToqrUXS51vY07m+1IGlcilBC8eYgiIe7j0c6?=
 =?us-ascii?Q?e2ADzq+LzT7WCbNCUCVgUAKprZ9QF9L0Sl1IcxE+pO++NGYFY4ALsJpx1c3Z?=
 =?us-ascii?Q?egh7759N4GRE/TsyvPYwR+JDBs46YTFEvpmk3JFE+1Xm8oCfCFKRyqVMP1ou?=
 =?us-ascii?Q?mpa2BIhDNwEroCNlN3w+1t/+h/BXDWuKZ6hBOmRGJnF4hg7X42BwrAp0oj5J?=
 =?us-ascii?Q?4wVMt/ogEhJPlkl8mpc8Ch9iqfGhojvP6b+qxAvZBcBa+tLh03b1fmPvE/RF?=
 =?us-ascii?Q?BMy114MhTRJnM/181+hSswPWAWtjg/cIMA81i49MrqKLSE8ZHLXHlzG6c73F?=
 =?us-ascii?Q?uBj2m8EjirLqRD6cKByBFmspYr0ep6cDhs7RclQa9g+TPO3YuxvogWu8zBWp?=
 =?us-ascii?Q?2v3CJDrgtP7kIJXGjCJ+fym+SNPN70PyF+VVeQi5YW1s7bjcoeWoEEhnL/FL?=
 =?us-ascii?Q?7rOfmOIeHX3N8Wtqc3IOUArHmtpk9ZyNAGUycneYdKJ0OT0AOn2q8f7EIOvK?=
 =?us-ascii?Q?FnoO5McXrlZLuLfdZsgUM87TLcUFF96kQHUR3zEWhQVdeLCPsqumptwyV06D?=
 =?us-ascii?Q?NAc3tHX10OazY1ys18Ocw6PJoX+AiPLUbdJ58LIBaZzTFggB/xDDFacFD+uR?=
 =?us-ascii?Q?0IbeHVXFHnnVvVfTgND6JrXsdICkSt5tTtoWg5qMhfNkikpofssg7qd77DPP?=
 =?us-ascii?Q?Dsk0o2O5WQWvFwDASPeu0+s71JS2luprzbttpSMfirB3u/f5q+nbeWQcRGxs?=
 =?us-ascii?Q?kZ/mWgEtV8CdsfDUDCe3O+Jq9jOZ1fVu0BeuLxlzySSIsz5gCMdxe+6/57Y6?=
 =?us-ascii?Q?P3T8MmBDxLrAvLItPHs1GsHz7p1yjRvRs/Rf1js+PO/UtAWu7cFlFN/PLCvy?=
 =?us-ascii?Q?K9ezWsZzQvPFYphDIkopBQAjo83EnLjpQPb1To05xhE9Kb2qzO4b+/tIGm4a?=
 =?us-ascii?Q?1OnKLpccAh/vDeqguCM/r7wsS83gDRMRB7mXMNMrqAAiVVkqvGjAdXFqDJC1?=
 =?us-ascii?Q?gfa7Tkcvxu9/XI+0OLQfGWN2b+allZ8lMnkBT/d3bCaOSG35LmZsqKXMVFHe?=
 =?us-ascii?Q?tbZ/0PvuKZk58i8L711r2oMqozte+ofNoOZgLR1pvBd8LYmIj7XEd0evGOiy?=
 =?us-ascii?Q?+cGcgg8j9rbn8eWI3BJGBE8XYEPuqBdJUz8iNMKmv9tN62X7jUX9y1qpIpmg?=
 =?us-ascii?Q?ybElVKBTt7lr5S45al1+F5KNb297vV/y4QB0Gwg12s3YczgiAMjQCOsyES45?=
 =?us-ascii?Q?XYSoAgi+MVXskAnhCkq8LULGGAVfqvY35G+LaRHBAHWcwxslCkKT1w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JoUafudTLAs+l/aOhMJiaeNi5sNXLufpmXMxl4Ps4zq4t2uRegCmVbXdPBYq?=
 =?us-ascii?Q?DG8fzF1KmDCBTPXPrf3uJlDVA2etBKkN/8IzXhoW3e074gR/Tl1zSVWUf6yb?=
 =?us-ascii?Q?ZlrXaP0q2JUTLTww5FzAGF3Wotrd0WJveqUZTYzXwBHc/+D3DAzDKSEInmDo?=
 =?us-ascii?Q?CawZygCl/aKopqmIRhIbRyQq7ICdwbNJlZhybTrthjDNzIXGN+zv2aGMWLzc?=
 =?us-ascii?Q?lj9DfNNomVhxX9COGq2WliisTl+UhWBG8JMI4cHHHTCxbGVPN6B/t+CjbsN6?=
 =?us-ascii?Q?2YABaF6JDAdh5xMZOmLOLO+CSmKSAVykYRja48pG/Br4da6PZS0WAHRq7vxO?=
 =?us-ascii?Q?UBuOvYGe/NN/Htsh8wBLbDSx11gD+OYB5hfZaKnc/p78/uwcMRDQfZPnxF9/?=
 =?us-ascii?Q?Ai5IGRrgNDMyUl93fFgPyRLDMR2I45Y4XO2Uy0AOcvYCSpCTKFHV3eRdTQSy?=
 =?us-ascii?Q?A/omAizzaQ4lR6FDjP9qqsoiYnzwayPrh3FWZAlL3Ezr10+96nChB/7LeG4j?=
 =?us-ascii?Q?kn/51CVo4wjlujkF8EhHpna2kWz5zkL3KZ3NO8dJnZeM2nunbB2ie49QAV42?=
 =?us-ascii?Q?MaEoLhJgTgd//v4xIaeV+TYZTmjerVJ0XXA5oNRjt6c28wiOzFr/v0rEnnPB?=
 =?us-ascii?Q?G9FQ3IvQI90bfuHOBz3TJ2/30mTugaLKrMYTd5l6k28L76qIBNmhDSqMGjw4?=
 =?us-ascii?Q?3Zd43/iYIWCDmcjAR+8C41CzHBvgUJ5uIBGiQjevnfMVAc6v0AkCuGdEn9q4?=
 =?us-ascii?Q?wPPQABX2PcQTK1pJGDREBBW7updTHE2B5XvZOpdL/5XVC1TF6i1vvarT02rH?=
 =?us-ascii?Q?dIfk4l49m7CXHCdKxDK5UuLUW1u4LoWAg2nJhQ516xjqjiySR1gdXKxCxFHU?=
 =?us-ascii?Q?1qk+uHmHbL9AKgD3FCVnqiilCb+dWsZrlhj0ysmWEQzVZmQmSc7Gnk1XqkhP?=
 =?us-ascii?Q?oFTgZa/InH/fa5r4iay0huohDIAyig0TUnPLOM6akX69Lt1ayxTY7PKEaMi+?=
 =?us-ascii?Q?i/4iFDD2wc9/urPtWMrhaQutRHREsr23Gr3VRDCnSeLIl2W/lNQvNqjIdTiT?=
 =?us-ascii?Q?8ngcI1XuWDHNlL/jYQ0zYyEHikw8txM2nUBanVLZtcgXhxzWfX4TstLsuuyG?=
 =?us-ascii?Q?mzjcpkxvgDEHWDSfIFBtYdUpa5NO0LiF9Z1aAAYcGadJ4oYO0Dxns95AjSMy?=
 =?us-ascii?Q?JlP3jkf5Pq2bkF8pUPpSQs5/QEKUr4YXrMlp6PFf/a0MjKbS4fOqCwWP/0cS?=
 =?us-ascii?Q?3BUiAEVimQYj/s892JTxWq0okZp3mY854fQkbwQVIORkRoOvTMtsyUwDzfeL?=
 =?us-ascii?Q?ReEoDrgRJvWOBYi2bkfudL6ErkUIsacEatxY8o6QpK589tpRhFMiNook/RAY?=
 =?us-ascii?Q?vGLQO/T0GUlVdVdOjKb2xzZhG0UiEYa0RHCCh13rss1SIFKNMNCPBwdhUJlm?=
 =?us-ascii?Q?PIUeXLs9xxqXOhoSXPjpkk3Lo7Zifokfh9v3vQNXvDWbb0TENxBh3S+BduVN?=
 =?us-ascii?Q?/IuNtxQbdRWVUPRciPtt6AyrRJMVAqwy2LjbMYRC6pFPUkqHI3gsH0nvTqXc?=
 =?us-ascii?Q?FE1ks41vDNBmrGyXJwc91zWebuoPJyDpBUsGYgE/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5901729-8486-47af-6255-08ddf41f5861
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 06:16:02.3175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGxJmQSFMpGvaQ4Lzqu2uLUVuqji12OK13YxIQnbVL9QJ15XbCoPobf0BmhOHy8ik/WvJvs7TZYd2UTtGgP4Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11685

On Sun, Sep 14, 2025 at 03:21:15PM +0300, Ivaylo Ivanov wrote:
>The PLL is similar enough to pll_36xx that the same code can be used.
>
>When defining a PLL, the "con" parameter should be set to CON0
>register, like this:
>
>PLL(pll_1431x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
>     PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
>     pll_shared0_rate_table),
>
>Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
