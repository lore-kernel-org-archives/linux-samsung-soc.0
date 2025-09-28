Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824E723D7C8;
	Sun, 28 Sep 2025 16:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759077872; cv=none; b=ZK/sgvgmOgZV0Z4JOUQlaQtunClFVlc6MrgKCR65d/D/bbxYj23uptzxj+3TZC+YUGI8Mvwp228AEF3HlKr1TgHVrnvfdlANEVOhVSDyAN7+DaUPX6v10NdD9h0JihInZQp48gPDL+6GGj46VHH3PtxfruaQJoG1XBQ5ri/ye1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759077872; c=relaxed/simple;
	bh=UbPnHJf956rZTtuCLsmnXRg9ZzBiNla+b7VWRly7X50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MSWqoJJEWLDcxREsMHXaa6EwElc9qXuZCO2TPnyDli572F0Vs/hTc/BUZMjwYlKNHcE7QpK7Sjok/r0CnfMPr5GojCDZj8X7OVc3oiPXfGJcyNfiHrfF+vVgD1TAasqUr07XDpMdoIOeT8/fFSA1CWre1V+kOUHFUj/2IDeMu7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=WDm1Gy3V; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="WDm1Gy3V"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4C3E225F6E;
	Sun, 28 Sep 2025 18:44:29 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpWCGwt25lt2; Sun, 28 Sep 2025 18:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077868; bh=UbPnHJf956rZTtuCLsmnXRg9ZzBiNla+b7VWRly7X50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WDm1Gy3VYFTqwFfhm0pakU1sBUzZXUxpwTq4vxQPeKczZg9vM8y7GVTvd8rAvzBUO
	 npRYkCiCigcHMaaqX+knxUxQrivggI2gEteZuN4vhVkilwcVYwjL+R7gLu551+rQoR
	 YphJNwPfI/VzPu7u7T1N99uN/ZOEES05TgPjmNj/l/p+1cExOGnHTnz0mMNK8HDVdO
	 EmyjcZ7Fs9i0UOwQbQOm5KVNA9bmKuRzBX1blofFbg+JmXH35toLkvw7yeF4n+uvlB
	 HHKR1nJNnXqrK36G/AinGSIa9E6mRj+WLJxxnt5DH768qXbznxAY+w7IiQLlXXpEVP
	 E7Sz16VOSH4vQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 22:13:55 +0530
Subject: [PATCH 4/7] arm64: dts: exynos7870-on7xelte: relocate ${x}-names
 property after ${x}
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-dt-fixes-v1-4-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=3400;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=UbPnHJf956rZTtuCLsmnXRg9ZzBiNla+b7VWRly7X50=;
 b=fYDg693vp5Xw8QFXe9ZhGEa7QFh5dp0xJyUgp7qsfXL6wqKWzu4vQSDNCrPWN61RYf+ypVJqJ
 FDCbhzHyEqaDghxz5x0HO0xbeLPbsfAn+MuomqDUWklJNS+EXe+A7Dq
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

All ${x}-names properties are conventionally placed after their
corresponding ${x} properties. For instance, 'clock-names' must follow
'clocks', 'interrupt-names' must follow 'interrupts'. Make necessary
changes to follow said convention. No functional changes made.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index b1d9eff5a82702cd7c9797b2124486207e03ad89..66413a9506276cca8925e644c0e857fb5c48112d 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
@@ -47,8 +47,8 @@ gpio-keys {
 		compatible = "gpio-keys";
 		label = "GPIO Keys";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&key_home &key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
 
 		key-home {
 			label = "Home Key";
@@ -139,8 +139,8 @@ pmic@66 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_irq>;
+		pinctrl-names = "default";
 
 		regulators {
 			vdd_buck1: buck1 {
@@ -385,8 +385,8 @@ touchscreen@70 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&touch_irq>;
+		pinctrl-names = "default";
 
 		syna,reset-delay-ms = <200>;
 		syna,startup-delay-ms = <200>;
@@ -423,8 +423,8 @@ accelerometer@1d {
 		interrupt-parent = <&gpa2>;
 		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&accel_irq>;
+		pinctrl-names = "default";
 
 		mount-matrix = "1",  "0",  "0",
 			       "0", "-1",  "0",
@@ -449,16 +449,16 @@ proximity@48 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <5 IRQ_TYPE_EDGE_BOTH>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&proxm_irq>;
+		pinctrl-names = "default";
 
 		proximity-near-level = <25>;
 	};
 };
 
 &mmc0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
@@ -476,8 +476,8 @@ &mmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
+	pinctrl-names = "default";
 
 	mmc-pwrseq = <&pwrseq_mmc1>;
 
@@ -495,17 +495,17 @@ &mmc1 {
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
@@ -640,8 +640,8 @@ &serial1 {
 	bluetooth {
 		compatible = "brcm,bcm43430a1-bt";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&bt_btwake &bt_hostwake &bt_enable>;
+		pinctrl-names = "default";
 
 		device-wakeup-gpios = <&gpa1 2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpa1 6 GPIO_ACTIVE_HIGH>;

-- 
2.51.0

