Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013014.outbound.protection.outlook.com [40.107.162.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B171D3F3268;
	Tue,  4 Aug 2026 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853168; cv=fail; b=gIKA141Ksh5AGOKnQCmkzbaJUc6qhU0y7pBGensNH7upgahiNuJ8TMynMkipMUfu1TG0buHoxxs4wz4ulabl8EqFOa663gWbDQOxr6cbMPA6f2mtnOyym6NdrIPk5M098WhvfFvT0gkjXsQUm09yny4wjKHdX+J7414ZMOyo5rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853168; c=relaxed/simple;
	bh=LI0nZyb2itRjpecWQzfWK+iONjJzGYukykMAUIt7hWA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lVklbXN0lTqcy4w9E/iF0SDXQAIpty8/B2V2iLzDIRbqoLp3QSoChQ+wWFb3361u3sLoPN9nV29jAB7cRt7aM5W6XIICJ595AHKqzprzSJa1LGRFGbcD/pL9/8VLaofxqI7uGxscAQ0hKgc10E/voAq0xbZXSpqo6HQ46c2k3pU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RzqYvUFS; arc=fail smtp.client-ip=40.107.162.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RzqYvUFS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzchpdOX5KcHTsOHPDsO63I5yejCUYK2+xHlggZ4uV7yoyCDFLBk2x0xTXBeN3inV7k//PfNxBM1dTax87SPxwHTeo1GQeFPxTibRFF7S4eQSF1GmamA/+QBTcYmZWLZxiHy/uhVjgmapiFJVOemxqaenZ/EJhK7Z0gr1F1doKwSoLTV+HtBSlAfVfPVN1+thIK4tLvFqgJf9KqGvAZp5XKObnlJvHvXhMA96qah8HI93dgENA+T8tkyTsCz135Z8VRGva2cp9kjJKnU4bA8X3MqlH16CdT1N5vIOLwPkWGhis+z4ucphELuEmWVwzoAmNytGApyZxreL+zVO2i/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPpIofsma5a6SJnLV4dINBlaFdf9jC5h6QSuYF3n3eA=;
 b=PJdVyVwHGal1NtQkIly2x28Y++BdEEqgb6m4DQ4itk51Tr7oaX4W/SCq9QeD0BRIbKWJeEC30jtXet91ZPJbQVJqWkupr47tL2MYu4D2EMhhAGaWnwJkQ4UQgMLbkQHBr08061+/bJJ47hYiUCpDSpPuiwhA2oXQva7g27nep8JOdwfsJVCX1NTeU1A9qVRsNl+ROIwSAj4grdn3r/SNYFsXKs25DYcj2VkTvsc3396nLBwqX96+fMwcTzHquZr9ypMTLe7jW8aivlq+3zCgCf4yqo3lhCRqKJynVq7CfFzQ2+lrwtphIRpZLeK8mWF/9utjyw6fLnU4FRSCxziHBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPpIofsma5a6SJnLV4dINBlaFdf9jC5h6QSuYF3n3eA=;
 b=RzqYvUFSxA/buY0iy0FN+bmaZ95BwjUnPL+FRMmJvZwr+giIQf2DDWdtaZr0k2qTMhfC97/YnSRBeRZQqUe+L5+Nafs5Oz7PUZf0YsDIu76AvRPVWTWi58Rcx/+S2w9UyM2Yh2h9BAfzhTqBnTXQDwu/4LvppbcG7ojtvYDUFAPXpuxWN6NZ/JWBhvjJ1+1ddTG6+eK5uRScmblr2YfyKoQfpXtyFLxe7o8VPYbku1nnVQCp/MWc2E26Bv1/otzWTBeqmP6T5+NV02gR3G2aQyleTIw2j0GhzZNgDx7al1aslwB7CYkWMuviyGzlHU/EC+IeeTHt8ceVwlmAKMHS1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB10524.eurprd04.prod.outlook.com (2603:10a6:150:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:19:03 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:19:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Aug 2026 22:16:38 +0800
Subject: [PATCH 03/10] dt-bindings: mfd: rockchip,rk8x: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mfd-syspower-v1-3-a440783c2e78@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB10524:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8bfddf-51e3-46ab-afe5-08def2335602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|921020|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+PIRLNQ2p2ee2VbdQ6AP40Ati3DQ2FPCGcAfSKxpDvAZZwf6w5q0YEDcqZAH0hQX12YUyGHB0cyJ8ruDaTNIatXhnWEajWKao1sEALniByNgEOy5UKy5ze2e1ZtGzurJ9tQaukXGr6YTGsh2liyn5M7Ub4TNwcZTAstZisCKqcyza4hH5HYirAxMNxw+Y4Gvq3RIYvabMnwqiN/Qr0+OlyqgeayVeX0Il3GMk5vMdacryzdO0bhv1r43ar9Yq3x1THxoHYccFSOcDZF1idFNKdDPm2fPafyRXQUF8HWqZXYgcAsxWsU5ZxzgP43Q8kZMbFKQMGmWlGHiRQcB+wgzarXzUM5Zy5M3YPhrNecb8qsOeW4q7ljRamw1KMR0G6fWHI4Cy2p1scSTMPHq7blNHcTDJkJVpACx8tNq0iLBnoeEXKrpjH3EAoGxsXMBhtMpkRoVD0d/xYc8lNpFQYSXcUxVPfrIIBVvUTHhZBEv3TThMoGpS3YMbdWeYqKrfrvnCKFOlvhJ7KHxt1EI8J53q0gNT6d1kkA5ISfaBLBak5Y+8IfB0xZXlOXooVilqg5MRkeZdc5mTFTlGpBCFbXHHovVvx/1OUzitCVmwvXkip2d9+vt+EDBCPXvSSPYIGqIIr26MsF2fHzT8V8smIJHOL0y2KiPiyFKalc/MXW2liu0Qi9jGR4q8qIHmgVcOrHMUOO6oVl9Vu9fxKD47EoSEg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(921020)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUppWFZCVDZVemxpSlZVS3lUODVQRW5GWVJEbVI2OVVkN2pFdWxrNnBidm16?=
 =?utf-8?B?aU1wcWxQblpRbVdteXVYWUJKdWUyVWNqYStQZzN1ejZkTnJYWGNxOGJwMy9Z?=
 =?utf-8?B?blNKeitBM3p5S1lRV1VSdElvZEtSTVlrdlNVM21Ld1o4SExFVG41UjNRK0lK?=
 =?utf-8?B?MUhHT3ZFNE1FdU9tY04yNThyYXVWV2NDMFcwZ3padUkwTXMzQlMzVkNQRDZO?=
 =?utf-8?B?NG92Q3JUZEREbWZ2YS80eHVEZ3d2N0h4WGM0Nk9HcldaYXZmaGltU2ZhendD?=
 =?utf-8?B?c3lOUlZCeVJiSzYyQ2xSSGd4TGpoRDZBZU5tU2ZacFFzL2Erai9SbTF5TW5t?=
 =?utf-8?B?dXZhcGtndkJ6eXlZNGFBQnRMTWRseGxweTJHWi9qeXNlSXNDLzRRU2doN3Zu?=
 =?utf-8?B?NTU5Qm9lRTBSMm1yOCt3ZU1FSHNHOTkvSkM0MG5EUEN3d0lPS0FNczJxZ3Fr?=
 =?utf-8?B?M3lzVVM3dnh6dFVOWVMrNFBGVFZkc3R2TGFOQkRqa2pweHRkYjZyMllucno5?=
 =?utf-8?B?QzRodW5WNWlLRFJJRFBTTzBEcW9zTTlIMXdxbFpYckJtRHFyVmdkckV1bGxj?=
 =?utf-8?B?RjZBUlY4NTUramNDSWtEWHpjY3ozN21qSEc1QVR6UUhwcWE2VUVNTy9KUzlw?=
 =?utf-8?B?dkJhckpFKzJIb2tydHYvM1J0elAwWlgyYStVMXduNWI4U2czUG9uMnFTbWVm?=
 =?utf-8?B?Tk5GeEJiQnIxZnZnc1UzREM3SG9nUVRNZGE2VUtabmdUNHN5cmI1WTdqZmRm?=
 =?utf-8?B?emtRZ1dNeUhoYi8vdXlxbUhndFJXcW5kWVliRHN0a0ZnL1hVWkxtVWZsMmdx?=
 =?utf-8?B?MnJzWVlldEIwdm5BSnhRWUhZRG13RW45NVlZSjNjOUdqdGFvWGJibG5CY3dR?=
 =?utf-8?B?NUZYWE55NG9TWnkwR012S01hUXVxWVZDTUUrakVrQlpTWnpidklwdDNZU3NC?=
 =?utf-8?B?dU4yN09WVHQxL1lLQjVSQTZ2bmJYL0crdnZMUDFnemp1UnhLRmRTVGIvMkEy?=
 =?utf-8?B?aDdjQ2dXMkw0VjZuRmJ5T2FadnJyQVE2SktCb1pYU29wTnhOK2szNEVtajBx?=
 =?utf-8?B?aFJneGxEcW9tWkxxdzNKU0c5MzZjRUI3ajVpc2h5NkdGK2U1eSthUXlKUHpt?=
 =?utf-8?B?L3Q1S0Y3amNveExxUjl1OUYyU2lQY2xyZy9xdW8xZlgwb3hkeTdMZlJhNHRN?=
 =?utf-8?B?TlhyMWlEeGJ3U29KdUhzQlBMOWxxZzlwQ0YyNjNNSk9xTUlqUmM2YXJaRXMy?=
 =?utf-8?B?RlI1VmZGS3RYaXUxbVNpWU9GT3IwMW5YYzV1b2pSd1ZPa21vREJGQ1JxbmpM?=
 =?utf-8?B?dTc4MXJ0VDA1TU10V3BVUjBUN3Y2UmJvdEVYRjRaQkJCaXI5RVdHUHNiTkxs?=
 =?utf-8?B?ZG1qeHUyZGI4MHgzZjlUOENTU1VERFdoYU5pUWM0QVlHcXVCemVrZElpQmxl?=
 =?utf-8?B?MXNqSHJRQjhUNzh5YkNtOWpNMUtOQk9haEgwTHVIcUphdTU3ODVSRUo3Y1Fl?=
 =?utf-8?B?L2sreXE1TkZJaUpiblFZdE95ZUJGQXJ1SFhXdmJVQnU3NzdwZUlKbWw3MHQr?=
 =?utf-8?B?NUU0cXVTQlllK0tRTmtkMEI4WThQNkRzaEllRHNKOG9VOVhkQzlNZDJHSDho?=
 =?utf-8?B?bnA0VXJBMjBxR2l2aVMvQjVvUkQ4dTEwS0lnTlZFQTJnankyaXBvazJmL2lW?=
 =?utf-8?B?SjA2NTFkTjNxcEpmR0s4YWNGREx5dlFXdXJobzMxbVFIKzlNQ0ljakJxWHk5?=
 =?utf-8?B?aEYyQXVOa0kybDRQMm12UnovekpaN3NQSWhQd1BidUVHa083ZStlcWFYcVBM?=
 =?utf-8?B?QVNFdUd3YmNVQm9zMEdoR3EvYXdiRVZPK0tXNE5zMC9Xd2wwcmJyNWRDRVBN?=
 =?utf-8?B?dGxzYThIelB3SlkrVi9jOGg1U0JqS05ocnZSbWRta0N4aGs2ci9ySVRNbFBp?=
 =?utf-8?B?RmJHeWlVUlVzbjcvbDhETFN6YmVSaU1rSEJjK2NGWU5SV00wMVFmam1zelo2?=
 =?utf-8?B?VVl1YTBkdTBOTnB2bzJhYmJKOFNjY0s4N01wRzhWZ0lOU1NWcEE5Z1IyanhW?=
 =?utf-8?B?cHZFL2tkTEU2eDdpYW5HV3BrZnF3NEhpRysrRGNvSk9VWlliNEdpNStGZFV5?=
 =?utf-8?B?MFFLRWNqTCtKRUFoOXFjeVhwbnZsRjcvRnAwY28yNHZ1SDFDSDlQaHVYQUxB?=
 =?utf-8?B?UE94ZzVFZWZyYW5xRHN5cWtRdzIwTWUrQVdGTGpQdXIyUXdKbHR6MWlDRmNJ?=
 =?utf-8?B?UHBXbEN5ckdjdGlOQ25VNnl3MzZoMm5QN2tZUTRHNzdZMVNwd2w3UEV5c1RI?=
 =?utf-8?B?TlQ5WXQ2MUNSVmlNa0Y3RnkyaHRJNFZ0anJiRUxicG5nZ0FrR1lwY1BuWmRZ?=
 =?utf-8?Q?zsS7ILQxGprFzD9joL4druhp4llYykLNc0W9+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8bfddf-51e3-46ab-afe5-08def2335602
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:19:03.6055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9A/Tbb01SJVcMT4OiV30wh66ff5NcuW7N10b5p/nb4zfSKJ13t0C+DXz8zCBJNEEk+I0aqSkbhjTUfqmn9gBhKAeVdV0Y3C0Dz8/uHaFPR0D+3NYRF1rph1EFSlGQUlW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10524

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml | 10 ++++------
 Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml |  7 +++----
 Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml |  3 +--
 Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml |  9 +++++----
 Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml | 10 ++++------
 Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml |  5 ++---
 Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml |  9 +++++----
 7 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447200ba..5d644f3fbe1b 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -13,6 +13,9 @@ description: |
   Rockchip RK801 series PMIC. This device consists of an i2c controlled MFD
   that includes multiple switchable regulators.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -24,11 +27,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  system-power-controller:
-    type: boolean
-    description:
-      Telling whether or not this PMIC is controlling the system power.
-
   wakeup-source:
     type: boolean
     description:
@@ -76,7 +74,7 @@ required:
   - reg
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da2391530c16..7a123bcd4320 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -46,8 +46,6 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
-  system-power-controller: true
-
   wakeup-source:
     type: boolean
     description:
@@ -87,6 +85,7 @@ properties:
     unevaluatedProperties: false
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       properties:
         '#clock-cells':
@@ -108,7 +107,7 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -126,7 +125,7 @@ examples:
             interrupts = <RK_PA6 IRQ_TYPE_LEVEL_LOW>;
             pinctrl-names = "default";
             pinctrl-0 = <&pmic_int_l>;
-            rockchip,system-power-controller;
+            system-power-controller;
             wakeup-source;
             #clock-cells = <0>;
 
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca31948e..e441c6489699 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -29,8 +29,6 @@ properties:
   '#gpio-cells':
     const: 2
 
-  system-power-controller: true
-
   rockchip,reset-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1, 2]
@@ -136,6 +134,7 @@ patternProperties:
         enum: [gpio_pwrctrl1, gpio_pwrctrl2, gpio_pwrctrl3]
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
 required:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffac8fbf..9bb1467bf5ff 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -14,6 +14,9 @@ description: |
   Rockchip RK808 series PMIC. This device consists of an i2c controlled MFD
   that includes regulators, an RTC, and a power button.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -41,8 +44,6 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
-  system-power-controller: true
-
   wakeup-source:
     type: boolean
     description:
@@ -119,7 +120,7 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -140,7 +141,7 @@ examples:
             dvs-gpios = <&gpio7 11 GPIO_ACTIVE_HIGH>,
                 <&gpio7 15 GPIO_ACTIVE_HIGH>;
             reg = <0x1b>;
-            rockchip,system-power-controller;
+            system-power-controller;
             wakeup-source;
             #clock-cells = <1>;
 
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index a58d9455a1a5..aa2e3ac1794e 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -15,6 +15,9 @@ description:
   that includes regulators, a RTC, a GPIO controller, a power button, and a
   battery charger manager with fuel gauge.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -39,11 +42,6 @@ properties:
   '#gpio-cells':
     const: 2
 
-  system-power-controller:
-    type: boolean
-    description:
-      Telling whether or not this PMIC is controlling the system power.
-
   wakeup-source: true
 
   vcc1-supply:
@@ -107,7 +105,7 @@ required:
   - interrupts
   - '#clock-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d176a84c..4c5d2f43a6f1 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -53,8 +53,6 @@ properties:
   '#sound-dai-cells':
     const: 0
 
-  system-power-controller: true
-
   wakeup-source:
     type: boolean
     description:
@@ -157,6 +155,7 @@ properties:
     additionalProperties: false
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - $ref: /schemas/sound/dai-common.yaml#
   - if:
       properties:
@@ -195,7 +194,7 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c27ba1..d1ca8b447034 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -14,6 +14,9 @@ description: |
   Rockchip RK818 series PMIC. This device consists of an i2c controlled MFD
   that includes regulators, an RTC, and a power button.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -41,8 +44,6 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
-  system-power-controller: true
-
   wakeup-source:
     type: boolean
     description:
@@ -111,7 +112,7 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -130,7 +131,7 @@ examples:
             interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
             pinctrl-names = "default";
             pinctrl-0 = <&pmic_int>;
-            rockchip,system-power-controller;
+            system-power-controller;
             wakeup-source;
             #clock-cells = <1>;
 

-- 
2.51.0

