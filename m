Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14A34A8A29;
	Sun,  4 Oct 2026 20:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145043; cv=fail; b=RnhJg4BVranfA8ki6CEHXvZ1PSCXwzNy1vROyJQc9RBSAZ2/X/JwMZOG5kULvdRxDZEijBHNQCLFGEro030GCMOTMhMpcAIRY96oarXyWeCLhK6ysE8yGUxI0iOJwUuOb6RFGjUCTzwIM7nDVBwKn8Tu97icydoEr4KhHYvMEsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145043; c=relaxed/simple;
	bh=8YYKtA7CrbEe/oqSLIXWN5arZ6+yr9lXgdwkwf6Z0QE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MtFiz4kyUvgbZJSODgWJ29imYtU2feu7qJ4cOLj7EX8fJycC7uJuOdP8v4gCBn2FogGbIUdWUwIK4i7C4mebS+LGFYReLIymiFqIDCNJXx03al3HzwASwWFPTaG87IitYAVsXRW8cekKN6irAXIioA99UsOJxXxPcSXHP/Udu+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=DsFUIs5/; arc=fail smtp.client-ip=52.101.69.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="DsFUIs5/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vttoV2wRL0r4kLwNpLio33LYaxFYps1TIAaQRizyvnlRbHFIUzH/x89c8WIbrfPf9WjlbZo5+ZRp1/jQvmdFJoAvuluk+WS77N7kb0fkPUMOXAKhRpezS38bgngkTzl65jFinwsVtTrg4nPifYyLxRKfUJoBAv65sxLEBgQINuqNf6bXoz3TrkEt+dKyEKl6XFhtzoXhQ2axCsmIJHwmeXhUFfSuiuJpEzrrQjpQLlTzcFncmB5WiKsDgkkBZC9DL2/W/j4Jo8yl7HTxDVu6/sR0zGQ5aWxrmRXaNOBvLc//O7e87zFHxo2rSUC+C5mv4TBnek/lkNOVjPV49Gkr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JY3ljlRSf2pHiTtXpArTuxLnmNlIc1QHxJQmZnui9xU=;
 b=Ub5dejC3XY/P4T5t06vj7IEUUGelCKEE+R+h92e9+LoyexX/3IhC4adTojCFC+xE3y/ATCkbH2G0VSRqSqLDMv4Aj31DpcPlu6d49af2OStGi7yVqVKzKJ0UGdnJfqnq6/RYqvNxrUuOHLnWLHTrJNXbjBuekKqO8V/KVJbA9WyAAsoVHazaTiyiy6QTu1LOAZG1KN/CzEW53iH0LXTXlXTdxU3mn+sUrAFXJU7iG6c3U3LgxTVHdo4hN6OLus27v7pH8kS31gaMOoYy94tHc71jOY/bFDQkrGtDa3ym0gocMA1yrXlXch0VumurzgarUSBudDxBMM74aYG3FH6nLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JY3ljlRSf2pHiTtXpArTuxLnmNlIc1QHxJQmZnui9xU=;
 b=DsFUIs5/3j6YtyQFg1qOF2e5jgDGFb7PjhDe/tVBbD3He9kyHytVOdXyE30yYRs2/v7hFFmHjBBd1MA6Dl0Cu4dIvKwhWlLiJ+LCENzF2ZjEwBLnEHo5rqesyAHzL5QOIrhsaN/YSmvAutrkFpZa5v583U+V6fYGeCT/bNx67tk=
Received: from AS9PR04CA0135.eurprd04.prod.outlook.com (2603:10a6:20b:48a::10)
 by GV1PR02MB8537.eurprd02.prod.outlook.com (2603:10a6:150:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Sun, 4 Oct
 2026 20:17:14 +0000
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
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7C2924BBC;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id 15CE8803CDCB; Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:08 +0200
Subject: [PATCH 11/17] ARM: dts: samsung: exynos4210-i9100: sort properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-11-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9363;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=8YYKtA7CrbEe/oqSLIXWN5arZ6+yr9lXgdwkwf6Z0QE=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQ5DPfRQ+MXisYSiExtCQvoZeKFCZal+wz1H
 ds8mTSVCVKJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0OQAKCRCwB25JC3Fh
 a0zeCACJ/OI6gBylQOvJo40GJ/7YSSzmsyqRdfX0tZjlwX0WVdiYFpcN7TexZZAKwVtNYlEa3Kz
 iCLZ7t+O6pmVHrwnFzCCozqYM+tBt5o7P4l4lZKUgYablE6Bchq50ky7f/nYWC7/DtN2pv0lhpi
 60icr7dwMwassrzVuUzjTcwSB4kyvztoeGC5ynL1TGj4iqhRjMQ2G9KStq/mDxIijgjKCULNF5X
 bdmko8sYcFhPfwr89pERhAXuzRwKbj0x56aeXlYX7JoAgwW9jiGMwaIPT0R9wmVf38qo7as+zoj
 Wwj0kQQAk6gLuJbpx3HAeurbubdePb18SIrB9U0VsAyY1YtY
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|GV1PR02MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe254b3-3049-474d-e5b7-08df22547a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|30052699003|82310400026|376014|36860700016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SRlbCT71IRrm99YPIV9nDiV4Lub5VBEnOVopGAwkrpGKeQE8zAykuhgEb+jqSnblKJk2uFnX/sBpXF9rRiJ8gsHaBXWB32bpOxkOG2W1tXgelQ7NauwSUQiB9yTQxSq30PLAscPskZFVh63rhsMNL+EONjQ2o0zi5h7WPCTN0bavGi/gWc0cN7Ozlb3bPlMz/TL+MtbELZwvEjSpI7YRvTzket9toPOj4qG69DFpLjHB5U+CeWha+0fip2NOYHsqTDID9sOWW3re7k0rPgudGhVXxp7QSPkw6RQnNSqPYddvBadTH/COYP3ELfP7eGwKBixFMoVaeYbnAH+vzJ/7ryOhgT/nHzay1qzE3RCSborlSPtaz4gwAx5TKOyAElq8Bf48+ySRuOe+ppBpaSnq1wjTahU2DPHfRa2dxZoQxwuUpu/uS5hvY7/NrnlhcDfHQw+oWJCuOxhT6h/OPt6Ea2pwVQcCQx4xbbt28q21UaXYAJSibtBJ0w9cKJXW/P9vlaRROD5juu6QKsnMwekyAotptBUfUwg2n09ZsnUsTwisdWtdghQ0Zu4uUdLcqJv61FlPYiFmuiwR+MdLqzy8YD1wlkc5iFfWUPAxg3rxZoXlWZaRbFR7rr9Nym9jPOWygJ6nA4qwiRlka1F6HGx8qkyI3G2JAun2LjE5FeiRpWXw4t5wDaFFnlveWdIlwqkRUonTX+Bykq5cqgKbS6q/hg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(30052699003)(82310400026)(376014)(36860700016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rJ2Dr6ihJ/qXLQGyei5n0qSsxwLp1UH2oX7LFmUId1SIXLrLatjlL8tEDpDwjogGrDQ76O96A+UjGWm38J1rJdel6TkycvcWLtjZcj3nTfPQZftN71D/heVRgd8NqQ4Qjll/E1+ePOanpwQD5+YoMXprCC/SKj+9IxH2mmcBBqmOJe5SSZudfNSUnNHs2YKH3Jng1HotYI4i5ak93FoUokEtYkxheg6OT1N0jn8uGGJHaAPPgknyd6PBXukCcwPWrNKYawG2HkPm0WzZAW2WYzfUTO6Masaj1Sj6ASW/3f0ZXT1PjLh4ZyLDl1LC8QgSFJZ1GebMv4ftl5+pekpKSgpUbPGc/u1oh6reVeWjapIMeI0Vu+6xqrzUMZUeC3mDPenvVvehBcVsF3WDd19CfAHjqJpY6Pv+hmUyCu9lA9YOQq35ZLlt9GQV6o0hdTLc
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:13.8751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe254b3-3049-474d-e5b7-08df22547a97
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8537

And add or delete newlines where applicable, and sort properties
according to the preferred style. Fixes warnings from dt-check-style
like:

  samsung/exynos4210-i9100.dts:275: [child-name-order] child node 'pmic-ap-clk' out of name order
  samsung/exynos4210-i9100.dts:287: [required-blank-lines] "status" must be preceded by a blank line
  samsung/exynos4210-i9100.dts:288: [property-order] property 'assigned-clocks' out of canonical order (should sort before 'status')

Also remove double spaces in max8997 buck dvs voltages list.

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 125 +++++++++++++------------
 1 file changed, 65 insertions(+), 60 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index b9a31714381c..85e4d334a5e6 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -97,31 +97,31 @@ gpio-keys {
 
 		key-vol-down {
 			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_VOLUMEDOWN>;
 			label = "volume down";
 			debounce-interval = <10>;
+			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
 		key-vol-up {
 			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_VOLUMEUP>;
 			label = "volume up";
 			debounce-interval = <10>;
+			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		key-power {
 			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_POWER>;
 			label = "power";
 			debounce-interval = <10>;
 			wakeup-source;
+			linux,code = <KEY_POWER>;
 		};
 
 		key-ok {
 			gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_OK>;
 			label = "ok";
 			debounce-interval = <10>;
+			linux,code = <KEY_OK>;
 		};
 	};
 
@@ -141,6 +141,7 @@ i2c_max17042_fuel: i2c-9 {
 
 		battery@36 {
 			compatible = "maxim,max17042";
+			reg = <0x36>;
 
 			interrupt-parent = <&gpx2>;
 			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
@@ -148,7 +149,6 @@ battery@36 {
 			pinctrl-0 = <&max17042_fuel_irq>;
 			pinctrl-names = "default";
 
-			reg = <0x36>;
 			maxim,over-heat-temp = <700>;
 			maxim,over-volt = <4500>;
 		};
@@ -284,21 +284,24 @@ pmic_ap_clk: pmic-ap-clk {
 &camera {
 	pinctrl-0 = <&cam_port_a_clk_active>;
 	pinctrl-names = "default";
-	status = "okay";
 	assigned-clocks = <&clock CLK_MOUT_CAM0>, <&clock CLK_MOUT_CAM1>;
 	assigned-clock-parents = <&clock CLK_XUSBXTI>, <&clock CLK_XUSBXTI>;
+
+	status = "okay";
 };
 
 &csis_1 {
-	status = "okay";
 	vddcore-supply = <&vusb_reg>;
 	vddio-supply = <&vmipi_reg>;
 	clock-frequency = <160000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
 
+	status = "okay";
+
 	port@4 {
 		reg = <4>;
+
 		csis1_ep: endpoint {
 			remote-endpoint = <&s5k5bafx_ep>;
 			data-lanes = <1>;
@@ -317,6 +320,7 @@ map0 {
 			/* Corresponds to 800MHz */
 			cooling-device = <&cpu0 2 2>;
 		};
+
 		map1 {
 			/* Corresponds to 200MHz */
 			cooling-device = <&cpu0 4 4>;
@@ -325,62 +329,63 @@ map1 {
 };
 
 &ehci {
-	status = "okay";
-
 	phys = <&exynos_usbphy 1>;
 	phy-names = "host";
-};
 
-&exynos_usbphy {
 	status = "okay";
+};
 
+&exynos_usbphy {
 	vbus-supply = <&safe1_sreg>;
-};
 
-&fimc_0 {
 	status = "okay";
+};
 
+&fimc_0 {
 	assigned-clocks = <&clock CLK_MOUT_FIMC0>, <&clock CLK_SCLK_FIMC0>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	status = "okay";
 };
 
 &fimc_1 {
-	/* Back camera not implemented */
-	status = "disabled";
-
 	assigned-clocks = <&clock CLK_MOUT_FIMC1>, <&clock CLK_SCLK_FIMC1>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	/* Back camera not implemented */
+	status = "disabled";
 };
 
 &fimc_2 {
-	status = "okay";
-
 	assigned-clocks = <&clock CLK_MOUT_FIMC2>, <&clock CLK_SCLK_FIMC2>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	status = "okay";
 };
 
 &fimc_3 {
-	/* Back camera not implemented */
-	status = "disabled";
-
 	assigned-clocks = <&clock CLK_MOUT_FIMC3>, <&clock CLK_SCLK_FIMC3>;
 	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <160000000>;
+
+	/* Back camera not implemented */
+	status = "disabled";
 };
 
 &fimd {
-	status = "okay";
 	#address-cells = <1>;
 	#size-cells = <0>;
 
+	pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
+	pinctrl-names = "default";
+
 	samsung,invert-vden;
 	samsung,invert-vclk;
 
-	pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
-	pinctrl-names = "default";
+	status = "okay";
 
 	port@3 {
 		reg = <3>;
@@ -392,26 +397,26 @@ fimd_dpi_ep: endpoint {
 };
 
 &gpu {
-	status = "okay";
-
 	mali-supply = <&vg3d_breg>;
-};
 
-&hsotg {
 	status = "okay";
+};
 
+&hsotg {
 	dr_mode = "otg";
 	vusb_d-supply = <&vusb_reg>;
 	vusb_a-supply = <&vusbdac_reg>;
-};
 
-&i2c_1 {
 	status = "okay";
+};
 
+&i2c_1 {
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
 
+	status = "okay";
+
 	lis3dh: accelerometer@19 {
 		compatible = "st,lis3dh-accel";
 		reg = <0x19>;
@@ -423,14 +428,14 @@ lis3dh: accelerometer@19 {
 };
 
 &i2c_3 {
-	status = "okay";
+	pinctrl-0 = <&i2c3_bus>;
+	pinctrl-names = "default";
 
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
 
-	pinctrl-0 = <&i2c3_bus>;
-	pinctrl-names = "default";
+	status = "okay";
 
 	touchscreen@4a {
 		compatible = "atmel,maxtouch";
@@ -442,14 +447,14 @@ touchscreen@4a {
 };
 
 &i2c_5 {
-	status = "okay";
+	pinctrl-0 = <&i2c5_bus>;
+	pinctrl-names = "default";
 
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
 
-	pinctrl-0 = <&i2c5_bus>;
-	pinctrl-names = "default";
+	status = "okay";
 
 	pmic@66 {
 		compatible = "maxim,max8997-pmic";
@@ -458,6 +463,11 @@ pmic@66 {
 		interrupts-extended = <&gpx0 7 IRQ_TYPE_NONE>,
 				      <&gpx2 3 IRQ_TYPE_EDGE_FALLING>;
 
+		pinctrl-0 = <&max8997_irq>, <&otg_gp>, <&usb_sel>;
+		pinctrl-names = "default";
+
+		charger-supply = <&charger_reg>;
+
 		max8997,pmic-buck1-uses-gpio-dvs;
 		max8997,pmic-buck2-uses-gpio-dvs;
 		max8997,pmic-buck5-uses-gpio-dvs;
@@ -475,34 +485,28 @@ pmic@66 {
 						 <1000000>, <950000>;
 
 		max8997,pmic-buck2-dvs-voltage = <1100000>, <1000000>,
-						 <950000>,  <900000>,
+						 <950000>, <900000>,
 						 <1100000>, <1000000>,
-						 <950000>,  <900000>;
+						 <950000>, <900000>;
 
 		max8997,pmic-buck5-dvs-voltage = <1200000>, <1200000>,
 						 <1200000>, <1200000>,
 						 <1200000>, <1200000>,
 						 <1200000>, <1200000>;
 
-		pinctrl-0 = <&max8997_irq>, <&otg_gp>, <&usb_sel>;
-		pinctrl-names = "default";
-
-		charger-supply = <&charger_reg>;
-
 		regulators {
 			vadc_reg: LDO1 {
 				regulator-name = "VADC_3.3V_C210";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
-
 			};
+
 			valive_reg: LDO2 {
 				regulator-name = "VALIVE_1.1V_C210";
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
-
 			};
 
 			vusb_reg: LDO3 {
@@ -706,14 +710,14 @@ CHARGER_TOPOFF {
 };
 
 &i2c_7 {
-	status = "okay";
+	pinctrl-0 = <&i2c7_bus>;
+	pinctrl-names = "default";
 
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <400000>;
 
-	pinctrl-0 = <&i2c7_bus>;
-	pinctrl-names = "default";
+	status = "okay";
 
 	magnetometer@c {
 		compatible = "asahi-kasei,ak8975";
@@ -724,8 +728,8 @@ magnetometer@c {
 };
 
 &pinctrl_0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sleep0>;
+	pinctrl-names = "default";
 
 	sleep0: sleep-state {
 		gpa0-0-pin {
@@ -822,36 +826,35 @@ tsp224_irq: tsp224-irq-pins {
 };
 
 &rtc {
-	status = "okay";
 	clocks = <&clock CLK_RTC>, <&pmic_ap_clk>;
 	clock-names = "rtc", "rtc_src";
-};
 
-&sdhci_0 {
 	status = "okay";
+};
 
+&sdhci_0 {
 	bus-width = <8>;
 	non-removable;
 	vmmc-supply = <&vemmc_reg>;
 
 	pinctrl-0 = <&sd0_clk>, <&sd0_cmd>, <&sd0_bus8>;
 	pinctrl-names = "default";
-};
 
-&sdhci_2 {
 	status = "okay";
+};
 
+&sdhci_2 {
 	bus-width = <4>;
 	cd-gpios = <&gpx3 4 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vtf_reg>;
 
 	pinctrl-0 = <&sd2_clk>, <&sd2_cmd>, <&sd2_bus4>;
 	pinctrl-names = "default";
-};
 
-&sdhci_3 {
 	status = "okay";
+};
 
+&sdhci_3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
@@ -861,8 +864,10 @@ &sdhci_3 {
 	mmc-pwrseq = <&wlan_pwrseq>;
 	vmmc-supply = <&vtf_reg>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd3_clk>, <&sd3_cmd>, <&sd3_bus4>;
+	pinctrl-names = "default";
+
+	status = "okay";
 
 	brcmf: wifi@1 {
 		compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
@@ -875,13 +880,13 @@ brcmf: wifi@1 {
 };
 
 &serial_0 {
-	status = "okay";
-
-	pinctrl-names = "default";
 	pinctrl-0 = <&bt_en>, <&bt_res>, <&uart0_data>, <&uart0_fctl>;
+	pinctrl-names = "default";
 
 	uart-has-rtscts;
 
+	status = "okay";
+
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
 

-- 
2.43.0

