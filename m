Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570B623C4FF;
	Sun, 28 Sep 2025 16:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759077867; cv=none; b=FCbY9JhCytPUA0d+uU2abG4mNgw8siceNgpZLHNYdnU0+COqvlA+QBSOqjpKV4FD/xrlJ4XMvxI667hn2AWiB5njfsOnogVLLe0qvFR3nnsHh2buUkUxW16bqroEIAIICqLl5NfvlRAqjH0l2WQJPE+1xZ8A0IaAk30qbfSlSLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759077867; c=relaxed/simple;
	bh=W7tJnP95hyUEWGNcPwAbe7Oj2n+1XQRFsX/DmSwFBAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdGYJZpbYNPAZN2IzvCleE7NFswPQxTLMSuDtfL0wjH0s8PQbl2XNOxw9rIUcWUOX8SeFILn3eDI6laHHUFTarfJ25QQaZcVVIjIeRyQ8VBsd1JeH/CXcR2FUBi8Mnq1meMEdC7B7wdKboafR/liHiQLi7zqdPYgsEMpl4GubmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HQvgaoTi; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HQvgaoTi"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 833AB25F6E;
	Sun, 28 Sep 2025 18:44:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1oXz3zQtE9i; Sun, 28 Sep 2025 18:44:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077863; bh=W7tJnP95hyUEWGNcPwAbe7Oj2n+1XQRFsX/DmSwFBAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HQvgaoTipU32grUZI7A7bEOhLg12tZ6IhoCEXy8odnpxxm6DjEt2f3a3DObcYPVWL
	 e08bPa17JxXY+kJJIQ+AHfsBDGNa1twrd9lGyyGmfh+ZZyMXDh5A+jn4vXpncsHnxz
	 JDNYfLeGefI3fIAbhZJ2qSNzbibKuCJOLH6sbwFsVWqnyiGBSPY9gYQsAAHl6Z6dDA
	 gEHfpXYuW2/igx0gg2DbaKwzRyc4YZ2viyn0lp/8ZIL9Yzm5x9mvYE9qbQyLJ74MNz
	 yqsVLCsjLcW1WuuWgGCsaJBEZ1TPFDU/sk6B6N1y1Vb1/C7p0ngDNs34DwvlTiMFp7
	 jZrYu5aw2LVJw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 22:13:54 +0530
Subject: [PATCH 3/7] arm64: dts: exynos7870-j6lte: relocate ${x}-names
 property after ${x}
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-dt-fixes-v1-3-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=3458;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=W7tJnP95hyUEWGNcPwAbe7Oj2n+1XQRFsX/DmSwFBAo=;
 b=VYquYavS5dw58+dRSsHgr0zW6A3A/hWh4xitfihLdzdiBiaLvKR7b5eW/+gcpoqymmyJPjSZB
 E18+vHIO2aBAsMuuOf5nnyOB/5+hid96eg1/K/IgK56Z7c/A97YE/pX
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

All ${x}-names properties are conventionally placed after their
corresponding ${x} properties. For instance, 'clock-names' must follow
'clocks', 'interrupt-names' must follow 'interrupts'. Make necessary
changes to follow said convention. No functional changes made.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index b8ce433b93b1b488da31bbe4846f8092243611ad..b2990b5466c949c18a61d1b1c4427986b19804ba 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -47,8 +47,8 @@ gpio-hall-effect-sensor {
 		compatible = "gpio-keys";
 		label = "GPIO Hall Effect Sensor";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&hall_irq>;
+		pinctrl-names = "default";
 
 		event-hall-effect-sensor {
 			label = "Hall Effect Sensor";
@@ -64,8 +64,8 @@ gpio-keys {
 		compatible = "gpio-keys";
 		label = "GPIO Keys";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
 
 		key-power {
 			label = "Power Key";
@@ -149,8 +149,8 @@ pmic@66 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_irq>;
+		pinctrl-names = "default";
 
 		regulators {
 			vdd_buck1: buck1 {
@@ -387,8 +387,8 @@ accelerometer@1d {
 		interrupt-parent = <&gpa2>;
 		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&accel_irq>;
+		pinctrl-names = "default";
 
 		mount-matrix = "-1", "0",  "0",
 				"0", "1",  "0",
@@ -413,8 +413,8 @@ touchscreen@20 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&touch_irq>;
+		pinctrl-names = "default";
 
 		touchscreen-size-x = <720>;
 		touchscreen-size-y = <1480>;
@@ -424,8 +424,8 @@ touchscreen@20 {
 };
 
 &mmc0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
@@ -443,8 +443,8 @@ &mmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
+	pinctrl-names = "default";
 
 	mmc-pwrseq = <&pwrseq_mmc1>;
 
@@ -462,17 +462,17 @@ &mmc1 {
 	wifi@1 {
 		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac";
 		reg = <0x1>;
-		interrupt-names = "host-wake";
 		interrupt-parent = <&gpa2>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "host-wake";
 
 		reset-gpios = <&gpd3 6 GPIO_ACTIVE_LOW>;
 	};
 };
 
 &mmc2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4 &dwmmc2_irq>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_fixed_mmc2>;
 	vqmmc-supply = <&vdd_ldo2>;
@@ -591,8 +591,8 @@ &serial1 {
 	bluetooth {
 		compatible = "brcm,bcm43430a1-bt";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&bt_btwake &bt_hostwake &bt_enable>;
+		pinctrl-names = "default";
 
 		device-wakeup-gpios = <&gpa1 2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpa1 6 GPIO_ACTIVE_HIGH>;

-- 
2.51.0

