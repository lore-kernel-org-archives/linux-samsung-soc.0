Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF966C56201
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2A3722202
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603818656;
	bh=a4xa8Axa+yyq2WHPuw6Tn+5pmuOyV7gADs2/BnYjt5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=DIwKUdgarubDOggV+Aean8OHKdJ/3ecDufa7QrjneeHZ6kycGDp1oVNxPebepYctS
	 OMDNxg9Pk5IdL/BuS7z1LR8fOe1V3Hg0ZIfRdryAQjPS3FovmgmFIfRmCGwIiTpSov
	 haH2S0ZfSvpXj4eYsYX9KN0TToysdbmLZpsAxjOY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1816870AbgJ0RKP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:10:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:38336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1816867AbgJ0RKO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:10:14 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 434B421D24;
        Tue, 27 Oct 2020 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603818613;
        bh=a4xa8Axa+yyq2WHPuw6Tn+5pmuOyV7gADs2/BnYjt5Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F4qjC3Mrc5uDNxGKKZe+CiEGUTmVXA3tR9QMHkTslvA0CyPchwF31bXsnJyO4g7rS
         /s9YjHTT0RRGyqP6+qZxcWKlheu+1VvM5LPBq4EDemWR4WvMyYN9IbySbhPR45TB8p
         cmLB/GOed9oASpL9ipDKLgDjL2mIsTl/nLmpgWTY=
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
Subject: [PATCH v2 06/12] ARM: dts: exynos: adjust node names to DT spec in Exynos5250 boards
Date:   Tue, 27 Oct 2020 18:09:41 +0100
Message-Id: <20201027170947.132725-7-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027170947.132725-1-krzk@kernel.org>
References: <20201027170947.132725-1-krzk@kernel.org>
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
 arch/arm/boot/dts/exynos5250-arndale.dts      | 6 +++---
 arch/arm/boot/dts/exynos5250-smdk5250.dts     | 4 ++--
 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 4 ++--
 arch/arm/boot/dts/exynos5250-snow-rev5.dts    | 2 +-
 arch/arm/boot/dts/exynos5250-snow.dts         | 2 +-
 arch/arm/boot/dts/exynos5250-spring.dts       | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 79546f11af26..a161f6237c7f 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -27,7 +27,7 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
 		menu {
@@ -211,7 +211,7 @@ &i2c_0 {
 	samsung,i2c-max-bus-freq = <20000>;
 	samsung,i2c-slave-addr = <0x66>;
 
-	s5m8767_pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s5m8767-pmic";
 		reg = <0x66>;
 		interrupt-parent = <&gpx3>;
@@ -511,7 +511,7 @@ buck9_reg: BUCK9 {
 &i2c_3 {
 	status = "okay";
 
-	wm1811: codec@1a {
+	wm1811: audio-codec@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
 		clocks = <&i2s0 CLK_I2S_CDCLK>;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 186790f39e4d..8b5a79a8720c 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -290,7 +290,7 @@ eeprom@51 {
 		reg = <0x51>;
 	};
 
-	wm8994: wm8994@1a {
+	wm8994: audio-codec@1a {
 		compatible = "wlf,wm8994";
 		reg = <0x1a>;
 
@@ -385,7 +385,7 @@ &spi_1 {
 	status = "okay";
 	cs-gpios = <&gpa2 5 GPIO_ACTIVE_HIGH>;
 
-	w25q80bw@0 {
+	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "w25x80";
diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index c952a615148e..6635f6184051 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -217,7 +217,7 @@ panel_in: endpoint {
 		};
 	};
 
-	mmc3_pwrseq: mmc3_pwrseq {
+	mmc3_pwrseq: mmc3-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpx0 2 GPIO_ACTIVE_LOW>, /* WIFI_RSTn */
 			      <&gpx0 1 GPIO_ACTIVE_LOW>; /* WIFI_EN */
@@ -289,7 +289,7 @@ &i2c_0 {
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <378000>;
 
-	max77686: max77686@9 {
+	max77686: pmic@9 {
 		compatible = "maxim,max77686";
 		interrupt-parent = <&gpx3>;
 		interrupts = <2 IRQ_TYPE_NONE>;
diff --git a/arch/arm/boot/dts/exynos5250-snow-rev5.dts b/arch/arm/boot/dts/exynos5250-snow-rev5.dts
index 7cbfc6f1f4b8..0822b778c035 100644
--- a/arch/arm/boot/dts/exynos5250-snow-rev5.dts
+++ b/arch/arm/boot/dts/exynos5250-snow-rev5.dts
@@ -32,7 +32,7 @@ codec {
 };
 
 &i2c_7 {
-	max98090: codec@10 {
+	max98090: audio-codec@10 {
 		compatible = "maxim,max98090";
 		reg = <0x10>;
 		interrupts = <4 IRQ_TYPE_NONE>;
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 75fdc5e6d423..9946dce54d74 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -30,7 +30,7 @@ codec {
 };
 
 &i2c_7 {
-	max98095: codec@11 {
+	max98095: audio-codec@11 {
 		compatible = "maxim,max98095";
 		reg = <0x11>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index a92ade33779c..9d2baea62d0d 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -105,7 +105,7 @@ &i2c_0 {
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <378000>;
 
-	s5m8767-pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s5m8767-pmic";
 		reg = <0x66>;
 		interrupt-parent = <&gpx3>;
-- 
2.25.1

