Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406513E765A;
	Tue,  6 Oct 2026 11:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287895; cv=fail; b=Tw3kAYFoCrEFJQEjxbVreIGjtM7Zq/oKc7wcSR8t9yl0Ym04ePaGzadoBH5Xf4h0rwwjI9Gh7i455vgIJIUIT0ipGj37jeyGxEuZrypUJ9R3h2MFp+0QboN0PA9GaObw76dpl/CjQPl52wn7MQTUOmMJ0hvdTUEO756DeOCDjQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287895; c=relaxed/simple;
	bh=/eCgP/CKJv44KbVKstiLo7GDKMhs0J22Jc0phXktnjw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=g6LJVWIp1YsAWhbpxBLpF0mbMmVVD7DNNH6t120aqXtyX407fwWwUvv9vedsfqxOmr/yGAZ15d6LgHg5AXHR0gDu2aO+GvqtpWoMAlg/0p/XnUV/3KxEQMppMkBoC8TYVOToVFfEte0Qe2VTfEL5e8GPpX8/13JPL5cZVmRHmKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=LvCcscI9; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="LvCcscI9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUkgbDhcbe7EK0F8/bRG+ByrvDpkxz0+eccqcpc+a5TKAUJEKgIfU9lPFg98SEfZvPSEw7LgzkB0xUvG3i7rVHS4qqR1xjeIEgnG19ONB6iuaMQq5G/1lMPIsAT0YH8n1ANdzjwyDCsDfs7bwwW4cpmGr/7ECqbjPX2ncPLUT6HTAvjMSRTe17W81b8pmUiOUZ2dL/XcGeNal/VHP4hNbH1ROacq5PwUc+lIJ653zbkN5/hBt2waHJkd+yTgBNzdd/jsgs6mplX5HW2SMxWznD2ZHspruwAC2s7/Q6umEnTkl1Ha+mMBLq/IxbYHNLIjGiBBsQG3iDOrHsf+UIJt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhWu4uw5o5wh7b2H29oc0pRbeM49NcyIRT4ZZJDKW44=;
 b=YS07fZLxzTiG656EBIM/gnawdnEJujJLwk11ceQbfEuObiotTzkaD54rdoDgxBCbTSVruVVvtliapyeTH0ZOtl4GvaRMvMp15B59Hn+j4E0tPHYbibqEwMYI5A7YSy0WWTNhLSRrl0sT37PoNznwcUextlXqjWvsCdFmFdY5Kv36JJmHrzmXYPh3DUMJonxvrtmZlCoGyOuwShNMvTMqQjviikm1HCz6mtYOdJ2AacUyMy7Rf9m3tHCqj+ikkwN0ib4f8mSKGVTpoOSnLcuPkrCSQAT6tVldW2y92TD1z4H70CEb9Kl1wXdWGVRd7hnsZgZQzcQypsYbLsBG46VkoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhWu4uw5o5wh7b2H29oc0pRbeM49NcyIRT4ZZJDKW44=;
 b=LvCcscI98djnJTPg/y8iykxvWCsbjv1ZWPS7RGwA4BacnXLzuk2Z2mItBhIfVZbs2pZRMvbcDc0xielkJe1MuX3G42fQo5TqxO8EhZQtB5oChhDJ3wylZRFjDmAmmAuCiwTdK/ldcCYIRVRPPk2m9CdsEGDoi4FVUHR60ZfHO94=
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
Date: Tue, 06 Oct 2026 13:57:18 +0200
Subject: [PATCH v2 04/17] ARM: dts: samsung: exynos4-cpu-thermal: fix
 indentation and sort
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-4-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2863;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=/eCgP/CKJv44KbVKstiLo7GDKMhs0J22Jc0phXktnjw=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOIuSGjS37PuyNkQRTY6gawolYLbzkZN9nLNl
 p96/VZw6MOJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiLgAKCRCwB25JC3Fh
 ay3LCACZX9nddrWynrgp48ncRPyd5lLB1h7FlX726QBzBmxSL+UrvVg487+6wbdvaah7i9vICQ/
 6aN2IBZ+ODDNpBOZ2p0v2VsARfnxePEUQTZFmglQKy3m0RLZadDKZpyUHFEuuzI7i7/ohBOETtl
 tK2/g0nLqo2YZq/Zlc5EeJ8t7nUSyxeyvqdK+nRJuYS0iUMtuy5oITlmO0lJVTXivRRUluwmYFG
 kY7XOhfuuXOFr6INdV/Co41Tp8BoVDcWPS16t6jvDzscFsHqHSUT48QnsYhvusIKug+vIWp0Iiu
 xdQBrh5Drf17E8imICdqVgslOWsYEfGWN/1UqQn5c7RjmXdU
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: BE1P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::13) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AS2PR02MB10002:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f17151-b018-4d5c-55b6-08df23a115cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	m7a4RiB8MvE+TdDEIYGw/HBe8GhN1i+6MMvptGBiSul/+UdShCpKwjMrtbcTdhEmBQzHxrCztJiBH1d67xpTfDvIXxiBqsARM/S2m2iiCs8mMxKWcLJxE9foZR7Fx8RJ8wvgE0yk0+eBO01omtkJmqAQcNeoKJr911A3c2I0/U0HCcZI5cEUvvSKtxm86ZUeTn1hZfCotjuJL9ghcwz0qtb0IoGICwJkbbwa6bVlgkpWxfhg3ZQSx4STieoddy7ghHU3rsQ40HbT5wMDuLbbD0W5SIzHwNdjQN2DUQ2OOczjLDuwYkzY22E5elTIzswfgDNTtxBWw9YFPKAiJAG4LLJDvHLIQv4skM/bJ86su0YCmwrQt1Xm/RmAqvgRDGZ7daFMGbIh0x8p2izU+JQOTDOVVFP0NkiMSDtulsuNYnc1i1xtk4GyNOin/Wn5yI4ituVxGRzneM+LJ1HRTilDQUIujpEJTrn7u5q4l0eWnGz1gQlRsqX3u3DsjgSUWVg5GkrW9LeEkO7TfxeiT3o6ATJA9Vu7L7QMTGc7EkovHJVkyY2VKDhX2WxcxxXUhGtgUFxmlhnaEt+k5mJpYV3ao4HxB/fOuvzNQzH96bXg59Qd3RxifWwWKKvW281y3qm7HoXKrEymmoyTK3pLn3hdLc8/K5QBw6OMTS2QG7pru8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTdMVE9YNlN2UHVPeEJKK1ZhR2R6SXhnTkl1a2JXMW9UWldYcjFSSU1ZSEQw?=
 =?utf-8?B?MDRpSnZ3TFNPVkpBUk9lWFdvZldORzVOaVJlem9ETmhhVlU0WC9ueGRoajIy?=
 =?utf-8?B?WERIM2xPVmwwQzN3Vmk5REZyZlJjWHgrUVBhdlRHYkNZeTFCaGc3Ymg2Zitm?=
 =?utf-8?B?bVlBblUvMENUdThiU2NvV1dBRk85UUNNTDNERnhJMmtEenhWUGRSUCs3OHpT?=
 =?utf-8?B?ek5oaEpkNW1hR3JVYTljOUIvVmdHTHFOWnIwUlpDdWF3c25JMUdaUGVWZUZp?=
 =?utf-8?B?OTJzVG1wUzlkOUlMb0dFRUJGY2R5anlVRHZWRkJCV1FvYUFreEZObmwvZkNC?=
 =?utf-8?B?THVKUTVXdjAwSVdNcU5ham1pYkNDOXNuVXorWDdLYXNIVisvbGEzWnVMam9I?=
 =?utf-8?B?WDBEazRCLzNFaG1TN0gyK2JKOUxkR0ZXMEVjOUpKSEdvbEJONUpwKzB5aEkw?=
 =?utf-8?B?c3lnenEzTFNVK2xIdCtLcG1IRGcydks5bHRZVlZ3Wm9BR0N0ekRjWFZDZThs?=
 =?utf-8?B?Qms0dnMvVEczMkxjSEVQUTFDSkl5aHRYQWJ0M3l2a1FsZW1sNFZqeVlncWhm?=
 =?utf-8?B?NnhvUGhNQ1FyOEdKTzd4MDduU1FVeFJJOURUQVBva1FGbWx0azhub21Ubjdr?=
 =?utf-8?B?Z0tnK3FHOFJEcDFkamFGL0s2dFpieWlqUlNmRTFtSGlROWhNbEVrQnFwWFBk?=
 =?utf-8?B?ekl2Rkt4bmNWY3RKRHpab3B3OEtJMjdtK2dQRXF5cjhkM3l2Q0x1Q0JCRGZR?=
 =?utf-8?B?ZVJvQUd2ditWaHR0T1NwZS90QnErcjZVQTc2YVlGMU1ITHlkemtqRFRHSUk4?=
 =?utf-8?B?cXJVbEZqSjcrOUhyNlRtcjV5cHY1VzlEZ1NzK3l5QXFURENzVm00QklCM0dN?=
 =?utf-8?B?c1VKVHJlODlsSmNaT2NET2NTVGlXQTBPN2trZVJ6RXBGNExxOVFaWFpkb29H?=
 =?utf-8?B?NDhsZzNuV09TUVRrQlRURWxrSGlHWXNzVVhrWDFrUGJabm1KcUJpVi82UGVq?=
 =?utf-8?B?VWN5c2YyRHhSMGZ4OGU2SHhtNWk5VmI4aklwSHI2ZWQ5Zll6WGxvS05jQ25K?=
 =?utf-8?B?Z3g4YTltZ2FkUWx1azlOTW9wREZNSWFJYVliMlludFlVUytEODZsL1NSMGRl?=
 =?utf-8?B?R05sMUpuVkxsR1FlMzB1SS82YXloWlpIVmVTaFFGODJDQnR1MWYydmxSenVB?=
 =?utf-8?B?WXA2UVNWeGkxdGM3SHdlajlCLzZKZ1c1cWhhTldOanl5d1BRVEFRdVFNYXd0?=
 =?utf-8?B?VVNaNHZwclV1c2V6b1BaMFhydlJNUG4rc05CYmwvSEF3akRxR09zTmhRbmdW?=
 =?utf-8?B?Z2trZGZhNm9KcWprdEVoUFkwM0lVRXFvbU5kaWM3WVU4enpRN1NBZi9FMDB3?=
 =?utf-8?B?R1dQRk9hK1BqTUdBYXAyMkhTeWgzcDBxMytZY0R2dG1iNlBhYjdCY2ZRNENl?=
 =?utf-8?B?cm1KZXhCMnBhL3hxaFhZeGFJUlQzSzRyR3dIdkdqSG03ZnZPaEdNbklUYWZm?=
 =?utf-8?B?U1JQQ2hwUXNwUjlvTjNlVnJUS1JyR0dma2srSTRiWnU4d1hIT1BaSGYrOXR3?=
 =?utf-8?B?WS9wd1dMYTZJOFA5MDQweXlJSFJpdGxwYTd3TTRDd0ZIak1GdUZTSldGTmRN?=
 =?utf-8?B?NkhRNkE0eTdjQkVtM2ZxZUlOVmxlbjc3TE9WZlRFZEV6UHliZCtXN1pyWVBP?=
 =?utf-8?B?SWNFM2k5elRVK2NxZXRKWkxvakQ2KzBaVVJ1OFpWd05OSHFYMjVVdzBKaE5E?=
 =?utf-8?B?TFRJSkNaMUpWL3BpZ0EvY3dPTm1CMnVPdkVkdFMxNVRoRWFrQUZaaDcvUk5v?=
 =?utf-8?B?TlI3Mk85cHZDTzJGZW9IUGs4Y0p5NnFuOWw1KzhxdlJFYk4ydlc0SkVIYjVy?=
 =?utf-8?B?Y2JLamtid0ZBNDBQWmhBRVZtTkg5M3lPU2pZME96UHF6b1ZWZktheU5KTnpL?=
 =?utf-8?B?M0d5eTdUUldKRUQ5WjZRdzlpMnZ4Yi9sVk1BR0VKNFg3SlFYY2cwWkNDZmFv?=
 =?utf-8?B?RGVCSWo4NmZMak5mbE13N0dCZEtyMFJUTXJQQytoMHNlSHlCTjM1Vk1IL0ln?=
 =?utf-8?B?K0FUMlNTRFpCRXZQT09Eck9JeGJ2Qm4vRENKUDFSMzRBYzJZNWR2MkdaQ2FM?=
 =?utf-8?B?VzVWcTVkTnplL3YxNUNnQ3dWTE90OWVSWktlL3prRUhPdGJONUlVa1daTHdw?=
 =?utf-8?B?cUpmbkxxUy9LeGZyWWFZakFCSnlOdnk2c3lLRnZNRGJXb29ZL21WMjl4QjFQ?=
 =?utf-8?B?aG5hcG5zZG9ka2JYU3NSMVhqQ1grSEZ6ODFpVk8wUm1HNW43S1ZnSitTTWFH?=
 =?utf-8?B?ZDZJNmoyak5zMk10UWIyVTNieWVYeXhJa1VhcDZNaG1tWEZzY3VTZz09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f17151-b018-4d5c-55b6-08df23a115cf
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:07.3825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZyKMcBhmyMRfA0KS2RJjrezfOPVtYzvwRzCI1EH4fEIaKLUBDVUHue+e3A6uxMrzec7YYNi09rRhlOunxmjGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10002

Add missing indentation level, sort child nodes alphabetically and add
newlines before every child. Fixed partially with the help of
dtfmt (Devicetree Source formatter).

Fixes warnings from dt-check-style in strict mode like:

  samsung/exynos4-cpu-thermal.dtsi:32: [required-blank-lines] child node must be preceded by a blank line
  samsung/exynos4-cpu-thermal.dtsi:38: [child-name-order] child node 'cooling-maps' out of name order

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4-cpu-thermal.dtsi | 72 ++++++++++++----------
 1 file changed, 39 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4-cpu-thermal.dtsi b/arch/arm/boot/dts/samsung/exynos4-cpu-thermal.dtsi
index 27a1a8952665..48bac2fe6172 100644
--- a/arch/arm/boot/dts/samsung/exynos4-cpu-thermal.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4-cpu-thermal.dtsi
@@ -8,41 +8,47 @@
 #include <dt-bindings/thermal/thermal.h>
 
 / {
-thermal-zones {
-	cpu_thermal: cpu-thermal {
-		thermal-sensors = <&tmu>;
-		polling-delay-passive = <0>;
-		polling-delay = <0>;
-		trips {
-			cpu_alert0: cpu-alert-0 {
-				temperature = <70000>; /* millicelsius */
-				hysteresis = <10000>; /* millicelsius */
-				type = "active";
-			};
-			cpu_alert1: cpu-alert-1 {
-				temperature = <95000>; /* millicelsius */
-				hysteresis = <10000>; /* millicelsius */
-				type = "active";
-			};
-			cpu_alert2: cpu-alert-2 {
-				temperature = <110000>; /* millicelsius */
-				hysteresis = <10000>; /* millicelsius */
-				type = "active";
-			};
-			cpu_crit0: cpu-crit-0 {
-				temperature = <120000>; /* millicelsius */
-				hysteresis = <0>; /* millicelsius */
-				type = "critical";
-			};
-		};
-		cooling-maps {
-			map0 {
-				trip = <&cpu_alert0>;
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			thermal-sensors = <&tmu>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+				};
+
+				map1 {
+					trip = <&cpu_alert1>;
+				};
 			};
-			map1 {
-				trip = <&cpu_alert1>;
+
+			trips {
+				cpu_alert0: cpu-alert-0 {
+					temperature = <70000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "active";
+				};
+
+				cpu_alert1: cpu-alert-1 {
+					temperature = <95000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "active";
+				};
+
+				cpu_alert2: cpu-alert-2 {
+					temperature = <110000>; /* millicelsius */
+					hysteresis = <10000>; /* millicelsius */
+					type = "active";
+				};
+
+				cpu_crit0: cpu-crit-0 {
+					temperature = <120000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
 			};
 		};
 	};
 };
-};

-- 
2.43.0

