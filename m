From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/7] clk: samsung: exynos4: set parent of mixer gate clock to
 hdmi
Date: Thu, 13 Nov 2014 17:22:59 +0100
Message-ID: <1415895785-26892-2-git-send-email-a.hajda@samsung.com>
References: <1415895785-26892-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38310 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933311AbaKMQXx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 11:23:53 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NEZ00MVPKCCF580@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Nov 2014 16:26:37 +0000 (GMT)
In-reply-to: <1415895785-26892-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

This dependency is not clearly documented, but it seems
mixer gate clock is not working without hdmi clock.
It causes system hangs during mixer access with disabled hdmi.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 940f028..770a6d4 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -875,7 +875,7 @@ static struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
 	GATE(CLK_SCLK_AUDIO1, "sclk_audio1", "div_audio1", SRC_MASK_PERIL1, 0,
 			CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_VP, "vp", "aclk160", GATE_IP_TV, 0, 0, 0),
-	GATE(CLK_MIXER, "mixer", "aclk160", GATE_IP_TV, 1, 0, 0),
+	GATE(CLK_MIXER, "mixer", "hdmi", GATE_IP_TV, 1, 0, 0),
 	GATE(CLK_HDMI, "hdmi", "aclk160", GATE_IP_TV, 3, 0, 0),
 	GATE(CLK_PWM, "pwm", "aclk100", GATE_IP_PERIL, 24, 0, 0),
 	GATE(CLK_SDMMC4, "sdmmc4", "aclk133", GATE_IP_FSYS, 9, 0, 0),
-- 
1.9.1
