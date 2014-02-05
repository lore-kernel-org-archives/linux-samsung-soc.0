From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: dts: Add ADMA node to Exynos5420
Date: Wed,  5 Feb 2014 16:58:30 +0530
Message-ID: <1391599711-30328-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:56573 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182AbaBELdk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Feb 2014 06:33:40 -0500
Received: by mail-pb0-f48.google.com with SMTP id rr13so252074pbb.35
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Feb 2014 03:33:40 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, broonie@linaro.org, sachin.kamat@linaro.org

Added ADMA mode to Exynos5420 DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index cb9612fd2190..376d177e8810 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -281,6 +281,17 @@
 		interrupt-parent = <&gic>;
 		ranges;
 
+		adma: adma@03880000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x03880000 0x1000>;
+			interrupts = <0 110 0>;
+			clocks = <&clock_audss EXYNOS_ADMA>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+			#dma-channels = <6>;
+			#dma-requests = <16>;
+		};
+
 		pdma0: pdma@121A0000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x121A0000 0x1000>;
-- 
1.7.9.5
