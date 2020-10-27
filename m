Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3CBC388F9
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AACF21D42
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603818608;
	bh=+wmbKJLoYoY1BZmkHUGZukV0z4tuB3bsXsscZDPmXzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Auw6lcfLMK6G5395hC5X5mNYxQayRbu0gdSJMijQVUQ8+vUYSDi7coP6LUQKgBGhH
	 89v68W94okvBwcp25JacxhPgbA3oG347dbdXMp1NwRFlhRIP1UhscW22MfwsipCp4X
	 kXzUHws84kBDR7u20CJ2cFRrZbxbt9QnZAu4PnVY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1816829AbgJ0RKC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:10:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:38036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1816820AbgJ0RKB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:10:01 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ABD6821D7B;
        Tue, 27 Oct 2020 17:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603818600;
        bh=+wmbKJLoYoY1BZmkHUGZukV0z4tuB3bsXsscZDPmXzU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hetDw3Rf7CobgP7CDiUlB5XbAWk1jWXTgDvkCwJCg7jdLH5qcEA3TVQB5wW2/h+vN
         /XGS8wc76mA9VAnu19+kmDLrR+wnDazT9eO/tKXoL9l2qP9vO2AG8UaZ6Cu2IhcL90
         FMpjJpay1vTcSh8mYj84WQASBMRNABFliaOaQF5I=
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
Subject: [PATCH v2 02/12] ARM: dts: exynos: adjust node names to DT spec in Exynos4210 boards
Date:   Tue, 27 Oct 2020 18:09:37 +0100
Message-Id: <20201027170947.132725-3-krzk@kernel.org>
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
 arch/arm/boot/dts/exynos4210-i9100.dts    |  6 +++---
 arch/arm/boot/dts/exynos4210-origen.dts   |  4 ++--
 arch/arm/boot/dts/exynos4210-smdkv310.dts | 22 +++++++++++-----------
 arch/arm/boot/dts/exynos4210-trats.dts    |  4 ++--
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exynos4210-i9100.dts
index 5370ee477186..a0c3bab382ae 100644
--- a/arch/arm/boot/dts/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/exynos4210-i9100.dts
@@ -329,7 +329,7 @@ &i2c_3 {
 	pinctrl-0 = <&i2c3_bus>;
 	pinctrl-names = "default";
 
-	mxt224-touchscreen@4a {
+	touchscreen@4a {
 		compatible = "atmel,maxtouch";
 		reg = <0x4a>;
 
@@ -348,7 +348,7 @@ &i2c_5 {
 	pinctrl-0 = <&i2c5_bus>;
 	pinctrl-names = "default";
 
-	max8997_pmic@66 {
+	pmic@66 {
 		compatible = "maxim,max8997-pmic";
 		reg = <0x66>;
 
@@ -597,7 +597,7 @@ &i2c_7 {
 	pinctrl-0 = <&i2c7_bus>;
 	pinctrl-names = "default";
 
-	ak8975@c {
+	magnetometer@c {
 		compatible = "asahi-kasei,ak8975";
 		reg = <0x0c>;
 
diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 7d2cfbafefb2..1c5394152561 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -43,7 +43,7 @@ mmc_reg: voltage-regulator {
 		enable-active-high;
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
 		up {
@@ -171,7 +171,7 @@ &i2c_0 {
 	pinctrl-0 = <&i2c0_bus>;
 	pinctrl-names = "default";
 
-	max8997_pmic@66 {
+	pmic@66 {
 		compatible = "maxim,max8997-pmic";
 		reg = <0x66>;
 		interrupt-parent = <&gpx0>;
diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index c5609afa6101..d5797a67bf48 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -90,61 +90,61 @@ &keypad {
 	pinctrl-0 = <&keypad_rows &keypad_cols>;
 	status = "okay";
 
-	key_1 {
+	key-1 {
 		keypad,row = <0>;
 		keypad,column = <3>;
 		linux,code = <2>;
 	};
 
-	key_2 {
+	key-2 {
 		keypad,row = <0>;
 		keypad,column = <4>;
 		linux,code = <3>;
 	};
 
-	key_3 {
+	key-3 {
 		keypad,row = <0>;
 		keypad,column = <5>;
 		linux,code = <4>;
 	};
 
-	key_4 {
+	key-4 {
 		keypad,row = <0>;
 		keypad,column = <6>;
 		linux,code = <5>;
 	};
 
-	key_5 {
+	key-5 {
 		keypad,row = <0>;
 		keypad,column = <7>;
 		linux,code = <6>;
 	};
 
-	key_a {
+	key-a {
 		keypad,row = <1>;
 		keypad,column = <3>;
 		linux,code = <30>;
 	};
 
-	key_b {
+	key-b {
 		keypad,row = <1>;
 		keypad,column = <4>;
 		linux,code = <48>;
 	};
 
-	key_c {
+	key-c {
 		keypad,row = <1>;
 		keypad,column = <5>;
 		linux,code = <46>;
 	};
 
-	key_d {
+	key-d {
 		keypad,row = <1>;
 		keypad,column = <6>;
 		linux,code = <32>;
 	};
 
-	key_e {
+	key-e {
 		keypad,row = <1>;
 		keypad,column = <7>;
 		linux,code = <18>;
@@ -200,7 +200,7 @@ &spi_2 {
 	cs-gpios = <&gpc1 2 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
-	w25x80@0 {
+	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "w25x80";
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index a226bec56a45..f10c63ae9973 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -263,7 +263,7 @@ &i2c_3 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	mms114-touchscreen@48 {
+	touchscreen@48 {
 		compatible = "melfas,mms114";
 		reg = <0x48>;
 		interrupt-parent = <&gpx0>;
@@ -283,7 +283,7 @@ &i2c_5 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	max8997_pmic@66 {
+	pmic@66 {
 		compatible = "maxim,max8997-pmic";
 
 		reg = <0x66>;
-- 
2.25.1

