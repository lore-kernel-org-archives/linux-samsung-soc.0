From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 17/18] clk: samsung: exynos5250: Move sleep init function to
 init section
Date: Wed, 11 May 2016 14:02:13 +0200
Message-ID: <1462968134-6085-17-git-send-email-k.kozlowski@samsung.com>
References: <1462968134-6085-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1462968134-6085-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The exynos5250_clk_sleep_init() function can be moved to init section
because it is referenced only from other init-level calls.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index f24001dcfb8a..bf5ce1baf636 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -190,7 +190,7 @@ static struct syscore_ops exynos5250_clk_syscore_ops = {
 	.resume = exynos5250_clk_resume,
 };
 
-static void exynos5250_clk_sleep_init(void)
+static void __init exynos5250_clk_sleep_init(void)
 {
 	exynos5250_save = samsung_clk_alloc_reg_dump(exynos5250_clk_regs,
 					ARRAY_SIZE(exynos5250_clk_regs));
@@ -203,7 +203,7 @@ static void exynos5250_clk_sleep_init(void)
 	register_syscore_ops(&exynos5250_clk_syscore_ops);
 }
 #else
-static void exynos5250_clk_sleep_init(void) {}
+static void __init exynos5250_clk_sleep_init(void) {}
 #endif
 
 /* list of all parent clock list */
-- 
1.9.1

