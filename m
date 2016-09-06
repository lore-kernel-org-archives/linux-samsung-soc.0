From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 7/7] clk: samsung: clk-exynos-audss: Whitespace and debug
 trace cleanup
Date: Tue, 06 Sep 2016 14:04:56 +0200
Message-ID: <1473163496-17820-8-git-send-email-s.nawrocki@samsung.com>
References: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

There is no need to log probe() completion in normal conditions
so the "setup completed" log is removed.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos-audss.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 628f86b..51d152f 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -39,9 +39,9 @@ static struct clk *epll;
 
 #ifdef CONFIG_PM_SLEEP
 static unsigned long reg_save[][2] = {
-	{ASS_CLK_SRC,  0},
-	{ASS_CLK_DIV,  0},
-	{ASS_CLK_GATE, 0},
+	{ ASS_CLK_SRC,  0 },
+	{ ASS_CLK_DIV,  0 },
+	{ ASS_CLK_GATE, 0 },
 };
 
 static int exynos_audss_clk_suspend(void)
@@ -173,7 +173,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 			ret = clk_prepare_enable(epll);
 			if (ret) {
 				dev_err(&pdev->dev,
-						"failed to prepare the epll clock\n");
+					"failed to prepare the epll clock\n");
 				return ret;
 			}
 		}
@@ -253,9 +253,6 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 	register_syscore_ops(&exynos_audss_clk_syscore_ops);
 #endif
-
-	dev_info(&pdev->dev, "setup completed\n");
-
 	return 0;
 
 unregister:
-- 
1.9.1

