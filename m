Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99A13E9C2B;
	Tue,  6 Oct 2026 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287912; cv=fail; b=X5so2LL3U2tLj/OxlkbqGFnSRwVeHHphDQ+i4rEtvlUJ++ZsN2Uy20cmMYx1NaZm0v1qkXzGYLenCkTL3aLVehnmHyVCv52SjI3eMxVO9bWw8WFTFBbZMQfkooFFkBpWsUtsYmaFRGm1Zb5GgIV7IvkZ7eDcqmTqUznWL8gDSdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287912; c=relaxed/simple;
	bh=4IdSpS7Bay+F23bRFzzeEAMCWRPQs9A8sF9ibsF2xr4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pae6EQiZB+IpB5scKDLHt9VQLQgQbVpvY+za+uBw8zeODW7wW6NzgUz5HAWlOvh798FJ/Epq/yiaOO9KX5gs/JS25xRNWUfPjC0rRYJTTOjbdE60O/pX/2GxS0PkvHVSW93uD+5m4t+HA+hT439TyWnlDWoLZHWSef94b0mOoF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=ekv83kOc; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="ekv83kOc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uF8cKVGGSMTBxOoUxyJzkjD2/k7kUBqesuKKa6z7ORb9RD06HO3efLD0ekSe8Ca0yZpVCZGm1BhSBaKwgfwKzMYXbLZGUBTmpOUxtezyhrut4UbC1wmVKe0EKUiqSQ+A0IxDI9DHZNW4vPRrmdGRkKmadftY/TkNGoPpSshHzU1/R/k4BIY2pxhbJKDyigqcIeJH2RVqos4v5pkMIBhyVxe0fIvBgLJyCoDlgoHjrZw8bIyQMmcS/zYWn6mlf2BfM914F+VYKYWPzIMtUo50I3+lpOlnLgOt6mceT7Sym5Yvu0QQscU2iaPmXlQ855pqkGrMKncE7R2XzMuc5EEfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2LObgjW5JfQEEABF8bq1diGuO03XDZaijt+SAkcmso=;
 b=HD4RLop8jnnWNjhO/RXgZ6hRf1tQwrmqe3XHScM4/SN0VWflAlZMUOnMk8Go6hpWmmHZVtx1DDlzHgy8/LrCze/HuuZIhskGh6e9y2/JW+nX0Z9zUHP21jIlmfAmzZ3Ki7xPuv1fO4i2SYj7dmrE1yU3CEroiOcgqxIJY2niwf0lLPxJXNQA9dUGkRDZ/SrZWkjXhk8mJoCno9aaG94p320In6DAysTVEVfjqbDqRcJZsoEq4ZCWrWdmji6mvNYR4yMFk0SSLZsrRRhYfJD20ZeS2f8IHFeKj+tPG1o0JNqrxRe5xwWapztfNBcup/vd+CSuOTKUZ6rtqZzYbYG6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2LObgjW5JfQEEABF8bq1diGuO03XDZaijt+SAkcmso=;
 b=ekv83kOcjIpPdE6uX9TOAvPzF0De3KgkVqNwZEXeRwjRXFb2GzS9/+t7T54Ehp0fzsNudAYZRF/TUR9rsdi6emRGFDrfQPef17by6d3E9K9+xReY872UFLzt+iCGaEp3RhqGNh15Jcj1u9IwndxObWnseYBms4bqWMgKi4kV4pU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df) by AS2PR02MB10002.eurprd02.prod.outlook.com
 (2603:10a6:20b:606::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 11:58:12 +0000
Received: from GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6]) by GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 ([fe80::9ac:6f90:5998:69d6%5]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:58:12 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:22 +0200
Subject: [PATCH v2 08/17] ARM: dts: samsung: exynos4210: use
 operating-points-v2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-8-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=4IdSpS7Bay+F23bRFzzeEAMCWRPQs9A8sF9ibsF2xr4=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOI2DBbAw2Cy9Qjl2OkhZkZp6TgLj1A6ATkml
 VY0GqW9FReJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiNgAKCRCwB25JC3Fh
 ay+3B/9r6HcOlGi6oWcBOxikbhP2l5XUDyWuNn82R5Dp40CrxqFsWd+DCcTI9a2y8AZ2Qc/m1w3
 WGDtpg+DC/pb74W+bZJygu4OuVJj/FgeTsFu9awZRL6IS+vtGjCuyCeBozzE8zybZKd7+mVrztA
 tkKENckdC14YW7Yp76rmqbIvBfIX7I37WApNRDxwh0bnSjbC0qrLmX3f3NSCmFG8hTxkReXimJG
 IUFOKD08K2W1VtS0cvSB6+vxgl07q7d1LslqZpRvDd1GGyTpiNt2lkGFfqpLM8wyXBcM/ssQGUi
 fyCNcyFlCwGdsSQdqnJ5ElkckjQK+3AppWbkbaT0eK6d6Hq0
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: BE1P281CA0296.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::19) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AS2PR02MB10002:EE_
X-MS-Office365-Filtering-Correlation-Id: 177d8787-ab36-44f3-2eb8-08df23a118be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|22082099003|18002099003|260925021911599003|260925021311599003|11063799006|260925022911599003|56012099006;
X-Microsoft-Antispam-Message-Info:
	floglNF5bXB65v5Ewh8aZD8VSRcokiXCRxovdywotdCdPq8fU4qpovNjIXHagHZfWpyoueKYAXuH6JnTzTR3lRQPirCnfiO6CF5wypftVNWdwVS2s3HfwuZCE1ps/THY+5lLM4rO4C/IakTPZjN8CHc+oVODZdv+LGP+2LUOn/8svs7ATzbdm6KWqFv2iQQb/IlJdEEU62hEh9UmHf/4VkqKvGmsRUmZxpZ1mkjsdG2PRGknyqJYGfMOKPFllqrwf65ewa9N8IbM0xhHGLYZM4Nc418U8vhSw2VrnDGcReknZWkfjyjHhW3+FA0/X1p+kqPjWjOZeUuGr9Is/PQwe34ZGS0dYgLOqwDHYi6zjUxX69IzMupl2Twqx3mnfJ926Dyv6AuGicNgZUr36FRN0EI4KPh1D/LEum3btD2TZLjMZ4iDYHNtflRIaBJAl0aHT33nx5/+3vPk3RkgnlqgUBXrwsCHRWv06WVdji7X3vQUGehywQQlByp2EeVUg92Tg87N3e24JCmkMbflwiRpTup+vOCmv0TvLaX8ltcbtNaxLjgksXvPEsC3yCkp2rVLmefwQ8sJDrDp/6G9tddCvAFltsYVof48KzCPw+zupZodGqr16/yeywUGYC/YaRQk978z7MdF/c3CdfLTa5tX9CzUk83xAnQ3/4h/nhlXFOE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(260925021911599003)(260925021311599003)(11063799006)(260925022911599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azVzSTNIaG5rY3FlYnAzSHZ3N1ZIcjJDMG5MRmJsSkwrNnJFMVdvQjlqWDZU?=
 =?utf-8?B?cVJ1aWZNU0tsVFB3T2RXSDM3c21DRWxZWkFOMkxoRkxNTGM2QS9uK20xaEJS?=
 =?utf-8?B?NHJFSFE5UVpwcDZvZ3FNN2NKcGJacTFPVU1ockZ6eWlPZHZ3aWxKV3d6bTVy?=
 =?utf-8?B?Zm56VkhzR1hVQWF5dWprSEt2dlo3WmFFT0dVd3I5N3pCVkJQN3NiSFYxSG1H?=
 =?utf-8?B?R2lrY1p6Q2JEY1pKL2V5NHNGT1ZDRjFGbGx2QXlXS3NEa0paQy9jWlRsRENE?=
 =?utf-8?B?THJEcVhyeU0ra2c4WVhla2tmZEg1NnU5OTNJUkk5SzVUK1VEaUJlU0NXbE1p?=
 =?utf-8?B?OVR2aGVwQ0J3RDVuUkxsblZGUmZJRlFQRk9PeEhzZjNMN2Q4Tk90QTk1Slk3?=
 =?utf-8?B?TTloVUp4WE1qb0lFVVl0NXdoSlAreGxyT0hqQXFtMnEwUG5BMTl4SlozbTY1?=
 =?utf-8?B?ZzNQcHRSZnJqQ00rdVdXVkJ2ZHd4KzZYNDZBVnQ2Q2dkZVZyczBuTzV5LzZ3?=
 =?utf-8?B?WG9qQTB2K2hFc08vOEY4blUwdjE4M09zdXU1Y1ZwTzVhN0RFS1AzdjNLWnN2?=
 =?utf-8?B?bU5TSWJQb1ZZWncwSEU2WWxaZ2RLbENMdjFKY1hqRlI3S3puekdkSnRwUTln?=
 =?utf-8?B?bEJjV3pkVVVKM3kxcU84UmE0LzN0U2hsRnBobFhmSVZ2WTJmcDRtNkg3REtP?=
 =?utf-8?B?SnhPVEFtQU1WSzd4U3ZBQm5ManBzQ0VVYVpxenlJalhjekd5bjhLbVRYbDdU?=
 =?utf-8?B?M29LeEhZSlJKUGdmQjRFWjNwVmoxbXhnbmRlTC84bFhhbXJMMWtwUVdVeUtP?=
 =?utf-8?B?azAybS83b2V0RkR6dUNkMGhWYW1SS3A3bTlvOHZkZ0ZGTS9NQ05yVTROT0J1?=
 =?utf-8?B?aEpyTmdZRGRCd0prS05YbWxVaWdycjY0T0tqWFFYcEtEZ0UvWjZodGtDRkQ1?=
 =?utf-8?B?R2V3WUd1NzllQ3AvNS9GbjZzTHlRVU5FNUdYTDlGS24weGU0TlpQNkZ6cVl0?=
 =?utf-8?B?MEpmZ3luNGJnMWdNK3Jxd1RSQ3BmVElFVEl1a2tqcU1IdFlrM3RFMzNJakpJ?=
 =?utf-8?B?T20yWlBobklPSW01YUpXSVZGUmpWekxtcTlTTzlhTEUyT1FmTGF5TndSWE1q?=
 =?utf-8?B?WWdaNTJDc3F1VHVGU051UzZmeEZWYTUrRXZDRzBVd01uMmRaOVJYN2RYZzdI?=
 =?utf-8?B?R29wUnF6U1VaVXZNKzdmOTE3djBPZExsOWxYNUZwSGR5MEptWFo2M0tSb3Fm?=
 =?utf-8?B?RmhFODc0S0VyOEZ2a01VMHIwelRoNXNGcUF6REpxenVBdVJ5VkxzMUlMUWx1?=
 =?utf-8?B?NHpPanNFaTBxV013ZThPNVRtRDJUYzl1aXJFOU1ZV05EaHU3Q2grQ0ozUWd2?=
 =?utf-8?B?aDg2K3l1QmZhNzdBc3NUSm5PdHVUcGY1SWFBRjB3TW1PZWtCK0YxV2pHOTNm?=
 =?utf-8?B?eDZVUTFyMWRhY3Z3SFhlM1AweURIMnNFWUZnckJBUGlNa25nTVlJcFpuSUU3?=
 =?utf-8?B?ME1VYm1IOXlKVGpTMDgycDZnV1BGczRzTzFQTDN2bU12YUFZMnNVK0I3UXVu?=
 =?utf-8?B?T2tOT05pMldkT203djh1eWJTZ2RML2VWQXA1TlJ5L0MxbzdBTXMveVpWZitp?=
 =?utf-8?B?T2lSYmdzcVFjaFo5MDZwUmdJNWZqaVpWeG81STZhUEdaeHg1MEkzZVVRN1ds?=
 =?utf-8?B?bVBYRDc2d3pQU3ZmVWNSRTZMMGpjVVJUM0x6MlRDNWtFQmFXS1ZHRTRWNHpJ?=
 =?utf-8?B?TWtYL2RFU2hJQVB3TTRSVjN0cTBCQjU0TUQ1YjROT2diYVM2Q29NZ2U5LzBX?=
 =?utf-8?B?TU44OTh1RTk5QnlQbG1IbHQ4aVdjRmQzUXZjMnlMTWN0V1p6RWcxOWlweHhw?=
 =?utf-8?B?T2F1QVJOZlNyNTQ5anRoL3RlNmhyOCtHeEJZUUdhQ1pWWkJuSUgvOVRTQTQ0?=
 =?utf-8?B?aUJzT0o3VjVpY1NOdmdic3hHSUJCMEUzWEJvNmJmODRpc0VUTFNzallIa2V5?=
 =?utf-8?B?Zm5RdzM0L0xVcEF2N2ZhRXFOVGpOc21VUnBqQk5jc2tvak4rcllZR3NsS0pO?=
 =?utf-8?B?MVhRYnoyNkxITG9IUzllOFR0NmUwdi91WTE0YWE3c3pBQkNCK3FOWCtOY1FW?=
 =?utf-8?B?VGgvaThnbkxLUkxjd29CbUJlano1RzJlRWl0bGVRTFVaREhzQ2tZSGV4dlI5?=
 =?utf-8?B?UEVlUHVvaks0V1FtN1hNMTFBSzZYblAzQUNEYXpvaDkza1pGSUJTdWtiY2x5?=
 =?utf-8?B?VFBHNjVZRG1qbmp6SVBjUDVQVElPUm9tZU54cmxTUktickdodEpOMFhEb2J1?=
 =?utf-8?B?a284dUkxbFlJQjA1WGR4QmtFS1pZcFJnS1BLbDFWcXV5bjhEMG1Vdz09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 177d8787-ab36-44f3-2eb8-08df23a118be
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:12.3116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpKSKpheflTogPdke+TmrZRblUEMSJKmZyWr3oelGP+lyM9cvAzlqgt1DUG7xB1pS8JunWU091e+a3rPG5AwEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10002

operating-points (v1) is deprecated, switch to v2 instead. This fixes
continuation-lines warnings from dt-check-style at the same time,
i.e. warnings like:

  samsung/exynos4210.dtsi:218: [continuation-alignment] continuation should align to column 45 (to the value under <)

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210.dtsi | 65 +++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dts/samsung/exynos4210.dtsi
index d37ac0c97dbc..79b68198cbeb 100644
--- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi
@@ -212,16 +212,8 @@ cpu0: cpu@900 {
 			reg = <0x900>;
 			clocks = <&clock CLK_ARM_CLK>;
 			clock-names = "cpu";
-			clock-latency = <160000>;
-
-			operating-points = <
-				1200000 1250000
-				1000000 1150000
-				800000	1075000
-				500000	975000
-				400000	975000
-				200000	950000
-			>;
+
+			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 		};
 
@@ -231,16 +223,8 @@ cpu1: cpu@901 {
 			reg = <0x901>;
 			clocks = <&clock CLK_ARM_CLK>;
 			clock-names = "cpu";
-			clock-latency = <160000>;
-
-			operating-points = <
-				1200000 1250000
-				1000000 1150000
-				800000	1075000
-				500000	975000
-				400000	975000
-				200000	950000
-			>;
+
+			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 		};
 	};
@@ -263,6 +247,47 @@ opp-200000000 {
 		};
 	};
 
+	cpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <950000>;
+			clock-latency-ns = <160000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <975000>;
+			clock-latency-ns = <160000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <975000>;
+			clock-latency-ns = <160000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1075000>;
+			clock-latency-ns = <160000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <1150000>;
+			clock-latency-ns = <160000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1250000>;
+			clock-latency-ns = <160000>;
+		};
+	};
+
 	soc: soc {
 		sysram: sram@2020000 {
 			compatible = "mmio-sram";

-- 
2.43.0

