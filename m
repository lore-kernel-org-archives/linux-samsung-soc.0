From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v2 2/3] clk: s2mps11: merge two for loop in one
Date: Tue, 19 Jan 2016 17:52:31 +0900
Message-ID: <1453193552-4761-3-git-send-email-andi.shyti@samsung.com>
References: <1453193552-4761-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47786 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932389AbcASIws (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jan 2016 03:52:48 -0500
In-reply-to: <1453193552-4761-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>

the driver already loops once, there is no reason to loop again
for a different purpose. Merge the second loop into the first.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 drivers/clk/clk-s2mps11.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 22d4df2..cae92fc 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -202,12 +202,6 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 			ret = -ENOMEM;
 			goto err_reg;
 		}
-	}
-
-	for (i = 0; i < S2MPS11_CLKS_NUM; i++) {
-		/* Skip clocks not present on S2MPS14 */
-		if (i == S2MPS11_CLK_CP && hwid == S2MPS14X)
-			continue;
 		clk_table[i] = s2mps11_clks[i].clk;
 	}
 
-- 
2.7.0.rc3
