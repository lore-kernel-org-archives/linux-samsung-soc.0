Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013014.outbound.protection.outlook.com [40.107.162.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB583EA953;
	Tue,  4 Aug 2026 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853162; cv=fail; b=YNVoHXHiIWCzCndPToMfPi5/FpMeDuOpEtcYVRurCUztigO82Xtll90FQ3Ki7ID1HoaxQEKnL4Sjknl1PbwapTfsLuRJ5pTvjJAIuXDMuvbioR8XBffqvarcUCbaLTwgki8X/bODw7JY6rDRq9cgM6n4RfpaJdIb/pJet5bfM1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853162; c=relaxed/simple;
	bh=mTNzKFmDKd3LQdkcDZ05mStsfTth9DmtaFFZhEKQq/U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PuH1n+1L3wLscws0Y7o6VOs7vMxa4x5KLbkWFLdtiw8pzczs/ZovsKW1HOBeEPaC0ktW+AMB/WAgQsVtBEAoxwjo1fnHQ9rDt66is0zUu/055nav9Ads2W1BXJyUjPtfIbFOQ7ljZ+WN2+yuVWeFisy5KtSkfOL0le2CUCqo42U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ltd7V4Kb; arc=fail smtp.client-ip=40.107.162.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ltd7V4Kb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjoSWY1M37Awc0/nEMaZIOuClK/IGivgllK6dgtV/OaVgcPXn0aa+vO2SEpBZfFphTXGo36bVwYA6uJDQg+Fck9VYki2nxvvteaKLvaAFBAS09TAps2jYGj+BhpKdaSriKE4sp9GirDGqo3UwNQ+dh51utFuTiCeyds91XD7lgh3zEt/sX4F7TXPua5cSbA/DSWdnjQh7kZfIhtuvFYbWGDAsLqmpwlftLGhm+KqEqeZd+CmWPkBWv13191jN6o6B2lY9DNNQvk8kJxTT40HJOCbkdygglAILeCNkxmcj5YEsdTN/8L8al247WLD1WtwrDkJaHXbtxeexCkLjRRAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSkjEqn4kn7r0Shfl/M9edWNRySx5rL8O30NFxQ6ZRE=;
 b=iu2DwXpi6IloruxoA5qtG8F8ghPvVE8CIqi/LVsUQQCGiRthCXSHjcHPLK3uKQdGGL8pSmVEWvsMWQi/NAdF7kTqhEBuCvaKnkYp1Dxn01pd01S1Srj8RUCu5GLxQxAB2yJ1tP1wCaB+W3K6VStK2iw5VaouWYcrSOXP/o9HNbvHMnXicPqBZDI57b0Ft6Sd0lG8pINbbpUAhkoID1k04ajinTI4sunBst6WKobjKZBh3eXz+MJgilQfinI/FMdDoMvs9nS6QFLZIag6tIkHO+C7n0gWXhp449dXPHlld8rSsOO3uGQwMeXa2ttkSdi2hpjvCpS2kFe6HXcL6H1cCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSkjEqn4kn7r0Shfl/M9edWNRySx5rL8O30NFxQ6ZRE=;
 b=Ltd7V4Kbj0jXqeq1cPHqDmhINk2/1tsE8j2ipRvgm3wSzmfMiP02MJmViNfAjBO/aVa/bdhJQujgBxm3MRzJVfKv7rZio6oIA2swTpEFUF8+ASyMEz4ZecdlWqJzqsatglBiiy9LupEy2221cdNXPArtcxkWl1uFFADKIDovTMTOMBbAH6Oj5d4vDtZsmsCBsk7rmuCz/ClWaZYfis46TWa8jom5f4knc3/Bjcy1CRsnf7SZwVklmvcG/ZlV3k0aWR3fEhGsk7qNZIMhEolcoVlFMeawKy+inX2lIOJK7M+K6VxWSdqHto6jeQsE/J3cfECLVyjRzukCw+mcrWqCdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB10524.eurprd04.prod.outlook.com (2603:10a6:150:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:18:58 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:18:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Aug 2026 22:16:37 +0800
Subject: [PATCH 02/10] dt-bindings: mfd: ti,tps65910: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mfd-syspower-v1-2-a440783c2e78@nxp.com>
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
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB10524:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1facec-6a33-402b-3610-08def233527b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|921020|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	zUPnlFmqov7Qha2Wi6ozX64Zq4M49ylRARlOvZeMEEvlljbiXK0Bz4yLDPGz6FtyH7FmXCUU8F7UdG1XT2ZV99tsH74f5dO1MLGx4kwUPpBgW+DPaO1F0zqeG4AB4iqua23hLJlsbj+fgaHc6DNluO45JaF8G62IM+U1b3uCwwER4ahgO0RfbpQo3sIOr13KpNo9+aUaHTegQc0r+gAyiVbzsyT1hQeliwtmX12kZNW35ogBOlazS+x9UfdIwwj8o929l3MFkjktfqL16ykkpTUHfZUo5JMvXkY9bLPTDXGheGtBUFXtBSk/9+uVTaXKBtops4Z4B+05k9FBk0wib8g1p2fIBUckrBuLeN8WgBMFvs8WiiSlk0u3iGYZ56s3AkFsU6oWR1czotBeq3vJGkdlz+Y308TWcJmEnKppugNYzOAd7THFGKpJvo6P2YI6ocXoH6Zt36SXwFXXWU5I8BRaLfHqcnQ3cPCWIbPS8/RnuiU/pyFStjPsK7Q6GQATZGkbqxmt2GVIi6vUpNAs9LvKcvR79XnWPdxoxI6r+Ka5WWmM+GdDyYb/fFekf2j3K8+L3q9shg5fAwG4WnYz9WmroEoZ8DEby+yS9hFcFgHTwuPCQXZsEHnAgYgV2GRayWj/IJcS6pTR8VdY2iVqhBMBm6WGJSw6oY9p5LGUitjWjE0gcs6CqbwRx4/9sj4Io17ZwxTniKiwF+pBsKCj0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(921020)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yi9xWjdYVkI5UXBpZHFFYnZvYW5wWGNSaXQxeUNxUFVOcWpSSFJ4TzJtV3Nz?=
 =?utf-8?B?WElER0d4dVZObVI4R0NMcmZ2NXNMc2lkYzBmbUFGT1ZaOTFhUXVwRSt6VEpa?=
 =?utf-8?B?bHdqZW51Z296L0hvY1hXaWZGdFRDSGg3SE9RLzVaempHeTliQ3pIdFp6MU9h?=
 =?utf-8?B?QTFDWFliWSsxTytyakRGd1FsNklyK0l6c2l0U09ubTAxQ1E4U0FjT3NUKzRj?=
 =?utf-8?B?SENuRklrWjZRa2J2azh1REwrRHVHbE9sZWF5UHhtTjZnYlY1VG4xdUNzU0NM?=
 =?utf-8?B?TGV1VHBVUDBEVGV3L2pZd1BlSTdIN25oMW4wMlV3S3lzZHNJY0VmZUxiZTlN?=
 =?utf-8?B?dU9STWhDWmFrMmh0QVM3bTBXY1VPUjc3NkVDZUcyNS9QMUdSRjZMWWtYdHlw?=
 =?utf-8?B?N01VaC9MYkhpeEtXOFgvaWo5OVdOMHhyZitRVUZmZFZhaGZ1MysraFMwdStX?=
 =?utf-8?B?U1FXUHo2c1ZXQTJ2c1lNbUsrYy9ZUWw3WVprZTJuQS82c1NrREVldWVOTEE0?=
 =?utf-8?B?bUprTVEvOTBJOGpiNCtpVWRYU2FsWUdoUlcvVm9DSUtXWlFRYkw0dFZpeFpG?=
 =?utf-8?B?cEpkb1VNY0t5NU1uUEZxVmFFb3I4dGVQNTRCUUtsVXJTN01BWWpFMXpBYWtZ?=
 =?utf-8?B?UXFJcGp0cUFrd3Bna0dUTzFpMGpwODhIcXo1d2t0YU5CQnlqeU5EQkR2YVpV?=
 =?utf-8?B?ZzNBREdIZTNuVnhqVnRLbkM3WWliMCthWDRVR01hSDNpNzlwVHJFYXN2bjJG?=
 =?utf-8?B?NnhYeHdmOStIcTRJbVV5ZXlVQU1IQXY5bkpQR2FvL3NVL2dPZUp4MFJPLzVh?=
 =?utf-8?B?dW5rR1Foa25kRlJ1dUpZM0ZLQ0hjbGdScHdZWXp0c3c2TjFqR01Wai8wOVhq?=
 =?utf-8?B?RzVudFJ4UUJQdC9tUlp2cnFoTytpM1hkRmo3eWdwRmNYSXVBVC9CUGk4K1Nr?=
 =?utf-8?B?cm45Q0ROV29UNmlSQlRveGpET0hULy9ud1hjOVNGNmJpRjQwejRtSkpncVpZ?=
 =?utf-8?B?MDJzK3ExbVF0YmVXdE1RVkJyUUhJVWhVMWlLMjliRUdGMGhhK0xLMG1rT1FU?=
 =?utf-8?B?OS9pNG5qcTRJN01DSm9hTlpjek9YaExYakdMRUs1RktENkFCdVowckRudjJh?=
 =?utf-8?B?bkxrdk9xTlpzenNyOVd5Z0hueHlWTXRjK1RDWThCSkVyMXhoWW9Ldm5wVmky?=
 =?utf-8?B?c0tudjE5cUJ4Zi9TNEtWeUcwdG93UWI5SVdaY3JNcG1uT0RySysyWUczVnF3?=
 =?utf-8?B?YzJYRWpvaEthd1I1YmhaN25PMHhLcHRHK0l1L3VVb3FGakh3bC9VTGVHbzZT?=
 =?utf-8?B?cGRHREpudmJ5VW9KeGdBTDVhV2I4ZjVEZ1d1bWNkUmo3RzNYdHdLTWIvdlVT?=
 =?utf-8?B?MnBCMUdBaUJmQmdEbEM0UGpGbWVwMHN6cE1MRkxRSzlKcHhjM2d5WEtMZzRS?=
 =?utf-8?B?dlhDc21UeGt4VkhlSUt4OHVsUEhIQ0RFZmIvRktqK29YbWR3YUMvTFR5YWU1?=
 =?utf-8?B?UHl1bVVMSnY1ZlFZUDJ3THdjcW8yNHFNWnlVbmI5K0V2QzJicjZ3WSsvWDR2?=
 =?utf-8?B?MmxiT21jVENtdjdHZTdyNURuT1pjTzBybHh1aktYQUpaNG9NSjJScklZSlZF?=
 =?utf-8?B?WUlMeUZldm54dk9ZdnYvZWtVTVhUMnM0YmJhaWtMYWdjbXFVOWlvRDlmbFh2?=
 =?utf-8?B?M29UTklScVRTMEJ0ak14UXRTa0NvdVlBaGxKVVlFRnpCY1J3dlVUL3ZHV3Q0?=
 =?utf-8?B?QVBSMmZBUVh2Vm1LTDN4aEFCaW1pSnY1RnE3a2FHbjFXNDBHdlA3MGVhQnFi?=
 =?utf-8?B?K1pDK2VUZE1PdGlLMW03WG12a2tSUCs3SFhScThPaFJCbEFFL0RHSU9LVTk2?=
 =?utf-8?B?UXp5bzRYNlN0S1crOHczaWFsc2ZJMWRNbURPM1d5Rlo2T0xVZUx1aTBOdFN1?=
 =?utf-8?B?T3lEZHhndFFlZmRiblIwRHF2VXlVY3VkOUtsWUFvajY2WHJoRW5TWDVjY0wy?=
 =?utf-8?B?TEdjSTQ1NVpPeXhacjJkQTV5MDY0aUZSRHV1TmhFMmhreTVQcUJ2OUhUbWg2?=
 =?utf-8?B?YnRqeUZPVGhyQzdzMlVsa01Rd3VJUkJPTndKMlFpR1FORXdtWXZiMHdhbFd3?=
 =?utf-8?B?NmpFd1pGODFrcEZCL3Bvei9pdTJZV0FFNEdRUFRnSCt6K1JTVlE4am1ZVkFS?=
 =?utf-8?B?ZjF0aVo0d25LYXRnZk5IVGF4N1hVR0t0Q0xYdnQ4cGNRRWYxZHUvSEQ1eUUv?=
 =?utf-8?B?MDRkRVpvaFllbjMwY0laZ2dBNlloWndjcTJPbEpZMXh3d0w5WUlqckc0ZWZy?=
 =?utf-8?B?MlNqYU5ldlYzNzFFWEQyNjVrSlJSR0VZcGN4N2tPMUVCdVB0QjhsZGY0SENJ?=
 =?utf-8?Q?WCwh/Th+mUngTSNw74+sil+EEq1a3A3lw7eza?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1facec-6a33-402b-3610-08def233527b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:18:57.5340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLrNypNFAAL4iNAdsTUYfMN6oWwpYBeEcjTMJiVdB5eG+Ky68Naber+j87+qgQnJWIRUg1sJ/ICEcTAA3je1axGCcqgLFjVbOlZRmMpK9EdHQ8JdyRRYfFugbXH+4xw5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10524

From: Peng Fan <peng.fan@nxp.com>

Mark the "ti,system-power-controller" as deprecated and include a reference
to power-controller.yaml to uses the common definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index f1a76f88fc0c..3939e8518a8e 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -72,6 +72,7 @@ properties:
   ti,system-power-controller:
     type: boolean
     description: Identify whether or not this pmic controls the system power
+    deprecated: true
 
   ti,sleep-enable:
     type: boolean
@@ -170,9 +171,10 @@ required:
   - '#gpio-cells'
   - regulators
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
+  - $ref: /schemas/power/power-controller.yaml#
   - if:
       properties:
         compatible:
@@ -216,7 +218,7 @@ examples:
             #interrupt-cells = <2>;
             interrupt-controller;
 
-            ti,system-power-controller;
+            system-power-controller;
 
             ti,vmbch-threshold = <0>;
             ti,vmbch2-threshold = <0>;

-- 
2.51.0

