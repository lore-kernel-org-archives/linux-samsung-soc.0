From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH 1/2] ARM: dts: remove dwmmc nodes from exynos5 common dts file.
Date: Wed, 14 Aug 2013 17:48:58 +0530
Message-ID: <1376482739-1994-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:37406 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752803Ab3HNMTK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 08:19:10 -0400
Received: by mail-pa0-f53.google.com with SMTP id lb1so10028463pab.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 05:19:09 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Exynos5 series SOC's 5250 and 5420 have different versions of
DWMMC controller.So there is a new compatible string to distinguish
between them.So these nodes should be moved out of Exynos5 series
common device tree source.

Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
---
 arch/arm/boot/dts/exynos5.dtsi |   21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index f65e124..c9fea70 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -50,27 +50,6 @@
 		interrupts = <1 9 0xf04>;
 	};
 
-	dwmmc_0: dwmmc0@12200000 {
-		compatible = "samsung,exynos5250-dw-mshc";
-		interrupts = <0 75 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-	dwmmc_1: dwmmc1@12210000 {
-		compatible = "samsung,exynos5250-dw-mshc";
-		interrupts = <0 76 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-	dwmmc_2: dwmmc2@12220000 {
-		compatible = "samsung,exynos5250-dw-mshc";
-		interrupts = <0 77 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
 	serial@12C00000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0x12C00000 0x100>;
-- 
1.7.9.5
