From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 1/5] clk/exynos5420: add sclk_hdmiphy to the list of special
 clocks
Date: Tue, 18 Jun 2013 20:03:14 +0530
Message-ID: <1371565998-3642-2-git-send-email-rahul.sharma@samsung.com>
References: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40263 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932855Ab3FROJq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 10:09:46 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOL00MGDE09HUL0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Jun 2013 23:09:45 +0900 (KST)
In-reply-to: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add sclk_hdmiphy to the list of exposed clocks. This is required
by hdmi driver to change the parent of hdmi clock.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 Documentation/devicetree/bindings/clock/exynos5420-clock.txt |    1 +
 drivers/clk/samsung/clk-exynos5420.c                         |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
index 9bcc4b1..596a368 100644
--- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
@@ -59,6 +59,7 @@ clock which they consume.
   sclk_pwm		155
   sclk_gscl_wa		156
   sclk_gscl_wb		157
+  sclk_hdmiphy		158
 
    [Peripheral Clock Gates]
 
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 68a96cb..0945435 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -91,7 +91,7 @@ enum exynos5420_clks {
 	sclk_i2s2, sclk_pcm1, sclk_pcm2, sclk_spdif, sclk_hdmi, sclk_pixel,
 	sclk_dp1, sclk_mipi1, sclk_fimd1, sclk_maudio0, sclk_maupcm0,
 	sclk_usbd300, sclk_usbd301, sclk_usbphy300, sclk_usbphy301, sclk_unipro,
-	sclk_pwm, sclk_gscl_wa, sclk_gscl_wb,
+	sclk_pwm, sclk_gscl_wa, sclk_gscl_wb, sclk_hdmiphy,
 
 	/* gate clocks */
 	aclk66_peric = 256, uart0, uart1, uart2, uart3, i2c0, i2c1, i2c2, i2c3,
@@ -268,7 +268,7 @@ struct samsung_fixed_rate_clock exynos5420_fixed_rate_ext_clks[] __initdata = {
 
 /* fixed rate clocks generated inside the soc */
 struct samsung_fixed_rate_clock exynos5420_fixed_rate_clks[] __initdata = {
-	FRATE(none, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 24000000),
+	FRATE(sclk_hdmiphy, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 24000000),
 	FRATE(none, "sclk_pwi", NULL, CLK_IS_ROOT, 24000000),
 	FRATE(none, "sclk_usbh20", NULL, CLK_IS_ROOT, 48000000),
 	FRATE(none, "mphy_refclk_ixtal24", NULL, CLK_IS_ROOT, 48000000),
-- 
1.7.10.4
