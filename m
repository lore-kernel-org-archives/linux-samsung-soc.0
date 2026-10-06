Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B782E2F84F;
	Tue,  6 Oct 2026 11:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287888; cv=fail; b=IQ7hSve0f8JiXVnrEgW6t0Oum0xbbLjDlHkYZzfGNtApT9wctIQDraCLSH0QbxyvLaAHxL+zOI+wTpG1Mn9i9pPCVpV0EG2ugV/6t1V8+Fs9RTOGLVLfEHhspph7NWX4RiiRddgF0TtMliizpue8MuV2SxEJ1j6ORafm8cpMFO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287888; c=relaxed/simple;
	bh=0YrExGg7KTYZc8m7d4iSYEqCfeeMIxp2x5aTS5wGMIk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=TFz5e3cte25MGr6KfCN8af+WVRYQqM46Yw1kwcIBbpjiL1qtnr11lvTLRVFiJ94x67jSxHsbWPgov3EGhE97uabldV6dZk9X8PV+6FXGVqK72+I2CAdEhYl/4dXyV5UjP4N1S2TldFOPX0TZFqOtOhzpndYwA0ujqfAzzBI//Do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=l5cYat6Q; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="l5cYat6Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMCfOFYaSAC01LzPxgj26aHA55EI2NIiNSj6xFP8sZJReOrfuHX5Ucsl+IkAhE2JmhTd2zc7IcxzeTxcfTPw2qehqpIjADkcndUe2NG6Z+zvIIeomQm6OuHbev0iNS0hgyh3ZyUVOcqh/tijijolzlgNAWqWbwMM4HwGpG105ZJmeo4ApQdjfC140d9vtkQLKXP/rcDIBQfIyxKWuuDfarvgUMqZTeJq7eDVsMmg6x8tcYcJbCL4JnoVRJmo/EjPHy1dM5cRon1tqnS8BHHKV/PeT4OLVUUrdOVmER/mwbgSIoFw531hJm9w88zmMfM5RQclUbqwyX+HhNnq5CLPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dvn19b4boyBGUcsPnzo5ABp8m59u84VQ51c6rR2SwGY=;
 b=FVmkLaGkgoyFDlq0+HcrXTeZnbBwIfaYtbr4CNRSigLKAq2LqhAiLpVAZ+x3hp2tfGDR3p7FgdFLE+mwfeWR+w6S9XAuHfM7VYbBKLL3YDA3BhbmalS2m0oy8Q4pfoLvfwO0LqiMImC6sw6RvzFjMga4PjkuaNT9PHPRVlRGAosOY5VFN67hCmhIg+/ZA1+GDCA85tOP8Wo9TSBW6vW98gdd6a2uTSBW2ic2MK0b6eFBbs1VqNvhXlT7RLaVskFTZTAlByfHzsGLLYD8FlvFTrmE8baXQfr6B0te0I9NegdYjh1siGePshX98mLilfgNxNr8IFjeQlNH5FnZDulAKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dvn19b4boyBGUcsPnzo5ABp8m59u84VQ51c6rR2SwGY=;
 b=l5cYat6Qo3H4NDVnAshyWVv/Q3TTfw3h5RpdgcrsqGipgkDOlIe59wriP8NBPwMsQCq9hghWCDhvSIPdaLdX0woEWd2avHSoh9CEuoMRHIBKLT/kRkXW4Te5uz60ynW/XsWFhFCoJZJHaazjVnmGll3sXBPAqPi7NcPNZ7tRz00=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AS4PR02MB8235.eurprd02.prod.outlook.com
 (2603:10a6:20b:4f2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 6 Oct
 2026 11:58:02 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:02 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Subject: [PATCH v2 00/17] ARM: dts: samsung: cleanup Exynos 4210 dts'es
Date: Tue, 06 Oct 2026 13:57:14 +0200
Message-Id: <20261006-exynos-arm-cleanup-v2-0-e8e86a3c8c1f@axis.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABrixGoC/22NwQrCMBBEf6Xs2ZU03UT05H9IDzGudsEmJdHSU
 vrvxoI3mdMbmDcLZE7CGU7VAolHyRJDAb2rwHcuPBjlVhi00rZWSiNPc4gZXerRP9mF94BHIkf
 k+dBcLZThkPgu0ya9tIU7ya+Y5u1jrL/tT0f/dGONCskwNabEG3t2k+S9jz2067p+ADNgsEazA
 AAA
X-Change-ID: 20261002-exynos-arm-cleanup-944a44ce73b6
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
 bh=0YrExGg7KTYZc8m7d4iSYEqCfeeMIxp2x5aTS5wGMIk=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOImwbyZN15YyfkLpIeRoeIzibkVHNisylQc1
 rpfiCW04/aJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiJgAKCRCwB25JC3Fh
 a2VJCACgphzBC9+rl4dpXDyGGoM3Lp6G9Rtm8pD/29cyku+UKN4rfIPgJG3VnCw/e5ZUKeLhsZ1
 MM1OUj6Ubi7A6toAd5qdV+gutxt4fXtF3xmx16cIYHqIi0OTf7THtBGb7pQlCeqhh1iOCJtfYCv
 zWxrxhaZZrTeyONuMwUNdfnC1Rv1gsgXoI2ILVSfmwMX4ODjhNZZZZ6+jbpR/jXg/zJcmQwTQ4v
 rtetCM9flHp/l2W0EMzly6rc/l2qjNLFMSp8xF4Xh4TXltL8EeiTar4NugakSjNqdu8UboX5eyZ
 YPuLatGz7URWA3WNwS1VHJ+HVafg76x7C2mcB8gT96QXWcV4
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: BE1P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::8) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AS4PR02MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3a776b-2e28-49cc-7817-08df23a112c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|260925021311599003|11063799006|56012099006|260925021911599003|260925022911599003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mmod6BLLA7luHdLxJLy1bsTJUKQWt8ptlKeZcQJihBt4SYuNHU4yNIBVanRpnZk7MwJC544M5N0L7P9LqGtWdpbVfsX7mPE9uLbsUne564iLuYBHbiEN34low/nsV6/vjyoe6pGrC7+ygkAWVhQ6IqCdKvogqfl1dQO1KEuUNUj/8fIaXFNn6OL1i9GqxrDdx7iqqkWvL7Ru63CExNYk30IJLc8izQ0p9+efqzSoBTkZ5dAl9V3QCEsVAInLoFO/4HdoWrGN7qGPfjbh0X7SiXXOeqep11F0M2AM/mK0lbrW8U5MiG+yMhKWbpKAOnGWsweTU/YYSpns/vRxgS16mq7IIPSdThYEqh6Hb00Jjb212SWpF5lGFE7SeqI8jAEMwnPrk7azkW0miT3HOVQdArji/ntHbtSO3yZeihtIdT3t/At7W0jhfwQcjNaxRAHl1PRBl+OAoL4WoO7AfpSukCATds/QXPNE14TIrUutUOgrfVTbNHFjsaPpEhoClkTj1Lw7YihxdJoa7fheoG8Le7A/pj635HcDiWSYBwUbt4OFnJzYbrRcApTNQn8I20qRZAV/yIOHSbXh7NVRjLuPaUkv3LVA17F+rzRcsnweLgza3k1D/exCKCEhS0mN2Ibl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(260925021311599003)(11063799006)(56012099006)(260925021911599003)(260925022911599003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2IxVlFuN3hlMlJmeWM5WFVWcGYzdTVkajFKU2Y0UklUUE81MjREQ1BYbWc3?=
 =?utf-8?B?NWl4OUVtOVBMcE5UcjFBVVdlTk0rQUQ5aVJqVzA4OHhhSDVhUFN6VlJQMmpM?=
 =?utf-8?B?R0Y5b0lxSzVwaEZydW50dGpVRnV2Mll1azlqemdIRTRLQmwwRk1zNHdaNGdv?=
 =?utf-8?B?WTA3TGt4dzZ3OTdsT2Y5THBNSGFRMkd0VEF3MlpJVDc1WXNCblZIR1FRMnZs?=
 =?utf-8?B?Y3E0YXQ0UXIyMVZwbmRjSm5FL3V5OXVOdG1mSFRJd0lvdEt3c0ludGIyc2hX?=
 =?utf-8?B?VE9MVHdvK1lEZW02M2ZpTDdWVVJSbUFSejl0dURyMUx3TGtRKy83blpoUjZ1?=
 =?utf-8?B?d25BcWdjdy9oN1psLzhXUVRIMXU3eFdlcVYyc0lQdXRaemxjeEcvcWU4cVlm?=
 =?utf-8?B?YlpkVkZtYzJZUVkzS0ZwT2RjbmJSRkZjNmVxTmg1dDY0WXo1OVFDT09CcnR2?=
 =?utf-8?B?ZnB6Ykcya2Y3YTcvZEx2RitCQ2JKaEdwdTRzTXc2cEE0RUtXTDhrbmhVdFlk?=
 =?utf-8?B?c2tjdC9MZmZMd2RnRTh1OCtMTVZGa2QyOVNldXFuckdHVlJqbG1ObzJRZ1hy?=
 =?utf-8?B?UkpLcXBkQUNtWXVQSEN5aXc0cVNrNUU1ZlNsU2Jkc2NDd2xSYmY5UTZZT2VC?=
 =?utf-8?B?cWxiVGx4SkovQ1lOY0x2UzA0UlA4TU1FOFpLOVNOZXBMOGd3TVpYb2NDS21h?=
 =?utf-8?B?VzVlN1AyMVpud1gwSDBuRndvdHJwSE1wZzc1aWFyeW0xL2hjS1c5TWwrNldU?=
 =?utf-8?B?SUdPZFExZWswUkwxSVRvbEJUT3l0TGVkVjROd3NqbUd6a0hEZTRwbmNHa0Iz?=
 =?utf-8?B?dVlJanJKK3g0cEZUTGg1Wjhhb2RoOFV3c1VScTdJd0NDUGRRNkVoaFhxZkdQ?=
 =?utf-8?B?YWFvQVUzWFZVL2MrYVVOS0grYjFRRWFOUDdEYzNsOVhtTTBqSndJNllZOWs5?=
 =?utf-8?B?M2dmYTQ4S1pma0FWeGg2d0hzNlpMK3N3UWQ4RTQ5SzdSdlFNU1ZhU01KRGdL?=
 =?utf-8?B?cU1MYlBiWlkwd3huNUIwZWhDNjFqazZ3UU9RMjJTdkU2VWYyWVpqZ2VBaGJq?=
 =?utf-8?B?bFpCZmtvTVpJVHY5Tit5clJvM3FpYmwvRFpoOTZTSGp0NlIvd3pKa1hNSGlt?=
 =?utf-8?B?d2dUVG9sa2RUK20rRlFscE9CdlpuTFpBVVFpVTJBMFdERU5wVTVGVUFScVFF?=
 =?utf-8?B?c2szMkpiZUVZTGNYbmg5ZlJwSFRRVGxsbVlaajJiRnNOY2d5dFo4QVU2a1Mz?=
 =?utf-8?B?M1JqeDNMbWhEUWYyRTQxMVM3RkpDd3BaVWRWUTdhaGc0SVdrNm8rYjM3SDRo?=
 =?utf-8?B?YzdBWGtqeVBiMHhxTmhpdW9XbEsyQXBXSHZscXFkL1JoU0hLSkV5TEZpQXlu?=
 =?utf-8?B?SUhRckh5Ymc2dTVjeFlIU2J0TkhhdXZzbUlIM01scUZkYzBjdDlmeE41SlY2?=
 =?utf-8?B?TTlsd25RVElOTzAydHhpaDAxVmgzdC9tSnNFOHVRQUplMnQxenNaZFE3WHFO?=
 =?utf-8?B?WVNIcVJScUhwRGJtdDF2amZHZ1Axd0FBZHUwUlMzakNUd0x3S1hVblBPVzBv?=
 =?utf-8?B?VVg4YWtnNXpjSEF4UU5STDJpQUlhZXZJdm5kSzlYTDlEWC9CbVNMbUs3UHZo?=
 =?utf-8?B?NGZhMlRCRXN2RkdqZjhEV2NCdkw5UC9wMHBaSERYeWNQNHpSVGhkbzZMWXpW?=
 =?utf-8?B?bGYwdkJHN2J5TlRUT01panVaRDRGbVdBTUFMZWg4WXhVdFQ1UjlFTmx5T2Jl?=
 =?utf-8?B?Qkk2ak5INFJJcXlRelZZWFMrQ0w1Z25oNktJMUR6WDFuWmk5S0xtaTBqcmxH?=
 =?utf-8?B?WXZzT0FUOVJjb1JuR3llWERERFI5SzNQcDNid1Rsb1NQUDE1S2NRNUtnRkRq?=
 =?utf-8?B?Q0VHSFhudDhSTXJFNGh0ZzkyVSs4UVAweEJpZUdhbTl6QXVodW80TG9maVlE?=
 =?utf-8?B?bjlsKzlZakMzR0RyNllBUnRSOG93K1ZhMDY3MDErc0NiS2NwMktNREJNcEp1?=
 =?utf-8?B?K2dCcDB2aXFxT1JDbHg0VzhOMk9NR1dQbzRvRUJTd2ZPTmxYK09OaWJRTmhV?=
 =?utf-8?B?VDdUVEpjbllqK2ZPNTV0ekhNem9RZHc2YlZKbkJMOFVRMWtVN1UvRkFJSDZO?=
 =?utf-8?B?cVV3cDU0Vnp5RyttOXRYWTVINXhwQUwwTVNhOWNXc3p4WHorRlRJTUVmRE1o?=
 =?utf-8?B?Y2UrNFlQVzlnbEpVMCtvcExLN2loYng1aVR3R2QwVVZydlltUXU3RFJwby81?=
 =?utf-8?B?WFZyMkJab2ZYQ0NtTWlPUk92SFp3b1VyMjlRQnJKbGdUaWhRK0w0Z2M0MDNz?=
 =?utf-8?B?Y3piNGFCUXhzaEhyZUZEbkRiQlJQYVlHeVE0RXh0bXJYdjI1WVBzQT09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3a776b-2e28-49cc-7817-08df23a112c6
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:02.3657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgw6Npw4RQEnGWOhdqPUbwey6xh8MowyQ/qW6ntksmjdrcm1kxSgmv182YfLpdTPLjvzivThU8/73G/l0kWjSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8235

Fix most of the warnings that are reported by
scripts/dtc/dt-check-style in strict mode with Krzysztof's recent
fixes [1]). Waqar Hameed's dtfmt tool (described in [2]) has been used
for some of the empty lines/whitespace fixes, to decrease the risk for
human error in the process.

I have started with just once SOC to keep it small and make it easier
to review. Sorting of all the nodes, and dealing with all properties
using "discouraged style", are left for the future.

Series has been tested on exynos4210-i9100, no new errors during boot
as far as I can tell.

[1] https://github.com/krzk/linux/tree/b4/dts-style-checker-blank-lines
[2] https://lore.kernel.org/linux-arm-kernel/cover.1790629313.git.waqar.hameed@axis.com/

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
Changes in v2:
- Patch 8: Add opp-shared to the exynos4210 cpu opp-table, since both
  cores use the same clock and table. Pointed out by Sashiko.
- Link to v1: https://patch.msgid.link/20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Henrik Grimler (17):
      ARM: dts: samsung: exynos4: add or remove empty lines
      ARM: dts: samsung: exynos4: order *-names properties
      ARM: dts: samsung: exynos4: sort all properties
      ARM: dts: samsung: exynos4-cpu-thermal: fix indentation and sort
      ARM: dts: samsung: exynos4210: sort nodes by address
      ARM: dts: samsung: exynos4210: add or remove empty lines
      ARM: dts: samsung: exynos4210: sort all properties
      ARM: dts: samsung: exynos4210: use operating-points-v2
      ARM: dts: samsung: exynos4210: align all multiline properties
      ARM: dts: samsung: exynos4210-pinctrl: align all continued lines
      ARM: dts: samsung: exynos4210-i9100: sort properties
      ARM: dts: samsung: exynos4210-trats: sort properties
      ARM: dts: samsung: exynos4210-origen: sort properties
      ARM: dts: samsung: exynos4210-universal_c210: sort properties
      ARM: dts: samsung: exynos4210-smdkv310: sort properties
      ARM: dts: samsung: exynos4210-smdkv310: sort child nodes
      ARM: dts: samsung: exynos4210-universal_c210: fix alignments

 arch/arm/boot/dts/samsung/exynos4-cpu-thermal.dtsi |  72 ++++----
 arch/arm/boot/dts/samsung/exynos4.dtsi             | 187 ++++++++++++++-------
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts     | 125 +++++++-------
 arch/arm/boot/dts/samsung/exynos4210-origen.dts    |  30 ++--
 arch/arm/boot/dts/samsung/exynos4210-pinctrl.dtsi  |  42 ++---
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts  |  61 ++++---
 arch/arm/boot/dts/samsung/exynos4210-trats.dts     |  60 ++++---
 .../boot/dts/samsung/exynos4210-universal_c210.dts | 114 ++++++++-----
 arch/arm/boot/dts/samsung/exynos4210.dtsi          | 183 ++++++++++++--------
 9 files changed, 523 insertions(+), 351 deletions(-)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261002-exynos-arm-cleanup-944a44ce73b6

Best regards,
--  
Henrik Grimler <henrik.grimler@axis.com>

