From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v3 1/4] clk: s2mps11: merge two for loops in one
Date: Wed, 20 Jan 2016 19:14:21 +0900
Message-ID: <1453284864-8082-2-git-send-email-andi.shyti@samsung.com>
References: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

the driver already loops once, there is no reason to loop again
for a different purpose. Merge the second loop into the first.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 drivers/clk/clk-s2mps11.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index d266299..e7b97f4 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -244,12 +244,6 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 			ret = -ENOMEM;
 			goto err_reg;
 		}
-	}
-
-	for (i = 0; i < S2MPS11_CLKS_NUM; i++) {
-		/* Skip clocks not present on S2MPS14 */
-		if (!clks_init[i].name)
-			continue;
 		clk_table[i] = s2mps11_clks[i].clk;
 	}
 
-- 
2.7.0.rc3

