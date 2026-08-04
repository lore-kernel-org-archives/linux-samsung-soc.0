Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B554446EC85;
	Tue,  4 Aug 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853251; cv=fail; b=eEkC9Vfes7hxs4mdBAw18rF4ZSIcSzsiwV2zkImp43FVMX8DvUC5Z6yQcZsgOC8dlN5WHuvOkLlHPfq/9iSPjkRWJfUbTbp6KyumllAU01Iw49EeQSl8ztLYQ89z4hlVv3dbltWAMH2YOag2tacqGYafSFRAX6qNbu8P2ygFD2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853251; c=relaxed/simple;
	bh=qukmNWgXoGy2pWRQ/2q57ZNttrKPSiS9w3sXMYNaDSM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EVItD9LFejpaWTD5JeclVnmniTZ0mFC3lGsDO1KC/mx4hFmkKCxzF/aBuO7JlqrfwennmWvl88TRTfJT1dL2bYek5lT9YkjIgjClUKXyILcGxbzEbuWScFSD8AQNnVnzUHAkw5urHtdVfkvJRC7WaqpgMSUqD+LO/hhu4hfgK28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ixEj5ws3; arc=fail smtp.client-ip=52.101.69.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ixEj5ws3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWfFIQAe/wSC6t4+/KZk+7ZncmfFKskT6HlJ1RQrntoFj9B2VceugdsdxNNaqqJANjzghLi4EnTHBzmsQL5XQYmuQfJ+4+dXr22BoiFhl+xQVYTYx9reXlqKL7CdFceE1DofmbB67SHHZGTqW/MfkkE/OR23Isa2UigAHPHJVi6SG9s13BYzW8WsqrIB2NRTP0aHLDglCae2+D+r2vnE7U5elVxjQb4nZ5kSszxePOZpglVSKZwoDNrZ5dVmk5dspR3yvuT33UK1ZjuMmhkU+XSo/sYdbvPbb2uXQ2furENaIQ6Q8EbHQYbzG/Z6WZ4oGKMS6o3INvMy8lPbnZHZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9Vjhbqk4xHvoM3LsKMtD2I3ZiOhhBNYpcLYP77k6Ow=;
 b=pWh9oJtMXmrs1gPy37zDerwls2YQ9mZ9Mw1RmTaRM2APYQvlzYXW8Yg0SdwBbrZgBq7lRqes7COGdC42Kshi+U/1H9gLUUASScdkyi2ab+9TVVMCMg4FCejhO5rTuTFXbgzAffISWHRKaAqhGhh71zQOFgEie7Wy6xhUcU4KMv2LSSiybtokrDGGeR4ebR/4ffp4u3wQ2s9KwzCFE/AQ+PqqWloQPaaDlpJEGn8TD8Dhtd07BzwpVquqEAYpH1iJVt3ec9pZvcKHv4+kDS4Oc9gkmgrEKd5HRbnwO4qibH6Wjf3qWvbnezsYi9/GYHeWzfYU/i8fPmhsCFDN0ox9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9Vjhbqk4xHvoM3LsKMtD2I3ZiOhhBNYpcLYP77k6Ow=;
 b=ixEj5ws3S34WavPVmrDxnfHzc3VpAb2Flwl9/ZAFjah6GGWnGM32jx3aaHJhotYy23PpsyQ6GodvwJfXNMeHFmk6RoAZ4sKe5/x4m0DIJ8MtA8f1so7nIJQcJoe3ei5yuoNRiaHqw7ZzWFXKe4UCn+Smb95cP1znXV5fFJQJvnVn/et2apxK1oXeWyXH5B6RPFciGNPYM+vmKv0onPoWyzHnBJ4bil5NU/Udc81Eb42NwJKtM6joMiNXCQBlwwew2mpO2P5Rty1NIOlBCQIvCeoHXK+cSRVH77pu7z68VrfE40PytE8+jqTqRFLVJlqY6s5deJ8IOP//BRD2cwqduQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB9790.eurprd04.prod.outlook.com (2603:10a6:10:4c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 14:19:42 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 14:19:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Aug 2026 22:16:45 +0800
Subject: [PATCH 10/10] dt-bindings: mfd: samsung,s2mpg10-pmic: Use generic
 power-controller schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mfd-syspower-v1-10-a440783c2e78@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB9790:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db57294-e637-4fc8-f058-08def2336cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|7416014|376014|56012099006|10067099003|11063799006|3023799007|6133799003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	Yn0wWKdfChz1WksZOgmpjriQT6/Gro4T8kyJid6d5zbBqkPih/BAECCLKVVsFAtb6D0nM+TDIUYu3cMrEgQqdpGAFMXfkFd7iP+8BcnCVf4574FhlLXKsvIzM6LIhx1xCJKfje4FNrs++ywi3M34X6dcD4XpfiG5zLwBZKRMMx93eDwVEGbR6/q5+YHF5dbBBiR/zzTDWz+bF/K/3D+J93zZm/cA4D8WuXeqGgDlmwDxWSTDZatYbKYS1PaoIsz4Qi8BBKAHaX3PZTph+xUDpgOYZnajugOYByw1LmjIjhgSibeKQSsojN1dsi7ikipQOzcqyet0xiGQNBgG4GV62nyeA+93G0ERLLVg9GQAg/3VC79lfHio6Ry7creA8o0NLL504wibKi3afVngBsKHOM7+Rbs+Ca5bA9kWJiDYwsSQ26uG1MoFDp5IKLpicQv4m0Gg3lIP2q6z/vEEkCn2yXy3YtmDX5dw9OtlB1GUSLOxAF9HvmdTleMos1L916Ax/jKsFocp3rKkgy8ezdu2qR7iTGABkt80lVe3asCAhJ/q51/eT+tjvcJ8vddMjAHJrlHdl61KTIoYKxj7kcsUzd5SnyvmaLEWZFr4RzldLNcLfuK14l3S/q1pqjHOFErBRPSRyzQnRdCYiXfjfIoPhHZlkyHjCpG+w2R1t9Dl6bHI7PYcY6/NAuIP9uNfb1dESxx7wiuRqW4DVrDBE691OA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(7416014)(376014)(56012099006)(10067099003)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2lFWWEyN002NWFRbG1HbWZxS2xYcW10VitURU1YQ3k0K0hyMkNydHlXNGFm?=
 =?utf-8?B?NlkrRHkvQnlKa2puTVNta0poMTUzemhLdkNyTjJiRXR5eC9qUFpYTXBZbC9u?=
 =?utf-8?B?bzE2TGlFcks1RXFnL09xOFVLenJDY1ZFNW91QWp3MmdLNGx3UytpQ0FwVUZp?=
 =?utf-8?B?TGMzYzZXZjBqcXJRUzVUaVpIbnpOMVlUMXl5MjM1Zkd1Yk8vcURzZUxNaGVF?=
 =?utf-8?B?MVBSRWJ1SWZCUGZXOVd1bzhMNm12TUtsS2NUV1g1RFMxTHBYRXBZSzVucEE5?=
 =?utf-8?B?ZjluYlgraitHRXJibURhL2VCWjByVGFiNEp0UnNHWXAvNTBGdEdEOFR6Rlhu?=
 =?utf-8?B?SHdycFF0bWQ0R1Y1L2pZS0NsUW02elhRK3BhK2p2Y0ZuamNUVERjcG1naE0v?=
 =?utf-8?B?amtYUTNTMDFQRkMyaVVlUlI5MUtqOXNlbG5uM3l3d0lYQWlpU3F5cTBoc2JD?=
 =?utf-8?B?UzhIbHFEMVEya3NYY2FtWkJZSFZnM0toTzluVERIQU1ldk15YWtpdzBsQWM3?=
 =?utf-8?B?MElPSHNseURLamhQMUMxcmhYSWlXSUVJVUdPMW5nWk01WDM0TXZGZG5CWEVt?=
 =?utf-8?B?Q1dDdFJNSVBVZUY1VFB2SFVWdWJRUGlnS2xxMTJHV2d5aU1iR2tPa05EU0Z3?=
 =?utf-8?B?U0YxY2RBak4yTHF5eWIycS9YcFpKZmY5anN0Smt5S2NCUVBOaVVVUlgrRmhI?=
 =?utf-8?B?WlVRU3RBbnZyeEIrbTIxWEQ4UjJpU0x6ZXY2OUZ0VU9lM29EV2lubzZVUU5x?=
 =?utf-8?B?TmhMdXlKa3NVTmpTLzVjTWhNV3FLNXo1ZkpLODg5YUh5cW1GM2pXSjlKYklO?=
 =?utf-8?B?NERWZnNkM0IvOVFSSzJjM0tZbmcvSFlyT1hscmE4QnpJWk9zNWVLMVpjTjYx?=
 =?utf-8?B?emxRaE5xQ1h4L3lPL21RQlI4SGhMbG5OalpzN2kvMlFWRXp5ajRwRW44NkJl?=
 =?utf-8?B?TjhnZmhqOFp1ZXNBRVFvTUJzS3JaUktYdkV4WUdLQm4zeng2bUVNMVBiMVNK?=
 =?utf-8?B?TzZ0VHRYT1NTMkNIVmJZbHJMdWUwYlF3WXFXQWJId1cvdHo5THRsQUJGcS80?=
 =?utf-8?B?YytLclM2cFhQMitLbGZHUlJEV0JoYW1KWEVQbGhDNkNSNlc3M3JYNU5jRXE0?=
 =?utf-8?B?YkdrRk1nMWwyM3dranNLOGtWRlJCQzNlZG80a1FwaGZQZzJwWm54MkYycGcx?=
 =?utf-8?B?NmpUdndIVG5PMGNMWUtZb2FaVm9DV2Y3MVhIOHgvS3RsRnFzTjlZSXN3Q21r?=
 =?utf-8?B?WDlKRDlCNHFzVjNLeHMwWml1UWRacTVBdzA4YTliV0FuRjVNdlVzVks1VnFR?=
 =?utf-8?B?UFc4am1kQVJOYlhZRnp5MlVYODkrdEJQNFczZlR1OGNBay85c1c1UitLRzFR?=
 =?utf-8?B?OTdGWXlDbDZXcmVKdmdrTXhVSXViQkowcTE5VFVPYTgwVTRvaEF0ZjZaODNq?=
 =?utf-8?B?UUV5Z1JWc1k5a24wQ1lzQUZpZmhyeWhVNE1DcGYwNXRJemZPKzFKdjh0ZmQ0?=
 =?utf-8?B?Z1NCK1QreWRHSU1zYVhtSnhiYWwrVzF1aWpwbjUyck1PZTM5YWtzVktKd0Nk?=
 =?utf-8?B?MFNqQ3hzZ3lQM1huTkJZb0lWbUl1bG9Pb0RyWHVQdG9sQ0xKTHdqVUlncHVa?=
 =?utf-8?B?TkRYU1hJcGdHSGNKdE5aL3E2RllKNEhNZE5ERXllYmU1Ui85cFNCWm5kM3Bm?=
 =?utf-8?B?aGNSSnRLa1FaNXllbTY4bWZ4RFN5akpyRHMzZWtTY3d4U3JUT3JRQWdnNERo?=
 =?utf-8?B?U0JaSzcvaXdSU2swVVhBVzViR2FrQ1o4alZGcUdlRTlUaEpVNE1oeGtUNUR3?=
 =?utf-8?B?V1RVdyt5YUhWMXRiZ09pdUZyOHByWEVLOXpSajMwWFJrY0Q5eGxmOHI5NXJt?=
 =?utf-8?B?dEVuVjVDZHE3QnMxRk5hQWdwM2FlTWZFejRmcXZoZWwrd1gyNjJOR2FtczhT?=
 =?utf-8?B?cTJxeWxmNm5FNHk1T2hLWDlTRkM3TzEzVmw1NzgrdUsvWDNnT0dDUnFUVjRJ?=
 =?utf-8?B?enBNbFU0WTcxeDV5Q2ZkZC9QSHkyODh6R3FFZ3NtSU5pbXJsNVR0eWJ1T0dP?=
 =?utf-8?B?aEs2T1YveFpNeDM4R1NZMzlWWm9zRkVmMFQ0dGcybmF3b0phYThDOS9NcTFL?=
 =?utf-8?B?ZHhjRU1DQzVLd1NYNHhHeCtndGJGb2QzUVhmR1JNNU0rUldIaHJHeS9MUmVy?=
 =?utf-8?B?Y0FjL1NtT1EwNTUyelF3dGpYQTl0K0xDSzYyZ2h2cU43TUtXQjBnSlphYmt5?=
 =?utf-8?B?WkxhRVlNQTIxVzFpbDlXc1BrenlhRnd4ckp6MEhSLzZubVlwbjFJbUg3M2hU?=
 =?utf-8?B?bWZRRlQ2dnBlb1gvbklWOVMwRmJVWmZZK3ZDTjBUTU9PWWJyUTFSaEtvcUJz?=
 =?utf-8?Q?mYsmHTJPbK21PSKO891/5JCxlGYtE7efaYUV1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db57294-e637-4fc8-f058-08def2336cfc
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:19:42.2231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jM6E1HUnls9TpvHZCsYRz/IqRHEwxXgxODTAsPJywKLaJ1W7MxDzLxLARpb4EGY7j2e2GBRL1xS/WRdAflrWpG314VzwqPLxjZmLCmdG3ikAZQPvVPJDZlJlUJzl+o2P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9790

From: Peng Fan <peng.fan@nxp.com>

Switch the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
`system-power-controller` property definition.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
index 0ea1a440b983..47418077b153 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
@@ -18,6 +18,9 @@ description: |
   GPIO interfaces and is typically complemented by S2MPG10 PMIC in a main/sub
   configuration as the main PMIC.
 
+allOf:
+  - $ref: /schemas/power/power-controller.yaml#
+
 properties:
   compatible:
     const: samsung,s2mpg10-pmic
@@ -36,8 +39,6 @@ properties:
     description:
       List of child nodes that specify the regulators.
 
-  system-power-controller: true
-
   wakeup-source: true
 
 patternProperties:
@@ -71,7 +72,7 @@ required:
   - interrupts
   - regulators
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.51.0

