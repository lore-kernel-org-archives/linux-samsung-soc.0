Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795577621;
	b=sUKladN3COs4VmjOVZTpVJnY36D05Q1QAg6pMIryF1nFu6IClXmbC/gXMdR32if4eByD
	 kCkl4HHGc9N0GZEDqpd7iy5z9lD0s/1MkvRz3spFRX64fdthpeX4z0HEWeZEr5kL12b6j
	 LP4uvJnKf8YYuBV/Omdw6+b5TVrpBrihlUsocm3cHuw6g/qtF0u+VRcc9KPT4HuuMP0cs
	 n61G6wWzPsqqWFn7sutRv2AzYGKv6v1rrNdxBYwFMQ8Hh7UadoSLIkhphj+17lbjB3gtB
	 cdFRx3L1A0lyfdqzmBYbkVj6Rsef9WIHQqwM801srQvxEF0FvxlIa+TS7PQvQFNczHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577621;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ptuC4hMhI0w5QKzAoAA6NtSUbJBDKDomDMRWXh6KJ7I=;
	b=k/P5PRTpftZzMjT1erxfnC2FXv9OXt5MJEZjZ9oCfyX+wBkiyeIdcrPyBB+atJrtb5dc
	 yvJ7u2aIgwp5x6OHhCI02Sc+uC+p6O/qniumXT35kiUjXedbplb+wwnf8Yu9enRL7wkIT
	 86bDeZ02R80LoIc05AvZvi10XV8qX9uT9qt02sxK2T5LrmnEfwyFxuJ7KrLK8t/RDKAa2
	 jgvIu+xnWiTF+iAFPjnQ1f7tqC+i82g14da1YZ7WCWzbulfo1rnetg5dc+bKsNENYeCBM
	 vojmhqmwfC7UscluX0f1KSBSeHw4mhYWrphxEDBIzCUZT6RxQeN1FjuC1LP3h9vsXqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="AzTa/8fQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.50
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC350606A31E;
	Wed, 25 Nov 2026 03:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC350606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AzTa/8fQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHii+b1bSRyIPCYNbuuhmBNBpJv1gNkILog+18IzuDfcn4CxJ4iUgqkkUh5Od51Rm/uybAPeUVc8r6dzl5nKZRoRIxxRejZ3sP5wpQeF7mDtFuM6yVcAkNJHgR1qPyAQLDwPhLoYfyzAeBhNpX+6FcIphgo4irB6X5S7TF9ZuxOqwqFAARsn5wTzsLwSmOPXZpfXZK46JRlmEDchAHNR4p14+NIU8q2PnKK6wFuRPUp/cHPp6mCS2RTXnJblGLunMviHAaYbYEHk/QmQ6pdpA3VTueblAuP6TZCTYyZgtTdjlAf2du0zkDWmUQrh+viaHIrqsoO0i1P1hoqDaR0Sdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptuC4hMhI0w5QKzAoAA6NtSUbJBDKDomDMRWXh6KJ7I=;
 b=U8FPjsc8h/KRwSl3KE0AojDJnSLYI1/D0pexVmHzWYh08QlHzHvxq+jdi07Uwk7EVCeMKV/tXPkbLQNuKpzdEXBkguk9mLCsWweeijdDpACGeBEHoYWf6YiZVcAe6veOgbm2p11ZudcW95yhLIuypCFPGPIMb+5QAcoOkUyVVgWIUy7ht6bmXTk1VRgFKKOBlEiK6DFuUR3Pd9VGyGpRRU0VCCkyiGDySCg/ZkCDqrGAJWZvDqAx2St/Xu62F0BGSM9ZXX0/os4wjrdOKA0FqbPccfL9u9Y8itISSfSV46E2slfGCkrjqTF7y+EcnfRlxY4NRsNFY41jgN1S657FUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptuC4hMhI0w5QKzAoAA6NtSUbJBDKDomDMRWXh6KJ7I=;
 b=AzTa/8fQ1Ezb07KN/nZ83uSaN6K8HcQ8RjMs+Cj16GId8B3+EYD7V3E6iX6zQKPztIh/Yeh0vtsE6V4XvMU7+f7SvzOHBw88A4d/crBsHl0QUDUpTjk15dYmKkCijC9hrt5QOw0PLOmEKf4KvbA7SVNV5sGQIIPq8oY/2QtIi0TmGBR2DOEhnGju4WZZ1iqVm5pQ/VpTTso85sxOdvMoMfJV9OQWLf9ER6pFbuZ6BCBYZDg1VnxRaDozVzZu1S4eq/0HCy6uOjGLDLpRRPAf9tADJFBU7ntWbdDkK4Sr8J0N7nEt3q54Dlz2Ybpw6TcsDsCKj2K1+id9oFLZu45ThQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PA4PR04MB9486.eurprd04.prod.outlook.com (2603:10a6:102:2a3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 03:33:36 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 03:33:36 +0000
Date: Wed, 25 Nov 2026 11:30:24 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Frank Li <Frank.Li@nxp.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Peter Griffin <peter.griffin@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Neal Gompa <neal@gompa.dev>, 
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
Message-ID: <btjhv5mgul7iim3fbf5pjl4zv4cjezq6sk5u3iq54yc7z4qgvt@6jphm2iqupl7>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
 <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PA4PR04MB9486:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f9399e-cb27-4c47-925a-08df4aa4e3ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|7416014|376014|261022105027099003|261026121527099003|10067099003|261026140227099003|261028144727099003|261021123027099003|261102123227099003|261021121427099003|261009223027099003|3023799007|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	f/hClE8vqcWv1BMg2r0BlwmS5JVSas4eQRmDY20NHxifvMHDujGYG1faxZrrVpdEnI22BeVp6w7wyOCVtAgC1nOfmWz/1yqr7pfnPZGdeFNHUnbhe7Ngb1FvL3+d+3kQx8LBvRkguYm4TnwRZXet/KFMPS7tlgRzcGVSxh8m9WuM6Qvas4poalJzygEaFagvqTD8EMp8b1fan843efjIweS/V+GMO0jcKP6nFiwCoNgfkpLZDBwtCo3DJdZra7UFs3v2QWUfrS1mndlubf0zGiids1T6v1vAqwHJ7pDNvYRxLfOHtj9Lx920+wwTrt3LMTGNkdEToM9amEuEP+tfi9iOag0JkzTR6TQknKQlOBG5BPxagL+365PPeDRgdpeyY/8ZsOIvathdgBAKESyaOSbxlDnY5CNY4QQw3grFy/1XvjT98IgC6CQAqQfZf9I2Vx9ldF6vb68Je22mWHgweNd+5yZm40tlBLZ3trR7F1bXo3DBjqqYGSc+0cpi/KTSbomaq9JagmnrMZ5cYybj1dGgehdGXq0ECbwbMfoYScNb61weVNdIiM7Oe9IhF21BDgNDwWU5DUn9CVbwXOKzkJc54unOBKN6PdwYLTlsk9B4p1Ti0LhicYzneV9VSiGDBLZj1YdCArID4AE6OeKUssy61b2PNNcbC9aR0+tWStE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(7416014)(376014)(261022105027099003)(261026121527099003)(10067099003)(261026140227099003)(261028144727099003)(261021123027099003)(261102123227099003)(261021121427099003)(261009223027099003)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RPb2V3ZQwcNUnQS+zpu8ffD2Pt9LyEokc0pRJOI4E1HTVXUmZ0+tatUDvtKB?=
 =?us-ascii?Q?yQJBCG5N+22G8HO5ORZMY7/7F2Q1PSsOo9pLKFvjVM8yHvH3XWKMV7akLM82?=
 =?us-ascii?Q?N28rr8HpvfCX6+ViLF3/L1JPYm9u4TYk+QpvtmbQHlr2TA2x4E+mIcSOv0j7?=
 =?us-ascii?Q?QHoEIgQJwmTBcVYU+G0w7aQEL7urSknVIM8zWWI+ZIATe1/jMZK3CVxr1C9+?=
 =?us-ascii?Q?AabqA3UmF62SV1LUxm637BwiASMpX8WIU7qspolcF41GDUG20bEk9wtA9LR1?=
 =?us-ascii?Q?frDuDtFEuck5+RZRLRAL2xI81R9t3bnVfXs7OEvOws30PQb7xUBb6UaLL9K5?=
 =?us-ascii?Q?85BPh+niB/mkHNN5wU3VOzx/fLD4gu+D+0l6Er0F0Cpx1pTWWqRLXcR2Veug?=
 =?us-ascii?Q?ZGcNjmXbuSAdR/NXbn48lf2gwl5F5Cq4LfOBvF2m5BYBv1nMO/iN8AjbPydr?=
 =?us-ascii?Q?LfxhFN19GKuDsXwIILtl9L4tx+1JgI2DtLMPKJHy5NO8GWNYOsjXJklaDtPq?=
 =?us-ascii?Q?6rwHyMFbPoI4w4qMhdBoY5VLwymiBNpwEunsviiw97OXh1Xzhf2MdW9DrUOf?=
 =?us-ascii?Q?DtAw/u1YzrVurp9CJZLNB69jYGfeq5JhlciPvUMQFLXIL8Uudm5l2yTwX572?=
 =?us-ascii?Q?wu948ftDpbg0rPluCZ/CCUf2y56n6oSnst+Cd7KGDYmfyEycvrbtLGxQy/FN?=
 =?us-ascii?Q?AUKMS6dPIzuLzzO3hSoE262SSAevO8d9Yww8QSnTJ6qPUhZSbsT3tOwZ8Zjc?=
 =?us-ascii?Q?KD/M0gnXlWDyMyiVKNfCSdRMik8C+rCvX8/4Qv3qIfVJIMKAKqP/yRDTv7mv?=
 =?us-ascii?Q?Z35L4yBUdvSnWLWIlWUGvEIfEVTLVJ+EPdbWu25IOMs9q5Wt9jBnHepLcje/?=
 =?us-ascii?Q?MC9kcGvIJuUHRMLB8YQqmgeA4nL54gGpJTbX2QWb1LXvBegL9bY0AXbibpHR?=
 =?us-ascii?Q?7DhN9j9ArwFBueIMMNYPGIFvNMDU7lYS6oXE3zQzJM1vDo2cc2ahawBP45uu?=
 =?us-ascii?Q?N+ui4e3M0fU6f72og1rQJ3Or5Hsor4Vnqq7crwonNQV67m55jYBNatcd171M?=
 =?us-ascii?Q?1HzmM6Mh3ugeome1MvEKBRynU8ODiYIKHjRphHO8OP8NrHulIIDOme4jOiz0?=
 =?us-ascii?Q?VLI/jc9hUeaj6wqcEXCBBYHs3Nfqaow0j3Rh51J5YO1c5FGLFiLr3HLXlNQ8?=
 =?us-ascii?Q?YYBTR4Y5YPLlopsIS4KNAktMx2Uv9x/KWGdKC9Mayg/ZcIko0/OSoQXBbJpN?=
 =?us-ascii?Q?AhTDHRkWWBW3CaeiS+dCfPZHz16Dg9e8VfQC8odgJXRG/U0TeLXE0/WMsZ43?=
 =?us-ascii?Q?U1rG/GN0oitXVPcU9wowDLem4IaLMVGKwKukBEppR02lwr2U4Mg5bxQYildP?=
 =?us-ascii?Q?1Q5VTeoy41/vJ15GiAJcEqMSU+Og30RQTK5/GHoUAyOLRiM3vac3oCYpch8L?=
 =?us-ascii?Q?0Qjs//nfWO8XBaILY3mCJhKh3m5s+feZkr1jerHAkku/38wwnzwgbyjsYVEE?=
 =?us-ascii?Q?TTirUeAvZmJmjPideWsvpdLj1zz27TmDxvo3rZIRPEy/MxJJT/amXOcRRYVo?=
 =?us-ascii?Q?jmRSfvGA/2jx+Go8ynjbBcDYt/oj7O4D9yuneAlWaIdtMn3rKUU3c0irbhXu?=
 =?us-ascii?Q?rlAy9LyZPdO2hrO1mTqtLk0oU1GsJkRck8K3kAcJKAPQUU2rVcoxpk93V0Vc?=
 =?us-ascii?Q?2oxzcBUcS1Q1WWgifkOq1nppSbTwQPgkjIxx9K4azaXZLwMSUkRjxoKHQBF0?=
 =?us-ascii?Q?sAGwsQnFgzMv2K0sbMhDzzvT578+6RdXCxV0OoD+Mi0zZ8rmVyOT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f9399e-cb27-4c47-925a-08df4aa4e3ad
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 03:33:36.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5BuOR+e5nkvIlCXoMdMUIOITgnpTUdnWhQROMW4fW44Xxms0aa1Wordr4uVfgiNXjgYbWZbO1Xc3Ul0/QJeY2XxW0lP6sNkXRZkTdgNsVSZNzH0AUeZZbURBGok+Xrt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9486

On Tue, Nov 24, 2026 at 10:59:31PM +0000, Thinh Nguyen wrote:
> struct dwc3_properties holds all glue-overridable properties, but glue
> drivers can only set needs_full_reinit and gsbuscfg0_reqinfo.
> 
> Replace the properties value in struct dwc3_probe_data with a
> fixup_properties() hook. The core calls it after reading the DT
> properties, so glue drivers can set properties that DT does not
> provide, or override DT values, including clearing them, to correct
> broken SoC settings. Convert imx and ls1028a to the hook.

Tested-by: Xu Yang <xu.yang_2@nxp.com> # dwc3-imx.c

Thanks,
Xu Yang

> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/dwc3/core.c              | 18 +++++-------------
>  drivers/usb/dwc3/dwc3-apple.c        |  1 -
>  drivers/usb/dwc3/dwc3-generic-plat.c | 19 +++++++++++--------
>  drivers/usb/dwc3/dwc3-google.c       |  1 -
>  drivers/usb/dwc3/dwc3-imx.c          |  9 +++++++--
>  drivers/usb/dwc3/dwc3-qcom.c         |  1 -
>  drivers/usb/dwc3/glue.h              | 10 ++++------
>  7 files changed, 27 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 3b2b5fcc627a..369c9ce9f1dc 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1684,24 +1684,14 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
>  	dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE, true);
>  }
>  
> -static void dwc3_get_software_properties(struct dwc3 *dwc,
> -					 const struct dwc3_properties *properties)
> +static void dwc3_get_software_properties(struct dwc3 *dwc)
>  {
>  	struct device *tmpdev;
>  	u16 gsbuscfg0_reqinfo;
>  	int ret;
>  
> -	if (properties->needs_full_reinit)
> -		dwc->needs_full_reinit = true;
> -
>  	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
>  
> -	if (properties->gsbuscfg0_reqinfo !=
> -	    DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED) {
> -		dwc->gsbuscfg0_reqinfo = properties->gsbuscfg0_reqinfo;
> -		return;
> -	}
> -
>  	/*
>  	 * Iterate over all parent nodes for finding swnode properties
>  	 * and non-DT (non-ABI) properties.
> @@ -2310,7 +2300,10 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>  	dwc->regs_size	= resource_size(&dwc_res);
>  
>  	dwc3_get_properties(dwc);
> -	dwc3_get_software_properties(dwc, &data->properties);
> +	dwc3_get_software_properties(dwc);
> +
> +	if (data->fixup_properties)
> +		data->fixup_properties(dwc, &dwc->properties);
>  
>  	if (dwc->sysdev_is_parent)
>  		dwc->sysdev = dwc->dev->parent;
> @@ -2470,7 +2463,6 @@ static int dwc3_probe(struct platform_device *pdev)
>  
>  	probe_data.dwc = dwc;
>  	probe_data.res = res;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>  
>  	return dwc3_core_probe(&probe_data);
>  }
> diff --git a/drivers/usb/dwc3/dwc3-apple.c b/drivers/usb/dwc3/dwc3-apple.c
> index 1f474a8bc59e..8289d22e5994 100644
> --- a/drivers/usb/dwc3/dwc3-apple.c
> +++ b/drivers/usb/dwc3/dwc3-apple.c
> @@ -181,7 +181,6 @@ static int dwc3_apple_core_probe(struct dwc3_apple *appledwc)
>  	probe_data.res = appledwc->mmio_resource;
>  	probe_data.ignore_clocks_and_resets = true;
>  	probe_data.skip_core_init_mode = true;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>  
>  	ret = dwc3_core_probe(&probe_data);
>  	if (ret)
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index 3e90ddf25809..69a6acd84a0f 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -33,7 +33,8 @@ struct dwc3_generic {
>  
>  struct dwc3_generic_config {
>  	int (*init)(struct dwc3_generic *dwc3g);
> -	struct dwc3_properties properties;
> +	void (*fixup_properties)(struct dwc3 *dwc,
> +				 struct dwc3_properties *props);
>  };
>  
>  #define to_dwc3_generic(d) container_of((d), struct dwc3_generic, dwc)
> @@ -137,12 +138,10 @@ static int dwc3_generic_probe(struct platform_device *pdev)
>  	probe_data.ignore_clocks_and_resets = true;
>  
>  	plat_config = of_device_get_match_data(dev);
> -	if (!plat_config) {
> -		probe_data.properties = DWC3_DEFAULT_PROPERTIES;
> +	if (!plat_config)
>  		goto core_probe;
> -	}
>  
> -	probe_data.properties = plat_config->properties;
> +	probe_data.fixup_properties = plat_config->fixup_properties;
>  	if (plat_config->init) {
>  		ret = plat_config->init(dwc3g);
>  		if (ret)
> @@ -220,16 +219,20 @@ static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
>  
>  static const struct dwc3_generic_config spacemit_k1_dwc3 = {
>  	.init = dwc3_spacemit_k1_init,
> -	.properties = DWC3_DEFAULT_PROPERTIES,
>  };
>  
> +static void dwc3_ls1028a_fixup_properties(struct dwc3 *dwc,
> +					  struct dwc3_properties *props)
> +{
> +	props->gsbuscfg0_reqinfo = 0x2222;
> +}
> +
>  static const struct dwc3_generic_config fsl_ls1028_dwc3 = {
> -	.properties.gsbuscfg0_reqinfo = 0x2222,
> +	.fixup_properties = dwc3_ls1028a_fixup_properties,
>  };
>  
>  static const struct dwc3_generic_config eic7700_dwc3 =  {
>  	.init = dwc3_eic7700_init,
> -	.properties = DWC3_DEFAULT_PROPERTIES,
>  };
>  
>  static const struct of_device_id dwc3_generic_of_match[] = {
> diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
> index 67eda7f0d528..213c03048aa0 100644
> --- a/drivers/usb/dwc3/dwc3-google.c
> +++ b/drivers/usb/dwc3/dwc3-google.c
> @@ -440,7 +440,6 @@ static int dwc3_google_probe(struct platform_device *pdev)
>  	probe_data.dwc = &google->dwc;
>  	probe_data.res = res;
>  	probe_data.ignore_clocks_and_resets = true;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>  	ret = dwc3_core_probe(&probe_data);
>  	if (ret)  {
>  		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
> index 64da121a8f76..396d76311120 100644
> --- a/drivers/usb/dwc3/dwc3-imx.c
> +++ b/drivers/usb/dwc3/dwc3-imx.c
> @@ -192,6 +192,12 @@ static const struct software_node dwc3_imx_swnode = {
>  	.properties = dwc3_imx_properties,
>  };
>  
> +static void dwc3_imx_fixup_properties(struct dwc3 *dwc,
> +				      struct dwc3_properties *props)
> +{
> +	props->needs_full_reinit = true;
> +}
> +
>  static int dwc3_imx_probe(struct platform_device *pdev)
>  {
>  	struct device		*dev = &pdev->dev;
> @@ -265,8 +271,7 @@ static int dwc3_imx_probe(struct platform_device *pdev)
>  
>  	probe_data.res = res;
>  	probe_data.dwc = dwc;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
> -	probe_data.properties.needs_full_reinit = true;
> +	probe_data.fixup_properties = dwc3_imx_fixup_properties;
>  
>  	ret = dwc3_core_probe(&probe_data);
>  	if (ret) {
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 5a68025ccea5..ef38308023aa 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -745,7 +745,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	probe_data.dwc = &qcom->dwc;
>  	probe_data.res = &res;
>  	probe_data.ignore_clocks_and_resets = true;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>  	ret = dwc3_core_probe(&probe_data);
>  	if (ret)  {
>  		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> index b7ce196e84ea..e56fee68e4bc 100644
> --- a/drivers/usb/dwc3/glue.h
> +++ b/drivers/usb/dwc3/glue.h
> @@ -9,10 +9,6 @@
>  #include <linux/types.h>
>  #include "core.h"
>  
> -#define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
> -	.gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED,	\
> -	})
> -
>  /**
>   * dwc3_probe_data: Initialization parameters passed to dwc3_core_probe()
>   * @dwc: Reference to dwc3 context structure
> @@ -21,14 +17,16 @@
>   *		be ignored by the DWC3 core, as they are managed by the glue
>   * @skip_core_init_mode: Skip the final initialization of the target mode, as
>   *		it must be managed by the glue
> - * @properties: dwc3 software manage properties
> + * @fixup_properties: optional hook to set or override properties after
> + *		the core reads them from DT
>   */
>  struct dwc3_probe_data {
>  	struct dwc3 *dwc;
>  	struct resource *res;
>  	bool ignore_clocks_and_resets;
>  	bool skip_core_init_mode;
> -	struct dwc3_properties properties;
> +	void (*fixup_properties)(struct dwc3 *dwc,
> +				 struct dwc3_properties *props);
>  };
>  
>  /**
> -- 
> 2.53.0
