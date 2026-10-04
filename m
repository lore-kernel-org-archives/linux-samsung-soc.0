Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C4846F4BC;
	Sun,  4 Oct 2026 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145039; cv=fail; b=tkGW29J8+UEzU6rH9ukpu0qgp0ouWdtTJIpS6qd4jA8qGsKCt+iynceLPfW+cRLog8NbTaJzUBGMAtfDqgNnN1bshjBCSWsa/Di2rr8Tv2NBwu3wP1TVjuKezFJ4iNGEToHQ0aR5PYMsPuUAhDl5lggBCA65eSKzSZwjJmfL3iM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145039; c=relaxed/simple;
	bh=tuMsVOxmF3Mi1dpHCymqRfFU8dXZlkH0tTL8VIeVhuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EWh1/OXPepdpt4HgGEM/S1mbBj5QMkIR4j4Y6bdlT2sCaFvd5rp2dGy6gOChXQNtz2szJZtL83ntam/W8uOwDg1seiu1kP08y2bOq3+GJNwFsuFoZbC8xB2e3jOik8Vx3ITPIf5Y5ErxaWZQOky9C2v22qPBGAzxqn86pCDGHk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=WTnUx0a+; arc=fail smtp.client-ip=52.101.66.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="WTnUx0a+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feCfjMvMCf8ywxZvbhWkSn8UsUCwfYmWGSyOYU8sonOjUXMAsvDXgEVoNCHfOCl1yc+QLdMLBE8zZ0KG2tYg1s6KrfIKDwwygM4/y7SLjdQMJLc1WpI5k9uCNv03k1XLq2oFldL5/E9OUKFMr4RwREKPuHx417oq+lujZ/7VxoIgGn75A6v7yZJUTClpmQ51IWfFLZa7/NU3rGxorQP8eDv1MPCwT6eexdS6AiNpURSEgbvBvC7YuKS6UvaPV/cVagynZlLHN2Tf2Un/D3KVsb8YmRwhYaxMrgFk9wU5cuJl6+YNbDmAX8Nwt3PrxUNMEeYPufaidj8aDSpf5cZJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHSI40dsTHxFMuVJXj1OieVkVr/y4sBG3eNLFH4/pak=;
 b=e9xxcZbrtPh6Vq+8Ge4cV7iq5oTbXFDU2e5p5Sj8QBY+lyb7agQfZdpxcwV4zf96oH6BuKVy9Ji6N/eI0PjkzVqZ9uBXv0C/mEGStsomjoowCFAtmalSJrLGK8SCbAsXhoKLNLSn9V/mtB8E6ZutSfNqYO1FEsE/0FVD3kiwa3F82VT9DCizhKD2Of0biqyCv6/dTR4LAT31QFH/UhXXf4Kbd8GlJxn65fmvYaR2l1MIsa0R9BzkVG+wuQP38VQIUztki55fG8c7+sCzBjuceSNXmRmVedWsygGfVPazaFeU5rz0VpBqp+O0avqT8eysVwaxW1jsrCClSbuJqt9MaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHSI40dsTHxFMuVJXj1OieVkVr/y4sBG3eNLFH4/pak=;
 b=WTnUx0a+PzkLGLlGAT0Wk5OsoUZBC6Hrl/pr+N7841+LwCEmrSVWjuWzjyQOF1w3kv6TfjUiBUz5n6MSBSeclFhoT/N16Gk5KRBgvA4ElYUWTEF3SOdMwtyJ9//6J2/Lb0qAncR0XCcAQmmzlLfmoPv9pma54qG1YwfPJlvwt8E=
Received: from AS9PR04CA0135.eurprd04.prod.outlook.com (2603:10a6:20b:48a::10)
 by PR3PR02MB6217.eurprd02.prod.outlook.com (2603:10a6:102:71::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Sun, 4 Oct
 2026 20:17:13 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:20b:48a:cafe::85) by AS9PR04CA0135.outlook.office365.com
 (2603:10a6:20b:48a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:13 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7C24B4C10;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id 2D0E2803CDC2; Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:14 +0200
Subject: [PATCH 17/17] ARM: dts: samsung: exynos4210-universal_c210: fix
 alignments
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-17-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2322;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=tuMsVOxmF3Mi1dpHCymqRfFU8dXZlkH0tTL8VIeVhuc=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrREUFW8hhbO8RoyJtFCbar9cU78vP4LHq3jB
 oioFOLkqrCJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0RAAKCRCwB25JC3Fh
 a3OBB/98bAVyLRbBdMcbklScV+8/qZRsBTjRKFbyedwthEm6m4k1IIvatWC6RUXycs6EXeI/Nlv
 Int7vMvyI2LaOcSojMENhv9H4o11WPXSt+VZRQSLEh453/1Le0Mcqeg4ujFmgt9jKAHdi1K3ayo
 iSJ249XB/iUZgMWEfGrlHhtFaGHhXehoUiZa8m1TP2d48GZ8OMwLH9/hRKLoJ8c3Yo7DbQdG7/j
 j2RU/pFIeDSJCeSVLhU7vqI0eUPJ7AK/Ghp07tBA/2LSmLrmZ+p6hCACnNxQgl82UBnje/pu2+l
 HYuTFgiuU71U26JU25g7VveY8vqIJyZ+0eeOGYvTAiZstkT1
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|PR3PR02MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6066b9-7033-4138-37eb-08df22547a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|30052699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iWAyvjzoptUDKpl1KNSIUZW1IG1qb4kQdIlBMjVf8oe5ULBKW7bw8sWF2w/n4A+sWZF3dUZ773R3k3k6XdJBnCu2zCNybNyDuyDN29m9xxZYQgMv4KBNBygfXKioiNHQIEwNDJbs4RrgOmWVRpeQ7Vy3EuqdKNK8CgIqH0vt9KFOdfpExMly2P33Y5WDXUjGmWjNz/NsuXqZBhCV7hXIAVLS3gJXHN0iFTlm/S1RfFA1feBVhy3OIRzL9WEZAKC5olweYWvChnDoZF06I0zfnhTXwp3EYIoRUc5CUjMDv/5mT8TmIjW2rObrPU7otDP49RkA0JqbqKTqf1HkSPHvGXbloF3JVYjstHqHBjkuKnPAhbcjjVay9IfITzMAXC4XFtbbl+Svtp1+qxGTVdY1DcBdd8m9xJnNSeu/ltWHKbunV3yk37SFmc+cZf3FWGHacHTg5cHX7zklB7/RH2EuTSdo4PCrRny7Ua0b49mxQitAg99SEi5wzI3zuhsGRKoCyOeWRUwTxgHQ7hSOwkmeiaj1zmCK+rvnFiPeIYmNiuu9YQZVkld5TDrY0Vup46ACWYKKpzjk21FwZTLsG88M5WHBNv5yfI/XPtZB/n5zaDtUdbEkz+32IwjpQ6Cnwe5o6ywNO3SflmhDHsAXyJQZUkL0/Z7L+YsyEoACL1e+3EfbWnzNeqGZZ9wBjvB1NwD4wnH1YOSTx655JRc/LmFk3Q==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(30052699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cYkQ1RVjX3W7P5hM/Ta/XVTU/PEk3S6Lkgsc+QIUzIO1e031IBmhUtlb9v/QnEQI6MawoAu3fvQE0YlmWK5kPm5OEM04KgoU8xQ4trHXjKW+n0wC/ayb0pIrNvgcacQH6dHkHwK9AY2unJLNfO6OXcxbYe6vVQeuIPfUuSeVg8Lj5QdEbuRBujhT4KJ6JW5CVeYN0Cv6BAh0yvXxohiiM4bQHRS+L0yt+pxf9cbmu2OkizXM1WpbvRF6XSZ68m7j7bj/Gbv/dEV7ZNbquzzVMOc3dUYcqpgsqi0Xq2mWuWSlZu0B121UzKIGH5p4sEioXj8FlyyTwFpm9VQaim4CStAYyt6Y6gz3N3IRXF3vjLgyz52UENG0QQYSMFG+AL7ktJSstPNjyycfmevdXCQ98IzXiEHrHBvlaBkWgJP4cCI0myztTDoBbvAVN9Y1MJCb
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:13.3650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6066b9-7033-4138-37eb-08df22547a4a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6217

Remove extra empty line, align multiline properties and add space
after /delete-property/. Fixed with dtfmt (Devicetree Source
formatter).

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 .../boot/dts/samsung/exynos4210-universal_c210.dts | 23 +++++++++++-----------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
index bcc636adba91..2e8d48315390 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
@@ -35,7 +35,6 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
-
 	fixed-rate-clocks {
 		xxti {
 			compatible = "samsung,clock-xxti";
@@ -353,7 +352,7 @@ vdd_arm_reg: pmic@60 {
 				    <&gpx0 4 GPIO_ACTIVE_HIGH>;
 		max8952,default-mode = <0>;
 		max8952,dvs-mode-microvolt = <1250000>, <1200000>,
-						<1050000>, <950000>;
+					     <1050000>, <950000>;
 		max8952,sync-freq = <0>;
 		max8952,ramp-speed = <0>;
 	};
@@ -367,9 +366,9 @@ pmic@66 {
 
 		max8998,pmic-buck1-default-dvs-idx = <0>;
 		max8998,pmic-buck1-dvs-gpios = <&gpx0 5 GPIO_ACTIVE_HIGH>,
-						<&gpx0 6 GPIO_ACTIVE_HIGH>;
+					       <&gpx0 6 GPIO_ACTIVE_HIGH>;
 		max8998,pmic-buck1-dvs-voltage = <1100000>, <1000000>,
-						<1100000>, <1000000>;
+						 <1100000>, <1000000>;
 
 		max8998,pmic-buck2-default-dvs-idx = <0>;
 		max8998,pmic-buck2-dvs-gpio = <&gpe2 0 GPIO_ACTIVE_HIGH>;
@@ -650,8 +649,8 @@ brcmf: wifi@1 {
 };
 
 &serial_0 {
-	/delete-property/dmas;
-	/delete-property/dma-names;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 	pinctrl-0 = <&uart0_data &uart0_fctl>;
 	pinctrl-names = "default";
 
@@ -674,20 +673,20 @@ bluetooth {
 
 &serial_1 {
 	status = "okay";
-	/delete-property/dmas;
-	/delete-property/dma-names;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 };
 
 &serial_2 {
 	status = "okay";
-	/delete-property/dmas;
-	/delete-property/dma-names;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 };
 
 &serial_3 {
 	status = "okay";
-	/delete-property/dmas;
-	/delete-property/dma-names;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 };
 
 &soc {

-- 
2.43.0

