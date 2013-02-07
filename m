From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: exynos4412-origen: Add MSHC node
Date: Thu,  7 Feb 2013 16:57:22 +0530
Message-ID: <1360236442-24811-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:40620 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751849Ab3BGLgt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 06:36:49 -0500
Received: by mail-pa0-f41.google.com with SMTP id fb11so1354550pad.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Feb 2013 03:36:48 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added MSHC node to Origen-4412 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 1df7ebd..14709da 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -48,6 +48,26 @@
 		status = "okay";
 	};
 
+	mshc@12550000 {
+		pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		num-slots = <1>;
+		supports-highspeed;
+		broken-cd;
+		fifo-depth = <0x80>;
+		card-detect-delay = <200>;
+		samsung,dw-mshc-ciu-div = <3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <8>;
+		};
+	};
+
 	codec@13400000 {
 		samsung,mfc-r = <0x43000000 0x800000>;
 		samsung,mfc-l = <0x51000000 0x800000>;
-- 
1.7.4.1
