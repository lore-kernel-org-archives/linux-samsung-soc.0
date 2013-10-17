From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/8] clk: max77686: Correct callback used for checking clock
 status
Date: Thu, 17 Oct 2013 18:30:35 +0200
Message-ID: <1382027442-1992-2-git-send-email-t.figa@samsung.com>
References: <1382027442-1992-1-git-send-email-t.figa@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1382027442-1992-1-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Changing status of clock gates in max77686 requires i2c transfers, which
can sleep, so this is done in prepare and unprepare callbacks. Due to
this, checking whether whether the clock is ungated must be done
in is_prepared() callback as well, for consistency.

Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/clk/clk-max77686.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index 9f57bc3..e39d463 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -66,7 +66,7 @@ static void max77686_clk_unprepare(struct clk_hw *hw)
 		MAX77686_REG_32KHZ, max77686->mask, ~max77686->mask);
 }
 
-static int max77686_clk_is_enabled(struct clk_hw *hw)
+static int max77686_clk_is_prepared(struct clk_hw *hw)
 {
 	struct max77686_clk *max77686 = to_max77686_clk(hw);
 	int ret;
@@ -84,7 +84,7 @@ static int max77686_clk_is_enabled(struct clk_hw *hw)
 static struct clk_ops max77686_clk_ops = {
 	.prepare	= max77686_clk_prepare,
 	.unprepare	= max77686_clk_unprepare,
-	.is_enabled	= max77686_clk_is_enabled,
+	.is_prepared	= max77686_clk_is_prepared,
 };
 
 static struct clk_init_data max77686_clks_init[MAX77686_CLKS_NUM] = {
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
