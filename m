From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] clk/samsung: exynos5433: Add documentation for audio block
 parent clocks
Date: Thu, 17 Nov 2016 09:50:48 +0100
Message-ID: <1479372648-11242-2-git-send-email-m.szyprowski@samsung.com>
References: <1479372648-11242-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161117085106eucas1p13370631ebbc7ec93effef606d80ac310@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45417 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751320AbcKQIvL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 03:51:11 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGS00NHB3980080@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 08:51:08 +0000 (GMT)
In-reply-to: <1479372648-11242-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Audio block requires access to two parent clocks: audio PLL and oscillator,
so add this information to device tree bindings documentation.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 Documentation/devicetree/bindings/clock/exynos5433-clock.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
index ffff67a0e9cd..1dc80f8811fe 100644
--- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
@@ -104,6 +104,10 @@ Required Properties:
 		- sclk_decon_tv_vclk_disp
 		- aclk_disp_333
 
+	Input clocks for audio clock controller:
+		- oscclk
+		- fout_aud_pll
+
 	Input clocks for bus0 clock controller:
 		- aclk_bus0_400
 
@@ -297,6 +301,9 @@ Example 2: Examples of clock controller nodes are listed below.
 		compatible = "samsung,exynos5433-cmu-aud";
 		reg = <0x114c0000 0x0b04>;
 		#clock-cells = <1>;
+
+		clock-names = "oscclk", "fout_aud_pll";
+		clocks = <&xxti>, <&cmu_top CLK_FOUT_AUD_PLL>;
 	};
 
 	cmu_bus0: clock-controller@13600000 {
-- 
1.9.1
