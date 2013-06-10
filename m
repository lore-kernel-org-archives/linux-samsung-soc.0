From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 3/5] clk/exynos5250: add sclk_hdmiphy in the list of special
 clocks
Date: Mon, 10 Jun 2013 16:31:00 +0530
Message-ID: <1370862062-16680-4-git-send-email-rahul.sharma@samsung.com>
References: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9284 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751843Ab3FJKlL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Jun 2013 06:41:11 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO60067TAZZMRO0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Jun 2013 19:41:10 +0900 (KST)
In-reply-to: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, arun.kk@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

hdmi driver needs hdmiphy clock which is one of the parent
for hdmi mux clock. This is required while changing the parent
of mux clock.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 Documentation/devicetree/bindings/clock/exynos5250-clock.txt |    1 +
 drivers/clk/samsung/clk-exynos5250.c                         |    3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
index b337147..f333d61 100644
--- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
@@ -59,6 +59,7 @@ clock which they consume.
   sclk_spi0		154
   sclk_spi1		155
   sclk_spi2		156
+  sclk_hdmiphy		157
 
 
    [Peripheral Clock Gates]
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 587d913..88cdb13 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -87,6 +87,7 @@ enum exynos5250_clks {
 	sclk_mmc0, sclk_mmc1, sclk_mmc2, sclk_mmc3, sclk_sata, sclk_usb3,
 	sclk_jpeg, sclk_uart0, sclk_uart1, sclk_uart2, sclk_uart3, sclk_pwm,
 	sclk_audio1, sclk_audio2, sclk_spdif, sclk_spi0, sclk_spi1, sclk_spi2,
+	sclk_hdmiphy,
 
 	/* gate clocks */
 	gscl0 = 256, gscl1, gscl2, gscl3, gscl_wa, gscl_wb, smmu_gscl0,
@@ -199,7 +200,7 @@ struct samsung_fixed_rate_clock exynos5250_fixed_rate_ext_clks[] __initdata = {
 
 /* fixed rate clocks generated inside the soc */
 struct samsung_fixed_rate_clock exynos5250_fixed_rate_clks[] __initdata = {
-	FRATE(none, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 24000000),
+	FRATE(sclk_hdmiphy, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 24000000),
 	FRATE(none, "sclk_hdmi27m", NULL, CLK_IS_ROOT, 27000000),
 	FRATE(none, "sclk_dptxphy", NULL, CLK_IS_ROOT, 24000000),
 	FRATE(none, "sclk_uhostphy", NULL, CLK_IS_ROOT, 48000000),
-- 
1.7.10.4
