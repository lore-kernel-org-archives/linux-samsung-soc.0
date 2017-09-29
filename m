From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 8/9] drivers: clk: samsung: Fix m2m scaler clock on
 Exynos542x
Date: Fri, 29 Sep 2017 09:32:53 +0200
Message-ID: <1506670374-15689-9-git-send-email-m.szyprowski@samsung.com>
References: <1506670374-15689-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20170929073304eucas1p2825d0ccd64de3b39409b6767660b5543@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50817 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751035AbdI2HdH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 03:33:07 -0400
In-reply-to: <1506670374-15689-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-clk@vger.kernel.org

From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>

TOP "aclk400_mscl" clock should be kept enabled all the time to allow
proper access to power management control for MSC power domain and
devices that are a part of it. This change is required for scaler to
work properly after domain power on/off sequence.

Fixes: 318fa46cc60d ("clk/samsung: exynos542x: mark some clocks as critical")
Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 25601967d1cd..038701a2af4c 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -998,7 +998,7 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	GATE(0, "aclk400_isp", "mout_user_aclk400_isp",
 			GATE_BUS_TOP, 16, 0, 0),
 	GATE(0, "aclk400_mscl", "mout_user_aclk400_mscl",
-			GATE_BUS_TOP, 17, 0, 0),
+			GATE_BUS_TOP, 17, CLK_IS_CRITICAL, 0),
 	GATE(0, "aclk200_disp1", "mout_user_aclk200_disp1",
 			GATE_BUS_TOP, 18, CLK_IS_CRITICAL, 0),
 	GATE(CLK_SCLK_MPHY_IXTAL24, "sclk_mphy_ixtal24", "mphy_refclk_ixtal24",
-- 
1.9.1
