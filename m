Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D793E9F60;
	Tue,  6 Oct 2026 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287914; cv=fail; b=tmLugoIJHQH70daTEsv4b/HjAgPlrYhfxmpNvXl+7+5TTKpjrsWJEYQ5Er5bqGtc/Jc2XJkrWJn7jlbmocpIjcovKkqN5Af8ZH4dQx5eXa5Sp6ciOcKdREupBSe4ccYeVFdUkbNNPFPK0m/rnoFU2sJyOHp9nrJ+5yw8l5MkMgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287914; c=relaxed/simple;
	bh=lkXdmczR3oYAV6MdblMtFNi3ysZTgsLk60ulnUgeAUc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=l9QQek0D0Ks/h7phq5hTCDOsf5IrJsAT8Q/rQ2eDCaGIzn9klDz0h4qJqDwW6EEiMIwzV6/zlLwe9JpFtjmdPmKtqyS+dALKcOdioaU3fLM9wNXVGUHcQV4lMkqSMBtGU7a2g5BCK4GElntAexuY+PPQ595BfVlVMfL8wgcoEsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=ZZoqpsLz; arc=fail smtp.client-ip=52.101.69.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="ZZoqpsLz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYC5sml63Nmd+QMPwBiB/eE96DVWwfUeo5o6AxqNo8xm/BTuYZMp6ohmm5Wcc1kf6R6YJVX4orY/8sjN6o+DwnGbfeN2u/rt+aKatmDHyuKuoLRKc2Wcq0X7A+h37JTVmF7K5aLy89wmKUzoQvW51qDf38dhB+dDtnwy4a/086SNruFPJCEAm/zJvELVajKhiOmLEhou+K/Qu36Qbm1WbYkzhV9/1bViV98M1iVL1IuOMi2LYcZKzj/xA0WSj015XK73qaao96WAp5kjugs/E8zknaA/i5KlxzdngJ8VeJMz1IEQqQlkaXxAWRETtb5P5hOV51BFH7OmZbZuqgYePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPGAk8LVcGDdAMFFmf5X7xLi+wDp9fUI4rA5XeoVm3I=;
 b=tHOIUXMqzQL+LKRV2lvt0Ni2xg3t5kI9Rr9e3ioa6PKgmnRDn9p7dLQwV8QjAj5p37KZiU27QVqPC28u86yP2H1OPdX81U4sACYOpKQbNcvrhf1/amx3vToQHHb/hCcSAkEYi6BVctCWIvTggWbAHR9lOIYyT0bC6CgVlRAnzlm6+dDQvoWSdUq+S/sCtU+B5lvUh2uNtPTjPjTusesTm7PtDzdb9CCJ2pk/chWogNY5TTB1xH2WP3N8FkVViFpyloVrIIntWtrP8doj1t1qIlZgOKf9wFcgrnEtLve2o8/1zZ3tRa85Tn4lWyiB4pTI9KPc8A9GcRNmdRwG53Ta7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPGAk8LVcGDdAMFFmf5X7xLi+wDp9fUI4rA5XeoVm3I=;
 b=ZZoqpsLzub3mU91504sQfZNKjaAh/a5sLmYM7vWKhxYL0jHNSk0eXrYRFq39lzeUrdAfWDWXCs/1gECQJqfwclkFZoxqH0wz1G8QUCWoWkqCxS95en4zuW5Ca0IZU+r+juobwkPhWQowctZn6W04WMoex2qPrrSpHGM8QFbwiTE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AMBPR02MB11561.eurprd02.prod.outlook.com
 (2603:10a6:20b:736::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:58:15 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:15 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:24 +0200
Subject: [PATCH v2 10/17] ARM: dts: samsung: exynos4210-pinctrl: align all
 continued lines
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-10-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5509;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=lkXdmczR3oYAV6MdblMtFNi3ysZTgsLk60ulnUgeAUc=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOI5TvIYLZ5VeBjR1sIvt73BF07gzFSMk+jKZ
 +dH7pucmfuJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiOQAKCRCwB25JC3Fh
 awUpB/46IJi3I/uV4RDqekt16fmHFX25iHKl/3ChgFFyygvfo4Him9mTjtye3ANI4GJr9FwD+UO
 wHtQFN/Ckgzfw2YBY1mExel2VZmS4QfHcC8TbsMihfYns9M4vOivTGunXiTWXMu4OW/pFjdLTpl
 WQ17W8lEvItBqcJBLCo44lHwLKzIPggrkJ9nvRkmL0Y5XzBTy6Bi+bTgLmJTW6cVpTqGprckrpS
 0bBDUWeNR0U0y66sLnJ00JYj9sOoaSdbuYetKiSprWUm9kDArEoYBq2sgUfejOSgVZxdBf7ovUs
 eZHeGEa1ikc015x+IA0vwPQDKZxplEoGgg3r7iTDt41bxNiL
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: BE1P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::6) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AMBPR02MB11561:EE_
X-MS-Office365-Filtering-Correlation-Id: 11419e59-b03f-4843-adfa-08df23a11a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	6phYNY2V+/ydRLw9ffeKduv79XK0AqJhzisJoUEb9hDpX4LCB5eUqtcacmGdzqXnpiG0JnyKn0pzdJebj9zQ1k2OAA4S92tWaqQzmrvNQe+9DwvstFhl4UgPn4KIl290Us0Cb2lMJbRJFJYhHtSDGcGxjfPSAYDPe377RgEybvydlFetKCcmMlbg1xOefzLm5+CcpMXTTAmVEJZCuJhbnU1J7LYayTZqB5suQDFnfpI4XZUPApetGM4Wbz2ZsrA9ELY/IBA8IezhGXfECYKOsPdMLgxBmJlMX4FUiHx7VPmtELEWkNov7UZeZ1gmSRzDltz4KXp4uKH/yuqfZaSRjv1CclQnbltZZPX7LWICVlRfSSh4w1JRXIiaAZuaa0Lm/2Mu9p1QpFeN5PUBmWEaBo8sQTWIeqpWRyP8shwLEl+0xxEw9blGug3JW/xmnMUC92HpqN1J/SPn90tKrHbloH3b4VB3SnLZf6DPTCyuqMdEN/cV4NuP/aR+2HbqxiDyrp6LQB9knGVBDIKHWQH9iGxjupw7zh6QnDcEvMVo0j3YD0iU78d4JSyqBSLeI51ycxBXq0TG0U0dvdENkdvJCMmvRK4EfEdN2PfTQrTKwpvhot0L+oT5yzxwBCTDEXQhE1sRyZ6Ifo/f57M5uf3qQMR4P+dU/KWv2b/pbx/8h4w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFdIckVRNVVseWRoMWNvdDJhaVByaXJ5V1hIeTNSay9lK2RHYnQ5aVFHSUwr?=
 =?utf-8?B?dWx4QXpGaFlhekhqSzBQb3VjQ3VQUnV5ZjhpanlRajJnSkhFT3hhdzZEaXJq?=
 =?utf-8?B?L3kyL3UzTHRvZ2dyNDh0WEJxb0t4dHBsbk9UVTluRFNIbnNpSE9ldXRRRGZu?=
 =?utf-8?B?QTBXaGw0U0FDemJaeG1tL1ZiVGVOc1U4bnVpMXBaVFI0eFpkT242NS8zeGI0?=
 =?utf-8?B?SlB2bkZ3SDIxSm56V1hkWDNwc3lCaFZRT0NoY0NHZk5uSGFhU3Fvc1FpQTRU?=
 =?utf-8?B?ckkwOEp2T1NWNXloYXdDSG50Q2JHV2NsdHE0V2U2c2JlbGlOUUhNRzFUMlRM?=
 =?utf-8?B?azF0ZE1IZXdHdDhoajR4blQ4YWRZWS82aGRtdGYyQWk5aFVtUU5LT3dOUnFG?=
 =?utf-8?B?TXZIWlB6NWdXVDJLSzRwd1J3R0xLSjA1RUQvbk85K2R4bjVwN2E5VmxlaG9a?=
 =?utf-8?B?S3E4d2grR3pFdU9LZWRCL3JvZWxLdW1ldnY2SXpGNW9DcmtyMklXRWRSTWUr?=
 =?utf-8?B?Sm1JVTIvRmdRZGNwc0o4YkQxUDFkQmxYQnJ1NndMZ2E2YWgrbllCMXZPSGRw?=
 =?utf-8?B?UHd5U2YrYXFDekxHWk9OdDZZNWdxWmZCbktMUERhWGZQQlBwSVpsK1MwSksz?=
 =?utf-8?B?VFc3dGd0WG9XKys0N0xKWjUwNGVMbitBYklodjBwNVpaU01YYWNnVTBjdEVn?=
 =?utf-8?B?dVQ2R3BIcUR3U0pNSXp5d0pXZVJDaHRTUWVDc2lrUTk1b1lVVDhEQTdGNWl6?=
 =?utf-8?B?M09SelQ3VVdlY3c1ZElldHgvVDBFbU5qQk02RU9sbkdYVmc0QTlRQ0Y4RFZK?=
 =?utf-8?B?aHdOb09zR3FQMEZrY2pQZ2VRek5qMVdONkZKdC9sMlE2REpMeENZeE5HdGFJ?=
 =?utf-8?B?enlBMHp1ZmJzaVBwY0JDWTdjTlBwTkN6RDNmdHpRNmljbVowNGdFcjh5SmhO?=
 =?utf-8?B?eGtNZzJTY2hpY3dSSGEyYzY1ZVZDcnl0UjNIN0l3ZTEzVlVJR0tuOHlpZnZT?=
 =?utf-8?B?SkFtcGJKTUM2eUVqa0xYSDFpUzN0eHJYTUpwUkJkNWZVUXE1WFJQYkRpNzV5?=
 =?utf-8?B?a1ZwRXI4N0pubmY0bk04VFNWQ1hVMWxZd0JISlRVaytQMDBnR2VCU25pWnZm?=
 =?utf-8?B?NXVab1E1WTIvUkRwWjFUVTFCV1BZaytEd0cxdDFmSFJ1VDR2SkhLeFg2OG9L?=
 =?utf-8?B?K0ozcmpRNXlzYnBpOThBeDNKbnFrRmFNNE5XTjVsUG1wQytTejdRYThsVVZC?=
 =?utf-8?B?clhNWEFMMGJUVjhtU3piVm5qWDFvKzdWd2tkTDhQTFZlU0MzSHJ5SWMxdjA1?=
 =?utf-8?B?RjRlNDZJODh1UnRkL00xWTQ2TThHOTR0VFh5cXNJUm95TkpWSVIxbEo2MENh?=
 =?utf-8?B?QmNvMkR5RWZmQnJPRzg1emxsR2hYRmNvdUg0cW9EbEEwOFhVTDJTeXhUa0Nh?=
 =?utf-8?B?eDZuWjI2ZnpEcHFFbFg5bFkrVUtpeS82QXVlNmlvWmNXSHZ2MHgyMzlaV3dU?=
 =?utf-8?B?d0Voa2k0bWVJb0Y4ZnhwY0FCdWtaZ3Y2dUtXcllNRGV6bzAwQU9Jb0ZJMUo5?=
 =?utf-8?B?VnRXYytiZXkrYmVNZTZEUVlFY25ucFZGQ1pJd2NieG1vVENMR1loeVpla0FP?=
 =?utf-8?B?eWZ2UXdRWkJGb1Z3MWI1NFZ0WjRQV1FpSytQU3hxNGs1VmhlS1FpMGEreml4?=
 =?utf-8?B?TnUvYysvcFBRUDhUNHhmc3hSMVlZdEhuK2NHLzQ5ZVpwZ0pXWk1QcjFOeUgv?=
 =?utf-8?B?aUhSTzFwY1hKV0Q3alk1Z2lxd1Nvak41ZURpUUtadmUxV3RmcEhkc1BrWnZ3?=
 =?utf-8?B?aHpFdXRTWXZkL2JXcHJyYWQ2dCs1a3NyWWNPeXJDSnp4MjFNV09qWE1NOFMy?=
 =?utf-8?B?dXMyVlRSQkVXMmI0djQ0K042K3RtMTRkQkQ5cmFiOEJYU043QUIvTGZWNkNK?=
 =?utf-8?B?KzFmb3kyT25zWnhVdDMybWxjakRRcGl3ck9nTjNwRGRmNjZFYTNDVzZLbCsz?=
 =?utf-8?B?RHZaN1R6V0dqemVnSy9jWTZFTHk2YUR4UDJ4TmZUSGpaT1d5ck4ybjM1R3lX?=
 =?utf-8?B?aW4vV3orM3ViMDM5OVVVaDh4aTFJT3h2eU03M21WdzY4R1BqNFk0WmdaTWpS?=
 =?utf-8?B?NWQwRjJhNFd1SDNGSDRKRW0yRFBCelJmSThKNGFlcy9pdk1KTkhCS1ovNFFO?=
 =?utf-8?B?NFI5TVVmNzdEcWxFRFUwVkF2QTlzUEVoeU4vTEhjWUVwSnBvcUtDbWc0OHlX?=
 =?utf-8?B?cTQrMVlGYTZJRU85YXp3emtVbHQvRjNYaHFCNVZJdzRpdXZXdmhIcXpEMzF6?=
 =?utf-8?B?NVk5Y0tNUzhEZGxUWGxhTHB2MUwrcGlmNHVtcC9NTmN3azJLYUhZdz09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11419e59-b03f-4843-adfa-08df23a11a64
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:15.1590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LK2IIlYdtimSkl3v7yAkTnHcVSBFEPtZY0W842Ierlr75Gv5tG5VMr/+8KzfDDDpkhC4sXtJUsI55aw0go9M5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB11561

A combination of tabs and spaces should be used to ensure elements are
aligned. Fix all properties where applicable.

Fixes warnings from dt-style-checker in strict mode, like:

  samsung/exynos4210-pinctrl.dtsi:252: [continuation-alignment] continuation should align to column 32 (to < or ")

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210-pinctrl.dtsi | 42 +++++++++++------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/samsung/exynos4210-pinctrl.dtsi
index 70d268f9fcb1..01d30141d9bf 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-pinctrl.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4210-pinctrl.dtsi
@@ -249,7 +249,7 @@ i2c5_bus: i2c5-bus-pins {
 
 	i2s1_bus: i2s1-bus-pins {
 		samsung,pins = "gpc0-0", "gpc0-1", "gpc0-2", "gpc0-3",
-				"gpc0-4";
+			       "gpc0-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -257,7 +257,7 @@ i2s1_bus: i2s1-bus-pins {
 
 	pcm1_bus: pcm1-bus-pins {
 		samsung,pins = "gpc0-0", "gpc0-1", "gpc0-2", "gpc0-3",
-				"gpc0-4";
+			       "gpc0-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -265,7 +265,7 @@ pcm1_bus: pcm1-bus-pins {
 
 	ac97_bus: ac97-bus-pins {
 		samsung,pins = "gpc0-0", "gpc0-1", "gpc0-2", "gpc0-3",
-				"gpc0-4";
+			       "gpc0-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -273,7 +273,7 @@ ac97_bus: ac97-bus-pins {
 
 	i2s2_bus: i2s2-bus-pins {
 		samsung,pins = "gpc1-0", "gpc1-1", "gpc1-2", "gpc1-3",
-				"gpc1-4";
+			       "gpc1-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -281,7 +281,7 @@ i2s2_bus: i2s2-bus-pins {
 
 	pcm2_bus: pcm2-bus-pins {
 		samsung,pins = "gpc1-0", "gpc1-1", "gpc1-2", "gpc1-3",
-				"gpc1-4";
+			       "gpc1-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -387,9 +387,9 @@ lcd_clk: lcd-clk-pins {
 
 	lcd_data16: lcd-data-width16-pins {
 		samsung,pins = "gpf0-7", "gpf1-0", "gpf1-1", "gpf1-2",
-				"gpf1-3", "gpf1-6", "gpf1-7", "gpf2-0",
-				"gpf2-1", "gpf2-2", "gpf2-3", "gpf2-7",
-				"gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
+			       "gpf1-3", "gpf1-6", "gpf1-7", "gpf2-0",
+			       "gpf2-1", "gpf2-2", "gpf2-3", "gpf2-7",
+			       "gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -397,10 +397,10 @@ lcd_data16: lcd-data-width16-pins {
 
 	lcd_data18: lcd-data-width18-pins {
 		samsung,pins = "gpf0-6", "gpf0-7", "gpf1-0", "gpf1-1",
-				"gpf1-2", "gpf1-3", "gpf1-6", "gpf1-7",
-				"gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
-				"gpf2-6", "gpf2-7", "gpf3-0", "gpf3-1",
-				"gpf3-2", "gpf3-3";
+			       "gpf1-2", "gpf1-3", "gpf1-6", "gpf1-7",
+			       "gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
+			       "gpf2-6", "gpf2-7", "gpf3-0", "gpf3-1",
+			       "gpf3-2", "gpf3-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -408,11 +408,11 @@ lcd_data18: lcd-data-width18-pins {
 
 	lcd_data24: lcd-data-width24-pins {
 		samsung,pins = "gpf0-4", "gpf0-5", "gpf0-6", "gpf0-7",
-				"gpf1-0", "gpf1-1", "gpf1-2", "gpf1-3",
-				"gpf1-4", "gpf1-5", "gpf1-6", "gpf1-7",
-				"gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
-				"gpf2-4", "gpf2-5", "gpf2-6", "gpf2-7",
-				"gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
+			       "gpf1-0", "gpf1-1", "gpf1-2", "gpf1-3",
+			       "gpf1-4", "gpf1-5", "gpf1-6", "gpf1-7",
+			       "gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
+			       "gpf2-4", "gpf2-5", "gpf2-6", "gpf2-7",
+			       "gpf3-0", "gpf3-1", "gpf3-2", "gpf3-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -810,8 +810,8 @@ eint31: ext-int31-pins {
 
 	cam_port_a_io: cam-port-a-io-pins {
 		samsung,pins = "gpj0-0", "gpj0-1", "gpj0-2", "gpj0-3",
-				"gpj0-4", "gpj0-5", "gpj0-6", "gpj0-7",
-				"gpj1-0", "gpj1-1", "gpj1-2", "gpj1-4";
+			       "gpj0-4", "gpj0-5", "gpj0-6", "gpj0-7",
+			       "gpj1-0", "gpj1-1", "gpj1-2", "gpj1-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -847,7 +847,7 @@ gpz: gpz-gpio-bank {
 
 	i2s0_bus: i2s0-bus-pins {
 		samsung,pins = "gpz-0", "gpz-1", "gpz-2", "gpz-3",
-				"gpz-4", "gpz-5", "gpz-6";
+			       "gpz-4", "gpz-5", "gpz-6";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
@@ -855,7 +855,7 @@ i2s0_bus: i2s0-bus-pins {
 
 	pcm0_bus: pcm0-bus-pins {
 		samsung,pins = "gpz-0", "gpz-1", "gpz-2", "gpz-3",
-				"gpz-4";
+			       "gpz-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;

-- 
2.43.0

