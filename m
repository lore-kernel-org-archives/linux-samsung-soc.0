From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 1/8] clk: max77686: Correct callback used for checking clock
 status
Date: Thu, 12 Dec 2013 17:07:14 +0100
Message-ID: <1386864441-19561-2-git-send-email-t.figa@samsung.com>
References: <1386864441-19561-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:51639 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751467Ab3LLQHp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 11:07:45 -0500
In-reply-to: <1386864441-19561-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Mike Turquette <mturquette@linaro.org>, Lee Jones <lee.jones@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Changing status of clock gates in max77686 requires i2c transfers, which
can sleep, so this is done in prepare and unprepare callbacks. Due to
this, checking whether whether the clock is ungated must be done
in is_prepared() callback as well, for consistency.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
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
1.8.4.3
