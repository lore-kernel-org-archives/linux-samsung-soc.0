From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 5/7] clk: samsung: exynos5250: Add missing unpopulated mux
 parents
Date: Tue, 15 Oct 2013 19:41:19 +0200
Message-ID: <1381858881-25611-6-git-send-email-t.figa@samsung.com>
References: <1381858881-25611-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:24266 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933145Ab3JORlj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 13:41:39 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUQ00HAT159VQC0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Oct 2013 18:41:34 +0100 (BST)
In-reply-to: <1381858881-25611-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch updates mux parent arrays with unpopulated mux inputs, as all
inputs need to be specified in parent arrays passed to
clk_register_mux(), otherwise clk_set_parent() can generate out of bound
accesses to the array.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index b3793fe..05e3a94 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -203,19 +203,27 @@ PNAME(mout_usb3_p)	= { "mout_mpll_user", "mout_cpll" };
 PNAME(mout_group1_p)	= { "fin_pll", "fin_pll", "sclk_hdmi27m",
 				"sclk_dptxphy", "sclk_uhostphy", "sclk_hdmiphy",
 				"mout_mpll_user", "mout_epll", "mout_vpll",
-				"mout_cpll" };
+				"mout_cpll", "none", "none",
+				"none", "none", "none",
+				"none" };
 PNAME(mout_audio0_p)	= { "cdclk0", "fin_pll", "sclk_hdmi27m", "sclk_dptxphy",
 				"sclk_uhostphy", "sclk_hdmiphy",
 				"mout_mpll_user", "mout_epll", "mout_vpll",
-				"mout_cpll" };
+				"mout_cpll", "none", "none",
+				"none", "none", "none",
+				"none" };
 PNAME(mout_audio1_p)	= { "cdclk1", "fin_pll", "sclk_hdmi27m", "sclk_dptxphy",
 				"sclk_uhostphy", "sclk_hdmiphy",
 				"mout_mpll_user", "mout_epll", "mout_vpll",
-				"mout_cpll" };
+				"mout_cpll", "none", "none",
+				"none", "none", "none",
+				"none" };
 PNAME(mout_audio2_p)	= { "cdclk2", "fin_pll", "sclk_hdmi27m", "sclk_dptxphy",
 				"sclk_uhostphy", "sclk_hdmiphy",
 				"mout_mpll_user", "mout_epll", "mout_vpll",
-				"mout_cpll" };
+				"mout_cpll", "none", "none",
+				"none", "none", "none",
+				"none" };
 PNAME(mout_spdif_p)	= { "sclk_audio0", "sclk_audio1", "sclk_audio2",
 				"spdif_extclk" };
 
-- 
1.8.3.2
