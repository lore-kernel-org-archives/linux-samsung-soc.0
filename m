From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Fix SPI interrupt numbers for Exynos5420
Date: Thu, 10 Apr 2014 18:28:12 +0530
Message-ID: <1397134692-22149-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:37055 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030535AbaDJM6x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 08:58:53 -0400
Received: by mail-pb0-f45.google.com with SMTP id uo5so3923028pbc.32
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 05:58:53 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Updated as per the user manual.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index c3a9a66c5767..6f662b5cc90d 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -385,7 +385,7 @@
 	spi_0: spi@12d20000 {
 		compatible = "samsung,exynos4210-spi";
 		reg = <0x12d20000 0x100>;
-		interrupts = <0 66 0>;
+		interrupts = <0 68 0>;
 		dmas = <&pdma0 5
 			&pdma0 4>;
 		dma-names = "tx", "rx";
@@ -401,7 +401,7 @@
 	spi_1: spi@12d30000 {
 		compatible = "samsung,exynos4210-spi";
 		reg = <0x12d30000 0x100>;
-		interrupts = <0 67 0>;
+		interrupts = <0 69 0>;
 		dmas = <&pdma1 5
 			&pdma1 4>;
 		dma-names = "tx", "rx";
@@ -417,7 +417,7 @@
 	spi_2: spi@12d40000 {
 		compatible = "samsung,exynos4210-spi";
 		reg = <0x12d40000 0x100>;
-		interrupts = <0 68 0>;
+		interrupts = <0 70 0>;
 		dmas = <&pdma0 7
 			&pdma0 6>;
 		dma-names = "tx", "rx";
-- 
1.7.9.5
