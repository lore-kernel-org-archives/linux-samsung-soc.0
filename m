Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011057.outbound.protection.outlook.com [40.107.130.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AF51A239A;
	Mon, 15 Sep 2025 10:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757932367; cv=fail; b=Enc+7EmSxbipOPcdNmoHoRo+LQQwSgZnokoh2Lk3TCqeAIXxOmKiysQisRjX9aQ7gHNIgmACJtPlPhNbz8yNoijSoZ4DhLDsbYvbZuAjSrESyhX7TCANWPhcAjtGV8LjHSEOu7RI0mjHclDZIW13mNst7ydyOYwRGsXU7J/L978=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757932367; c=relaxed/simple;
	bh=R7yKAhuiP+KACZKrgqDgj1aq6/P7yw7zupEPTbg/W6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AN0lBFQN7Ds/aA1nYZMz1RmANvlk4pFeEYwekEpmxulFnPuCgDvotmWeVpcgxQS0Ua9oszDDO7IADGiS7WcMNwRn8J4ajBiyc5wQ1b6usjlpshVt9KMzkxspku93xIz3ivgpf/5iuunijs4+lHItSlRTm/FWAG0EkayfZIN7sBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EBS9dQpy; arc=fail smtp.client-ip=40.107.130.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EBS9dQpy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRThh8Y1Lx1IArr+UbYn+DgPwg1pcXBkLOvM9TJYowF2gpMOBTH/teOpdqcQiJXYFnJMMT4DK9ZyXEpsxVclMwwXB9t0SYTnTGVSF0ZasoT4lYetJoKkHpqnfQ+mCadcISfOGNCjkXB5kbTugF+RfmKCNlT3xutKk5pEl14UqxQSytdWC+fQ+TZi9msad69qeuMS4UAYQGMPf0+qiBg33gbhnIi+1md73YRU0EUv1W92D9em3e/kR0n0VE8hdPYb7PnUrSYE/VnZOX9HyMVQs7+3K0ZVJ29dEq5EXd65EscCxDQUjrt4l2ds8LciaInBwsX8tBGCcTzGb0tUS/hPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlJfCaS6ynJMJa4hzwSk6DrJC9H/lR33r3nsnMiLmxI=;
 b=kfhccqF3+CrVIY1EKQr86B2DeO0I3aY1P++k/iX5CCHNRIuz2H7GFMBzn24jzH+t5j9oDciJuYgcAfHo+tu6c9PwFxo8cVeghZCBdnzN0AZKofgO7faXtuPV2u3hLBh5FPBTtKzHclYGem99O53IlLGfg+cRIg3X9MmOMXkomOeBfLhFeVMcxuEEPJLSEVx/b5fNVqKOMH/jBNe7D5ivS8ZA1S0gP4zf3FoE8FmdAQ5XuycNym5rP0uudwB51htktkWcDPnEhjz8xm0E9S1DXZD0Y3UUbX0Hozzyeq+o2ceCLrBeHj29TyaBGmH3yjo6lARjcP+Bz5IIxrWUcGB22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlJfCaS6ynJMJa4hzwSk6DrJC9H/lR33r3nsnMiLmxI=;
 b=EBS9dQpykhtTVo6lVHO3MlUO3uXD36/kdixERU8v24VUuCnj9wc/PdNnWXQb0VyqHkBp+x4odH6NOIQoF3wFSHd4otgTlwvttP/bj55dH5deKxztN+7a/mxlsvXUsu23/S0RJqDGUBQDlT93U0y90nCQvhaZNTIafwGx1fMDEGjv1djPhav7rSUoUYrKmrYH8z8uV+eVpz0gWqrA6+tOOobEgdLSErUuXugjB6jO+skUybWiDZgRkz+OgtyUYoKLnaOGmMwzT0iOLRgJxavE8B+XUhNwZjo+gcj827f3F1d+r0HGrwf7wg1b3xMGH5RVPC7SYW4IAAeTE3Z/G4xlTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9304.eurprd04.prod.outlook.com (2603:10a6:102:2b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Mon, 15 Sep
 2025 10:32:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.010; Mon, 15 Sep 2025
 10:32:39 +0000
Date: Mon, 15 Sep 2025 19:44:09 +0800
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
Message-ID: <20250915114409.GA14804@nxa18884-linux.ap.freescale.net>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914122116.2616801-6-ivo.ivanov.ivanov1@gmail.com>
 <20250915074931.GD8224@nxa18884-linux.ap.freescale.net>
 <d23885a5-6d42-443a-bf19-eb6747e8ec47@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d23885a5-6d42-443a-bf19-eb6747e8ec47@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9304:EE_
X-MS-Office365-Filtering-Correlation-Id: 95cea46f-25e5-4710-1c07-08ddf44331b3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d2gF2H9s5Q85gu3QWKPQzzLQXsl+rWATni9PgIQfsPH3elq05trKw4wrs75v?=
 =?us-ascii?Q?UlEwo849mo5P8fFT4x5KrNrrMWR+BLLRoauefXPG+/bfVk4+ZWm6QkhpI4TR?=
 =?us-ascii?Q?zw1ayopLvf3m5kJHtm+Pt8AzUNH+5EflsqXn4BSB+BsxiaR1R6Gq2qRMSCe6?=
 =?us-ascii?Q?viT+Y/xkXAjKn1eT5htE9RhYXvyBn5YOmZpAjaMlsn2TSxRUEZAhBV77hWUR?=
 =?us-ascii?Q?ixkadPfu+S7Rc+udWjURQ02XBTY7oqzsDZCpOq43dMLsPg86qaB4jXiO4dxA?=
 =?us-ascii?Q?eg7ycQlI8X7XPOhic1V8tHJIF7qrhG0F0keCUpYhy+cPc73MJtW7OFhgQF2J?=
 =?us-ascii?Q?YNjOF04UCcHWFpKHLHle7uE2s+dcYXwJvXmHYi9lcUnPX5Z9d0sHhDG/RwR6?=
 =?us-ascii?Q?4HdaEBHqFRHzTt+r8xqa3GxdsVLONUV+atPBjxJJZNtzNcWNHrW4oKnEWff3?=
 =?us-ascii?Q?hKhodzltgR87zTUHFv+y+5vYNLkFHJWku5nvdN0GGr3FwZEd9WuNr7+FNTfY?=
 =?us-ascii?Q?i1rxUjCJWXdWl1WfLTMx2gsuPrVc7QXGELDcXu8BrrmRarF0ReU9o6+VR6mW?=
 =?us-ascii?Q?jSns18jT7yefZOabz5bBw6IvmO6D5aWU5r1snEtHL+YF0BqUhhhPtDZsJGxs?=
 =?us-ascii?Q?eQLM+KhinLjunuV6kCG8oeDAj+tFCAvCHsP9GOB+SS8N1rGs8fiaXHuUGDW9?=
 =?us-ascii?Q?Env1uvBfQUtrBWlAd5EY1s+YncUBqx8Fn9zrzm2pVpe6tOmuO0OB/mqlS6Co?=
 =?us-ascii?Q?h5LnUcWCuRATjVpgqxpv7RLXfat4bjMekWZK7KmhJwmdhVJrauo0GyBAoM2k?=
 =?us-ascii?Q?7ZCtFsLxIkRvuQb56ADM1zC6MjU5Jv//YgOdFwsNDoGFU5JjNLAg7BLHphIF?=
 =?us-ascii?Q?gXMbMwTOVWjwEfkrMqsmOU8H5FGNUgQStd5YIePIzjFZen4J3nPgOIiVpmNf?=
 =?us-ascii?Q?wxvuUHJMmQeNIuRh0LVQq7XL6t6h0BRSNECnb+Mhi5rMMN0hJm/pc8dM3eGp?=
 =?us-ascii?Q?CVYNgjlCTUqob3r06YDuRe1fP9LpO44m52kibWCl0lLQ54rYUOl8299rp2E/?=
 =?us-ascii?Q?ahKuIop/BTv2a2hMf+iJCiA7arKL7D/hLHflietHvYzTanaan3yGTxGf9c+/?=
 =?us-ascii?Q?y6zQMCQKCFu8q5Bk+SLS/TskCLPESxw935PS3F/nOMtihZqPpvURj0gX6MmJ?=
 =?us-ascii?Q?1HA8kG+b/64013VqmRu5tNzJ2DYaWtcnIS415jrr9Kti2j1X3cq4Soel43+s?=
 =?us-ascii?Q?RQncBdrvFP5LgvP2oFpEyLl8d8HyVCuHlgBMrLG+Bmbrzvwv+/KzjeAqKkSC?=
 =?us-ascii?Q?kG/tdfMIJ/optXZPB1I0s7Wz0m41xK8SflqECQx8l+RZZIlCwiqREDb2WUj9?=
 =?us-ascii?Q?iZgkeL5pc+jDHool4/oI2/IfXxuGa1W2ndkmW3kxRjH29m5BtCEUGrx/tNIA?=
 =?us-ascii?Q?9si/Bjs8lOYuXGhBr5clMjISagTaLQUPbFitrl+TSqCs8c+a5wz8rw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hQA3hCI2NL8wSQe7faLV4XhyxFufCA2diJjBJKBF1V3AJIqNkfO4D21rVaHN?=
 =?us-ascii?Q?LPr3WueeW/z/KCdc7fWUI0qrf1anFBM7Ym5J7Icuo3pI9MlnpvLVzJca20OM?=
 =?us-ascii?Q?984lFlB+4BQDFyyHVOlDzE79B8mrlCky7FmJcpPcVYtBoKoKzPznhf/NEaVm?=
 =?us-ascii?Q?JaKL4S7ir+t72+nMM+3Vsja/ko6VibmLFSUmzeH6GERHrUpM/CW3R77ckaIw?=
 =?us-ascii?Q?k5SavpSSJueQr/18gOOYpN1LftM2Ia4AS7SxADh+pSH17fsnAgPSbGQStKEc?=
 =?us-ascii?Q?u4plgKpeDS1FaLfSHbPrDv1l4Kv8ceZ3+0PiwsPmnwxOmEJW/JoKo9obiEbD?=
 =?us-ascii?Q?SP0hPnUbOFEjMjqgMJWDB7GwvgcOS/HaEm/fVSsYLWbYFYds8Xik78OQwxfv?=
 =?us-ascii?Q?OHs+LqYBCZl30ZByyFi1U3XtH2OJcKX6HzSdXD9WMrQsSbFsUib0BjDLmnWz?=
 =?us-ascii?Q?DLRm9hjkeL2Fa584VjUiiwuu21atW4L0lWPf0PUrovVXdybcJ3qyeHwgNPVa?=
 =?us-ascii?Q?AJqAXkz76MkcUOlXAS1fYBYX9Rp0TjAin6ew1bwhCl/cEIItrst/zenup6x6?=
 =?us-ascii?Q?tUl7i5uZw2LtOLHwG/dBjDIgJRQTaLEKGuGiMqw5brN+fb7AdEsVT6hA/MXY?=
 =?us-ascii?Q?7ceUJzWyCP1pX8mWz1nDEtc7GgG42vgOmQ4jTuBt3QsPfJ4MfPrfZDpe8Ioe?=
 =?us-ascii?Q?rDWkO0k3M0b2BHXS+7qCZW7H9+s2qneMWC1eOvKP0bLb+tbnzecEbO8wJaHE?=
 =?us-ascii?Q?YyNg5FViIckfmc8TNb+BsvPJqWOmX8PBBBqs0ItL+B5lzmT8clhJjL5iErdm?=
 =?us-ascii?Q?Kb/OBXj8mrc/KBjhLpK2WxosJDL3LQQzelPFXc9+5dq+H36C/YCjO0+QR7y4?=
 =?us-ascii?Q?yavdNMFNEQ8UtjjlDvHqQuHsAb+CjlaR7KLsMBTJlXX+HpUtZ9W8QPg3zJW1?=
 =?us-ascii?Q?WxSwPqhz7Ykj3XI1Y7NnrqUU0tSKL02rG2ILo189n6MksmjEhGJKl8d3B1ys?=
 =?us-ascii?Q?2HxmsfAX2HwU93NAXZZWAV3ZsHnCER2Hvp3zhc8QB2uGRf8cEjldySLZxK6a?=
 =?us-ascii?Q?9WJgVbxKdp32u1ia3jCb9rgepHR4bJsk9ENkuNBhvf2AvkHfoKVKxlinw1zt?=
 =?us-ascii?Q?8HZPL5Wa743Sfh3uMxJjf/XXsoL48Tmjy0nguE5ud4OlIdWQc2TxTqIJUAZD?=
 =?us-ascii?Q?957OF4/osNOzTBx+x4Wze9UBeCc3p5l9AaZsMSEiFxtDIJAc6mbX7dA9X+PL?=
 =?us-ascii?Q?3TSH+/atf6OuiDn5nH1YQAqIalKfEsa+BggWpHRuZaSYORJpR7jZBJHfsCCc?=
 =?us-ascii?Q?zK0uZ1DqZKwJlcwCQh3QiWEG27piwbpIBNQHBizSkqY0VOtLkXW2wsiPy2mQ?=
 =?us-ascii?Q?dpH9yL2dGX+MmK60V7i5kqr20yk2ajfee3V0kkUOqOi62oJGdV7XbzeuYn/A?=
 =?us-ascii?Q?Rs/PdxtP4aTzoN3ib4I1Qrc+Izfn9zgPijelzn55UVe2EUs+l9IhjNCyaAF4?=
 =?us-ascii?Q?SZi5xXNxcQQFGcDMtC+jn2OKLAUKGuRQmg/gPEpvdJuZxUg5/cNgLlMscJol?=
 =?us-ascii?Q?MexG1b1+QWZwpQT6TRGddFp4N8E1f7GKbcqNhbc0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cea46f-25e5-4710-1c07-08ddf44331b3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 10:32:39.1660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wZDpPEeZ0NA5fI5iaWs5JKvP0ubRTyMD4Dd2v7lTHy+9oEqu2PjOfiiHSlZk4qxRXnjkBIbdwhX+4T1Uoq4qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9304

On Mon, Sep 15, 2025 at 11:59:47AM +0300, Ivaylo Ivanov wrote:
>On 9/15/25 10:49, Peng Fan wrote:
>> On Sun, Sep 14, 2025 at 03:21:16PM +0300, Ivaylo Ivanov wrote:
>>> Introduce a clocks management driver for exynos8890, providing clocks
>>> for the peripherals of that SoC.
>>>
>>> As exynos8890 is the first SoC to have HWACG, it differs a bit from the
>> Hardware Auto Clock Gating(HWACG), if I understand correctly.
>>
>>> newer SoCs. Q-channel and Q-state bits are separate registers, unlike
>>> the CLK_CON_GAT_* ones that feature HWACG bits in the same register
>>> that controls manual gating. Hence, don't use the clk-exynos-arm64
>>> helper, but implement logic that enforces manual gating according to
>>> how HWACG is implemented here.
>>>
>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>> ---
>>> drivers/clk/samsung/Makefile         |    1 +
>>> drivers/clk/samsung/clk-exynos8890.c | 8695 ++++++++++++++++++++++++++
>>> 2 files changed, 8696 insertions(+)
>>> create mode 100644 drivers/clk/samsung/clk-exynos8890.c
>>>
>>> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
>>> index b77fe288e..982dc7c64 100644
>>> --- a/drivers/clk/samsung/Makefile
>>> +++ b/drivers/clk/samsung/Makefile
>>> @@ -22,6 +22,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
>>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7870.o
>>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7885.o
>>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
>>> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos8890.o
>>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos8895.o
>>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos990.o
>>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
>>> diff --git a/drivers/clk/samsung/clk-exynos8890.c b/drivers/clk/samsung/clk-exynos8890.c
>>> new file mode 100644
>>> index 000000000..670587bae
>>> --- /dev/null
>>> +++ b/drivers/clk/samsung/clk-exynos8890.c
>>> @@ -0,0 +1,8695 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (C) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>> + * Author: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>> + *
>>> + * Common Clock Framework support for Exynos8890 SoC.
>>> + */
>>> +
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +
>>> +#include <dt-bindings/clock/samsung,exynos8890-cmu.h>
>>> +
>>> +#include "clk.h"
>>> +
>>> +/* NOTE: Must be equal to the last clock ID increased by one */
>>> +#define TOP_NR_CLK	(CLK_GOUT_TOP_SCLK_PROMISE_DISP + 1)
>>> +#define PERIS_NR_CLK	(CLK_GOUT_PERIS_SCLK_PROMISE_PERIS + 1)
>>> +#define APOLLO_NR_CLK	(CLK_GOUT_APOLLO_SCLK_PROMISE_APOLLO + 1)
>>> +#define AUD_NR_CLK	(CLK_GOUT_AUD_SCLK_I2S_BCLK + 1)
>>> +#define BUS0_NR_CLK	(CLK_GOUT_BUS0_ACLK_TREX_P_BUS0 + 1)
>>> +#define BUS1_NR_CLK	(CLK_GOUT_BUS1_ACLK_TREX_P_BUS1 + 1)
>>> +#define CCORE_NR_CLK	(CLK_GOUT_CCORE_SCLK_PROMISE + 1)
>>> +#define DISP0_NR_CLK	(CLK_GOUT_DISP0_OSCCLK_DP_I_CLK_24M + 1)
>>> +#define DISP1_NR_CLK	(CLK_GOUT_DISP1_SCLK_PROMISE_DISP1 + 1)
>>> +#define FSYS0_NR_CLK	(CLK_GOUT_FSYS0_SCLK_USBHOST20_REF_CLK + 1)
>>> +#define FSYS1_NR_CLK	(CLK_GOUT_FSYS1_SCLK_PROMISE_FSYS1 + 1)
>>> +#define G3D_NR_CLK	(CLK_GOUT_G3D_SCLK_ASYNCAXI_G3D + 1)
>>> +#define MIF0_NR_CLK	(CLK_GOUT_MIF0_RCLK_DREX + 1)
>>> +#define MIF1_NR_CLK	(CLK_GOUT_MIF1_RCLK_DREX + 1)
>>> +#define MIF2_NR_CLK	(CLK_GOUT_MIF2_RCLK_DREX + 1)
>>> +#define MIF3_NR_CLK	(CLK_GOUT_MIF3_RCLK_DREX + 1)
>>> +#define MNGS_NR_CLK	(CLK_GOUT_MNGS_SCLK_PROMISE0_MNGS + 1)
>>> +#define PERIC0_NR_CLK	(CLK_GOUT_PERIC0_SCLK_PWM + 1)
>>> +#define PERIC1_NR_CLK	(CLK_GOUT_PERIC1_SCLK_UART5 + 1)
>>> +
>>> +/*
>>> + * As exynos8890 first introduced hwacg, cmu registers are mapped similarly
>>> + * to exynos7, with the exception of the new q-state and q-ch registers that
>>> + * can set the behavior of automatic gates.
>>> + */
>>> +
>>> +/* decoded magic number from downstream */
>>> +#define QCH_EN_MASK		BIT(0)
>>> +#define QCH_MASK		(GENMASK(19, 16) | BIT(12))
>>> +#define QCH_DIS			(QCH_MASK | FIELD_PREP(QCH_EN_MASK, 0))
>> Nit: align code.
>
>Aligned in my editor, patch files offset each line with a single symbol
>so formatting gets broken...

seems something broken in my mutt. Sorry for false alarm.

>> will not able to support GKI.
>>
>> It would be better to update to use platform drivers.
>
>Same as what Krzysztof said, design choice accross all samsung clock drivers.

Sure. No problem.

Regards
Peng
>
