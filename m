Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013007.outbound.protection.outlook.com [52.101.83.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ED52FB0B8;
	Mon, 15 Sep 2025 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757931577; cv=fail; b=Vqt67XfJOfcnxd9hZYh2A3TZLocm9XXh0VwAil+JsfWwOqEbe0rzTGXZThM8hLjQ7q3VzGMK+VfKchTbEzrt23vi07gPW2xMVuX+rvlxIpFz/s4rZw1fSy9kijHan35EPdVS7mEU3zd/gyNUQ4us3ZfscKmcQKCXwNhbE/yoSLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757931577; c=relaxed/simple;
	bh=H40MtT1cXovAmX/2THslYvyxnp0KsY8bNhRu0uPO+ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ioIaOuT+3fnfnZ1kEHWYciIclRV6t4VHBHouDS1n+N3VVWsDLXV1/BEVvZUMO7jBqlK7JULaWzEnoSyhC76Iy8cYcZu/SeKgbYQgLIUYafxT5ySjNHfO+dqfTNUBddXH7LnPAfgtsFORbm6JJLUOw1K9JlaJB2GaBP9Hv7oRZ8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fcpAZiMg; arc=fail smtp.client-ip=52.101.83.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fcpAZiMg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMGu/wrgXqenvahin7uWdcQHDMM8cZ1DKmsBKATXaWadZknZw2bK6PJsdQgGWCBWdydt5KDFd6joiQWTuGcAqELUbQxAqjGcA5tVebJrf8uV+cRjqr5ncxV+/DF45xJ4yu8RF7Lmbfbhlb9gZ1CPDiFuc3EPV+mzExtd5nFVUeotNmmVz+k/i3pl2qZRGSdl2b35bKG40lfNwANMVzAE1Vlpn2S3FaE/NAXXiGmaAY4V2u0zG8dH2z/XFfrrC6hQVL2OtoJUjaPs57aeLUAJJ7sAWjUik4OqcB3L0tT7ns8vEWxafX89XV2NxFuySD408jLQS0dd9HLd1Gg6kpLZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0usDUmgQpdsETD9VC8SbgR90AJHTw1sC3mSKmMzls4=;
 b=xoNVim33VD2eCDa1c5RwHXJwChMrC99Sfq2K3i+NmhCa8zh91V6xLQoP6rrxxj+OQikszRp7OLymcrZpMFT8+k+CvIAx9vVCk31jdxpDxZ8edi0ojOaimJZ7nW7jk0GWfktf62tBQ4BbOLTywRRSpTXIdhMu+hzP64mTPUwgFu6Yy9jBA3WbTguBRjO1C5NaggONRLIkYgFJh0WwGI+lpozNIakiivpOmH1FYjmUhUkVWxeyz3jH4XYVEWWqIuka627McUE5LccrkMPw5D6KptaoeEGP8iCXdyuIbC1/x4njVZB7MmZo5W1VttpUO0Taaw54LOxW63K15WuG+SgjNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0usDUmgQpdsETD9VC8SbgR90AJHTw1sC3mSKmMzls4=;
 b=fcpAZiMg/58LUVQWHzSg06r5FWpq7g9U6tD/K077aIBBwiTqiY3ywglsYqadFsqa8+/y+rqvjno/Gd3BnPnw4+Deg4Q8Q8ahC/pruP0szqGJb278q0f+ucDzFIzgdDU1u8p9NHWAA9u86ZdLDMpVcbDPFlq5EKWDv3fEdSMDHL0PsHbSDkCf3lyUiP3ZvH8cpNMZPoL85j4o3VHD8h3fc0D/duxd4MpUcRR07cjVzZN67BmAzStspS5qbD8IZqa/FovZ6OmFa4oLR1n4Bejw4De3usdkXoViNLuenKqxRMnV380zo+KnbbV+xCoIgU+hoLA3jQVveWL94iYDm7RFsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB11436.eurprd04.prod.outlook.com (2603:10a6:10:5d2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Mon, 15 Sep
 2025 10:19:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.010; Mon, 15 Sep 2025
 10:19:30 +0000
Date: Mon, 15 Sep 2025 19:30:55 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
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
Message-ID: <20250915113055.GA14420@nxa18884-linux.ap.freescale.net>
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914122116.2616801-6-ivo.ivanov.ivanov1@gmail.com>
 <20250915074931.GD8224@nxa18884-linux.ap.freescale.net>
 <83128929-4daa-4dac-8162-e773af675438@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83128929-4daa-4dac-8162-e773af675438@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA5PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB11436:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7512fd-628d-4ac9-ec6f-08ddf4415b18
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vc2iqGwsMNewaVZfR26pN23bpmgukQHA7wswUXIgT8ivJTyFTRRHAPf4OOko?=
 =?us-ascii?Q?leVCgd5FGkVXxyyQgGyx/UHfAx/KMIQEnb3o5R8DLE955Sjxb/Wtoqju2yYy?=
 =?us-ascii?Q?FfieYHpnqCwJ+/Bo0HuKtvvDa3u2gi1L5MOJukX0doEMgtrzssXRz6SErJcG?=
 =?us-ascii?Q?c8zio4PfsKnKcSKYR8LtvIXg8bC7CnMFvFqFnRNHt3LjA8Q8hZfKJ/Xttr00?=
 =?us-ascii?Q?nTGg9jkdy+BRKbfPMrCgPXwIUz7ROaM/XXlfwRlEKpyZqzSZxAPyyLqlafNZ?=
 =?us-ascii?Q?mlQ3M9B1P2L0PFzf64ON4HRz7FA7Lenh3GWarsZJbRyqIHOMSW+Y2ZPV/kNM?=
 =?us-ascii?Q?RCCD8/IYJgid30ms9848f75m9It/t9FWAHwI0mnJK+DTVhxJ0OBd65IW4Vyl?=
 =?us-ascii?Q?ytmmpQu/T+kFTcarSyIxXS4DcMkT62+L3Bp6hzENec3o3rYdzaWJ57PVDdj8?=
 =?us-ascii?Q?dvWcTdiUIx6ePFt3pN32zni8w+e3bvCctJIhTmjVP3lV/g4xgWo+JYJwl7Je?=
 =?us-ascii?Q?fKzRJHX1J9N6X5No9W0tSzVCHhNViYV3ztx3Kl23FjrLJb6IKqRJ92b0SQ+r?=
 =?us-ascii?Q?PHB+Rr3JQXxDANYXVdstnmlrrQqfylPj9KwxbWoKeyG6C+qFBeEOZaWCG4ll?=
 =?us-ascii?Q?2Vs0FJlq30LLt3bW73eE/lM4iMtG1GCYj3OQVZNWSihsSgoUZgejc5LLkIsy?=
 =?us-ascii?Q?SdJlpm0VjA33PmetZswc+JxifqFtCP850xHx+h3Lr7VuCPHhQY2KJyfkqIYd?=
 =?us-ascii?Q?FkbAcD8CwG/ob5ldzMEsM6NQ2q1DQgqK0bKs+QtyXD8igTB0QVdvE8nBdjJN?=
 =?us-ascii?Q?ngYjpayh9o3uL4FqPvl9gMkr7IgZhMY+Y4B6RIkEGCjt6Fz0AKn+DXp7p2me?=
 =?us-ascii?Q?gZmqSy9cRQF0PW/hk58Rta1xD1mEJc61yg9wbcuB/nXxgoHBmYqn/L1sCZBH?=
 =?us-ascii?Q?CdVSnKQtWHoMGuFLaTNubMqw4HziTJm98xj9tPslkoTQLkjMeYA0uwHFJonn?=
 =?us-ascii?Q?u2LFSBK6yqWABWQUTheMMK20U87zY0hzQHfva0XkmQYK9jWECrAI2igtPFKZ?=
 =?us-ascii?Q?2zBXeHLYlG5bHCUeRLRcBHMyFqAjb+24HTinuJ42b9bPkVd+MXlfHFKmWS+A?=
 =?us-ascii?Q?R0UCeFtuppr5k73AIS+kS9qGNjYfzWk2Qv3anfoiGfexsUDf2AHlctYPEOKt?=
 =?us-ascii?Q?BZPlSMos8OOuEuXFVInY4ORqLACC2jsDUFqPPzzTOKhMx1OgLqxQTGbzgtGg?=
 =?us-ascii?Q?bG3ssWv1T/bz1NIluytDWzyzUjlthQnhsNzZtLgk59VhfkCqiNfYe634v6+c?=
 =?us-ascii?Q?qQgp+y2KjqvIySXLBgssHOakfjt/u5lIIs39rlVHbvbKVGFzZUKigPPvmOcr?=
 =?us-ascii?Q?q1Xcs+EiwyyUbmW7yelBgmtY5xl3WFIi9sM0nAMBQb7wYwwdabquI1aKc24Q?=
 =?us-ascii?Q?5dZJn1/j7ZUjXDb+UIjrcVRmgnnmqOYQDLF6lCChCEZI8lh0/rcnAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wOeZVhwcY61kEuqPtDqmZosG34kshYB0p17HjdUPS85tg49SEzFzbGsJaEth?=
 =?us-ascii?Q?T+XXvZ8Y2GCDMvaWvmqW9KNsYOtoVxA4csswdU1q+n8o4M8YNEpLJ8C5gAej?=
 =?us-ascii?Q?/jR8LKeLP3dZLClhmqTdxc5zRBy7reJBMK0EWNwOHhQud6VAOaqmpB0n5QQO?=
 =?us-ascii?Q?yIaL6Vw8jCqf60WvfGqIbGNS5b48m1cC3Xvn39pV3AyKHvtRq9fzB/QmycsY?=
 =?us-ascii?Q?WSYxt8nyFf2WfTvNp3lzaDw8ddo0MxFvCUdhRp2PLvBAXdJCtTYCW98t6Yde?=
 =?us-ascii?Q?KeLJ10TsuA8sF3e9RBE5YzciHyZeVyqLMfC8QUem9bqtSutS3USwIzFcZFLn?=
 =?us-ascii?Q?uQf6V2wE0m4oFUfFaHwcxFi6scA+2UM5H6L5dpHTqfFd2Xj6FRzdejR/dATb?=
 =?us-ascii?Q?sprJNcDtem29vd88BKBPwmXHK3k2L6z5KYm6ge/hU9XbDkz6ZB/6cNY7rdW/?=
 =?us-ascii?Q?h/VbmiC675Xv4TwPwWBHZC/LJMUSieQ7pYKkFl4SoexMKHLmEpxHn4nrZ92D?=
 =?us-ascii?Q?g3V7HCNC8jq/yADtPzqoPTYhx6c4W3XO9O3za5+DvPLdIt5AofjfWUe/+K5L?=
 =?us-ascii?Q?+hXu7DpvBBl12DcMjKWqhXTBcZg6qm3+ny9AGrJ1xQfL6v0GAM20F3U2yI4q?=
 =?us-ascii?Q?CbHp6/MHyQHwT2jRQvH6kzm15iVCJQw/OEaNncnEROEFDSzE7/r9Cser8w/T?=
 =?us-ascii?Q?31re393a4MHkZ1+PEz4K5NH2LtRXZ0qi21GfbVz5wtIvZBJtaXb+kFFTwUn3?=
 =?us-ascii?Q?/zWV7rgysr2pBOuu1QrXGGiFDiWIgQkZuQC4JFQDdJDo4n8yHoE2Vvig9c3S?=
 =?us-ascii?Q?mr83I3DyfNAA/r4wWQBbw0ZegUM5ETbXjEopR2ZZ6Kk3gJBlUO+hIaCsmJvn?=
 =?us-ascii?Q?2A1l2HK6ZpgYo627p34K33SPn4HhpRnl9SUXSEfsshVldZJON/Xb1udCR29c?=
 =?us-ascii?Q?ND4hT8OW8c/MdRnmRB1NsJLkLFTVMD6kzGUc4yIirNQsKFu72wlLVkVMdunc?=
 =?us-ascii?Q?07zkB28fNtc7STPYpBLCkwnu7XPeiYn4u6zyVsKw/yzI5Y6fFDhPFpmDYBGW?=
 =?us-ascii?Q?gXQsFP55OCSVawPKwJUqx/AK9gY9lHeWETL4qcdj5HndznRNnFJFqPIfrNrl?=
 =?us-ascii?Q?iOOOug57QoibG+UpKcMbeqr27VcsQDXWpmPycsSff5lLYv0pUlHxxSXxtRU5?=
 =?us-ascii?Q?J+djeluu3OX2QtOlU0pMlpkFpYkxxH5UMHnW14ex0FKxJJ9X3n/ji1NA9/8K?=
 =?us-ascii?Q?Sd0iGnBSw4QOAUJUcIalI7aNR3jcveX9j9Vz4AwpXVcxQz0JgFffUEQeIBqo?=
 =?us-ascii?Q?7fprkrCz87/ioGjaJ5Rh5Rnoonnx9q29YxNAvzHVITaL9+8gEr3uv+brZsgu?=
 =?us-ascii?Q?n1XBFVEnfF268i5RdioUnOwaVClNuADNGht1NqV+zBEtLJQ4SSXctQTySweY?=
 =?us-ascii?Q?5nYiO7L7AtdM2pXjK8S4u2vJtLp/nApvbyJFONCxhieDaYwZwVvCOPp2OURX?=
 =?us-ascii?Q?PyM7LXhhYH2juI2XjgGDslXkx/l2wzUh+NQcBf9Qi+IsE2BoXvy7PicgOn2J?=
 =?us-ascii?Q?x85FVH8WuO1q8TQHtfApcP6mq3SuKoW8RXwNbtTt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7512fd-628d-4ac9-ec6f-08ddf4415b18
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 10:19:30.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FKNUG5SElSdJGwnhGdI79m0EMfBxOpcE646mNX2+dQo4bSmtfMA9a+Sky0hJMGrC0nzpFbxeo+GEzKMlAKS/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11436

On Mon, Sep 15, 2025 at 09:16:40AM +0200, Krzysztof Kozlowski wrote:
>On 15/09/2025 09:49, Peng Fan wrote:
>> [...]
>>> +static void __init exynos8890_cmu_top_init(struct device_node *np)
>>> +{
>>> +	exynos8890_init_clocks(np, &top_cmu_info);
>>> +	samsung_cmu_register_one(np, &top_cmu_info);
>>> +}
>>> +
>>> +/* Register CMU_TOP early, as it's a dependency for other early domains */
>>> +CLK_OF_DECLARE(exynos8890_cmu_top, "samsung,exynos8890-cmu-top",
>>> +	       exynos8890_cmu_top_init);
>> 
>> Not sure you need to run Android GKI, without module built, this platform
>> will not able to support GKI.
>
>Why would anyone worry about GKI? We develop mainline kernel, not
>Android kernel.

I understand this. But someone will have to update this to support module
built whether mainline or downstream tree, unless GKI is not in the plan.

>
>This seems to be aligned with existing approach, no? What is different here?

No objection from me. I just think supporting module built is a better method.

Regards,
Peng

>
>Best regards,
>Krzysztof
>
