From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 09/22] ARM: ux500: Remove '0x's from Exynos5250 DTS file
Date: Fri, 19 Jul 2013 14:58:40 +0100
Message-ID: <1374242333-6852-9-git-send-email-lee.jones@linaro.org>
References: <1374242333-6852-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172]:61680 "EHLO
	mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750794Ab3GSN7V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Jul 2013 09:59:21 -0400
Received: by mail-ea0-f172.google.com with SMTP id q10so2403129eaj.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jul 2013 06:59:19 -0700 (PDT)
In-Reply-To: <1374242333-6852-1-git-send-email-lee.jones@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, linus.walleij@stericsson.com, srinidhi.kasagar@stericsson.com, Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/exynos5250.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index ef57277..24c0888 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -68,17 +68,17 @@
 		};
 	};
 
-	pd_gsc: gsc-power-domain@0x10044000 {
+	pd_gsc: gsc-power-domain@10044000 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044000 0x20>;
 	};
 
-	pd_mfc: mfc-power-domain@0x10044040 {
+	pd_mfc: mfc-power-domain@10044040 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044040 0x20>;
 	};
 
-	clock: clock-controller@0x10010000 {
+	clock: clock-controller@10010000 {
 		compatible = "samsung,exynos5250-clock";
 		reg = <0x10010000 0x30000>;
 		#clock-cells = <1>;
@@ -562,7 +562,7 @@
 		};
 	};
 
-	gsc_0:  gsc@0x13e00000 {
+	gsc_0:  gsc@13e00000 {
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e00000 0x1000>;
 		interrupts = <0 85 0>;
@@ -571,7 +571,7 @@
 		clock-names = "gscl";
 	};
 
-	gsc_1:  gsc@0x13e10000 {
+	gsc_1:  gsc@13e10000 {
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e10000 0x1000>;
 		interrupts = <0 86 0>;
@@ -580,7 +580,7 @@
 		clock-names = "gscl";
 	};
 
-	gsc_2:  gsc@0x13e20000 {
+	gsc_2:  gsc@13e20000 {
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e20000 0x1000>;
 		interrupts = <0 87 0>;
@@ -589,7 +589,7 @@
 		clock-names = "gscl";
 	};
 
-	gsc_3:  gsc@0x13e30000 {
+	gsc_3:  gsc@13e30000 {
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e30000 0x1000>;
 		interrupts = <0 88 0>;
-- 
1.8.1.2
