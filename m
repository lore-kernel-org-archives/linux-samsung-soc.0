Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFE03ED3CC;
	Tue,  6 Oct 2026 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287919; cv=fail; b=Hm8wCtUK9hXghx2gnfgwiricf5e3PB2wKgpQwYl6RugjC8gjxpIrJzUme+4c1LyTG4lqodOoWJ/hLhJF7KDrXrUd2EYkMqgfgRKCs6dt5TwM0gBTUKDGD4lUDZII/pLDKDgOilos3m9qzpFiM8QXHNFf+MY5SvDMqvJTgYWWlPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287919; c=relaxed/simple;
	bh=tuMsVOxmF3Mi1dpHCymqRfFU8dXZlkH0tTL8VIeVhuc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iEhHDG5MddjSE8L9SGGOSj1p4CjyFdyQEcPWwnA9McKu/4h/l4yQunkNh7OHGoPwdogjPj+lsPhpDJy9xrx+EgvVmzWLInEcGnpWTe6AwPZuq+XKKlaWV84rTb2/IK7wCdaOiQEzS09rwlrkJ2WfN4O41b+t/N5mMa4aZcEy4Nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=l9h3iQQG; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="l9h3iQQG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kP/4sPdFASH1ezqFYbXKxV/DzArP1l/769528oHYyGlSl9vaIsuFnNkbNLddjeLvTsR5tOI9VXy2ShNHz04ntJpnK5iKBD1O71/kSIFMSRASYZyTx4CsKaZI2StYkWfmgSUF8pA0tvHPANPqNO5IkDvURmbz0u7gcnSY7KWMI42LGP8XrP56AI2qziaNQhApnMAfD6Jw3KDAR4HlSE1TOZiOAymsWh7FqLlQfmO9sE5te6SN2s6Tz4T8hUmN1hQxRdtC2Mio3N09PL07PnTU59Dsm97oKhqollifN+1APEKmRW3tA6eh4Qc9wEMN0ZEJ3yMOq4vbqFKvkzPg0bgMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHSI40dsTHxFMuVJXj1OieVkVr/y4sBG3eNLFH4/pak=;
 b=XfNNvjyVxx+pgwWOOO/ZViXzBIc5/JUDJ/UimGod20gUZnk7rFNQ0A8q9bTRJR+Yi4blPZ7nVeMMjJ3STLZ9KzQ8ouf4WTcNcbaRArBlaaa+kUFQjCtj4eCmED/lbZNgM1TC9Mg2i8Y4bu9oN2FqpK9x71PLF3NTE8El8CpPgQ+FsBqRTIG22oTCIkOCwBuegzkiVulyT+CINMs11fTfZ2DpLoVvv85BDr+mXbX/3AP/X28jCAd1EICSqm/UzK+BXgOxchnlFefQlbNgD56I4XHp8vGFojVEsqta1m1KpVrcQI5ZWdDHLuwk4qHI2DKOpzHDAbShQ/d0LkZqeMWEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHSI40dsTHxFMuVJXj1OieVkVr/y4sBG3eNLFH4/pak=;
 b=l9h3iQQG9uMNUDhCFk/Iibm5JyIzs+G/ZYDOoDdkr6PYj9wvrlqN4ARXl4Ecx82Pc4iRlimACzm9TjmXxH6v6g3FYH2P8FUzyv3sM1CZS6s89Y+2Sl0G/clTU0ggmrDOqd5Hy+CiUVZL6PKxcaGSlKxSkZOWIFsQgUNrQ7D2SKo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AMBPR02MB11561.eurprd02.prod.outlook.com
 (2603:10a6:20b:736::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:58:23 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:23 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:31 +0200
Subject: [PATCH v2 17/17] ARM: dts: samsung: exynos4210-universal_c210: fix
 alignments
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-17-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2322;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=tuMsVOxmF3Mi1dpHCymqRfFU8dXZlkH0tTL8VIeVhuc=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOJG6whYqPOGiUeOwFsuEH2kMEa8KjD9LzMYc
 iAC10RTXZqJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiRgAKCRCwB25JC3Fh
 a1c2CACWTd92LUXO2ppgiAHsSZQNN7HEo74p796/OKFDpMg6cXbNSOiUOWXHHj+jH+iSooufDpP
 uS4QceiTxD+NeXQkI7MpRI7L/6ty/VpUpzVkL+KP3TlsKeQsnzqIjHIFpqR8AUpLCKZoQ1V94kr
 sayI8KniJlv7iayg87wl7wvaHXRi72CwCtM8cwy7smjo5Ulqku0lkfmr75be+0WIJByy1C2eFv0
 EIiV447KcdpTr9fnrjqyBsAgYEZh1reZKGmyylmebMHmxbRE0PAZIipgdLLf5moanfaA8c0Yemx
 fqd/iJsgHtu7aeDYmd4h1WILzAGaZouIqHoMiPKTBgUZGlMZ
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: GV3P280CA0079.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::22) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AMBPR02MB11561:EE_
X-MS-Office365-Filtering-Correlation-Id: 010d3071-461c-4978-c9dd-08df23a11f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	vzuQ1r7wwDttu6r7T9ucl/hkUUQ9RojlO46V1yNp3ooDWUlFF141NhWKRYZBg5MsnbSSXYobq7RU1zDIM4xBiuTreD2PSDJ/SzYTfXELbN/w/JdXmOSBUlXfkS6PIZ7MynAsJdsSqyBYv+N1ZfiJ2aXePtryWdPHPjQN0DU9deJuB95sCcpLqpbaFQNz0skdGalesmbOGq0LictPsDmieaxWsJtKryb+TzFTroQUEdQqtsqVZ76P3NW7pNn3D1hlHXgo0helOPpHCy+JOQpwMvce7punh4Gwhj30eBZtoCfekp/ZYE9TiTh4kwfOGV8iM3OdvdMnJ2sWnpsKPXvAWzbKJmfCacNFi9nqMMJvFuR4F4c/FTP8D6IVkrzpqBVa+gu6KsQZnqS94FXo+LOiXKKVV7l+nmskdoaZfBY+5lTYa/9Q5tPlvXujGh7uGSXJRDNmFMlwxjTtzDgZh0+TXZ+l6TvHSnNOM6wVL2FAry409TQ4vqNfZMLfKijWvEti04df4DHpMwysn7VZMTlHPRdIq6QFbEmeHMvkZb+ixyBvDZeoQcJGAVAoKN4NY6wVbpvugoFG2Wt5ibJ0Drs4IQjNp4HftZ8jaVxTfgPIM7GpZLMF+pzrtlMUpgQSTtT/CZDC9Cv0znnOVSp7TbWuApPQRGNuOdFyrd426G5UYiE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THFJd0c2c2hodnJxUVcyQ3NNYk1UWEErSGlBSmxSdG9lSUttR21BNTNSV1Vj?=
 =?utf-8?B?SjN0N0kyVDB4Q252eWFvcnJ6SUVNY3FUUGg0TzU2TStPOG83bGgzYUlEbVor?=
 =?utf-8?B?NEYvcUlpaUh0aFdKdCtDOVdmdVRBdkZRRG94VmVlV3J0VWk2RXFkN0dpWWlu?=
 =?utf-8?B?MkZSQTIxZmtIbS83VExwNXlFKzI2d0tXT08xR1o5d0FCbGdweXJQZkh5eTNz?=
 =?utf-8?B?S2xBcWlkWFc0ZGc2U2RqRVBHQm5XNWc5WWJmQlZja0p0TUNFKzRWRzZkSHVH?=
 =?utf-8?B?QlkraElhc25IL0RvOXQ0YU9yMk9sTUZmK0NQRUhzdk50K3Q4ZFp6TTdxZjhq?=
 =?utf-8?B?eG5oUFM5ZmN0S2tJMzM2OHo1NjBpTkQ3aTR0YllrSGFoZ2ltWHY0RjF2SjdF?=
 =?utf-8?B?UjNTS2I0TkpsWVl1NmJKRk1xR1RCaFJWUkFNR3ZhK2xBbnN6RUYzK2dGR3hG?=
 =?utf-8?B?QndrdUdNZnUzcXpaZlg1Uyt1eW9RVDFPblFzZnlxVTNmYVNqVU1iSkVUZW1K?=
 =?utf-8?B?aEVpYjR5RWg3Ums5M05vZWpwUXd6RnZIMkIrS214emsxb2ZxVmNTd3ZrY3Iw?=
 =?utf-8?B?dEZONnpaYld3QzRoRE8xc3lKbU82NFVFSGpCMUdwdVZNcFNabDMxUUJNYjJa?=
 =?utf-8?B?VnJNdE1JejRZQ2xvRlhiSUdXMVBhTUt6VVY1M3ltVEtwTE9CSVgyZVlYdkN6?=
 =?utf-8?B?SUtNRS9WOERpa0ZYbFlZN1JWVUgvNjF5YmRGQm9PWUR1L3BJYWdSb0F2L2dH?=
 =?utf-8?B?bU1ybldZM2J1MEIvRVBSZFU0bmhyd1E2ZzY5NS9Wb0dRUzZ6T0hyYXRmRURR?=
 =?utf-8?B?S0VsT3hmY0RvQTlKd3FKT1hMd21xUS9ueC9RTGZPVXUyNGYrWFZuaTVNdE9v?=
 =?utf-8?B?eHNvU0hNdlhWZlpIdGgwelJLTG92bWtmSnAxVEppOStoM2k5cUVGZk4xQ0Fl?=
 =?utf-8?B?ZGwwbHpRa2lWMXFQSnJjTXZoa1RXenVHUDl0RlJkOFAwVlNhaldDTE1oTHF6?=
 =?utf-8?B?Q2VYMDVCdTc4bllKMk9iWlF3cDZwNXEvdytPRVpITXFxeExmdWJTeWc5b1RS?=
 =?utf-8?B?RVVvK1U5YXM2OG9FMjZIQ2NiSkUwN0ZIVXZ4dnd1WlN6N2ZWQ2J5ZVZjZVFw?=
 =?utf-8?B?c1ZiL3RMZmUzcEF2VWVPZVVLYkszQXBGc3RTbWFTWTRLcmVrRkd3TlZlTmU0?=
 =?utf-8?B?WmhTcHp3L3NiR3R6Vyt0Yi8xUC9BcE4ydmQvNDhva04wQWp3ckR4bDVHdTdk?=
 =?utf-8?B?MmN2bHVadVMzdUJOU3J4NFdOdUlvMnpJUXFGTVF3N1dpWG1yZXVIUVNVRTFp?=
 =?utf-8?B?dDlDeFlQNUxsMjRqMWs3Z010NTRzVzBRa1lwaklKcXVvbVVrY3gyOFFzdjN3?=
 =?utf-8?B?bk1pUHV6cGRCcE14WGxJMEp1MjJVUDZ5ODYwc1RUc2oyNm8xSGp2NEowWnBJ?=
 =?utf-8?B?dmxPYUNGOGR6a2VUbGlXVjNBY1JLSXMwdVp1dGhwb0RXZ3JXR05QTEYwRWJJ?=
 =?utf-8?B?UU8yMXo2MWlJTHJNcktkQnBWZ3BOZCtDVFlDUTVwRnR4VDNtUGJqRDFrRkpO?=
 =?utf-8?B?S3BxL1RmUjVVK3g0dGVVRGJlVSs5NTBwamdVMXRIMTlpN0FtUW16SEJmMXRp?=
 =?utf-8?B?L3Vyamtkc1BST1lwZ3RzbVJ3K3BVN3k3ODdTUzVrZDQ5RzZlNjB0NzJsbE5o?=
 =?utf-8?B?eW9IS0RCSlh3RjE3UDlTWHM5VmRBZHFSRzRIQ1paMlpEK0I3L042YnM1N2tj?=
 =?utf-8?B?NkwydFFhNlRmRmx5R0xoVFBPTSswQ0ZhVUxwcHVSZGF1M09PbURZYWsxdGM4?=
 =?utf-8?B?NWZUSDExNCtQMGRpNUwzWFEzU1pTTmNKUTJUT0pYMk1HL0NlL2YzbzRqMDlJ?=
 =?utf-8?B?Y3hjRHEwM3VsN2tCTkxpaUp3QnE0N2hLS2pPQWdQV1hla2d2NmZEU0lWUlRK?=
 =?utf-8?B?Sml3a0cwcDJwYmdMTE55d2VTelFHbHJjcDZoc3ZoZ0l5SENoemxySWdnYytU?=
 =?utf-8?B?emw3NU5WbTlUOG9oK0ZRYjFBcDdKL1l6WTZWVnhGRDJFeGNBdmN0eDRodUVE?=
 =?utf-8?B?RzVnTXROOVdZMURYcVdQaWpXTW8zTExiYlpFeW8vcEs3WTlKNWNOWXpNOEl6?=
 =?utf-8?B?Y2RGQTIzL2lkU2dpcFVDMjlGZ2xQU2dvc0tYWTNNN2hzVmRNc3NIay9qdEEr?=
 =?utf-8?B?SWNxUUlBRUVNMGRmR3l3c2VhNGtlZnZJdTRFeVgwYXdqc2lMUjE5U05oa2po?=
 =?utf-8?B?Q1lmM2VGUURsL2NrYmlrelZuRFJhdXJueHJ3N0RBWEFtQWI5dDIwbGZNSXQw?=
 =?utf-8?B?djZMT04yeU10Rk1kcHBRK1RnUlFpZ3hKb3ZzdmhJUEttcDJNQ08wUT09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 010d3071-461c-4978-c9dd-08df23a11f22
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:23.1527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qa3gWuyFHFmPiFyGEoo0FzXV4uby04R5dLkTUiHCz4KIW2CkOCOqAT6xcekEciejqvp1FazaPfBWDRhrZAF74Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB11561

Remove extra empty line, align multiline properties and add space
after /delete-property/. Fixed with dtfmt (Devicetree Source
formatter).

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 .../boot/dts/samsung/exynos4210-universal_c210.dts | 23 +++++++++++-----------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
index bcc636adba91..2e8d48315390 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
@@ -35,7 +35,6 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
-
 	fixed-rate-clocks {
 		xxti {
 			compatible = "samsung,clock-xxti";
@@ -353,7 +352,7 @@ vdd_arm_reg: pmic@60 {
 				    <&gpx0 4 GPIO_ACTIVE_HIGH>;
 		max8952,default-mode = <0>;
 		max8952,dvs-mode-microvolt = <1250000>, <1200000>,
-						<1050000>, <950000>;
+					     <1050000>, <950000>;
 		max8952,sync-freq = <0>;
 		max8952,ramp-speed = <0>;
 	};
@@ -367,9 +366,9 @@ pmic@66 {
 
 		max8998,pmic-buck1-default-dvs-idx = <0>;
 		max8998,pmic-buck1-dvs-gpios = <&gpx0 5 GPIO_ACTIVE_HIGH>,
-						<&gpx0 6 GPIO_ACTIVE_HIGH>;
+					       <&gpx0 6 GPIO_ACTIVE_HIGH>;
 		max8998,pmic-buck1-dvs-voltage = <1100000>, <1000000>,
-						<1100000>, <1000000>;
+						 <1100000>, <1000000>;
 
 		max8998,pmic-buck2-default-dvs-idx = <0>;
 		max8998,pmic-buck2-dvs-gpio = <&gpe2 0 GPIO_ACTIVE_HIGH>;
@@ -650,8 +649,8 @@ brcmf: wifi@1 {
 };
 
 &serial_0 {
-	/delete-property/dmas;
-	/delete-property/dma-names;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 	pinctrl-0 = <&uart0_data &uart0_fctl>;
 	pinctrl-names = "default";
 
@@ -674,20 +673,20 @@ bluetooth {
 
 &serial_1 {
 	status = "okay";
-	/delete-property/dmas;
-	/delete-property/dma-names;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 };
 
 &serial_2 {
 	status = "okay";
-	/delete-property/dmas;
-	/delete-property/dma-names;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 };
 
 &serial_3 {
 	status = "okay";
-	/delete-property/dmas;
-	/delete-property/dma-names;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 };
 
 &soc {

-- 
2.43.0

