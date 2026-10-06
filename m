Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF6B3E7635;
	Tue,  6 Oct 2026 11:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287890; cv=fail; b=NPgEsUvg+Adm03k9yIe+mJBxNwJPCAIj8qJaYZT2Czf2YYAr7rQj3gVaGcshAhPaoASyKBNLud1mCEfET2IkDZUSuUlNOBZQVpzdZDcusYwTkl1RQKhgE5vSxhyJSROEQQQiT5Jo1Yby1wLjXA0s9mhPXo4dyaA2Zwlq6FCKbZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287890; c=relaxed/simple;
	bh=/hF3K6HTKAvLdUkP31b/VGe1ZT/mF89Cg8vRm02RM98=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TvWEUsgXX3H+Y5P+IuBSNUXY1ZK7aIoVoIRG34yAtWSzJ8NkfxIalFckm2p3EFVPxaPQc+Fl1D801Z4cIiiNH5t+pY3Tm1ELvpya4bzB3In5+ArxPrnxSxJdi+bD1VNUkiRoFiFzjfYQFb5mUyo4OroKVN6dOGeOsRhbhbY1aeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Nf35s3Hr; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Nf35s3Hr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTL2AbcVYHb22jsnmq94N8xnUIqDAAjClimvquhg2zb5giXYP2OX85WlqIgrBaK3k8/pPdJXaaNdq/r95DGpfxP1iPo49Qj1RMdBz1379FwqRhQugv3ZsNiDcay3gA+2anI3mHT5lppR9+dwHPskQK9FadISBjL+WtvYxF6zlovttI7tpolRYTmByYM4gHTp+44ldEx3UtDd5ROduZJAd80tf28L9lpFtrLqCs0WXkTVhRQQtLM2d+xUzuqhq8Eb8o3BK9AhWkikcDtyZLbBXIK5IRLt8CH9CputL1A+LFYwW7KR00ZSCMjxVpwLLzUZ1OX8e9Nlr8DRHvcWCBOzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzJpiRS4PacuVntKL2nLkD+JjK08O6nsNB0aeqTFVDY=;
 b=ILiLI8ViZeaxBXfxcToRtI62yIWMFrM9V/8zld0jqhhaWFRf/X52/12GvHZzpysKTxCuZUd8MBtmCbGrR/wOWneRoR2w0iN7QxiFg58WSuv+T9Kz3XscC4KoWXbXrOCinK/h3R6uXtjjBHRIVDQFYMrAXCZ8B1UZiO+x/CbUe/bNMCFGWmwdPG274B6uAQsgaWBmDNU5PzLdnjHi9yqIxU+hcEQLbTeQgH1JcZ0XEOKtwF1oyYUKI2+N8nCjZGyeYmpe3RvDLgA9y9euFXMHxnLbm2wylCpal0/3erimIdQQeBap1SzTj1aONQZMTKVpKwc13y31qta9sDWuxM6qFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzJpiRS4PacuVntKL2nLkD+JjK08O6nsNB0aeqTFVDY=;
 b=Nf35s3HrQawwCkJamCcLaSKVm25vtQWG5PYBLAccg4IUO+ufc1mXArjLuMudq/kXZYvkezpkzaGHDJwloNv04+SY3EbN1W5zpNsseCYU8lF4xLVVGlEhXDtoWl2xIVI4WOju6w5rjYkGCVoodnxivOLbh+BNrZRdJohdVOUM0lk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AS4PR02MB8235.eurprd02.prod.outlook.com
 (2603:10a6:20b:4f2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 6 Oct
 2026 11:58:03 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:03 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:15 +0200
Subject: [PATCH v2 01/17] ARM: dts: samsung: exynos4: add or remove empty
 lines
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-1-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11956;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=/hF3K6HTKAvLdUkP31b/VGe1ZT/mF89Cg8vRm02RM98=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOIp9xDA3SH/GzPwUQUOkZ7NirvSwSdUMYKup
 ZmBuJMPq/yJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiKQAKCRCwB25JC3Fh
 azntB/4xE4xyr1oBC9kuwadki9yfACv90o/Zx6saOedSc+C8gkQeqYhWDIvg769+ODbe9jQWPIt
 LivyiCWkUfcMNdtjDJFoufxWcObLvA4QCVk30Yb9pa1StE/bRPm79SaKW1xO3AkKMOZXU4dAjUU
 3RM4zpuWMjQL3k89EJoGWTgv89AaDVP5ZA4r/sEXb3owGGK+u1mTTEzc+WLKcNlO87fl3btljUF
 725KgQNoLSD74k02aO7NpWj3kgeSLbYUQ5Qx6iOZRdw/mzj14htujHd27CvwyWHFNbUXeUUzoHo
 w7K3OsyQRpihgrMYnCA2nbj9pLjNIFLUj/B5Zxy1VD3iVLp+
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: BE1P281CA0315.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::18) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AS4PR02MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: 2720c09f-e628-46ed-ca2f-08df23a1138b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	QEEsrJn57ezzWgEmUXp/FvRIkZ3AM7haLonpiV7M27lGMwYaM/cABlayHy4yAiq7IZPHQAF6msMq9oVpj/v09TZquEBHWehloQlui/NaFe42HBUwHFyAJL3cI1lrqsa5gUvz9C9r3AcXTnbxA/MblaU7hQInqfgnZAj+cNvPzMdzF1+PKLFW8l1vzd8FuwfI63ZIygbQpmbzbpK375FF25X1GbrrUG1fgmIqjAgaqFB6RID7gZrjpbqH2VXdJeEPIbDTajYMN/WSL54TIwZ0tDLjUYso6/Mna+xrVWgpZCS0EvNvmlrDdQNzUdSn6/UiM98eacgLzprENRX1OdWHkMGShKlrWXKG3vNex/cd2/DgEXxQ7YQsdl8nBe8pbqH5plvvVzPxnsYbQ81SgTz/00MIOxN8qAByXKupFDzy2ecQI/Z8QYKbAQ35pzO5jFMGjfuwZPN58AzJN5mH78IBeXnoLVZ2uBXsnKdQP+dI5x8rrwxIDcgrcZdDJUOzVCh9MJ/DOGTcInuG58hPYHszL0wnm88f/pSliRwAPDNEhWdF3M/LtjR5Fonx8wTzIPyR81NYNsQceCyu1AYu9sl1lKO9ypd/OGlGGnfUB/2jDf9YDvqsFBm+pAnOX4edMUtRT5DL1rCQksMbm1fsWTqT/dcZVjlB5t6uZAvcSphV1kc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTV1K21hcEkrdk9hZmpPNkJMTy94TDBTbzV0eTc1MkwwMUIyVTVwaGNjb1hP?=
 =?utf-8?B?cFZQKzFjTHdWdlhmbmNWYlJObktYcDgya0Y3QWZPZkd2UkZudWRmZDFyemhK?=
 =?utf-8?B?Z2RJbUtHMFhsL1hCTG5UTldzdUlkSG53d1lpdFNKRWxvcnRhSVR4RjZTWFRh?=
 =?utf-8?B?ZGdwMHUxaENWdGUxbGt2eHRhRlE1cENHWkZVcGM5MjkwaDA2UGpDTUZqM1Zh?=
 =?utf-8?B?WTBqT1lIMitWcFRGMmZ0U0x3Y2l1UlBqSWs4U05BYmIyeDJpRDQwRkRWaUsx?=
 =?utf-8?B?MTVYOVdyTHpZZUZ6QWJlM1FJZTdTaGdGamhXQUprWittSy9kSDgxQzR3UXUr?=
 =?utf-8?B?cnVOdXFqVjh1NERPVmVaeThDM1h3RS9kOGpheWJ3bVNRM2FUQ2NOOWtrcEFE?=
 =?utf-8?B?dlowd296SWdBZHhsZCtFRTdDOFRMNHVMRHlCZUpTNDRsSGI4ZG5YblNhZklW?=
 =?utf-8?B?OHk5cTB0Wmx2RDFPUVJBbHdNL0dzSCtocTN2RGtmeHJPOFZ1OURmcVFGK3Mv?=
 =?utf-8?B?blo0ZklQVWZXRmhYWGdGRkJJYWVVNjhpS2VrcWplejdEb21BWDdXZE10K0U3?=
 =?utf-8?B?VzVvaEszSGFTcXVjNEZIN1FnblNScGlINlMvUisxRHBna1dRRFdZcmFGNUJB?=
 =?utf-8?B?Zkh3MEs4M3Vtd1g1amo5T1dPa2M3c1VUWVMwbE1JTUtNWWRRajM5SDVlV0hk?=
 =?utf-8?B?aU5FY0lIVk1Pd3NyWCtVTjVSSXQzNnR5KzFBQk5YU3R0a09mcG9qK3BVZUVv?=
 =?utf-8?B?V0ZQRG9jUU9MMnpuY1FES2h3aGNhbXAwekZRWVZpbTROZUlpWGJRTEFmK2RS?=
 =?utf-8?B?QWRHckYrTmlJRmcrcDRpcG95MDBnQ0FyZHpkaGNwU1U1VWRxTHFQQlFnWmNx?=
 =?utf-8?B?NE92T1JHSmhrTzdDczhzS0V2REYyOE1HU09ESnl3R2pzOStPVExHVUVoalVU?=
 =?utf-8?B?dWtYdWx5RXF4cWdWR2NpeXBwZXB3UDc1aFhwYTdQc0c1N3FMWS93OFI5QlR5?=
 =?utf-8?B?YzFHeGhsSEd1RVVMVmN6YUk0TklTTkVXblMreGVXazl1WE9FcDJicjUxanJJ?=
 =?utf-8?B?bjlMb1hDSU4raUtQbzRrSXhiK1g2VUJtTnFtNWs0L01oeTBtRkVaMHRKMTBl?=
 =?utf-8?B?cDZlQlB3aC9kbTRwU2hUMU8xRmFXZFM0OTdJYXE0NDBEQm5sbjJ1dWl5OTlY?=
 =?utf-8?B?dTk5Y25NOGFEekVaYkpVcEhRU01yeitvdEZaVzhXeGw3WWkrNXV1NEE0aHhm?=
 =?utf-8?B?anBVekYxUGR3Zlh6emNQY0lqeGpTUG5WOVp5cEpvbllYT0xBakdZRWlqcmJT?=
 =?utf-8?B?aHdyTXBldDNON3Yva0xDOW51TlVNUmg1ejMvUU5mYlVEZkUydktoQ0UzRW9B?=
 =?utf-8?B?UXdldmIxTmI3aUw1Yy8zZjhWR1hsMndNeXNkZ1hDTUs2THBEUmcra0xQVDhH?=
 =?utf-8?B?OHlDK3pjR2NCU3dZZ3gzOGgwMXdacG02WFhrbHQwOTVRcEV1NThzZ0J0T0dm?=
 =?utf-8?B?ZzdWRWV0eEdWekFOWEJWOGtUdXQybnRjNXM2R3Q5Um9yemkxSlZLREI5OGNU?=
 =?utf-8?B?U1NCNktOeGRhYi9LWjhqOUkwZ3BvZklKY3liRjlVNHFPcVduSDZ1d25zNlVq?=
 =?utf-8?B?NUtVeWNZRWlIeXhKcWNYUm1LOU1ZWlREUnBRZ0I4Zys0REVsc0RhelBtMlp3?=
 =?utf-8?B?VDVCWm93YmthMjR4MCt2MDV6VGJDY2RZRVAzWHZEL2VkelVOQ2VSNnlJbXZS?=
 =?utf-8?B?RnlITWNTRm9jZXY3cEY5VW9MOHpldzFoWHpmclFRTUlWRmRFRHhYMFQ0ZXda?=
 =?utf-8?B?K1JFcHlkN0ovcUtMSTlIQUZybU1Qd3lBRkZRdDVGOWo1TTRpeVpydDAxR0dk?=
 =?utf-8?B?bHpHYW5zMGQwbHBXQXNvMU9nRDY0NGtIWVQrdWUzLzNBRmt5Ry9UMGIzWHVT?=
 =?utf-8?B?Z3ZtdkI5bVZad2dzeVRwRklTRlVzSWc4YUlzQitNTURCY01xN0hlTnA2Rm5h?=
 =?utf-8?B?VTF0Y0ZFbE1raUlOaHBOdU1ESEY5Z0Q3Wm04QllvY1B4Sk1vNkZnNExpalpS?=
 =?utf-8?B?a0VvbUFtTU9aVS9uSm9OM05YeGsva0l6bjR5NURvKzR6VTJOS3VhL2RRektI?=
 =?utf-8?B?QXlkd2dlMXlYVGcvNU55cE9TbjZhenVHd29tWjVGRTNlSTU3cTNLZHBidEUz?=
 =?utf-8?B?dlJ0UXg0VjY0Nk5WazVUYSt1b3VOVUNnL0pqdWtMNTFOZ3ZZblBUSFNLbExj?=
 =?utf-8?B?eE5rSXVhOGRjSUpsTzlSRE5BbnFJUG5BSGZpTE5JYy96MGFCcklRQ2VIc2c5?=
 =?utf-8?B?REJXOVZRYmFZSktNQmk1eXhrMVRKcEkzZExNdWZGYjdLeHMvM1J5dz09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2720c09f-e628-46ed-ca2f-08df23a1138b
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:03.6114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gH0qKyLdLVkoau0HIWF2wertWIzNuyuc2tAWbR88d2vH9c7pKDiBqxdU7v8U0CSVcmP8R4fRT0RXg1+KNVqmLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8235

For better readability it is preferred to have an empty line before
the status property, as well as before every child node. Empty lines
do not really help at start of children nodes though. Add or remove
empty lines where applicable.

dt-check-style when run in strict mode reports the issues like:

  samsung/exynos4.dtsi:90: [required-blank-lines] "status" must be preceded by a blank line

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4.dtsi | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
index ed47d0ce04e1..c38489a05e15 100644
--- a/arch/arm/boot/dts/samsung/exynos4.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
@@ -54,6 +54,7 @@ aliases {
 	pmu: pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupt-parent = <&combiner>;
+
 		status = "disabled";
 	};
 
@@ -87,6 +88,7 @@ i2s0: i2s@3830000 {
 			dma-names = "tx", "rx", "tx-sec";
 			samsung,idma-addr = <0x03000000>;
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -196,6 +198,7 @@ dsi_0: dsi@11c80000 {
 			phy-names = "dsim";
 			clocks = <&clock CLK_DSIM0>, <&clock CLK_SCLK_MIPI0>;
 			clock-names = "bus_clk", "sclk_mipi";
+
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -204,6 +207,7 @@ dsi_0: dsi@11c80000 {
 		camera: camera@11800000 {
 			compatible = "samsung,fimc";
 			ranges = <0x0 0x11800000 0xa0000>;
+
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -220,6 +224,7 @@ fimc_0: fimc@0 {
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
 				iommus = <&sysmmu_fimc0>;
+
 				status = "disabled";
 			};
 
@@ -233,6 +238,7 @@ fimc_1: fimc@10000 {
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
 				iommus = <&sysmmu_fimc1>;
+
 				status = "disabled";
 			};
 
@@ -246,6 +252,7 @@ fimc_2: fimc@20000 {
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
 				iommus = <&sysmmu_fimc2>;
+
 				status = "disabled";
 			};
 
@@ -259,6 +266,7 @@ fimc_3: fimc@30000 {
 				power-domains = <&pd_cam>;
 				samsung,sysreg = <&sys_reg>;
 				iommus = <&sysmmu_fimc3>;
+
 				status = "disabled";
 			};
 
@@ -273,6 +281,7 @@ csis_0: csis@80000 {
 				power-domains = <&pd_cam>;
 				phys = <&mipi_phy 0>;
 				phy-names = "csis";
+
 				status = "disabled";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -289,6 +298,7 @@ csis_1: csis@90000 {
 				power-domains = <&pd_cam>;
 				phys = <&mipi_phy 2>;
 				phy-names = "csis";
+
 				status = "disabled";
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -303,6 +313,7 @@ rtc: rtc@10070000 {
 				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_RTC>;
 			clock-names = "rtc";
+
 			status = "disabled";
 		};
 
@@ -312,6 +323,7 @@ keypad: keypad@100a0000 {
 			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_KEYIF>;
 			clock-names = "keypad";
+
 			status = "disabled";
 		};
 
@@ -321,6 +333,7 @@ sdhci_0: mmc@12510000 {
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_SDMMC0>, <&clock CLK_SCLK_MMC0>;
 			clock-names = "hsmmc", "mmc_busclk.2";
+
 			status = "disabled";
 		};
 
@@ -330,6 +343,7 @@ sdhci_1: mmc@12520000 {
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_SDMMC1>, <&clock CLK_SCLK_MMC1>;
 			clock-names = "hsmmc", "mmc_busclk.2";
+
 			status = "disabled";
 		};
 
@@ -339,6 +353,7 @@ sdhci_2: mmc@12530000 {
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_SDMMC2>, <&clock CLK_SCLK_MMC2>;
 			clock-names = "hsmmc", "mmc_busclk.2";
+
 			status = "disabled";
 		};
 
@@ -348,6 +363,7 @@ sdhci_3: mmc@12540000 {
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_SDMMC3>, <&clock CLK_SCLK_MMC3>;
 			clock-names = "hsmmc", "mmc_busclk.2";
+
 			status = "disabled";
 		};
 
@@ -358,6 +374,7 @@ exynos_usbphy: usb-phy@125b0000 {
 			clocks = <&clock CLK_USB_DEVICE>, <&clock CLK_XUSBXTI>;
 			clock-names = "phy", "ref";
 			#phy-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -369,6 +386,7 @@ hsotg: usb@12480000 {
 			clock-names = "otg";
 			phys = <&exynos_usbphy 0>;
 			phy-names = "usb2-phy";
+
 			status = "disabled";
 		};
 
@@ -378,6 +396,7 @@ ehci: usb@12580000 {
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_USB_HOST>;
 			clock-names = "usbhost";
+
 			status = "disabled";
 			phys = <&exynos_usbphy 1>, <&exynos_usbphy 2>, <&exynos_usbphy 3>;
 			phy-names = "host", "hsic0", "hsic1";
@@ -389,6 +408,7 @@ ohci: usb@12590000 {
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_USB_HOST>;
 			clock-names = "usbhost";
+
 			status = "disabled";
 			phys = <&exynos_usbphy 1>;
 			phy-names = "host";
@@ -405,6 +425,7 @@ gpu: gpu@13000000 {
 				 <&clock CLK_SCLK_G3D>;
 			clock-names = "bus", "core";
 			power-domains = <&pd_g3d>;
+
 			status = "disabled";
 		};
 
@@ -418,6 +439,7 @@ i2s1: i2s@13960000 {
 			dmas = <&pdma1 12>, <&pdma1 11>;
 			dma-names = "tx", "rx";
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -431,6 +453,7 @@ i2s2: i2s@13970000 {
 			dmas = <&pdma0 14>, <&pdma0 13>;
 			dma-names = "tx", "rx";
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -453,6 +476,7 @@ serial_0: serial@13800000 {
 			clock-names = "uart", "clk_uart_baud0";
 			dmas = <&pdma0 15>, <&pdma0 16>;
 			dma-names = "rx", "tx";
+
 			status = "disabled";
 		};
 
@@ -464,6 +488,7 @@ serial_1: serial@13810000 {
 			clock-names = "uart", "clk_uart_baud0";
 			dmas = <&pdma1 15>, <&pdma1 16>;
 			dma-names = "rx", "tx";
+
 			status = "disabled";
 		};
 
@@ -475,6 +500,7 @@ serial_2: serial@13820000 {
 			clock-names = "uart", "clk_uart_baud0";
 			dmas = <&pdma0 17>, <&pdma0 18>;
 			dma-names = "rx", "tx";
+
 			status = "disabled";
 		};
 
@@ -486,6 +512,7 @@ serial_3: serial@13830000 {
 			clock-names = "uart", "clk_uart_baud0";
 			dmas = <&pdma1 17>, <&pdma1 18>;
 			dma-names = "rx", "tx";
+
 			status = "disabled";
 		};
 
@@ -499,6 +526,7 @@ i2c_0: i2c@13860000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c0_bus>;
+
 			status = "disabled";
 		};
 
@@ -512,6 +540,7 @@ i2c_1: i2c@13870000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c1_bus>;
+
 			status = "disabled";
 		};
 
@@ -525,6 +554,7 @@ i2c_2: i2c@13880000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c2_bus>;
+
 			status = "disabled";
 		};
 
@@ -538,6 +568,7 @@ i2c_3: i2c@13890000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c3_bus>;
+
 			status = "disabled";
 		};
 
@@ -551,6 +582,7 @@ i2c_4: i2c@138a0000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c4_bus>;
+
 			status = "disabled";
 		};
 
@@ -564,6 +596,7 @@ i2c_5: i2c@138b0000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c5_bus>;
+
 			status = "disabled";
 		};
 
@@ -577,6 +610,7 @@ i2c_6: i2c@138c0000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c6_bus>;
+
 			status = "disabled";
 		};
 
@@ -590,6 +624,7 @@ i2c_7: i2c@138d0000 {
 			clock-names = "i2c";
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c7_bus>;
+
 			status = "disabled";
 		};
 
@@ -601,6 +636,7 @@ i2c_8: i2c@138e0000 {
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C_HDMI>;
 			clock-names = "i2c";
+
 			status = "disabled";
 
 			hdmi_i2c_phy: hdmi-phy@38 {
@@ -622,6 +658,7 @@ spi_0: spi@13920000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_bus>;
 			fifo-depth = <256>;
+
 			status = "disabled";
 		};
 
@@ -638,6 +675,7 @@ spi_1: spi@13930000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_bus>;
 			fifo-depth = <64>;
+
 			status = "disabled";
 		};
 
@@ -654,6 +692,7 @@ spi_2: spi@13940000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi2_bus>;
 			fifo-depth = <64>;
+
 			status = "disabled";
 		};
 
@@ -668,6 +707,7 @@ pwm: pwm@139d0000 {
 			clocks = <&clock CLK_PWM>;
 			clock-names = "timers";
 			#pwm-cells = <3>;
+
 			status = "disabled";
 		};
 
@@ -709,6 +749,7 @@ fimd: fimd@11c00000 {
 			power-domains = <&pd_lcd0>;
 			iommus = <&sysmmu_fimd0>;
 			samsung,sysreg = <&sys_reg>;
+
 			status = "disabled";
 		};
 
@@ -716,6 +757,7 @@ tmu: tmu@100c0000 {
 			interrupt-parent = <&combiner>;
 			reg = <0x100c0000 0x100>;
 			interrupts = <2 4>;
+
 			status = "disabled";
 			#thermal-sensor-cells = <0>;
 		};
@@ -753,6 +795,7 @@ hdmi: hdmi@12d00000 {
 			power-domains = <&pd_tv>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -766,6 +809,7 @@ hdmicec: cec@100b0000 {
 			hdmi-phandle = <&hdmi>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&hdmi_cec>;
+
 			status = "disabled";
 		};
 
@@ -775,6 +819,7 @@ mixer: mixer@12c10000 {
 			reg = <0x12c10000 0x2100>, <0x12c00000 0x300>;
 			power-domains = <&pd_tv>;
 			iommus = <&sysmmu_tv>;
+
 			status = "disabled";
 		};
 
@@ -783,6 +828,7 @@ ppmu_dmc0: ppmu@106a0000 {
 			reg = <0x106a0000 0x2000>;
 			clocks = <&clock CLK_PPMUDMC0>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -791,6 +837,7 @@ ppmu_dmc1: ppmu@106b0000 {
 			reg = <0x106b0000 0x2000>;
 			clocks = <&clock CLK_PPMUDMC1>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -799,6 +846,7 @@ ppmu_cpu: ppmu@106c0000 {
 			reg = <0x106c0000 0x2000>;
 			clocks = <&clock CLK_PPMUCPU>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -807,6 +855,7 @@ ppmu_rightbus: ppmu@112a0000 {
 			reg = <0x112a0000 0x2000>;
 			clocks = <&clock CLK_PPMURIGHT>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -815,6 +864,7 @@ ppmu_leftbus: ppmu@116a0000 {
 			reg = <0x116a0000 0x2000>;
 			clocks = <&clock CLK_PPMULEFT>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -823,6 +873,7 @@ ppmu_camif: ppmu@11ac0000 {
 			reg = <0x11ac0000 0x2000>;
 			clocks = <&clock CLK_PPMUCAMIF>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -831,12 +882,14 @@ ppmu_lcd0: ppmu@11e40000 {
 			reg = <0x11e40000 0x2000>;
 			clocks = <&clock CLK_PPMULCD0>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
 		ppmu_fsys: ppmu@12630000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x12630000 0x2000>;
+
 			status = "disabled";
 		};
 
@@ -845,6 +898,7 @@ ppmu_image: ppmu@12aa0000 {
 			reg = <0x12aa0000 0x2000>;
 			clocks = <&clock CLK_PPMUIMAGE>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -853,6 +907,7 @@ ppmu_tv: ppmu@12e40000 {
 			reg = <0x12e40000 0x2000>;
 			clocks = <&clock CLK_PPMUTV>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -861,6 +916,7 @@ ppmu_g3d: ppmu@13220000 {
 			reg = <0x13220000 0x2000>;
 			clocks = <&clock CLK_PPMUG3D>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -869,6 +925,7 @@ ppmu_mfc_left: ppmu@13660000 {
 			reg = <0x13660000 0x2000>;
 			clocks = <&clock CLK_PPMUMFC_L>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -877,6 +934,7 @@ ppmu_mfc_right: ppmu@13670000 {
 			reg = <0x13670000 0x2000>;
 			clocks = <&clock CLK_PPMUMFC_R>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 

-- 
2.43.0

