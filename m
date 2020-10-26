Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6911C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97EEE2224E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603736149;
	bh=lrhujq5KpMP9Fmb1OrBbzUShMU5koHD8rqT0q4DGKf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=UnMsb9p9E2nzUT85hMHbwyAMJZsd+cUIjZxBEYD4AOdWeSVzDIfkm+bdsjEoA+xms
	 mWXyJvL4BMG6byN6j3xSeLY9MTHnvsbkf2T41JBDhnjZF4A0l3ZdBaX9JhAIwH3Pkm
	 CD6eDgo18teA1Uhl0eEcjB0nJ83j40NhFJjz/jV4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1789355AbgJZSPs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:15:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:59250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1789351AbgJZSPs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:15:48 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94CB62222C;
        Mon, 26 Oct 2020 18:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603736147;
        bh=lrhujq5KpMP9Fmb1OrBbzUShMU5koHD8rqT0q4DGKf0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h5neGjy7mLbpp5Cgh6auhEqSzW2F1hzXDM6MVyWY5v9SqjggWzRxpxaknMG46h4dI
         GKw8hWSjb1iO9y/JCgbobGsADdJFH9RQmVZTGZtcmoNmXrhhYNKUEKb2AHXELyE6sG
         pKb8oEGuhLuUQZSBC3nZM42EKBxTr7JaoAThGjd0=
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
Subject: [PATCH 03/12] ARM: dts: exynos: override GPIO keys node by label in Exynos4412 Odroid family
Date:   Mon, 26 Oct 2020 19:15:19 +0100
Message-Id: <20201026181528.163143-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026181528.163143-1-krzk@kernel.org>
References: <20201026181528.163143-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Using full paths to extend or override a device tree node is error
prone.  If there was a typo error, a new node will be created instead of
extending the existing node.  This will lead to run-time errors that
could be hard to detect.

A mistyped label on the other hand, will cause a dtc compile error
(during build time).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../boot/dts/exynos4412-odroid-common.dtsi    |  2 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts      | 24 +++++++++----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 2983e91bc7dd..c3b6e6d367ab 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -22,7 +22,7 @@ firmware@204f000 {
 		reg = <0x0204F000 0x1000>;
 	};
 
-	gpio_keys {
+	gpio_keys: gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_power_key>;
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 3ea2a0101e80..68fe88074d1d 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -36,18 +36,6 @@ led2 {
 		};
 	};
 
-	gpio_keys {
-		pinctrl-0 = <&gpio_power_key &gpio_home_key>;
-
-		home_key {
-			gpios = <&gpx2 2 GPIO_ACTIVE_HIGH>;
-			linux,code = <KEY_HOME>;
-			label = "home key";
-			debounce-interval = <10>;
-			wakeup-source;
-		};
-	};
-
 	regulator_p3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "p3v3_en";
@@ -76,6 +64,18 @@ &ehci {
 	phy-names = "hsic0";
 };
 
+&gpio_keys {
+	pinctrl-0 = <&gpio_power_key &gpio_home_key>;
+
+	home-key {
+		gpios = <&gpx2 2 GPIO_ACTIVE_HIGH>;
+		linux,code = <KEY_HOME>;
+		label = "home key";
+		debounce-interval = <10>;
+		wakeup-source;
+	};
+};
+
 &mshc_0 {
 	vqmmc-supply = <&buck8_reg>;
 };
-- 
2.25.1

