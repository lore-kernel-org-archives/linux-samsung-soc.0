Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801CA3E9C0D;
	Tue,  6 Oct 2026 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287911; cv=fail; b=ZNWqNQo8fGfQflTphhUpOaKtBQCJVTbzWKmtnrkDf1m0gK4Xi1WvqdXQLLrWf4qsJDjQAgorMfbNGD2EC571HW86YOW0s8sPT6WBNFtyHM90WEnfK5qz1Pq3mQKpQ9ZNwQTSQcefxRBUMfPMCERx685SnKo0Lap09sa/SANOWZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287911; c=relaxed/simple;
	bh=155hOZToryhTQVwsTExUuBBKOpX2mJ6uFedNiltgP8Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Unx9xTSuWFC+RvjsAcNgRsf3tzIYHqg5AILAYlmtmLae1+TfeHtznT9E5o89rEoKdMvyroyYwnNHEOSDiIex08n07NDf77Ur9mZzTUlyYxdEK7c8dAktuBCNcFlgsfrcaHXgy+o/jUCCo9n3DT5VBMe1ElGniynUF0uSKNz7/To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Ct+TJyHV; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Ct+TJyHV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvgLqtUu2mSeEYukvpTF2GTjg/lYMB/yqycfNjRdLsvJYAopu/vjTB2LwUVTj+w3OXG8LhUFVmbnm1U68kDgY1KiONxG0Q3U0FjaGNzPovWKUBapn+0Ym8Ave0JVSz2yrmm2FL5qo0R6CeT7zy3QcY1SZLLj0oGmsyduBFRbkURwIAl8Eoe1+Tp4tnHlhV/XClf9AkjtNV4NL89ruHXi/o2s6ewMC/CnvuF83z1DZimtMaZtgYcwaXOZG0NKmqpz15dsuLcjodA9CNjcYheHhYuKo/3nhWGc1cbPc7ol3sCq9F5RACPayoezuvD9KvcqxdUbCRJSfOH4UPRffqrapw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHP/J59+E8YDwyyYeW2J97OeTqPD4JvCsWYeUWKz014=;
 b=DLxMmxL2ARHVW7xWJuR+62TWSr3kAN5TsafP4+6+NQshSMFKV5FjXRHVZMp0kUATM0skGXmRRAAsRGJ+V7bw6axvwPYYJCW6079OG/NG2geb2hVX32hIhlZCutb+dngRmw96o2vMjPprevG10y25/iJrFcGAafHP+/hAzOI7ZTkDvdb3UK/UEGh2/J7/ZEqFjNBgX2F+Ij2Ez7zN42vkUYa1pbNp2JBPE2s9bXZiHTxKyY6VPefB+pVPEGzD/RLmlaDiwtZrWAED3SKPzoj+ALBbCp5e/VLEjp+5738I1JnRW49Xwp6k9KLl1OgMrU8+DkMYDXyVcDpENYiIpwD8zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHP/J59+E8YDwyyYeW2J97OeTqPD4JvCsWYeUWKz014=;
 b=Ct+TJyHV24o7f0YW17kV4kq7YaO9uyKoef/p5MX27GqLd3sxLeb9hADb6v/P+VBo/S3ChMVXfC9pZhI8Alfmoaz4EpTpNJxf1tpUs6QoRmZdkBbRpSM7TdSBsvhpMLjGbmMeghRrRM2x0gHWtvS1t9SDcB2rhQhMz/v+GS8B7lk=
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
Date: Tue, 06 Oct 2026 13:57:26 +0200
Subject: [PATCH v2 12/17] ARM: dts: samsung: exynos4210-trats: sort
 properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-12-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5847;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=155hOZToryhTQVwsTExUuBBKOpX2mJ6uFedNiltgP8Q=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOI9Du9QUx6P8Zh0cCgedg/TQz/DlD6/b5CFR
 1hdPDCBo5WJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiPQAKCRCwB25JC3Fh
 a4C5CACl9V/Rjpek3J3gkyHTelkjQOTgGdkgCUkDl8nYQ0bLI2EGRxWiq5kIX57lSfqOoqnopd+
 vvNqdp6FFoF5vhgDwJQpjBEaAsfRr9fq+hnJ/ULTjgXgaLot7WYN2eGSFhoz9Hfj9euH3Mv9K2D
 BJgGuAALbHR1KTS1HT015DtfYnxyYZeqsQkhxLkEXPzbX0IWCaa6Lpuq+c9DMYU6O/RW5Kd77dP
 wULUpOoCRrxjLMZa1Tas/a4b5teW4QwXJ6suvvnjMbUrjq85rOkS6dSGjGS7Ex0YMlrP49d1A6n
 0p/M/GGNV3uw0/g6beN0VGz1wfWmjr18c+pWYu2glh92yv/l
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: GV3P280CA0078.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::26) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AMBPR02MB11561:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ac1c66-30c1-4409-ca47-08df23a11b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	0j8m50SulyYJ/iLJroRjjnCAFCyDH8OzJR5+JPV+aZ+GkAglbFLzMPa4XOh27Piz2TcBvhkT1flTLKxk2a2B2SLaQfiUHcav+x3YWttwiDVGqJK39CETRAmtLXli79ZsUzUgQjW5dAL9IM9mFOiF9LR0M5VpvTmDJdDXy/3rU83p/w/yeULgS+Qu6mO3Kr2MpUIFwlHNsXGmqvIdeNVgbWveiG8DXMV/odrhtWkp3pRR84TX8I1K/GPrdIZRhOLyQ4FjYOJLDleTQIaRJERPDVVg9jhOuVSaapOf7adEd3fjrV0LJx//a0/Fh6n0qkkOBQ93N5InPGs87tGsQNUd7p2HORUZHv9pcuA2zHAn3uv0W4svBmZuyRuOXozOdXHn4x4rGrvvRSAU0yPsHXEVw4zfpYzZ6EFI839ZUt163Us4NYycnN2jNVagwb7zoz4UYin1hTJ4tipzPkGkrudU3OV8Km0194LfH0vrQaZaAMSDMX+E0ALUmC2MIE+6HrOBb/WUN9nWQQk0WBOC9gX06bdClStPQVV+HdUjAT5wn437o2u7NLLxhTZUQ4AtxVlYi3cL+n353O1RZTp09pDKAUUgeNzd25iwR+sskLDTNd90nPRgPQwuJhNr0deg7wx53K2j/Bt3SJRh+6gBnyKBdZqGIee+/jasj1uwLyWTU/s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE84K3doZHB1T1Nsc2lIS1FUbzlWZEIxckdPSHE1bHYvanVCc29LMUV2b3Jx?=
 =?utf-8?B?Y2pNVE1oSExSUXVjVzVZczdhdGpmdkpPUC9heDVWZExEbzB4bnlLWXRWaHJB?=
 =?utf-8?B?TUxFYWQ5REhRNkNFRXEwckpUUmtYdnY5RkIrTWpGaU5PNm1MVnF1ajR5eWNO?=
 =?utf-8?B?RGVtem4vSkYzV2dlT2N6YmMwWkp0YmpvUkYxR3RuQnk1clU2cjZORnpzRWJS?=
 =?utf-8?B?VmdzY1ExZ0Q1VUErcUtGeEdscFpoSWFNdGl1eU5ocFZ2L0dFQ0NhaWFneXl0?=
 =?utf-8?B?ekhzakZ4UU1vRTJ0NXAxUEl3NmNUUkMxbm00Skx2eUg1YmdwNnAvR1NOb0RQ?=
 =?utf-8?B?VnhBZmt4TDRBTlpRa0NYZ3dESC84WDdjaUZpSXlsaHZSOTdjV3V1TXdHMVVP?=
 =?utf-8?B?VkFVdXJEM20xL2c1NE1uUk1MOGkvNzVJRk5uU3p5RDIxdFZ2b1YrdEdaZzly?=
 =?utf-8?B?ZHZFNU50R2tuNmJGK1VGTXRSamFXaHlnbXhpWU0wQlZUOS9lSXFZMW5rQ2NM?=
 =?utf-8?B?eFhVNTdYb3VKZ3J5T1g4YXB2ZUJDWVI5cGpSTWcvK2FzcWpiYzZXdDhoUnps?=
 =?utf-8?B?T05ieTlER1lDVDkvVzJOdURxTmd0alV1MTM4U3grZkV1ZEJvcjZodFZBVldh?=
 =?utf-8?B?cSt4MXFWMVNKclVVaU4xYWNLQWhlM0pxY1V0ZlNlMHBFak5TRG1raW5wbXMr?=
 =?utf-8?B?cVFzSWp6OFRWS05rd0FxaytwTzN3WkFoSlZVLzB3Nm1uaTJOVzZObEZIQjh4?=
 =?utf-8?B?cnJLVnp3MDJ6dEhhRm52ak1mQWNPSjgzV2RtS1p3c3FEMWtMcmlwOUhlN3Rm?=
 =?utf-8?B?OENlVXUzWGRJTVovNzcrZExiNExIcFlQYXJxK3diajhCdGNnTE5tYmwva3JP?=
 =?utf-8?B?QUVHcmFySU1VdXNDcnNabFk2SVp0alhmZE5YbkFQb21DUDIrTktqSnQ5V25P?=
 =?utf-8?B?VXVuWVA1RXlHMWR3N3RUZk5lRkR3eGRHYTh6NXRkMnNtMkNGSGxyT0llK0h4?=
 =?utf-8?B?YmF3L3VFSlRXTVcya1Zzc2RtRENJUURUcWR3MllMcTJzYXNDNFpWNzYzd2Er?=
 =?utf-8?B?dDF4ZFNKWDlVUVdYdktWc0RhNnhtREc0Vml6NndtV2FyaitzTk5HMVpTR2Rl?=
 =?utf-8?B?Z3RNRjUvSFlGRG9SK2pYbzU0VUs1Vm9LUCtXR0JaTzYwUytzTG5SWmtPVkls?=
 =?utf-8?B?cFBvZ2JycGNqYTZiQXpETUpEU29Ud1NVcGExYWNjd0lyRDJwa25GR1VtWEVy?=
 =?utf-8?B?OTJvQjB5OGpNTlJBSlRnREwvc3ltY0FyWEVPMGFZVGhtUmhPdnVxRFlGSlZ6?=
 =?utf-8?B?a3dQUTBrUEQrUHRZZFltMStQeFY3SXQrd3NVRjZuWEZaSlpUVndDdUNSQVdJ?=
 =?utf-8?B?RHdmaFVjbWExLzNZbW5ONm1NY01tbWM4WGs5b1pwZTNIUGRHVTF0Rm1EcUxt?=
 =?utf-8?B?dm1HY0FXYytzdER6VlNyKzFBQVpQRUVQRmsvamh2UkdXeHRJNDY4Z0ZMQlNp?=
 =?utf-8?B?TEgyL0pRYWhaMzNmRkg1V1JPbWFHVXVyMmhvc3pneHorM1krcVBzZGFCWjFn?=
 =?utf-8?B?SFlCRVFtc0kzdjZxQ3R3OWYrTHFtYkJkZEM4UFhkb09tV21Jd1Q1MkM3YzdC?=
 =?utf-8?B?OWtISVB0bmlFTnA4djFaTG1NeFdYZ2J3SDNsTkM0OFZZNjc2Z2hQRWxYUU5J?=
 =?utf-8?B?MzZ4ZU1EVkRpdWJPcXhkZzhNNHN5cEUrVWlXSG5DWTJvcTVRN0tRenZralJu?=
 =?utf-8?B?eC9LOW1vL3hqUEtUYjhEMmN6NlpKWWVHZkZUUFZYT0VvNkVlU2NiVGtQUHpG?=
 =?utf-8?B?R3Y3SFhPWkszNFhraWpyOXlBclhqczUydTZadjVwTGFMWSt4bjZTUzMzWGda?=
 =?utf-8?B?VUtvd2pneWdLYUROMEJuVUhyYVFRbFlHeEltTEQ2c3FVT2FqMFRqeUdNbWFr?=
 =?utf-8?B?dDA5QWJ4SnRLU01hRFIvaTZFTTh2NmNzTUx5a240cUV5U2Nod01JU1hwM3Jr?=
 =?utf-8?B?ZjcyaFBHRHgzTWIxelp4dkkzaUtzM29kZlRaa3pxM2ZBMHVma0c2Q2JNcVdP?=
 =?utf-8?B?cXY3NWVaUit1amFob1R1azFkVGdIajZEQk9zVk5xT2pSa21iUU1mWWE2dWx6?=
 =?utf-8?B?OG96Mzd1aSt5Sk9YU2tyZEpjRk85NExlWmh0Y3B4ZUdhWERoREpCWFIvSHlL?=
 =?utf-8?B?Yk1wNkJYdlNWT05YTVc1R2FZcjJyYzlzM25kSklCTWoyZVJXdFFxazVtQjk4?=
 =?utf-8?B?V1ZJbUtGc21LVGtFSnRGL0xzdTExN01vR2ZQVzJXd24wUWVDdWlLT2E5RGd4?=
 =?utf-8?B?YTgra1VScEJoU3J4S3R4NFY5OHpCM2tiaDczcTVyK2pMS1JoMDNSUT09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ac1c66-30c1-4409-ca47-08df23a11b59
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:16.6933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hJU7pwkfTCLI2JD4lqqi6f9fBXlCCaLeQnf8OOypaxvbGQaV4JVAOd4vGqTam+BXAsbK/F05CpW+4WSPutsdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR02MB11561

And add or delete newlines where applicable, and sort properties
according to the preferred style. Fixes warnings from dt-check-style
like:

  samsung/exynos4210-trats.dts:122: [property-order] property 'label' out of canonical order (should sort before 'linux,code')
  samsung/exynos4210-trats.dts:179: [required-blank-lines] "status" must be preceded by a blank line
  samsung/exynos4210-trats.dts:183: [property-order] property 'compatible' out of canonical order (should sort before 'reg')

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210-trats.dts | 60 ++++++++++++++++----------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-trats.dts b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
index 20fe148387fc..8d4ebcf86775 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
@@ -96,31 +96,31 @@ gpio-keys {
 
 		vol-down-key {
 			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
-			linux,code = <114>;
 			label = "volume down";
 			debounce-interval = <10>;
+			linux,code = <114>;
 		};
 
 		vol-up-key {
 			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
-			linux,code = <115>;
 			label = "volume up";
 			debounce-interval = <10>;
+			linux,code = <115>;
 		};
 
 		power-key {
 			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
-			linux,code = <116>;
 			label = "power";
 			debounce-interval = <10>;
 			wakeup-source;
+			linux,code = <116>;
 		};
 
 		ok-key {
 			gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
-			linux,code = <352>;
 			label = "ok";
 			debounce-interval = <10>;
+			linux,code = <352>;
 		};
 	};
 
@@ -163,6 +163,7 @@ map0 {
 			/* Corresponds to 800MHz at freq_table */
 			cooling-device = <&cpu0 2 2>, <&cpu1 2 2>;
 		};
+
 		map1 {
 			/* Corresponds to 200MHz at freq_table */
 			cooling-device = <&cpu0 4 4>, <&cpu1 4 4>;
@@ -176,11 +177,12 @@ &dsi_0 {
 	samsung,burst-clock-frequency = <500000000>;
 	samsung,esc-clock-frequency = <20000000>;
 	samsung,pll-clock-frequency = <24000000>;
+
 	status = "okay";
 
 	panel@0 {
-		reg = <0>;
 		compatible = "samsung,s6e8aa0";
+		reg = <0>;
 		vdd3-supply = <&vcclcd_reg>;
 		vci-supply = <&vlcd_reg>;
 		reset-gpios = <&gpy4 5 GPIO_ACTIVE_HIGH>;
@@ -209,40 +211,45 @@ timing-0 {
 };
 
 &exynos_usbphy {
-	status = "okay";
 	vbus-supply = <&safe1_sreg>;
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
-		assigned-clock-rates = <0>, <160000000>;
+	assigned-clock-rates = <0>, <160000000>;
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
@@ -257,15 +264,18 @@ &hsotg {
 	vusb_d-supply = <&vusb_reg>;
 	vusb_a-supply = <&vusbdac_reg>;
 	dr_mode = "peripheral";
+
 	status = "okay";
 };
 
 &i2c_3 {
+	pinctrl-0 = <&i2c3_bus>;
+	pinctrl-names = "default";
+
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <400000>;
-	pinctrl-0 = <&i2c3_bus>;
-	pinctrl-names = "default";
+
 	status = "okay";
 
 	touchscreen@48 {
@@ -281,11 +291,13 @@ touchscreen@48 {
 };
 
 &i2c_5 {
+	pinctrl-0 = <&i2c5_bus>;
+	pinctrl-names = "default";
+
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
-	pinctrl-0 = <&i2c5_bus>;
-	pinctrl-names = "default";
+
 	status = "okay";
 
 	pmic@66 {
@@ -312,9 +324,9 @@ pmic@66 {
 						 <1000000>, <950000>;
 
 		max8997,pmic-buck2-dvs-voltage = <1100000>, <1000000>,
-						 <950000>,  <900000>,
+						 <950000>, <900000>,
 						 <1100000>, <1000000>,
-						 <950000>,  <900000>;
+						 <950000>, <900000>;
 
 		max8997,pmic-buck5-dvs-voltage = <1200000>, <1200000>,
 						 <1200000>, <1200000>,
@@ -488,9 +500,10 @@ bt_device_wakeup: bt-device-wakeup-pins {
 };
 
 &rtc {
-	status = "okay";
 	clocks = <&clock CLK_RTC>, <&pmic_ap_clk>;
 	clock-names = "rtc", "rtc_src";
+
+	status = "okay";
 };
 
 &sdhci_0 {
@@ -499,6 +512,7 @@ &sdhci_0 {
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus8>;
 	pinctrl-names = "default";
 	vmmc-supply = <&vemmc_reg>;
+
 	status = "okay";
 };
 
@@ -508,12 +522,11 @@ &sdhci_2 {
 	pinctrl-names = "default";
 	vmmc-supply = <&tflash_reg>;
 	cd-gpios = <&gpx3 4 GPIO_ACTIVE_LOW>;
+
 	status = "okay";
 };
 
 &sdhci_3 {
-	status = "okay";
-
 	#address-cells = <1>;
 	#size-cells = <0>;
 
@@ -523,8 +536,10 @@ &sdhci_3 {
 	mmc-pwrseq = <&wlan_pwrseq>;
 	vmmc-supply = <&tflash_reg>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd3_clk>, <&sd3_cmd>, <&sd3_bus4>;
+	pinctrl-names = "default";
+
+	status = "okay";
 
 	brcmf: wifi@1 {
 		compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
@@ -537,12 +552,13 @@ brcmf: wifi@1 {
 };
 
 &serial_0 {
-	status = "okay";
 	pinctrl-0 = <&uart0_data &uart0_fctl>;
 	pinctrl-names = "default";
 
 	uart-has-rtscts;
 
+	status = "okay";
+
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
 

-- 
2.43.0

