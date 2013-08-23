From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 5/5] clk/exynos5420: assign sclk_pixel id to pixel clock
 divider
Date: Fri, 23 Aug 2013 12:27:58 +0530
Message-ID: <1377241078-11808-6-git-send-email-rahul.sharma@samsung.com>
References: <1377241078-11808-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45459 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754754Ab3HWGgS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Aug 2013 02:36:18 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRZ00J3L0ZANIA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Aug 2013 15:36:17 +0900 (KST)
In-reply-to: <1377241078-11808-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

sclk_pixel is used to represent pixel clock divider on all exynos
SoCs not as a gate clock. It is queried in driver to pass as the
parent to hdmi clock while switching between parents. A new ID can
be asssigned Pixel gate clock which is currently not in use. Pixel
clock gate is default 'on'.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 5f9bc63..8eb3c42 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -463,7 +463,7 @@ static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
 	DIV(none, "dout_fimd1", "mout_fimd1", DIV_DISP10, 0, 4),
 	DIV(none, "dout_mipi1", "mout_mipi1", DIV_DISP10, 16, 8),
 	DIV(none, "dout_dp1", "mout_dp1", DIV_DISP10, 24, 4),
-	DIV(none, "dout_hdmi_pixel", "mout_pixel", DIV_DISP10, 28, 4),
+	DIV(sclk_pixel, "dout_hdmi_pixel", "mout_pixel", DIV_DISP10, 28, 4),
 
 	/* Audio Block */
 	DIV(none, "dout_maudio0", "mout_maudio0", DIV_MAU, 20, 4),
@@ -599,7 +599,7 @@ static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
 		GATE_TOP_SCLK_DISP1, 3, CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_hdmi, "sclk_hdmi", "mout_hdmi",
 		GATE_TOP_SCLK_DISP1, 9, CLK_SET_RATE_PARENT, 0),
-	GATE(sclk_pixel, "sclk_pixel", "dout_hdmi_pixel",
+	GATE(none, "sclk_pixel", "dout_hdmi_pixel",
 		GATE_TOP_SCLK_DISP1, 10, CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_dp1, "sclk_dp1", "dout_dp1",
 		GATE_TOP_SCLK_DISP1, 20, CLK_SET_RATE_PARENT, 0),
-- 
1.7.10.4
