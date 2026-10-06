Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FD03E95A4;
	Tue,  6 Oct 2026 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287902; cv=fail; b=RMUtO9espU3dc5xzB/JyeeVQyebWn9PVMtSayrf7EjcnBFXf8DJl03BLGygx+mdF8j+9S/6S0vJuZL4glBAGJzaT8HahhrDZju1dzbKTP3KZK+UR+lo3GCogo6toXSHkRrJQ0tbEUQEfZbM9OvKNlEwQL1MDTNzFmYtskX1xsPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287902; c=relaxed/simple;
	bh=h1qNj87CUpqTR3ZeixO5H2YkjVle34AB3p5Ir1fQVoM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EJOlvZK9oBS/cwxviFBBYj+PRgBrNCshCyle9h1+7BWxfT9mm2x0PFwb70TBYtt8yaUEexpDtaqC/hj0e0dFLeoB1RZBVdzAOVKY3MBLCCl7JL9lY0/74+xdmlzANZO5LW2uqvYK21OOV6iK5ZvztrC6RawPq25S7XwGAsVxORU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=Moy0/DE1; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="Moy0/DE1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yc6LbiPpOTriKbTp5VRLu8xjz28PieLPiamp+ZwbxkRlm0acDHAORMTN1i9mlsKOBagP0jUC5L5C2YYVGfYbXlV51Z0AMLTKfAY8tkS2kW9iS163xrlP1FtvluIBjL6TBRydYI0rO+/8JnmjBJDmmQl4/5UPQwT8eqlrjkThIJpmuxeNTq4RwuielH9yV6wTzCQ5U8I+Xvne95pV5qGr0ulhYE81vsxEp3XvrXbAg0n8HDQQ1vEt7LjIoWeQwCjMUiY+utKAUwOWM/rnKS/h0DA4jOVLwKn97gulkg6OZlit5eyJQIksd4bWmcQzQU1bzKV8lygLSlVpcUtPZprdDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5uHJVwM2uSey0SplBKm84/iSnqU2vlbXa7ohWoJT2o=;
 b=ZPpsA2HdG2b07PJfsgIQiH8vjRUVbESZMwHe3fvu6Xj3obWFZ9P0OkRtDpjBXJynXF02zuUy61dvq2QUx/pvU7ziWiX57NINgpJ3rurmujzxbZUinjn5fwMV/ZAt56gu8apO5J24U0Zbn/EcRl6r6N0co6bKLG4hhHZp8qw0dm2R/Mo4WGXLKV+Rw+pG0ITU0lvH1o1MsBtZRfwQFpBhGQOi/HRVE5RkS0YNayv5hao3bf5NaHgvR6CANMyb4UjC2Z4S3p2O8nZq41gNr7qlgpPXYkkoxa5L5+9GAEhGDkKj/00bUBJG9cn62B5MUIRxyTYRNFKq4s/VDuqZKCMneg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5uHJVwM2uSey0SplBKm84/iSnqU2vlbXa7ohWoJT2o=;
 b=Moy0/DE1c+QDLDsykDIzf2UWh0ZQ679a3FJ5iSO+k1SgLMk2xq8xe6EEQ8SbhH4K5aLeyE+a/dGJQz0J7bX5SvfF8aRjNYVI1MpCl7NKqzpyYzrd9xHSW7h6IG9RZBwTBBuM1zYVHbJ+NqKNfsXM7SheE13anZc2LvY/RJbO4p8=
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
 11:58:11 +0000
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Tue, 06 Oct 2026 13:57:20 +0200
Subject: [PATCH v2 06/17] ARM: dts: samsung: exynos4210: add or remove
 empty lines
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-exynos-arm-cleanup-v2-6-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4989;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=h1qNj87CUpqTR3ZeixO5H2YkjVle34AB3p5Ir1fQVoM=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqxOIyAnLTNUvc678/AB3f7EYwffV0ubhj6zqFD
 bJ0vbelPpOJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasTiMgAKCRCwB25JC3Fh
 a6pRB/sEmBgpe57DpwSA6ZNu6VqszPQJCiHitwyFy1VwJQ2l4pzPTKbCcAIqwlVnAFCplv5O+WJ
 DS21wJyuBsAj+/eBi5rcuw7PfbrS0B6DCiUCFt9iqDUAdp97kt43H5A4VIU7pcjoCkk3mz+dYQ+
 0X58LH9esyxkyLOWIFFh2nj6fO6GSBMm5a20mkk0CXHY4hid84lKayk2DMt+0RV4J2h+ZTN0xLR
 bRIhcpBrpk1gXzOiqBcVbDKqPNddsPy+VrdYWpUn+G/6GfP4IYt2b95NawKf16bLZWouW2+KIo6
 1gvtgTBmWM3x9qd820nJBoMn6KKOI+xUgctEtZX79f6h16jq
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-ClientProxiedBy: BE1P281CA0297.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::6) To GV2PPFBD14D17F4.eurprd02.prod.outlook.com
 (2603:10a6:158:401::5df)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPFBD14D17F4:EE_|AS2PR02MB10002:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2c7369-84bf-4ff6-15a1-08df23a1175b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	xHYdrt3696R8NowDGYQqbJOFiE8BSflaqrXZSs0j+24nqOYcLTkZQ2kkT0TFFfuoDfZNJWRgyj1AcGJlZt2uA5eIftsO82Xq6a4QCdaUX1AucRkPiIAm0oIuj8ogNcyZaC/Vs5W1LBeU5uILJdy1yFr65yJ+wui1hCdrgu7CoTFVlvsnFaHDnQuA/Xu8BFVBfTyukwhl4/KRTtV4+8tVGFAvFZ9p1+b2E0eD+epndubv30Sh48n1qjGjQppU7hPCYC4isn+FdyK8KTsJOkGb6EU/q32C1WiIjYTNqGMbXuMUDCz7Erfqt8GSMV8twUH4SpW0NSRP7mGAZeZ8URDx9ERU36QwmzcJ/isXMX+4PmID/0doBSPmIDMM/v0uS4diXFPixyNM72/Hku37SwAWN/Z1LJcLQ369i3klF8Kxv8KYaMvaFlHFpW6wwFy9OHkIcj4ZdKEpZdAwnhjdE0WiL0hX4vGLLFXrP5gYvKfjarkPPhuJtKG7L75bkW9Ug+yHHc108seJdXAHKzbami4Vz8ufzlsyV0uyHD7JRku4mqp5INhgdE1MNFY3aM6nCK7yAS6cvYpuu4b0RKpUFAhviLqRysIjQmNgzmbtWQuHrkrQGF7NwLfBlo0N3i+2GV9dg8jNZp7TVQcQmhVxw/bvySAobfaqBxKdyKoolTuZmBA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PPFBD14D17F4.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3lUQlpMVkR6aFl3ZXV6ZnR0R3JRTmZpK05HR1Fya3FaOVNvbTZqVFdia0ty?=
 =?utf-8?B?cWg3amZycnQyYWlqOVdZTXJKakZRWGQ2OXo4N2t0RmRXR0lBS1l4NzVoeXky?=
 =?utf-8?B?Z2p4eG9nbVZCREJhVUFXZDlLMGQzRUx1M3VzMHkwK3QyRTlYdE50cWxUbFR6?=
 =?utf-8?B?WUFYM2Rsc3FHbXBxcWh3eG5xZmQvOWZOeXVNMmpwTk9ZQnNMajZMZmtsUTdr?=
 =?utf-8?B?Zm5HbnZjZTVqb3p1ZkowUGFwWFEyRUFRa3ArdnB4dUZ1WnFjd1JOQ0V5YUN5?=
 =?utf-8?B?ZnlmMFVtekw2L0o3S1B5UTlYUEZKVVcvK2xSVitOc0diaFpQOStyWWh0N0gx?=
 =?utf-8?B?S21ob1RPb3IzWTZzNTQ2WFU4U1pjUG4rYmNLY2crZ1ZISC91NW5EcjFkM2Jn?=
 =?utf-8?B?QldmdHo3bTBYT0V6a2ZrSnhqZTN2ajI0TEdYeFdsejJaS1pudGxmS1pCcy9z?=
 =?utf-8?B?MUFRdHQ4TlV0aGNaZDFzZlV2WWJ5MVJPS29zQ2RHU3RsbWZUc05ER0MwK3Nj?=
 =?utf-8?B?NXJrWGdtRmZtUHBLQWxXM3FIVnZmQ1JtbGZtTGVIbXpnUkx4N2lKOUZxMjFY?=
 =?utf-8?B?aHJ2UEZRYWV3d3llS3Uzd2ZKT1FXaU5TcWo4MHNlSzd3cUt1R0RHZDNkb05z?=
 =?utf-8?B?TTNnSlpZcUNnQStJMlRsVDkrMUF1cUgvbmdnWUlVUzIyOUhMSmVlZWJVUzRR?=
 =?utf-8?B?Tkg3elBVbFNkc2ZyMEZqMjh0QVh0VjlkSnBScVdVSGVWQ1JmZEgvSmVORmlT?=
 =?utf-8?B?ZHR3WTJBeWQ5QjJSOUkxTkNzbWorSFV1VUJXbFp6R1BDRmx6VnVLbnlxQVZo?=
 =?utf-8?B?MkxQQW4wZzlYWUhCbnVvdCtBSVpvdmhDOGVuQ2RuK0hqM0tBcVVTc1Y5SWhL?=
 =?utf-8?B?L212bm1oaWVidVB4ZmFvODl4UjFUM0N3bDFFdjdzS0NwVDAxZHU1b0J5ckV0?=
 =?utf-8?B?ekhtUUloNHhLZnhEV2JMSE52eDNZNGNqU09hUnlxb0VPb1p2Zlc4eWRUZVRP?=
 =?utf-8?B?VlRoU2ZVcGYyM0FKM2NQU0xFT2hPd2JwY3VZa3lWNjA5N3MwcS82VVZJTldr?=
 =?utf-8?B?RjQwNCtlU0d2VUplMzdpNy91ZG82by9aRnYxTkRpMHZVbURHZHQrSWc4UXkz?=
 =?utf-8?B?Q3BXOEJCOWJVYXBwZ0puWWRiNmliVFExRUV3M0ZEVEs1ME9SSEFUenhhY2RB?=
 =?utf-8?B?bWR3ZGVyTVpQV1IrSGEwM3VXSzJJZVRvWEJjNUR1ZmM4RUpzUXlZNklyYXFh?=
 =?utf-8?B?QVhlamVDZXBnbVhYMTdIQ01VYTJlcE9aQ2FFaXY2ekhOdnFLclBJeDU3d1BG?=
 =?utf-8?B?Uk9GTjFQU2tHOHIxdE9JaFNuSDV6cnlWb3VjcnBkVWgvSDlUcitxZU9OZEJt?=
 =?utf-8?B?a3BZd3lwQ0JSZklLdVVPQktTSTdvRXdHb0lYY0hOUlpxMDlZa3BpTmxlU0t2?=
 =?utf-8?B?TVJ2VEdQY3J0NnFUZEZpK0lETjZwQ0xoYTZUQWE5bUZRc0N5WU5oYlBUdFJZ?=
 =?utf-8?B?Z3VFTmtRN1B4TVJKalNyeFpnSEZqWGxXU0pMZFhRYmRPbDJPUWJEQXNHeWdm?=
 =?utf-8?B?VTRHbS8yM2JqN1VncWNuTU55elZodEJ0akVSZGVxRUpCUVFCamk4d0xqaWM5?=
 =?utf-8?B?aVh5UlhxeWxKaGZKT3UxcmZpZUZjaXZQWThiUEdGTW9vZ29mdnNhUTlqTkFt?=
 =?utf-8?B?MW13L1hzc3JobmVPWkNoU2t6QjM5NU1Bdm9kcm1TWU1HWnArNDFTdXhmSTBX?=
 =?utf-8?B?d204V1pwcDgyeFo4ZWNsYXI5eVBDZUF6L1JFUllaOHVqcDczMWdpOWdnc2J1?=
 =?utf-8?B?T3VWYVJ3MGNLWnFodWxKVHU0dzdaNGJFSVZOUWpVbS9pdXdFQ2hVUXVjb1g1?=
 =?utf-8?B?Z01NaW5EblNpdUJmcU1XUmkwNm94dnQ3aTB3OFRTNkY2TW9IY3YwWEEvM1lM?=
 =?utf-8?B?MUtrbExzSi9CSEp6RUx2UXdvaGpZWVlMbUtRZ2dlVzlPK3RtcTUrNEdzL3hR?=
 =?utf-8?B?bkpvUjRVNGFLMENEZ0V5ZmNWem9HeGRrWUFBcVp6RHBMdkgxOGZ2WjIvcDJx?=
 =?utf-8?B?R0V5RU43OWFWYk1rN2FvZkpyQ2xXNkxBNXBETWxFYkZYc2pOWGQxWExJWStY?=
 =?utf-8?B?UmZRSTlZVTBHTFhaKzVjY3J0VTdrSzg1RHpvSW5LWU55WDVlWlhnYXV5NFRp?=
 =?utf-8?B?M0JOOGI5Qkk4SmplandJb3ptei9pcG9Idm96QnpWNDRMZ3RUa0NKK1Juemg5?=
 =?utf-8?B?SFJsZXhMaDVNQWlVZU9HcnY0anArM0NkaVBCTDJQbFNhK3Fhcm0vVTRuSjI2?=
 =?utf-8?B?aDcwREpEZXcrbVUvSityaFpVb0JqWE53aTlFVEdYV2YxcmxDMXdYdz09?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2c7369-84bf-4ff6-15a1-08df23a1175b
X-MS-Exchange-CrossTenant-AuthSource: GV2PPFBD14D17F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:58:09.9907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CV7W8bWDPq3Hb+ZgcKuqPgb5PgjG+CtcT3Hn6vgGXweCNVhcNRAzK8qrzvzi/l8gDr6KP29BcLKZhriKe1UfPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10002

For better readability it is preferred to have an empty line before
the status property, as well as before every child node. Empty lines
do not really help at start of children nodes though. Add or remove
empty lines where applicable.

dt-check-style in strict mode reports the issues like:

  samsung/exynos4210.dtsi:36: [required-blank-lines] "status" must be preceded by a blank line
  samsung/exynos4210.dtsi:45: [required-blank-lines] child node must be preceded by a blank line

Fixed partially with the help of dtfmt (Devicetree Source formatter).

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dts/samsung/exynos4210.dtsi
index 66b1a55f703d..66f35c4ae6b1 100644
--- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi
@@ -33,6 +33,7 @@ bus_acp: bus-acp {
 		clocks = <&clock CLK_DIV_ACP>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_acp_opp_table>;
+
 		status = "disabled";
 
 		bus_acp_opp_table: opp-table {
@@ -42,9 +43,11 @@ bus_acp_opp_table: opp-table {
 			opp-134000000 {
 				opp-hz = /bits/ 64 <134000000>;
 			};
+
 			opp-160000000 {
 				opp-hz = /bits/ 64 <160000000>;
 			};
+
 			opp-200000000 {
 				opp-hz = /bits/ 64 <200000000>;
 			};
@@ -56,6 +59,7 @@ bus_display: bus-display {
 		clocks = <&clock CLK_ACLK160>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_display_opp_table>;
+
 		status = "disabled";
 
 		bus_display_opp_table: opp-table {
@@ -65,9 +69,11 @@ bus_display_opp_table: opp-table {
 			opp-100000000 {
 				opp-hz = /bits/ 64 <100000000>;
 			};
+
 			opp-134000000 {
 				opp-hz = /bits/ 64 <134000000>;
 			};
+
 			opp-160000000 {
 				opp-hz = /bits/ 64 <160000000>;
 			};
@@ -79,6 +85,7 @@ bus_dmc: bus-dmc {
 		clocks = <&clock CLK_DIV_DMC>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_dmc_opp_table>;
+
 		status = "disabled";
 
 		bus_dmc_opp_table: opp-table {
@@ -89,10 +96,12 @@ opp-134000000 {
 				opp-hz = /bits/ 64 <134000000>;
 				opp-microvolt = <1025000>;
 			};
+
 			opp-267000000 {
 				opp-hz = /bits/ 64 <267000000>;
 				opp-microvolt = <1050000>;
 			};
+
 			opp-400000000 {
 				opp-hz = /bits/ 64 <400000000>;
 				opp-microvolt = <1150000>;
@@ -106,6 +115,7 @@ bus_fsys: bus-fsys {
 		clocks = <&clock CLK_ACLK133>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_fsys_opp_table>;
+
 		status = "disabled";
 
 		bus_fsys_opp_table: opp-table {
@@ -115,6 +125,7 @@ bus_fsys_opp_table: opp-table {
 			opp-10000000 {
 				opp-hz = /bits/ 64 <10000000>;
 			};
+
 			opp-134000000 {
 				opp-hz = /bits/ 64 <134000000>;
 			};
@@ -126,6 +137,7 @@ bus_lcd0: bus-lcd0 {
 		clocks = <&clock CLK_ACLK200>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_leftbus_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -134,6 +146,7 @@ bus_leftbus: bus-leftbus {
 		clocks = <&clock CLK_DIV_GDL>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_leftbus_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -142,6 +155,7 @@ bus_mfc: bus-mfc {
 		clocks = <&clock CLK_SCLK_MFC>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_leftbus_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -150,6 +164,7 @@ bus_peri: bus-peri {
 		clocks = <&clock CLK_ACLK100>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_peri_opp_table>;
+
 		status = "disabled";
 
 		bus_peri_opp_table: opp-table {
@@ -159,6 +174,7 @@ bus_peri_opp_table: opp-table {
 			opp-5000000 {
 				opp-hz = /bits/ 64 <5000000>;
 			};
+
 			opp-100000000 {
 				opp-hz = /bits/ 64 <100000000>;
 			};
@@ -170,6 +186,7 @@ bus_rightbus: bus-rightbus {
 		clocks = <&clock CLK_DIV_GDR>;
 		clock-names = "bus";
 		operating-points-v2 = <&bus_leftbus_opp_table>;
+
 		status = "disabled";
 	};
 
@@ -182,6 +199,7 @@ cluster0 {
 				core0 {
 					cpu = <&cpu0>;
 				};
+
 				core1 {
 					cpu = <&cpu1>;
 				};
@@ -234,9 +252,11 @@ bus_leftbus_opp_table: opp-table-0 {
 		opp-100000000 {
 			opp-hz = /bits/ 64 <100000000>;
 		};
+
 		opp-160000000 {
 			opp-hz = /bits/ 64 <160000000>;
 		};
+
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
 			opp-suspend;
@@ -353,6 +373,7 @@ ppmu_lcd1: ppmu@12240000 {
 			reg = <0x12240000 0x2000>;
 			clocks = <&clock CLK_PPMULCD1>;
 			clock-names = "ppmu";
+
 			status = "disabled";
 		};
 
@@ -489,6 +510,7 @@ opp-160000000 {
 			opp-hz = /bits/ 64 <160000000>;
 			opp-microvolt = <950000>;
 		};
+
 		opp-267000000 {
 			opp-hz = /bits/ 64 <267000000>;
 			opp-microvolt = <1050000>;
@@ -511,6 +533,7 @@ &mixer {
 &pmu {
 	interrupts = <2 2>, <3 2>;
 	interrupt-affinity = <&cpu0>, <&cpu1>;
+
 	status = "okay";
 };
 

-- 
2.43.0

