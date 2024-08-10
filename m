Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BD0142E77;
	Sat, 10 Aug 2024 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723283022; cv=fail; b=EGLAAZGLw7ZZCp5jAp0H/7M4FbXdxvsYDVz4xJJnHZdgjujeEr5CpqjeySaql4kwsHhWFY+WTwPJj1tYf5Z7hdjEn2sTDj5VlQN4xUGW9lwP1ubNLorLLvofXFZar9CF/83mMnL8VtfIZ01ZZNrWPIIFdNb2p02lYTu3+SXZpCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723283022; c=relaxed/simple;
	bh=44Q4vNyBUoINYwIeEKHqUsN/9GKR9Qw9djVGurjZK2E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aAcYQUvhvAIk2cWS9SXZrYWMmB9/FEHPe9+VbVyewmdId64ec03ATZ4a8kCAe/8+KsVrQjAKW/kTsVju+TxYS+p0GVTmU+RvOmqicOkqnzBYajOxh9MVP99VjKqSiSVQuPVyqKrXrfymeO1uXOKKpP9Y38BiBd02rANP/pezMG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BdZ7DDDo; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BdZ7DDDo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xU4WEiDelZFhqgB5EPHfDjjR1bE7IaYLFcTT3sFRpb5+E3eNPIoVh/8oZWKWYzZTYGNx18G2Huw60/wBqDCvSZ7wrmuZ4kac5JP1Ho7CcAdU0g9Gvi2aszkOfz4PzyAL/Ahd8WjIXhKLRJi2x3m6ilTZSK03L4Pkmrrz9DinIgbWgq90+RAzNUGRpa5qIrJ0GL3nCsUwc5VPzqcCT7zGEqAUfFJJrawoUK4AKzFSAFGzhpIyWsnQ0eKShaXHvId6RceCyvxqIFRqtHS41axdI9+20OprApWCiQXq6ltyaGKf7Hmbw323IN8qmJRpsC+L/RTn154Zw8I3pvpDXOge9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44Q4vNyBUoINYwIeEKHqUsN/9GKR9Qw9djVGurjZK2E=;
 b=B+WEN4kjEJepQ5Tkdrbv9owkuQFkG9MkV8q3K7h+DmcGgPBOri6jbu0KhFCeSZ1jHGkLrWUwro3INZEIOqe674EXixgldC2RzmM+sZqxvyklKbBWdG1IUtdWqF3OLe39MUWxN6ewdcevkw8epwFHBbA9SIHRlX8QbpRRwuTpJHE1ob6CB5dl5prKnZuUaN6UZHPXpuUk53KYbktWOQc2xvHqfk+8HPMLaYLgFcqkc1a29sq7D9K7uFEuKWqH7n0/BuGQ8RwM+qzoB4qCoUUvSGmBnzdlyqiUbBkSBmxTN3UNu3NaGyKKaOz5ePwl7dvvPRkP+V0GDoRwv8H6jAm1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44Q4vNyBUoINYwIeEKHqUsN/9GKR9Qw9djVGurjZK2E=;
 b=BdZ7DDDoUzzNK9h2zqNyGGED6eP/svLjFzo6Gm+gA2gbISAihBKJ/w6SJf4miVXnCUEUL5XqOUyTyQAYjuVVnZIQzSiYeNBl3F6HJCApjhqzzASc6c6SWS+ozd5oW5niLHOMRx+mtl03kVIU+Scx0BtlRu21cPa4wyfuy1u27W0wiGHRlsefdRF5GWGzHnVNvZ+GYon+WOYKh14jY884EuT58cZx/1c1LWgZ697RyE2TqrsZvfc1/4ROdQyH3NqKE1KTYbPcm/hFGh8aOUKRgDTOU708wyJXTuqQB+T+J7UAOmRGLbxHdh/N72U0QeReu3X8RSvkZmAA5XzY5JgDSA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17; Sat, 10 Aug
 2024 09:43:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 09:43:34 +0000
From: Peng Fan <peng.fan@nxp.com>
To: =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
	<semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Abel
 Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: Will McVicker <willmcvicker@google.com>, "kernel-team@android.com"
	<kernel-team@android.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v6 01/20] clk: bump stdout clock usage for earlycon
Thread-Topic: [PATCH v6 01/20] clk: bump stdout clock usage for earlycon
Thread-Index: AQHa6aE+ihq9zzVGLUK5uxX3bJggI7IegxvwgAAfVoCAAAFWAIABm3sQ
Date: Sat, 10 Aug 2024 09:43:34 +0000
Message-ID:
 <PAXPR04MB84599EC96EF51C588DCCD5F588BB2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
	 <20240808-gs101-non-essential-clocks-2-v6-1-e91c537acedc@linaro.org>
	 <PAXPR04MB8459F99475C289A827987AF588BA2@PAXPR04MB8459.eurprd04.prod.outlook.com>
	 <d4580b33c195dcf1c3a0054b29555383d2e1606b.camel@linaro.org>
 <d9e2f63519f3fcbf4fe334975691d573e20c53c8.camel@linaro.org>
In-Reply-To: <d9e2f63519f3fcbf4fe334975691d573e20c53c8.camel@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU2PR04MB8616:EE_
x-ms-office365-filtering-correlation-id: d82bf1e0-0646-481b-8a3c-08dcb920e73a
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V3FCU2I1K0dnNWRYZFpNZ01lMzNhYU84U2JORHFrZXo4VHlpU29oeHFJYTlj?=
 =?utf-8?B?bGdRdi9OblJMWFI0QWUzRE4wZHNrb0IwNGZPSzVLV29UY2hqUis5YXIvUHNv?=
 =?utf-8?B?WjllbmxJbzE0b0IyOVVub28vaGV1amdWTGZWZHVEMTZwc2dlR2R1MmFJL0Qx?=
 =?utf-8?B?RmNUdXd0OElhOERONjA1b2xuVzZBaVRRRXlDRitkeGNCRENPSk5JLzdUNkRp?=
 =?utf-8?B?OEU0K3JyWExvam9WMkZES1ArZUUzY1BvNE53WGZBYWxoUUJNUGd6T2t0bjdx?=
 =?utf-8?B?S0RKdERlWDNtOWdUK1FkTStNK2tUeUVHVWVFcDlCTG5nL0RVekFRajZ0UHZY?=
 =?utf-8?B?cmFZOUQ0N05lZ2p3a2tSbFNtZnNpNTZxMk9MS0dRWXpIZHp6TGl2Lzd0MjZN?=
 =?utf-8?B?dDgvcE9ORlBRWVh3QmswK2hCU1E2TlBveXFZSWRFQVhiakMxT0Z5ZXcrNTRQ?=
 =?utf-8?B?NS9YaUxuYVQvdEVQckhLS3crSjZYckhOR1JhTUJDaXNpcmM3VFNrcXQ4aUdL?=
 =?utf-8?B?aEFIVVhDbzBLVDZySHdGazhiQXIxQUhQS1lHODczNk1Na1dOZ3h0blVvZmFY?=
 =?utf-8?B?WkYwbldnWlRIaGJYNFdycC94S1lEczhUSlQrc0lxam9uZUQxQnRQdDcwOVg4?=
 =?utf-8?B?Mk04azMxUi9KNld5ZmM1OUFISm5RczEvUTM2azZrcktoTG0xSkplWXJrcGd6?=
 =?utf-8?B?eHU4TERteHgvUE5qU0RYVDVPTVhjT0pZbGl6c1NCZkZERWllS29OeHNXSGtZ?=
 =?utf-8?B?T3ZVOEk0R2NGY2UwY0swWmtKVE9naGs5OGNnMUh5cTZ6bzRlQjBTN0V4c3hE?=
 =?utf-8?B?OGw1UGJlRWtDTkJUc1lLbDdmWk1Lc0pMcmVBRkUwcTAvdWc0WW5NSzZPWnJQ?=
 =?utf-8?B?NjhsNWhqWHpORXh2YkM1VEpraEhQS3BEUXBqWHJUVHdzL1hyL3hQbGR6Nks2?=
 =?utf-8?B?em11ZjYyODR6eE41dURybTBFWndlNmRBcU9WNnVFYmh0MzNHWDJZamlSZUw3?=
 =?utf-8?B?TzhnSWNZdkdXL3ZnQjFackxxRldyYURsVTVtSElEUnNySTNFUkkxSzM2Q3NT?=
 =?utf-8?B?YmtOdGJzL1JqejI5WVI4dngrdGw0QkVOaWV6NFMyS1MvdWNaRWpGbkJFZWlh?=
 =?utf-8?B?YWpnd0RwMC9Ld0xDZ0xtQWV2RmpRd00rMk5RREdHazlQZEJJbU10WllFMlVx?=
 =?utf-8?B?NWx1V2gxZzFCYWg0MXN6T1hzWWNxdUhnTjM1Q3lwZHY4U2kwLzNKdFRVQTZJ?=
 =?utf-8?B?aWdHcm03b2ZvNGhKMlBKdXg1RnVhb09TcTV4bitZam5ORG9xODQzay9nVnp2?=
 =?utf-8?B?S2g4VEh6eDVac1kzbkF0Y1JMWmhUbVdqWHlJZTR1UmlqOUxXc2s3dFB3WGQ2?=
 =?utf-8?B?TVZsc1dlek00YmkzVVFoSFZuTFV1ck9qR09JN1pwbk15TlMvazFTUkQ3MnpM?=
 =?utf-8?B?aVE1cVdDQitvZEY3L3ZxeE5meU41SEgyUW0xYVdNNStwckFaQmtnc3ZNdHZz?=
 =?utf-8?B?VDVDMlpvWHJHTmJuUjhnKy9LU2szNmZ6TVdXL2M4KzBrU3IzTUNadm1reDVN?=
 =?utf-8?B?YWV3RGVCYkYrWkdtbGxvd0g2RU9YUENEVFUvZjJhL21VRGFwbldoS3J0Y2JG?=
 =?utf-8?B?aU9ESmZSVEFRcGhzZGFvQ0FIRXZkY3ZrSlhaOUc0dXNSckFJS0lhbnlqTVpi?=
 =?utf-8?B?U2h5K1hHMFdCNzNBVlZQOGUrNktMSDNDOGVEZEhhaG9VOGZPT1grVC9kV1Zz?=
 =?utf-8?B?WWUwbmxRZGdPUStzdWdHVzUzWTFkMjluUGh2azZUUlJWVjRFM1lDNUpjQkVE?=
 =?utf-8?B?SU9jTy9aeG5NdUxwTEY4RGIxSHp6bklJN3BERUdzVXdkUmZlY1BjRGVhNTho?=
 =?utf-8?B?Nmxic2RzVCt1eG5WR3RyeXVPc0J4OGd2WHU0N0FPUC9za1VPcFZzYUFkODkz?=
 =?utf-8?Q?2h6YoPUVCpI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rjl5MURGV1IrR2RIdEJmSG9QR2IwaVNpbVVmdlZxVGFGMlBpRkFkZGt5UTVm?=
 =?utf-8?B?Um43VU9nY3JaMnNjRzd4OWtRT3NNOFZiZTQzQ05qMkZ0bFFLMXl6c1NLT0FW?=
 =?utf-8?B?RkwzcEh1UzBxMGx1cGlCMnl2cWVRR1Jhc0RkSGxlUTFxWXJBNGtOcXVXNjVP?=
 =?utf-8?B?cjZRaE96dFBjK1AwczNZR1M3WDd3WkRBb3c1MTBBdjhKVmdYS0xzL05XZ1d4?=
 =?utf-8?B?ZVo5cjBqZDQ5U2syTU1uUU8xZXQ1Z2xQSmtjbGlpMGpZa2g0TjI4eHN6NXJa?=
 =?utf-8?B?QzlvV3YxUEI5SFo2R2JublRtbm5FWHpwRWR2Vll2dzc0eXh3bVg2a0E4cHho?=
 =?utf-8?B?VFpYWkU0cStvMlArN0dUeWZrNFZLM1Iva3FyVTBFSkt3a1J2eE5zaEo2NDVz?=
 =?utf-8?B?T2xYaHJVN0ZSNWhtNElWWDJvTjlleENTamR0U0IyZ3Y2cFRrbU5JbGROQWIy?=
 =?utf-8?B?RjZKcG81OWt0ZXE0UGlTZGhUMlEyb1BQYitqdXBvcXpseDFiNG9QSG9ZaENH?=
 =?utf-8?B?OWYzcjNLYzhWWDZvVUZTMXRUZ3F2RWg3empjMUMvRmdwVjM5SWx4RHN2ZFBl?=
 =?utf-8?B?L1JHZDV4SWkyYy9EeTE0UWVUakZsdzNYYU5XQ3hIQ0UxbkRpSWorZmozMkN6?=
 =?utf-8?B?c3pNeUx5OUdlU1IzNG5tVjl4VHNvejZubzF2VWhqMlRQTkhSU3ZiajhuZWJa?=
 =?utf-8?B?V1JrTTJzaWlsRDB3SWhrUE50MHJmZTFBcTlyQlRpWG9KVGNqVEdiYTRock9H?=
 =?utf-8?B?c2FhaXEzNm5WL2E0R1c0enpZQ1R6VURXVkcxOWs3V2R5VTZESkxIYkpPSWk0?=
 =?utf-8?B?R3phRlBzOUpqNTFBN1ZzbFV6S3NvaDBXRjVONnBGR2E1am1vZE1FZHVENXho?=
 =?utf-8?B?SG0rZDB6dGdMUTFkOE1aQWs1QVRiQlcwK21DVjdWQXdYLzZqMFBOZDdyclNh?=
 =?utf-8?B?SE0yZGQ3L0JONGR6L1NJYjBoRXEvak5xZGl1bmtZNVUyNFY3QkNoUHlBVGZK?=
 =?utf-8?B?a290RjRKNG5RWHZISTk5UHBLTjZtUEVFTm5kd3FQYUZIZlVXQ1V3YUlHUVls?=
 =?utf-8?B?T2RmZzhhclNOVmpsRWh5Qk5yQm1tekxKQlY4eXU3bUJQOHBGOUlwL1ViaXl1?=
 =?utf-8?B?MHkzbXlkWEt4MWRRa2k3K3hYaGVjL0Nmd3JIQXFvdmlqd3NRRzAvTEcxbUIw?=
 =?utf-8?B?RVR4QStpdGxlMkl4VTYvQ0tScGR5NHNQMDc2NWg4WjhFNlhyTlhHZkJnWWkv?=
 =?utf-8?B?bW1wVzNjWEZOUERyWkwyS2p4NjZMYlEvbXMwMXNXVUU2ZTk5RmFnbklxZzV3?=
 =?utf-8?B?YXJSOElpa2RKMVR5dlJleXNLN3hOSHRWZXhLYWVScnoxZVZ0Q3hDVGtUd3lN?=
 =?utf-8?B?dU1KTkJxcTM3SC9tRkViS1o0Z3F3bVdNWDVoMTNYVVIrbGpkSm9NVm1zdVpI?=
 =?utf-8?B?Vnk0T01yNDlkelVYNmdzakdGQmJTUDIwQm5qczYvU1Foclg4UUFiTkNLTTVS?=
 =?utf-8?B?VUVGMEpZMnhPbCtjUUVVeE4wUE9vcWtselBIWTN5MFo4Vkd4dG43R0hvU0Zm?=
 =?utf-8?B?enpSWVM3RXFFL0JlL2QrdzYxQVA0NzRYQWxxaTh0WElWZU5wczBnaGxMUWNj?=
 =?utf-8?B?OVNDNFhtWUZtNWx4ZVUzSGtnUXlaa2hzS25IbGI2WmQwYkVzOHpBVzN1RStk?=
 =?utf-8?B?YWhITjlOOGYxVVBLTnRvNG8wUXdLWmgya016aHRFaEZpanJ6c2hNbzJYSDNR?=
 =?utf-8?B?SDY1Sit5aEZXM0gyTlNuSWJyeGJwT2ZZbWtHeGtSN2FTZ1NxaG9MNUFJQnZS?=
 =?utf-8?B?RTArTW5pY0s3K2plRmRxRGFYRHFoUGl3M1diNkE2UjdmK0pOSGtLeVZXRFFz?=
 =?utf-8?B?U3lsbEhzeEtQVHY5VlEvcnBGeFduMHJOdzhzMXVBRVBmZFllVDhTdjVsZkVu?=
 =?utf-8?B?bkxwNGhhTk1jS1BlNXgyRi82Q21MMDRUY3h2SGNCamZOV1FxTzg1VFVwOTRU?=
 =?utf-8?B?OWl2YnhYSk9Xa3dZTndQZzFOZWh6UnNvS1VHQ2NNbkYrOFo0d2lFOUZYeU1u?=
 =?utf-8?B?UkZIMmdCL3NFYndxVDBlSlFiTW5uc1NKczU0N0d4bzhpOEsrUWppTWl6OGVz?=
 =?utf-8?Q?HdXk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82bf1e0-0646-481b-8a3c-08dcb920e73a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 09:43:34.8741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lMii43RSci4w5sLfkuB3gqbFCKppSYc6hVUu6DC0jKps2V4Z7AxhdOD34YaaaekhbPClKh5AAsYlAcZpKsQMZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8616

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAxLzIwXSBjbGs6IGJ1bXAgc3Rkb3V0IGNsb2NrIHVz
YWdlIGZvcg0KPiBlYXJseWNvbg0KPiANCj4gT24gRnJpLCAyMDI0LTA4LTA5IGF0IDEwOjAyICsw
MTAwLCBBbmRyw6kgRHJhc3ppayB3cm90ZToNCj4gPiBIaSBQZW5nLA0KPiA+DQo+ID4gT24gRnJp
LCAyMDI0LTA4LTA5IGF0IDA3OjE2ICswMDAwLCBQZW5nIEZhbiB3cm90ZToNCj4gPiA+ID4gK3N0
YXRpYyBpbnQgX19pbml0IG9mX2Nsa19kcm9wX3N0ZG91dF9jbG9ja3Modm9pZCkgew0KPiA+ID4g
PiArCWZvciAoc2l6ZV90IGkgPSAwOyBpIDwgb2ZfY2xrX3N0ZG91dF9jbGtzLm5fY2xrczsgKytp
KSB7DQo+ID4gPiA+ICsJCWNsa19kaXNhYmxlX3VucHJlcGFyZShvZl9jbGtfc3Rkb3V0X2Nsa3Mu
Y2xrc1tpXSk7DQo+ID4gPiA+ICsJCWNsa19wdXQob2ZfY2xrX3N0ZG91dF9jbGtzLmNsa3NbaV0p
Ow0KPiA+ID4gPiArCX0NCj4gPiA+ID4gKw0KPiA+ID4gPiArCWtmcmVlKG9mX2Nsa19zdGRvdXRf
Y2xrcy5jbGtzKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCS8qDQo+ID4gPiA+ICsJICogRG8gbm90
IHRyeSB0byBhY3F1aXJlIHN0ZG91dCBjbG9ja3MgYWZ0ZXIgbGF0ZSBpbml0Y2FsbHMsIGUuZy4N
Cj4gPiA+ID4gKwkgKiBkdXJpbmcgZnVydGhlciBtb2R1bGUgbG9hZGluZywgYXMgd2UgdGhlbiB3
b3VsZG4ndCBoYXZlIGENCj4gPiA+ID4gd2F5IHRvDQo+ID4gPiA+ICsJICogZHJvcCB0aGUgcmVm
ZXJlbmNlcyAoYW5kIGFzc29jaWF0ZWQgYWxsb2NhdGlvbnMpIGV2ZXIgYWdhaW4uDQo+ID4gPiA+
ICsJICovDQo+ID4gPiA+ICsJb2ZfY2xrX3N0ZG91dF9jbGtzLmJ1bXBfcmVmcyA9IGZhbHNlOw0K
PiA+ID4gPiArDQo+ID4gPiA+ICsJcmV0dXJuIDA7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICtsYXRl
X2luaXRjYWxsX3N5bmMob2ZfY2xrX2Ryb3Bfc3Rkb3V0X2Nsb2Nrcyk7DQo+ID4gPg0KPiA+ID4g
SWYgdGhlIHVhcnQgZHJpdmVyIGlzIGJ1aWx0IGFzIG1vZHVsZSwgdGhpcyBtaWdodCBicmVhayBl
YXJseWNvbi4NCj4gPiA+IEJlZm9yZSB1YXJ0IGRyaXZlciBsb2FkZWQsIGNsayBkaXNhYmxlZCBw
ZXIgbXkgdW5kZXJzdGFuZGluZy4NCj4gPg0KPiA+IFlvdSdyZSByaWdodC4NCj4gPg0KPiA+IFdp
dGggdGhpcyBpbiBtaW5kLCBJJ20gbm90IHN1cmUgdGhlbiBpZiBhIGdlbmVyaWMgc29sdXRpb24g
aXMgcG9zc2libGUuLi4NCj4gPg0KPiA+IEkgZ3Vlc3MgaXQgaGFzIHRvIGJlIGR1cGxpY2F0ZWQg
aW50byB0aGUgcGxhdGZvcm1zIGFmdGVyIGFsbCBhbmQNCj4gPiBwbGF0Zm9ybXMgY2FuIGVuYWJs
ZSB0aGlzIGlmIHRoZXkgb3B0IHRvIGRpc2FsbG93IHVhcnQgYXMgbW9kdWxlPw0KPiA+DQo+ID4g
QW55IG90aGVyIHN1Z2dlc3Rpb25zPw0KPiA+DQo+ID4gPiA+ICsNCj4gPiA+ID4gwqAvKioNCj4g
PiA+ID4gwqAgKiBzdHJ1Y3Qgb2ZfY2xrX3Byb3ZpZGVyIC0gQ2xvY2sgcHJvdmlkZXIgcmVnaXN0
cmF0aW9uIHN0cnVjdHVyZQ0KPiA+ID4gPiDCoCAqIEBsaW5rOiBFbnRyeSBpbiBnbG9iYWwgbGlz
dCBvZiBjbG9jayBwcm92aWRlcnMgQEAgLTUwMzEsNg0KPiA+ID4gPiArNTE1Niw4IEBAIGludCBv
Zl9jbGtfYWRkX3Byb3ZpZGVyKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsDQo+ID4gPiA+DQo+ID4g
PiA+IMKgCWZ3bm9kZV9kZXZfaW5pdGlhbGl6ZWQoJm5wLT5md25vZGUsIHRydWUpOw0KPiA+ID4g
Pg0KPiA+ID4gPiArCW9mX2Nsa19idW1wX3N0ZG91dF9jbG9ja3MoKTsNCj4gPiA+ID4gKw0KPiA+
ID4gPiDCoAlyZXR1cm4gcmV0Ow0KPiA+ID4gPiDCoH0NCj4gPiA+ID4gwqBFWFBPUlRfU1lNQk9M
X0dQTChvZl9jbGtfYWRkX3Byb3ZpZGVyKTsNCj4gPiA+ID4gQEAgLTUwNzMsNiArNTIwMCw4IEBA
IGludCBvZl9jbGtfYWRkX2h3X3Byb3ZpZGVyKHN0cnVjdA0KPiA+ID4gPiBkZXZpY2Vfbm9kZSAq
bnAsDQo+ID4gPiA+DQo+ID4gPiA+IMKgCWZ3bm9kZV9kZXZfaW5pdGlhbGl6ZWQoJm5wLT5md25v
ZGUsIHRydWUpOw0KPiA+ID4gPg0KPiA+ID4gPiArCW9mX2Nsa19idW1wX3N0ZG91dF9jbG9ja3Mo
KTsNCj4gPiA+DQo+ID4gPiBJZiBjbG9jayBkcml2ZXIgaXMgYnVpbHQgYXMgbW9kdWxlLMKgIHRo
ZSB3aWxsIG1ha2UgdGhlIGNsb2NrcyB3aWxsDQo+ID4gPiBiZSBhbHdheXMgZW5hYmxlZCwgaWYg
bXkgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0Lg0KPiA+DQo+ID4gdW50aWwgbGF0ZV9pbml0Y2Fs
bF9zeW5jKCksIGF0IHdoaWNoIHBvaW50IGl0J2xsIGJlIGRpc2FibGVkIGJlZm9yZQ0KPiA+IHRo
ZSB1YXJ0IGRyaXZlciBoYXMgcHJvYmVkLCB5ZXMgOi0oDQo+IA0KPiBTb3JyeSwgaWdub3JlIHRo
YXQuIElmIGNsb2NrIGRyaXZlciBpcyBidWlsdCBhcyBtb2R1bGUsIHRoZSBjb2RlIHRvIGJ1bXAN
Cj4gdGhlIGNsb2NrcyBpcyBkaXNhYmxlZCBieSB0aGUgdGltZSB0aGlzIGNvZGUgcnVucyAoZHVl
IHRvIHNldHRpbmcgdGhlIGZsYWcNCj4gYXMgcGFydCBvZiBsYXRlX2luaXRjYWxsX3N5bmMob2Zf
Y2xrX2Ryb3Bfc3Rkb3V0X2Nsb2NrcykpLCBpbiBvdGhlcg0KPiB3b3JkcyBpdCB3aWxsIG5vdCBi
dW1wIHRoZSBjbG9ja3MgYXQgYWxsIGluIHRoYXQgY2FzZSBhbmQgYmVoYXZpb3VyIGlzIGFzDQo+
IGJlZm9yZS4NCg0KSnVzdCBjaGVja2VkIGFnYWluLCB5b3UgYXJlIHJpZ2h0Lg0KSWYgdGhlIGNs
b2NrIGRyaXZlciBpcyBidWlsdCBhdCBtb2R1bGUgYW5kICJlYXJseWNvbiIgaXMgc2V0IGluIGJv
b3RhcmdzLA0Kb2ZfY2xrX3N0ZG91dF9jbGtzLmJ1bXBfcmVmcyB3aWxsIGJlIHRydWUuIGxhdGVf
aW5pdGNhbGxfc3luYyB3aWxsDQpzZXQgaXQgYmFjayB0byBmYWxzZS4NCg0KUmVnYXJkcywNClBl
bmcuDQoNCj4gDQo+IERpZCBJIG1pc3Mgc29tZXRoaW5nPw0KPiANCj4gQ2hlZXJzLA0KPiBBbmRy
ZScNCg0K
