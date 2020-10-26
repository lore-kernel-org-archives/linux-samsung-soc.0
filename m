Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404B7C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:15:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0312A2224E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603736147;
	bh=+wmbKJLoYoY1BZmkHUGZukV0z4tuB3bsXsscZDPmXzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=l6vSBChB3r/XdRDJCs03tElW3vReVwmOxWXpdYDAhVcYKhebXx3YQfCcd0BeLJ9Vq
	 xAiP155xYdK9u859DTwuHdxx3b09laebSInGgSuN3Lk3pe0vrsjjAKn2nrkRgLGeY0
	 dRwHKc5MxK+pRmDr4SF4hdfR4GhQ2+qvHWA/IIcQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1789343AbgJZSPq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:15:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:59168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405222AbgJZSPp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:15:45 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4348222281;
        Mon, 26 Oct 2020 18:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603736144;
        bh=+wmbKJLoYoY1BZmkHUGZukV0z4tuB3bsXsscZDPmXzU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RWe70QjOUCt8/Ypl+UaePu6+/gluN/DyGsNItyxDhhZMaRh8Hlb3q5CAysNQQRBLe
         jd+IpYj7AlMsB1Ukzk8tVfazMDItK0Aej/ZPG4Hee3fCPo2uJ0iFynEeHcco2O0Zqw
         rSg4i5WEORzsduONrjFgeCkBCx7ALuG4HQJNZ81o=
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
Subject: [PATCH 02/12] ARM: dts: exynos: adjust node names to DT spec in Exynos4210 boards
Date:   Mon, 26 Oct 2020 19:15:18 +0100
Message-Id: <20201026181528.163143-3-krzk@kernel.org>
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

