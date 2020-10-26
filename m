Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EE9C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:16:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4C2022265
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603736171;
	bh=JYyAJhlDPJkkYbJmZ0J4rK4VdyIpnk9gH2Y0/imlJjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=x0zQWjyndHTCYAG3ym3A0QTzV4wI8LpUKY4bR7DcW/hIWwiDZ0a0lU2RunYfSK940
	 bV6KxEWX6yPSJ8V5DevaEhOej7aLy1UFsWrfnxCvN97c4G9Zk9oRboJKsr/he2TMP5
	 2OstkHiWzIJ77YiSyi6AThYnsTO0ZZtlFviy186I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1789407AbgJZSQG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:16:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:59602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1789400AbgJZSQE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:16:04 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 92B4C2087C;
        Mon, 26 Oct 2020 18:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603736163;
        bh=JYyAJhlDPJkkYbJmZ0J4rK4VdyIpnk9gH2Y0/imlJjM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VPo5KbgWK5ewWjEuDz0P9zTtYF09+B33mrS+3/RuG9ygtzdeVMvZc3z4akfPmOEJ0
         BsF/CV6WlCNUoTsn7XXXuacuYb/QaPxLEcKkr8IVkwCNdEhLEWYoXtvNHCeheFOJ9I
         2Yc75n0z6eU7AIFlN94cTxkEhjryXz1YRXyy3mQQ=
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
Subject: [PATCH 08/12] ARM: dts: exynos: adjust node names to DT spec in Exynos542x boards
Date:   Mon, 26 Oct 2020 19:15:24 +0100
Message-Id: <20201026181528.163143-9-krzk@kernel.org>
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
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 4 ++--
 arch/arm/boot/dts/exynos5420-peach-pit.dts         | 4 ++--
 arch/arm/boot/dts/exynos5420-smdk5420.dts          | 2 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi  | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 4 ++--
 arch/arm/boot/dts/exynos5422-odroidxu3.dts         | 8 ++++----
 arch/arm/boot/dts/exynos5800-peach-pi.dts          | 4 ++--
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index dd7f8385d81e..bf457d0c02eb 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -39,7 +39,7 @@ oscclk {
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
 		wakeup {
@@ -344,7 +344,7 @@ &hdmi {
 &hsi2c_4 {
 	status = "okay";
 
-	s2mps11_pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s2mps11-pmic";
 		reg = <0x66>;
 
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 2bcbdf8a39bf..d54392fe6260 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -138,7 +138,7 @@ panel_in: endpoint {
 		};
 	};
 
-	mmc1_pwrseq: mmc1_pwrseq {
+	mmc1_pwrseq: mmc1-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpx0 0 GPIO_ACTIVE_LOW>; /* WIFI_EN */
 		clocks = <&max77802 MAX77802_CLK_32K_CP>;
@@ -205,7 +205,7 @@ &hsi2c_4 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	max77802: max77802-pmic@9 {
+	max77802: pmic@9 {
 		compatible = "maxim,max77802";
 		interrupt-parent = <&gpx3>;
 		interrupts = <1 IRQ_TYPE_NONE>;
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 4e49d8095b29..d506da9fa661 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -129,7 +129,7 @@ &hdmi {
 &hsi2c_4 {
 	status = "okay";
 
-	s2mps11_pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s2mps11-pmic";
 		reg = <0x66>;
 
diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index b1cf9414ce17..25fb6331c75e 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -503,7 +503,7 @@ &dmc {
 &hsi2c_4 {
 	status = "okay";
 
-	s2mps11_pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s2mps11-pmic";
 		reg = <0x66>;
 		samsung,s2mps11-acokb-ground;
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
index b5ec4f47eb3a..f5f9c077df74 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
@@ -40,7 +40,7 @@ codec {
 
 &hsi2c_5 {
 	status = "okay";
-	max98090: max98090@10 {
+	max98090: codec@10 {
 		compatible = "maxim,max98090";
 		reg = <0x10>;
 		interrupt-parent = <&gpx3>;
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 5da2d81e3be2..e35af40a55cb 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -13,12 +13,12 @@
 #include "exynos5422-odroid-core.dtsi"
 
 / {
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&power_key>;
 
-		power_key {
+		power-key {
 			/*
 			 * The power button (SW2) is connected to the PWRON
 			 * pin (active high) of the S2MPS11 PMIC, which acts
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index d0f6ac5fa79d..5ff493ecb6ff 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -21,28 +21,28 @@ &i2c_0 {
 	status = "okay";
 
 	/* A15 cluster: VDD_ARM */
-	ina231@40 {
+	sensor@40 {
 		compatible = "ti,ina231";
 		reg = <0x40>;
 		shunt-resistor = <10000>;
 	};
 
 	/* memory: VDD_MEM */
-	ina231@41 {
+	sensor@41 {
 		compatible = "ti,ina231";
 		reg = <0x41>;
 		shunt-resistor = <10000>;
 	};
 
 	/* GPU: VDD_G3D */
-	ina231@44 {
+	sensor@44 {
 		compatible = "ti,ina231";
 		reg = <0x44>;
 		shunt-resistor = <10000>;
 	};
 
 	/* A7 cluster: VDD_KFC */
-	ina231@45 {
+	sensor@45 {
 		compatible = "ti,ina231";
 		reg = <0x45>;
 		shunt-resistor = <10000>;
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 60ab0effe474..0ce3443d39a8 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -138,7 +138,7 @@ panel_in: endpoint {
 		};
 	};
 
-	mmc1_pwrseq: mmc1_pwrseq {
+	mmc1_pwrseq: mmc1-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpx0 0 GPIO_ACTIVE_LOW>; /* WIFI_EN */
 		clocks = <&max77802 MAX77802_CLK_32K_CP>;
@@ -214,7 +214,7 @@ &hsi2c_4 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	max77802: max77802-pmic@9 {
+	max77802: pmic@9 {
 		compatible = "maxim,max77802";
 		interrupt-parent = <&gpx3>;
 		interrupts = <1 IRQ_TYPE_NONE>;
-- 
2.25.1

