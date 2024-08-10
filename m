Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB21514A4F3;
	Sat, 10 Aug 2024 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723283343; cv=fail; b=r+Df3OZ0BoeijhKSsIJDmsiZ93vUYxpgRYGoLAAsbqRqP15TdKbt9WeXyuds2dIfFXB9wIxGRyMlG6c/YcdfiqpJgYyivjBl0ryDHf1XLivBac9mpvINwZP4q+mm/7btTQ9UXbcDf6RnjiRyAEGmyPM2PPyf3zBIusX7gj4CqFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723283343; c=relaxed/simple;
	bh=oGUNXdobJREUUr3l/gnJUOKI+tcjnYs3cfHQTWC0ydU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MpCwoIlRWIL0YAnizg6eRztB2POBNbMcXy8HFuzs1arOdAw71qleCZZ0ZQBndJRG26Fj1JCRWsl6Vxjj6w2TCj67njJR7E75WMFMFgnPBEtTd/9jT9MhyqH5FvLlXm3hX8VeF5kCLdgZ1pjP3VJpUQWEk86xpq/BCtEY19h1T2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hZv314ik; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hZv314ik"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQD5dbPi8bvyg+RWJlRisPVkage0Qg2FNsVsICUp8g6KVb+nmw7jzUfVRJMkklkrmOSITL2q5qP3To3XMj3DCOWb2WilbtZncOKuoCYiKVebuR9AShAvDFFJOsdXQ2c3km8afFmFQRF07e0ugc/gT3Raot2Vny9xzPrVM3z4pKlNhOX1LO/Nv2GCaBFT2wpTnpAM5NdyDA4UldFb7qdGOhILy96VilNykbvvfGv3mMzKGg4Qw3t02jEyIrRZMcC7K11SZv/hjqKGYWslZU2RvHXfpD0mMtHjVLLPJvG0dZIvyOSjtKrUg7bzV1KzcUXTQg0cXolxHNANQzbzHtf9xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGUNXdobJREUUr3l/gnJUOKI+tcjnYs3cfHQTWC0ydU=;
 b=V/bEvIUhuPFvrKRMjGuhCMyNDXiw9Eqd1pWajK/orIxt7p84rOv/I/kBIbJO2Kvl0L0ipxsMLHvTiDZoj3eR4clwzRPPQCkzhbBjaDSz0OIbIcPgEt1W4mxwVnCTydBek0oKOlYnGCUVfF92vGmVurVV+Ug5Abr3MxODZ+iLU94Ah9lvyK68ZDZnvKWWaLcjqraekMAt1UbSRT+7IO0eAlvzqFp23ACMMDnhlUen+0cXKSe3bY2YQy74P6d9KjXZMEY0Yi3VWr0Z3rnweJvGe5rdxmKYAB4XGsOmNqHEvfiHvqismcDvUsuCUXL8XCxy86a3wdxB6PjbMOA80Tx6fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGUNXdobJREUUr3l/gnJUOKI+tcjnYs3cfHQTWC0ydU=;
 b=hZv314ikZuvqERD17g976P1vhL/G/ueOG75YllKx7BXn8hjYS3ts5tJJNajpjp3Q/HPS/NKtk/yUskZKulLogbMXNvqVyKSEhB7UwY3yC5CO4Ax7X27fWQDoSwA92GlATosaZYHEcp2wnOWpISHeePYfCClsfe7TgyK5dor9gvZCiB7g/pZr0Ln4bhNRfeEDI15hmcQzrDmF8tRdd/5bVa2N1VliHgcruDqOH38QszR1GK+Aeo2KUNn6Ybh8C7LeBIvZNJeS1JxjWuE+X2TzjQwCycqaBiK53bOPok0o4MfydI5h45bTMI9sRDHNDz6c2GkYNRrPdX1T8y++PTN+xg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17; Sat, 10 Aug
 2024 09:48:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 09:48:57 +0000
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
Thread-Index: AQHa6aE+ihq9zzVGLUK5uxX3bJggI7IegxvwgAAfVoCAAZ3scA==
Date: Sat, 10 Aug 2024 09:48:57 +0000
Message-ID:
 <PAXPR04MB84592C1D7D03704665F6F89D88BB2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
	 <20240808-gs101-non-essential-clocks-2-v6-1-e91c537acedc@linaro.org>
	 <PAXPR04MB8459F99475C289A827987AF588BA2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <d4580b33c195dcf1c3a0054b29555383d2e1606b.camel@linaro.org>
In-Reply-To: <d4580b33c195dcf1c3a0054b29555383d2e1606b.camel@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU2PR04MB8616:EE_
x-ms-office365-filtering-correlation-id: cd69e581-de5c-4d22-d24c-08dcb921a772
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZFJSLzBKV0VoZFdkVmpjN0RsMDFTQitrR1ZiOVBQdWVMUjFpenpYY1RiZ1pM?=
 =?utf-8?B?aXJ5c1ptb2xOeExRUUlXeVFabDF4ZUI3cTNZUk5MbGhGN3p0aHJPN1JOMWZz?=
 =?utf-8?B?SnRabGlWbG41Y296MWZseWR2WnAvMnl2Qk9vN3g0dXhVWHUxTHpEVEVCVGdF?=
 =?utf-8?B?VDBTQTB2MmIzU0RaaFgrRXZvcEFITE5ldFdrZno4c0VJb0ZkUUVKRm9WN25r?=
 =?utf-8?B?QXNLTU42emNVemVhcklHTFZxQ0FNaE5NcGQvbVA2ckNMNHNtcm1scTJZV1Mv?=
 =?utf-8?B?RXRtWHAwVGhPRUp6MzRoT1JFZDFTSXgramJueGg2SFVjOGpkMG44ZEdseEFl?=
 =?utf-8?B?dDVrdXV5RG5PZEFNS3Vvb2U3dDFqdVJOZ0RXUUhORVhFV0h6S0RmNktLRmRx?=
 =?utf-8?B?UjlGVEU3SHFvVkN5UGE4R2VveTcrcGw5czUzNXppbmVhU0FQdTR5aG5jQTdi?=
 =?utf-8?B?eFQzaFhZVG0vZUd0MXV0NlBjbWd5bWRoeE91ak9PTzNQOURWbTRrTVBlb0JR?=
 =?utf-8?B?d3huQjhRWG5ZU2g2b3NON1ZDdDduZ3RhOUpGREIwcmpHV2pBYUZrbWc4REgv?=
 =?utf-8?B?d2QzTTdON0hxSFVSbCtHOWNYZ0s3VEw4djg2dlJRaGxtVHZRMkRjQlJIM2ts?=
 =?utf-8?B?QUJvd0VaSmEvb1JKb3VSNjBrWklyOTh1K3YrYitxWVR3N0tJOGw3NnJjNmM5?=
 =?utf-8?B?S0tVZCtKMGpwVkl4dWdYQWJUOWx5dFJONDdsSXozTTE2NmlyUm9jM3pOK0FQ?=
 =?utf-8?B?azNZd3ZHT0EzUkNHWmdCdTZYTzRKd09qaDlEMmlTbUVCQmNOOXBvTkdqVlJk?=
 =?utf-8?B?VFlWWVRWckhNU093ODVmQ1hKRFZaK3ZLVEdiT0N1MFRYMkIxUVlFQzBJVVgz?=
 =?utf-8?B?V0hwUmgySkgyK1VIQnp1TTdPdW9MUW1wV1NidHkzYngvN3ZBd1JEdlFVdER1?=
 =?utf-8?B?SjVrODlpTi9FVWlHMHd2VHZpWVpYZU1QZVJaNEFqWEJBb0Z6bXAyS3pNK25k?=
 =?utf-8?B?NHEza2QyZ2RxbW4xZG4ya1owODR3ZW80N29PK3lnOCt0RDlQNVZuSUZYMzR2?=
 =?utf-8?B?Mi92UTlma2hWN0Zod0UvT0IrSm5zQzgvSVQ3N2FqS1JqcW9CdEZNVXp2QnVh?=
 =?utf-8?B?VzZNSGxRdmNBK1hHUjFDUE1LQi9jNlRBWEQxL1gzMTFSd0cxZmdrSDdEVmNa?=
 =?utf-8?B?QURxWnF1WGRORnJtZDdlKzB0UnhkMjZJM1dndTFWV1VrQ2lLeUlEM1ZTV0xT?=
 =?utf-8?B?SE14M0tRQTdEQ1ZvQTJoZFRSR21KOUhuR3hla1RQMzVzd2FDektYMTdncW0z?=
 =?utf-8?B?cVF1djlZeGVtaGovMHQ5bjdTeEZqNHlEZkd3eCt6R2ZVM2Jaakk4SW1od2R6?=
 =?utf-8?B?MVdXNXdINVZ5dHhGNk9Ra1hvcFkwdEhPNUhEdCtQeTVsdzI2WTJ5ZEhPUlEw?=
 =?utf-8?B?TUZ5elNqZ1dCOVNmaHYwK3dld21LNnZReS9DUDRnQ05TQTk0Tkl4TFZnMENG?=
 =?utf-8?B?SFJ0UGI1ODZ3MWE1czBJeVRGak1STkxmWlRVZStYOEZYQnphd0hFSTVRdzhu?=
 =?utf-8?B?OWFFd2VEQkpLeW9GZExtZE40N0xDM1M4SjR5UExFLy9GMEdEUXdQanZEb0Fq?=
 =?utf-8?B?YytTVEIyQkpvakFBQ1k4ZTBFcHByc1FpcFR2cFRVbDAraG41WWtHU0ptaERH?=
 =?utf-8?B?MDU5VzdFRmNJWlRCeHJZTFZSdlNSMzZHeXBSak10NTJBY0pCSnozTEJiQnFx?=
 =?utf-8?B?UGp4YjVweWpHNWptdTFNeVhKbWJ6K1J3NHZTMHE3TG03bUtLcUNvd1ptQWhn?=
 =?utf-8?B?RFhmc0Z6WWlWa2txRUV4aFJSb0xxRzdlNFpjMGR4a0o2NjJaVjdGcHBwYTho?=
 =?utf-8?B?NUdISHRRZGljcHUxTmM1aUJOS2x0K25nYS9GN2FsejFkRnhWMUtxZTBVSklO?=
 =?utf-8?Q?bnjMjGQJ/UI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WWhJR3k5bVY1S3ZaVS9MTHRSU0xDQlRQT2dYZGpmZHRLbGJiTXIvYmllaktE?=
 =?utf-8?B?Uk5qZUFXN2puMHlIdXUzajJyU0d5QUNFSnVRanNEZG9aRkZhbWdRTG40bkp3?=
 =?utf-8?B?ZTBRZXk1N053ODJITmIyelpaVkFUYU9sQXBvS2tNd1RUQWlkUFlCZktwVEg4?=
 =?utf-8?B?WEkvNTZsUlVubzB2ZWpKZzl1b3JPU1pMR0tKTGNaTEFHWk1ncGs1dnB2TXEz?=
 =?utf-8?B?b21DYXkwRFNDS2J1SUFsNHlxL3drOXpGRGZUeFRyclZoeGZHMFQyWk9Ic25h?=
 =?utf-8?B?VkdmSkRyeUwzYVptTzhyYWVOZ2w2MysyN2dDL3BHd0kveXhNMk5WVm5xY1E1?=
 =?utf-8?B?R1RnMTlpbmZyMHpJSlRYd2F2ak8wMG8vQ0JHL2VYSi9pVVVxV1hWa1dub0Vi?=
 =?utf-8?B?a0VpMk1VaWgwQUl0ZkVvc3VSWXljdWlVNWZvU1AwMHFSNE9nRHdObWpWVzlZ?=
 =?utf-8?B?eUVGODZHTDYwSElOa0dzU0Y1WXRsT1IwZDNmWFowVTFvNSs4c2J3TlZLRU1j?=
 =?utf-8?B?aXEwQTg2UVBZQ1o4b2FvZzNpVFFOK21wWThYTWhXVG9Lb1RnQ1FmSDFkT3U5?=
 =?utf-8?B?RzhackJINFRoZkJKcDdQNktYd25oVWlBMTAvZ1FYTTJJTWRFQW1oVElzeUty?=
 =?utf-8?B?WERkR0gvOW9iVVkzM1hudm9TNEc3ejdJZXJpcTh4SmEreEs3Z1N1MmtOTkFy?=
 =?utf-8?B?NFJMSkxkcTNpM3Y4NDhVMk5SL0J6UlVXelUra1ptM055czF4TDV5ZVFwMEtX?=
 =?utf-8?B?VXNEV3RuaGhPMjZOWStWYWFiK0xTdmFlc3VrbUxzbmw5clFLcEdCUVhiaFNx?=
 =?utf-8?B?V1ZmOERSUVFhclFhRCtiSVdPNm1GQWxsaEc5SldSdndmQWxUSUtRWEwwS2Fi?=
 =?utf-8?B?QW1DQ1E5enNnUEVodlI5aHJZaElOSmhBRnkwak11V1NGeitmcVpmUWVraEth?=
 =?utf-8?B?dnhSUFdaay9USG1BdmhpK3lzZkFSdmM3NUU2eGxCcVNUTU9OZzhhdzdZdWFq?=
 =?utf-8?B?WVlyMFdlZE5ld0p4YVFMWTBqM092M1R5RnpndXkrM2RhSnRRQk81UmJtK2tI?=
 =?utf-8?B?UlNPUWRiNUF6VGk2aiszb0dSTVVraVBlMW5laXpHNXdBWjU1S2M3NmpPT2Zt?=
 =?utf-8?B?dFNUMk9hcWJncmd5enJZdGNheW1TVTVmYmlzOWM2cE0vaUtlL1hsbE9QUmpq?=
 =?utf-8?B?VHJUd3JIQWRIcnBERUdWWS9VaDBvb2VZSERsaEYyUjhFdWozY0k3RWhUQ0xK?=
 =?utf-8?B?SDM4OCtpTmRJbGs3TS9mc0xhTkFHN2FmeUloRzBzT1BFcytpVTRoZmxuTzI5?=
 =?utf-8?B?KzF4cTdGNE1wNlhXNWRCcUZXZHdwU1JKQlhhSmgyeHpiWGRJOTFNbUZSRWpL?=
 =?utf-8?B?djVBVFEwK1FjY0RJS01hK2RMU2M0VTBhZ3hOdDdNdFhYWXowR3pRTmlMSmt6?=
 =?utf-8?B?MVVsQUFXejRaMDNsWFR0UElTaTNVVGkzZ0RNd1lNOFhZZHFlSlF4dE9kcDk4?=
 =?utf-8?B?ZDdCajJoUmowd3UrNy9mb0hiUjJheHNGbDhkNmg0QUg3SkNvV1drNEdOclpp?=
 =?utf-8?B?UkpMSkNrRi8xSjlpSFRGWnkyOTJ1KzFWL3JDWFNZbDRZZFBQRUd3SzFOVlJk?=
 =?utf-8?B?SGY1cmZhZ2NZYkNHOWVqV0NoaU02c3pBYlBvTzdGQ0plYzkxTEZ5aHFHR2Qv?=
 =?utf-8?B?SzhCV3JJQWxnNVZlNUNYQ1dna0NWSHVFdVgvWHdzZWlaWmk5TTYwVkhrdkV5?=
 =?utf-8?B?dEVEd0s1L1paMmwzQ1QwVEdQWS9haDA0MW9vdUl0YWphUEdKVFhBUURTUk9V?=
 =?utf-8?B?Um9LNlNXNGwrYU1VMUtJSkN0L3RsVUlHNEZhekJCNGdmOHFBQU5JK1RVNVRu?=
 =?utf-8?B?dzkyYVRmMTNocmNkQzlWQm0zc0tGaUlYZFkzYmFDeFR4VXpZYURSWlZFYVZX?=
 =?utf-8?B?QXg2d3RCclNaaGk1MmdDVnZVMHJGSDdoTE9RU0ZuVGxhRzJDSUswbC94Qk9S?=
 =?utf-8?B?QlZjNGtaUGpveTRUd0QvVzE2dlIxdktRTnQwTEY3b2o3WWdNNkZHSnhacFhQ?=
 =?utf-8?B?WUJ3WlJ5d2R5TkdRamt0eTFwOGVkNzA5dXc5MTJpdnh2NGtJRStuVVFmRzRC?=
 =?utf-8?Q?jeYQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cd69e581-de5c-4d22-d24c-08dcb921a772
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 09:48:57.3803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fV7NSZXxPPJuWR2dGwI7IBET7U2yfj25EWcUkxNRC3Y5LxotnNH50FRgmv9FDS+ZDw6fYkNa2nprc+qdVuf2Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8616

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAxLzIwXSBjbGs6IGJ1bXAgc3Rkb3V0IGNsb2NrIHVz
YWdlIGZvcg0KPiBlYXJseWNvbg0KPiANCj4gSGkgUGVuZywNCj4gDQo+IE9uIEZyaSwgMjAyNC0w
OC0wOSBhdCAwNzoxNiArMDAwMCwgUGVuZyBGYW4gd3JvdGU6DQo+ID4gPiArc3RhdGljIGludCBf
X2luaXQgb2ZfY2xrX2Ryb3Bfc3Rkb3V0X2Nsb2Nrcyh2b2lkKSB7DQo+ID4gPiArCWZvciAoc2l6
ZV90IGkgPSAwOyBpIDwgb2ZfY2xrX3N0ZG91dF9jbGtzLm5fY2xrczsgKytpKSB7DQo+ID4gPiAr
CQljbGtfZGlzYWJsZV91bnByZXBhcmUob2ZfY2xrX3N0ZG91dF9jbGtzLmNsa3NbaV0pOw0KPiA+
ID4gKwkJY2xrX3B1dChvZl9jbGtfc3Rkb3V0X2Nsa3MuY2xrc1tpXSk7DQo+ID4gPiArCX0NCj4g
PiA+ICsNCj4gPiA+ICsJa2ZyZWUob2ZfY2xrX3N0ZG91dF9jbGtzLmNsa3MpOw0KPiA+ID4gKw0K
PiA+ID4gKwkvKg0KPiA+ID4gKwkgKiBEbyBub3QgdHJ5IHRvIGFjcXVpcmUgc3Rkb3V0IGNsb2Nr
cyBhZnRlciBsYXRlIGluaXRjYWxscywgZS5nLg0KPiA+ID4gKwkgKiBkdXJpbmcgZnVydGhlciBt
b2R1bGUgbG9hZGluZywgYXMgd2UgdGhlbiB3b3VsZG4ndCBoYXZlIGENCj4gPiA+IHdheSB0bw0K
PiA+ID4gKwkgKiBkcm9wIHRoZSByZWZlcmVuY2VzIChhbmQgYXNzb2NpYXRlZCBhbGxvY2F0aW9u
cykgZXZlciBhZ2Fpbi4NCj4gPiA+ICsJICovDQo+ID4gPiArCW9mX2Nsa19zdGRvdXRfY2xrcy5i
dW1wX3JlZnMgPSBmYWxzZTsNCj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIDA7DQo+ID4gPiArfQ0K
PiA+ID4gK2xhdGVfaW5pdGNhbGxfc3luYyhvZl9jbGtfZHJvcF9zdGRvdXRfY2xvY2tzKTsNCj4g
Pg0KPiA+IElmIHRoZSB1YXJ0IGRyaXZlciBpcyBidWlsdCBhcyBtb2R1bGUsIHRoaXMgbWlnaHQg
YnJlYWsgZWFybHljb24uDQo+ID4gQmVmb3JlIHVhcnQgZHJpdmVyIGxvYWRlZCwgY2xrIGRpc2Fi
bGVkIHBlciBteSB1bmRlcnN0YW5kaW5nLg0KPiANCj4gWW91J3JlIHJpZ2h0Lg0KPiANCj4gV2l0
aCB0aGlzIGluIG1pbmQsIEknbSBub3Qgc3VyZSB0aGVuIGlmIGEgZ2VuZXJpYyBzb2x1dGlvbiBp
cyBwb3NzaWJsZS4uLg0KPiANCj4gSSBndWVzcyBpdCBoYXMgdG8gYmUgZHVwbGljYXRlZCBpbnRv
IHRoZSBwbGF0Zm9ybXMgYWZ0ZXIgYWxsIGFuZCBwbGF0Zm9ybXMNCj4gY2FuIGVuYWJsZSB0aGlz
IGlmIHRoZXkgb3B0IHRvIGRpc2FsbG93IHVhcnQgYXMgbW9kdWxlPw0KPiANCj4gQW55IG90aGVy
IHN1Z2dlc3Rpb25zPw0KDQpJIG5vdCBoYXZlIGdvb2QgaWRlYSBoZXJlLiBQdXQgb2ZfY2xrX2Ry
b3Bfc3Rkb3V0X2Nsb2NrcyBhZnRlcg0KYm9vdGNvbnNvbGUgZGlzYWJsZWQgbWlnaHQgYmUgb2su
DQoNClJlZ2FyZHMsDQpQZW5nLg0KDQo+IA0KPiA+ID4gKw0KPiA+ID4gwqAvKioNCj4gPiA+IMKg
ICogc3RydWN0IG9mX2Nsa19wcm92aWRlciAtIENsb2NrIHByb3ZpZGVyIHJlZ2lzdHJhdGlvbiBz
dHJ1Y3R1cmUNCj4gPiA+IMKgICogQGxpbms6IEVudHJ5IGluIGdsb2JhbCBsaXN0IG9mIGNsb2Nr
IHByb3ZpZGVycyBAQCAtNTAzMSw2DQo+ID4gPiArNTE1Niw4IEBAIGludCBvZl9jbGtfYWRkX3By
b3ZpZGVyKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsDQo+ID4gPg0KPiA+ID4gwqAJZndub2RlX2Rl
dl9pbml0aWFsaXplZCgmbnAtPmZ3bm9kZSwgdHJ1ZSk7DQo+ID4gPg0KPiA+ID4gKwlvZl9jbGtf
YnVtcF9zdGRvdXRfY2xvY2tzKCk7DQo+ID4gPiArDQo+ID4gPiDCoAlyZXR1cm4gcmV0Ow0KPiA+
ID4gwqB9DQo+ID4gPiDCoEVYUE9SVF9TWU1CT0xfR1BMKG9mX2Nsa19hZGRfcHJvdmlkZXIpOw0K
PiA+ID4gQEAgLTUwNzMsNiArNTIwMCw4IEBAIGludCBvZl9jbGtfYWRkX2h3X3Byb3ZpZGVyKHN0
cnVjdA0KPiBkZXZpY2Vfbm9kZQ0KPiA+ID4gKm5wLA0KPiA+ID4NCj4gPiA+IMKgCWZ3bm9kZV9k
ZXZfaW5pdGlhbGl6ZWQoJm5wLT5md25vZGUsIHRydWUpOw0KPiA+ID4NCj4gPiA+ICsJb2ZfY2xr
X2J1bXBfc3Rkb3V0X2Nsb2NrcygpOw0KPiA+DQo+ID4gSWYgY2xvY2sgZHJpdmVyIGlzIGJ1aWx0
IGFzIG1vZHVsZSzCoCB0aGUgd2lsbCBtYWtlIHRoZSBjbG9ja3Mgd2lsbCBiZQ0KPiA+IGFsd2F5
cyBlbmFibGVkLCBpZiBteSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QuDQo+IA0KPiB1bnRpbCBs
YXRlX2luaXRjYWxsX3N5bmMoKSwgYXQgd2hpY2ggcG9pbnQgaXQnbGwgYmUgZGlzYWJsZWQgYmVm
b3JlIHRoZSB1YXJ0DQo+IGRyaXZlciBoYXMgcHJvYmVkLCB5ZXMgOi0oDQo+IA0KPiBDaGVlcnMs
DQo+IEFuZHJlJw0KDQo=
