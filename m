Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0F73E9C08;
	Tue,  6 Oct 2026 11:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287900; cv=fail; b=C/ZSZWm8euI4IXU0wrcpvZQVuNqTNsvpLdmuSk8c3Nb25zH719dLDSXc2QSb+yNdrHjOvTu4QDZt50Uz3JHGNGSJustItbyHB2XLqLFKTob16qdiXXJLIHNYlSBX9uwYo3jWKNIy/v5chSQUhz/S33WAGFb/+S0nh2OPBok3n/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287900; c=relaxed/simple;
	bh=5dIr61AenKslm4JmcCHuDtadO4naqsXmZmCVqeYe8vo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SyW7Jr7ec41B/xhomI0UHiUW3SHUelELQcDIXSM+F0jsjSdDrYx4EIgLbvTNN2oQI9tNjTKOar9zAIZ8B5k70nh0RkCqjPzNlt0Gkmr4GmRA14Rp6pxY8sXH+IEdHpHzZYRgSZl2pIXo7WlPjy3Fa3xEpSDGr2iYQfxN1ZtH1kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=mWpwpV/i; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="mWpwpV/i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoKYfWdif6HnFpxo3Gs7qSruPOcqq+UtlpL5XedamAhcj/ciKb5v05rSJCjoPWJnVri+6mgbmWIlodHe1xVcUSb7aV9pSqq1ENt+v2EqI9ydT0qPI2wZH+qQdW1VypcldPiOiaXFtYHy+ZkITEb9TpXoPvibfRyBtGVGBmzAhp6XC+4CWDjyw9rIhKqqi85Enp7GSVCZ9xXG2auztK0Zvo3EXb10CKWlNm2auxQ8QW5OsP8ydDyAuuomA2eH04qcKHQiwmaodf1FGu8bEvBUXT6Vw8sYZ4oLjRtfX3B1oZEb+wrrX1C3G17gt9V9OC73qq1t2wMb5BSFdv+KYppe4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96QaT7NGG5QsEpOMqkx1EIAlPmNTiG95XHMpgburkGw=;
 b=ny+klWyk2czTh6pPiabOEwzjJmj1YJH0dm3ZHkigFEKa8BX1iEBURvIypacj/2mh5jXjLZPVXDPlPAA3C6qD3Wqy3tgx+KJYuTP++PY1Webof/N/khz7po0iUuIOT5YKkJZg+ADQuptEfTUmeJlv82sXXL7XJGaAHaA5m+DTcKdhrbuHe/cVcs6LZr7FccMkQN+6T4S6ob6Dq5yDhlrjlBgoi47tFKpvtuhfG4r4XtCzVEM7z2yfTTjeJDT6uWavkMrbn8WYflRUkR54d58OJ4y7AWNnq4mDJx+7dsPliq0GkCM481jfcF+SJUK2cbVDYOgFnpkJkU52LmMHvBdNXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96QaT7NGG5QsEpOMqkx1EIAlPmNTiG95XHMpgburkGw=;
 b=mWpwpV/igC3g6KCGR6OUuA/maRBIEQUj7KUdIyIMEhS89qRBUHLPhKSJeift0vRCIeeOlrPS97F4LBwuVs3gxIQGuy1AL1riVlUGFu01o6CHd9B0QS6Bv2IM0X22+PmyZHBpE7B7HEBdCJE72W2IdDb9qU0MPdyhqsiP763TIy4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AS2PR02MB10002.eurprd02.prod.outlook.com
 (2603:10a6:20b:606::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 11:58:09 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:09 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:19 +0200
Subject: [PATCH v2 05/17] ARM: dts: samsung: exynos4210: sort nodes by
 address
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-5-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3940;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=5dIr61AenKslm4JmcCHuDtadO4naqsXmZmCVqeYe8vo=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOIwT6LzUrdGB9TGWVaDzXCrTdP30sxw4J1bk
 gwyUSAiumSJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiMAAKCRCwB25JC3Fh
 a4OnB/93soRPsWkJb9fSBrhYHvmWpiV0KvZx/hvnWgOahBNWR3TvQ/OtuM0ubxDh+Ov7JiA90oJ
 vcwgPqae/iSEbF1icwTLIy6kVNrhxbGK6UTFoS2g/uCakueexHM4eydnNO0SJTVGh+EllrTSLSn
 fRCOxm5i6U9NGAAHsuDP7wEaDosAtSaaU+JsriCoxGNxjYNx1Y231FzA7xwPl0tewSipqtxJ93H
 ugwrnk1UFnBEftGp3jLylz+6gJDTzH4BG5Z1YvXPQoRddG7IXKP+iiJ9zthSbv9LfXrbnYMirTK
 toOfWj0U5ZDw7vuuQXdhC/lSCNqH1pF6LhHvKnI43eU8hzgt
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: BE1P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::19) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AS2PR02MB10002:EE_
X-MS-Office365-Filtering-Correlation-Id: d13c7301-9bdc-4751-b868-08df23a1169b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ekaqaIr85ANh1mJxY8nTpjT2HYGmnDwWoAW5ff5JKSIXpaKS/KFfP/e2LALG6c8TTz5xvQFJ8JyVgg9tTOzD5CnFFt4MG/qvukMzbA2xRYzyjcQtG5s9I0bB1JslS6JrHq/TWr4SF2VREqknFCsfuZb/+Tqk4avn7k7mJNDfKoAIOv5lKXBCch3obWgZwrDjSoVNRgZp7zeAGAefxptg7dqP/O8OBHkrpHLX/FFAxdVvCZb6PFkAaamPNG6asu5bQpNBfGQBNnnGWGgnQq92s5sTLyBH/+cJy+94hXIyDMYrtOHqvHhJwFSrOd7WewtmpFx8jZop2deLQ+6/5XKeR91ZQMs9pDGAKvPaJ3GnkVMfEi6r0935k0iwOvt7naFAGmqWEQABl1C8H+qLwmgpEKFP0vPZdotp4nhjDYonSv6YaMON5NVmupqOFXv1ZVgKE+zxHUcao297ZjUSE/BLSOzUSHXAl772o7BPcO33PverEqkor2Yfj+LA6pdVIPQT0jdSpjC3O1ZkEGcWd6jDcFAdsXnSKh7a393b+UwNhh2LRz0kanPNib6T6VqIOjReDebZ4FzRTjZyU50u4rmuPBCnB0VuWDzO+oAUAQuV1ZQt9SLQgxqtH9muNXGp60WfDo6lcwhI1Ph1VO8eZc3Kjax5blsHD+Lezj4elRQ29jQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3JFQ1lrV1d3eklIMGhwZ3pyRXYvQ3cyV0E3ck8vWHFZQVBxa2NtOUtDRExY?=
 =?utf-8?B?NktpWFdIRThtbjVhWDQ0cmlMY3FKQ3B2WlFZZUtNbWpOQjBhOW9ZZzhPWHh6?=
 =?utf-8?B?eTc4c1V2L0NpVU1mMmVIQkV1eVFaWlJETUdQSHFYU3pNaFFzZGszUTBkUFk2?=
 =?utf-8?B?QnNWQ1h4Nk5YUEN3YVU4emF4bjg5QVN4TnJpMFZPamYwczVGYU5TeHNjK3Vz?=
 =?utf-8?B?Tm5PQnVZRmJrLzZIZkoxR1Vndi9XZG10S2NEVkd0VWg0WmdVWjh3bHJUZ0ti?=
 =?utf-8?B?SlI1N1U5V1NTa21NVGtuTmRSMTI5RVZreERrS3JRQkpaeDh2bUFNcWNZbUx0?=
 =?utf-8?B?N2RFM216ejZEWU5YcHliRC9UTlZkRzl6V2pVd2RHd1J0ajdyUkU2Q1BGQThj?=
 =?utf-8?B?WURlbHI5ZG82eFlXTVNqV0R3VEJTWWVZQU1rV0hvWVJXNExRekFzY2FQekxD?=
 =?utf-8?B?UGhROFJiRmFKSDJIekR4bzhOR2JYeldZd0hFTXNZeElBanFqZ25TNzlBaFF6?=
 =?utf-8?B?Rm9zSVhIU0NHbnJTaU5xSHhRWTcvbGtlbGJZWHNsM1pxOTllU0NKWndPYk1a?=
 =?utf-8?B?UStIbDNoYStjNW81eW5sQmxJR1BPN09PZE92S1g5eHNEQmVQcXd4dGtRY292?=
 =?utf-8?B?R0hYbEFraS9MU1BLMGlpakVWbVFmVlhFczRaVVFMblVGcXJhRjZTVHlCcTBG?=
 =?utf-8?B?QVV1Y1MrYUwvTnFZUHVleXlUc011QlR5a3JObnNZWStOcDN0SHV3ZFlyVGVO?=
 =?utf-8?B?TVpjcjB4c0FqallGSjJiMnJzWkNiL0x5aWdDVUlZc3JXanNLbFFwSnhRaW0v?=
 =?utf-8?B?RGhMUk5wWmtPRmk5dytuK29Rek9aYW5lZUdQWG1UaUlYNWw5a1E2ckFPcEhn?=
 =?utf-8?B?emZpa3MrQTVMa0s5L2grdThPa2RsVDlMb3VHSVNhL00yaEkvM2NmaEJzbmlF?=
 =?utf-8?B?RUtsZzY2TjVSRnhrSWdlbVR0U1NOYUdLV1pBYng2TDVyWUxnZlhQall5MlhF?=
 =?utf-8?B?YlZHbjNIWE9kdVZvYjUxSngzeGJnc3VBTUc5eCt5cFphRGJhUXVIU21UUTA3?=
 =?utf-8?B?OFJyS25rWXlZcWxNY29HRllVdzdRN2xWeTZITCt5eFl4ajQ2dDBwL0xRQkIz?=
 =?utf-8?B?VU5mV1FnYnlraHBzUkdpd3lZVUwyazRiSUFUVnRHaytkZTVJdnNZczdpc3Ru?=
 =?utf-8?B?VDJUZStZNGQ0V2FrTVloVUFWeXhlR2E1TExnVGVxVlMwaFZkSTArWXljZjNj?=
 =?utf-8?B?NHJZbW95TyswTEdnNGZmY2ZxemxuQ0JYOEVoOUt6bVlWSDhFSUYxOUM4aWh0?=
 =?utf-8?B?c05ZWXJDamdZeFUzd0RoczJOQ2N1NDRDM2VlMVB2NDFmRWhHTnY2WEFVUnRV?=
 =?utf-8?B?ay9qWmlLMFFMallJMlg0OWs0TEpSL3lyM1I1bmlCdCtmeGQ5bXlMVTQvSXBY?=
 =?utf-8?B?WUdmczhkUDNBV2pEdncwbXRzSTMxa0RuL3lldmVOSkUwY2kxUE01K0RGWjB6?=
 =?utf-8?B?VGtkd2FyOW1YdnJXcFpxa1MxRm1QUHJHb3V5R0xzci9kb3FtTWYrVlp1cWhH?=
 =?utf-8?B?T1VXQnJGRzBXdVEyVHBraHE2aG1rYXl0WElLWVBuc2pvYUhWMk9NME1PclFl?=
 =?utf-8?B?d290ajY5RWVMenBMYm85Q2M5dzZuN1B2eVdzS2Z0L1JKQ3VrVTdpcHRxS2Js?=
 =?utf-8?B?S1V1S25ZSjZkMWlUQ1l2eFV2OEEwQkdleDlsbnl1cWJlMFo5dWhnSzNRRy9i?=
 =?utf-8?B?eHZPZzlDRnJ5OWt2VThqOVpsV3drYjkzN0FTTE1MRFJIUXRxNVcvSGd3V1Rs?=
 =?utf-8?B?aWRLaUJ6MVd0eUJaOFk1NXRmbEwzUi9lcHY3U216dnlHQWxibmxMV3RnVWdl?=
 =?utf-8?B?Qk01UllRUDZXTWQ2NkJ4YVBkUCs4RW9SbTgvQXZrd09Yc0I4MUJkRGtCNUg0?=
 =?utf-8?B?THFFejFwbkEvdmI0cStJNi9UZlRtT3VqeGdONWk1V3RiQkxvWXBIQmVnVUlB?=
 =?utf-8?B?a0wvbVJMd1pCZ2ZtMkt0RmJWSTNmRCtsaVMwWElCSDQ3eVo0R1k1QzJ3ZTcr?=
 =?utf-8?B?WHdUdnlEWmZONXE5T29ZbHNEbHVmbWhOWUlHeCszaGpkYklhcFBmd3Q3c0t3?=
 =?utf-8?B?TGZkdkNrMWhMVTk4c1BNUFBCTVFLNnBiTHRMTUI0TVJkcXczUVBDdm5vVU1L?=
 =?utf-8?B?MjFMLzFzRjZTNHJjMkZ0S2RnZjAvMHRRSnpNQ2dtSk5pM1cvSW9JVlM4YmdX?=
 =?utf-8?B?aGNEUzZ3SUt6dTJ5TWltMERET0YxWnEyQzN5bHVsR1V3MG5iNDBaSGpPWlN4?=
 =?utf-8?B?Zm5xeUxOSmFJQWNPbXg5YkxuRmx1Z013UDB2MVdGQjNnZDlJcWxHZz09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13c7301-9bdc-4751-b868-08df23a1169b
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:08.7325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxddnsxFJRERcjsyTqzOCEjJXxJoVbHQZhqclYKvXb6hkxJ9Pa1r4yFRqmxaHPvY4PV5/+nxCYFxHde7Y555/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10002

Nodes should be sorted by address, or in the absence of an address,
alphabetically. Sort all nodes except the pinctrl ones, to keep them
grouped and in order by alias numbering.

Fixes child-address-order warnings from dt-check-style in strict mode
like:

  samsung/exynos4210.dtsi:369: [child-address-order] child node @12220000 out of address order

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210.dtsi | 77 ++++++++++++++++---------------
 1 file changed, 39 insertions(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dts/samsung/exynos4210.dtsi
index 510e8665d1a2..66b1a55f703d 100644
--- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi
@@ -269,15 +269,10 @@ pd_lcd1: power-domain@10023ca0 {
 			label = "LCD1";
 		};
 
-		l2c: cache-controller@10502000 {
-			compatible = "arm,pl310-cache";
-			reg = <0x10502000 0x1000>;
-			cache-unified;
-			cache-level = <2>;
-			prefetch-data = <1>;
-			prefetch-instr = <1>;
-			arm,tag-latency = <2 2 1>;
-			arm,data-latency = <2 2 1>;
+		clock: clock-controller@10030000 {
+			compatible = "samsung,exynos4210-clock";
+			reg = <0x10030000 0x20000>;
+			#clock-cells = <1>;
 		};
 
 		mct: timer@10050000 {
@@ -301,10 +296,22 @@ watchdog: watchdog@10060000 {
 			clock-names = "watchdog";
 		};
 
-		clock: clock-controller@10030000 {
-			compatible = "samsung,exynos4210-clock";
-			reg = <0x10030000 0x20000>;
-			#clock-cells = <1>;
+		l2c: cache-controller@10502000 {
+			compatible = "arm,pl310-cache";
+			reg = <0x10502000 0x1000>;
+			cache-unified;
+			cache-level = <2>;
+			prefetch-data = <1>;
+			prefetch-instr = <1>;
+			arm,tag-latency = <2 2 1>;
+			arm,data-latency = <2 2 1>;
+		};
+
+		ppmu_acp: ppmu@10ae0000 {
+			compatible = "samsung,exynos-ppmu";
+			reg = <0x10ae0000 0x2000>;
+
+			status = "disabled";
 		};
 
 		pinctrl_0: pinctrl@11400000 {
@@ -330,20 +337,15 @@ pinctrl_2: pinctrl@3860000 {
 			reg = <0x03860000 0x1000>;
 		};
 
-		g2d: g2d@12800000 {
-			compatible = "samsung,s5pv210-g2d";
-			reg = <0x12800000 0x1000>;
-			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clock CLK_SCLK_FIMG2D>, <&clock CLK_G2D>;
-			clock-names = "sclk_fimg2d", "fimg2d";
-			power-domains = <&pd_lcd0>;
-			iommus = <&sysmmu_g2d>;
-		};
-
-		ppmu_acp: ppmu@10ae0000 {
-			compatible = "samsung,exynos-ppmu";
-			reg = <0x10ae0000 0x2000>;
-			status = "disabled";
+		sysmmu_fimd1: sysmmu@12220000 {
+			compatible = "samsung,exynos-sysmmu";
+			interrupt-parent = <&combiner>;
+			reg = <0x12220000 0x1000>;
+			interrupts = <5 3>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_FIMD1>, <&clock CLK_FIMD1>;
+			power-domains = <&pd_lcd1>;
+			#iommu-cells = <0>;
 		};
 
 		ppmu_lcd1: ppmu@12240000 {
@@ -354,6 +356,16 @@ ppmu_lcd1: ppmu@12240000 {
 			status = "disabled";
 		};
 
+		g2d: g2d@12800000 {
+			compatible = "samsung,s5pv210-g2d";
+			reg = <0x12800000 0x1000>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_SCLK_FIMG2D>, <&clock CLK_G2D>;
+			clock-names = "sclk_fimg2d", "fimg2d";
+			power-domains = <&pd_lcd0>;
+			iommus = <&sysmmu_g2d>;
+		};
+
 		sysmmu_g2d: sysmmu@12a20000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x12a20000 0x1000>;
@@ -364,17 +376,6 @@ sysmmu_g2d: sysmmu@12a20000 {
 			power-domains = <&pd_lcd0>;
 			#iommu-cells = <0>;
 		};
-
-		sysmmu_fimd1: sysmmu@12220000 {
-			compatible = "samsung,exynos-sysmmu";
-			interrupt-parent = <&combiner>;
-			reg = <0x12220000 0x1000>;
-			interrupts = <5 3>;
-			clock-names = "sysmmu", "master";
-			clocks = <&clock CLK_SMMU_FIMD1>, <&clock CLK_FIMD1>;
-			power-domains = <&pd_lcd1>;
-			#iommu-cells = <0>;
-		};
 	};
 };
 

-- 
2.43.0

