Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7415DC388F9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:15:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B108223AB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603736146;
	bh=uKlwMtS7TTsEWxyIlODC56yOb69+0cCNt3YdEyzgpbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Cmd4hVr1Hym7jNWAbfOz74SN1ij/XbSTHZF6lNCyYN6tsGr4ns511TnwqlrTzebrh
	 K/GmvxKQ/LyG2rspU/RX3WobLgw0Ph0PycHt1y22Pgry/tqRdv7RqiaS82cW39kj8n
	 zAXVCwIkcvFnqPVAw9FgsqtlzVwgsdkDY3qS/d/A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1789334AbgJZSPm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:15:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:59104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405222AbgJZSPl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:15:41 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2602222C8;
        Mon, 26 Oct 2020 18:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603736140;
        bh=uKlwMtS7TTsEWxyIlODC56yOb69+0cCNt3YdEyzgpbU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DCk7HjXaw0QQkNeesb9DopzsXOU6Kn7qxMYqFnU9dP5je3JfhqjiGo5E/9bgHLwaq
         oTobhdIWM7atBGBLFChvxrzCjiV2/INLU1n3MJycZ8vJaR8+7S8ZNAT+8gxZc5R9fv
         woNZfmdleU6ge5+OCwz71ZAppL0GWMnxzEM9bihU=
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
Subject: [PATCH 01/12] ARM: dts: exynos: adjust node names to DT spec in Exynos3250 boards
Date:   Mon, 26 Oct 2020 19:15:17 +0100
Message-Id: <20201026181528.163143-2-krzk@kernel.org>
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

