From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/8] clk: max77686: Refactor successful exit of probe function
Date: Thu, 17 Oct 2013 18:30:37 +0200
Message-ID: <1382027442-1992-4-git-send-email-t.figa@samsung.com>
References: <1382027442-1992-1-git-send-email-t.figa@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1382027442-1992-1-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The function can simply return 0, without jumping to a separate label,
which does exactly the same. This patch does not introduce any
functional change, just a clean-up.

Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/clk/clk-max77686.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index e40ecdb..5d78460 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -178,7 +178,7 @@ static int max77686_clk_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, max77686_clks);
 
-	goto out;
+	return 0;
 
 err_clk_pmic:
 	clkdev_drop(max77686_clks[MAX77686_CLK_CP]->lookup);
@@ -187,7 +187,6 @@ err_clk_cp:
 	clkdev_drop(max77686_clks[MAX77686_CLK_AP]->lookup);
 	kfree(max77686_clks[MAX77686_CLK_AP]->hw.clk);
 err_clk_ap:
-out:
 	return ret;
 }
 
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
