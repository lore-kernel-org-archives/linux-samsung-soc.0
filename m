From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 6/7] clk: samsung: exynos5250: Correct parent list of audio
 muxes
Date: Tue, 15 Oct 2013 19:41:20 +0200
Message-ID: <1381858881-25611-7-git-send-email-t.figa@samsung.com>
References: <1381858881-25611-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:24266 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933380Ab3JORlj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 13:41:39 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUQ00HAT159VQC0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Oct 2013 18:41:35 +0100 (BST)
In-reply-to: <1381858881-25611-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

According to SoC documentation, input 5 of mout_audio muxes is connected
to xxti (named fin_pll in the driver). This patch corrects defined
parent arrays to match SoC documentation.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 05e3a94..1290da9 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -207,19 +207,19 @@ PNAME(mout_group1_p)	= { "fin_pll", "fin_pll", "sclk_hdmi27m",
 				"none", "none", "none",
 				"none" };
 PNAME(mout_audio0_p)	= { "cdclk0", "fin_pll", "sclk_hdmi27m", "sclk_dptxphy",
-				"sclk_uhostphy", "sclk_hdmiphy",
+				"sclk_uhostphy", "fin_pll",
 				"mout_mpll_user", "mout_epll", "mout_vpll",
 				"mout_cpll", "none", "none",
 				"none", "none", "none",
 				"none" };
 PNAME(mout_audio1_p)	= { "cdclk1", "fin_pll", "sclk_hdmi27m", "sclk_dptxphy",
-				"sclk_uhostphy", "sclk_hdmiphy",
+				"sclk_uhostphy", "fin_pll",
 				"mout_mpll_user", "mout_epll", "mout_vpll",
 				"mout_cpll", "none", "none",
 				"none", "none", "none",
 				"none" };
 PNAME(mout_audio2_p)	= { "cdclk2", "fin_pll", "sclk_hdmi27m", "sclk_dptxphy",
-				"sclk_uhostphy", "sclk_hdmiphy",
+				"sclk_uhostphy", "fin_pll",
 				"mout_mpll_user", "mout_epll", "mout_vpll",
 				"mout_cpll", "none", "none",
 				"none", "none", "none",
-- 
1.8.3.2
