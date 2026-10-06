Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36FE3E9C17;
	Tue,  6 Oct 2026 11:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287900; cv=fail; b=bUqyuGC3+WuYDr7zHVQah4Kj4kWAttjy057j/T2NWbalL4hFSsBX20eZ0X7YP99gv1Gw5AMjFDVlkVibucXq4Ox3aY8qBnUBRri4GboNJnsQ8/01WcbGo5+CK7mvWEtDoGWLoXqh28uwigpzBm84VLhQ0quOb0Wp403y/sByVkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287900; c=relaxed/simple;
	bh=n2loyEtlougIax9N1aK22HGezDO/8+WgRFbf8FAh5uE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IDutQfHFX090tNjAXMLWoHy5+5wnFkC7DiOkVQ1+6Dw4IXcP8MUzjqXS8lY+zf0ijb3B/NecVkhFd8ApvpnFWsvycJEVIYQba5vHxyJgswZ6gAPzn/yeCuL8UW+ZmZjjlndv6eRcMN5UeZHXrX4fkAWAgNCG4Ux8dq61jSv61mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=IhIMUx50; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="IhIMUx50"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbYgbZNPEQLnXG/arVmjf6JjIIZXPw2GIHC8xnkUJ2w/aV6TALzUnMRHdh7QWnGFgF1hC4oU/LfF5B2H7SInJ+b6S8L/mfxwtDa4cNxUF2VQd3nsFoMc/w2umpaWEVOs0/+hrrvFe6ONLPbyPVPK5+/UZWbg1yia04PW0n3bsrjVvcnokr7xzPX758uZJhofCSPWK63+Uj2CfZyn4pMlinT5cLILQ5O0+xL7GNmZHm+k/mVqPSjODXC9G3nokf4GgN01NwanWFwzEngBbmBfp2igJorCl453eDrhF66ZwA2ytczlqFBPWa/ieH7ktKFXAxc3EnsR65VV36khO+hxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULsKlEeom2zoqnQFS50Ud+WIlLydjf6b9c7tWZW3PIc=;
 b=FugzPbiv0a1A9hCiO+k5u67muY4klHZXxmMgykQEm0J1TvzAoyHMdyyQWWgPMcQ6HUEhvfflx96oCSm+Cyv4kmGR4wnZypPGjg7PLA9emn3pDIAXyw0f0UeJEbu0RsFU3CfNPW9AV8Ubaykrnx9KR9gkkcBRt5RmCKFEmUG2LNmNwl+DqQNO8fdp29YRaN5reks1OAi4hzd79Ps+1yPEQ5i0IXbtdB4si1mLKGHzI7ebWbinRdNXkQXZKTL7o1xyLH4nu4E3hEOAFHUc7kntxmChudalbiW8v4qHrTXQmQXPVqrdZox5uG45QwJwoGAw240lZlj3scn/ieWoHW1DQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULsKlEeom2zoqnQFS50Ud+WIlLydjf6b9c7tWZW3PIc=;
 b=IhIMUx50mDDDFQ4On026S5QeHypvyDyEuF5PWMnBAbxyFTcArndBAVdYMyBAsV1uRaY6yw3oQ6Dgzf3tDo0zDq61s4/1fKCWdveMY1/H+ftwcOgbWvNsXaCUR1E7jPEFfiW8FNVj/PqQbKBEFcgwa7oJnPs4wuOT9BI9QcpcOzY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AMBPR02MB11561.eurprd02.prod.outlook.com
 (2603:10a6:20b:736::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:58:14 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:13 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:23 +0200
Subject: [PATCH v2 09/17] ARM: dts: samsung: exynos4210: align all
 multiline properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-9-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=n2loyEtlougIax9N1aK22HGezDO/8+WgRFbf8FAh5uE=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOI4pNQAgqFM7VbS7QlxBjljEnPgtqskXT+Ib
 hhAWL9pDHKJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiOAAKCRCwB25JC3Fh
 azZtCAC8Rf6jBUZ+bqNJZ2WvBMjh6CyqIU+tONkCrGkSru1IN206jhSX43sQMth7kxi0wVFVLry
 H42bjy5cFaiH8mbl75jNBFbg/o3FXEr4WmpUvWZ9dprFmmvD2+bTN+ctU4t76r8aDg72S3s9510
 JxDOc9iwXJwqYOOgOcxFc7WyYGmaiamq+I6ZHeGNbUEQpSpkp9tGfBPZUMksAryeAF23K900QyM
 WTRxM1Rxvh04/ZqXapR1icW49I/mAOBfcpWauhw3lxUAF+p5/j1moXcZa9X15Mwm4TFFKBi7NnQ
 Y48MLdCQZ+VL2keneD5/GPGwQlbMdG3iXDjz7bDPHiFVLtMQ
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: BE1P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::17) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AMBPR02MB11561:EE_
X-MS-Office365-Filtering-Correlation-Id: d91361ae-ef58-4cbb-8d95-08df23a1197a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	vxc+YYLUbEdzFtcsQs91C0TlypRN16AwxLFTiktac7rp2ZxmrbTUeTRpUbwqnx2r/h/TupVmgzA3Jmpf0mJiFqqLaiUcuYGJQhBiSlCjMIBcKsbzxixnupWygipnt8O7VGiKjyQmb2liJLucF4TdTqnTRihZ9N1RVFC+cg84hfgHMzHuY+zE4f3P2jt6DqUppd34q/4oEoUmf5aPKM3QpGIi0MrhHYbHxuKSZGuc4iB9kYYeMuwQ9YjWuGo/MqFlPKazWwyegm8Mf2TvudLSVrMmhAN2V9undjU5iHpHKWqj4/EQjjAZuIl65z1OeXZkhpatwsJK0CV9ObnmvuYzFyMy9crxaFjSX4IrUW5TiK+9FEdEDwttr9PEq0Xzo8bVvMnHrLQNsG3vuXldWXtESHXE9+3r8+HsgqFN2b7i2p1vLxxNf3ZN16npaAx+eq0OAIKx9UpODCL1KGRGwezuYfrs0MooCdy2I9d2RJp6AjjQ4o1smMbqM0GzPZAi5W7Y8F/chZtHCpIfvxkUU93UIIl9rUT3XkTg8k4R1Hr4owGQqE2mB1beueiMOtWzaL5aVze8pP7i1g9tYAVNqWIrtw5DU40fsuleejferZIJHXZQWTlSGXSRvzKD/jsX7natZAVqqTKZIjd2BwErMW8L6x6DYo6IpcIMKPWoIR48xYg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTh5TXh2V095NXhJOTlMOWxMQllFK1o2ZDdLRXdkb3pGL3NlQURCQzhaNmdm?=
 =?utf-8?B?WHIzdXl4elE3VVBUZ2ZJT0NBQ3E2T002Ly91OGs5djJhUlJBUXNESGhqR2Zj?=
 =?utf-8?B?ZVFHbko5RHdoREdEbGdMTEN0NUJHaW9FQSttclFZbmFsZ1VVeEhoRTRaaDNH?=
 =?utf-8?B?NUFwM2hkYWV2UTRuaWsrYUZSZjcyUDJPWml0bEFRZzVRejFqVXNKb2JPRisx?=
 =?utf-8?B?N3hGUWFHT3I3cEI1ZUJJcFhxTUJVblRranVodVdJSDgzeG51ay9iSWpoZDBP?=
 =?utf-8?B?M0RpM1Q4YmJoZDFQbWM3bGZHVDRpaXY5c3BxczR0d29LYjg5MDg1MUU1RFV5?=
 =?utf-8?B?NkhrN0p5U2I0NTEvOHFEM0FGcWMxK0lYdURVck5vbldpektJNGlld0NvQXFz?=
 =?utf-8?B?RlJYV2VVTjFiTUJSWm5xa2k5RHJSa0M5RC9WTGxzVXFwdkZtQXhUYTJ3MEVR?=
 =?utf-8?B?VVR2VDBrUzUrcGRVZ0Q4dkxxNFVPelBlbEdXZWkvZGhERDlNNkJ2SXJaTG1X?=
 =?utf-8?B?WFdUN1lkd09pSDVzT2w3NjNYUGxhclVyMHNSam9PSGJiVU02NG9NUTlJMk1C?=
 =?utf-8?B?ejBtYVlVWkVPT0tVa1lUK0t6YllYQ05UVDFZeHM0cno0ZVJXQVVaSVpWMkxR?=
 =?utf-8?B?TXo1VG1xOHhIWGQzVXQyVG53amFGTHVmbElYakVWaFNQTERTcXNpdHYxR3Fy?=
 =?utf-8?B?QnBUenlRZEl3ZmdxbEs3THVrdnBBT0VWNWRhTVk5dDRvYStBemJHOEp4a2tn?=
 =?utf-8?B?ZFNmVGV6ZUtOejEzZHZsN09vUk5HdTRrMkJWbnAxdWQvVWdnNWkrNWhSZzRH?=
 =?utf-8?B?WWhmRUNRTEFCeFdJU09TT1NHWDZmRDU3SkhtMWg3WjdSd2JicFB4dVBuV3Aw?=
 =?utf-8?B?V2x2bldSV2xqQWwyckpVQkNtYVJOQ2M5UEV3SWpIREpPZUE3eWdMaE5NTWcx?=
 =?utf-8?B?N0YvUGpoUzZhc3hiNnVRc1NSRTl3dmdGNjlRMXI4MGU5cU90NU1maGwyMnVD?=
 =?utf-8?B?OFNmQmZ3L0cvWWZIMDhDUVZ0aGwzaDNYaFI4c3UwMm9BNFZSR0lqNmdXUWJh?=
 =?utf-8?B?UWYzSWx6VlRVSkh5bzdTb3IwOW4veVIyd2NRbG1EWlR0bjI4RTR0dE9iMGs1?=
 =?utf-8?B?YjdkSjl0M0xFUFdQdE8vMHV3WHNRVjVPWFE4bFJOTXFwTm52Si9udmNQRnd4?=
 =?utf-8?B?VERuRllpaS9leWVTMUFqV0ROeE5aaHY1dUhUN1dHd05OV0RER3pheHZRTTFi?=
 =?utf-8?B?NWdGYU1abm5DMFdHM3dGem51TkI1RHg1QmV3RzFLZ0JSQVRYZ3J5M1F1QWVK?=
 =?utf-8?B?TnFVRGZLa0Vzam5nbE1jT1o0S2xsVytVVlRkdTQrbWwyYkRPZDU2anc3NUoz?=
 =?utf-8?B?a0RxL1Nvckw0UVhXZGVMQVdDaGE2Sm5rTllMandEdjRRdmQ4S2o2aU8zaUdz?=
 =?utf-8?B?RWxxYzI2US9TdXBYOVBEQnRrNitYdFN6eTl1WVRlSCsxckJuMlk4SXE2TDFl?=
 =?utf-8?B?VDYzUkp0VnFSbVN4WjlXZ0ZRbkwyL3dPdERHVTNya3JZOTZRSWhTdXFGVUZC?=
 =?utf-8?B?MUxRWm9UNTY2MjdndHkvTlZRM0FhcHFzeGZNSTRlc1ZsaWMzd2l1dTFFbWlE?=
 =?utf-8?B?ODlaWEswNTBJMzdON20xZWxLZkoyV0I5UW10d1JubVJ6clAyWU01cjRYWFF2?=
 =?utf-8?B?Tm9JbjJZdHJRZVRWZW1UbGxkQmFmQVRVWWtSTm8wRVBLYnZGSVc4TmtaQ005?=
 =?utf-8?B?TW1jSFNnUnEvSDdHRXRYV280Ti92Yit4M1EveHB3WEV0ZWg0QjE3bW9NbWdW?=
 =?utf-8?B?RmFUVmtqVXpDa2tEVmRaL04xYkdRR0l0cU8wUkpoanlnME0ybFZqOG5ubDBF?=
 =?utf-8?B?UEJndHo0RFhIWXJrRS9ud0pMRmhvdUVkZ3ZQSmovZHliZXhSRWxpUEtXZnFt?=
 =?utf-8?B?aEI3NC8wOWtzYnBvUjFoVlBTLzE4U1ZqVHhVQkwvalUzaTJOcVNVN3lMWk9o?=
 =?utf-8?B?RjF6alhMOGYzMGVyTUlTZ1RCS0JWelB3NUZ4VjVTZWVTdCtoQk5RU1VPUnd1?=
 =?utf-8?B?ejIrYXVuWDNDMWxId1hHL21nOEJjSFJmUjJKaHhscHZLcklhVDA2bUdLd0FL?=
 =?utf-8?B?V3dRSWVHL1o2YlFLREttTUJUTE1OL0ZsZlZjdXVEdzVnWnlLdlVGWmdZRUNo?=
 =?utf-8?B?RmRqOVZ3NDBRQk9uaCtWZVJxNXNPdVdSd1BWc3lHM0dmVG1zUis2WFVZT2NF?=
 =?utf-8?B?VGNaRDRLaE9MSVh3V29QZ2JPMDJ2R3dRb2pDTlFQdndsb1NlVFU4VXA0QXFz?=
 =?utf-8?B?OWxHUTlaSDFPSzhrellXVWJlU1RBZTM5NDFKeTF0S0d5YlVrWFdKdz09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d91361ae-ef58-4cbb-8d95-08df23a1197a
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:13.5971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzrYsSxU3BQSeZTLluNua0f6N1uEAXN7a+F62SXLY/y5PZGHvhKcxTqw/TvoI5tnVETMwFZ7eCFVqpb7JifQDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB11561

Properties that span multiple lines should be aligned with " or
<. Update the nodes where applicable.

Fixes warnings from dt-check-style when running in strict mode, like:

  samsung/exynos4210.dtsi:543: [continuation-alignment] continuation should align to column 18 (to < or ")
  samsung/exynos4210.dtsi:545: [continuation-alignment] continuation should align to column 23 (to < or ")

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dts/samsung/exynos4210.dtsi
index 79b68198cbeb..b8fc941b5c2d 100644
--- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi
@@ -564,10 +564,10 @@ &pmu {
 
 &pmu_system_controller {
 	clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
-		<&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
-		<&clock CLK_OUT_CPU>, <&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
+		 <&clock CLK_OUT_LEFTBUS>, <&clock CLK_OUT_RIGHTBUS>,
+		 <&clock CLK_OUT_CPU>, <&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
 	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
-			"clkout4", "clkout8", "clkout9";
+		      "clkout4", "clkout8", "clkout9";
 	#clock-cells = <1>;
 };
 

-- 
2.43.0

