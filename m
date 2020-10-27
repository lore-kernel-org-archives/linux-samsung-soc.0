Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2612BC388F9
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0FF72224E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603818600;
	bh=uKlwMtS7TTsEWxyIlODC56yOb69+0cCNt3YdEyzgpbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=N5B+aFJyeJTyv52eWHHO6QkoThxGaMjQvAgAjBNpsRtOps+Nv3o9LcemCA6YUwfoR
	 9j7wsXmmucTwzT81es/dscfP8loJfshHIAJr35ZHV560aoUviGi9SQautYLxJfGzTL
	 ml5yNXAQOw3rUdsr0JbX1mAUgumVa8SSJNdXum/Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1816815AbgJ0RJ7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:09:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:37958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1816808AbgJ0RJ5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:09:57 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8E6F21D24;
        Tue, 27 Oct 2020 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603818597;
        bh=uKlwMtS7TTsEWxyIlODC56yOb69+0cCNt3YdEyzgpbU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ccQayzsz2hE7atEJ7X2RIIeYn7EoLbO+B1Es7EbUDdW3Az/zOdCO7Wr0ntD+H0P3X
         vl9dI9DAnfKTsQkOYtNSLr5utEQsy97sT6Pl2nevrfdejSgNSepeepey7zZJ9c5yR0
         zT2U88D+/T6y5CQp/7MyxOfvdNaasBVzA8u+gyV0=
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
Subject: [PATCH v2 01/12] ARM: dts: exynos: adjust node names to DT spec in Exynos3250 boards
Date:   Tue, 27 Oct 2020 18:09:36 +0100
Message-Id: <20201027170947.132725-2-krzk@kernel.org>
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
 arch/arm/boot/dts/exynos3250-artik5.dtsi | 2 +-
 arch/arm/boot/dts/exynos3250-monk.dts    | 8 ++++----
 arch/arm/boot/dts/exynos3250-rinato.dts  | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
index 12887b3924af..04290ec4583a 100644
--- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
@@ -76,7 +76,7 @@ &i2c_0 {
 	samsung,i2c-max-bus-freq = <100000>;
 	status = "okay";
 
-	s2mps14_pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s2mps14-pmic";
 		interrupt-parent = <&gpx3>;
 		interrupts = <5 IRQ_TYPE_NONE>;
diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index c1a68e612037..69451566945d 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -34,10 +34,10 @@ firmware@205f000 {
 		reg = <0x0205F000 0x1000>;
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		power_key {
+		power-key {
 			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 			label = "power key";
@@ -62,7 +62,7 @@ i2c_max77836: i2c-gpio-0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		max77836: subpmic@25 {
+		max77836: pmic@25 {
 			compatible = "maxim,max77836";
 			interrupt-parent = <&gpx1>;
 			interrupts = <5 IRQ_TYPE_NONE>;
@@ -197,7 +197,7 @@ &i2c_0 {
 	samsung,i2c-max-bus-freq = <100000>;
 	status = "okay";
 
-	s2mps14_pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s2mps14-pmic";
 		interrupt-parent = <&gpx0>;
 		interrupts = <7 IRQ_TYPE_NONE>;
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index b55afaaa691e..a26e3e582a7e 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -38,10 +38,10 @@ firmware@205f000 {
 		reg = <0x0205F000 0x1000>;
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		power_key {
+		power-key {
 			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 			label = "power key";
@@ -62,7 +62,7 @@ i2c_max77836: i2c-gpio-0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		max77836: subpmic@25 {
+		max77836: pmic@25 {
 			compatible = "maxim,max77836";
 			interrupt-parent = <&gpx1>;
 			interrupts = <5 IRQ_TYPE_NONE>;
@@ -267,7 +267,7 @@ &i2c_0 {
 	samsung,i2c-max-bus-freq = <100000>;
 	status = "okay";
 
-	s2mps14_pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s2mps14-pmic";
 		interrupt-parent = <&gpx0>;
 		interrupts = <7 IRQ_TYPE_NONE>;
-- 
2.25.1

