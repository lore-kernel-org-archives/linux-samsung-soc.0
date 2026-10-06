Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF403E5EF6;
	Tue,  6 Oct 2026 11:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287892; cv=fail; b=beITfVUgjfs9iwZOu29xwJ9QNeCaqTApBiPnDJzl86sikcPpdFm+1Qoh9OFWJc8OxBkvWz/pCPfD0NOlmt7HQ0fSJ4ysa1Fna0raACELYDGuHs900F4WEmz/h/KBQjL4nKwXtNzc5FwXINkISoca95ZZ46Ns7+FRcPTx/Tf2Taw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287892; c=relaxed/simple;
	bh=jT5n1NMB+k0LcNxyrVav9ysJxH6A43v/+oO1K5NJOFQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=p5zaRVEd7XLHNXnayBNPqEPtZYEfEfOMW1drteEZmh/+zToco4txylndvD+fD2fUMJCpymp3bQ10rOSll2uTAyPD8SBEN3onLOfQEwYTnOqoVlnEES773PN/60FIq7xL7aJRg1Y+qRDHdzPulMPg5HtbpN2RSKnGGjNN6pjdlNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Y+cAfCDb; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Y+cAfCDb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhILyNzpgXdxR6YWCzOEEnu0h1a5L742IFg4q+6oS73N/xS+LX5msRyXlkvBL7FRp/VXsQXTcfMkM0+mxtCuHs1V5LTpxo2dEdR+RxQxDQFbqQtQK0PDy7ur0/JfcF4NMGq++Yi3IZoc/XBRv01sw00MA38xrFHFW/Cj9O3DjAVZt6PDonEXkqNdSSqyNlhDpPcYLpMTL3UCJKpOiEEZ4/5Z0I9Iv4WrKPepEB1boMd5Eaw0kOpBKMy9ycmJw/MEVrZ7haA4l7Z1Lc/Ox1i6ytrGJ7PUebhveE3dNnPQ9MDhxvJmG+Q4HlCOmZjesK31dsRNf7lGM/g+FKH25sNzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBdR4nFs3iFxka8aJgEHTrpS4rsLgSo2kjkTqI6ARKk=;
 b=CavIG0iBy5P5UYP8iETCbcWR6R2k5gmCh4V/VOvLaKu6O6XsZrHwDVRqrgREq3sgUJOdUFjAdqNJ51iCPaY7cLH2FZzYPylRpQh+ruo43paU9P/LqBnEk4XrmL2lZVrFYpNG9Pb3sag5FeUCQwN0wJjx5LsG58qunopgxS80csdDZX3X3/qviLFOnKTKB6zisrd4f2zZa6iex0zD3O22xf+yK1tT5BMtWi68wNsgfCf+zH9oOmLjBEcCm2snSkBouCKhxtkze0py0Br6vpiby1wef32brdFrxaOs9j8C2qP/soPWBaOWXqmaiSCG7/HuW26GAiIaHVtsJ7WNGhpGzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBdR4nFs3iFxka8aJgEHTrpS4rsLgSo2kjkTqI6ARKk=;
 b=Y+cAfCDb9SVXMON+jRc0yLL0rdL1RHlgo9b11EaHWye/O7eJpXi5Arvm5J9zkFdfXmTS4VDxYSDIgYm+QS3eIOb4MXY0g4ka8G44rifJq+gyvAI0NTDBOx2mTV4pYbhCIYjLz0t3f1RaPnHCyOi0f1KvWfFgF+5QdONNB/EvGOo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AS4PR02MB8235.eurprd02.prod.outlook.com
 (2603:10a6:20b:4f2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 6 Oct
 2026 11:58:05 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:04 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:16 +0200
Subject: [PATCH v2 02/17] ARM: dts: samsung: exynos4: order *-names
 properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-2-e8e86a3c8c1f@axis.com>
References: <20261006-exynos-arm-cleanup-v2-0-e8e86a3c8c1f@axis.com>
In-Reply-To: <20261006-exynos-arm-cleanup-v2-0-e8e86a3c8c1f@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, waqar.hameed@axis.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8999;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=jT5n1NMB+k0LcNxyrVav9ysJxH6A43v/+oO1K5NJOFQ=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOIq0qR1g7U0ntkwr11BMKtbd9sEYStQuitzf
 hrMoUByheaJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiKgAKCRCwB25JC3Fh
 a2xjCAC56zQUSaWS4qaSKn5jotFrB5SpuXEHS7fgZZr8ughtYJ7aowXkBHkyLwwb9k7QU+gXHIa
 PefQilZnvYMU/iEenTfU5+svEx6M9ATcZgMnljsa4TNWEOcr98Sb9o9+RljAigBb/GArRe/ibKZ
 n0Z4WEccBOH9DjnyGD2zfTFzUWQWcUB/QNGQE/gKox7clzyaEFZtAebyDEEY3TvZgtf3s9WSug9
 DOIjHRozqCz2MvvY6ISyh0Qd/50sR4tGNC9NrpM1RFwyyofH1KD6vXEblbXeKejaYTnC8ePbnuP
 +g8oyajis0fS+tSCAF0Ed5TwdwAYw9pDXp6wHos0HV07NAtG
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: BE1P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::20) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AS4PR02MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f7cf0f-5d04-489f-30fa-08df23a1144f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	IwS+ZdW1FTkErbD36IlxAtj2+7pei0mM5KTgZ4lkvsnNWVdIEKLK7CKM6gtDFe3q+uNA2A3ylmqW+Erw3x2YJ3GDsIGZXq2zSQGH82Br1xp/mYUiJSA9ZXOp5Pxw16U1at4M4RuMINjyAWrZIxx+El/rfZizfoKYr35p1AGmkEZYb/ICyLZGu4in6THN7DcI3GE5++Z+/L6MSDyjAKWXxchGsTfdcozcnzkpmR16xlW0zc2YnEUaacLuiFvJ/X5IPDIu7o3lmb0vz6e5zCDtWQ0udBlwU2MFqIwSdIdrR2flvr29RXwwlDUQ3beioKgVpkT03nNDhaIZtrLhQ/gbmFl8/Xnj4hhWlODaEH5KUGjrdoBGqJZGML+/owE643cgioUK2NPp7iup8Xqwe0vxhO6SeX6gH8xhqccufXlcflZ651MjPfFcZNRQEojjoQXx7Fpheb+0edNzqRxHbjdBJ+bMPM3SjI5KDz1K23XHFp0kSp+XXFvzk5v6sTEjjaflOzFy682osPURZ/XCUfwSAEoC5XeS1insk6mA6uwM8Ck++lTC6KHV+f+ZhlvioNpTp4vdetcJsTdL66qwJZ6GcxCvB6aLG60rESdBqg3+6Xfz1iGHS6+eoijs+mTJ7mxGT0g4fPvYKyUMkO1EusF0/W8KuC4/r6sA4KN/glhOk3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzNQWFRjVFNvVm41MU9KZ1BqUi8rcVpuUGpVR2ZKbmJLWUpxaSs2OExaLyto?=
 =?utf-8?B?REgrRm1KcTBzOTMveGZ0YmtLaG5zSDN5WVlBOFZ4SlphWlVuMWlnckpwYTFQ?=
 =?utf-8?B?NG5yZDMrUEZyRGxNaXFJSkhsNnYydWxhZnZHaVVCUCtmTmNJdkV0eStCSWF6?=
 =?utf-8?B?MWhOYklxc0wwc3JNVm9WdmR6eHkvUXh1RmNHOHBVUytnTTFxMEt6S1JWMXEx?=
 =?utf-8?B?RkpyKzY4QlhocUxSY3hSTE43Y3hydnN3eHdiNzhnT3ROUXp2NWdSdlM2YnpM?=
 =?utf-8?B?MFI1RzVWT0xSUDBqd0dUdEx1Z2gyTDJ4M2NFcjlXbWJlMGxqcDBrSHY4QVND?=
 =?utf-8?B?K2YxM1FCQmQyTzcwK3dDeGNxbDlhbFBOMzI4OHJQdlgzdnVrbUZURWdrVk5z?=
 =?utf-8?B?VWNSeHoxK1NKUGliZ0hicVBjcjM1cVJiRFNLcXJlM2FoeFZxdEZ0amQ3Nm9z?=
 =?utf-8?B?VkRZYXJCdzRKRkpsQmppdjJVZkpOMTJUYlphYmFpNll3UlNZamsrN2xtZWU0?=
 =?utf-8?B?ZlhrV1Uwd05nc1RXeTQzM3VncWVXUHZSVVA3OWE5bldlUFhONDAyeGNHYUYw?=
 =?utf-8?B?OHhYZnNiU2RsQVFlWFB4OXc3dkdESU5CemtiQmF2K3FnamErd3RCRHpkdS9n?=
 =?utf-8?B?RGJNRm9vYzlJRWRacy8zSzZBTXhQVVBVd0I2a09hdGJKS3hiUE9INk8wSG1o?=
 =?utf-8?B?RCtLOHM3RDU0czMrbjJCSlBwY0NUQ1BnSGVlLzlNVS9zblp6WUduNFlYR29z?=
 =?utf-8?B?djdqNzFzNm5Vd0hTSXQvZmpVdnVaTmliS2hvZ0E3Z01NMjhGbEdVd3Y4ZTN4?=
 =?utf-8?B?bmRDY0VxYTA1czlvenNWeVBZZXJlNU5HQ0J3Q0FqcXlyZEJnSWlxUnBoaFFC?=
 =?utf-8?B?UjYvVXl2TFRlYTF5dFhNU0pRU2RNTDBTb01wVXBEKzNhemZTbVdGK1ZmeVZp?=
 =?utf-8?B?ckw5Nkl0NUJVeG0xUWUzMzVYeUNiRGg5ZzB1SnFib0hSZjNNSnFWTDR0STZi?=
 =?utf-8?B?cDMyNmtQZFVtMGV0S2Q0d0xzRFZSNXBCKzBXUng2elJiSUtzMTF1aU95Vklw?=
 =?utf-8?B?VzhlQlZxUmoxbEZSU1FQekJjS1lQUHd3VnRiSU5wYzhCRkk1ZHExZCtqMlpW?=
 =?utf-8?B?YVBPajhrVVQ5ZkdTaldxUmMvbEx0VjFVR2dqSGVETzZiWkRLbHBPQ2NBb2Zt?=
 =?utf-8?B?NlJ1c0V3cHhHazFpTncwSno4c2FjOWdWTGhlRFp6cm9FTFRrTXpGK3ZMMjlH?=
 =?utf-8?B?ZUNCakRBQnFvY0dyYkRZcFBYa05IcjVnTDdWUDIvR2ducFVUaXRJZHlEVHZ0?=
 =?utf-8?B?OTdsNlBrK1IxMUpmVkVTK1NtalNSOVUvMXJKdEMrc2NKQzhlRDRlS3B1czlY?=
 =?utf-8?B?V0xyVE42WlZiZVhzdFltWklKTmNrOFFzNmdJcHhwNmpURHZza3RmczhpU0NQ?=
 =?utf-8?B?OVpjZlZncDRGbzBNVHJycjlwQndFRGI3VWx2MWRLeGpSekQ3RERWNlE4MDlQ?=
 =?utf-8?B?eEJLZ1FjU3hFMjh4dTFiZGRBZ09kaGZsNUl6Rkt2dnpkVkhtK21VUTFvL3dZ?=
 =?utf-8?B?Skh1TllJRWJDdnVOL01MK1c0R3VhZmZtRDFMdFhVbTVmUXdSNDZYNi9lVjhw?=
 =?utf-8?B?cGZCTjl4UDB6QkVhM09oOGF3dm1PSkg5eXlTU1dibTdPREVpNWlNYW5jL3Mz?=
 =?utf-8?B?N09pWmEzT3RISktJNWNIWndLTnhJcDFlaVpJM3prNVJ0dTY3SC9KOFVqYkVx?=
 =?utf-8?B?VzBsenNGMTgzdjZUb3J5VkNDTGo5a2VTbVhsWEM3Y0o2Tk9hWHNmc3dLQVNI?=
 =?utf-8?B?MHQ1VEV2RDdhMXcvZW9QSkxXdnN6SmtZNHJCWEt6ZUxHZFhrNG5rN2dXSFls?=
 =?utf-8?B?UzF6ZTdSMjVWV0pzdnhYNUJla2QrSjhERUdoQjIvdDVVRGtlTi93ckZzMG5R?=
 =?utf-8?B?dkcwdUVGYmRpM2h5TVNleVpQcDlKa0tOMys3VEJFbnk0SmdROWhweHBGU0x0?=
 =?utf-8?B?RlJwTW4zMmVxRkpEdE5yL1pqL1JLRzFTMXRid1BaYnBQNHpsWjdIWWVGcklR?=
 =?utf-8?B?TVRjWUZtQmVuM3ZsakV4M2tCZ2dQREcrekI5bE8vLzJSYUp1djhJUmdjUThn?=
 =?utf-8?B?V2NFYkdRYWpUWm4wUkpnWkZSVkVhcmNzd2ZoYnR5bFJVODdyNEZudWl4b1pM?=
 =?utf-8?B?cE81SW1vdmYzd0hDaG1vQVdJbkFVdjB1L1hNTlF1YWN6VmNKakdhcTNQVUdF?=
 =?utf-8?B?enZ4cHhQVE9qVDNOZmVpQzRzSDNKbE1wTzVxaW9YOEdaSmpOdHNxdWM1bm5B?=
 =?utf-8?B?NzVjcVFyQThoM0VUZk1vMXN5YldmWUVtRGNMcDhLRFpLUzZPZG05dz09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f7cf0f-5d04-489f-30fa-08df23a1144f
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:04.8561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huc7U77UURFxtZgjNNBlBLX1nuUd0ZR9IhHiUEpPsTSvqqm0VovFgJtARJ9qDoPEcdG0G0HO0JowjVo+gxhugQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8235

pinctrl-names, clock-names and interrupt-names should be after
pinctrl-*, clocks and interrupts respectively. Re-order all of them to
make the files consistent.

dt-check-style in strict mode reports the issues like:

  samsung/exynos4.dtsi:745: [property-order] property 'interrupt-names' must be placed after 'interrupts'
  samsung/exynos4.dtsi:788: [property-order] property 'clock-names' must be placed after 'clocks'
  samsung/exynos4.dtsi:810: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4.dtsi | 50 +++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
index c38489a05e15..f69b01423ae0 100644
--- a/arch/arm/boot/dts/samsung/exynos4.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
@@ -524,8 +524,8 @@ i2c_0: i2c@13860000 {
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C0>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c0_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -538,8 +538,8 @@ i2c_1: i2c@13870000 {
 			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C1>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c1_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -552,8 +552,8 @@ i2c_2: i2c@13880000 {
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C2>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c2_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -566,8 +566,8 @@ i2c_3: i2c@13890000 {
 			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C3>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c3_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -580,8 +580,8 @@ i2c_4: i2c@138a0000 {
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C4>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c4_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -594,8 +594,8 @@ i2c_5: i2c@138b0000 {
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C5>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c5_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -608,8 +608,8 @@ i2c_6: i2c@138c0000 {
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C6>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c6_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -622,8 +622,8 @@ i2c_7: i2c@138d0000 {
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C7>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c7_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -655,8 +655,8 @@ spi_0: spi@13920000 {
 			#size-cells = <0>;
 			clocks = <&clock CLK_SPI0>, <&clock CLK_SCLK_SPI0>;
 			clock-names = "spi", "spi_busclk0";
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_bus>;
+			pinctrl-names = "default";
 			fifo-depth = <256>;
 
 			status = "disabled";
@@ -672,8 +672,8 @@ spi_1: spi@13930000 {
 			#size-cells = <0>;
 			clocks = <&clock CLK_SPI1>, <&clock CLK_SCLK_SPI1>;
 			clock-names = "spi", "spi_busclk0";
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_bus>;
+			pinctrl-names = "default";
 			fifo-depth = <64>;
 
 			status = "disabled";
@@ -689,8 +689,8 @@ spi_2: spi@13940000 {
 			#size-cells = <0>;
 			clocks = <&clock CLK_SPI2>, <&clock CLK_SCLK_SPI2>;
 			clock-names = "spi", "spi_busclk0";
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi2_bus>;
+			pinctrl-names = "default";
 			fifo-depth = <64>;
 
 			status = "disabled";
@@ -742,8 +742,8 @@ fimd: fimd@11c00000 {
 			compatible = "samsung,exynos4210-fimd";
 			interrupt-parent = <&combiner>;
 			reg = <0x11c00000 0x20000>;
-			interrupt-names = "fifo", "vsync", "lcd_sys";
 			interrupts = <11 0>, <11 1>, <11 2>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
 			clocks = <&clock CLK_SCLK_FIMD0>, <&clock CLK_FIMD0>;
 			clock-names = "sclk_fimd", "fimd";
 			power-domains = <&pd_lcd0>;
@@ -785,12 +785,12 @@ hdmi: hdmi@12d00000 {
 			compatible = "samsung,exynos4210-hdmi";
 			reg = <0x12d00000 0x70000>;
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
-				      "sclk_hdmiphy", "mout_hdmi";
 			clocks = <&clock CLK_HDMI>, <&clock CLK_SCLK_HDMI>,
 				 <&clock CLK_SCLK_PIXEL>,
 				 <&clock CLK_SCLK_HDMIPHY>,
 				 <&clock CLK_MOUT_HDMI>;
+			clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
+				      "sclk_hdmiphy", "mout_hdmi";
 			phy = <&hdmi_i2c_phy>;
 			power-domains = <&pd_tv>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
@@ -807,8 +807,8 @@ hdmicec: cec@100b0000 {
 			clock-names = "hdmicec";
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			hdmi-phandle = <&hdmi>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hdmi_cec>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -943,8 +943,8 @@ sysmmu_mfc_l: sysmmu@13620000 {
 			reg = <0x13620000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <5 5>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_MFCL>, <&clock CLK_MFC>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_mfc>;
 			#iommu-cells = <0>;
 		};
@@ -954,8 +954,8 @@ sysmmu_mfc_r: sysmmu@13630000 {
 			reg = <0x13630000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <5 6>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_MFCR>, <&clock CLK_MFC>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_mfc>;
 			#iommu-cells = <0>;
 		};
@@ -965,8 +965,8 @@ sysmmu_tv: sysmmu@12e20000 {
 			reg = <0x12e20000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <5 4>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_TV>, <&clock CLK_MIXER>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_tv>;
 			#iommu-cells = <0>;
 		};
@@ -976,8 +976,8 @@ sysmmu_fimc0: sysmmu@11a20000 {
 			reg = <0x11a20000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <4 2>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_FIMC0>, <&clock CLK_FIMC0>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_cam>;
 			#iommu-cells = <0>;
 		};
@@ -987,8 +987,8 @@ sysmmu_fimc1: sysmmu@11a30000 {
 			reg = <0x11a30000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <4 3>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_FIMC1>, <&clock CLK_FIMC1>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_cam>;
 			#iommu-cells = <0>;
 		};
@@ -998,8 +998,8 @@ sysmmu_fimc2: sysmmu@11a40000 {
 			reg = <0x11a40000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <4 4>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_FIMC2>, <&clock CLK_FIMC2>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_cam>;
 			#iommu-cells = <0>;
 		};
@@ -1009,8 +1009,8 @@ sysmmu_fimc3: sysmmu@11a50000 {
 			reg = <0x11a50000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <4 5>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_FIMC3>, <&clock CLK_FIMC3>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_cam>;
 			#iommu-cells = <0>;
 		};
@@ -1020,8 +1020,8 @@ sysmmu_jpeg: sysmmu@11a60000 {
 			reg = <0x11a60000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <4 6>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_JPEG>, <&clock CLK_JPEG>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_cam>;
 			#iommu-cells = <0>;
 		};
@@ -1031,9 +1031,9 @@ sysmmu_rotator: sysmmu@12a30000 {
 			reg = <0x12a30000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <5 0>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_ROTATOR>,
 				 <&clock CLK_ROTATOR>;
+			clock-names = "sysmmu", "master";
 			#iommu-cells = <0>;
 		};
 
@@ -1042,8 +1042,8 @@ sysmmu_fimd0: sysmmu@11e20000 {
 			reg = <0x11e20000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <5 2>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_FIMD0>, <&clock CLK_FIMD0>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_lcd0>;
 			#iommu-cells = <0>;
 		};

-- 
2.43.0

