From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 01/10] clk/samsung: exynos5433: add definitions of HDMI-PHY
 output clocks
Date: Tue, 20 Oct 2015 11:22:32 +0200
Message-ID: <1445332961-25419-2-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29494 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752156AbbJTJXV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 05:23:21 -0400
In-reply-to: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

HDMI driver must re-parent respective muxes during HDMI-PHY on/off
to HDMI-PHY output clocks. To reference those clocks their
definitions should be added.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c   | 6 ++++--
 include/dt-bindings/clock/exynos5433.h | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 650ec13..e037406 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -2614,8 +2614,10 @@ static struct samsung_fixed_rate_clock disp_fixed_clks[] __initdata = {
 	FRATE(0, "phyclk_mipidphy0_rxclkesc0_phy", NULL, CLK_IS_ROOT,
 			100000000),
 	/* PHY clocks from HDMI_PHY */
-	FRATE(0, "phyclk_hdmiphy_tmds_clko_phy", NULL, CLK_IS_ROOT, 300000000),
-	FRATE(0, "phyclk_hdmiphy_pixel_clko_phy", NULL, CLK_IS_ROOT, 166000000),
+	FRATE(CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY, "phyclk_hdmiphy_tmds_clko_phy",
+			NULL, CLK_IS_ROOT, 300000000),
+	FRATE(CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_PHY, "phyclk_hdmiphy_pixel_clko_phy",
+			NULL, CLK_IS_ROOT, 166000000),
 };
 
 static struct samsung_mux_clock disp_mux_clks[] __initdata = {
diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 5bd80d5..4f0d566 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -765,7 +765,10 @@
 #define CLK_SCLK_RGB_VCLK				109
 #define CLK_SCLK_RGB_TV_VCLK				110
 
-#define DISP_NR_CLK					111
+#define CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_PHY		111
+#define CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY		112
+
+#define DISP_NR_CLK					113
 
 /* CMU_AUD */
 #define CLK_MOUT_AUD_PLL_USER				1
-- 
1.9.1
