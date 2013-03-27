From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 06/21] clk: samsung: exynos4: Move dac and mixer to
 Exynos4210-specific clocks
Date: Wed, 27 Mar 2013 12:02:43 +0100
Message-ID: <1364382178-25248-7-git-send-email-t.figa@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:32811 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751879Ab3C0LFW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 07:05:22 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKB00GZYG4DZGK0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Mar 2013 20:05:21 +0900 (KST)
In-reply-to: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

The sclk_dac and sclk_mixer clocks are not present on Exynos4x12.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 96f2e74..c1e6451 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -483,8 +483,6 @@ struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
 	 * of the clocks can be removed.
 	 */
 	GATE(sclk_hdmi, "sclk_hdmi", "mout_hdmi", SRC_MASK_TV, 0, 0, 0),
-	GATE(sclk_mixer, "sclk_mixer", "mout_mixer", SRC_MASK_TV, 4, 0, 0),
-	GATE(sclk_dac, "sclk_dac", "mout_dac", SRC_MASK_TV, 8, 0, 0),
 	GATE(sclk_spdif, "sclk_spdif", "mout_spdif", 0xc354, 8, 0, 0),
 	GATE(jpeg, "jpeg", "aclk160", GATE_IP_CAM, 6, 0, 0),
 	GATE(mie0, "mie0", "aclk160", GATE_IP_LCD0, 1, 0, 0),
@@ -681,6 +679,8 @@ struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
 			SRC_MASK_LCD1, 12, CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_sata, "sclk_sata", "div_sata",
 			SRC_MASK_FSYS, 24, CLK_SET_RATE_PARENT, 0),
+	GATE(sclk_mixer, "sclk_mixer", "mout_mixer", SRC_MASK_TV, 4, 0, 0),
+	GATE(sclk_dac, "sclk_dac", "mout_dac", SRC_MASK_TV, 8, 0, 0),
 	GATE_A(tsadc, "tsadc", "aclk100", GATE_IP_PERIL, 15, 0, 0, "adc"),
 	GATE_A(mct, "mct", "aclk100", GATE_IP_PERIR, 13, 0, 0, "mct"),
 	GATE_A(wdt, "watchdog", "aclk100", GATE_IP_PERIR, 14, 0, 0, "watchdog"),
-- 
1.8.1.5
