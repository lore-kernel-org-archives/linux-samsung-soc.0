From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 01/21] clk: samsung: exynos4: Correct sclk_mfc clock definition
Date: Wed, 27 Mar 2013 12:02:38 +0100
Message-ID: <1364382178-25248-2-git-send-email-t.figa@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43699 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751774Ab3C0LDo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 07:03:44 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKB00GERG259SR0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Mar 2013 20:03:43 +0900 (KST)
In-reply-to: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

From: Sylwester Nawrocki <s.nawrocki@samsung.com>

This clock must be exported to allow lookup using device tree.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 Documentation/devicetree/bindings/clock/exynos4-clock.txt | 2 +-
 drivers/clk/samsung/clk-exynos4.c                         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos4-clock.txt b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
index e874add..8b58232 100644
--- a/Documentation/devicetree/bindings/clock/exynos4-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
@@ -91,7 +91,7 @@ Exynos4 SoC and this is specified where applicable.
   sclk_i2s1           167
   sclk_i2s2           168
   sclk_mipihsi        169     Exynos4412
-
+  sclk_mfc            170
 
 	      [Peripheral Clock Gates]
 
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index e1bb81a..44a99b5 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -122,7 +122,7 @@ enum exynos4_clks {
 	sclk_sata, sclk_uart0, sclk_uart1, sclk_uart2, sclk_uart3, sclk_uart4,
 	sclk_audio1, sclk_audio2, sclk_spdif, sclk_spi0, sclk_spi1, sclk_spi2,
 	sclk_slimbus, sclk_fimd1, sclk_mipi1, sclk_pcm1, sclk_pcm2, sclk_i2s1,
-	sclk_i2s2, sclk_mipihsi,
+	sclk_i2s2, sclk_mipihsi, sclk_mfc,
 
 	/* gate clocks */
 	fimc0 = 256, fimc1, fimc2, fimc3, csis0, csis1, jpeg, smmu_fimc0,
@@ -355,7 +355,7 @@ struct samsung_div_clock exynos4_div_clks[] __initdata = {
 	DIV(none, "div_cam1", "mout_cam1", DIV_CAM, 20, 4),
 	DIV(none, "div_csis0", "mout_csis0", DIV_CAM, 24, 4),
 	DIV(none, "div_csis1", "mout_csis1", DIV_CAM, 28, 4),
-	DIV(none, "div_mfc", "mout_mfc", DIV_MFC, 0, 4),
+	DIV(sclk_mfc, "sclk_mfc", "mout_mfc", DIV_MFC, 0, 4),
 	DIV(none, "div_g3d", "mout_g3d", DIV_G3D, 0, 4),
 	DIV(none, "div_fimd0", "mout_fimd0", DIV_LCD0, 0, 4),
 	DIV(none, "div_mipi0", "mout_mipi0", DIV_LCD0, 16, 4),
-- 
1.8.1.5
