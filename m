Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C8223D7E3;
	Sun, 28 Sep 2025 16:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759077859; cv=none; b=TWvR1eygnEKhWNlq3gL1rqpvrmSXp0I083ZNCJ2mr+SnrUp5/PsEhZab6f35yONjuvNg5GAMrMg7swfuXYUQEVR+c0oyagN1KG3PrP8oyPPMyP6pjkMPkH146c8w77iXu+aN18Dp9khJ6z7l+bzLZb8fXjCcN6JCDljMpT8rALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759077859; c=relaxed/simple;
	bh=w86NOsW0Cbf+VTX8MRLsVyM/yaK9FGz/4wyVUDsHUsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3JrX2KxY8q6P/HFRoFY6yFjaNK3U2ieY0AigREK/5IIoQnsiH7ZruxiVHIQ3lJn11sqYvVUrC+Pd3ia+f55f4dA9oZkdla1EWR+HQbS93g86GMPK0MOKggI5jOMTXe9WHzpEHGgjE9idG5FMSI74hVQTiRi1IyNUI8FN/rWUQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=FKM6Djmc; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="FKM6Djmc"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B8E5525F6E;
	Sun, 28 Sep 2025 18:44:15 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbXAEHv85tLz; Sun, 28 Sep 2025 18:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077855; bh=w86NOsW0Cbf+VTX8MRLsVyM/yaK9FGz/4wyVUDsHUsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FKM6DjmclFdyKFNBExwrVXgPoQH9s++4EAPf6PmYoYIUIgkwpGMpfh4+UJoF48hOY
	 I97tz1i9fAkmTwWuOGO9JJZdU8GB+Z/nlyh6fNcLXqCGkam7Ovmy6xHgUZJL6Tbhip
	 5wTdh20iJdJSWHf4ik9m8AS3ih8O/fdi/XME/7cUb7O99Dn3Em4kkR528Rnu3C4C8f
	 hLeIby4k+tjYdReeEjnInBRb7VLpdScErKq98oA6n4uFWf6I1ZkEDvdk/hRVPM5dqC
	 vfmWJDRWcznKhaibHhEks/I5BT0D7k/J+MD+ph39Modv0eQNS+OOfvkwX7JpjPUkVN
	 kXUA3m4T9Mr7Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 22:13:53 +0530
Subject: [PATCH 2/7] arm64: dts: exynos7870-a2corelte: relocate ${x}-names
 property after ${x}
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-dt-fixes-v1-2-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=3364;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=w86NOsW0Cbf+VTX8MRLsVyM/yaK9FGz/4wyVUDsHUsM=;
 b=z81gK6wOBDG4syoRHHSds/i3dtqU75Urih/ZAqRGxpRGILKqTsrEA3EAAh7ir0EXRPfc0DtkI
 Q2kAXdlRH4bDz3zGiGp7NONCrP4qOEJgufQt/PKz76cxd80v/FT/1jQ
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

All ${x}-names properties are conventionally placed after their
corresponding ${x} properties. For instance, 'clock-names' must follow
'clocks', 'interrupt-names' must follow 'interrupts'. Make necessary
changes to follow said convention. No functional changes made.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
index eb7b48593187409ce6653b7d857b63f6946aa4f7..f8a7610abeb77cab9f38aaf48d441d99ec61ab5f 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
@@ -47,8 +47,8 @@ gpio-keys {
 		compatible = "gpio-keys";
 		label = "GPIO Keys";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
 
 		key-power {
 			label = "Power Key";
@@ -140,8 +140,8 @@ pmic@66 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_irq>;
+		pinctrl-names = "default";
 
 		regulators {
 			vdd_buck1: buck1 {
@@ -379,8 +379,8 @@ accelerometer@1d {
 		interrupt-parent = <&gpa2>;
 		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&accel_irq>;
+		pinctrl-names = "default";
 
 		st,drdy-int-pin = <1>;
 	};
@@ -391,8 +391,8 @@ proximity@48 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <5 IRQ_TYPE_EDGE_BOTH>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&proxm_irq>;
+		pinctrl-names = "default";
 
 		proximity-near-level = <25>;
 	};
@@ -415,8 +415,8 @@ touchscreen@4b {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&touch_irq>;
+		pinctrl-names = "default";
 
 		vdd-supply = <&vdd_ldo35>;
 
@@ -441,8 +441,8 @@ rmi4-f12@12 {
 };
 
 &mmc0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
@@ -460,8 +460,8 @@ &mmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
+	pinctrl-names = "default";
 
 	mmc-pwrseq = <&pwrseq_mmc1>;
 
@@ -479,17 +479,17 @@ &mmc1 {
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
@@ -608,8 +608,8 @@ &serial1 {
 	bluetooth {
 		compatible = "brcm,bcm43430a1-bt";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&bt_btwake &bt_hostwake &bt_enable>;
+		pinctrl-names = "default";
 
 		device-wakeup-gpios = <&gpa1 2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpa1 6 GPIO_ACTIVE_HIGH>;

-- 
2.51.0

