Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E32D46AF04;
	Tue,  4 Aug 2026 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853222; cv=fail; b=iI9/UgwZKVU47CAiaH3uwRWV8lJGzGo4Tfy+NiRqZmBbQuUCIG0Ndch4P5xahmhd96qF5Mo8rB/h3ycKxFGgIsIQSyvqwFA/CAw4H8/sqDAsxX0yWjYg3h5TLEefzcZoUtLvM5g6IkdQmrwzmP4tYMGI6kb/pX66O4NmvdJWZR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853222; c=relaxed/simple;
	bh=FPL2WIHVRIBrB/6UAlAFgR4Udnv+2MhytWq1QSjWo4w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ka3sbsZi2VGlSbKJplIM4aBEM9CO2mxFf2uILOymZAONmjzWybifm4ESAaLKTOFqPsbtLDDhzFc40xBI3g83NBtBahwZhVMUFYJr/yAxh8xlaztQK04wAQn9lVGC8+BwNJxmMB81h89oCABCyzq7MACKqaqQUyZO+TUnFTtOol4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Fgh/BFWk; arc=fail smtp.client-ip=52.101.69.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Fgh/BFWk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hETNJVXvHPa6sxToueENU87IS3QvoIR1W4fyS7a0fn0hwz9vWu5lf55xa6GaiVBTa5lNLkjHcIaWfbYhQhot1TAAC75LyHpqDj16tXReCqb3hEiV9PAFhrFybLaWZG/6a7E/bMZGSyaRmae3cIqb1BLbZiQ7FMWPKFn9uFz/p170a2xViCVaw0N9gb4jddZU+ec47UWH5AMLCxGXc3Ca+F3zCsXaHpLGw1BGZsgSwOlmNsECbaQyFxI/oQDjB1MrxFzphjEZ0FpenPHBL6r/mb1a5uAQVGPX7GYtF40avRBBid/82PjeyLlP5VmZKpYaHcXFX8QNf3gruzNhWuh6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3BEj554ixw46HCaoRBfSZtVYpbdSOs/d4+H4Gu2xGE=;
 b=BXFOFIMX8KLAIh7WgqOU9Hn9wqOU73jGfZkjECWxoKEzblY1cneDszd/rFCV4IKDiRx2YAoKk+GHR7abHNuGIYLZBrh49Y4Id8ME1reZxnUISX0djdfz6WOYZXWsmrKSfLcqQtEpzMTZPtiXOZbuGgpzZIpqvnAbJAJbKHZejiixJUIkb23/vzpouMLhBFSGq2BsDyfpu0nPND8QnQs9+9iS9pVf3NkGAYwYEqzTOoBHRpIWGvrQ0b895GL6uH122zY+g3kg4pCn7hEcESL0NISgQXnUMlXtKywCOkdqssd5PUY4HLjvs15/lSvzYhQKW3hGpuXwF2wEgEWc3nhgRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3BEj554ixw46HCaoRBfSZtVYpbdSOs/d4+H4Gu2xGE=;
 b=Fgh/BFWkj7dz4ttl58gpO7OfOfGxGyDg/ofBmbYda7WHBZS91QES45/7WZsH3Wlg4F+o27QeUx7FjcDwzr/XQuMq6MJvQG+aq+eQjHFP64uCRmAfVfydr0ELQsmFmqcOxLMZFTC24SUZxgJYmElotYB1SHwTnQR7Nr0KE962oFhW4CPy2QbI5vLM7kpu5xKVboXC5X9Ag3WawIklYn0dayy8ltbH5Bb52DHKFJlnKrUOmOWipiPAvoZMbM3zIx4oxcyqBNypUe+kcwolUnFtltGw5WMG1px3DqggH/Tep+vKPlhNHY7Ge4a2/fSTOD3ZPhMJnnXT87bRdlFxrhonDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB9790.eurprd04.prod.outlook.com (2603:10a6:10:4c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 14:19:37 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:19:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Aug 2026 22:16:44 +0800
Subject: [PATCH 09/10] dt-bindings: mfd: fsl,mc13xxx: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mfd-syspower-v1-9-a440783c2e78@nxp.com>
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
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB9790:EE_
X-MS-Office365-Filtering-Correlation-Id: 568c375c-6f04-4bd9-339d-08def2336a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|7416014|376014|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	a7yaFWyLGUn/NhcC41rZr2bpZdnCM2di9OJiJ+nd8jDp0K5wE3Ag3IcCoA5ll9bs11RrzAkIBCU3TmvUoJzzK5w7oB0g4MbRa9xQUMzmencFIp7s5SiIqOUQ6EAaWa5+T3AQubOzufFcaVe4fhMQ5XIBjIngGQstTYhBDCT+rkuBYvjQNymHvaB+V0jvmHWBsJBoBpyBcMZXu5JAyNuPtmnCpX2nsJF7bLjhCZki+ehKK+vtE2JTFekAlMo51y6C/c+uWRqkuoHyRE/zNCaPkP5bxw9Ejkf6DTCuS0q9sfb2hBt+LGKpD1fIgyD8lNR/YGOpFevkhSf4yOPLmnIFXHKZBTSBg9gCRI7UWNSzA/Jlh1ofg9jX4FJTCXtY1et6H4SZVwn3uUIZ9bDdy8kkDiWt7Hy00k/SLQJyw4cfKj7SwnsQ8i8fyjdzfzpSuDxMV3Ylr/Ndl6OcMY7wBcm+LpB/5TKx8/iri0c5VYcSFs1WLErYa5peGPopikffjCjvs4zwVljeJv7fpIu/h/j7eeZSo8fqMNXJ754dhSQyn5w86S4VZih79AUot/O1zqm03ht0/A/0aUNG8t7yw8edFQFKG0uU5IwCO8mTVB+l8OaEHyDCg3ttDaxKqB69AMT/GY+ufHQvRzWh139JnE8s85bThB+fMh6bTBL0F+qs+AWxgyYK4h2NDEpETye3D6LVqQrlkyOsopsZasW6l8U1cg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(7416014)(376014)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGJpdUs2UHFjSUVrZHUvYW1IZkk0L2VXQjN2QktrRFp4VUZjZGx6UnE5V3ov?=
 =?utf-8?B?aXNjM2E4TDBOaDZaWnBxSUFoOU1FNDEzdk9KNkRsdFlhL1RGSFJzMEUwRnN4?=
 =?utf-8?B?WTR3UXUvVms2NlVjVXl0d3B1eVAzSkpzQm9QUWRxR2d2eUd2SkJNV2lOK3RL?=
 =?utf-8?B?OHN0b1VmL3l6V1RWcVV1VVRXRXZzcnRxWnpOS0NUNVZWSEJJVUZtTjZMSkJX?=
 =?utf-8?B?ME50TmZSaXo0YjErQ0dialorQWMvMVQyL2xLTVVsY29jMkdNdWlGSEY0VmpY?=
 =?utf-8?B?cWovWEpOMTVIYTFqWldvaEtxYmNET3FRMnBJeFJrZXkwb3ltQS9Pa3pHZ1NC?=
 =?utf-8?B?cit3TGhOUDFvcXlJYzA1S1JYRGl6TmdzRzhaQWt1Y2s4NEVqMlp5SFM3bFFu?=
 =?utf-8?B?NVFGU1MrTTBwb0craGw5TUhsd0hzeDR1T2RWc3JxZThYRXoyK280Nmt2TG1P?=
 =?utf-8?B?cithQjk2am0xNGJqVmRmMXRiYS9nc0F5WHBWMWdtRktZV1lWTGp6bGVUV2NR?=
 =?utf-8?B?RGM0MXVmSUNRclVMZnVCbDVtbjV2V2dSNVRDK1FyV2JlLzJoMUVsejFySE5i?=
 =?utf-8?B?OUtaWVBjV3J4Mm9odjRKM25Ja0E3R3dVcURxeGJ5TVFXc2E0MXRZN01MR3F6?=
 =?utf-8?B?T2MxMUU2RzUzdmxsd09BSDZxRjZPMkdsaTVabVA1LzdHd3Qrb3FaUkp5cTl6?=
 =?utf-8?B?S3FFYUVkbTVYTGl5MEhnK0RhcFNWUGdsTlYrUFNld2hTbjk2aGgzc3MwSHNw?=
 =?utf-8?B?NHFCL29EQUNsSzBLSzBWY2xzMEJvZWZVTWlHcnpMNXBTbHpwVytIUGoybkRX?=
 =?utf-8?B?dUE3Y3ZnbGVvUG40Q1pGdzF4OUxGYTR1dzdCMzN3Qk45UERGVHhRV1l2Z05I?=
 =?utf-8?B?QlRvUVFTc1Vsd0pWS3EydWkxS0dSVTdYR3hpeXYxb3k2RGJYUkNCQTFRVHhi?=
 =?utf-8?B?U0lacDgvWnpacCthMEVyeDIwdzE0QzJEc2lkaDNFYWFuTXZWYnoxcnIrTG9x?=
 =?utf-8?B?di9tZ084K1ZOT0JsQU9DOVQ3S0FiR2tJZnNxNWIyc0lHWEgxSk04U0M4YlFK?=
 =?utf-8?B?aUkxcm1pNzI0aDAzVGxLNkN5OEZuVHF4Q2p6VmZKYnNhSjBwMUR4VVFWN0k5?=
 =?utf-8?B?WWh5c3RsditseEF4eUVwMkpsSTFyRmxQQk0rcVZtODRwYmsrc3NIbzA3R25h?=
 =?utf-8?B?SXZ6djVWWUZOSnFpRHJDblRoYThmcUlvT0I0Z0NabnpVOExDbjRFSWl4ek8y?=
 =?utf-8?B?bUVOcEptblpNTkdtSGoyMVRmM29ueEZYS1JwNGgxN0NSOGdqRWE3cm5hL2Yz?=
 =?utf-8?B?dEpSdmYweHhOLzRVK3RVQkhMZSt1cllwZ3BLTFIrOEg1RXlUUDV2VXA2T3JL?=
 =?utf-8?B?b29Cd2tFRUQxSE42RzZETmdPSTE5V1liMndPMWtEWGJCM0JiZTdoUUZ2WlRU?=
 =?utf-8?B?Q01rdlAvVWIzRHpDVTF6WXRYTHo1NzBCbEJ2cDhXMlVnQUsyVU9mMXcveGR6?=
 =?utf-8?B?ckNwMWZOaFFKYVFidGd1bHZBc29acFFBb1NCSHlYYWZIeTM3c05ZaVI5b0FC?=
 =?utf-8?B?Y2VqT001VEw1ZWFJNk5IMHZFWkhMTnVLeDEzRm1vc1BJVit0a2lsZnExSmgz?=
 =?utf-8?B?VXBoUUpJUWlkdW40RnpDZUtNa1J6ZUppT1M5TGFGSGYwU09udFZTbXF4Mklo?=
 =?utf-8?B?RHpic3ZyMnhJQ3ZZazE0aUxLNlIxdjNDRjZQVWhxNnZiNDJOOEdsYlhXb1Z1?=
 =?utf-8?B?b3NwYnBxSlpuN3N2Y2JWREx2clFKVVhnRjN0ZFE0dytGV0hXWjM2eSsxNFM2?=
 =?utf-8?B?RGREQ0FXZ1NNbk42eCtBNS9raU1VU0htOUJHajc0U2lldm1BbFd6cmV4Mmlr?=
 =?utf-8?B?akxpUHBWbmJ4UmNLNFZ1eDljNW5HNmFtOGthNEY5R1NUTzRUODRJOW5yQkNn?=
 =?utf-8?B?MHp4d2NWYVRINXVjSlliYUpXVkNJMGtkZGQxZFc5ZEtHekttaHdzNVVlNXRn?=
 =?utf-8?B?UnFzdWF5dzUvcTZVWTg5TEhPZ0lSZldXQ2tqTmpJQnZIcmdwd0dPdW4wM1po?=
 =?utf-8?B?RjMzNDBBQlROZ0FnZ0JBVkdHaEx3U1VzT3lYVnVKcmpqeWViNGJCZldiOUhs?=
 =?utf-8?B?VjVLQ2hmWEVNTk8za2pGaGp5ZDZQS04rRnZiS0lMcUg0bkFlb1ZsR0E4WVNR?=
 =?utf-8?B?b0daWWF6dG92Q3F3RWRGaGFtcFVRTW8wUEhMWVQ4K1hDVWlXbFBTNTVlaW9F?=
 =?utf-8?B?eTNkRHRGakxWTFRGNmRjZVZVYXVENk1KRDIyT010TEw4cTBnSmh4WlJ3elky?=
 =?utf-8?B?bVlKWUFEWUhGdGhFanJmcUNqYUtDKzN4T25ONExIbGZTUnlUcTZLVnFiRmJR?=
 =?utf-8?Q?V01MJ3c/e7Ve8PkpQewrTvi4nBnAmUzb2KDb9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 568c375c-6f04-4bd9-339d-08def2336a00
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:19:37.0248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIdjUGBbfa6VMR82N/SxttyoJT3n4oqQrAzr15fv3sG/yI1bxbI9g+suG4cHvmoSamLzW6mz2D3Bo9qlG8dTlqn3k3MDdVEOk3801FO6EP6xy/0Cf4jx5y9L/Eb+nKfp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9790

From: Peng Fan <peng.fan@nxp.com>

Switch the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
index 5cdb25be2731..24b9706c5c17 100644
--- a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
@@ -34,8 +34,6 @@ properties:
 
   spi-cs-high: true
 
-  system-power-controller: true
-
   interrupts:
     maxItems: 1
 
@@ -174,6 +172,7 @@ required:
   - reg
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       properties:
         compatible:
@@ -233,7 +232,7 @@ allOf:
               minItems: 1
               maxItems: 1
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.51.0

