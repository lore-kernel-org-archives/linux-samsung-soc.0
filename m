From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH 2/2] DTS: Exynos5: Remove invalid MCT properties
Date: Wed, 28 Aug 2013 18:12:48 +0530
Message-ID: <1377693768-16777-3-git-send-email-chander.kashyap@linaro.org>
References: <1377693768-16777-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:36221 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754247Ab3H1MnJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 08:43:09 -0400
Received: by mail-pd0-f169.google.com with SMTP id r10so6283416pdi.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2013 05:43:08 -0700 (PDT)
In-Reply-To: <1377693768-16777-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, t.figa@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>

Remove interrupt-controller and #interrupt-cells properties of MCT device tree
node, as MCT is not an interrupt controllor.

Suggested by: Tomasz Figa

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 --
 arch/arm/boot/dts/exynos5420.dtsi |    2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index f2f178a..dca90ec 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -101,8 +101,6 @@
 	mct@101C0000 {
 		compatible = "samsung,exynos4210-mct";
 		reg = <0x101C0000 0x800>;
-		interrupt-controller;
-		#interrups-cells = <1>;
 		interrupt-parent = <&mct_map>;
 		interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
 		clocks = <&clock 1>, <&clock 335>;
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8c54c4b..6ce2f94 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -68,8 +68,6 @@
 	mct@101C0000 {
 		compatible = "samsung,exynos4210-mct";
 		reg = <0x101C0000 0x800>;
-		interrupt-controller;
-		#interrups-cells = <1>;
 		interrupt-parent = <&mct_map>;
 		interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>;
 		clocks = <&clock 1>, <&clock 315>;
-- 
1.7.9.5
