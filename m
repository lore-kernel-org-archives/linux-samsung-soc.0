Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013014.outbound.protection.outlook.com [40.107.162.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385738E8DC;
	Tue,  4 Aug 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853142; cv=fail; b=YMHblWEifcT5WIRgrGsb4B0dMxu7E5gyB2y27vFLwGXAI9Dky/042TARBWmePJnXb9qLZ+5XvUUTVUWfGNkvRKiB4zw7bbS+AQtTUifTxCkc4uJTeZNmThZwaX3nKlE36hA+LbsDMVsjhHc//3fnrnvl3bFwvtJZglfria/hI+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853142; c=relaxed/simple;
	bh=SCFpEdxAnhFseICUPVTGF0MOmLT6dpW1qlayhv2yHCY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=cGCLLBUi6pXezYzwLz8bDpwb+p4BwHTVjJKgWDthr+osbsm6AlzN2ztegmwL2WGb10JokOc1TBByZ9D284EjvmiX08Te9i1wU9BWPTrtD3td0NXEq/Eqz03IW5sRbq8tFqbjmt6J9CJfWCJYCVyy2vVDE8PvBA9wR8rZx4V/2Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dFwVKYc7; arc=fail smtp.client-ip=40.107.162.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dFwVKYc7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfuZroRBiYGxai/HVID8+7hMEDYOBP5f37K2BmVi5gc9Lt52a2KGOULtNfGXBAQ6ZRIHqpEe+mInHyk4w2y5ajE+q52anpV7S2mH+7ZczaFAuBOC0Li+u36vPjOSDyAtLIusSdFRfZUCNeBMrmTT82sRfcyNSF1uxo9vjJjCeDRoY/WcM1IqrrAd60TP4r4LYvZShmYOX6HNb7WwrwTaBl+TU3SHFdUf45AFVjNl8VCBPAjAPo2amkJ0iKZ0nKYoKS46AKmPAOWxaoXBA+fV0Fr+Hu4iB48OGFXR15oa2VjHwP6ByrgoTRY8LY3GbPhXbkdW1j6Uf9Ant4P2nfBoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwoyLvF5uRTh+8zKwH2k+U9/12tXAvYRY19m43qfSC0=;
 b=JcsDYa8qNawJHGXfCsH9H4Obaum3IU5Zr8VccrcFiyqP5nRySVKqrkJzIfKU90pP1ns+LAgMsWMyNikyON8XhMsvWDifMbm/dkfDCY9Giqz6mwi3+q99nPV7PsazthsuIFbyAkFmeBgrejhemxjOITdK+l4nISQBGeIRcGERw6UNG8tFoODlmBrtcdjnQWsdqsGaRo3bSDW8LgXmbVlxO3e9EAb16IAlSoNLqF2uRiW1OBg2+iVmVTFqi1RI+aywCcZ+U+hllM1SsnIVRmeUr25MssIu9RKVBbKoFK5xIHe/MLawRdFxwX6e49XlmE+Rl6qaXXNBAl9sf9x9CH5ekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwoyLvF5uRTh+8zKwH2k+U9/12tXAvYRY19m43qfSC0=;
 b=dFwVKYc7bPSikpkPgK8WdAE1DKEYoyAOULOgsdjjCKUQFftzWL8YE4GAtm06VExZJxZDas9j1kD0K3rFkxhctpq1jk+EmRiDT/0GsHkPeozaX57b/Rw5KXnjnI1WAyXoFFmoZ+r7NIT7M1wnk2ltOrCZPz41aHYRI5fbL/lAkreBVYjF73n8ACtvO9UQhnxDf7GMYluKpfn5YkfVFxrLOZddgZb2bNVOTo6lTogYu57iAhf8FaahyKirUWfXey3gitfn2bNf8ugIfsMU67Oa82IB0DJpzrUXyr+Ap4/n49KPEUMDSqWfs8vwtrL85GjCJq3qk2+pqq9CczEq5MnjFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB10524.eurprd04.prod.outlook.com (2603:10a6:150:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:18:46 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:18:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 00/10] dt-bindings: mfd: Use generic power-controller
 schema
Date: Tue, 04 Aug 2026 22:16:35 +0800
Message-Id: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEP0cWoC/yXMyw5AMBBA0V+RWWtSNCV+RSyqBiPxSMcz4t8Vy
 7O49wJGR8iQBxc43IhpGj2iMADbmbFFQbU3xDLWMpNKDE0t+OR52tEJk9is0kbp1CjwyeywoeP
 bFeVvXqse7fI+4L4foTpHtnAAAAA=
X-Change-ID: 20260804-mfd-syspower-a3c8b6a467a4
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
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB10524:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e05fb5a-352e-4fad-259a-08def2334b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|921020|10067099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4yAJZpHwDXZkf62CGk6yUsYp1gCmPaVx9adNHWzBMdLgyslNNC3x5R5ID0UlZ2nms/TTlojLke5JzFl6GdsDMvGe69ckJtbQboDed1FcNeC10aJS5OkCI1BgLO44rEqWLZR6Y6AJ6A96h66Kb9CFENAnyc1XPkeGCtUqs8ubIq/HF0DnkySMv7r4epWMq+RWc4X3KyhbpTw1Uj9WB8JHlCZ27Sgo+TpVGOykXQCzq83r8n84fUzFaDctw1Qr2vfcferOVJGUr5//Hza6aq2RsbePYut4AAU/o24M4BtOZe8a9TpFduEHB+4gctcBZS6EvzYqqS1phGcbEHYAi58P34nEifiVBNOJdHpDtKhqPVjXawNtnF9AlzoaA98ZWuZmwIxLSecWACwZ8Z11qbq9C7o/U836Xl/lJtPM7PRMzix8CcufzpefGxzeIkUTZRx4ZNLP8J46T49LRZZ7y1bivuPlDWqCzFd/DBiJoigN7N6Z4ulVUuiLApcwYZHOH2ytc1uRHP78IGzJMk49FEKq/1+Rhr5jO7ZQaRKZuHpAjA8hH6SxWtx6qdm4pzZMM0BIsn4OKWfrVa6SLAZ+dh14ymvOZbw7foj6HILefZx2X7kEDbONYUguS6jk6EWqCz9h6f1LOd5Wi3vrcjFTUxB7CHdYLcYBGCTOym4BB974xyDwhU8dGr+nDPgaUxNXfLRNS3rZrgJgajh3Uzu9pj98ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(921020)(10067099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGx0NU1LbVRZVk16eWdBNHMyeFhxTGNZR2FJeTgrMFNRZStvQkZDS3h5M3Fw?=
 =?utf-8?B?V3JsNXlPZk1tRDRCKzJqb0dJSEw2Y08yV3ZHZk9FRnFSa3RETGZCZzhqb3RM?=
 =?utf-8?B?WlVYMFU4SUcxaG95bmZVMzVYVGhSNk96TXB2Z0VHY2hEWTU4SkZLaGRRaG1F?=
 =?utf-8?B?eGgrWDZXbGR3bVRVMFd5ZWFleVV6bzh1emN0MENyZ0k2a2dpUXY5Ym5TT2JX?=
 =?utf-8?B?TW5XNFYzKzR2bHJWdXV1T2hyVmxvY0J3cVhtZytSZ2VpZ2Q1TVF3dlBxeTND?=
 =?utf-8?B?c2VzcHFFU2JWYk4yTlZpaGlYV0l6VlJkTnFqc1NNYWROOGJncVhtdlVBbEls?=
 =?utf-8?B?ek84K1ltb0RUcDljN1IvZHJ0OS9uakR3encyVVdrajg2NGE2V25FV2I5NHpo?=
 =?utf-8?B?SlJ1cXZTUG42Y3dKUjZvOWFqYkNKM2lxcldxMXo2aVBuMWo4dlJtbFVtRkQ0?=
 =?utf-8?B?b2dpQm5ab3pNL09ZZWZvT0duaE1vQ3BGNzFYR2o5VXRUUGhrUkZXaFRSdmNh?=
 =?utf-8?B?bUwvUE1RSTlLdWtWRzVuZnlaMTUyZVJYalVncXQyQjNMOGJKQldaMDkrY2N0?=
 =?utf-8?B?cnlJMjV1dFJQa05FRzY5a01uNUJRNmtPTGs5SVZSL0lpaUZHTW9sMktvWnlT?=
 =?utf-8?B?ZzdPOFlHK0hGNFYrMXpkRGc1MW9uN3JwZEZPeWx6TXdhUGR2NFpqWEtQWU1u?=
 =?utf-8?B?ZHRDNnp0UU9KU3oxcjA1bVZ0MUxjZUhXOXhHVlZwWmxhTXdlODZDc1ZpKzha?=
 =?utf-8?B?SDltODVXWDdIK0NOTXVqcHp4VGhNeUUvNFRZZDV0ZkxRMUpWRjBPNlQvckt5?=
 =?utf-8?B?UEozUVdHOG0wRElNK2VOSXB2U0lYUjBUS2ZmbmxhRy9TTHVTNjRDaitkQS9B?=
 =?utf-8?B?ZVM2dUNoMjRLYm9MREdTSTg1aC8zK1pJdU1vOFoyME1ZRFprQjRCRjl5Qm9u?=
 =?utf-8?B?czNJYlRSRFNRWGw3QjhkclZjbFRpUXJPRUlacU93WXQweXE3YXcwVEtZY1FV?=
 =?utf-8?B?THB0UG1qU3kzY3J0UEZJV1h2dENjRmpDa1ZEVjZ4TElEZWE4b0hwaDBrcGVB?=
 =?utf-8?B?aGo3M0lOZjNyVzJqQmFUVklsaUlwTXdPQ3AxdXAyK0RjelREUEw2MVQ1UjVD?=
 =?utf-8?B?a1BjNTFaQmNSN2s0K25ocC9WMDBheGp2SmtEQlFTU0svT1NIYXl2OTR4Ulcv?=
 =?utf-8?B?SFBWa2hqL2N4Tk5TL2k3cXVDWndscUwvZStZYnF3RzR1VDl1dU55Y0xIVWZr?=
 =?utf-8?B?OUxsMXBTWEVPTDkzbTNPMWhWL09PTDBRZGdXYVVDdU81YVhGc3FOM2gzYmwr?=
 =?utf-8?B?Zmo4Tjh4TUMyWjdROFhWSXIvU0dQRTlKQzZoTWQrcmU2aURCR1RkdlN1NkQw?=
 =?utf-8?B?WFRTZVNvMjJPOTlsWkczbllTc2loVHBvL2hONDllcllNRDQyT0xiUUo1ZHgr?=
 =?utf-8?B?ZC9lbjI4RG1vYlp5K0VQMkRUMHoxQndjQ0pKbVhlUlRlditNeGJXT3BpVGhp?=
 =?utf-8?B?RS9DNXhyVm1XZFgyQ3ZFdFhiVnM3ajF6UFFCdHArbDF1YWFJb0VOM09ETnRa?=
 =?utf-8?B?QmpackNocDBockRxSEpqN2NzMHo1NVZKTGxUQ2xhRXhCRHZKck9CTzh1Q1Bj?=
 =?utf-8?B?UG5ZS1VabWoyMTlVY1d4RE1vdURPMi9vem9taFJUT2VVRUFFNFQ5TVRYSzJz?=
 =?utf-8?B?RGZvOCtzTU9GcWY3UHQwTzVyYW1SWXp4czczUVVMOGxKTEZESkl6RkNkNWVS?=
 =?utf-8?B?V3EySktYMHNxMUFtVkNqckdVU0NaZlpDa3N2dnQvSzVSMVVGTUxLOWZHZTBC?=
 =?utf-8?B?Y2o5K2NhT2dmcDBKc0xGazRnTW1BRDY3bEhPcTRVSFJJamlVd0FocExKZzlk?=
 =?utf-8?B?YURjMjg4RlowT0pMM09xcFoxSDFhVWlEbDdCWDNLTmFGOTNabnczOGIzd201?=
 =?utf-8?B?SVVrZFp3a2dWNHZBWG1OUWlqa2o0dlRIWHI2S1pTdlhJb25qYXNaVVVPcUJj?=
 =?utf-8?B?RWU2cmJhYXhORGt6Qk1wOWozT1RtRE00a1VqTFpjNjBya3pHeVBNdFIzNEQ5?=
 =?utf-8?B?SW9jVUhjaHQ5MzZ2c096dTRQTnR4UnI0Wm84M2p6YzNVUjltNjBIRzZlc2Fq?=
 =?utf-8?B?NTZkT09FcGVwTUMvQVVEVzlPZjZ6REI4OHNIdjZpN3FjMmg1OUdmQkt1QkV6?=
 =?utf-8?B?Q2NlekhieExaOUI1STd6QmZ5TGRsMDNxQ0JDU2dMejRKcStlNmE4UFcxblVl?=
 =?utf-8?B?emQ3ekVoM1dEMVFzMk1ja29EWm04Z25yc09rZW9WNUY0RnhjSGQ0Ri9wbDNh?=
 =?utf-8?B?d0hHYjRyWVg0eW4xTHY4NTNMT09YVEl0MGkyZTBoL1J0M0RsU3Rra0VYM2cv?=
 =?utf-8?Q?I6uPv1JGjujRAB8FzKv3GatFySDkG+OTrwz2A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e05fb5a-352e-4fad-259a-08def2334b61
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:18:45.8064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VE3dA5ocrsauaPDuc9pRvWFb6Z1p1Kz8lfVfW6OH6f/pRvOjNfslQOYRQMqyMysnOZK+JUXOTWaP3uQMIioz9yc/Dm4wZjDNe4/oJufXxjTM7UciCFMbuKw0Zoqq4FfM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10524

The generic power-controller.yaml schema has been added to dt-schema[1],
providing a common definition for the `system-power-controller` boolean
property. Convert MFD bindings that locally define this property to
instead reference the shared schema.

The common change across all patches is:
 - Add a $ref to /schemas/power/power-controller.yaml#
 - Remove the local `system-power-controller` property definition
 - Switch from additionalProperties to unevaluatedProperties

This is a pick of patches 2-11 from [2], rebased to linux-next/master,
no changes. Patch 1 (the generic power-controller.yaml schema itself)
is dropped since it has already been picked up by dt-schema.

[1] https://github.com/devicetree-org/dt-schema/pull/187
[2] https://lore.kernel.org/all/177523251875.1559844.9690289848283345069.b4-ty@b4/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (10):
      dt-bindings: mfd: ene-kb[3]930: Use generic power-controller schema
      dt-bindings: mfd: ti,tps65910: Use generic power-controller schema
      dt-bindings: mfd: rockchip,rk8x: Use generic power-controller schema
      dt-bindings: mfd: ricoh,rn5t618: Use generic power-controller schema
      dt-bindings: mfd: netronix,ntxec: Use generic power-controller schema
      dt-bindings: mfd: ti,twl: Use generic power-controller schema
      dt-bindings: mfd: ti,tps6594: Use generic power-controller schema
      dt-bindings: mfd: rohm,bd71828-pmic: Use generic power-controller schema
      dt-bindings: mfd: fsl,mc13xxx: Use generic power-controller schema
      dt-bindings: mfd: samsung,s2mpg10-pmic: Use generic power-controller schema

 Documentation/devicetree/bindings/mfd/ene-kb3930.yaml          |  7 ++++---
 Documentation/devicetree/bindings/mfd/ene-kb930.yaml           |  6 +++---
 Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml         |  5 ++---
 Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml      |  9 ++++-----
 Documentation/devicetree/bindings/mfd/ricoh,rn5t618.yaml       |  8 ++------
 Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml      | 10 ++++------
 Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml      |  7 +++----
 Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml      |  3 +--
 Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml      |  9 +++++----
 Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml      | 10 ++++------
 Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml      |  5 ++---
 Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml      |  9 +++++----
 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml   |  7 ++++---
 .../devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml          |  7 ++++---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml         |  6 ++++--
 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml          |  7 ++++---
 Documentation/devicetree/bindings/mfd/ti,twl.yaml              |  3 +--
 17 files changed, 56 insertions(+), 62 deletions(-)
---
base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
change-id: 20260804-mfd-syspower-a3c8b6a467a4

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

