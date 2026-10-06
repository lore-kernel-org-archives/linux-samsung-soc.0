Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152E53E92BD;
	Tue,  6 Oct 2026 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287898; cv=fail; b=J9HdrjY/3AbwNH9gPDVkbc/PZZFIPNVVgWVeNAHEbS8+KW5+qNP1iN8F2nA027RMT6OVZoVAz0en52PLPfAqo3VBFkyrtg5KFkxztVP3G2UhxBAawBsN6sFH+qrTezVolAFRizbInOvQ+3oD+EB3JKOiZy29mMAjagke3WkB0P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287898; c=relaxed/simple;
	bh=3tq1E1EVYIn/MH/e7Z0pnfEPq0fhTEUEHHBRIJFtTmA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qHdR34dyKiva8gnMIwmzfjECeloMOo4ZM7laPmquPJS8sfyqwqg3f0L+VFk0SjNmCOSwPjcVa8s05BlsRjoZSG4z6ghqAlc5fv4xjyQ2uA6DRJ1Mc7d7w040tGPypG0qhuyFCf3WqGrLm8vXoyVgi03IF69gQYJ85CJxSlOqcpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=O2Iifpv1; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="O2Iifpv1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cb9CzxE2bg6WZzMhRF52EiEnlPYWKZKXj2Z5cWsLmCMJerm6yuy8giHWwGcIIsWHBSwXpctJ0qLrcN6YEFA0jItg8E9xerU9X+lfhJNO51EwSDFNyLweaGHlgZGVruur2v6QAZysNxalxARKXyMyp365fV1It7Xv3jOGHdq8ubx32ttdpXmdkTM1z0GphfIbGq7Ca4Z9T2iXj32098cV8PZhbhlKjD97nUFZ5aDiiS5d5xjL+OFQDNPdF/BPj00kCdfOCYHWhF7WZ49almazsYsATc/8ZC+gd1FhJqr3eFbAWU0BHtWhWqxseJzk6BfJky9ra0zPOP6jNx65FFyL2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFpmwPITavAi+mVFxqfyT299O6/p6th9oJChZ5LtH+0=;
 b=gU84hryJXRoEPJ1ISJ/fPdc/7P3Vvn8+vj7baO6kFxBrQH1CmiQ4mQtSICOoXr/YYD2Ppcn0BRbBnBddwwoiKc0n/mzktV3QFKzBKAhwqyGwdtVngkDhIOzM/rm6xHBOWtluG/ti0z8GMPLaR6dbGd46sguH8nwyrYnadFclbrNMPWVjNjSxOiz+Q+G8/+iRc9bjzYOTiJfeQt+BkhOn7yQ/Xm1gxGpDdmWw4fbd3DcI6GiVb3d2bfyzyguJDbWaJ7GNXZzaU6lkYs3x7tJjdGzKpBEl/+52Sth00CC52iuQzud85NjlZktUVvVX6MSvvAcqf5NgGe4ijR0LNhHrAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFpmwPITavAi+mVFxqfyT299O6/p6th9oJChZ5LtH+0=;
 b=O2Iifpv1YrOhSEBpdYe0Qn0OUYeoE1a0GvoffpkI1mcgOJtrXnLlv3+Ej9lORgYQASPoaqqk1kVBubZkC18Qc28LiRWWC5/TGD3I5Z4jjyK178MyQyLoizjx2nb/UoaqWIU2XWx1cIzn+oSjfMIOFj05R7ZhH3DlnUsJkLIktjk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AS2PR02MB10002.eurprd02.prod.outlook.com
 (2603:10a6:20b:606::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 11:58:06 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:06 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:17 +0200
Subject: [PATCH v2 03/17] ARM: dts: samsung: exynos4: sort all properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-3-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10467;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=3tq1E1EVYIn/MH/e7Z0pnfEPq0fhTEUEHHBRIJFtTmA=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOIsh1dlwY8npUPh3/DVzqhr1D4tXy8NRPCLg
 NsZC8wa0eWJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiLAAKCRCwB25JC3Fh
 a35MB/4g01CPDqwJ3A92MiCKn2mIuAi3Y8hnrO33MZih4CNg+8gCKRy3wL/pOVZsGxr2ALpPyZB
 +YDlIiYVSjlLxOgo+R6KUZphfBikfJ+kmX18Ki0SLuGd0100TV/dZRWxdGEX/NeoxVcUKbUJ+4h
 tS5U2Us9+xkLqeh+anomFf1K3FGHjFfgYrmysDFF5qDH6u9pTtcFUO5ztyhGnbEw+5ml7odHuQ9
 KOuAkFwEI1QgRftWi1ziF2R0uramihdYysElkHp9MMyaJsAJ2arBchgXn4RzuxMVvEXkZ7ptf7G
 5T7gDcD0YRiWxzaYhT91NFIcWPrIcSQiO9W15PFQUiOz7F25
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: BE1P281CA0307.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::8) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AS2PR02MB10002:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d674c2-3551-4be1-2fbd-08df23a11516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ezviu1h/vGbWcM/vXs/CqmNQANsSlqXEd2Kw1m+pZelbN+BitvkwdGQGB/0SvVtpIHOO3xxJKG3r/B0KkcbUmJB3AOzMoEiNP4P6SHkoA6ePSUbtnIbJlznwelct+KRC63eAiism6s9d9wOt2caLnm+Rr9SNZoAXGZ9WY77gKYG8f1HWa7mxXNdiiMcvty96AD9TOIKdNQh0YAxVY4rA4yTHR7d1CiFmPg1uygIh8kS2p5FAFif7t5vtbcqYqwJnsezD6AVrNE0H6cZkShfaS9C8nw2/NcseybadM4WtovYznDsgJSZW/1w+Cd/2JupuSwNO/bu5JjdqelJlIuQ5WkVIo1HbVLx8QMCgMHppSpQflw+HFGBaZEvuUyDtiAYeKPrMDbT5vzqzjR6HGyAvpMz5mtngKCxZXbFgoIRcvDfauvTTo7LZQssfKFpuTLuziMDhHFm+pvO2yIERg8gjoPljt4djLU+QhQTl8Re+rG3zXlwJW4rgELAK+IlFFpmE8Ku5cB97sI1iDTowFtFSBCD44BmbOlQPiSmIZ9DzLfD15rsgh2SG0NyM1Pd7+o8rLz8Vd0tP0ZGIRms7/0s8yJJKvvnNm0Jt1eZxx8R65NjJEdTM4jHyIyxDGdpjBTIRtXBQY3WmWHIi0fXGnn1TFhf3Voru27H3zCPFMtEIoX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHFFNkVlODJDdEx1WktiaDJwTXVNL0N6NVF1dlNqTFNMTC9lZTJjMTQrcDlT?=
 =?utf-8?B?ZWNudFNKRktpbzdhaGdUNnpzdnJITnpEN04wZmNDUXcxRHdDRCtvVEI0dkVq?=
 =?utf-8?B?M2RuT0l5TjV3bzJBSVlDTVlOL1hxdW01UWlaRE94OGVVUFo0cS9iR2tBelJ3?=
 =?utf-8?B?MW1jMVFxRWNkdnBRNTVNL0huL3d0OGNEU2hqVGZnSE5nc2dnamZBcHRKK0xz?=
 =?utf-8?B?VkdYaGRxWDhRZU5MelhBVW9oUmlKWU9QcGJFeWxaSHh6WHV3RGQzSVd3WEhP?=
 =?utf-8?B?OWNVaU5mYXFNdTc0bVVkNGVaQkVsYUVpYmdVNUpwdGE0SGRkSXVCZk1GWjRP?=
 =?utf-8?B?TjY4eTNvczlUM3pRR0NwL3ZGd01zQ2VXT2JMM3FFa3I0ODZmZXVlSFhIckFx?=
 =?utf-8?B?ZEtydkFUalp0SVVnNlFqandMTUVtNk16Qkp4V2wvN3V3SVBBVVREUmZvNGpi?=
 =?utf-8?B?SzhGMlFjdDVsOXVZUU9QaTZ4VHFHeDZKdTdUSXB6KzVJcW85MlBtNlZtbzMv?=
 =?utf-8?B?WlVDbVAzeXhRSDdON1l1MkxBVEdxaXE0MWNDSXhDVUFzbm9rbnhOQ1ptSVlC?=
 =?utf-8?B?REtlbm85aHN1QkJ4Z1o3amZ2Vkc0OGVaM2toc2dRZTVrL09kdHpEQVRCVXoy?=
 =?utf-8?B?VnZVcWRVS3Z0TUROMGNCcC9CNm94SGQrZHNmcVpvL3ZiREJGNjhtSU1Ncmps?=
 =?utf-8?B?REhIZzVGWUV2S25hSGdQZVR0cnk1a2JwVlJ6ZkpwVFNIRDZRWVpZTkVRUFBi?=
 =?utf-8?B?VmVjc1BlZ2VaWHd6QlUwWE9JWmlqOFJZUjJ4SUplSk5iSXFVWDkvMHBaVGl6?=
 =?utf-8?B?UEkwMUd0OWV5dFpXc3hoKzk2Ni8xUWJ5b3QvNHZSTmoxSm9vMERjcVQ2VUIz?=
 =?utf-8?B?MXF0NzR4UFNsc0JXSnR5MXpMa2YvcUVIOGdscGRzcVp0V21rbzRhU3NZdTRK?=
 =?utf-8?B?QnUycVdyV1ZnRXp1YWNUN3c3WGVsaEkxRHRZSlNCV1ROazcrdGpSeWFYM3pB?=
 =?utf-8?B?aGtET2FVVUFIZ2piU0VwYzNtNVhhQ09QSnd6SFNiRGJOU3RQU1A0dVpiNndt?=
 =?utf-8?B?bCtBN1kxVjNyZHpMUkFJYitjOFlqdU8wZWgyR0Z0ZW5GV1g0Y09XZU1SU3pW?=
 =?utf-8?B?NFNZWWI0NnBoK3ppbkJkYjU1SVRNNjBiYXVWOGJXM1l3enZZRVRLaHQ2QVg3?=
 =?utf-8?B?TWY3ZjEvdHFRM0IyeitFQmFjYVRDM1ZqckpaLzRndGRPMjQ0WE8rYjNEV3BO?=
 =?utf-8?B?S05iRnYvT2tLUnlTRW5xazlhTHllaUY5cG81bDkzcmtNVmJMaGtVTFhoVGJZ?=
 =?utf-8?B?azJXN0VoZDZlSjR0UkRRa0M1QVFDSjAwakNOZ25LRnR1UVNycGNsd1p5Y0hI?=
 =?utf-8?B?aVpOQlpDLzR5K3pobm1pLzFvNWxFbGNvTmdkL09yMGVSZCszbHp5VXQ5S1FL?=
 =?utf-8?B?MCsxT3paS3lLVERpam80azVCYmlIVHZjQ3pJN1dsV3NPRk4yVDRobTl6WWQ3?=
 =?utf-8?B?dE5tb3RScFFjUzBoaE1zRjMzZTlBZ3NpT21hVklBcnliZzkwM2JIaGd6RWJo?=
 =?utf-8?B?SVorNG1zd0tkUlNXRmxvYjBuNzhBSlhKMHpDZ3hPNFcyUjRIbzY5NDN4N2dv?=
 =?utf-8?B?bklZS1BLc2Z4SnF4V1JJTEpmZnlpSHY3dnJiSFBGU0YwQkpuakoyTi9JVHNZ?=
 =?utf-8?B?dmV3OEhIZ2Y3V3ZUUE9nMWpNdzVTcWY0ODhpaldYSFk5RktlSGFocjZHNkh5?=
 =?utf-8?B?cTlhTkdtcUdSQUh1d3dubDQ4ZlF0VVl1blQzU0hBUjZHd3Vnb1ZQSUphT2pX?=
 =?utf-8?B?bGxCM2QwNDA5MDN2MW9MMGJtTnVnR1ltQWc5VzlhbURLZHYwMi82a1l3N3Bp?=
 =?utf-8?B?V2pIcmtzYmxlc25TMkRWMlBzUFh2cWlWN3ZiZXJxWnl3WkhucG52L2VOTnJY?=
 =?utf-8?B?YmtIc0d1bTQrOUdsSjNkM3hNUkNvTU4zc3d2a3ZlQ3hNWHpmMXlUV2dIU201?=
 =?utf-8?B?NlFDWDNoR2xkaEZyMFFIVzZ0ckZLK24wSC9GQU9pOCt5UEtTY0FocXZIM0lN?=
 =?utf-8?B?OXc2aE1ZYTcxMW9QNm9FRGs1OFVyeXlXSlRtc1hYWC9pckVzQnlLOHF2N0dO?=
 =?utf-8?B?eU11Zlh3RnpBVUpzM1cxTEtRbzdpMy9wRmNsVHY3ZE1hNTY0QWo1N1p0Um15?=
 =?utf-8?B?MWF1WUNaM2dVbGRkQUl2OXJWb2NQcEt2cUNRM3VPb0hlOHgvREh2MlZwa2x6?=
 =?utf-8?B?dlNQWHdvN3VMOGRnQitSdDRsOVRUMGFNbHdiWURaU0NJUEh4ZjJYQXI5VEpP?=
 =?utf-8?B?M2VNLy95MWg4UVU4NnhGZnNnR2tvL1cxeW0wUGxIeFFTenJnUGo5Zz09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d674c2-3551-4be1-2fbd-08df23a11516
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:06.1622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ep8okSsdTgcVDq4bXH+ryy+Vxyv7Xr2NUyQT27FxfcxtMWJYQQOUW1sPdTyq/2BWeUBUvZlvOet3uDS0jl7s0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10002

Fixes dt-check-style in strict mode property-order warnings like:

  samsung/exynos4.dtsi:226: [property-order] property 'iommus' out of canonical order (should sort before 'samsung,sysreg')

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4.dtsi | 89 +++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
index f69b01423ae0..43cbbedbfe41 100644
--- a/arch/arm/boot/dts/samsung/exynos4.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
@@ -60,9 +60,9 @@ pmu: pmu {
 
 	soc: soc {
 		compatible = "simple-bus";
+		ranges;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges;
 
 		clock_audss: clock-controller@3810000 {
 			compatible = "samsung,exynos4210-audss-clock";
@@ -86,8 +86,8 @@ i2s0: i2s@3830000 {
 			clock-output-names = "i2s_cdclk0";
 			dmas = <&pdma0 12>, <&pdma0 11>, <&pdma0 10>;
 			dma-names = "tx", "rx", "tx-sec";
-			samsung,idma-addr = <0x03000000>;
 			#sound-dai-cells = <1>;
+			samsung,idma-addr = <0x03000000>;
 
 			status = "disabled";
 		};
@@ -159,16 +159,16 @@ pd_gps_alive: power-domain@10023d00 {
 
 		gic: interrupt-controller@10490000 {
 			compatible = "arm,cortex-a9-gic";
+			reg = <0x10490000 0x10000>, <0x10480000 0x10000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
-			reg = <0x10490000 0x10000>, <0x10480000 0x10000>;
 		};
 
 		combiner: interrupt-controller@10440000 {
 			compatible = "samsung,exynos4210-combiner";
+			reg = <0x10440000 0x1000>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
-			reg = <0x10440000 0x1000>;
 		};
 
 		sys_reg: syscon@10010000 {
@@ -198,22 +198,23 @@ dsi_0: dsi@11c80000 {
 			phy-names = "dsim";
 			clocks = <&clock CLK_DSIM0>, <&clock CLK_SCLK_MIPI0>;
 			clock-names = "bus_clk", "sclk_mipi";
-
-			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			status = "disabled";
 		};
 
 		camera: camera@11800000 {
 			compatible = "samsung,fimc";
 			ranges = <0x0 0x11800000 0xa0000>;
 
-			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			#clock-cells = <1>;
 			clock-output-names = "cam_a_clkout", "cam_b_clkout";
 
+			status = "disabled";
+
 			fimc_0: fimc@0 {
 				compatible = "samsung,exynos4210-fimc";
 				reg = <0x0 0x1000>;
@@ -221,9 +222,9 @@ fimc_0: fimc@0 {
 				clocks = <&clock CLK_FIMC0>,
 					 <&clock CLK_SCLK_FIMC0>;
 				clock-names = "fimc", "sclk_fimc";
+				iommus = <&sysmmu_fimc0>;
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
-				iommus = <&sysmmu_fimc0>;
 
 				status = "disabled";
 			};
@@ -235,9 +236,9 @@ fimc_1: fimc@10000 {
 				clocks = <&clock CLK_FIMC1>,
 					 <&clock CLK_SCLK_FIMC1>;
 				clock-names = "fimc", "sclk_fimc";
+				iommus = <&sysmmu_fimc1>;
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
-				iommus = <&sysmmu_fimc1>;
 
 				status = "disabled";
 			};
@@ -249,9 +250,9 @@ fimc_2: fimc@20000 {
 				clocks = <&clock CLK_FIMC2>,
 					 <&clock CLK_SCLK_FIMC2>;
 				clock-names = "fimc", "sclk_fimc";
+				iommus = <&sysmmu_fimc2>;
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
-				iommus = <&sysmmu_fimc2>;
 
 				status = "disabled";
 			};
@@ -263,9 +264,9 @@ fimc_3: fimc@30000 {
 				clocks = <&clock CLK_FIMC3>,
 					 <&clock CLK_SCLK_FIMC3>;
 				clock-names = "fimc", "sclk_fimc";
+				iommus = <&sysmmu_fimc3>;
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
-				iommus = <&sysmmu_fimc3>;
 
 				status = "disabled";
 			};
@@ -281,10 +282,10 @@ csis_0: csis@80000 {
 				power-domains = <&pd_cam>;
 				phys = <&mipi_phy 0>;
 				phy-names = "csis";
-
-				status = "disabled";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
+				status = "disabled";
 			};
 
 			csis_1: csis@90000 {
@@ -298,10 +299,10 @@ csis_1: csis@90000 {
 				power-domains = <&pd_cam>;
 				phys = <&mipi_phy 2>;
 				phy-names = "csis";
-
-				status = "disabled";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
+				status = "disabled";
 			};
 		};
 
@@ -370,10 +371,10 @@ sdhci_3: mmc@12540000 {
 		exynos_usbphy: usb-phy@125b0000 {
 			compatible = "samsung,exynos4210-usb2-phy";
 			reg = <0x125b0000 0x100>;
-			samsung,pmureg-phandle = <&pmu_system_controller>;
 			clocks = <&clock CLK_USB_DEVICE>, <&clock CLK_XUSBXTI>;
 			clock-names = "phy", "ref";
 			#phy-cells = <1>;
+			samsung,pmureg-phandle = <&pmu_system_controller>;
 
 			status = "disabled";
 		};
@@ -396,10 +397,10 @@ ehci: usb@12580000 {
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_USB_HOST>;
 			clock-names = "usbhost";
-
-			status = "disabled";
 			phys = <&exynos_usbphy 1>, <&exynos_usbphy 2>, <&exynos_usbphy 3>;
 			phy-names = "host", "hsic0", "hsic1";
+
+			status = "disabled";
 		};
 
 		ohci: usb@12590000 {
@@ -408,10 +409,10 @@ ohci: usb@12590000 {
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_USB_HOST>;
 			clock-names = "usbhost";
-
-			status = "disabled";
 			phys = <&exynos_usbphy 1>;
 			phy-names = "host";
+
+			status = "disabled";
 		};
 
 		gpu: gpu@13000000 {
@@ -517,10 +518,10 @@ serial_3: serial@13830000 {
 		};
 
 		i2c_0: i2c@13860000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x13860000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C0>;
 			clock-names = "i2c";
@@ -531,10 +532,10 @@ i2c_0: i2c@13860000 {
 		};
 
 		i2c_1: i2c@13870000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x13870000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C1>;
 			clock-names = "i2c";
@@ -545,10 +546,10 @@ i2c_1: i2c@13870000 {
 		};
 
 		i2c_2: i2c@13880000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x13880000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C2>;
 			clock-names = "i2c";
@@ -559,10 +560,10 @@ i2c_2: i2c@13880000 {
 		};
 
 		i2c_3: i2c@13890000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x13890000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C3>;
 			clock-names = "i2c";
@@ -573,10 +574,10 @@ i2c_3: i2c@13890000 {
 		};
 
 		i2c_4: i2c@138a0000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x138a0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C4>;
 			clock-names = "i2c";
@@ -587,10 +588,10 @@ i2c_4: i2c@138a0000 {
 		};
 
 		i2c_5: i2c@138b0000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x138b0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C5>;
 			clock-names = "i2c";
@@ -601,10 +602,10 @@ i2c_5: i2c@138b0000 {
 		};
 
 		i2c_6: i2c@138c0000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x138c0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C6>;
 			clock-names = "i2c";
@@ -615,10 +616,10 @@ i2c_6: i2c@138c0000 {
 		};
 
 		i2c_7: i2c@138d0000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x138d0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C7>;
 			clock-names = "i2c";
@@ -629,10 +630,10 @@ i2c_7: i2c@138d0000 {
 		};
 
 		i2c_8: i2c@138e0000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "samsung,s3c2440-hdmiphy-i2c";
 			reg = <0x138e0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C_HDMI>;
 			clock-names = "i2c";
@@ -740,8 +741,8 @@ mdma1: dma-controller@12850000 {
 
 		fimd: fimd@11c00000 {
 			compatible = "samsung,exynos4210-fimd";
-			interrupt-parent = <&combiner>;
 			reg = <0x11c00000 0x20000>;
+			interrupt-parent = <&combiner>;
 			interrupts = <11 0>, <11 1>, <11 2>;
 			interrupt-names = "fifo", "vsync", "lcd_sys";
 			clocks = <&clock CLK_SCLK_FIMD0>, <&clock CLK_FIMD0>;
@@ -754,12 +755,12 @@ fimd: fimd@11c00000 {
 		};
 
 		tmu: tmu@100c0000 {
-			interrupt-parent = <&combiner>;
 			reg = <0x100c0000 0x100>;
+			interrupt-parent = <&combiner>;
 			interrupts = <2 4>;
+			#thermal-sensor-cells = <0>;
 
 			status = "disabled";
-			#thermal-sensor-cells = <0>;
 		};
 
 		jpeg_codec: jpeg-codec@11840000 {
@@ -793,8 +794,8 @@ hdmi: hdmi@12d00000 {
 				      "sclk_hdmiphy", "mout_hdmi";
 			phy = <&hdmi_i2c_phy>;
 			power-domains = <&pd_tv>;
-			samsung,syscon-phandle = <&pmu_system_controller>;
 			#sound-dai-cells = <0>;
+			samsung,syscon-phandle = <&pmu_system_controller>;
 
 			status = "disabled";
 		};
@@ -805,18 +806,18 @@ hdmicec: cec@100b0000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_HDMI_CEC>;
 			clock-names = "hdmicec";
-			samsung,syscon-phandle = <&pmu_system_controller>;
 			hdmi-phandle = <&hdmi>;
 			pinctrl-0 = <&hdmi_cec>;
 			pinctrl-names = "default";
+			samsung,syscon-phandle = <&pmu_system_controller>;
 
 			status = "disabled";
 		};
 
 		mixer: mixer@12c10000 {
 			compatible = "samsung,exynos4210-mixer";
-			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0x12c10000 0x2100>, <0x12c00000 0x300>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&pd_tv>;
 			iommus = <&sysmmu_tv>;
 

-- 
2.43.0

