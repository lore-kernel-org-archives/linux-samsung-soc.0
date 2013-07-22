From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 09/22] ARM: dts: Remove '0x's from Exynos5250 DTS file
Date: Mon, 22 Jul 2013 11:52:28 +0100
Message-ID: <1374490361-25769-9-git-send-email-lee.jones@linaro.org>
References: <1374490361-25769-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:39432 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932263Ab3GVKxG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 06:53:06 -0400
Received: by mail-ee0-f47.google.com with SMTP id e49so3714728eek.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2013 03:53:05 -0700 (PDT)
In-Reply-To: <1374490361-25769-1-git-send-email-lee.jones@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, linus.walleij@stericsson.com, Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

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
