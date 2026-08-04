Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013014.outbound.protection.outlook.com [40.107.162.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7093EA979;
	Tue,  4 Aug 2026 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853157; cv=fail; b=m28aKP/rc1PYRTENcQh6Iwx+CzpU/Go8nbCRF2HY0VpkQuQRT6O+lqeboZAJM3XvUFvDxwnqAwM+qxxorVv414pdMIKr1VEm9PKOYEL3OtUXAEfetPcP++70XHe+gfTqCLRVHBSnAYlrQWvhz7ebVCIQT2asJmtfHNfZLOz2yuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853157; c=relaxed/simple;
	bh=LWxU73vvfVPcBoOc9olL2Fui54P4BWZM6yJIZcqKWU8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hWawNUPJwdOC4vOJyOnr7v23+l4jOV82vebf1u3UcmyrGSQ1UBLhWBguLwYU7e4uf7Yw6GJC+LpZ/dZLnrCahfOsJYH111ZQZCRXrE25A94WPB3mieNY8cdTluOrZLzmnUUI/s5bja5MEYlI15GKLc/BPCCCd+EbIp9WwGKYkyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=swxF+anz; arc=fail smtp.client-ip=40.107.162.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="swxF+anz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ibka59VLKzPWx7HBqKFqgBEOVKy6Dhq5jgYcP2amDuSffpoiX9bLteBHp2Sy3vMjMcwpcmhNY9Oc7WIq79VKm4lgshbf/DmHyktqdvniLlv5eTU2rGACVzyVeOiws7XoSDovAjuwCr7i0p0CUiA4Xt14X9dkrd/+rduCPXtq4dcoA6+xoznOp9TugJrzQGeDUhwWq8Qe3DUmyY8FUv9cyz/VT+xHA0jwmH7D4/hlSduWWMeM2yjXtbspI0UgnDkKTdMloc9rxIOQbm6lUENCeQuIRp8CRZ5qVIgLHg4y9NTqhsZjBRee+C6KClIHx61BdkOYpqNtqUJWWPSwEbTlsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19UptVd17ftfbMJmaSEejuAelU9TR/kAxOOAFcKg278=;
 b=Og4ixQL6WXUK+kPPCJ8LZorW7/g6vuSY2ftO3q1qLdcChM4U1x+sTlDxMnXaLMLgQBPW81k6wvdTFj76HtTCbnZhhyVyKktuu3a5EcHo/eM0rLybRBuYpuMgF8WEP4l27c8UDxmo1GQyq5tLW6PfcYr0btNhJQRJE9xjg8YV3GHDRi7TSaCictZ2agTwCOusTnamqxEgCJ23Mu7mSn7p9F1AKIydxWTNyelGlc9PMl4FCqwteg/rZUJAFwVKgPtciVu6LY/GKyD/HUXmLziT7tdu3onzgYXgq5kfWINVgnKfJuNBx1ookCcy1fMEF6tIoKAgPwSPeJlXcqlvASZdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19UptVd17ftfbMJmaSEejuAelU9TR/kAxOOAFcKg278=;
 b=swxF+anzjq3l1/V7EI56+42/pfucIMUnkZXEilJM9R6ERJamqzMc8tjSt1c1Yxxj5gU0RtC9qPMUff7RnvHIhl+yG1QzYnmRKCey6AqOpkK0jz+/9dPxJHbIaZuy/HqQoIsFzEHQqhqZP6AvD0tiZ9fl/MaMb3Tn/TG8gdIcxc759dP57/MmpCA/SbqKin84xq1xEYqRRylLX1GeoIWq9VpfZIowKU8zDGwpOQDJoUvCXSLv+qEhNnRHVRf527OdwsEXlhXzij7xvm5gEDv7MxJb06Q51M2iwPa9CbPu0CIBng/lcHYn3j9JvVty7JYBx+JB7/0ZO01d+M4V0ywoBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB10524.eurprd04.prod.outlook.com (2603:10a6:150:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:18:51 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:18:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Aug 2026 22:16:36 +0800
Subject: [PATCH 01/10] dt-bindings: mfd: ene-kb[3]930: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mfd-syspower-v1-1-a440783c2e78@nxp.com>
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
X-ClientProxiedBy: SI3PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:295::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB10524:EE_
X-MS-Office365-Filtering-Correlation-Id: 2addc8d3-a64a-40b2-5294-08def2334ee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|921020|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	XZYglowxDRqF/GaM74581uRrdtolx/SbG4TOZp2kCy9HBkjs2G3DXlPsF4UGzSYK1JdvSIhIv0YEbK25VCoCEjFpBahwV26hmsiLKykjb1+q8oBaKY5tSNhbT2WAE0yj/xbflHxa6+hx1YMA+6l5o+toM9NSp8jZkwqLkrABX6dxjcQ7g31HJOqaiNngbLpPdKerTxwFa3/TN3ffUFsaFE2XeLKiNDnhPVSReNVpwr+CpSNikkD2BIId+xFHQfWYa+NIyvj6y9W27nb1s2F8nThUznYWXgAFUhTvqBxkfK4EIb303ydVE/47uZvk26BI5paMT1q24AReRShDGB/NBbBQx8vhTo2ZcwVH4zQWzOzZnOeZ8TJmOLxlz/CauDZxGc+ZDsoqFt7FQdJ5dDE6M5L9r/vPG9XSBaTh5iFGPPTwTVjROhiEECLCQiZya2G4TxEo4CFLnOQYf/Ui3bZfrMIg9U9kt7sEzPzI7ZsqIBdYVnnxJvjORVBuY7Zpx/raxUQOMbzdEnI+0JaCjHWmlTvBujAtYqAWiVKJ2gumDxLG75z9XoDxmGmBnALC/CO/l9I6FRWfuAfDY9XxhIWWl8ZvhyjQBFKciuiytxYaGjA9pTpZYUgoCFGYZu4Bu4QIhg2B+MdYpEEbAv0LNpg0sBDkfdo9mw5XNl+9ztJr86Ic6wSkVvd9lA1IQSWfH2ynP0rA9j7Wtzyk64Et3LprUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(921020)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1lDODJMTHpBUDVIR25FeFJ5VGdhdzVJMGJJTlk3U0UvamcwTnllOUJPU0w1?=
 =?utf-8?B?UnZqamx4SHkyTmNqT2Q3dlNrd2xVaU9WZ2JkNkRkckFvckFQNXh2YS93azEw?=
 =?utf-8?B?RWlncHFaUUEvWU1tZ05kcjVWaGFCaVY4ZGNwVGprRU9PVzhWSEtHQll0RmNK?=
 =?utf-8?B?OW1YMXBLOUsxVWpGa3RSaXNJdkJ5VXlwTFNJZDNVV0U0czNzSHpkZFFuYlNY?=
 =?utf-8?B?QmZSVkI2V1htYnJ4L3JvQi9ENVFHaVB4eGxXNXE5M2JBWnM3TU40cldEN21F?=
 =?utf-8?B?RHVkN3FHVkZ5S1M3emszbGY1YkRBOUxOTDVsKzgvbW9DaHFJbDZwMVNIZ1pI?=
 =?utf-8?B?M2lBYWZvNzBlcUdrSjQ0L2V5Q1hiRTROZlVucDdqaDFFbEdlVDh2aHRaYzlL?=
 =?utf-8?B?RU5rUk9VTjdqR01tdGdjZmtHckZ3OUI3Z0l3bjd3bGwzTkhua0tRMW01NXRz?=
 =?utf-8?B?dXhycWo1bmNvdFhHcy9JZFNLOWNhQVBnU09uUjJpSFh6TjRRd2ljYjBHRldx?=
 =?utf-8?B?SDFwYi9tRXNTeVNHMUVqKzRwT1QxdnVFVTNmWkpIM0gxKzM3RUpmYjFBYUtJ?=
 =?utf-8?B?VTV1c2lxb1k5VlR0Sjc5cHJ3OXJQK3JTZnBHOVFSMmg4WGlWVit3aWU3KzVO?=
 =?utf-8?B?dEtkWnVhQk1STFQ4TCt4NVd4b3JzeUMwZ1c3RW01VTF3OWc1dHJvZFRDT2JW?=
 =?utf-8?B?K3k5ZlhMdWNsOHh0TmwzUi81U1d1dXU4NU5TekU4U0ZxdnIxQklsM1ZoWSsx?=
 =?utf-8?B?TDQyWEZVbldqWUtiV2hWa21WNVFkQjdKcE9RNms1VTZGL0ZzWFJpSGUwazJ1?=
 =?utf-8?B?TXJIaXd2SEE4Wmwxb0Z5L2lFQ3hOQmYyTVR4NnFBSmMvVlNlWFZyZUJ0cHRI?=
 =?utf-8?B?Y28wdjZqbjZzTk0yem42TExISm9pZVVWc0ZtUVhnenMxTTJRQkJzbjRmcCtJ?=
 =?utf-8?B?YitmOHRsUkNiK1NDZDZzaks2elFiYnlpRUJnZFEyU0dCWGFSSENzTUhIQ05P?=
 =?utf-8?B?Q0hXcndlQjBrNjJiSlVodDFIOVg2OVJpVnVYT3VUV1lPZHdRcWJ4d0RpbHdC?=
 =?utf-8?B?OUxpZzdISlE3VjAzU29EQ21NTmExVG9oVFRtNWNQYVdnd0VZbXd0ZDFyU2Jw?=
 =?utf-8?B?dXpWem1jUWYwVHB5WVJLbWVyWTk0ZjBCK0xUTlE3bC9JL2s3RGZBam83NG9j?=
 =?utf-8?B?cU56UEdsMDR3eVFtNDVuK29SMS9GZHZ1enRWaGgwTm96TlpjanVvNEwxdVkr?=
 =?utf-8?B?TFA0a1R3NnBRQUlYMHdiYjdwdnlUcHhtWWtLMk5ic1VlWkQ0NUZVZXIvY256?=
 =?utf-8?B?K2ZsKzdPUXhCMGQ0YUJpaXAxNDFqRHdyZzRtVzlDdFdXMUxKSXJZQU9mRVVh?=
 =?utf-8?B?VFFqUUxNWHlaNC9hbDVyZkNneVNGMVJWZnI4Qmxvb3owNFFFYlJ4VzNvWGdp?=
 =?utf-8?B?VUZUMUR6T0dodVkvSVZMZ1RzZXJvdzBUWHMyWmo2aHhFaG1jNitkQ3RocUNv?=
 =?utf-8?B?eDkzbEhWSEJWOEdlRnRmVmRzRGlScHNnL0ptRjgxVzBlK090WGJQRjhmRHFS?=
 =?utf-8?B?YjFCWERCNHh1SkhXMWJZV3VtMnhwZ0VmazRJQ0pYSWxtZ2taUVN1L0JHU3RL?=
 =?utf-8?B?RmJVa0JjUUhaeTE0SmZKY2hrRlZVY1NCYnpLajBrakFMdDVTK3JUOVVESkNr?=
 =?utf-8?B?ek9xZkxZRHc5ZHpZZENkOTQ2eFQvcm80U0U4T1BXc0lKOHpTVFlmRGZ5WldN?=
 =?utf-8?B?RWcwajZOdGFxK2lHbmsvWDJsSHFLaWFKQ3VsT0FOL1VrbDdmMVpsRmFlR1g5?=
 =?utf-8?B?WWhlU3F2TWUwSTRadVZOaG9HZHZROGRmTndJTTFKRFQ3ZTE0K0hKbmxDMHdZ?=
 =?utf-8?B?L1EwSkoyNHU3U0tXWmYzbzh5d0FPaGVzc3hXQjg1MU95NnJFbzV2aWZ6UVJj?=
 =?utf-8?B?SjJOdk40Y1NJWGVkNVo3Ynk0Y2oxV0ZDMUN1QnBNb1VDSHcvWTd1dnFJWHhU?=
 =?utf-8?B?OC82dFJiSnRIVG83T3Zwa0V4MURtVXdxWTBMcndYdDE5UlNUb2ttVlUxWlhn?=
 =?utf-8?B?eUFPcnRWemxRRk45RzR4OGlJNGkrcjdacytQR0ptKzBRTUJpWHd1NTZYRkM5?=
 =?utf-8?B?MXBoOThFUFhqZGt4NUdscEZFYUo0WFhiT0IyR1FHWi9RemtVR3N4Q3cyT0Rm?=
 =?utf-8?B?K3R2TXRaOG9nQi8wVmVQT1pKYmEvelplK2FtQTdMU0FxRmxOOVZjYnhjWUhl?=
 =?utf-8?B?UDBrK0tzN1pHbmtlVUd4Y3BwUVdXREJ6R05IbmlKSHEyNGl2WER0a0Q2QlBk?=
 =?utf-8?B?N1Qvd3gwdFVLM0ZNa2JzWHlDcVllNjNuVWtQMXJkd050SlFSMXNweHlxYU9q?=
 =?utf-8?Q?mNDSvkrK5m56Zieut54sNvtLZ2wI8oRas2DWH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2addc8d3-a64a-40b2-5294-08def2334ee9
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:18:51.8457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUOQz7VSLuA2Vtm6E+IaQzSi/ejQ2aEgBsOaJj7mdtjpE1f+pOK6EoNlNYONPyig8FBgAlRrtWvKpgx7rgy5WTD9RBBWWKIPqpW4oY0WxyrUVu3YDDEvJxPnl4XzLLFi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10524

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/ene-kb3930.yaml | 7 ++++---
 Documentation/devicetree/bindings/mfd/ene-kb930.yaml  | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml b/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
index 9b11b6e2bbf7..1847a6d5b22e 100644
--- a/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
+++ b/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
@@ -13,6 +13,9 @@ description: |
 maintainers:
   - Lubomir Rintel <lkundrak@v3.sk>
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     items:
@@ -26,13 +29,11 @@ properties:
     description: GPIO used with the shutdown protocol on Ariel
     maxItems: 2
 
-  system-power-controller: true
-
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/ene-kb930.yaml b/Documentation/devicetree/bindings/mfd/ene-kb930.yaml
index 02c111def5de..e0c8abf95bd9 100644
--- a/Documentation/devicetree/bindings/mfd/ene-kb930.yaml
+++ b/Documentation/devicetree/bindings/mfd/ene-kb930.yaml
@@ -13,7 +13,9 @@ description: |
 maintainers:
   - Dmitry Osipenko <digetx@gmail.com>
 
-$ref: /schemas/power/supply/power-supply.yaml
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+  - $ref: /schemas/power/power-controller.yaml#
 
 properties:
   compatible:
@@ -24,8 +26,6 @@ properties:
   reg:
     maxItems: 1
 
-  system-power-controller: true
-
 required:
   - compatible
   - reg

-- 
2.51.0

