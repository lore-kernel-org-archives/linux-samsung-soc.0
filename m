Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2844A3F164E;
	Tue,  4 Aug 2026 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853189; cv=fail; b=Cjnp3rM42wXkFimdofXFVNOUhlOxdBDuyylxpwU8+1bW3HF2dxx7zW618bT3sFImd+LAP5O27rSzE+61lw1jEY/R0oeo94IKheZ4K992KcJx/NEXatPHCSeCYO98n0zj7WYNOOYH5oGYWKAGISBusG+Hg4QoskjlzY95+0HH6c0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853189; c=relaxed/simple;
	bh=WwSnMem1c5XacZyZLNabD8TspT2GeHZienrvgUxSUeA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IwyKCTwlPPDrLPEqfRo2EZIycA7/Yd8RcJ23D9Y0F0uWavw++fPOVX4fik8efVQLnTjwK2S9xNiTdjlTR9PCEuxhSuXqIRkq9nZ3RNsTRO5OJbyi7JEEa+EtL1UCs3s5+a2rHvqz5sdvTpSdwDg3EyWeerG+oiESeXLtOQ5EZEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PtxK0lg2; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PtxK0lg2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avWqDTl99ZklaK8bBOcNSyD0C4vkZpe/xkTjkMU+n8CHnp5uF92IGR7JbpbdvKyOctOLn6w5zyLY7hULkDy05IEjK35CVn9DvJt5TKJyjDlwS7zCbEurwp+RyT/s4nyub0t2MelQolfeMfXrbno1Xgqeu0nrIgGZhqy7n8Tja6U1waHVqwCUpVWlAVjlaoqrL2hlNM1arEyPuM0CPYHrmdH7yYbxPcW6wvj13/CpdosBr8gKq05F4G+wcxcYzR4oaA0qCk+M0/yJZdEmGwURmHmCr8LDBrSF71JBbE3wsBl+6/Y+JSDGxW3HarVBHGwgZygSbVFkN39XvPik4msH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XIRw6buc1KNo4VTQmuGx6KKCadS2Enslpiu/vbpNLE=;
 b=vF/A43D0h6C96cDaS5OQjdXMVFtKOvEf13OFVW0g7yvUh2e7Mej8/jfqETIf9D8bJxbS4oe8apTxSAbPpoJnxeasaTohRku3tm3KMaqRy3Pwutnbgx/XBapgY594g+OMEK6PItKiWcfLfqsA4d80gfLMyKTKqZNwaJ7sxylcJlxvCZuZ6x3Q2U5CyEQWJOGpgMxwGGUF0rNPOBBccwhvrndQmZH3w1dvJumoY+ZYciivbv8AlFPLBKzeAhQvqcLAMuSJmSF+52wc28OUrmvwladcBA5TJccNYSHpH+gphgZnu4PpfAt59Bz7Qqi8ydM9/UwUiOj4imgL9xkBvcwgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XIRw6buc1KNo4VTQmuGx6KKCadS2Enslpiu/vbpNLE=;
 b=PtxK0lg2/mmoFe/I/5EN1ZNm1Nr6mDpZmNUTsIu6LSZjwL5LY6iRQy9acanWBBMEUyP5s0Yz2lt/HnTrUL28ZlmwvJOb5F+WsDb+pz62BV43cs3SD9gO1A5mvJDbftr7sarAoeHsDS/vxd4tucfZvETlE3YQTbWBE0voo/t69XHh/62Jsw6BTWYpKZI9sINK93jI4NehqnJKqYYZP3SlR3Sm1GSmnpI7KkxBvU8XeO10gi0I/j9URAC+m/RAZ2mN9AR+sfThmOL9q/2qdAHXMAGYN1u7BtvOFNHef7QX3wuXV8jWPqBLiAJ16U604tXLELSENRjojaAq1RxWZSmwDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:19:20 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:19:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Aug 2026 22:16:41 +0800
Subject: [PATCH 06/10] dt-bindings: mfd: ti,twl: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mfd-syspower-v1-6-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
In-Reply-To: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Shree Ramamoorthy <s-ramamoorthy@ti.com>, Heiko Stuebner <heiko@sntech.de>, 
 Joseph Chen <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, 
 Zhang Qing <zhangqing@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Julien Panis <jpanis@baylibre.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Alexander Kurz <akurz@blala.de>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b873af-bb99-4c42-6dbb-08def2336004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|7416014|376014|1800799024|921020|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	8BpX63SP38tfO0LqqPcTwIz8obdFtdF+hZuTzJxZ8DtOKdaHR2Eotj8K4fWah/jDwR4ollwEa8oQWEkFQMNn1bTkzdiHtkFW9zu2qjM0mgeHz43lciRhb5bz4PEujg4P3yO+6sIb9zU6zi0h1sLoXrcbfB9mvlgbrDDCEAO82ijiiXH3Wo7l4lptPcUwoRMlNv3S4mBCwsT2JGpBlhcfLsOY71EsMiX8p+raBzmsyvHccc0LgKcu4yZpWzegsw6Isr15yqG9wGdbSvUFWBU6C+m0QJlMugLCzsirtEQTOqdHEKw78bYKmo9nP8zJiwux7V+ZuRSxnTGoF34d73Xs7nlp8EEV9eOTK0LwuaA2SHH1pKU23EF1P+5CKEoqfQZOBHKWnma5jlOj2coL6F2hJVL2krfCTjIslGNBC0ei5+nzzZivMRO3tQPR7m304P/v1CUXFaROT08IZ/nV4O8vQGNWoUqwd4d6gmeOr31FB9q5D9Db1w6fxbcjvpckzcm5HKLJal7x5DfU2Zb0ORtEvIkmNmqUStFB5Pu5r7GqVXjGSykeLPJLVHtbnZ405sTDcragwcwtPV0jVI+QAw/WCpFIn0hb1TXs/0PlHztne0uWt27zpG5kaG2TTlS2XLQ1Gg58qsmgmu6fXZW+0bFIIYdD7rXKdnCBbu61XLvosu8DYMZGhmLNGIkEcFZUxw46Q3bs2fvo+606riLg/P8NDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(7416014)(376014)(1800799024)(921020)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2NMMHZWNTVtMUdZa2tNVTJwek90dTYzWDB4eTN4MmtlMUJlS24yRGRoZDFD?=
 =?utf-8?B?S1cvL2lDTmw4eEZHSGFsM0ttOHB0UElCR25hbTEydmhlOFROYU9zM05ub1FB?=
 =?utf-8?B?dWlkSkxZK0Jxa0V1QUpjVmNtWUFweXdsalErOEpoVGk5S1phL0huK1pwUUQ5?=
 =?utf-8?B?ME5LUVh2dStoM0l3L3NjRThyd2JRT3ZlZlpFZGh4SUV1ck1LVWEzYlYxZ2NH?=
 =?utf-8?B?aUJ6WDIzeklJRVVVQUNpRHZxaTdETGJJa2huaVpMSWlCK1pna2lrTXZTSHhY?=
 =?utf-8?B?RytTcStNb3ZHcThrbFJHVmVtOEtJV2VORUZKMGZaUzcxSklyalJVQkRGdFVK?=
 =?utf-8?B?ODRKMkxQaFlpUlVNcE1BZjZITm9OOG1YZ21pbmlVUEpKblBtbzdmaHhUcWFP?=
 =?utf-8?B?M3FLL0k1YUREdjFQTkxQVEJSZnFBRjY4dk5ma3NCOTQ2SldXemxuOUV0Y2o4?=
 =?utf-8?B?MkZzTTQrb0JDTWZpRWNIRTZSZEduYklzVGJaMktIZW1abVNUS05pdHBaYVNO?=
 =?utf-8?B?VkhkUjBKVnVHeHFrTXVhUHVITGF3cDhmdkw5T2c5YVZISFB6RW5OZDVUelpB?=
 =?utf-8?B?amZweFRFN3NQNG9JdXEzaXhlTmJWaytyK25DNFp4LzRuM0ZQMEloNHBpcFBa?=
 =?utf-8?B?eVQ2VDJuZllUS1V3N2g5RXVlb3ZkWU52UVFFSnZMaEpHRGwwd2gxSHMwUUlJ?=
 =?utf-8?B?VXhqWWJacnY3dUgycWhZb093MGI4UW50WmFPQ2VkNGp6UTNlT2Nxbng3eWVC?=
 =?utf-8?B?S2hXdFc1elhpS3dsdjRLT2wrSU1IcTVvMUo0WEppdVlqQ0gwYjJnM3dMWWts?=
 =?utf-8?B?U0w5eTY3TFJ3T1RDK1I5K0JTZ1ZtRHIxemtDMHkwTW1nSHdMbjY2OHVXcXo5?=
 =?utf-8?B?NUxsUGZZSS9ZZ1lqQnFMWGFtV0MyYUlGY1A5b0tPTFJzbnRkTm50NllHQXBD?=
 =?utf-8?B?N0NGU29pOVBtdWRtYWozV0VkS1RaR0VmVVg4MjNqdG5xQkZGVDFJTU1mcWth?=
 =?utf-8?B?dFRPR3B0Q0NxdC9MejFtMUZOcHpNNE1IZGU4WkEzaHIydGEyd0VGSHVLamNO?=
 =?utf-8?B?VDFYcEZoQml4S2hEOXdlVGFVcStlYlY4WnFtUWw0aWdiUVEyN0R6dHVQVjRU?=
 =?utf-8?B?azM1MytmYzhLNkhGMExPV0VOc0dIdVhYdWpsa1FHZkxCY3dYdERoeXBwdEFt?=
 =?utf-8?B?dWhGUHp3bXc4TXphdnBNendyc1M5Rm1rZG13UnYrQ3YwNU1HYzExdmxjSlc5?=
 =?utf-8?B?dlBuR1E0dFM0ZWhFOTk4WmJTc0c5NnI4NnJUOTR6d0wyRlNzMTE2V0Y1RmdN?=
 =?utf-8?B?ZmJpZXZPZ2tRY0dxa0ZWazdLUGNTdFU2eEJtd1RjVlYxR2pPVUpPWGFNb3px?=
 =?utf-8?B?cDJmdVBqRERXQ0Q0bk83WFhhUzh3Zlc3RzJTaGNEbW1MbDRIRTYyWlVxL281?=
 =?utf-8?B?NlViSnFmWldhSFFYK1ZqVFR0Y200OEZYbnRIM1ZQQmhCQmY2Y0pvY3JSaGRL?=
 =?utf-8?B?dzFjVkY4cllDbjhLZXQ4WVNQaHluYzhBTndmdUpKNUwvUTIrdjMrTWNNUVRn?=
 =?utf-8?B?cUpVRDJpVUp3Rk02dXdKeHY1OGNMS08vOXYvOGl4UStMREYvL2VwVU44QmVF?=
 =?utf-8?B?a0Rvb01oZlNVWEZlNVJiL0tCODlMdklISVI5NjV2dHM1ZHloRWJYWmY1bnY1?=
 =?utf-8?B?N245N1dTUWdFbXpMZXg0THhoaW9pNTNYcjVJMzZNVnI2TnN6MXdBNVpHdGxa?=
 =?utf-8?B?YjduYnFjNzQxczlqVFMxUU9qUlk4ZUJIWmFYUCtTak4veEtCNkZmVHNqRFNv?=
 =?utf-8?B?WXJYdUJmc3BBd0tqdERhSmQxMjBGTlY0WkRpeVk2VzM4ZWxES05vcGkyM2Rp?=
 =?utf-8?B?Y3VSZk1VdFovSDR4dUFkL3ArT3laZ0Y3NThpVmhpay9QSmlWRlhtcmEwOGlF?=
 =?utf-8?B?dkZ3U0UwV2NjMjZqMzZtTzQ5MWNBQ0ZyYW1xamJPU3g0ZGNublpDa3kxUWxL?=
 =?utf-8?B?eEFrWGtyek10ekNlNVE2LzNHSEt4WHRkbitONUJjVUI2TjJwZ1lvUG1ZMjlw?=
 =?utf-8?B?Ums1V1poQWhVZWxCKzZvSmxwL1UrZmo4bFVjMit5Q1U0U0k2KzBBL3VWdDUr?=
 =?utf-8?B?aDlVSzAwVjVFMExkSEFiS3dWVWhNRFB2K0pMN0NDZXovY2xJV0pYSXBUcEoy?=
 =?utf-8?B?WGh2VlFTZFJLUFZ5cndOVDh4YkRwL2lwRGpwU2Y3ekt1UjN5Q2l5ZVhQNGUy?=
 =?utf-8?B?ZklaNkk1bk4wUHYrRVpQUXNibUc4ZzViZGNFNTlqYUlJQ3JKaWpOTjBDQmEx?=
 =?utf-8?B?aGdISmcvWWk5RG9yTVI5dTFZY0xzQnB2Vzk2a2d4TzdwVGVVZTNBRVdCVHNF?=
 =?utf-8?Q?i310nh5t2ilwTdUxSkRnTIIdq+NUM/xApHASk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b873af-bb99-4c42-6dbb-08def2336004
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:19:20.2328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyklbpqJ7Cahh6lai8tY+8AaDOHNvtByFBPOijAnUO2larQwjOnD5JBbdlo/eXds5rVpCPpXu/Yb8/zSV7dpgzfarSyEjU80PHlNp6FZfyA6v2s+PmMpfLoWaKkYzGeo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9135

From: Peng Fan <peng.fan@nxp.com>

Switch the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/ti,twl.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl.yaml b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
index 9cc3e4721612..4b6b68aaee76 100644
--- a/Documentation/devicetree/bindings/mfd/ti,twl.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,twl.yaml
@@ -16,6 +16,7 @@ description: |
   These chips are connected to an I2C bus.
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       properties:
         compatible:
@@ -205,8 +206,6 @@ properties:
 
   interrupt-controller: true
 
-  system-power-controller: true
-
   "#interrupt-cells":
     const: 1
 

-- 
2.51.0

