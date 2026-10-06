Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1563E9C36;
	Tue,  6 Oct 2026 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287918; cv=fail; b=VxaAK07J09uuFAYZmHtxGbVBAia28num87aFqqtbzPR+9X3c/AAiv3w9znKd93X8ovXuW0S6pGW8R+x8OgqB+Wb04GlG+wcy0g1q+yBzI+92YlvNZQ4NfndNbU4iq0mNYxuzHuDHcBARUqmqudvD+kkcOuG3DqKD7A6xyUi5kH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287918; c=relaxed/simple;
	bh=kENmu0sbWNXXwM4GlEAEO0v7RI0x4fZyDeC055kDc40=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iIRLfiZSjqSYhMGxdEOrvxkJ/rd5viLr5WM6tKb9aiBzidsXbqkb2bRCi/BaVgOS1/vVNSZ/TxTsov3TDSSMGBcK/V2+b3EJkRFgGeN7fXyBj68/4yBxHHofKMHUZZ1R8p1txw+rMEC8b5pTbjKx2DZ/PE5kH90huW6CRKtGWNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=reMA14J0; arc=fail smtp.client-ip=52.101.69.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="reMA14J0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkD5QAJJf6Gz+/RtUgYGDQvsMdG7MDD0+NYb10NAyJj22Ceht9yWiiFXQwa5DbYE7+berk9oZQXVps6Fqnb/VWt8+zDP0b0gX+7rSqvKUbEScl0BFCPoXCAva7mxGbPBD8G3sXUNSDn5DGT5HmwzPYBfjbpu5Hdwr9ITXTey1EhvXwxRlzj7rWxKqBPbDBXk2ghGuzusyREioNUABNtELefgph8Dk5TGCph7GAIFfl4L51++CuN1cDUSDamYuiWSn19iLSpXt5tGwkYxsK+ckkI2aO5cM3mxPWwzTjLSNMUGRcwoNSE6kNcHeGs3jhvr41mizuvu4z5Lbf1Sh7esUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6ADhZTN/Bi5nvKo+1rrVTnm9eDj7Pbd3NR0LHePGaM=;
 b=wcmoQsYpsbT1yB8JZrRhDpq4CurtIltZviczWHr0E1gCIVEsc0LXO6D33XmHURu7WBef8YxM3Lgn6NruymKu/XSp8LnxvKuDgVs0SlMCgGnCrP5U3zc2apfkSsHlx9ZQhvVxMVqKIu7BikORHtw/zg57TIB6MpQ8dZ0HhahkhWUJOpX0XfRWyn71/3aTKm/9otm3SxT+bJfRUsABzqLm7R24boFVyuz6DZojmrBMjKvXFslj471kTFrQbmUP3zxVaEtAL7SzDN+VlOXQETItjNjuofZKHPQNekYGFJvkXSJ0lNix4jvCCAIgknZKIdlY9GSZJB9Yr0mrI3kk/hXPvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6ADhZTN/Bi5nvKo+1rrVTnm9eDj7Pbd3NR0LHePGaM=;
 b=reMA14J0BkSPYAJEwKOf5Nv3qsnonHu22mV6u1VyjbyXh0kLWSSmTkNnoE5hdJJdyVdZXWZUhokJcNU3vACX5NdNK0cILINkv0ThMzbSEbQvCgPUYA3G22ZwFOzM6F2wJwXrmKe7t6FaWqp/iXEqBYRd8w4dstLBMJi6+SJzyk0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AMBPR02MB11561.eurprd02.prod.outlook.com
 (2603:10a6:20b:736::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:58:22 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:22 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:30 +0200
Subject: [PATCH v2 16/17] ARM: dts: samsung: exynos4210-smdkv310: sort
 child nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-16-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2972;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=kENmu0sbWNXXwM4GlEAEO0v7RI0x4fZyDeC055kDc40=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOJF2wKhTeSzREv3szP0DTbWExeCuOo2a9brH
 XT+VekzbueJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiRQAKCRCwB25JC3Fh
 a3sYB/98pvA6d4auUTLuOjYDd3tMWtDqFBmwefDyxgrHpHSu2BO3FfLiHnmuBdkOvM42hgSnrbo
 oEzvk/oab/h+Ek9CVlB1Xn7SGOupAPjMG13pcqvS9XMTGlnNe1bNvcxtDfWAwOxFhnTwfQRUiH6
 Kc5eout9Kanhb0pBh6qYG0AIqwoqZaNCX0VkB2mpVf4YYb6iERJ5j7yNp8lxpSlWFUyK0C0KSt7
 AAa/KawkkaDHs59P2JNtjZ2XNiuDBNbFEVzKMgf0y9iZ6/m1ntxWcCapwtzYBRbGQeOTZ8IYVN9
 Pl/08nPDUT5gdODUiFsvTEzGbVCoAsJMjmuXePUGd8CqTW00
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: GVX0EPF0005F68F.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::133) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AMBPR02MB11561:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ce94e3-3cd0-4856-3304-08df23a11e70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	W7ezxYa5RQOZd+7NoEnkARBSdAZkPOxpCuAexoj9FD8IyGXlsyCxtqZZXH5mdyyMLbfrQ8ZTONdOS5mIiTV1SWEMiukISAYyGNZhWtgCpr0SXoMo3uy5ku7U2aS4KRriEFq+RaoONCOpIWKvkPCVVZvvC1O9sjUPDdSduhJM2FdbJnEOUsLVGj2MH/GG/X08yWSDk061pH1ukVnV6yyq91KYFWrWC+iYvQiW7utwhH42lRnB8h/f582sLh1t0rUxUBWR94dwqlt8Sv7xizbAgWOnu1EKKQ1b5m92eu6xZrsgfPyVrRGMhQM3ZGez7acQ6iVIh/FQBMFqBwn7ZRxCrNrDqtl1TEJq4fSL07zTlsRoD2ekUZh+rmxEYzxfgbWOYjSfcXzY7E+57qvbfh4BZicxA4HsNSzd4QHn07kAl6YTBbdWha9sP28cmoisxglkoZvpqgjrLq7NtoEYMMYzLT01ZOz9ExGPxnGa9+QhbOs2ZmyXExTuEyvUwULtEgry+bL5x+NxmFexqFPxR6zB8S4BVHflUyhkoHulrmdVbBApGYlFcn8lLMg1nvNS16INoYMpIgsZysm6BPjwFbSs0EPpp6MK7a2ykk4XPg+ricymj5TvyVmAR5vkRktJEJqf4BvJOf8p7NAJgdxAYqKl+nwLaLZxYP55Y29CY/MlyBI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVUvS2ZyQm5aTWpNZktKeDdUbXhnczJBenpJTlFteVpvYnBiN2I4KzZUUXFC?=
 =?utf-8?B?VUN6c0hOc2NKaUo2QzI2SWN0Ym12K0ErdGtXU0NuVWZjN0tDd3FQZXlLWkxN?=
 =?utf-8?B?aXRPVDV2ODVJT2RNWHprMjZjM2IyaXE5VkhiYjRBMzZONlJRMWtLdlQvWHQ5?=
 =?utf-8?B?WWswRWVoNU9yVUVyTVAwdGVlTmRvOW5TditiVlR6bkU1QTNIeHlJdFBrSFpo?=
 =?utf-8?B?U1VJZWpMQTZvUmxBMmxDeTQ4eFRHd1kvSlk5NEx1dTlVYVYzK0lDMWhBSldj?=
 =?utf-8?B?RmgwcVh1RXhhUHJxNjdlVWRRSlk3cjBEMEovOEtxQlpBMXlWdVo5OUZOVlRy?=
 =?utf-8?B?aUc5UXlZTkdtSzJuVTNzd0NlTGlCOWhSZnh2NUR1alRvRk9ja0ZaR01wRkls?=
 =?utf-8?B?SG1zZDZRYll0ZDNha1FrMGhoSXlXeGh1Ykk0T0VzZjcvcFg5Z1ExS2FURU5B?=
 =?utf-8?B?YnJadDc3SlVXT0hySk5YYTJJZW5qSk4zQ3F2WmhwdXNtbXNTNGl3Ym1tU1Zv?=
 =?utf-8?B?RjlEeXUzMnJBd3YzRTVFdmJTbUZqaGlnUnlRQkJNTVl1RXhHQ3hxcGM2N3dP?=
 =?utf-8?B?QmZNNDBnYmVCZlU4OUpySW9JVTNsRnBvV3B4a09DQzVOcXVvVW40YmJBWHFu?=
 =?utf-8?B?OXQ1K0JtVFpyR3lmRjczclBnZy9OT0NhcytqVm1lcFNGeDdReXRJT0tRdEY0?=
 =?utf-8?B?M3BLN2FSeUZDZ0pTWHJKQ2FTTUQ4N0VZSkJNOC9VWUdUUFRSbmdiWGJ0cjJW?=
 =?utf-8?B?WVNwd1ZLeUt0SWJ0aE92b2NIM1VCcnJHY045ZXE4bkpTcXdhQXN0V3JNcG9T?=
 =?utf-8?B?cHMzc3JNQUZkQko3OWdiNGZ3amFzQmYwZ3BSU3VUdGYyR3pHU0lsN3ZyQzlN?=
 =?utf-8?B?M01ZTzVRT1YxR1Y0YWZ3eXN4Y1ZCL1NZZWJHRXVEb0FXZ1lCbzNsRFE5M2F3?=
 =?utf-8?B?RkFRVGtZYjdDMGxPb2h6Tkw0SUZXNEJVdnlJQ0ZiTHlrN0JJNnFwN2lPeTlG?=
 =?utf-8?B?TmdVZ3lTUUxtNnNUWThsMm1qUndFTWN0K0Flb1d3QW9tdGErQlA3Y1cyejBR?=
 =?utf-8?B?K2xrNktCWnFWQTJtTEt4NTZzRGM0aTFRSzJqYnBsRDF6UHRjR1B1N0tvMy9T?=
 =?utf-8?B?RUdyb1JtOWFWZ25EOXVmV0FBRitOWUVSVXo0R0hmMXBOOTg5bDdmb1hMakt1?=
 =?utf-8?B?R0V3czlLT2JPTTU4UWpIMVh6cWtYNWo2cGJXQVB2N1kyMnVSS0M1bDFDVCtv?=
 =?utf-8?B?UUw2WlQ0ZU5zaUpZTU9CeTY1S1MzTTRWQUc4UDJtMkFYcTBkK1ovenMvNlAy?=
 =?utf-8?B?YW5vdy9Qc2g3VWtGUXN5TmlyNFNuQ3p5TTBoMEFDNHFKQjFWZW1na1RzNklF?=
 =?utf-8?B?TUVFdVowM0MwcjYzT01YdzdOcXpLbXgwUjBoakQrYkp2Y0Q4T3djUkpvSm54?=
 =?utf-8?B?YTljSllmRmJNTWRMWGJGRFQzRkwxL1ZBQ0FqL3VnMjdkbWU0czNjK09sVy9k?=
 =?utf-8?B?cDBZRElUazluSzRmcSs5bytFdVFNOHJ6WGJqTjl6QWRKbWJDb0JjbVZOOHIx?=
 =?utf-8?B?MkszcWNXZ2FPYkF3ZlM4Z2gwQVgxY2pPSDAvNVJkNC9UZUROdHZzSU42NDdm?=
 =?utf-8?B?dER2aEFhUlNoZHdKcXNpYVpRT3N0QkFWUmdnL2c4VldMTk9IQnF5a0orT05w?=
 =?utf-8?B?UXh4Tnc4MTAvNG9jMW1PSjdHSEpiQ3dsemhXVVM5TytqTFBFTVAvMys2Wlc0?=
 =?utf-8?B?SHFDNEs3Z0VSYitIQjgvbkFxd3VUd0c2YnFUNDhkTUtxYmZaVHNMczRLdFc2?=
 =?utf-8?B?L3Nwd2dBU1dEWkJXdVYrcVdsS3NTMWhTYkpSQWFkQmlVY1ZkZC9VL3hxOVY2?=
 =?utf-8?B?VnZyRUtQc0xyeGRTRkFwTXlMc2xEU2Nvc0NwaHZaaWpIWERYUERPVDVYVWgz?=
 =?utf-8?B?ZzdVVHBGckpHd3RIVkpxWXphRFpMZEVabVB0RzhzTnNKRVFiOG5VVFU1MmNG?=
 =?utf-8?B?SkZHRXpxbDZGdmhYQU1EdUt5Y05VUXFWUzVkU0N5Z3lkYll6dzVSSDJCK29W?=
 =?utf-8?B?b1p6RnM5WFQxcWxCQ3NsR24vbWNDRTcySjJoWnBPMUdmSi9venRkZlhUTFhL?=
 =?utf-8?B?WlBYTGpqYmt3Rkl1TEFtbUFIazRtajhmYWY4WG12UGV0RGgwQzZDbmFlRHRy?=
 =?utf-8?B?bzRNc0hKNnhwY1hCRnpjWVdPbUV0bjNJZTArY3I5M2hNRFk2dTBYVVRCNGQv?=
 =?utf-8?B?QmUzUU5TTkh4T3ZNa2tSV3Z2aVVIb21wSXdnVXEzNEMySHcyZDVqVFlHQ3No?=
 =?utf-8?B?djhFTkR4MS9keHdLUEIyem9Yd1crbkdEWVVkTnR3UWFkTkRlL2c2QT09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ce94e3-3cd0-4856-3304-08df23a11e70
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:21.8868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goedpI7Ldn4KKuiOgq6t/2/IUWpdTmbDFyVFMUy+UJLBpKbu5ocNTHe6R0LFBLPv4rf2xoyYyCEs5aBhv6ATQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB11561

Nodes should be sorted alphabetically by name. Move a few of the nodes
and child nodes to achieve alphabetical order.

Fixes dt-check-style in strict mode warnings:

  samsung/exynos4210-smdkv310.dts:28: [child-name-order] child node 'aliases' out of name order
  samsung/exynos4210-smdkv310.dts:43: [child-name-order] child node 'xusbxti' out of name order
  samsung/exynos4210-smdkv310.dts:48: [child-name-order] child node 'pmic-ap-clk' out of name order
  samsung/exynos4210-smdkv310.dts:168: [child-name-order] child node 'keypad-cols-pins' out of name order

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts | 40 +++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
index 609853bb840a..5c703efacc87 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
@@ -20,11 +20,6 @@ / {
 	model = "Samsung smdkv310 evaluation board based on Exynos4210";
 	compatible = "samsung,smdkv310", "samsung,exynos4210", "samsung,exynos4";
 
-	memory@40000000 {
-		device_type = "memory";
-		reg = <0x40000000 0x80000000>;
-	};
-
 	aliases {
 		mmc0 = &sdhci_2;
 	};
@@ -35,9 +30,11 @@ chosen {
 	};
 
 	fixed-rate-clocks {
-		xxti {
-			compatible = "samsung,clock-xxti";
-			clock-frequency = <12000000>;
+		pmic_ap_clk: pmic-ap-clk {
+			/* Workaround for missing clock on PMIC */
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
 		};
 
 		xusbxti {
@@ -45,13 +42,16 @@ xusbxti {
 			clock-frequency = <24000000>;
 		};
 
-		pmic_ap_clk: pmic-ap-clk {
-			/* Workaround for missing clock on PMIC */
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
+		xxti {
+			compatible = "samsung,clock-xxti";
+			clock-frequency = <12000000>;
 		};
 	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x80000000>;
+	};
 };
 
 &cpu_thermal {
@@ -157,13 +157,6 @@ key-e {
 };
 
 &pinctrl_1 {
-	keypad_rows: keypad-rows-pins {
-		samsung,pins = "gpx2-0", "gpx2-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-	};
-
 	keypad_cols: keypad-cols-pins {
 		samsung,pins = "gpx1-0", "gpx1-1", "gpx1-2", "gpx1-3",
 			       "gpx1-4", "gpx1-5", "gpx1-6", "gpx1-7";
@@ -171,6 +164,13 @@ keypad_cols: keypad-cols-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
+
+	keypad_rows: keypad-rows-pins {
+		samsung,pins = "gpx2-0", "gpx2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
 };
 
 &rtc {

-- 
2.43.0

