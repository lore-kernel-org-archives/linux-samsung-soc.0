Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F5A3E9F93;
	Tue,  6 Oct 2026 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287917; cv=fail; b=QQIfa3UBB6uOQrNx83zOfppLDCL9I7lt+TF42mNY+UujldI59f+v/QqfDT6THA2FypzIA5VJIehl80xz2Qk5ZScKlVgOGZpCHZyQ1CcJvCmcNFCrZLY0SMBWwcA12U1HhjO9X+sErWBlQPNrPTQyS9sqi+2gPMq8+BskptGKlsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287917; c=relaxed/simple;
	bh=jHEjOv97lgsv6AQquPw6bPFmhlvuIt7C3xZ1jjfZ1UQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tvVCsnaqMsE3q/sKTZ2dlvWmglEPh4A2dEh+8L0oXoSDo/dzXFUPU+jGoM/BxRoC0AjpEHpWSjBGHcIfwMg4mWmaJqJQXnm99Uj4h54W1MKChjV3x81ts0mWPsTwgKRKENV/WTKyqDZ2yY0pLblqTEEmArSYxZJcIRSSu5PrCcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=l4rr11Yv; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="l4rr11Yv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sa2jVcbwXTUtUu36jfRsj4Ox3Ukwl8YbkCVFzoONNvq0pZP/OExNh3rX88Tl2LLSpiQcAjQAtWbjrQMenZYVM6Hxp4A4f5uKsjbwFAsQRhtG82GgDRyXHe+c4z+PaIP2JsHdqv4GCjPcCYqMyALBeIXmpu0xfma55tYGO9Pq722fa1glZrjozMKh3MMrvm2VS36eE+jTSWLZcVKTVzmpktZVWQcjkxF8KAuZLjU+7wWaYWK5GBO3UJPJ58T6WC2dEGnChbIagapDYodudD1qbdPx4SOaTjULlWESiBCV2uPi1Lf9yy9XzHohUByVIhJZ+3wjR3QEkCLdsPZoDFwa9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0TzU/95uskboWjItlmFUA2DDko2UkLtMPoW5S3lpfA=;
 b=ArW83mkDpVOLE0u8evEUNoIQ+b74Gfb696Ghv4dcca27CI8JbmQY+TmVxpHj8C0S6WQdpcke8+zY0vNtHmHmrQ7RsQQGUGf1CgL4PrwzGAdDKhBaCj9WUl6He/Oi6JMDmTFglGWZUbPXOvOtKzSIJXJmKkoYmoBoLjp1aze2IKER5TteTXS0H+ecYZzr2BF0lzsUQdLgp0xy7ts0x3/4qT6aLCLXfa7LyeQ/GSCV9NizeW2eb5S8oqmTWPVtm42kLTb+mgsLhzx5gGiJwSRdB+jXBnpLi+pHUbnalLOUfmCng9b1g5GQ3AtWCeOQyjtemrDh9qeD3Qd2NEWJQI28fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0TzU/95uskboWjItlmFUA2DDko2UkLtMPoW5S3lpfA=;
 b=l4rr11YvSSsi93gIKpv1Mhyi+kQINKvq/8V6Ox/HDmrhGnHMW+iW6F8z5WlYxN4pDX/Iz+UYg5uImRZ6DarR+s11hwCMpcI4hEN0g+vPuihK8SoWlApRDYy8RzlbU462P3zuPyy8fr5ns+l99vVTzSm/fiqIJE3kx1C5RaZg5sQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AMBPR02MB11561.eurprd02.prod.outlook.com
 (2603:10a6:20b:736::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:58:21 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:21 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:29 +0200
Subject: [PATCH v2 15/17] ARM: dts: samsung: exynos4210-smdkv310: sort
 properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-15-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2555;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=jHEjOv97lgsv6AQquPw6bPFmhlvuIt7C3xZ1jjfZ1UQ=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOJDajSPCI0o6lW+R7Tc7HN1/gUIPYZ3eFIPz
 RVIHl3ssHqJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiQwAKCRCwB25JC3Fh
 aybCB/4nG8fJel147gLy1LXHv5yWparFzs31sYNWmLHzo+BEYMChYH0WWPnLPLDLNJqAAc6ALXJ
 lloBOSly76vTtw1AsW0+jVUBlSSnXwQHjlERVp4dpfpv6zZwGjwH6y3wFJ1gys8dOQdLWRMKVDF
 t9S6Z0iQqILmPcM494vgSPCMEBRnb6mkSJCMpfbYUSeQskdgOg7RNWjb9SSWQwstvayPJ0ts2R/
 U+JYUp9OmJGONSGH4q9jPEPCK+LmiQBrS+Un1QQ2P/VDYK9Y7BbfxCtAexYPzb86ZAshFprfiTr
 6KV+o/lfUHQfMGZXSd31nep+xFLTY005u2qFuSGV1tr62LR5
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
X-MS-Office365-Filtering-Correlation-Id: 0a764af3-a127-4503-e071-08df23a11e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	t6ieSRaS3rgzwR6fl8XRq1DDQ1Ur/Ld0cDy/2Y/9ztfr4h/GIVhNZ51VZCd1Qpi1P9fYg1ULQLWUv/yK3y+PlfufjsIHFDKe6+HUNDeK9nOiJyCAJRe4Lw6rmCo2qtmpWTYBND4+m3j5/wGK1y+D7Cycy40y7Mpax49dJUxSLHDOhwkavz8HribPihsuF/Q7JQ0R8yb6wJbfjNLb7HcLT84LN2MLO0/650oRHE8ZawVw2Nvq+B97L+rGMIB9v53r31YVzHojCTulGVPw+cpedwLHx7ffzdteDG6ur1MCJPGDxzgHKGYN3IswJqt1mhUFfaW/F2qciTZeMme76SGkyMXiMdRmZKtF60ndtxNA3h27L1gpWHNdgWeWFZd77CjyW0ubD20ZA6a4/oJPNwcj2k4iADO+GSfD3+WvPzZTcxcDJhjcR8NxPfVmshEF0S9VDTVBLDkVdW1s4KXFR6NswyLuneHyBsEpArmaUn342Ed3sr48Rl2Gk2dA0orrZXlMcDdp6XhNUTc1IrAguFrAncSGjpUYJHhybUjtgo/fVX72HvoqUadVUWxyweRvs1Ail4Wlwyv7GICm9frIuq+I1aapfnszTkAJf7iZNbDIxP++kqduKKE0y960EJtga7uVAQXNlPDY4t9b9zKVK51KSoWRvIVlL88jjIK16Wr3vNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE5lZU5RS2l3aSt4L0ZwV1hmVlFieHBVZU5DSGErZENndzZrWDJkYy82b1Ft?=
 =?utf-8?B?eTBUa0dJZVMwZ0NHZklqWGlGT3pOdXNJdG5jZitBYmxXT3p5OWlDYmhubith?=
 =?utf-8?B?QUZ3ZWkwNFdldkZOSU43eC95QnJQRFpsamtwMVlsRy9XWFFaekpuZFZ4Q0FM?=
 =?utf-8?B?R0JUbkFuQnJGekVrUFM2Z2pqaGR6YUttZTJ0M2ozV0NFQ0kvQUJ4WjFBR0pE?=
 =?utf-8?B?azU0b3MzMXl3bXRKdWl0MHQ4RUxtc1o0Q1YyaTBLZUFEZzFhNUxORitZbC9V?=
 =?utf-8?B?MXAzc08wNW9EQndtSHo0WnpIM29GVjM1cC83S2EwSytNcnFCTGV1UVF5UmJC?=
 =?utf-8?B?b0Q5VHlyVkMrbWJveUp5QldUK2lXeFJLU1VvbkNjS0NnL3krRzRxbDFhOEoy?=
 =?utf-8?B?QjJYWGxNdk9MQ3l5ME5OeFgyN0JtdEN3TmtWdkNwb1FMdzhqb2lMblFxcWU0?=
 =?utf-8?B?V3JzZ3dVTzl3Vk1IbGVvZk8wNDFvUlpCSzhNVU5pSmM1SFJIdmhDVTlPWUZB?=
 =?utf-8?B?M3QxZjJ0ei9yMnJROTBLSnlvWkkvUHAxaVZtQ1RNcWsyM0k0bklaUmRTaDRS?=
 =?utf-8?B?SGdDcEFGbUgrR0tEYStGR0ZIeW5qVUl2bVZ5NGlvWmRPM2lZQXR0RjFtTm1S?=
 =?utf-8?B?RVFTY3k3bTFHYmY1QWhhRWV4bllKNnRmMWhKTzJkVGZsc1dhTjNpcmxaeHVr?=
 =?utf-8?B?WVY2MERKbzRvWUZkaE9DSzVTRktMcVhHOHp6QWNHcGJGTVB4dnVKQVljdEFh?=
 =?utf-8?B?TjhzNHRnTnRLVndhblU3MXRlTU93cU9IbjZvQ0drUzRVcElkNVJ0bklIdnVs?=
 =?utf-8?B?NDVtc0Qwc3lhbDdWaWFycVJXakZ6bnBFdEhwWlhCekE0cUpUZEo1aUlxOGZo?=
 =?utf-8?B?U1RxUHBSZCtzSHdtM1ZodHBGaDJCVWY4c3JudGg0OU1VUEVCTEJrckJrSWNB?=
 =?utf-8?B?Nit3NDNPT0VtU3E3ZklNMHMxdDlNNVBSbTcrZkJjOGR1aDdtNGk3UGdtdEVJ?=
 =?utf-8?B?cU4wQkpzRW5uaWo1Y3R6M21OOFQ3SnNJalJ4NkNSZnN5cllQWjk4b3U2Y2JF?=
 =?utf-8?B?emMyVkJnZm00Y1lVQmMrZGhOekg0b2pOdll4eGxGaVhTOWZTa1JraWlWS0Jp?=
 =?utf-8?B?L1VMWG5EVzMyWUVmd2U0dHgvbWIwWC80TnYzeHFiVUtKcUlUVDBRYklpOFNO?=
 =?utf-8?B?NllONEw3RVVreFh6ZTFGRllZVDB4cUFpd3VxeWc1bjNkMXl4cE1ma3RHQndy?=
 =?utf-8?B?UzgvYzRxbGU4RDE1VkNJYXlpUXJuaG9vODVaRHFYUXRkSjh0cEt1RVR1TkNX?=
 =?utf-8?B?bzI3SXpFUGlaNVg4dDJpRjFSMlZwMjFldnRqVDdXdW9vSzltYmdRaWUwK1lT?=
 =?utf-8?B?aUNsU1FaelN6c1FoQlNLbTVyVUhScnBQNnpRL2FEb1kvbkFyK0ZTUFBYWnVG?=
 =?utf-8?B?TW15SnlvZkZuVXJQbFBwUE5BMFRhbDczM2hFZGRMRDVJcjlKZXdhYkxENWRX?=
 =?utf-8?B?dVlHd3RMdGJJZFFSR1VyMEVmNEVYamN1MllheEs5aTUwMUpQT2NDNEdYWHhU?=
 =?utf-8?B?NmUvZHpsbVNtdXJYcmdkVEQ1alBOMVBKYWIwaTlTVFZDZGM2YmQ3K1FBdFds?=
 =?utf-8?B?RFgzSzVuaHFQZzAxMEV6VXpMU0VBakR4NUticDJXQVNDZG0rZXA4SThxUHQ5?=
 =?utf-8?B?QmlmdENFbi95cHQ4QURiWG5WMlZMZE9Tam1mOGpVL3dCNU51MVRJc0tXZUd0?=
 =?utf-8?B?Z04yMDdCSUJUWk0zWUdvZ3VONkUyUDM3SFpJbTdPUU9pOTZGdm5UeW9xZzZo?=
 =?utf-8?B?dnk4UEhoZW4vcDJSV214Vm41eDJQUkQzenVEV1h4NWh0NVNKdTdOUzdQeFRn?=
 =?utf-8?B?bGg2ck9VYzByZ0laMDlXL2FWU1o3WkpmY2kwb25PSEorNG00c3k3amQzdGl0?=
 =?utf-8?B?YzA5QlVRL0pYYjBidkFETGlKclA4Q2poMUFhM3BBdzM2SG9uU3RQdVhIY2Fh?=
 =?utf-8?B?b0huY2p1K1lGNll0UWFzSExsc1pDRHh3MzEvbkVyMFpJTzBxTk93UEtnWmp0?=
 =?utf-8?B?dTFaYnBJakhmbFczQm5PcmFWblhWUUoyQ1c2bUYxRG4xL1JBMTY0SnJzWUgz?=
 =?utf-8?B?My9mVFAvNjNNK0hiZ3daTHlmbzRaQ2hQMzFBZ2JwRjJlaU1Yd3dFaDg3WnhG?=
 =?utf-8?B?WnNoZlpQSnE4OVNTMDZNTG1hOTcrWHB3NlFoR0xlelhXNU85UU8zWWZrQmhT?=
 =?utf-8?B?K0ZRT0JYT3VYY2I1a1dIK1FhZTZoelZHbmFXMDM1dVVGaTZvdFZXdlpiWFN4?=
 =?utf-8?B?QkV4ZGg3blFvY21jOGVIQ2xMUlhaRDNYaTBMZ04zTEpFdXZQWmxmQT09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a764af3-a127-4503-e071-08df23a11e0a
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:21.1919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QV4weukKFQ1acSt2uGXsY8vOYn20337fUfBVHIqld7DiV7LIMFLEi+jugIbSN1EYCpZ6WQ5slbT1sqm5OciIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB11561

And add or delete newlines where applicable, and sort properties
according to the preferred style. Fixes warnings from dt-check-style
like:

  samsung/exynos4210-smdkv310.dts:90: [property-order] property 'wakeup-source' out of canonical order (should sort before 'linux,input-no-autorepeat')
  samsung/exynos4210-smdkv310.dts:91: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
  samsung/exynos4210-smdkv310.dts:93: [required-blank-lines] "status" must be preceded by a blank line

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
index a6b73a8967c6..609853bb840a 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
@@ -60,6 +60,7 @@ map0 {
 			/* Corresponds to 800MHz */
 			cooling-device = <&cpu0 2 2>;
 		};
+
 		map1 {
 			/* Corresponds to 200MHz */
 			cooling-device = <&cpu0 4 4>;
@@ -70,6 +71,7 @@ map1 {
 &i2c_0 {
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <100000>;
+
 	status = "okay";
 
 	eeprom@50 {
@@ -84,12 +86,13 @@ eeprom@52 {
 };
 
 &keypad {
+	wakeup-source;
+	pinctrl-0 = <&keypad_rows &keypad_cols>;
+	pinctrl-names = "default";
 	samsung,keypad-num-rows = <2>;
 	samsung,keypad-num-columns = <8>;
 	linux,input-no-autorepeat;
-	wakeup-source;
-	pinctrl-names = "default";
-	pinctrl-0 = <&keypad_rows &keypad_cols>;
+
 	status = "okay";
 
 	key-1 {
@@ -177,8 +180,9 @@ &rtc {
 
 &sdhci_2 {
 	bus-width = <4>;
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
@@ -200,13 +204,14 @@ &serial_3 {
 
 &spi_2 {
 	cs-gpios = <&gpc1 2 GPIO_ACTIVE_HIGH>;
+
 	status = "okay";
 
 	flash@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
 		compatible = "winbond,w25x80", "jedec,spi-nor";
 		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 		spi-max-frequency = <1000000>;
 
 		controller-data {
@@ -214,14 +219,14 @@ controller-data {
 		};
 
 		partition@0 {
-			label = "U-Boot";
 			reg = <0x0 0x40000>;
+			label = "U-Boot";
 			read-only;
 		};
 
 		partition@40000 {
-			label = "Kernel";
 			reg = <0x40000 0xc0000>;
+			label = "Kernel";
 		};
 	};
 };

-- 
2.43.0

