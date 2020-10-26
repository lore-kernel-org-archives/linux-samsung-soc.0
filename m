Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE50C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:15:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 326D2223B0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603736154;
	bh=CRjVsMnbVh0Z0NWs93VYFmdb0Fqq2fx2co2oT6Juf/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=E3K2xD8RZC9HOZlVQCtAcQIj9WJOV0VaeOvfwi5HHJTKpy5rQVCxp5BhCrwSWxtJ5
	 qeokFAEefCvTOwmFmdT2fwfxDawyUTqRk7HboV1om3giTORFVuWYbJ5MP7q3c3XCQ1
	 9YcY7IQ2EtOE6k39IqEvnoakaEeVFF0evma6vt08=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1789368AbgJZSPx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:15:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:59332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1789364AbgJZSPw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:15:52 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1BFB22265;
        Mon, 26 Oct 2020 18:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603736150;
        bh=CRjVsMnbVh0Z0NWs93VYFmdb0Fqq2fx2co2oT6Juf/U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BgiQqFSO8LSWdb5oHD6XN7AxvmwjmC4PuCm8uZLSjTfzpXBYUftnyiYmkzG+RnbMF
         C/g2IOHJkGjEuKI3mTRFyF6HnT7KJIQrW94xQOYWEEaNp8HJUfqBT7uX8USf4IwgL8
         AT6D1UhjZYMOuWrBnPXfNFJQfuypCTn2wHCXGP+E=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 04/12] ARM: dts: exynos: adjust node names to DT spec in Exynos4412 boards
Date:   Mon, 26 Oct 2020 19:15:20 +0100
Message-Id: <20201026181528.163143-5-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026181528.163143-1-krzk@kernel.org>
References: <20201026181528.163143-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Devicetree specification expects device node names to have a generic
name, representing the class of a device.  Also the convention for node
names is to use hyphens, not underscores.

No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi   |  8 ++++----
 arch/arm/boot/dts/exynos4412-itop-elite.dts   |  2 +-
 .../boot/dts/exynos4412-itop-scp-core.dtsi    |  2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi       | 12 +++++------
 arch/arm/boot/dts/exynos4412-n710x.dts        |  2 +-
 .../boot/dts/exynos4412-odroid-common.dtsi    |  8 ++++----
 arch/arm/boot/dts/exynos4412-odroidx.dts      |  4 ++--
 arch/arm/boot/dts/exynos4412-origen.dts       | 14 ++++++-------
 arch/arm/boot/dts/exynos4412-smdk4412.dts     | 20 +++++++++----------
 9 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index 89ed81fb348d..db91678f5648 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -15,7 +15,7 @@ aliases {
 		i2c10 = &i2c_cm36651;
 	};
 
-	aat1290 {
+	led-controller {
 		compatible = "skyworks,aat1290";
 		flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
 		enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
@@ -60,7 +60,7 @@ i2c_ak8975: i2c-gpio-0 {
 		#size-cells = <0>;
 		status = "okay";
 
-		ak8975@c {
+		magnetometer@c {
 			compatible = "asahi-kasei,ak8975";
 			reg = <0x0c>;
 			gpios = <&gpj0 7 GPIO_ACTIVE_HIGH>;
@@ -75,7 +75,7 @@ i2c_cm36651: i2c-gpio-2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cm36651@18 {
+		sensor@18 {
 			compatible = "capella,cm36651";
 			reg = <0x18>;
 			interrupt-parent = <&gpx0>;
@@ -133,7 +133,7 @@ timing-0 {
 };
 
 &i2c_3 {
-	mms114-touchscreen@48 {
+	touchscreen@48 {
 		compatible = "melfas,mms114";
 		reg = <0x48>;
 		interrupt-parent = <&gpm2>;
diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index f6d0a5f5d339..3063e44fcbcc 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -175,7 +175,7 @@ &i2c_4 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	codec: wm8960@1a {
+	codec: codec@1a {
 		compatible = "wlf,wm8960";
 		reg = <0x1a>;
 		clocks = <&pmu_system_controller 0>;
diff --git a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
index dfceb155b3a7..4583d342af39 100644
--- a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
+++ b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
@@ -134,7 +134,7 @@ &i2c_1 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	s5m8767: s5m8767-pmic@66 {
+	s5m8767: pmic@66 {
 		compatible = "samsung,s5m8767-pmic";
 		reg = <0x66>;
 
diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 7e7c243ff196..52a4f6e6c7f2 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -220,7 +220,7 @@ i2c_max77693_fuel: i2c-gpio-3 {
 		#size-cells = <0>;
 		status = "okay";
 
-		max77693-fuel-gauge@36 {
+		fuel-gauge@36 {
 			compatible = "maxim,max17047";
 			interrupt-parent = <&gpx2>;
 			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
@@ -550,7 +550,7 @@ &i2c_0 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	s5c73m3: s5c73m3@3c {
+	s5c73m3: sensor@3c {
 		compatible = "samsung,s5c73m3";
 		reg = <0x3c>;
 		xshutdown-gpios = <&gpf1 3 GPIO_ACTIVE_LOW>; /* ISP_RESET */
@@ -577,7 +577,7 @@ &i2c1_isp {
 	pinctrl-0 = <&fimc_is_i2c1>;
 	pinctrl-names = "default";
 
-	s5k6a3@10 {
+	sensor@10 {
 		compatible = "samsung,s5k6a3";
 		reg = <0x10>;
 		svdda-supply = <&cam_io_reg>;
@@ -616,7 +616,7 @@ &i2c_4 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	wm1811: wm1811@1a {
+	wm1811: codec@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
 		clocks = <&pmu_system_controller 0>,
@@ -665,7 +665,7 @@ &i2c_7 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	max77686: max77686_pmic@9 {
+	max77686: pmic@9 {
 		compatible = "maxim,max77686";
 		interrupt-parent = <&gpx0>;
 		interrupts = <7 IRQ_TYPE_NONE>;
@@ -1407,7 +1407,7 @@ &spi_1 {
 	cs-gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
-	s5c73m3_spi: s5c73m3@0 {
+	s5c73m3_spi: sensor@0 {
 		compatible = "samsung,s5c73m3";
 		spi-max-frequency = <50000000>;
 		reg = <0>;
diff --git a/arch/arm/boot/dts/exynos4412-n710x.dts b/arch/arm/boot/dts/exynos4412-n710x.dts
index a47b7f35fc80..c49dbb7847b8 100644
--- a/arch/arm/boot/dts/exynos4412-n710x.dts
+++ b/arch/arm/boot/dts/exynos4412-n710x.dts
@@ -45,7 +45,7 @@ &i2c_3 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	mms152-touchscreen@48 {
+	touchscreen@48 {
 		compatible = "melfas,mms152";
 		reg = <0x48>;
 		interrupt-parent = <&gpm2>;
diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index c3b6e6d367ab..3dcd7f7f10f3 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -27,7 +27,7 @@ gpio_keys: gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_power_key>;
 
-		power_key {
+		power-key {
 			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 			label = "power key";
@@ -171,7 +171,7 @@ cooling_map1: map1 {
 };
 
 &pinctrl_1 {
-	gpio_power_key: power_key {
+	gpio_power_key: power-key {
 		samsung,pins = "gpx1-3";
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
@@ -266,7 +266,7 @@ &i2c_0 {
 	samsung,i2c-max-bus-freq = <400000>;
 	status = "okay";
 
-	usb3503: usb3503@8 {
+	usb3503: usb-hub@8 {
 		compatible = "smsc,usb3503";
 		reg = <0x08>;
 
@@ -492,7 +492,7 @@ buck8_reg: BUCK8 {
 
 &i2c_1 {
 	status = "okay";
-	max98090: max98090@10 {
+	max98090: codec@10 {
 		compatible = "maxim,max98090";
 		reg = <0x10>;
 		interrupt-parent = <&gpx0>;
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 68fe88074d1d..46381e9097f4 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -36,7 +36,7 @@ led2 {
 		};
 	};
 
-	regulator_p3v3 {
+	regulator-1 {
 		compatible = "regulator-fixed";
 		regulator-name = "p3v3_en";
 		regulator-min-microvolt = <3300000>;
@@ -81,7 +81,7 @@ &mshc_0 {
 };
 
 &pinctrl_1 {
-	gpio_home_key: home_key {
+	gpio_home_key: home-key {
 		samsung,pins = "gpx2-2";
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index c2e793b69e7d..e1f6de53e20e 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -116,7 +116,7 @@ &i2c_0 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	s5m8767_pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s5m8767-pmic";
 		reg = <0x66>;
 
@@ -453,37 +453,37 @@ &keypad {
 	pinctrl-names = "default";
 	status = "okay";
 
-	key_home {
+	key-home {
 		keypad,row = <0>;
 		keypad,column = <0>;
 		linux,code = <KEY_HOME>;
 	};
 
-	key_down {
+	key-down {
 		keypad,row = <0>;
 		keypad,column = <1>;
 		linux,code = <KEY_DOWN>;
 	};
 
-	key_up {
+	key-up {
 		keypad,row = <1>;
 		keypad,column = <0>;
 		linux,code = <KEY_UP>;
 	};
 
-	key_menu {
+	key-menu {
 		keypad,row = <1>;
 		keypad,column = <1>;
 		linux,code = <KEY_MENU>;
 	};
 
-	key_back {
+	key-back {
 		keypad,row = <2>;
 		keypad,column = <0>;
 		linux,code = <KEY_BACK>;
 	};
 
-	key_enter {
+	key-enter {
 		keypad,row = <2>;
 		keypad,column = <1>;
 		linux,code = <KEY_ENTER>;
diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index 49971203a8aa..cc99b955af0c 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -71,61 +71,61 @@ &keypad {
 	pinctrl-names = "default";
 	status = "okay";
 
-	key_1 {
+	key-1 {
 		keypad,row = <1>;
 		keypad,column = <3>;
 		linux,code = <2>;
 	};
 
-	key_2 {
+	key-2 {
 		keypad,row = <1>;
 		keypad,column = <4>;
 		linux,code = <3>;
 	};
 
-	key_3 {
+	key-3 {
 		keypad,row = <1>;
 		keypad,column = <5>;
 		linux,code = <4>;
 	};
 
-	key_4 {
+	key-4 {
 		keypad,row = <1>;
 		keypad,column = <6>;
 		linux,code = <5>;
 	};
 
-	key_5 {
+	key-5 {
 		keypad,row = <1>;
 		keypad,column = <7>;
 		linux,code = <6>;
 	};
 
-	key_A {
+	key-A {
 		keypad,row = <2>;
 		keypad,column = <6>;
 		linux,code = <30>;
 	};
 
-	key_B {
+	key-B {
 		keypad,row = <2>;
 		keypad,column = <7>;
 		linux,code = <48>;
 	};
 
-	key_C {
+	key-C {
 		keypad,row = <0>;
 		keypad,column = <5>;
 		linux,code = <46>;
 	};
 
-	key_D {
+	key-D {
 		keypad,row = <2>;
 		keypad,column = <5>;
 		linux,code = <32>;
 	};
 
-	key_E {
+	key-E {
 		keypad,row = <0>;
 		keypad,column = <7>;
 		linux,code = <18>;
-- 
2.25.1

