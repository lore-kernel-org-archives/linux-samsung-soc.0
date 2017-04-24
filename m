From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/6] clk: samsung: Remove dead code
Date: Mon, 24 Apr 2017 08:42:18 +0200
Message-ID: <1493016143-21569-2-git-send-email-m.szyprowski@samsung.com>
References: <1493016143-21569-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170424064228eucas1p2543d7f206ac18476891e500991611733@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49629 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1165573AbdDXGmf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 02:42:35 -0400
In-reply-to: <1493016143-21569-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

samsung_clk_register_pll2550x() function is not used anymore, so remove its
declaration.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-pll.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index a1ca0233cb4b..61eb8abbfd9c 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -103,8 +103,4 @@ struct samsung_pll_rate_table {
 	unsigned int vsel;
 };
 
-extern struct clk * __init samsung_clk_register_pll2550x(const char *name,
-			const char *pname, const void __iomem *reg_base,
-			const unsigned long offset);
-
 #endif /* __SAMSUNG_CLK_PLL_H */
-- 
1.9.1
