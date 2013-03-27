From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 05/21] clk: samsung: exynos4: Export sclk_pcm0
Date: Wed, 27 Mar 2013 12:02:42 +0100
Message-ID: <1364382178-25248-6-git-send-email-t.figa@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59553 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751731Ab3C0LE4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 07:04:56 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKB00877G47B6P0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Mar 2013 20:04:55 +0900 (KST)
In-reply-to: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

This clock is used by PCM interface 0.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 Documentation/devicetree/bindings/clock/exynos4-clock.txt | 1 +
 drivers/clk/samsung/clk-exynos4.c                         | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos4-clock.txt b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
index d029605..ac7cec4 100644
--- a/Documentation/devicetree/bindings/clock/exynos4-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
@@ -94,6 +94,7 @@ Exynos4 SoC and this is specified where applicable.
   sclk_i2s2           168
   sclk_mipihsi        169     Exynos4412
   sclk_mfc            170
+  sclk_pcm0           171
 
 	      [Peripheral Clock Gates]
 
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 0e89d97..96f2e74 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -122,7 +122,7 @@ enum exynos4_clks {
 	sclk_sata, sclk_uart0, sclk_uart1, sclk_uart2, sclk_uart3, sclk_uart4,
 	sclk_audio1, sclk_audio2, sclk_spdif, sclk_spi0, sclk_spi1, sclk_spi2,
 	sclk_slimbus, sclk_fimd1, sclk_mipi1, sclk_pcm1, sclk_pcm2, sclk_i2s1,
-	sclk_i2s2, sclk_mipihsi, sclk_mfc,
+	sclk_i2s2, sclk_mipihsi, sclk_mfc, sclk_pcm0,
 
 	/* gate clocks */
 	fimc0 = 256, fimc1, fimc2, fimc3, csis0, csis1, jpeg, smmu_fimc0,
@@ -411,7 +411,7 @@ struct samsung_div_clock exynos4_div_clks[] __initdata = {
 	DIV(none, "div_fimd0", "mout_fimd0", DIV_LCD0, 0, 4),
 	DIV(none, "div_mipi0", "mout_mipi0", DIV_LCD0, 16, 4),
 	DIV(none, "div_audio0", "mout_audio0", DIV_MAUDIO, 0, 4),
-	DIV(none, "div_pcm0", "sclk_audio0", DIV_MAUDIO, 4, 8),
+	DIV(sclk_pcm0, "sclk_pcm0", "sclk_audio0", DIV_MAUDIO, 4, 8),
 	DIV(none, "div_mmc0", "mout_mmc0", DIV_FSYS1, 0, 4),
 	DIV(none, "div_mmc1", "mout_mmc1", DIV_FSYS1, 16, 4),
 	DIV(none, "div_mmc2", "mout_mmc2", DIV_FSYS2, 0, 4),
-- 
1.8.1.5
