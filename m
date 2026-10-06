Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69783EA979;
	Tue,  6 Oct 2026 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287910; cv=fail; b=trL+DkQ8xaWcHlx7ijjVc+R9ai9CzzP4Prw63Z8htHTCq8MWs+wRo9+A0zwTbvlk6pfe2lmPAZB8O3gaqog3A9UtS3n9B9ajFSl/CzSPceTXr/7KdpqNiC27oIt1HepgXcS00WODhpWJabgm5cSuVdRgs8rMuhLWbP1HboJnBvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287910; c=relaxed/simple;
	bh=12dBiPIPvNOyV5TSXtyJHrBKRlYTy6U/pCFKP/0of9U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=N+/09RdPYInOWRm4yi08olCr1ojhfl9PP03aD+XOCklCzQm2+5W+OhDl+R6jt4RLAlIL02tWmGnvxsG3QMbzTgbYUI8zX69Y+ITEPzozoo1jHtFQ/dGuWp80ZTbXbustD9uSRVJtpJs+cvbkD8reQuxs/UlJh5gWQy8vA9xyvzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Yn3a686Z; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Yn3a686Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNL1EkE5OUMrpx2XowSdF2RnBsjF7b4PN9fyIteRsu0gA177s4kvJcQ7P1F2CiVtvFWpJ+YKPgIBAhnldzC2APDEXCnbTcP76gFemyf7cFlMfidQPXbygqL2SGZMrBikuSTqk8KIqGDYQCEn+RJxTnl1IyOrdr9+DUvRoERVH5a3PpWyrbidRn2gc5eMOU7o2u9VsgueLi9ayuYfLCpWapWzIIsvShjSLiVYwpp+3oZfA01nvUa+3o5aK3D/upH4CG6XZG10wgOnJM1gO6e5YETsD6ycqkFy0kSx8ovxso7ZpVwOxAUQ3roaY7HTv6UkP2gVVYPOgYO7HEPkOuYGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFDcVnIwA/5yJ8DHnUNx0lsJ9ki9JmtdAOVMqabk6gQ=;
 b=opZn+srOulH6gBsBEAwduOv6qG2rj6O22qwfAuv68bDvqLD9VA5D5TvubbE1Fl98iDPmQ7h/31Hhvc5Gtp4FNG9YtSp9DPK3TyhdIej69ABWG3SrpqEa8QS/iemAAH1jOdeJ2s6kupnwxeY4jSELUbezx0wy5UOnLobO9MDQO05DlSR3QMLWMRQEvIo+9riw6E+2ACFApciqHzL+O4r+kWVC+WfOS8/4BJds/U+2zBvbL45fMbOSEkG6pvtCjOs1qSAzkyyn5hyVMzBRrrloh7HyWHPECEnWR6sOulxqEKLeLEuWSLe6vq63cEXlO77xJDigork3YiNdYlrRcYcEiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFDcVnIwA/5yJ8DHnUNx0lsJ9ki9JmtdAOVMqabk6gQ=;
 b=Yn3a686ZsRrZYpj13v4ihky5xmaPXh2bFb0pMo8rOV+qIz+V0q66cS8W3YSHzKkdDt2XZKlK0vjRDyjehO8pn1me6mcHozH/zrQLCaNtxHV6bZHUviSuGhlEGSN6dQsMyHneJ0FhaVxiOmfFi5R/eL5x0IfqYdT68AbmjrMUedo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AS2PR02MB10002.eurprd02.prod.outlook.com
 (2603:10a6:20b:606::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 11:58:12 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:12 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:21 +0200
Subject: [PATCH v2 07/17] ARM: dts: samsung: exynos4210: sort all
 properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-7-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3393;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=12dBiPIPvNOyV5TSXtyJHrBKRlYTy6U/pCFKP/0of9U=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOI09KvCm5snvwUwD+g1F47GmJkRIlU5htDk9
 LDvz+vTVe+JATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiNAAKCRCwB25JC3Fh
 a3d5B/4/sfvC0F9Jm9UiRW8gDx5+GwTnXP8gjpVni0gzx21D0CXP8nMri8NjgaUkt5eoMqprOfO
 TOpb3C5TjMVHLTXL1Js4zSngVxvZi/AtRCu7rA1dj6UEnh8dKWTiBu0/cg0jjejh7gozuI8lJST
 A43zt3g39l+UwGRqd8zCW6VEYoSfPkvsgWJo63ti91wDOfOj0jlDmcqYXsyuWEzuCNMk4M1WQ9S
 B3S4t7IWVDoP9cIS/17I+u0Gw1V4PYIYNQv8psfXTnRzxrXPEKH+BUX5FIPjjxnXwjqszgQg7rW
 9cL88hXKMCgnLCd6H+wXr9TJvENB/6qSkNv5cdbc8P7ZraC+
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: BE1P281CA0239.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::14) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AS2PR02MB10002:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f75ddea-cf9d-4ba1-2ef2-08df23a11819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	kO9ktnpymLSSZoiHyhnMVn2k1Nxphgukv7Vaf39WGmnNaTBsDIYipwmgaqElFgVfvlPWmeNjVzYopKoqxmkNMgs/YkukLAiPO13A0wuoCg9rc6/EeT8/7caDffoLchrDptcwDdCCEQUH3mlJyIBYanCbJpiAknoMEMzJ+eZEH2tp+863rmTe3fXwPkDrM/q73y7n9KUJeS+UYKFeNwWGEHhu8VbIkwnenqHxt5WQVpdMPsoXZfP5AyYxnahPdsiZM8PRZ+GJOQfRfZUVrOaueAm83eNaxaWx20hO5w0O/cqxQzzaQiXwVcBuhWmnzP8XbZw3mP6yBAuGY1YnYeBxgLkBwcCJJVNDU48FqUhEfV4GWOT88M0JHnLF6ENfnbfdckBNf0rugxA10fzi9jSgnL6cYD5DoYE36o1KRHKQRS/8wzL0qNQym/tT2D5fF+9cQGbDVbyIYUDlK2zol9g2HTkBNZCCHk3yTkZQw6ccMHFcogWq5LRhppiOGX+s9D646blzgIqc/cvAUqg1jmuvtprRCPqMJYawGFklM4K8gkpWcC4eVAQ3MJshTyrJNzZKKfrAptpG7OX+I0JlM+Lt3/NlluyAyemJxcOME0e9P0oZileEnKMYf3BL3YlnQKQWW99Tg+V/GLPr6U3PUn6+O5koQZHNwVDNT0nF+Vz78Rs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yjl2SW50WlhWNUZQeHhWTDY1QmN0OFVYR3NyaVBONmZPSXo1ekZQU1RPSEZR?=
 =?utf-8?B?cDJKNmZpNjBzU1lEV09oV2lraC9KYTdjOUFiQ0s4aTBaUzBDL2J5SEorK3R0?=
 =?utf-8?B?cXhUV1JSb3JWY1N0c3YrcjBwNUJRWGJVbnRGZjNzTXFSaGV5Y3ROZ2h4YVFO?=
 =?utf-8?B?Y0JPN3pMc2Y1WWY3ODdLNWRTVGF1bGJJclpRdm5PL3dRVFovaXd1VjNYbnR3?=
 =?utf-8?B?UWtBMG1VRllyRm5NZE9mQnptSWpVNFdtdjhqNHprMHFsV3JZVWF2a0J5YStV?=
 =?utf-8?B?b3h1Z2JaZkljaFBNTmtDekVVdTdPTXUrRG1DaHpCOXZaTmxkRCt2TWdJUEsv?=
 =?utf-8?B?NlU3MHRWWkhqdFBnQk9EWUoxUUV3RXNNMWJCeFFOTitsT3FuR3dNNkROL0Z1?=
 =?utf-8?B?cko2SC9WR2pXRDlWK3VHNGFWT0NXbmhMci9zVGZxaWtadmZOb3BxREhabUt1?=
 =?utf-8?B?YjUvc0F5QnlJZTNLNG8wQ0pKWlZqWEhDanc1aFZwdFcvVnR1UTVxMmYwYmE5?=
 =?utf-8?B?djVjbVVXSUtLOXQ2NDJoY0ltaFA0WVBmcC9Cc21XNEFPbFVNQ1ZLc2s0ajNl?=
 =?utf-8?B?NWtWNEwxdlhwZjh0NG1BQjFXUXJJbHFEVVNmblY4Z3loOUZFQmlYUTNuempH?=
 =?utf-8?B?cEVLbVRuRnkzUFdVNWNJbG5PRU5jYndsdm9GekFzRkZYRTk1OHlaOURzTWNS?=
 =?utf-8?B?RUNIOWUvTkkzdlQrMlVZcHZRK1dlTzhvQnlhK3BkbWtMK0FGRVpRUWorZzlP?=
 =?utf-8?B?ZGZVOEdQcG8yN0dqL0pZUUJkYkg0Q3RmdGxmVEo3TXVzeUpERHQxL1ZGdVZL?=
 =?utf-8?B?MmhaSDlock1ScGRPVUljRjF4SW1Ra1AyOGxHbmNnc3VWdUFiM2JvRXZuMWNF?=
 =?utf-8?B?VDJOb2ZkVDB4bjJDdWsyN3dCRTJCQ0Fqa0ZwaGZSQUJLUlZMSXVCU3pOS2ls?=
 =?utf-8?B?bXpmcWYyTXNSdnh5amFDTHUxaUF5K2tESStkVEphQWlva1l6NzNLaldJcXpi?=
 =?utf-8?B?RmM3dXZxb292SGcrY0FWQ21nS3V6ODJHZzhqOWZ2K1JmWE9HYmhCNm9taW9w?=
 =?utf-8?B?ZEgxVnhoN1BxYWN1NVhOMmZCK291SEt5STVGZ2VRQzVVSXJ2UDY1REkvUWty?=
 =?utf-8?B?MXUwTXhta3hZRldlRUNsd0tzakJJZU1Fa3FkVTZnNXZPZXB3dy94SWt0Q1dD?=
 =?utf-8?B?MVhmbENseUgrbVVWVFUxUXpLeGd6K3ZjNkxrK3FhTWFGbkVORi9BMjNEVHdt?=
 =?utf-8?B?RTR2QXdYcmZWSnBUVUlQeTBQejFHUnhFVFBjNTZnTFhyd1RhZW40T2lPTlNk?=
 =?utf-8?B?bVRkUDFaZWo2WDFEM1R2Rnc0VWlrTkpCNE5NNElaWFI5R3FlTlcwaG9LbzJI?=
 =?utf-8?B?NUpXR3grN0h4RXlIYTI2bkhFRlVmNE8wajFQdjFIZHRCSEtvQmlwMy9vK1FB?=
 =?utf-8?B?b1R3MTlhNTNxeHYzaU1uVHd4dE8xVzU4ZnJQRTlnZWJMS3VzczBidWNkeHFl?=
 =?utf-8?B?OVZYZDdRR01qNFV5ekEwNTJTaHp6L2RUdGJpSml2QXJ0SUMxM0FRT1F4eWJw?=
 =?utf-8?B?ZUUrSFpVV0V2ZHlENFFNWWVJVlltb1VSOFZnSzZnbk9qTjR1bGtoeWNnMlNn?=
 =?utf-8?B?eDVrQjFGbElWd1NhSVpaUHI3L2x3V2JFWWN2Wi9WektZNk9DVHE4eCt2VEVD?=
 =?utf-8?B?d012ejlGeW5vRnQ2ais2TmpDMndrV1oxTGFMR2piWEpNOE9lckFsWEhsU3dX?=
 =?utf-8?B?SlhWTTZ2aEJJMWRuU0FpSmYxRGRFU0kxM1FwK0ZSaC9QSk1LbmxqRE1wcmxm?=
 =?utf-8?B?RW5GQUFYZjRQU05tZksxci9aOTRBSmQrTlRjRmp6VjhsUS9rTjFBeDhQV2lM?=
 =?utf-8?B?Kys5OHJUUmhqZmlyZXVCMHNwWHFsODg1dzFSUFRXZG0vODJlcVhzSmxDcnFy?=
 =?utf-8?B?TTBBWHV0ZGpEZDdNTE1mWFF6M2ZEeWVBTmw0bm9hZDZ1WldBdGl1OEhZY2ZC?=
 =?utf-8?B?WnVjV2lVN3lkZTA4bmxjblRyOWN6Y0krWlY0Q21iN296SjNWVHArSGdQcEdo?=
 =?utf-8?B?dnNrMnV3cVdSMGpPSDJxNXpvSG9FRmVBR2cva3phWnkxZ0s0UDhzNGNxNWZX?=
 =?utf-8?B?cldPcnMvem1JOVlNRzhFckh1NTY0MEVHMU1zNXFrdkpCKzdwTk5iQVRsYWxV?=
 =?utf-8?B?UHRNelphNEIwbU90TlFtNFc4VnluYlhXUmxDa2RvbXM1aEE5RXNsYngrMmMr?=
 =?utf-8?B?K0pwV25yTmw3V200akxFVVFFOWYxS3JlM29yNWJUMUtUUlVSeUVMbyttaFpX?=
 =?utf-8?B?NnhIeUJJQVZ1eXZtSlhYTkI3OFBpaFdYOEFyRHdkMm5SNkU2enBsdz09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f75ddea-cf9d-4ba1-2ef2-08df23a11819
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:11.2348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fz7+k7lM19ENujmAFtHVFKkrm4FZ2WsHlaDBO1vWoTxa98eQWxIf0WY9bZKUWdpdSX8NvdzS+NKRNnd5R7wPmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10002

Sort properties according to the preferred style for increased
readability.

Fixes dt-check-style property-order warnings in strict mode like:

  samsung/exynos4210.dtsi:393: [property-order] property 'reg' out of canonical order (should sort before 'interrupt-parent')
  samsung/exynos4210.dtsi:440: [property-order] property 'interrupts' out of canonical order (should sort before 'samsung,combiner-nr')
  samsung/exynos4.dtsi:745: [property-order] property 'interrupt-names' must be placed after 'interrupts'

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dts/samsung/exynos4210.dtsi
index 66f35c4ae6b1..d37ac0c97dbc 100644
--- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi
@@ -267,9 +267,9 @@ soc: soc {
 		sysram: sram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x20000>;
+			ranges = <0 0x02020000 0x20000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0x02020000 0x20000>;
 
 			smp-sram@0 {
 				compatible = "samsung,exynos4210-sysram";
@@ -359,11 +359,11 @@ pinctrl_2: pinctrl@3860000 {
 
 		sysmmu_fimd1: sysmmu@12220000 {
 			compatible = "samsung,exynos-sysmmu";
-			interrupt-parent = <&combiner>;
 			reg = <0x12220000 0x1000>;
+			interrupt-parent = <&combiner>;
 			interrupts = <5 3>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_FIMD1>, <&clock CLK_FIMD1>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_lcd1>;
 			#iommu-cells = <0>;
 		};
@@ -392,8 +392,8 @@ sysmmu_g2d: sysmmu@12a20000 {
 			reg = <0x12a20000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <4 7>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_G2D>, <&clock CLK_G2D>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_lcd0>;
 			#iommu-cells = <0>;
 		};
@@ -436,7 +436,6 @@ &camera {
 };
 
 &combiner {
-	samsung,combiner-nr = <16>;
 	interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 		     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
 		     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
@@ -453,6 +452,7 @@ &combiner {
 		     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
 		     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
 		     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+	samsung,combiner-nr = <16>;
 };
 
 &fimc_0 {
@@ -523,11 +523,11 @@ &mdma1 {
 };
 
 &mixer {
-	clock-names = "mixer", "hdmi", "sclk_hdmi", "vp", "mout_mixer",
-		      "sclk_mixer";
 	clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
 		 <&clock CLK_SCLK_HDMI>, <&clock CLK_VP>,
 		 <&clock CLK_MOUT_MIXER>, <&clock CLK_SCLK_MIXER>;
+	clock-names = "mixer", "hdmi", "sclk_hdmi", "vp", "mout_mixer",
+		      "sclk_mixer";
 };
 
 &pmu {
@@ -538,11 +538,11 @@ &pmu {
 };
 
 &pmu_system_controller {
-	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
-			"clkout4", "clkout8", "clkout9";
 	clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
 		<&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
 		<&clock CLK_OUT_CPU>, <&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
+	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
+			"clkout4", "clkout8", "clkout9";
 	#clock-cells = <1>;
 };
 

-- 
2.43.0

