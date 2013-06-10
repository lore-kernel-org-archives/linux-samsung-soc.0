From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/5] clk/exynos5250: add mout_hdmi mux clock for hdmi
Date: Mon, 10 Jun 2013 16:30:59 +0530
Message-ID: <1370862062-16680-3-git-send-email-rahul.sharma@samsung.com>
References: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:8422 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753149Ab3FJKkP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Jun 2013 06:40:15 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO6008NAAZ143L0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Jun 2013 19:40:14 +0900 (KST)
In-reply-to: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, arun.kk@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

hdmi driver needs to change the parent of hdmi clock
frequently between pixel clock and hdmiphy clock. hdmiphy is
not stable after power on and for a short interval while changing
the phy configuration. For this duration pixel clock is used to
clock hdmi.

This patch is exposing the mux for changing parent.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 Documentation/devicetree/bindings/clock/exynos5250-clock.txt |    8 ++++++++
 drivers/clk/samsung/clk-exynos5250.c                         |    5 ++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
index 1a05761..b337147 100644
--- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
@@ -156,6 +156,14 @@ clock which they consume.
   mixer			343
   hdmi			344
 
+
+   [Clock Muxes]
+
+  Clock			ID
+  ----------------------------
+  mout_hdmi		1024
+
+
 Example 1: An example of a clock controller node is listed below.
 
 	clock: clock-controller@0x10010000 {
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 5c97e75..587d913 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -100,6 +100,9 @@ enum exynos5250_clks {
 	tzpc2, tzpc3, tzpc4, tzpc5, tzpc6, tzpc7, tzpc8, tzpc9, hdmi_cec, mct,
 	wdt, rtc, tmu, fimd1, mie1, dsim0, dp, mixer, hdmi,
 
+	/* mux clocks */
+	mout_hdmi = 1024,
+
 	nr_clks,
 };
 
@@ -231,7 +234,7 @@ struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
 	MUX(none, "mout_fimd1", mout_group1_p, SRC_DISP1_0, 0, 4),
 	MUX(none, "mout_mipi1", mout_group1_p, SRC_DISP1_0, 12, 4),
 	MUX(none, "mout_dp", mout_group1_p, SRC_DISP1_0, 16, 4),
-	MUX(none, "mout_hdmi", mout_hdmi_p, SRC_DISP1_0, 20, 1),
+	MUX(mout_hdmi, "mout_hdmi", mout_hdmi_p, SRC_DISP1_0, 20, 1),
 	MUX(none, "mout_audio0", mout_audio0_p, SRC_MAU, 0, 4),
 	MUX(none, "mout_mmc0", mout_group1_p, SRC_FSYS, 0, 4),
 	MUX(none, "mout_mmc1", mout_group1_p, SRC_FSYS, 4, 4),
-- 
1.7.10.4
