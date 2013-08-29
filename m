From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 5/5] clk/exynos5420: assign dout_pixel id to pixel clock
 divider
Date: Thu, 29 Aug 2013 11:07:09 +0530
Message-ID: <1377754629-31465-6-git-send-email-rahul.sharma@samsung.com>
References: <1377754629-31465-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52168 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752337Ab3H2FPq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 01:15:46 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MSA00EJ5197BT30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Aug 2013 14:15:39 +0900 (KST)
In-reply-to: <1377754629-31465-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

dout_pixel is a new ID allocated for pixel clock divider. It is
queried in the driver to pass as the parent to hdmi clock while
switching between parents.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 Documentation/devicetree/bindings/clock/exynos5420-clock.txt |    5 +++++
 drivers/clk/samsung/clk-exynos5420.c                         |    5 ++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
index 343430b..32aa34e 100644
--- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
@@ -187,6 +187,11 @@ clock which they consume.
 
   mout_hdmi		640
 
+  Divider		ID
+  ----------------------------
+
+  dout_pixel		768
+
 Example 1: An example of a clock controller node is listed below.
 
 	clock: clock-controller@0x10010000 {
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 78465a5..48c4a93 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -143,6 +143,9 @@ enum exynos5420_clks {
 	/* mux clocks */
 	mout_hdmi = 640,
 
+	/* divider clocks */
+	dout_pixel = 768,
+
 	nr_clks,
 };
 
@@ -463,7 +466,7 @@ static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
 	DIV(none, "dout_fimd1", "mout_fimd1", DIV_DISP10, 0, 4),
 	DIV(none, "dout_mipi1", "mout_mipi1", DIV_DISP10, 16, 8),
 	DIV(none, "dout_dp1", "mout_dp1", DIV_DISP10, 24, 4),
-	DIV(none, "dout_hdmi_pixel", "mout_pixel", DIV_DISP10, 28, 4),
+	DIV(dout_pixel, "dout_hdmi_pixel", "mout_pixel", DIV_DISP10, 28, 4),
 
 	/* Audio Block */
 	DIV(none, "dout_maudio0", "mout_maudio0", DIV_MAU, 20, 4),
-- 
1.7.10.4
