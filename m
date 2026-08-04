Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029CF19A288;
	Tue,  4 Aug 2026 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853168; cv=fail; b=EaJhnkZ9ltlL07X17HrGtJQzJcWvRkBhNaDc1hnFlkErfGsiBC0LyxYe2YSw7lpPhMQVMg8bASYdSXoG4BGiK67wXxjEOuJPYRgK29LhkVs6l8Ny3OmvWVVXAfgC9AkUzd47hcZ4jEHiJCrQ5JthKKVRKRlG1UKvlxEB2ElVQ7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853168; c=relaxed/simple;
	bh=urOI/V3bFJaTWQ4pdC4xHFEoNpALEG8OGge1ouvW24w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qw8L9Tno+sMwzipiMurF3e9cok0LdIWzsCEPa9rHzbpvZgsJuwzHH0QGK5KxDpGkZw1gCWChnhWD68zVVbw+gX3wGO5xhaEJ8vTZ8ChShWgEtaTKE9kWZzCh95BskaSJNSuInRyMBk//2moimr05RP08JMxZzPD4Vby0cRoaczI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JD2yAGI2; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JD2yAGI2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDY+1vk0Pcjm/jfhbvCRHgGZJqwWRUrJijFZqWjU1/7Vu8mque9wGHgJy1AcA38ml4mnQryE7jbR8Ba8olXNDJACNw73I9W1zwTlWgX2OHeyW9TMzpD+ERrDCyGtwDY3UtFobsQyZAYCp9TmWhO//Td9UbL8+FTJqxLq9Lmu+4nKHBMAtiEwgDgjm2Wo998/67FVB4VPo1dLmJQXAHl9twG1x1FrqUR2yL8mQaDc/GC/jh7Ri4fIw8iXz6zCkh7ArYpYrn14QmaL4KvKh+A6m6Jou+XGdlTKkeE4BrumsCIirY6i5ZdQlzStVaszUxbh/pb+N51eNH1snCr2jLMC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdOhOX7BAgfOxNpAA9/JJY4c9M1l3N6SV/lL2RrypyA=;
 b=JpcdRZyihdw/6zc5+U9YmN0vrHke0tapXIrxfH0qTAfMTe83ieKFczlwElsprxIUKsH8j3ouY20TAOuP3gVrhCjr6OY5C4ABYrSRPeyEeVlsZxDvEkgIseXCH/hw47TRtn0yqhPsS2CC5DbDJw6D2X5mv64UuLrTGSn2M/yBMr8g1bixcf9Pn2UkR85eoM7d13i81fqBt8eEv8eHCpzMkJPKMRTTLFDkTADGPsTBemQRrdsl/mnSMmXDGX96RbEyUoKNtkLSu6CbLRWGk/zpw1tUSP5Tl0px9Ezm7K19+gP0bjoQGWywgvwQPi++OZJXpAn7vQQ/ET2Scxxc5IXlcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdOhOX7BAgfOxNpAA9/JJY4c9M1l3N6SV/lL2RrypyA=;
 b=JD2yAGI2WY7/PPJwnkaFKGPdaMIZ3A8RwuSiJ70snAT9VZg8ninQ825hJgilzuemP0YpHF/QOpuONJAefvxWcg/PAp4osPjC7qKP0WOajru+FZ+fjWK/9dKh386oXg/4WaUx46fxuLfVtJPaNSEWEfVXNfyxfLwOSTr6f6KQ1ps47pVx1PGXHeTTALrWwTs4hXwoU67FVWV+92or/G1vH7HlJac+H3PiGD+ItZlu9Bf4Sa1bntMNgC4Ol/8aHEtvH6QXAwhGRHDVjB0hUyzkZLpWrdoAjYPqEg9HHv0SKrwSWkI0E64X6yWofUwpD3mSUZEgggVWMj/r+ai4HVH3mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:19:09 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:19:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Aug 2026 22:16:39 +0800
Subject: [PATCH 04/10] dt-bindings: mfd: ricoh,rn5t618: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mfd-syspower-v1-4-a440783c2e78@nxp.com>
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
X-ClientProxiedBy: SG2PR02CA0121.apcprd02.prod.outlook.com
 (2603:1096:4:188::21) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad0602a-bbda-4e96-1cc1-08def2335990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|7416014|376014|1800799024|921020|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	yZfdmje4JcmuMeOiCvPNhINZgWNn54SCy/trh3FQCbKlUfwSBFUVbtLbODwnfG+cx1Q5juoEK4S6XYLsRqrLLJLZbmIyC9W6VqjGtW0t81waYhOMChJmhL3vLkIpFDMEl8/R/oRt+eYu+lX+EXTiecwOAPKXJvOLAIdNeMO1/16tOHulqulQqRynNn20lzLjfsqglQvo1LsJksXz/XA4G3cjSxK3DIL9pqb2UMjj3RSwea4cjOF9ottZpWU5mrrkNClc9MqoiE0J1bdeMxc/PhVRXwMZR0voylE2AhT4EYXKQFpouiHLciT/3hwPpo2QzQjqwJvWN43PxZuV6Ni4GAJLx8TDq4484ezjIbet3+1l+03y799zqTD657cqMKFJ4phx2sZ0kaohP/DyTJ95y6X+gudWN8+MBfRSac9lPUoTlMxZDCE9/rfAPzEknGZ2+nsLBzbsUAgn2NFaXKbgRvlW63d9WlDCdCdyUObsEI5xxLJGdIFcug6hIhaRa+w/wXfqLgdecJoKD2+lsm5zs2T4LFrtFSkfptFRM2xySOKPGLhbY2gdLRWHaqucNH21v04ipSigDkSIo6+O3rEEYge2MjKTNLjOjZeCom2bNVZscyqxG6To12cipI1j1AcL9qGCbkAua05ksbj1OgsQRtQbUaNOPj2CVhN/m+Xd7TB1leGP2ej/55i26a88UE1JgAugMH5nD+cWengOoNx5Uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(7416014)(376014)(1800799024)(921020)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFpFVGJtaXdqemh5K3FnWlVPQjJVRkRaV2hIQ2hFRDBVK203MDl0MUpwSmF5?=
 =?utf-8?B?TGdyOXZIWENCaEFSZHN3dFQ5V0daQ0FjVGtlRWZlMVoxd0JoUGh2UHRRSmRS?=
 =?utf-8?B?ZkFjK3A3MDZSQ0tWemZqRWQ4ZUpMNVFHc0FjLy8yVk5RLytsc3N4QlhQZEQr?=
 =?utf-8?B?N1FDRWZPcjFSRkNGNlA4OGJIcDFZOEVxT2Q2MmlsMjFyVWE5dEVnSjh2d05i?=
 =?utf-8?B?UlNGVlZMVjVMMTQ4UHhkdGI3TzRBRko3SElPczcyeDUwMTJoallyYXZWNFl1?=
 =?utf-8?B?ZCs2M0lwN2dOTWNRZ0JMWFBnb1hJU0hSWWFqU1Q2bVlXV2dUcXdQSkpNaUJh?=
 =?utf-8?B?M0dsdGZWTUl6YUlnMVVKNy84SXNZRGdyU3dsekVNK2h0Y3NXUXI4MmI4NDBm?=
 =?utf-8?B?UmVPZ3hPNXBVcDh6OTlkWXpZTGNNYWFtclBlQW5WVWZSNUJ1dDd3NE1DZWNh?=
 =?utf-8?B?cHpZU2FHOFo5dXpBT1JHTmcveG1hTEZNVGJWWHdhOGltNktsYkxKUHZoMTN6?=
 =?utf-8?B?RUJPOTJuMUlmUTFab2hZZ0Z1MVQ0TWFmN1p5Z0JZdEwrRGI4cm10S0h1RlVC?=
 =?utf-8?B?ZjhSUER5eVMzUS9FeGJDWVU3ZGFrcGlBVDFUSm5VUnFVbDZGK1JaN2thbFNu?=
 =?utf-8?B?bGJpWmdobWVoa3NUUXRvZFphUGhGMFNhM0theXpENDBaWWxpMUcwM0hUNlRJ?=
 =?utf-8?B?RzFsS0ZocEV4SmRMYUNQZFhERUZDOTJsclhwV1BFWXN0YXU4b2E2d0Y4TFc1?=
 =?utf-8?B?d0JEUlVwSG80SldJS09DWDhxaVpwUWQxT3ZvUkM3VTNmaXN1Y2RnSGVGOVpU?=
 =?utf-8?B?ZERNK2R6cUI2MWd3bm1ENWxxREE1amlCSXUyZzZZTWkrWUxYZ0VjaWVrT2FS?=
 =?utf-8?B?T1hpMWNNRGpJOHdIWGNSSi90K2lZUStOSXJPdFB1NmV0N2t1Y2x6c0pKTmhB?=
 =?utf-8?B?cGlBaE13MlNaWVBZVnVPMzF3Wmdka08wRng5dkFJOVFSbWxDcWFuakhLcmJU?=
 =?utf-8?B?KzFMd2FEQklYbWRqR1RqWDViTnVRYnBoVXF6dEtaY3diMW1SSC9YL0U4Um9a?=
 =?utf-8?B?NTJJZGxpc1BBc291aGIzYXRxaDRvRnlpUXZzM0xreGdWcTIxbUh5bDZNMzN6?=
 =?utf-8?B?Q3F1NU5UWmZGMTB6STBZNzRkOHBGaDFWK2dUWjZqbHpyWUl0TDJUTDBMSk1t?=
 =?utf-8?B?WWZjZjFrWGpDZGpHbXlObUNCam9DQlhOb3BzK1FTZzc0MTN4a3JjWURwSERY?=
 =?utf-8?B?SVIrbkIxeURubTc4WGE4TGk3YjRrNHpLNVlzWXpPRGJHMnl0ZUFDVnpLTFlr?=
 =?utf-8?B?QWdBU1J5dzVBM2RtVzQwK0xGR2k1Q1FHNjJWcC82OElBbkkwaUhGRGJIL0pu?=
 =?utf-8?B?eDYxK2ZkaUxQaXpiWHJPeEFBS1lOMWxHbEdXK1VZaTR3di9nRFNCU1VQQ1Er?=
 =?utf-8?B?aUpTcFJWZGJZdDdTMzNrZFc3WjJDQXhhbmE0RHVDWGtZN0x2Njk2aFdNdjNH?=
 =?utf-8?B?dTVUMHRQUmlIc09JS211YXVFQjlQUkhXcW1meG5XR2RZVkQyZlUvYS9JNnF2?=
 =?utf-8?B?MWJoeUhvd29Ca2lSWUd3Vk5BNzdvVmZZMk1VdllRMFhuQXpCYzduZDRVZ2Zx?=
 =?utf-8?B?ZEVRL3NuSjZSSW4rSVFrZHcrTnJ1b215WGdZd3Y2RTh6b3lXTTVMWlNHRVdy?=
 =?utf-8?B?OURrYnJOSDZ4ZHBINGxmWUxEUVBDSzlmbmN3aXFMNnZMRlc3T1YxYzErMzJP?=
 =?utf-8?B?Y2RRRDdtYkZBZWQwNlZqcFhXeEs0T1owb3VGZnEzeDF2TWgzT09iTnJocnAz?=
 =?utf-8?B?QytWMWZKa0l1QVJlenRzZktjaWxrUnljRVJrTlVXYllKNHBEOVhJOXJlam90?=
 =?utf-8?B?aHVUV0VPQU5zWVFTbzY3cDRZQzYvL083eWtwZFVXS0JjT2ZlN2hpZXJ5Szlj?=
 =?utf-8?B?dmltVWlFZ0lHY0huN0owRytPZFBUeGMwNGtQUEhBV2xsbEl5R1NkL3hzcUta?=
 =?utf-8?B?SUNGZ2NDNkJ1Q3lVTit5dmlKM0dMTDFBR00zWkgxdkl0ekgrUGdUZDg2UzAw?=
 =?utf-8?B?TzNvZjZpRDBaWk4vWFVhakdOanNja0VwZjVxUkNRZDVpUG95N2R0MHdIaE5y?=
 =?utf-8?B?YmlSOUhjcEhvQXZoTjlzNk1MTmc1Z0ZnVVo2c1k0ZTBjOExrWnYvTU1RUGJu?=
 =?utf-8?B?bmU5T2lmSVZtK0IxWEtaS0xhVFE3TVdMVXo3OFJQTTUwQTZDNXJRNkpib2Fm?=
 =?utf-8?B?R3M4d1BQWDRQcU1iQmI3Ti9yVm5nSDg2L00yZXZjQWMvR3B2RkY4ODlURUFj?=
 =?utf-8?B?a0YrV0xrVU9uUDdZczBRZDZEZE90WnhkT1pLMVpTbmkybkFBMzNJUmFFOVRN?=
 =?utf-8?Q?Q5gtdF6yxvM79H1wrJ3CGKn+2zN0f9VKn8QUQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad0602a-bbda-4e96-1cc1-08def2335990
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:19:09.4009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCtqqn4LqPFhggh7aNvkoyTFGyDZMfxiCL5+Q/Jba7kMQjn30wmWcigVJz4Oj0LwknVrgDYGJ/nC7iWfEYtE+KatcaQsUZN1VsJmIoGvSdDH9oEiYZrqMwu2u0ZTMS6Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9135

From: Peng Fan <peng.fan@nxp.com>

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/ricoh,rn5t618.yaml | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ricoh,rn5t618.yaml b/Documentation/devicetree/bindings/mfd/ricoh,rn5t618.yaml
index e3d64307b531..d81691f4d574 100644
--- a/Documentation/devicetree/bindings/mfd/ricoh,rn5t618.yaml
+++ b/Documentation/devicetree/bindings/mfd/ricoh,rn5t618.yaml
@@ -18,6 +18,7 @@ description: |
   The RC5T619 additionally includes USB charger detection and an RTC.
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       properties:
         compatible:
@@ -68,15 +69,10 @@ properties:
   interrupts:
     maxItems: 1
 
-  system-power-controller:
-    type: boolean
-    description: |
-      See Documentation/devicetree/bindings/power/power-controller.txt
-
   regulators:
     type: object
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible

-- 
2.51.0

