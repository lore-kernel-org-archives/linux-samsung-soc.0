From: Shailendra Verma <shailendra.capricorn@gmail.com>
Subject: [PATCH] clk:samsung:clk - Fix typo in panic log.
Date: Thu, 21 May 2015 23:26:03 +0530
Message-ID: <1432230963-3355-1-git-send-email-shailendra.capricorn@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Shailendra Verma <shailendra.capricorn@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org


Signed-off-by: Shailendra Verma <shailendra.capricorn@gmail.com>
---
 drivers/clk/samsung/clk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 9e1f88c..7649162 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -389,7 +389,7 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 
 	ctx = samsung_clk_init(np, reg_base, cmu->nr_clk_ids);
 	if (!ctx) {
-		panic("%s: unable to alllocate ctx\n", __func__);
+		panic("%s: unable to allocate ctx\n", __func__);
 		return ctx;
 	}
 
-- 
1.7.9.5
