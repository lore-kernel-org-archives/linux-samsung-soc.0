From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v11 2/3] ARM: dts: Add FIMD node and display timing node to exynos4412-origen.dts
Date: Fri,  5 Apr 2013 15:47:41 +0530
Message-ID: <1365157062-8669-3-git-send-email-vikas.sajjan@linaro.org>
References: <1365157062-8669-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f44.google.com ([209.85.210.44]:35263 "EHLO
	mail-da0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161094Ab3DEKSH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Apr 2013 06:18:07 -0400
Received: by mail-da0-f44.google.com with SMTP id z20so1537231dae.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Apr 2013 03:18:06 -0700 (PDT)
In-Reply-To: <1365157062-8669-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

This patch adds FIMD related nodes for the Origen Quad board.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos4412-origen.dts |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index a5478bd..b39bffc 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -70,6 +70,27 @@
 		status = "okay";
 	};
 
+	fimd@11c00000 {
+		pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+
+	display-timings {
+		native-mode = <&timing0>;
+		timing0: timing {
+			clock-frequency = <50000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <64>;
+			hback-porch = <16>;
+			hsync-len = <48>;
+			vback-porch = <64>;
+			vfront-porch = <16>;
+			vsync-len = <3>;
+		};
+	};
+
 	serial@13800000 {
 		status = "okay";
 	};
-- 
1.7.9.5
