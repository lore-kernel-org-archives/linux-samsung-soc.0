Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2983E9F9D;
	Tue,  6 Oct 2026 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287907; cv=fail; b=ZsDul5jecIYJQxxAVQnMBE0SpXLFR1+28ScA3xSDBT65NK7XBCRRma5E833K2TwUTOZx9AdogJoUjgL99I+ZtV/AF2uxcrlyMGj9nskj6hBrdpSEDypKIqqd91PY3aJ2uenSdTsruUzV3DYHMJW5ZJxyL5Q160VTlQfnOWYotbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287907; c=relaxed/simple;
	bh=8YYKtA7CrbEe/oqSLIXWN5arZ6+yr9lXgdwkwf6Z0QE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=S0rcphf14Q8Jqkxmmw1BR2qCo+vR1ZEyMBoOvJ9+apyB5EyVCHGuFvM6X3IiPNuyUp4u8EtRP9I+7Ro1F050TvT5RoUmcd5MDNmIQvYuxvtHSjCw9VxilJ6fEmGEEb9+5+2Mh/1VwQ9JkOTTzirv0Lf+8BHEE14GluE+/hvgRqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=qq1bXLiC; arc=fail smtp.client-ip=52.101.72.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="qq1bXLiC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGBsDUJ+8B8w3U0FAR+X8IWvPqmwfgbkTsSwr15B/qp+ybSkAZC3hmop3dB03swmO9HRYpaGEPL4y/IqAqrIYIJhazKyePxXscL5H2N2Z887CpDT0/2odLOWWfREWsiF+PUTQHFlXChwSr6QE3EQNgCH2shwJ/FtaZaR8DN7bPpiOebak3ZS3/W6M9XuQP+cDUEe8KdUb0ZT7oCkxSn+knr9RxuUKWFUx+IbvcttKL427gWOfDT/YlQq4HBOBSCNIHUjvRT+FFHvPuajXEHyA6dywskRn4kESHUn23suA1h2xTzQLkRlkGCsEuRPXS8EkwczmJ15U3AXBmBmYIUu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JY3ljlRSf2pHiTtXpArTuxLnmNlIc1QHxJQmZnui9xU=;
 b=viyhJzZncQlWeZfqlURHPXC8WEApUC21sbqjPCMdSfuMa/iUHe2lYNE5K4Ua4+HBuz1/rVEE05hYE5hPgcLUDDVYbhOyyrVNdq88i+amlxlSHyr1sgJ3NaFTYQIv1EHwYGq821Pvsmz8r7QPduGfTrGKm50zg51Nx5H11JydrAhQZjoLsU4eywfghXRsoyLlsLD7ZhzwdvN6P5jAcEMDHgk9ewmR0NLEmcNRLkXtEwmuu1eyVgJ3SZgIEPm6bU9s1tUb6QKldEMoBm4Lo235FSXoXBI2BwYZasx83G1BlHifvzczTOanAmrL3f0rU3c6Ln2ZR4Ut+3CwshiEJwv0KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JY3ljlRSf2pHiTtXpArTuxLnmNlIc1QHxJQmZnui9xU=;
 b=qq1bXLiCwVBORUkn3F/sskW0uBIeYs5sOLQ4Ll8XkjE2D6pz/SKlSMxssqBKdr06aevgtuQNBa244vTvZij/Oz+c3q9IS/8Dm//x8lMbgxOsVTpSLwyMw0OvwCeCW0lc6e+CwA5YGGuzndwhZ+L0ESnaVIffg/X37tmbP/4yBxM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AMBPR02MB11561.eurprd02.prod.outlook.com
 (2603:10a6:20b:736::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:58:16 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:16 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:25 +0200
Subject: [PATCH v2 11/17] ARM: dts: samsung: exynos4210-i9100: sort
 properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-11-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9363;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=8YYKtA7CrbEe/oqSLIXWN5arZ6+yr9lXgdwkwf6Z0QE=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOI7/ZP5pxgmYpN1zZy6r8+48c2h/wx7hAiPN
 bX2DjiHf6CJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiOwAKCRCwB25JC3Fh
 a4nQB/9C+ERRqH666IeeN2+Jaxx0yYCtkydBAsKgivjNO6WrMsYT6kNqOYhwVNB4pYDL37PyWKF
 Ud8cBKoH5LHpAGvlVmrki7ektch7ASaRUN//m7+hnyFOvYjuGXKEBDhBtpKvLSbCRVAtzJD04ip
 zR40j8gdVgUKfnpAN3+9sGRhkuH/eN3oAtEiQPW4KfxpAqfvfXDOQPM+9oheLMd2/JTBHE0s3oL
 NGBmEgdO/oVaOZgvJZvwN32G1n/YQ4OJ9zc0TJuYkQfr3ZQLjujrbRrrqfh+/+9fAbKIbeR6Lfy
 gxvYK5StUrwGK95LOVJSMLhHWgy74u/nZ8gpjBASr3MDFEXE
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: GVZP280CA0011.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::16) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AMBPR02MB11561:EE_
X-MS-Office365-Filtering-Correlation-Id: dac1bac1-95b8-4f40-117e-08df23a11af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	oRMUCuxWKMHEU3nJU2kdYw3MgkWf1JV+vaLZqcgu/bcKgJDdi7k2/76qEcdN7hDtJoZwjAadFe9gM9Fxz/W9EPPvZNoYrP36eM3xImwUbBS6A2qpAyRCkwh78ppu8Ifu1RRtvMeludUZq7STpNusJ3UFPIZ2glEt/iAi4OOAyMgJaVP1hIph9yweXBccGrdPMAbPaq0wdw/A16ox0fgbC2nf9lACmRqe3ZkpO0YR153uElGZfCGTVIlHq+KxifNO9aivm9dKULaveAqDSMGtDVsKbdIPN0rP181ckECjuL+lE2kI+/fFg7EAPmFo7RzE9kC5s+UF5UalwY07G8tSEyhRlv8GXqq8/Emphs7mnmf5PlkHak7Y1iLqpt1aYAeZBGIKJ/iLSyPIJwz5RGGs1X2/gjAxBhHu9+gsM8EO7o7Tb3GMBLVu/68XXNd/vwlitM+XwjF1blP242nYRwaWmRv248ahDfkBWX3Wvmj5PgF13hSJAvB51k8P2Ds5V+M0aCaGk51XN4GPiHXNVbDt8yYm5avEijViqn7qvndUe9yG2ENWP0IjLRkawX58XqYh9UpXduJz6GafPKFZ0IdXlfsrLWx1cRaGhrJvowMkV8/UEYq/DgLlgMXwzmDbTcTSLovX02Yuq+ybKW/I6uyhKDHf8LNis+pQkPTx9v7G1Tw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG9uMys3a3J0Nis0cTkwUStFSlBydFdWS0d1aDZOQWNxbTNGQklJdkFRaTIy?=
 =?utf-8?B?T2p5VXhqUWpyOTZRVkNNSFJYd0ZRWFAvSVdVQ3Q4SHFTZzB5ZFdOVlFPa1Ew?=
 =?utf-8?B?L1ZsVzZMVFFJOGcxaHQ2dXBxQVNweHl0YkxVTjdlSnNhemZ4ZUFURGdPeEpZ?=
 =?utf-8?B?cFJNTkR0cFVFbW9ZNFAyNWdlRUhUZVBSMDJiblZQY1dDa29tVzBIclpmdE0w?=
 =?utf-8?B?dmQzYlhEaHFrUDJ3ODkxb3hpcDVhWVlzYzMrNnhvNjM3SUkyUC9ZZEk2RC8y?=
 =?utf-8?B?cmVQU3EzQWJTbkhQQjJkZzBMUlZOQTJ4VGoxaFA3dUlqenJFNzhQR1RjeG9V?=
 =?utf-8?B?Wmxkb3hmNytVaXEyVkJZRVJZVFRyR3UxSFRlY2pUb1RXSWdySDdiaWRLcmxh?=
 =?utf-8?B?dExtRVY0WGJteEJsbjlBenpzQXFNc0hSWmV1eUxJc09FNlZMUG9tUUg1U0ZH?=
 =?utf-8?B?Nk1NakZ2VCtnSVVmdUZ1WVFxK0ZGNXROTXRoRFFTRkdlMm5obTMvcmtDaGhL?=
 =?utf-8?B?SjJmZFFPVFVHYUltTlFBRzgvVDlDcG1IcWo2ZHRwZFVoOE4xS2ZROXo0N2Mv?=
 =?utf-8?B?YWJHcXlvbjhBbHkwVW53OGtmempuOFA5UXVMbDZsV3V3a2R1MjNkV0NCTFRI?=
 =?utf-8?B?c25hYVRLdWYxR1RVRThlZ2YrN0xuOGpBcWZleUdHalEySU81eUx6U1RqNmZX?=
 =?utf-8?B?cEVwWVA5SjdBVWtMTU93NFBhRlNWNGxHeTF4U3lXZmZQbnpoQ08yMXF3Y3du?=
 =?utf-8?B?SzBqeU1Tbk9ZRFNBVktCdkYvRWlraVJ5eE51RVdxVkx6VEU5Y0p5TURTVk10?=
 =?utf-8?B?WmhJSnFldkIvYzVFM3pmbzVlRXYyT2VJRXVkMGFNa2ZQcDVPMC85dEI1TnRs?=
 =?utf-8?B?d2MyT1QzSHFIQjBFWjRQbVlEd2pqR01yekw3UFRyR3Y5RjNYOWhSM0FEcitz?=
 =?utf-8?B?MDY4TE5neTh6N3JPVWN2dXJiMFc5OGdrOUtjclpXMWVqWjZxQnFhOUlmTDhU?=
 =?utf-8?B?b3p3NlRXZy9hWTNBS1lTc0VkbCtlSHJ0YnQvSnFhVVFiMStSTW1RUkhGdEdy?=
 =?utf-8?B?TlhYTnJNV1pocG9mYUg5RWY4bTFvMkVzV1dFWlliZ25lTU81R3F1QysxNnVQ?=
 =?utf-8?B?bVZWTTFwNUVubnNWRk0wbTFSR0pJSWllUXlCcmRCNGVyN1BxQjJxblAyZEFW?=
 =?utf-8?B?em90cG1UdHhoT3QvM3NyZmszT1U4QklzakJnY1dJaWp2M0tLNHh2UDVKME5O?=
 =?utf-8?B?TG1LbzI2YW04RjlBOUhzTzRtTzBCRjFOWVZSOFl6Z0pLZ3h2aTllN245bDhU?=
 =?utf-8?B?TlFrQU9CWlhtck9LS01YSjdVbUNtRWtlaytGWE1vTmZrZlV2cXZ5QzB1SHZ5?=
 =?utf-8?B?Z3o3R0xQc2RLbC8wUmpoVU5mUU4vRDUvQmFEbk5MemlVdWRrM3JLT1ZyeVcr?=
 =?utf-8?B?U25tR2NrOVJiUW9OTGQzZVdDNlh4K1pZTy9tM0tlTEZFQndwZVZGVlJtaEFp?=
 =?utf-8?B?b2RRN2R2TGptdnY2b05WWU1XUDROVU1BT1djMm9oUkZHS05zUVAyajN0TFlZ?=
 =?utf-8?B?c3RGaGovNDdEUGU1Rk9CSXpRVDVGTEdlcE42YSt5L1NReGNkMkc1ckZuclcw?=
 =?utf-8?B?NGo0ell1WHl3cmJlMGFSZzU0SUZONlpUaC9iM2pRM0RxVDNRTTlxend4UUVU?=
 =?utf-8?B?ZlR2SGwzbS9iVHhMbU1HaHJ3b3h5MVRJSm1DWExzS2dUWmRKcElvd09YRGNE?=
 =?utf-8?B?YitsQ1oveGd3TFg2M1Q4STVCVzloOUYzUXhPZ3JtMU5CL3R6eXljdUdsdmFn?=
 =?utf-8?B?VndRNEl3eTZnVHVnMW5PakovOFh0Y1RkbEszb0tOUjlidXRZeCsvcUtRSzdW?=
 =?utf-8?B?YkZEQ1JJREFlK25kYTcyWGh2elBaR01jSHVJZGgzMVlvLzVGbnRtZTc2YzNo?=
 =?utf-8?B?MnRLVGRpUGFtRUFNUW4xeVZURmxwRk9kSnpPejhyZjF0RzJrSHFMMlFCSXgz?=
 =?utf-8?B?WUFXa2pjSFh1bXZJRm1ZQk5FSmxuKzNhRkxOd0RZWGRpaFM5VHZocCtvQXhT?=
 =?utf-8?B?dUNYeHV1MDVyMVorWkZZdVlxK2JnR3Vnd1c1TFhBUU1KQ01CQ2dvSU9jdGNP?=
 =?utf-8?B?RytjMzBvV3NsekVKSW5paVNuaDd1bC8zNDVXVk1UbGM3NlkxU01CS1QvTEN3?=
 =?utf-8?B?STFySVdxUkNIRHU2b2hPVE1ONHl6cXhLY0h4UGh4c0dUUUlaNmJOb0I4NGM2?=
 =?utf-8?B?eTJES3JPT2tHaUxsQzU5N244YVZ6eGlzWFZTL1kyVHJ4SHl1cGVScVdadE93?=
 =?utf-8?B?VmNVZ2YwWWY3YnRPcGpHbzE4MkhwVG9rVnpEeEh1NVhBOG1qMGpwZz09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac1bac1-95b8-4f40-117e-08df23a11af1
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:16.0034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G22r0U3QcYTtY7Tcbi+yF9IPJ0lnf/aogFPPuOG0ern5Qd5V73GmtbvYgvohr/pL32ltCdOjmzjcYPNX6HNW3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB11561

And add or delete newlines where applicable, and sort properties
according to the preferred style. Fixes warnings from dt-check-style
like:

  samsung/exynos4210-i9100.dts:275: [child-name-order] child node 'pmic-ap-clk' out of name order
  samsung/exynos4210-i9100.dts:287: [required-blank-lines] "status" must be preceded by a blank line
  samsung/exynos4210-i9100.dts:288: [property-order] property 'assigned-clocks' out of canonical order (should sort before 'status')

Also remove double spaces in max8997 buck dvs voltages list.

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 125 +++++++++++++------------
 1 file changed, 65 insertions(+), 60 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index b9a31714381c..85e4d334a5e6 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -97,31 +97,31 @@ gpio-keys {
 
 		key-vol-down {
 			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_VOLUMEDOWN>;
 			label = "volume down";
 			debounce-interval = <10>;
+			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
 		key-vol-up {
 			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_VOLUMEUP>;
 			label = "volume up";
 			debounce-interval = <10>;
+			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		key-power {
 			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_POWER>;
 			label = "power";
 			debounce-interval = <10>;
 			wakeup-source;
+			linux,code = <KEY_POWER>;
 		};
 
 		key-ok {
 			gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_OK>;
 			label = "ok";
 			debounce-interval = <10>;
+			linux,code = <KEY_OK>;
 		};
 	};
 
@@ -141,6 +141,7 @@ i2c_max17042_fuel: i2c-9 {
 
 		battery@36 {
 			compatible = "maxim,max17042";
+			reg = <0x36>;
 
 			interrupt-parent = <&gpx2>;
 			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
@@ -148,7 +149,6 @@ battery@36 {
 			pinctrl-0 = <&max17042_fuel_irq>;
 			pinctrl-names = "default";
 
-			reg = <0x36>;
 			maxim,over-heat-temp = <700>;
 			maxim,over-volt = <4500>;
 		};
@@ -284,21 +284,24 @@ pmic_ap_clk: pmic-ap-clk {
 &camera {
 	pinctrl-0 = <&cam_port_a_clk_active>;
 	pinctrl-names = "default";
-	status = "okay";
 	assigned-clocks = <&clock CLK_MOUT_CAM0>, <&clock CLK_MOUT_CAM1>;
 	assigned-clock-parents = <&clock CLK_XUSBXTI>, <&clock CLK_XUSBXTI>;
+
+	status = "okay";
 };
 
 &csis_1 {
-	status = "okay";
 	vddcore-supply = <&vusb_reg>;
 	vddio-supply = <&vmipi_reg>;
 	clock-frequency = <160000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
 
+	status = "okay";
+
 	port@4 {
 		reg = <4>;
+
 		csis1_ep: endpoint {
 			remote-endpoint = <&s5k5bafx_ep>;
 			data-lanes = <1>;
@@ -317,6 +320,7 @@ map0 {
 			/* Corresponds to 800MHz */
 			cooling-device = <&cpu0 2 2>;
 		};
+
 		map1 {
 			/* Corresponds to 200MHz */
 			cooling-device = <&cpu0 4 4>;
@@ -325,62 +329,63 @@ map1 {
 };
 
 &ehci {
-	status = "okay";
-
 	phys = <&exynos_usbphy 1>;
 	phy-names = "host";
-};
 
-&exynos_usbphy {
 	status = "okay";
+};
 
+&exynos_usbphy {
 	vbus-supply = <&safe1_sreg>;
-};
 
-&fimc_0 {
 	status = "okay";
+};
 
+&fimc_0 {
 	assigned-clocks = <&clock CLK_MOUT_FIMC0>, <&clock CLK_SCLK_FIMC0>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	status = "okay";
 };
 
 &fimc_1 {
-	/* Back camera not implemented */
-	status = "disabled";
-
 	assigned-clocks = <&clock CLK_MOUT_FIMC1>, <&clock CLK_SCLK_FIMC1>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	/* Back camera not implemented */
+	status = "disabled";
 };
 
 &fimc_2 {
-	status = "okay";
-
 	assigned-clocks = <&clock CLK_MOUT_FIMC2>, <&clock CLK_SCLK_FIMC2>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	status = "okay";
 };
 
 &fimc_3 {
-	/* Back camera not implemented */
-	status = "disabled";
-
 	assigned-clocks = <&clock CLK_MOUT_FIMC3>, <&clock CLK_SCLK_FIMC3>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	/* Back camera not implemented */
+	status = "disabled";
 };
 
 &fimd {
-	status = "okay";
 	#address-cells = <1>;
 	#size-cells = <0>;
 
+	pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
+	pinctrl-names = "default";
+
 	samsung,invert-vden;
 	samsung,invert-vclk;
 
-	pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
-	pinctrl-names = "default";
+	status = "okay";
 
 	port@3 {
 		reg = <3>;
@@ -392,26 +397,26 @@ fimd_dpi_ep: endpoint {
 };
 
 &gpu {
-	status = "okay";
-
 	mali-supply = <&vg3d_breg>;
-};
 
-&hsotg {
 	status = "okay";
+};
 
+&hsotg {
 	dr_mode = "otg";
 	vusb_d-supply = <&vusb_reg>;
 	vusb_a-supply = <&vusbdac_reg>;
-};
 
-&i2c_1 {
 	status = "okay";
+};
 
+&i2c_1 {
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
 
+	status = "okay";
+
 	lis3dh: accelerometer@19 {
 		compatible = "st,lis3dh-accel";
 		reg = <0x19>;
@@ -423,14 +428,14 @@ lis3dh: accelerometer@19 {
 };
 
 &i2c_3 {
-	status = "okay";
+	pinctrl-0 = <&i2c3_bus>;
+	pinctrl-names = "default";
 
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
 
-	pinctrl-0 = <&i2c3_bus>;
-	pinctrl-names = "default";
+	status = "okay";
 
 	touchscreen@4a {
 		compatible = "atmel,maxtouch";
@@ -442,14 +447,14 @@ touchscreen@4a {
 };
 
 &i2c_5 {
-	status = "okay";
+	pinctrl-0 = <&i2c5_bus>;
+	pinctrl-names = "default";
 
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
 
-	pinctrl-0 = <&i2c5_bus>;
-	pinctrl-names = "default";
+	status = "okay";
 
 	pmic@66 {
 		compatible = "maxim,max8997-pmic";
@@ -458,6 +463,11 @@ pmic@66 {
 		interrupts-extended = <&gpx0 7 IRQ_TYPE_NONE>,
 				      <&gpx2 3 IRQ_TYPE_EDGE_FALLING>;
 
+		pinctrl-0 = <&max8997_irq>, <&otg_gp>, <&usb_sel>;
+		pinctrl-names = "default";
+
+		charger-supply = <&charger_reg>;
+
 		max8997,pmic-buck1-uses-gpio-dvs;
 		max8997,pmic-buck2-uses-gpio-dvs;
 		max8997,pmic-buck5-uses-gpio-dvs;
@@ -475,34 +485,28 @@ pmic@66 {
 						 <1000000>, <950000>;
 
 		max8997,pmic-buck2-dvs-voltage = <1100000>, <1000000>,
-						 <950000>,  <900000>,
+						 <950000>, <900000>,
 						 <1100000>, <1000000>,
-						 <950000>,  <900000>;
+						 <950000>, <900000>;
 
 		max8997,pmic-buck5-dvs-voltage = <1200000>, <1200000>,
 						 <1200000>, <1200000>,
 						 <1200000>, <1200000>,
 						 <1200000>, <1200000>;
 
-		pinctrl-0 = <&max8997_irq>, <&otg_gp>, <&usb_sel>;
-		pinctrl-names = "default";
-
-		charger-supply = <&charger_reg>;
-
 		regulators {
 			vadc_reg: LDO1 {
 				regulator-name = "VADC_3.3V_C210";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
-
 			};
+
 			valive_reg: LDO2 {
 				regulator-name = "VALIVE_1.1V_C210";
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
-
 			};
 
 			vusb_reg: LDO3 {
@@ -706,14 +710,14 @@ CHARGER_TOPOFF {
 };
 
 &i2c_7 {
-	status = "okay";
+	pinctrl-0 = <&i2c7_bus>;
+	pinctrl-names = "default";
 
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <400000>;
 
-	pinctrl-0 = <&i2c7_bus>;
-	pinctrl-names = "default";
+	status = "okay";
 
 	magnetometer@c {
 		compatible = "asahi-kasei,ak8975";
@@ -724,8 +728,8 @@ magnetometer@c {
 };
 
 &pinctrl_0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sleep0>;
+	pinctrl-names = "default";
 
 	sleep0: sleep-state {
 		gpa0-0-pin {
@@ -822,36 +826,35 @@ tsp224_irq: tsp224-irq-pins {
 };
 
 &rtc {
-	status = "okay";
 	clocks = <&clock CLK_RTC>, <&pmic_ap_clk>;
 	clock-names = "rtc", "rtc_src";
-};
 
-&sdhci_0 {
 	status = "okay";
+};
 
+&sdhci_0 {
 	bus-width = <8>;
 	non-removable;
 	vmmc-supply = <&vemmc_reg>;
 
 	pinctrl-0 = <&sd0_clk>, <&sd0_cmd>, <&sd0_bus8>;
 	pinctrl-names = "default";
-};
 
-&sdhci_2 {
 	status = "okay";
+};
 
+&sdhci_2 {
 	bus-width = <4>;
 	cd-gpios = <&gpx3 4 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vtf_reg>;
 
 	pinctrl-0 = <&sd2_clk>, <&sd2_cmd>, <&sd2_bus4>;
 	pinctrl-names = "default";
-};
 
-&sdhci_3 {
 	status = "okay";
+};
 
+&sdhci_3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
@@ -861,8 +864,10 @@ &sdhci_3 {
 	mmc-pwrseq = <&wlan_pwrseq>;
 	vmmc-supply = <&vtf_reg>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd3_clk>, <&sd3_cmd>, <&sd3_bus4>;
+	pinctrl-names = "default";
+
+	status = "okay";
 
 	brcmf: wifi@1 {
 		compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
@@ -875,13 +880,13 @@ brcmf: wifi@1 {
 };
 
 &serial_0 {
-	status = "okay";
-
-	pinctrl-names = "default";
 	pinctrl-0 = <&bt_en>, <&bt_res>, <&uart0_data>, <&uart0_fctl>;
+	pinctrl-names = "default";
 
 	uart-has-rtscts;
 
+	status = "okay";
+
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
 

-- 
2.43.0

