Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013010.outbound.protection.outlook.com [40.107.162.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743144A5EC6;
	Sun,  4 Oct 2026 20:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145042; cv=fail; b=aM5my10ox4dEyJf3dN6tgno9fcwK5D6b4xLSJeiz5ZKPrsmxFUq6iyGyVg5weBIFsZFjfK0d/AKdE4Kuhn2SMCmO9GERj2PEw+h4C0Xaq0GytLdU5D3QCwxTzdBpzIGR35G1uVZ1ZEFF9nutLecVRWGgE9/jG05umzGfk1uc4Ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145042; c=relaxed/simple;
	bh=sp8AdmTP7L0sIZbAZ8efyJOCnoaHOUGBoQhzMik887E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Z9pntA7yOU1YW9hWJyhrMUUa/DwoQNKXCbYWXIcRkkHQg1oaypV6+C7/zwk912oz5oLANpczVFZVG0GeZq+0J7Y2G6c54jOM8nB/KYSEdhWtPhc/sDeCeKItQhWpknhyB64qzO8SY44nE0AfYuuMh1Ux7afVp4mQAr8Om+BUFTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=cbKKXQ4Y; arc=fail smtp.client-ip=40.107.162.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="cbKKXQ4Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=it6ImxvE+wAudIUq0krcnZxBk0uPVD3thsyVQRzOCAKzByOUaodyR7kzoHWjM5ztj0g0eEw0jKsZ5I5aDkupGlJM737i7MLUPVg1mxJQk465vzxHwu/yuPIWqnXcd4w8SM7kt5ToF9L9VCjCe5G6vIRa5HGTNXEqefwncC4DCxvzioDzWhGco59A6YFBn/bDFuGTMGjYprxZkLSqwcoAIvOiL2YcI7FLt1m53EvewJT6PG+KQed3Pq5m2NkaNCPMa0Hj5wQBVFXQwucssmGxOUzV7D0CuvoyO+yPaqYG2HmJxakBmSOc3D8WBE5985KNLmzKuZaEmDKiow4JLC/xBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHi5SSwNyA40AkhdeSQQY3wYjSyoS+jBUwAoUpuM9gM=;
 b=hnTVzPgsQijzKBCN5lwNQc98h+Emia5Qb7pvT6M9su9LVtb8XPK2Pa0IW/ZMuHtbN8BC9WWA2X9HEoPvy00btvujJauyD/56AwRF4xbltTZcMWtUSeFuzdjhAlSM14pm2KVXNPRpurJRhzJ3On4eay+2XD9eUcqT64QGVmAXwFINSTwDA9ogx92O4yxRxZP+U8+d2snRpjaO7mPEGpKWXf5S4hfBrKXvVSvPIjfnYwdogN8BUfwTTuNk0fs0wSEx5DXNLf6QigV4uZQQ368BnWqc9nwZAt2zoEWltnxmzYtfPiwOOfPOX5+WFQ5z0q3g+eIsI7vR5OcHMmFbivDxZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHi5SSwNyA40AkhdeSQQY3wYjSyoS+jBUwAoUpuM9gM=;
 b=cbKKXQ4Y/PCW3k1AwecGEFMIZkg3X+Ust23dBZ0h2CEEF+z41mdNXc1YOtCYyk2Xhne1+oZkLGVqfqiql7OxQBXIv72383gjq6V35kyFhb9LgIMOq6kzf7OkCqQbYic2wMw+snlCtbtvSxlmp0GCZanmmycE67jfCLxq4Yb/2Po=
Received: from DUZPR01CA0299.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::10) by PAXPR02MB7310.eurprd02.prod.outlook.com
 (2603:10a6:102:1c5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Sun, 4 Oct
 2026 20:17:15 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::a5) by DUZPR01CA0299.outlook.office365.com
 (2603:10a6:10:4b7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:15 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8859C4CEB;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id 20CC1803CDCE; Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:11 +0200
Subject: [PATCH 14/17] ARM: dts: samsung: exynos4210-universal_c210: sort
 properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-14-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8101;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=sp8AdmTP7L0sIZbAZ8efyJOCnoaHOUGBoQhzMik887E=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqwrQ/FSWiFCqiNrK4IJQky9bwsvLD8ke82qv5m
 7DtugRCKgiJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCasK0PwAKCRCwB25JC3Fh
 a4/bB/4wYNxOl9g4Pd7GeHncNpl72o5kk28g9XZ1dulQuO9Wqx836sfK/k4cdAGy2Tf3/Sd7nX2
 ia1JKxKL6Wp5VsZXXEJBMDO7UonhxXSRIfDwR601O2hV29oj6NZQqarMrQQsfPspv8jS4BSle3J
 fS/u+Rf0LspC2PhYUYcg3dvpE856PKS0836MW/FuY8lwozTHc5V4efrkjdehynj44LD/o6fIbFw
 UtkBwrxllayggVZ+bNFDp4wG2kJ1iLQXGPEI+4kfa3NQzi9Xvo/4/D81lAQ5qe+BwJ/ZfPaqEF8
 7SitZinbz9JNqfR8jd3BkxpQlXCfwr4q+7w3+jN/gqYBNVU9
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|PAXPR02MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: d83adf7a-7376-4900-92fc-08df22547b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|30052699003|1800799024|82310400026|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n0za9vMd3EJ3YL4hnGU7TYtziTX4dIWCZ1dutF5yCwZO9GIu+2dgZtF6b2ygy+qV6qSHntXo1PpMjdQbKl152Q2WBcUT8/z6VK0W+r8i5k9CjcNdIGnEf2K8KOOuf1yDgsKyhpTwyIhxFhpqguYnYHHsxfJSvYWl6cdywszhuEfauZnQg5UBxsNjo04v7XmTGFeNFaLozOST8eDT/YuLEKXpFKarBM6o53zSN8ShFDyBWgTj+e0I1EkRwrK4+xWl6qb8Aq0eIZtYbaUHxc6bGcHhpRcOlNzZsEg6UjtLmtVzUG5YiZLb+aLrfaEXT5OClrpoGtzVSUsxdXrlFAhHklCeiF+Grtuhm+ADGJtqJ5n4NLRFzuYPpcmNgroy0H3JcWpZNMZ/f+/g9lyRIY8Ll9tTkVivyTkX+yzr9k9DksKEBQ7hhZnnaCu5KZ/V7JnR9eJq2wGv7qy8lVnxs/5Bt3XzpiiLFo1mIKx17uFVXW9Nnxs3SEicQFfijk4D6q3m7FN7XxL/4iinhVJOKBMSR/hVnUHTsdRQgmresZv2LddDHQ+ZWS/dmHn2AZ4lbZPYyduM4TEj3awIVbJ3bpoVvCyLe2l6WwFhTE+6UDRu66Q589oHsd9mfnernioXgWs2SZCgzQFVd9XPPFASrCWL/bzQttyAZi6Rq/cuJ8k32exTEW0aIaxs1LSkwhAT4uhvu5RNyyQhfTyEX2z0mQWQdA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(30052699003)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AeqiVvaroegt1ExLaLhvdy4p4kZJQty9zmS/UYJu/MPwUWiYmGQXNnACR6pOKfy61mUHmjJfZmJM91NkqQfjhCfbRSnsu4cxyAP7AdVJWXF9nXZbRjZ0vyA7rxROWDT41sCSwUcaAxfXVHyQEZNxKKiQlJ7ddCnc3RpQpi2iLE0ksmp9dBv6PElPsed7/76/tT+Akxl5agFXgiNEW5tLLXLYnh6orpExWJ8ZZX4ZhhgRXwsdxeiu/4nB443DNN70mKr3P70SWSAO2Ff5CNT0Zqf40N4HmTuqUTIJbagJy+rIwRSU+2VIz5ZIxRambiRZkCwHPr7Q9Mmx0YXZ5XcScDsPThqK6nmL+l6gwknCLZtGb6flBH33PCgLbmuJ8B4BmqfEoa0Ii0H5erxwKwCovpwzSONmez7tQe50CcVrfQ6w4jxrpkAfUGXQxYpksaUQ
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:15.0470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d83adf7a-7376-4900-92fc-08df22547b4a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7310

And add or delete newlines where applicable, and sort properties
according to the preferred style. Fixes warnings from dt-check-style
in strict mode like:

  samsung/exynos4210-universal_c210.dts:338: [property-order] property 'pinctrl-0' out of canonical order (should sort before 'samsung,i2c-max-bus-freq')
  samsung/exynos4210-universal_c210.dts:340: [required-blank-lines] "status" must be preceded by a blank line

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 .../boot/dts/samsung/exynos4210-universal_c210.dts | 91 ++++++++++++++--------
 1 file changed, 57 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
index 744039068e8f..bcc636adba91 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
@@ -74,46 +74,46 @@ gpio-keys {
 
 		vol-up-key {
 			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
-			linux,code = <115>;
 			label = "volume up";
 			debounce-interval = <1>;
+			linux,code = <115>;
 		};
 
 		vol-down-key {
 			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
-			linux,code = <114>;
 			label = "volume down";
 			debounce-interval = <1>;
+			linux,code = <114>;
 		};
 
 		config-key {
 			gpios = <&gpx2 2 GPIO_ACTIVE_LOW>;
-			linux,code = <171>;
 			label = "config";
 			debounce-interval = <1>;
 			wakeup-source;
+			linux,code = <171>;
 		};
 
 		camera-key {
 			gpios = <&gpx2 3 GPIO_ACTIVE_LOW>;
-			linux,code = <212>;
 			label = "camera";
 			debounce-interval = <1>;
+			linux,code = <212>;
 		};
 
 		power-key {
 			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
-			linux,code = <116>;
 			label = "power";
 			debounce-interval = <1>;
 			wakeup-source;
+			linux,code = <116>;
 		};
 
 		ok-key {
 			gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
-			linux,code = <352>;
 			label = "ok";
 			debounce-interval = <1>;
+			linux,code = <352>;
 		};
 	};
 
@@ -147,6 +147,7 @@ lcd@0 {
 			reset-delay = <10>;
 			panel-width-mm = <90>;
 			panel-height-mm = <154>;
+
 			display-timings {
 				timing {
 					clock-frequency = <23492370>;
@@ -164,6 +165,7 @@ timing {
 					pixelclk-active = <0>;
 				};
 			};
+
 			port {
 				lcd_ep: endpoint {
 					remote-endpoint = <&fimd_dpi_ep>;
@@ -185,12 +187,13 @@ hdmi_ddc: i2c-ddc {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpe4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpe4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-		i2c-gpio,delay-us = <100>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
 		pinctrl-0 = <&i2c_ddc_bus>;
 		pinctrl-names = "default";
+		i2c-gpio,delay-us = <100>;
+
 		status = "okay";
 	};
 };
@@ -209,6 +212,7 @@ map0 {
 			/* Corresponds to 800MHz */
 			cooling-device = <&cpu0 2 2>;
 		};
+
 		map1 {
 			/* Corresponds to 200MHz */
 			cooling-device = <&cpu0 4 4>;
@@ -217,58 +221,67 @@ map1 {
 };
 
 &ehci {
-	status = "okay";
 	phys = <&exynos_usbphy 1>;
 	phy-names = "host";
+
+	status = "okay";
 };
 
 &exynos_usbphy {
-	status = "okay";
 	vbus-supply = <&safeout1_reg>;
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
 	assigned-clock-rates = <0>, <160000000>;
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
 	pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
 	pinctrl-names = "default";
-	status = "okay";
-	samsung,invert-vden;
-	samsung,invert-vclk;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	samsung,invert-vden;
+	samsung,invert-vclk;
+
+	status = "okay";
+
 	port@3 {
 		reg = <3>;
+
 		fimd_dpi_ep: endpoint {
 			remote-endpoint = <&lcd_ep>;
 		};
@@ -277,18 +290,20 @@ fimd_dpi_ep: endpoint {
 
 &gpu {
 	mali-supply = <&buck2_reg>;
+
 	status = "okay";
 };
 
 &hdmi {
 	hpd-gpios = <&gpx3 7 GPIO_ACTIVE_HIGH>;
-	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_hpd>;
+	pinctrl-names = "default";
 	hdmi-en-supply = <&hdmi_en>;
 	vdd-supply = <&ldo3_reg>;
 	vdd_osc-supply = <&ldo4_reg>;
 	vdd_pll-supply = <&ldo3_reg>;
 	ddc = <&hdmi_ddc>;
+
 	status = "okay";
 };
 
@@ -296,15 +311,17 @@ &hsotg {
 	vusb_d-supply = <&ldo3_reg>;
 	vusb_a-supply = <&ldo8_reg>;
 	dr_mode = "peripheral";
+
 	status = "okay";
 };
 
 &i2c_3 {
+	pinctrl-0 = <&i2c3_bus>;
+	pinctrl-names = "default";
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
-	pinctrl-0 = <&i2c3_bus>;
-	pinctrl-names = "default";
+
 	status = "okay";
 
 	tsp@4a {
@@ -314,17 +331,24 @@ tsp@4a {
 };
 
 &i2c_5 {
+	pinctrl-0 = <&i2c5_bus>;
+	pinctrl-names = "default";
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-slave-addr = <0x10>;
 	samsung,i2c-max-bus-freq = <100000>;
-	pinctrl-0 = <&i2c5_bus>;
-	pinctrl-names = "default";
+
 	status = "okay";
 
 	vdd_arm_reg: pmic@60 {
 		compatible = "maxim,max8952";
 		reg = <0x60>;
 
+		regulator-name = "VARM_1.2V_C210";
+		regulator-min-microvolt = <770000>;
+		regulator-max-microvolt = <1400000>;
+		regulator-always-on;
+		regulator-boot-on;
+
 		max8952,vid-gpios = <&gpx0 3 GPIO_ACTIVE_HIGH>,
 				    <&gpx0 4 GPIO_ACTIVE_HIGH>;
 		max8952,default-mode = <0>;
@@ -332,20 +356,14 @@ vdd_arm_reg: pmic@60 {
 						<1050000>, <950000>;
 		max8952,sync-freq = <0>;
 		max8952,ramp-speed = <0>;
-
-		regulator-name = "VARM_1.2V_C210";
-		regulator-min-microvolt = <770000>;
-		regulator-max-microvolt = <1400000>;
-		regulator-always-on;
-		regulator-boot-on;
 	};
 
 	pmic@66 {
 		compatible = "national,lp3974";
+		reg = <0x66>;
 		interrupts-extended = <&gpx0 7 0>, <&gpx2 7 0>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&lp3974_irq>;
-		reg = <0x66>;
+		pinctrl-names = "default";
 
 		max8998,pmic-buck1-default-dvs-idx = <0>;
 		max8998,pmic-buck1-dvs-gpios = <&gpx0 5 GPIO_ACTIVE_HIGH>,
@@ -576,13 +594,15 @@ i2c_ddc_bus: i2c-ddc-bus-pins {
 
 &pwm {
 	compatible = "samsung,s5p6440-pwm";
+
 	status = "okay";
 };
 
 &rtc {
-	status = "okay";
 	clocks = <&clock CLK_RTC>, <&pmic_ap_clk>;
 	clock-names = "rtc", "rtc_src";
+
+	status = "okay";
 };
 
 &sdhci_0 {
@@ -591,6 +611,7 @@ &sdhci_0 {
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus8>;
 	pinctrl-names = "default";
 	vmmc-supply = <&vemmc_reg>;
+
 	status = "okay";
 };
 
@@ -600,12 +621,11 @@ &sdhci_2 {
 	pinctrl-names = "default";
 	vmmc-supply = <&ldo5_reg>;
 	cd-gpios = <&gpx3 4 GPIO_ACTIVE_LOW>;
+
 	status = "okay";
 };
 
 &sdhci_3 {
-	status = "okay";
-
 	#address-cells = <1>;
 	#size-cells = <0>;
 
@@ -615,8 +635,10 @@ &sdhci_3 {
 	mmc-pwrseq = <&wlan_pwrseq>;
 	vmmc-supply = <&ldo5_reg>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd3_clk>, <&sd3_cmd>, <&sd3_bus4>;
+	pinctrl-names = "default";
+
+	status = "okay";
 
 	brcmf: wifi@1 {
 		compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
@@ -628,7 +650,6 @@ brcmf: wifi@1 {
 };
 
 &serial_0 {
-	status = "okay";
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	pinctrl-0 = <&uart0_data &uart0_fctl>;
@@ -636,6 +657,8 @@ &serial_0 {
 
 	uart-has-rtscts;
 
+	status = "okay";
+
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
 

-- 
2.43.0

