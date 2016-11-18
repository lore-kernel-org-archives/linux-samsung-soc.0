From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH] arm64: dts: exynos: add the mshc_2 node for supporting T-Flash
Date: Fri, 18 Nov 2016 16:12:24 +0900
Message-ID: <20161118071224.12876-1-jh80.chung@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34488 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751058AbcKRHM3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 02:12:29 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, krzk@kernel.org, cw00.choi@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, Jaehoon Chung <jh80.chung@samsung.com>

Add the mshc_2 node for supporting T-flash.

And it needs to add the "mshc*" aliases. Because dwmmc driver should be
assigned to "ctrl_id" after parsing to "mshc".
If there is no aliases for mshc, then it might be set to the wrong
capabilities.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index 9ea3f32..75dab01 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -42,6 +42,8 @@
 		spi2 = &spi_2;
 		spi3 = &spi_3;
 		spi4 = &spi_4;
+		mshc0 = &mshc_0;
+		mshc2 = &mshc_2;
 	};
 
 	chosen {
@@ -661,6 +663,23 @@
 	assigned-clock-rates = <800000000>;
 };
 
+&mshc_2 {
+	status = "okay";
+	num-slots = <1>;
+	cap-sd-highspeed;
+	disable-wp;
+	cd-gpios = <&gpa2 4 0>;
+	cd-inverted;
+	card-detect-delay = <200>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 4>;
+	samsung,dw-mshc-ddr-timing = <0 2>;
+	fifo-depth = <0x80>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4>;
+	bus-width = <4>;
+};
+
 &pinctrl_alive {
 	pinctrl-names = "default";
 	pinctrl-0 = <&initial_alive>;
-- 
2.10.1
