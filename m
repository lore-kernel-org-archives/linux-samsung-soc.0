Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FAE3E7640;
	Tue,  6 Oct 2026 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287911; cv=fail; b=godjwO6SJ/Uk7WFTHOdtd0ZPUeSA5SOiT84zsIGRKn54L6PHxeyFLGEvr4oiCY9C4Is4gdwfh3nFoCENVk1xM1IzjeSFle9iY4zSoLXXIqHqlg/FPV0K/kL69q6Fwv/DYzXGg6d+c94WVqolOhEKjhBGo4IL30AhEEuAgXt2CG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287911; c=relaxed/simple;
	bh=sp8AdmTP7L0sIZbAZ8efyJOCnoaHOUGBoQhzMik887E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ELCePcQ5QtwE0ZeHfCCZF/W5qANpY8vO/yZE+HkHbvnQtK/hGFelrjGk2LKp8NR9M0xv9iNG9WRNW/nhHhCjXL0vqHy0HDy9udj6tSW9QiN4kEcB/2t6uFCKmOitdvVOieT4jVA5rcsrd89jS7ztY+Cw+Lm3oBJxtd9Y9Pv16SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=QZe6a24I; arc=fail smtp.client-ip=52.101.69.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="QZe6a24I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqkUtY2W/Mk2r4rTfeZlvfclbsnnal7RLloX0+R9Abnqi/KeBfOKc7cRoHCtEI1lGH0SyGVKj2j5cvOlHkIo9zMg3SO+P/4qJYFadzSkdNLuixwwUBkP6tn+Gj3z7htNSUI5QlCt0lBD9uRKuKMpcR50D96x6u2qhrOBiOZKoRtD67VSij9q/4ZmxnmZAe1Mb+yCpOkMpjKSet67cJRXNI0UfKPRwJyJkN/l4I7Tq1sSL0OXISG7O8B/4ddLn49LvInu75Hs8CdY72RN6rLRET7yZC3r3n62lUZdBWxnZU2JjLkWACnqYyyzhOL5J7tqxmKWUvUN9dAgEZQxIoqCKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHi5SSwNyA40AkhdeSQQY3wYjSyoS+jBUwAoUpuM9gM=;
 b=F895eXvosPRJVJvxqzUfS8ZOSAVbncT0lhdP5QThYGR9opTI/MouWHD26X//ckGkquzaF/O/0agpnz5X/XTj4XnF5GHg9ryw8oRu+25Vl4E8fw/AbN6xMYnm8QsG05MeLV8OLb/aT2MlEZ5aV1DE5mvbXrmjitWq01kR42H6H5LtOoOs0a60wvHGjNBR9FXt2WnGY9lCSuo1muUiEhH2+9vlkh4zart6B/gSPuvVRRvdQR1yjYsCV7cDVCmVDMBHPZL48En2JSnQVE1akk6hb8ghzm2xlAa+vaRu3xLRIin27UhamIoLXU+KXnUESJDDLg18g88x0EUPnukSKO6Agw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHi5SSwNyA40AkhdeSQQY3wYjSyoS+jBUwAoUpuM9gM=;
 b=QZe6a24IIWbLMCeVb2sQdZTCsl1c3w+XGF1pEWaH7jqbgpTXLpeJoXy0X4cPZ5NjMgLCotp9lJZzkeZx2yFiOY8LgQrDJ0cZgf6A1wCZMW7Jg2SdHYnaKJfNzLA57yk+8GqF/fAFRU1n8wVB170I6KAml91spMAn0FD4hFXp3Og=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AMBPR02MB11561.eurprd02.prod.outlook.com
 (2603:10a6:20b:736::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:58:19 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:19 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:28 +0200
Subject: [PATCH v2 14/17] ARM: dts: samsung: exynos4210-universal_c210:
 sort properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-14-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8101;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=sp8AdmTP7L0sIZbAZ8efyJOCnoaHOUGBoQhzMik887E=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOJBjcmtc9qwrVM/Mo2fnmKFpYZ2egRZr+lfO
 cyrah8JflaJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiQQAKCRCwB25JC3Fh
 a2ZrCAC5ezLQX6AHhoo8HqU6CzLGCAyp8906GpPI92lb+6tRlU1aiC6UUCS6dJkEYaJGuGYkYjq
 o0STWvRZizGsMwz8Ky19AA7T10Q+muJO/+dWJHY78Lu6omdDTbWvs1N5FNORqWgDUE7fHOEFAPz
 c8NMAMonZ48GUm+WEaTJXr8RYuviZMlIUzfbt+5oP8ARngZYGRW3etQBADPcvAoProDGbEWWy+X
 2TcHRK/oGsOywNoYbSwW7SK48C4vUWWf9A97Bj3QtAfPoox2S6UzOGKBYth/+3hR52eaUodVY5I
 84tr7DxUCgv6B6251Nph1olv90ty4dzZzTsk0rBMMCBN7qg9
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: GV3P280CA0061.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::28) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AMBPR02MB11561:EE_
X-MS-Office365-Filtering-Correlation-Id: 134805a4-d212-407d-00bc-08df23a11d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Xl3v4MDYhLWFjrQjrDqveeApHmupZseoh/aSFR4eFq5e8nSMeI+E+IrbJPvYcXFzAKFd6vy8tjDZTrL8E9efzuxFAqUJTZXkwyA0Kj7Q0AIt/a3nsYJ7YSEYnQzpR+vrheDX6WyrqK0bXyxu+NYo+PS9GSYIDPoOo2zYT6ElnfO6JbeQQ9SNajGIX/ssFXrNlPKrPKb5ofI2ZVbScUPdwvFKZMFJ9ErFUdIn5NEyE85GWc1AgdVaReC9rQ7isX0P/odcnR0QB7x5o0xcehI0PbxM9FJdKlDqcdzfmJ3d/Cw0IWtJ6+7hisgyDYA3Ezr8A9D3NaQTZOXE0rZPhnRLW0XLxUfcYtxQCvKFAOYrTBCD/0/ds4LhrgfRCOg0owRlMYY9+evaso6zktOvN4/dfCDNII37V5X2vNpspBdqynLr/y3vfkde12Sv/L6sATBKmyfsNM3BXPM6Pok2zkoyuxWbMzmnleq570yT8TOT1PWP1EuwfWhD1DD//oDjYgTR2d+N8uZBty/BD1rIKE1/rA0vqQiWccZweB0SOwJaBEP9TrL4SBnctXk/qpUCAfn2b/3406fhEOK+AGawlIit8kGrkbxCENFcAE9XgKLdS8aDI70PTUxPUVBqJoA1bq3d1OvV32BSvWT0oCTASakK5ABtPQXGq7wVvyEW8kDfbIA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0dPd3luMXZiNHhGeVNEcW5ETUhlQW4rOGc2bjhZQ0RRTDFZTmFwWUlmRC9Q?=
 =?utf-8?B?cStHenBISkFHTGNESFc4YWwyeWZ2MUtYeU8rb2pGQUtoUHZHdklKSGY2bmMy?=
 =?utf-8?B?NEl1d09hTFhMVnZqa3Vlb1oxSkcxNFFSUklYSE9iOUdpbm5DWTlPeXdTY3Zn?=
 =?utf-8?B?ankvc3VxVlZzclFzamRxTTlWM1A5a2FXMHBVT3V3U0hVMVFaOWJaRjZXRGhM?=
 =?utf-8?B?dFNUOXlKbktGUzNjY1NIQ1RPTGVUVGVVUnJqRmw5eVcxMjlxOERwVkRqbTR0?=
 =?utf-8?B?SVNLTXBncDlMak00U1RRNjVmSDlQNEpEVGs1QVRUMlBlZHFlcmxRd2RXSEF5?=
 =?utf-8?B?TmZWakthUkQ3Nm1MOHNQLzlmV3Y2STl1Y2djajR6MHNYRmNTdWNuaXd2YlFZ?=
 =?utf-8?B?NS9QUm1RTm9YRlM1QkRvUUV2RjBVWmNVaHkzUkFBZjFlMXQ5RmJwQ25KaEJa?=
 =?utf-8?B?a1p4R2ZQaFQxK0tuQ0J0QWVjT3dacTZURGlBTnVCem01SVFhSmxMSFU4dGtk?=
 =?utf-8?B?YVIweFR2S3BSZTE1SW5YWC9LS0pXbkJqSXI2Z21QTC9mbWI2VmFsemxyQUV4?=
 =?utf-8?B?YjFadmVwR1l2L2tPRFJITUV2QnpmOCsva1FOejVhN2UvcWVXc2h5WENSeWlU?=
 =?utf-8?B?cDhKQmE1ZXdwVXN6ZzNnOVhDU3I4elpBa0puMVdNS0poK3dPcnh1dkFadGM3?=
 =?utf-8?B?eXpTekNFWThja0ROamJha0JjcS9XNmJNWDNWMTVlRkpnRFplZGN2dmlObGFo?=
 =?utf-8?B?SWt3NmtIUVl0SnVZN044aUtiRTdaU0tYUEJ3SG0xRXpJTkYxMGVLL2NZUVJP?=
 =?utf-8?B?Q1BKVGN4VCtWMTRiNWVLNXhUTDhQcDBvbm5YZW5lL0w2WGc4ZnNFNTUyNFo1?=
 =?utf-8?B?cjlUVGlkS3k5a1BrSnAzYkllMW5ZcTh5SWpHY24rSVZFTk5SeUMyQkVZa3lC?=
 =?utf-8?B?NjFwamJTR24ycjlCWnZLSEdrNHV5SmQyQUdlK3JPZFJJY1Z6SDdyeGM5QmJ0?=
 =?utf-8?B?b0xGMVRHSk56TG9mcUVQQlc2UXlpY0V0MW1JTmdMb044aUd2MVZMZEd3RWEx?=
 =?utf-8?B?ZG1lbmw1Y0c5SGtmb3RWTkwrajVUSkljNXhBTWtvYXFwQ3FkUnJ1Z1RsTmJO?=
 =?utf-8?B?VExOaEhrY3dGTnVsQTAzWjhzV0xqMThRQ0FiYUMrY2VBNURnU0IrNjVOeHVI?=
 =?utf-8?B?NTQrWHhieVlpTUhLMmUrNVdENEh0Q0xWUi90aTVSMXhobGtWdVEyVzFwdVhX?=
 =?utf-8?B?dVVjM3B2N0VvY1lrazJ6dnFCeDdjUitYb0FmeHE1SWNabGV6S1l5L3NaRG5z?=
 =?utf-8?B?bGdlZG1vYWxTWWJQZjhVSm04ZEdWZlMwaHdzOW5zalNZOXNhdjNRZE9tbkZO?=
 =?utf-8?B?UmlNdXdRNktTOXF6ZzQrUVFYbUlqQ2ZKOHIzalBPV3ZCeFZQRDVCcFZaSThx?=
 =?utf-8?B?VzdLZXpZR3NsUkpMZkZVdkpEcmhUckhLSUZMallMc0RRSW1uQ0hMQUJvL29Y?=
 =?utf-8?B?Vm9SREJtbFZqU1Ztd250UE1tcnI1TjltRDVKSEJLTTdnS2tjYjRUVVJIbGpu?=
 =?utf-8?B?NFJqOG5YanJ2QzhzS3p4Ynh4MUNvZXRxYUlNMmdNQUFBVkIvZTNTeUpZQndn?=
 =?utf-8?B?WUJuSytEbC80eTh0QjNsWkpJOWUzVXNoZEtic1lWbVdWdllwUHdRVlM2S0hW?=
 =?utf-8?B?cWZKNVpaNzhocWs3cUVwcWwxbThPSVJ6c1JWL3lpcHlSaHJLOG9tT1I1amRp?=
 =?utf-8?B?cHAyamdDUWltWFlOMHJTK1ZjOFM2aTlQVy9JTTNROUIyNGFmVkVkUFVwSFZV?=
 =?utf-8?B?MmY4V1c1YzZRZG1sUUZRbU54NGdNZVd4WTVHblY0Q3VUa1BTWCtZR3Jad1pB?=
 =?utf-8?B?Nzk4TG4rZVVYMEVLQlJQZ0VRczZuNWJvbkpqdExKanRjMHkvTnJtV3JWNWkv?=
 =?utf-8?B?NjFLZklqVEFoMVhGekRNLzJnTWR3ZGIwcFNLYjBXNmpaYkJzczV1NzR5ZXIw?=
 =?utf-8?B?UXZqY2gyWlFNNGZYYklzNTdnTElnbzdNdStidnBVeVNZL2dsTnI1VUk5RW9m?=
 =?utf-8?B?Z2IyaDBYSnRkSWZORUFWelBSbExUb1I5ZFI2MFh2MVlYZ3U2enZBNGRLRVJH?=
 =?utf-8?B?Q2VQYUtiYkh1bTgrT3FuMFYxSXdNdjRXRk05RXNCQWJBbnd1YnlTY1BhSHVZ?=
 =?utf-8?B?RDM2SW1lZlpSOTA5U2JZQ1dSczlTUkRNT0ViVSt6WGZVY0pTcVBFeEs0Nk56?=
 =?utf-8?B?TVFJdTk4QU01eGJ5MVAzblhFY0ltWXFvZGZWU295Ry9lN0ZhbWgwK3FKbDQr?=
 =?utf-8?B?ZFBldHJ0SWJweSt0QTVNMWZiMWYrSDhxcWw1QnFSckFuaE5zY29OUT09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134805a4-d212-407d-00bc-08df23a11d01
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:19.4440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YejjrGrs0PPGUAl8STTTwiGYk5mLuVCiKLdvdARNRyi6i8aM3CLr3pj6gP37mSyDsMkwHEZmeAdh2wSNsPNh2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB11561

And add or delete newlines where applicable, and sort properties
according to the preferred style. Fixes warnings from dt-check-style
in strict mode like:

  samsung/exynos4210-universal_c210.dts:338: [property-order] property 'pinctrl-0' out of canonical order (should sort before 'samsung,i2c-max-bus-freq')
  samsung/exynos4210-universal_c210.dts:340: [required-blank-lines] "status" must be preceded by a blank line

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 .../boot/dts/samsung/exynos4210-universal_c210.dts | 91 ++++++++++++++--------
 1 file changed, 57 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
index 744039068e8f..bcc636adba91 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
@@ -74,46 +74,46 @@ gpio-keys {
 
 		vol-up-key {
 			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
-			linux,code = <115>;
 			label = "volume up";
 			debounce-interval = <1>;
+			linux,code = <115>;
 		};
 
 		vol-down-key {
 			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
-			linux,code = <114>;
 			label = "volume down";
 			debounce-interval = <1>;
+			linux,code = <114>;
 		};
 
 		config-key {
 			gpios = <&gpx2 2 GPIO_ACTIVE_LOW>;
-			linux,code = <171>;
 			label = "config";
 			debounce-interval = <1>;
 			wakeup-source;
+			linux,code = <171>;
 		};
 
 		camera-key {
 			gpios = <&gpx2 3 GPIO_ACTIVE_LOW>;
-			linux,code = <212>;
 			label = "camera";
 			debounce-interval = <1>;
+			linux,code = <212>;
 		};
 
 		power-key {
 			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
-			linux,code = <116>;
 			label = "power";
 			debounce-interval = <1>;
 			wakeup-source;
+			linux,code = <116>;
 		};
 
 		ok-key {
 			gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
-			linux,code = <352>;
 			label = "ok";
 			debounce-interval = <1>;
+			linux,code = <352>;
 		};
 	};
 
@@ -147,6 +147,7 @@ lcd@0 {
 			reset-delay = <10>;
 			panel-width-mm = <90>;
 			panel-height-mm = <154>;
+
 			display-timings {
 				timing {
 					clock-frequency = <23492370>;
@@ -164,6 +165,7 @@ timing {
 					pixelclk-active = <0>;
 				};
 			};
+
 			port {
 				lcd_ep: endpoint {
 					remote-endpoint = <&fimd_dpi_ep>;
@@ -185,12 +187,13 @@ hdmi_ddc: i2c-ddc {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpe4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpe4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-		i2c-gpio,delay-us = <100>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
 		pinctrl-0 = <&i2c_ddc_bus>;
 		pinctrl-names = "default";
+		i2c-gpio,delay-us = <100>;
+
 		status = "okay";
 	};
 };
@@ -209,6 +212,7 @@ map0 {
 			/* Corresponds to 800MHz */
 			cooling-device = <&cpu0 2 2>;
 		};
+
 		map1 {
 			/* Corresponds to 200MHz */
 			cooling-device = <&cpu0 4 4>;
@@ -217,58 +221,67 @@ map1 {
 };
 
 &ehci {
-	status = "okay";
 	phys = <&exynos_usbphy 1>;
 	phy-names = "host";
+
+	status = "okay";
 };
 
 &exynos_usbphy {
-	status = "okay";
 	vbus-supply = <&safeout1_reg>;
+
+	status = "okay";
 };
 
 &fimc_0 {
-	status = "okay";
 	assigned-clocks = <&clock CLK_MOUT_FIMC0>,
 			  <&clock CLK_SCLK_FIMC0>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	status = "okay";
 };
 
 &fimc_1 {
-	status = "okay";
 	assigned-clocks = <&clock CLK_MOUT_FIMC1>,
 			  <&clock CLK_SCLK_FIMC1>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	status = "okay";
 };
 
 &fimc_2 {
-	status = "okay";
 	assigned-clocks = <&clock CLK_MOUT_FIMC2>,
 			  <&clock CLK_SCLK_FIMC2>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	status = "okay";
 };
 
 &fimc_3 {
-	status = "okay";
 	assigned-clocks = <&clock CLK_MOUT_FIMC3>,
 			  <&clock CLK_SCLK_FIMC3>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	status = "okay";
 };
 
 &fimd {
 	pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
 	pinctrl-names = "default";
-	status = "okay";
-	samsung,invert-vden;
-	samsung,invert-vclk;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	samsung,invert-vden;
+	samsung,invert-vclk;
+
+	status = "okay";
+
 	port@3 {
 		reg = <3>;
+
 		fimd_dpi_ep: endpoint {
 			remote-endpoint = <&lcd_ep>;
 		};
@@ -277,18 +290,20 @@ fimd_dpi_ep: endpoint {
 
 &gpu {
 	mali-supply = <&buck2_reg>;
+
 	status = "okay";
 };
 
 &hdmi {
 	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
-	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd>;
+	pinctrl-names = "default";
 	hdmi-en-supply = <&hdmi_en>;
 	vdd-supply = <&ldo3_reg>;
 	vdd_osc-supply = <&ldo4_reg>;
 	vdd_pll-supply = <&ldo3_reg>;
 	ddc = <&hdmi_ddc>;
+
 	status = "okay";
 };
 
@@ -296,15 +311,17 @@ &hsotg {
 	vusb_d-supply = <&ldo3_reg>;
 	vusb_a-supply = <&ldo8_reg>;
 	dr_mode = "peripheral";
+
 	status = "okay";
 };
 
 &i2c_3 {
+	pinctrl-0 = <&i2c3_bus>;
+	pinctrl-names = "default";
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
-	pinctrl-0 = <&i2c3_bus>;
-	pinctrl-names = "default";
+
 	status = "okay";
 
 	tsp@4a {
@@ -314,17 +331,24 @@ tsp@4a {
 };
 
 &i2c_5 {
+	pinctrl-0 = <&i2c5_bus>;
+	pinctrl-names = "default";
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
-	pinctrl-0 = <&i2c5_bus>;
-	pinctrl-names = "default";
+
 	status = "okay";
 
 	vdd_arm_reg: pmic@60 {
 		compatible = "maxim,max8952";
 		reg = <0x60>;
 
+		regulator-name = "VARM_1.2V_C210";
+		regulator-min-microvolt = <770000>;
+		regulator-max-microvolt = <1400000>;
+		regulator-always-on;
+		regulator-boot-on;
+
 		max8952,vid-gpios = <&gpx0 3 GPIO_ACTIVE_HIGH>,
 				    <&gpx0 4 GPIO_ACTIVE_HIGH>;
 		max8952,default-mode = <0>;
@@ -332,20 +356,14 @@ vdd_arm_reg: pmic@60 {
 						<1050000>, <950000>;
 		max8952,sync-freq = <0>;
 		max8952,ramp-speed = <0>;
-
-		regulator-name = "VARM_1.2V_C210";
-		regulator-min-microvolt = <770000>;
-		regulator-max-microvolt = <1400000>;
-		regulator-always-on;
-		regulator-boot-on;
 	};
 
 	pmic@66 {
 		compatible = "national,lp3974";
+		reg = <0x66>;
 		interrupts-extended = <&gpx0 7 0>, <&gpx2 7 0>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&lp3974_irq>;
-		reg = <0x66>;
+		pinctrl-names = "default";
 
 		max8998,pmic-buck1-default-dvs-idx = <0>;
 		max8998,pmic-buck1-dvs-gpios = <&gpx0 5 GPIO_ACTIVE_HIGH>,
@@ -576,13 +594,15 @@ i2c_ddc_bus: i2c-ddc-bus-pins {
 
 &pwm {
 	compatible = "samsung,s5p6440-pwm";
+
 	status = "okay";
 };
 
 &rtc {
-	status = "okay";
 	clocks = <&clock CLK_RTC>, <&pmic_ap_clk>;
 	clock-names = "rtc", "rtc_src";
+
+	status = "okay";
 };
 
 &sdhci_0 {
@@ -591,6 +611,7 @@ &sdhci_0 {
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus8>;
 	pinctrl-names = "default";
 	vmmc-supply = <&vemmc_reg>;
+
 	status = "okay";
 };
 
@@ -600,12 +621,11 @@ &sdhci_2 {
 	pinctrl-names = "default";
 	vmmc-supply = <&ldo5_reg>;
 	cd-gpios = <&gpx3 4 GPIO_ACTIVE_LOW>;
+
 	status = "okay";
 };
 
 &sdhci_3 {
-	status = "okay";
-
 	#address-cells = <1>;
 	#size-cells = <0>;
 
@@ -615,8 +635,10 @@ &sdhci_3 {
 	mmc-pwrseq = <&wlan_pwrseq>;
 	vmmc-supply = <&ldo5_reg>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd3_clk>, <&sd3_cmd>, <&sd3_bus4>;
+	pinctrl-names = "default";
+
+	status = "okay";
 
 	brcmf: wifi@1 {
 		compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
@@ -628,7 +650,6 @@ brcmf: wifi@1 {
 };
 
 &serial_0 {
-	status = "okay";
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	pinctrl-0 = <&uart0_data &uart0_fctl>;
@@ -636,6 +657,8 @@ &serial_0 {
 
 	uart-has-rtscts;
 
+	status = "okay";
+
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
 

-- 
2.43.0

