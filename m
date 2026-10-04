Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6176A3EFD04;
	Sun,  4 Oct 2026 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145040; cv=fail; b=fW0HCjoObg6sGolwRJ0xmKOhYIy8NjW/uX328qIgWqRFKQfSvtplWgwRxBcOrgtZOGVy9owsc1ceFcYibarHmFlwWPcbfgaLV6iqxxy4x0tZAjiMVr0ia69wdubEwufL5yI+XryjA994qLi+GrwM1XCoCYywivNdn+36MhpAGz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145040; c=relaxed/simple;
	bh=jT5n1NMB+k0LcNxyrVav9ysJxH6A43v/+oO1K5NJOFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lmF7LrKqi24AjvBe/MiejFw7XhvdkFpOwlQYyuM3chvU7eAsWCvv7ClCcNenpYNBXfQDfQNCB2by0SBkBKlrNRDy1Kd9fxVXGOUhG1N+CDENlBik9ficq9Hxy9YGYNAOJipw3BrtraBUQiGWN8yuP6urTclHWssGX6soH6ipxzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=fa7QX/Jq; arc=fail smtp.client-ip=52.101.72.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="fa7QX/Jq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSsfIqbskMwUKzbLJGWTF/rqfGflLAR04R27+1u+DQpJFFwBEn7GPsT8LkzY6y3CXDGzlaD25Q+NSQynltI4OvVmCx6EIPsdEuU9o/esvF11UqH0zGPZhjJVCaxK8WRWyUcBEPYETu2ucpO1TRKXnUYzL3wF01bAjrrMy4m7FTv8lXgjg0KWEZpGGbn8LjJZxDebLx9CbDP15V2yA+7asNKqbCFT1lySfXbQFN14cYWqGvmpoLIzvZB3ioewciYbO8fBqVOmmWfv2hxmsTFHYEvg7he0Q6pFq8WPLjmfQBbDJUYLiDuy4orSeqSCwhzjefzsXZDyV8X7bNOVexKEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBdR4nFs3iFxka8aJgEHTrpS4rsLgSo2kjkTqI6ARKk=;
 b=GMkuJ4nGN/z4mlaFNJBcE5vIE+vXnnX+oGUkGutYBw0sHa6UzLxx6tKdUOP9oCEyGhNs23D96rqlEaI9+5a9Lt/Ob6MRkBzvN6TnD+A0FA/0oJa8EruonxzV4hxtAR1+T+hMF8ebi5zUEiitDE3dMNnQAYmdCNU208BcN9JiUW9dnaLT5xThbdFsAxlmhMcm1tGZSfBZwQDFq03E3DfT/++48l9XiAEyb1r4ubBnCTIaR6zQOmZ1/oKBy87d+vIBLQ6ReTxAgnoeozAc65upDj1yn/aBpjG7dcLYJS0+iHp3j7V1LexCivQlPBMeKz4c2aKJbJflePGI0Mu0LlCkdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBdR4nFs3iFxka8aJgEHTrpS4rsLgSo2kjkTqI6ARKk=;
 b=fa7QX/Jqgp587Rl09H2asjjXVbNhPB2/3B0C9cIdC59BXqD9oN+6INvTpHyR2NGJUVW2aNVSa1+PAawPA20VGMoiADMtKqvw5h5mYJhkdMYecCj3KFu1B4sr3g8e0m1vNmVHorfBn/4zd7YfjIcPaLwadI8ckNNFFctTqnEt68I=
Received: from AS9PR04CA0153.eurprd04.prod.outlook.com (2603:10a6:20b:48a::27)
 by AS8PR02MB8880.eurprd02.prod.outlook.com (2603:10a6:20b:56e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Sun, 4 Oct
 2026 20:17:12 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:20b:48a:cafe::a5) by AS9PR04CA0153.outlook.office365.com
 (2603:10a6:20b:48a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:12 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 165F217DE;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id EEBED803CDC2; Sun,  4 Oct 2026 22:17:10 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:15:59 +0200
Subject: [PATCH 02/17] ARM: dts: samsung: exynos4: order *-names properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-2-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8999;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=jT5n1NMB+k0LcNxyrVav9ysJxH6A43v/+oO1K5NJOFQ=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQn1xTyFNMFHAO3yM69zeTU5LbSCLO9YF51t
 vcN1xbrlP+JATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0JwAKCRCwB25JC3Fh
 a1KACADCt2pN3n1jWvyWVJtolmWP6+I6hDhtGOueG4ulZsuUHDZYYYwqVnHUVLYL+rmzskz631m
 p63svGGyMQ4+0uD17rivwA9uih5B1sZRHkTNNATHznQiHJfLfzTDtWNMzPVs5tRQYJr8y0xF/bl
 NiH5is5v/+KecA7qK57TPXzW3RhKDbwOTcUlfQ3eWcgVMyghaN30hw45gyhwPh347c+TZrtQaQt
 vqEmNMSJORMhgUuLM7EGlHXaRIVAt73KkE/k6NOWSRV2alj3satAcjrtVFGg4uNNbrjAbLsyv8U
 ELF14LqxL/wDYP/NL0ZdH8uU1x4LLJbrIuHRziZeGZy+Ddlc
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|AS8PR02MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 5712e1c8-b2c8-4750-e6c8-08df2254799b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|30052699003|376014|1800799024|82310400026|36860700016|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	RXXuywj/yrm284JZsE1JCdQOfJPLJntK4VAKl4zHsG9RTqT0bAOnmIjLVcrd32888G+y1Ni+JC7BYvOcs7WyZBrcb5ow3voJJkejV6n5LBnJLK7sn8FPHrKzehOfq/7giqokjZrGT6bir/LpEPB3OJoRoptE9EEIbT5F2TgIdbLCCDPStCdgwXjmHhK8213FvNi0CN1UvmewmMOjuLd2OwicV7seIKCaVxru0+Tj8m6v1zdJvxw/XM88V9ehdn+GHmf3W2mTCwKrz2/Mlzoj7E8Im0srZHPfmqRkb3xcS55yqL1XzdQHZOOWNbPOlih1dR5T9xWzWib23FahjlH4xjN7ZAidWUgP5veSZ7CS3/hMaC0JvBoL9BhOsh6pzO33YszEXLqeUC5pfI2ypldJtBmPPtdatL2bz+Z/23sHNI4CHr7LSWS+y2GDyJ4tPAKa+kkZL7z/3f3EomO3hg2EZawHkHzzmVriiSSGDU8LdlKYL8FG8sXxO8YEvPPHA6si5OFWT8vw6oC+Z+WXftsqHXsJVV/896MYuF22QAJSxwBKgewtaxbsFFBb4RF845uY8XSorgczBwdi7uDVqrePIFaAStgjk2f7n7M9DSR2WGDZqKm3/voqQ0nuBGYHLr5ukdPQESC2JSpRAF3DysAvOaPTjKiMHItJR9QTPzPxeqZSwKAsz0oDU/tqlBdo3ZQT2QRnmzUVG/KQ9+E2NG22UA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(30052699003)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vZ7VZuXgj1sld/J4FRXhV7G9LzhpFMlOdAs9RhxBR7HRrdVuOD82SiAGsFOglwebl8sO0iHQ18mqC7OWfGXbJWtHW+SxBQNPBgIGE6VEKvd5NmtPVwER0TelUeeofPE2pc+9odmjAjVYdv+RoeELjSphBIDvNuK52kkBWCf1yjU4PF4zW3hj1n+lEmJYRK2lD1602CnDFdxbb+dQ7oIcphL7wSAzhmG/sHPYuIdGb69IerHfT8x1W/DiX1KIq5gHo1D96fnndoF52uPYzgbBw9o9vWjqX3vaxxuzbZpE6HgoppHWhf7oI9VstF0lIhpLTlHwtcX4EAuvk5+yyTgHC5d1h5+CIvAn8pENKKWu5oE/7pkydelPLtkZ0m1RgtDyKILxF0Abms06TUjnopLiQGaihCA4LsGfljAJAjDUAHf1dp4iAk4Jw/swQ14wPt14
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:12.2249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5712e1c8-b2c8-4750-e6c8-08df2254799b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8880

pinctrl-names, clock-names and interrupt-names should be after
pinctrl-*, clocks and interrupts respectively. Re-order all of them to
make the files consistent.

dt-check-style in strict mode reports the issues like:

  samsung/exynos4.dtsi:745: [property-order] property 'interrupt-names' must be placed after 'interrupts'
  samsung/exynos4.dtsi:788: [property-order] property 'clock-names' must be placed after 'clocks'
  samsung/exynos4.dtsi:810: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4.dtsi | 50 +++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
index c38489a05e15..f69b01423ae0 100644
--- a/arch/arm/boot/dts/samsung/exynos4.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
@@ -524,8 +524,8 @@ i2c_0: i2c@13860000 {
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C0>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c0_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -538,8 +538,8 @@ i2c_1: i2c@13870000 {
 			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C1>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c1_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -552,8 +552,8 @@ i2c_2: i2c@13880000 {
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C2>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c2_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -566,8 +566,8 @@ i2c_3: i2c@13890000 {
 			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C3>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c3_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -580,8 +580,8 @@ i2c_4: i2c@138a0000 {
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C4>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c4_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -594,8 +594,8 @@ i2c_5: i2c@138b0000 {
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C5>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c5_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -608,8 +608,8 @@ i2c_6: i2c@138c0000 {
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C6>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c6_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -622,8 +622,8 @@ i2c_7: i2c@138d0000 {
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_I2C7>;
 			clock-names = "i2c";
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c7_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -655,8 +655,8 @@ spi_0: spi@13920000 {
 			#size-cells = <0>;
 			clocks = <&clock CLK_SPI0>, <&clock CLK_SCLK_SPI0>;
 			clock-names = "spi", "spi_busclk0";
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_bus>;
+			pinctrl-names = "default";
 			fifo-depth = <256>;
 
 			status = "disabled";
@@ -672,8 +672,8 @@ spi_1: spi@13930000 {
 			#size-cells = <0>;
 			clocks = <&clock CLK_SPI1>, <&clock CLK_SCLK_SPI1>;
 			clock-names = "spi", "spi_busclk0";
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_bus>;
+			pinctrl-names = "default";
 			fifo-depth = <64>;
 
 			status = "disabled";
@@ -689,8 +689,8 @@ spi_2: spi@13940000 {
 			#size-cells = <0>;
 			clocks = <&clock CLK_SPI2>, <&clock CLK_SCLK_SPI2>;
 			clock-names = "spi", "spi_busclk0";
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi2_bus>;
+			pinctrl-names = "default";
 			fifo-depth = <64>;
 
 			status = "disabled";
@@ -742,8 +742,8 @@ fimd: fimd@11c00000 {
 			compatible = "samsung,exynos4210-fimd";
 			interrupt-parent = <&combiner>;
 			reg = <0x11c00000 0x20000>;
-			interrupt-names = "fifo", "vsync", "lcd_sys";
 			interrupts = <11 0>, <11 1>, <11 2>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
 			clocks = <&clock CLK_SCLK_FIMD0>, <&clock CLK_FIMD0>;
 			clock-names = "sclk_fimd", "fimd";
 			power-domains = <&pd_lcd0>;
@@ -785,12 +785,12 @@ hdmi: hdmi@12d00000 {
 			compatible = "samsung,exynos4210-hdmi";
 			reg = <0x12d00000 0x70000>;
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
-				      "sclk_hdmiphy", "mout_hdmi";
 			clocks = <&clock CLK_HDMI>, <&clock CLK_SCLK_HDMI>,
 				 <&clock CLK_SCLK_PIXEL>,
 				 <&clock CLK_SCLK_HDMIPHY>,
 				 <&clock CLK_MOUT_HDMI>;
+			clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
+				      "sclk_hdmiphy", "mout_hdmi";
 			phy = <&hdmi_i2c_phy>;
 			power-domains = <&pd_tv>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
@@ -807,8 +807,8 @@ hdmicec: cec@100b0000 {
 			clock-names = "hdmicec";
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			hdmi-phandle = <&hdmi>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hdmi_cec>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -943,8 +943,8 @@ sysmmu_mfc_l: sysmmu@13620000 {
 			reg = <0x13620000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <5 5>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_MFCL>, <&clock CLK_MFC>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_mfc>;
 			#iommu-cells = <0>;
 		};
@@ -954,8 +954,8 @@ sysmmu_mfc_r: sysmmu@13630000 {
 			reg = <0x13630000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <5 6>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_MFCR>, <&clock CLK_MFC>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_mfc>;
 			#iommu-cells = <0>;
 		};
@@ -965,8 +965,8 @@ sysmmu_tv: sysmmu@12e20000 {
 			reg = <0x12e20000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <5 4>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_TV>, <&clock CLK_MIXER>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_tv>;
 			#iommu-cells = <0>;
 		};
@@ -976,8 +976,8 @@ sysmmu_fimc0: sysmmu@11a20000 {
 			reg = <0x11a20000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <4 2>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_FIMC0>, <&clock CLK_FIMC0>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_cam>;
 			#iommu-cells = <0>;
 		};
@@ -987,8 +987,8 @@ sysmmu_fimc1: sysmmu@11a30000 {
 			reg = <0x11a30000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <4 3>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_FIMC1>, <&clock CLK_FIMC1>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_cam>;
 			#iommu-cells = <0>;
 		};
@@ -998,8 +998,8 @@ sysmmu_fimc2: sysmmu@11a40000 {
 			reg = <0x11a40000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <4 4>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_FIMC2>, <&clock CLK_FIMC2>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_cam>;
 			#iommu-cells = <0>;
 		};
@@ -1009,8 +1009,8 @@ sysmmu_fimc3: sysmmu@11a50000 {
 			reg = <0x11a50000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <4 5>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_FIMC3>, <&clock CLK_FIMC3>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_cam>;
 			#iommu-cells = <0>;
 		};
@@ -1020,8 +1020,8 @@ sysmmu_jpeg: sysmmu@11a60000 {
 			reg = <0x11a60000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <4 6>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_JPEG>, <&clock CLK_JPEG>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_cam>;
 			#iommu-cells = <0>;
 		};
@@ -1031,9 +1031,9 @@ sysmmu_rotator: sysmmu@12a30000 {
 			reg = <0x12a30000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <5 0>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_ROTATOR>,
 				 <&clock CLK_ROTATOR>;
+			clock-names = "sysmmu", "master";
 			#iommu-cells = <0>;
 		};
 
@@ -1042,8 +1042,8 @@ sysmmu_fimd0: sysmmu@11e20000 {
 			reg = <0x11e20000 0x1000>;
 			interrupt-parent = <&combiner>;
 			interrupts = <5 2>;
-			clock-names = "sysmmu", "master";
 			clocks = <&clock CLK_SMMU_FIMD0>, <&clock CLK_FIMD0>;
+			clock-names = "sysmmu", "master";
 			power-domains = <&pd_lcd0>;
 			#iommu-cells = <0>;
 		};

-- 
2.43.0

