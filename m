Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013063.outbound.protection.outlook.com [40.107.162.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9B72773FA;
	Mon, 15 Sep 2025 06:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757916912; cv=fail; b=g5rV5+pr3d0aRWo/kXAHi9i3HTU59kCvUBxzFwf8oXx7Zhbr113i6z2PQgavLpVu6tJswFoj9FRUFL+MaBBwKaZevMmJBdKI4j/xsaN32WNTXHWPFZREasifBSZ/JH1arOMX4RA/Bh3uEK1DtgxN4Rw0FyCBDeF+Z+XJkPQM+uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757916912; c=relaxed/simple;
	bh=dwYR1e2JP+0ejn8xZe0xPl9ea9Ta/uq5w0fKud0W+RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lPngsosglrH+6yn6dQbwt+kmgqgJ0tRL/kDIWjdH6LKmWPlkpUrTMKOGL6IxcMeqI2xnjH5s336cppi8kg3T6LnFH7DporRKR5yNgK5yFEXws2MolE3qMaGkF681KNuKbHCAjWUnPUjl3KMmSxz33L9Xelb661kwBUY0jV9I49g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZU8ge+Qo; arc=fail smtp.client-ip=40.107.162.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZU8ge+Qo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFBOmDF9k7v4sh9Y6J+61yYWISjpr3i6F0DUvCguJ19+z2nRgTGXueqcOXJO4BVDP7LM9028sI9NYLFibJ+lSlZAkqk4kyjd4jjKjTZENbPtdeTVBdquWJKBDULN6aRv8hTbM7M2ql9P4gwFn/d1O88L00dFpb19cQfexF1ZQUbHUTwd9Alh9wesr67nloeVmQxiRnuGCJVTSnlRt3YqqTp9AtijS9myFXt0viRnVeycH33GsmsxkxsO7QKXIRfuBQFh1jetMTJ2KHxeAeyBPF2/ifr6d2riwtzsyJercZqHPj+ss4y4ouQlUTLmZQpLKfOyGInNnja6Z/EPOfoz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShfsKw4c9q3WjkHXFTgSAPVrzDJL53EWcyOQrxT7Xj4=;
 b=bYfl2qHX21oqyhV1g5El4ujtkHriGacHaAskzZia5Nzi0nGi8k+fGNlnJJ1z60LsYCn5diLmsYl+4CW/wxYbRwjFskMcSPsfen69qX3o1glfjI1epI8tbZ+ef5fWiEbXtADQCpBwnKyaipxgTDGlBJmQzI3uin1edzG8k1CvOQepQ4dZMEfYd3MnDafwlXhjJCc9eZ4hX6rgwhHK3Em6NjqRh1uAEj6d6hy3eShCGdNyF/BsdH5RdXeRGbjm0Y9refNelyyWdA2g7L79sZYxRe610ExtcwHHNL7uS/INz4KUOV+8BAuOikhmEd9tZJ8rHRKvsRAaXAxrptp/JHIT8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShfsKw4c9q3WjkHXFTgSAPVrzDJL53EWcyOQrxT7Xj4=;
 b=ZU8ge+Qoka1wbBDg5r9t6CuRunPmYifzJt84Ro/+O9n8Pcf8vEpHqa7c0QF+E5Wj4fsobXczaUpm3VMQ/OctNHciGPUFuVzUZOhAbRLZPFAO2AOieLfVeNULcTiJbRenas6QFGLTf3FcBjbpgs9Vz+iKgIxG6nrKNvenUBvY23VKA7WZE1JxjpzrzpmmthHZeOZnzYLZ6qk1oTbz8f/JREZ5/FvSqNAzUEw9MZE9rK6bmGAoMme7lclQNH73C2eZx0wUmgxOZKWr9JS5WBoLZO4ILBTpjkpunYkOC8KmhfDoiN/trsfNIgdUFgj1JK670RIOEUmqHfw7Od7OT0ZCVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB11685.eurprd04.prod.outlook.com (2603:10a6:150:2a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 06:15:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.010; Mon, 15 Sep 2025
 06:15:06 +0000
Date: Mon, 15 Sep 2025 15:26:40 +0800
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
Subject: Re: [PATCH v1 3/5] clk: samsung: clk-pll: Add support for pll_1419x
Message-ID: <20250915072640.GB8224@nxa18884-linux.ap.freescale.net>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914122116.2616801-4-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914122116.2616801-4-ivo.ivanov.ivanov1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 5b248e9b-276a-4e0c-5dd2-08ddf41f371f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|7416014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nc6d0feaDxRKzXc503sx44hngTKilvNYKH7KgHMVXmXi0sqgwkuC1Yt9rUqk?=
 =?us-ascii?Q?iUyUEyruwICQBVYV57rsaUExhv3iwEYoGroSnGtyTTGzCpCZj22d8D40CCod?=
 =?us-ascii?Q?DjPcaszgV8hCAnJRuEc1o7wv53OAT1/+OAN6YTSWStaIPFYKROxM9gVyOMp4?=
 =?us-ascii?Q?lzVgpsGlQNB8Pfx4uZYTt1kV/zV3xyK9F9OTa0SiEjcmLyRlpgPr87T4VwDp?=
 =?us-ascii?Q?YU7umIqkS8wvzW3uNG8Q+pLJgVjZWiy/d9/16WcQec327SfUfzvb8l3VTawj?=
 =?us-ascii?Q?dloNeWbO6fCSgl3xybDK61VrKt1nZsDD9p13px3Wjvj9v5ht1EgMxQPAdXAD?=
 =?us-ascii?Q?zFu7vJfONcdLxuw0ka+cU9Ors0gPwEwHMYZy6Q1jlx7K/3RhAiZ1kTz6lhm+?=
 =?us-ascii?Q?xOyemcqoFZr6swatES5KdcK4jcHwm+LlLwV7ghY2YzoW1D01jdoGS8cSYocL?=
 =?us-ascii?Q?Ycq9+tWdDKrm3V6TrCmFk1BGyX19RYMgbDQ1n6CpBDx5oBIx7ZmOXUgApYpQ?=
 =?us-ascii?Q?whtr7cOKGFttJ6suUDuQ46SUdQ7tb7gCyg6TdK93NQLKQ7U7kbaP3AUKR5GS?=
 =?us-ascii?Q?6oJhl56xPjcZSYLkM8uh6Psdmq9Yf6mX7lIaRvuFRuBSP2H9eoFfeKm0prao?=
 =?us-ascii?Q?86T50ZSjjsIpbvDiFDTNpImWnzNkDWRV1LPD8q12eFuWGMteKjWFdGHMKiIM?=
 =?us-ascii?Q?Kb7mFQoyQoSpvws7A4m3lpyrWy3qtBP1OINgt0O5eqf0/t9NZVvnCJjV4NRu?=
 =?us-ascii?Q?nptRd7ZtC8ghH1HnOEdjHn1L9JRYkN5W8Br+Lx9J/EOzsJ41bpmmEKSgpUUB?=
 =?us-ascii?Q?ANhXh0yDQzt6XPTitxO6P2EfUJw899c99LCagajmkgJ6XLMH3FrFrDWaogWG?=
 =?us-ascii?Q?4t//I9wE6jgDK1/ISqwwXn+Lu//E2jHcz6sc8LTm0ZJ/5pDzXLyDKlJw7Key?=
 =?us-ascii?Q?Jcj7EBz0CApGtCAh/ZtxT5pcpf7nmi00uFIJWS/uGpzPTeXBwTXUgO7jZR1o?=
 =?us-ascii?Q?9GL2Otbd2JtgTXkxuj174b7LxA+nnqV762G1LTUzk/MMddYj3apdP/WoXTzJ?=
 =?us-ascii?Q?/++OaXy37tFSxfzsrnhJpZfhCAaMfjKzyIWytphc7lrXJTQFNuMa4zCy+fKz?=
 =?us-ascii?Q?26BCJKtECtX+Xa75EvJcDqbnZtxdZ1IKQMpuXoYnuac0n6ZwyKYaTz7Y0HEe?=
 =?us-ascii?Q?jM4kDCFWNz4NDJ3LIHEuKCBbySzhIZkVLgReb+V1PlR4SdxedR0y59CTBIE/?=
 =?us-ascii?Q?BIPDp2Ok8MyP/4NKIstnWqC9EOMaMj7zRDDq8PxMOl9zID+GttlOC1XMVhCE?=
 =?us-ascii?Q?qH+uISVVXnbdj5th1pAkrasCU7Jq8jRIpqmRYj/Tb5tEA1ajW8H08/txl+Cm?=
 =?us-ascii?Q?xfwC2Fkxw5x6bgirLfVlsFtMemSGNI3SJEzfb6s38sXoR3RDx5Rg34CIIdjS?=
 =?us-ascii?Q?UL4tGAWrlsPLnmCe0VKr4g7JFj8tHgZFtZ/NjPBxFXUnD2VLudgHjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OljQEfowtJEGKFR8bGXszjr8vY03kxgf44YmIdDEO4dXdPLqd/+0YbZkT1Cx?=
 =?us-ascii?Q?RwTnNVQXY0Eae4YVU60cbrh43EoaPIvCDbGHispSbLgc92ddbz0f2uyOKQp+?=
 =?us-ascii?Q?D6xwk7S9/MRbEGat5J5z9ET/MIzN2O9b3dYSnj1mUg26mjyBBy9Yyj9ctHXz?=
 =?us-ascii?Q?59pHfSihOimN3/SOz3tgKFdOidoQIPCD0feTty6xqj4H3MdeoQ6J2sbhZPyo?=
 =?us-ascii?Q?LxVrmyrSSDFtyD5OvRUyJTqsJYc+Vs7dkULJX8buXlAWIhQsFrhf2my8nFSK?=
 =?us-ascii?Q?JqbqN8f5N+xGiQeUtkdRsIqesayzt/XOHGrvqiFrTvKJtIzufADipoaYY3eL?=
 =?us-ascii?Q?G2/KZ94l7aafOPPEfCImgBuuUkQyYnU8DmVBYKsHUh3Trg8moT8NMl6ZPkO9?=
 =?us-ascii?Q?h+X6OOvU14LdhwYFqsIAzgH6UMBDaJaI2xqY2O/419mqTN1JXCPjbTkYpoHB?=
 =?us-ascii?Q?OvqUjsmJNwhZKIovBsuScsCxKeRomdHaYSs5jq4tJjIPB2OIK4tA9YvEbjzP?=
 =?us-ascii?Q?/lqBbCRqxsb0AS/aZLoJfxnvtLGWaSAwmu+dDeDnk8LMPbzOfCwNJE9yElB2?=
 =?us-ascii?Q?DAH/f6KqzaXNdhqBynd2302ttc0E5HGn3LQtrkux9D51Kg+yYidl4pxpNipe?=
 =?us-ascii?Q?BobRgyZ6yOuuauVC44Z0ORdIhh05fWXCNrzMnDwRpjqHCni8WfEC+/+GHYES?=
 =?us-ascii?Q?MGksvwdOd4dFP3w2W+bJieZ1ltcv1qlonPqRV7CK2IIIsK3cvqIZrpSSr+nE?=
 =?us-ascii?Q?SkkNngcTqLJ8izoKu47jiJmTYvWHpR4X/nxCFEcaqUZR26dvauN1djGF5BF6?=
 =?us-ascii?Q?BB7zi11bDYo6uPEJA9VOhkYqVYRF25lbHCXhNAPXnctd0Twx7wMWaQY4LxDG?=
 =?us-ascii?Q?aXKZi+yjWj3cHCe0jjXste88L7mttUeplN97TISizmn26cvxSZdayRqH+6O2?=
 =?us-ascii?Q?Ymt8KDPWL5DL+s5679ynTsdVh9ZTPMRI5vy9TbbbHHIGO+EtZbgaReXLU2Sj?=
 =?us-ascii?Q?GasvATCJDclfGnmnrYe47bPaugT4Yz7SmvoPSWA/7GfoqidpAybS6q1JC1Bz?=
 =?us-ascii?Q?X0d2UkKSfwBn1640MZ+Y3AMY+t72NXU7LBi/we/YAejf9EtJa6gw2broDGC5?=
 =?us-ascii?Q?fOHLuqyqi8gqQ9GwguOyKENTwWezE9SHlodyfmia5DYZuLfQJUj4QO4J8+01?=
 =?us-ascii?Q?xFW6yffiLjOI79nJEaapB5AvGEpxKCE/WOkLX61Cnf+uqVTJC+pxtCK6Pb3S?=
 =?us-ascii?Q?+6Rwq92RkFEiqVsyugPEeabjHcsDAwP+Cw9WsNRZKMhmozu7QYKQjX25wJ1e?=
 =?us-ascii?Q?8TCMFb92dcgcRoSu8HIHeaHgkogCEaqmfJer86dEaIkwh0tMWJBSNeZ8aGHE?=
 =?us-ascii?Q?AiHLhs/yEvFGcMWqQEaLRWLfiwwEUNxp5yillFBNqnSbT4bfM7xVp23Ryp3Z?=
 =?us-ascii?Q?/dCyaAp7unHKEUJVU8UePkkJY1d+qAGUVfRPcJ81+PiptWLvVo6jDOEsieDI?=
 =?us-ascii?Q?9Suqa80ID0r3aK3fsnK3i/gfjrlviZ3wQ8X5IgtXNt7OD/zzN1khVWokJyZY?=
 =?us-ascii?Q?OEw08vNk8fLOuTBysURmRCOfaPjYWMpOwVIPZhbP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b248e9b-276a-4e0c-5dd2-08ddf41f371f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 06:15:06.4351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ATKRKETFYyE9gijhfN1dPZoh5oIF118A9DPJAu7bu8YSwaSW/1DySuqx9STxZVAuPT48dgibsMw025/S9WStw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11685

On Sun, Sep 14, 2025 at 03:21:14PM +0300, Ivaylo Ivanov wrote:
>The PLL is similar to pll_35xx, with the following differences:
>- different locktime - 150 instead of 270, as with pll_142xx
>- different rate calculation
>
>When defining a PLL, the "con" parameter should be set to CON0
>register, like this:
>
>PLL(pll_1419x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
>    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
>    pll_shared0_rate_table),
>
>Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
