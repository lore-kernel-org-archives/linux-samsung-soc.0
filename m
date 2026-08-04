Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6233D46D084;
	Tue,  4 Aug 2026 14:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853205; cv=fail; b=ebO5vWSxNslcBTkvVJSFNDc19uVunjUIceeA5FYvRS1qtGQdPeHZTDALyK7VBxL/LBQfCisyI1rOcpFtxcbQWzLkdt1XQV/ehPSu56co9F/Ia2feN01/yQ7gtRKyIlSj/KGRFRmFDsNLyCuRMf6Es+3EWVDNQgsorEUSYbX+YQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853205; c=relaxed/simple;
	bh=lmGYg6JiZWqGc0s1l8RyD5q0rzJw/9/n3/6LguGerc4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dWiBVxmVa5Wae6YTatErWRlb8NBAw64zhRTkABmrWHcWsc8OlMSkQw0yMS7SdnFk5iTAWXzWyMDlgksFi1ddAr/gh/lwFf75Zjtajbm58Ioj9Bsv0/yPSCpEHr8AgJHvEPRt0kQk5uYceGLR952BF68sE00vmdAjEOGHKfLfUU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W6nilFIe; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W6nilFIe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mENO2TlDWpACBT1atHNRZtcYXaolYp/vLCXZFx0ngw9PUMrJNhpmO5zAkE7hMI7ZGA7azd5O+4Ulx5VZJ/TazTdMGQUf6w7fQRr0HmYchzale47qwg2Y5wen8NFkLMvXyr66NbJ3p8Q60dsBjqxGnh0WCxc+6C09NdYFkIsmZl1CUBhACbNFQgDeR3oNEtmRfNpBT0plasLy1g2IEAmiitAC3WH9f2GpVq47bynOJqKA25KzJiItqa95DWMM+i4Zr5crgzJW1Da7A97KWI70a+l8ATo7b7CLUxd5to1hyo+aRDXjC7uIERHIzw87NBZCa+UoS2+v8zZMPgWPr/Ojmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkJ8LpTK2brJjVOKTbl0XeiWAeIVeUTRLOe9U/oidKQ=;
 b=Tg0dzhdxxB/UiAqJHRFL3Yq0D6xmboTCPrEwW79e7TI1wATSDhdgNMfZZRSt7DoWBsFbfiR38c+gsBBgks5tUumCw9tNzRlOJtHTQ4HmTc+fxvIeiLJgZUb99ApeMDcaqLgtTW3gnr44egnBzl9Ya1fSjzsr8XcWF1JxGdsv6BiMsrTvyUYnzMVI8dtoFUt9IZHYJle1ystoEhMfjKIsIMQd0GgbASfbs3KNW0/Xpg6mCe3Hm5eknfuKsaNrDHTdDKYvO1GIFsJo7J79IA+e9q16r3LEthRGDrZFViZb+GTL4qmX1Tvy9QYiiVHcNBxn1At8GT+S6QNo/7yF8azm4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkJ8LpTK2brJjVOKTbl0XeiWAeIVeUTRLOe9U/oidKQ=;
 b=W6nilFIeu6P7Xs/seMJtrI9k0em0LfbCBmPdflpiZh7Q4C7i3WphaMtHiIfdA3TtBxgzZKZIan5/GxswU0XpjBaDe433jwX+Q7hVqQCf1yI1maI/9wn4Be47waeG7Uyn+YnvD+GXfCCuqZG47ldn7odlC5FAKZoNcxIWxVCqzEQS0eaFSnBCLeeD8gJZ1xbuDD16JTyUW+5i51cLALlJdG3vYM355O3zDH42iZqbqnAE3YWB+/AvnGtORpfgdCTteZSwFSmUpwg8G+IH+2nYIZBaGz63+AoreURgusCKjPGoIim96/skpKv3t/HJCBjxOITqvyoifbZMxeFAvWax7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:19:26 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:19:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Aug 2026 22:16:42 +0800
Subject: [PATCH 07/10] dt-bindings: mfd: ti,tps6594: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mfd-syspower-v1-7-a440783c2e78@nxp.com>
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
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: f442ff29-c0f2-4ad1-f9e0-08def233632c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|7416014|376014|1800799024|921020|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	es30gqZAgN9nCDFvMKNg6fwYBxka3IYKKq6pIpn2ZhsH/J/HsJrpjjH/4WyTPf2vQBrClB5JlkulmosdhVX4YznBF5AWl1qHNVpH0gpdDEJZuClXHUmgfFklcm7tF5o2GXmderpLTGDj6aK2Gstvm/3OsiN/bwkZfnK0qd4vvmbU4QW2wHWmJJ7BMrVzgmz8adQTmiqtAXrIQYL2zEfde9D53XqlX7tlHbMvT3y6FyZxLnHDPghU1ApF/YYanbwdlv2SLia8ZSZHHXAJMcGPSN1GobmqWYGRCbuSKfyMhx6igZnGpnM+B289phvKhdc5MDVs0HnvaSuyGzRCeL308SZ/m4mHhs2lP41CQ2ffwkG3741BTFieLmZnWQCVobfTEjXgEmaCCdVkQGgsjDkIyUAYOkFTVdHAecIjkv7mcQ6ofbF1ZxlWB+6GOhGYnYbMn+EF4Ijt9kiRTqWIw/hMRkAk/do9AifirU4cmAMgfUWOXhtLtGxgY10ZKJyeJJFm6cnbh7Q6cn6bdHHsFDwRNm4bVW5r11zTFPuGpiQaFo1STKthnysmuLMxCjxh5kCMjJVxRVdfKbG48uYLvRYsGOpaAvNrwDUUWsnzgaetNK9QVDGEUj5n437jY+kWgKLRRprzSmdKNc+48rC0YJCOz7BP4QkfWKN/GcH8KS2G5/Qqewta3WXH+zlYfpXHDfysBL4GwZzWEI10EECATVs1fA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(7416014)(376014)(1800799024)(921020)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEw0RG54eS9aQUlOWVpLTFlURkl0cDVhUlN4QzEvUGlUTTlOTUVnWk01YVh1?=
 =?utf-8?B?bmNWcDBnZlBydmxUY0F0a0xkTitDRXFrNmpaLzkzK0NtNjhLU0VubjU4RmRt?=
 =?utf-8?B?R3lPMmR5bUFKNmMzQ2JLdE5EZmdLMFZ5YTNad21oVnZpTzZnS2YwT3FEbGRI?=
 =?utf-8?B?WXoySHVpQ2ttamZ5TjJrWXZoUWdBamJnZnlJSHN1NTd0SG1GRUNTNmUrWk9M?=
 =?utf-8?B?TzVKMHIvaDJwSWRwMy9VU0hwd2o4N2ZncU9lSi9NdlZ2UTBMNUhKU21JcHFa?=
 =?utf-8?B?MUNyMFVVTlV2Z3BzRkNNc01pTkd6WWNYM0l4UFYvTjdObXR3VmVLU2xXUEJj?=
 =?utf-8?B?dGVMK3lSeE9FMEYvY25qTU9MSU80b0ZHMUkvVEdIZm5JU3FXNm9yWVNtaWMz?=
 =?utf-8?B?UHY0bHdNaWV1cUM5aVc2UStpeVVsYUVHRXVod0VCNlZndkRadkY1cEpvbkRo?=
 =?utf-8?B?Zi8vSU9FdS8yQ3EvWk5SYmpqM2hRbWZBclFoSFJkVExQNTNrOE4xRVlLNG0y?=
 =?utf-8?B?REJHdVBBMm1Ga1ZBWXo1enRzMFNSbkpXZUJBNVB6NzFsQlR4a1cyNjcrWk81?=
 =?utf-8?B?ZUo0Zm5rbDVyS1pTeFZXVlJkd3JPTnpldEVzWExsblJXNm4vTzZ2SW5leXQ5?=
 =?utf-8?B?TFVkOUJRZTIySEptTzJkQWNxbUJzMjdWOXNwdzd5ZWI2TEtrem9xVGFUWk43?=
 =?utf-8?B?dlV0QTRoU3ZUVS83ZkJOZjRYT3dENjE0WlB4YmhpQ2swNkxaTzJHVS9GbVBW?=
 =?utf-8?B?bm1JUldpbFZpaDZTK3huR0wxQ0JvM1VQWnMzcUxiU1NPN25wQ0ppQThCOEVx?=
 =?utf-8?B?TzJ3TWxzY3ZUT24reHdsdmlGektsNUE3TDl6dEdmL3M0TmRwSGNZWVkrRm5l?=
 =?utf-8?B?WkV3MTlVa1EyakFCMm9SWGRtRDNUbGlMZk91Tm9HWGYzZWFGblNlUTkzOXNm?=
 =?utf-8?B?QWRLNHNGeDlycmJKa0svRi9CSXVzRTRWY0FOWFhTNnl6WDlmSkhJeXJtZFgx?=
 =?utf-8?B?TnM0aWlUOGExSG8ybnh5a0RWSmxSS0VDNzFvdmMza2txazVMZWI3S2tNSjg3?=
 =?utf-8?B?WEN5Z3djdm1nSFI3OC9KUkZ0ZHNnMlp6NWZvK2JxKzBsaGo5RVlyY1laNEpQ?=
 =?utf-8?B?RnFCWnJKWEM0OE5JRStySFpVaDBtdDZtUjBoUi96M0M0ZmdVbHJIRlZnYWJL?=
 =?utf-8?B?SEVUWXVJc2lvS0l2Y01Ia1VYL3VJWDk0eUpET3FUVHlGRWxVOWpIb0NpNmJp?=
 =?utf-8?B?SGx6RVZKVnlSNXY4ZWlmS0hDcmVIWHZ1a09QTUFFTllibXA1bjFXVkFSRE1M?=
 =?utf-8?B?MUdMZG1RVG83MUY1b0xPeEZmMmp2QlZacHgyTGxINWhFSUxXamRQNDZ4K05p?=
 =?utf-8?B?ZTNpZ2o3L0ZUUXhBSVJMbkk3UjB5RngrQjJVM3lPTFR5TGVvZ0FReCtqMEZ2?=
 =?utf-8?B?Zk9TTW5SSjdrcnNtVG1rREdTMGtmZUFZVVg5dGVicFRVWk53RUZldWhDanZL?=
 =?utf-8?B?Z0swZlF3WWtUalRpdFFKZi9FcitFOW0rNFZSZjZwODNsVS9hZVVGQUlCUXVa?=
 =?utf-8?B?Nm0vb2VFOGQwVmVFTktoSmR2L1o1N3doWmZHdi9KSklpNXJ4SG1TMDBBb25L?=
 =?utf-8?B?bVJ4dC8xQzM1R1FUdG8zOGk5NmZEdGpiTjBDNDJXN2xHL0NsbDFaTGpjQWFT?=
 =?utf-8?B?SlBDcWFBMXNRK3RuanFjaWcrM1hxdStBOWVrd0Z6SU90L1ZmRkVKamZYekli?=
 =?utf-8?B?UTEvWmtmck9Gc2ZoTkxDTm9pc1c5M3lGM0MvUnRXUmlHUjdTVGU1cDdldmdE?=
 =?utf-8?B?S24xT1VPbXJhTnlxMHBPQlFEWHFXaUVWck9OL1ozcXBFc0xyaSs2WklWY05u?=
 =?utf-8?B?d0VtSWNJR1FaNklyTzFDaERmNTA2Q0RhWXh0SE5kWUllb3k3RWFINlRZK1gw?=
 =?utf-8?B?cVNFd05SUk5SZlJKbWkxdkdiaGRlcndTUkVGajN4MXVCMFNwWTBaT1lVUDVk?=
 =?utf-8?B?dk1Ib1FKUVVYeEhhdU43c3p0bGNlZlFrRXdUWXNoWTBzTURrL25kZEltbHZ1?=
 =?utf-8?B?VFpyREpjeE9ZbHpEeFgrOXZPRmdUSmJaU1RUanNhN0lnUFFXa012Y1ZlaFJ6?=
 =?utf-8?B?ZFhvdWxhMGNpL0F4ckVPZmJnb1d0VkM2ME8ydFZJMUpKSTBMbTg5N3N3UXVT?=
 =?utf-8?B?d2xpcmR3TEVUTWtFaExzdFN4N25WOStDU3g4bHdiaWs3V20yVmZ2SkxHNlcr?=
 =?utf-8?B?MUc5OHh0bCtadUhQeTEzNGJwVWQrSGJ4TGhlNEw5OU5od0YvL29RbUN6eVc2?=
 =?utf-8?B?OVFMRGRsa0JYbGtyU2UwK3BoQ3FhU2pwMGRpT3Q5RVZoWVFudWF4ZTJ0cm1Z?=
 =?utf-8?Q?ZBUJOhVc/jhaq2IzLYSgdVAzV7vLpRytdei+X?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f442ff29-c0f2-4ad1-f9e0-08def233632c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:19:25.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrmJqUIQXILyZ66drsAkabWICQ7e6uOG4+7uyRkzxAEuku7A1wSJBzoLl0ztw+I2EROpRS4I/xM5GIsXWzhnbpbvID3q6m2RgdCjPMS/3TfRS7hnYSco/4KGyYY32dwA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9135

From: Peng Fan <peng.fan@nxp.com>

Switch the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
index ca17fbdea691..6a35cd358590 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
@@ -15,6 +15,9 @@ description:
   PFSM (Pre-configurable Finite State Machine) managing the state of the device.
   TPS6594 is the super-set device while TPS6593 and LP8764 are derivatives.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -38,8 +41,6 @@ properties:
       device on the SPMI bus, and the secondary PMICs are the target devices
       on the SPMI bus.
 
-  system-power-controller: true
-
   gpio-controller: true
   gpio-line-names: true
 
@@ -104,7 +105,7 @@ required:
   - reg
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.51.0

