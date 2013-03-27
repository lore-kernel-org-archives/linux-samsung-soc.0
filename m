From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 04/21] clk: samsung: exynos4: Add missing sclk_audio0 clock
Date: Wed, 27 Mar 2013 12:02:41 +0100
Message-ID: <1364382178-25248-5-git-send-email-t.figa@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29030 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751731Ab3C0LEh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 07:04:37 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKB00C2RG3KBVN0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Mar 2013 20:04:35 +0900 (KST)
In-reply-to: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

This clock is a parent of mout_spdif and sclk_pcm0.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 42c098d..0e89d97 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -508,6 +508,8 @@ struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
 			CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_mipi0, "sclk_mipi0", "div_mipi_pre0",
 			SRC_MASK_LCD0, 12, CLK_SET_RATE_PARENT, 0),
+	GATE(sclk_audio0, "sclk_audio0", "div_audio0", SRC_MASK_MAUDIO, 0,
+			CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_audio1, "sclk_audio1", "div_audio1", 0xc354, 0,
 			CLK_SET_RATE_PARENT, 0),
 	GATE_D(vp, "s5p-mixer", "vp", "aclk160", GATE_IP_TV, 0, 0, 0),
-- 
1.8.1.5
