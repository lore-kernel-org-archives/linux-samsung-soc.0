From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 2/3] clk: samsung: remove unnecessary CONFIG_OF from clk.c
Date: Mon, 29 Sep 2014 13:17:47 +0530
Message-ID: <1411976868-22209-3-git-send-email-pankaj.dubey@samsung.com>
References: <1411976868-22209-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23999 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221AbaI2Hw7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 03:52:59 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCN00M8XKK9IS70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Sep 2014 16:52:57 +0900 (KST)
In-reply-to: <1411976868-22209-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Remove unnecessary CONFIG_OF from samsung/clk.c.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/clk/samsung/clk.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index deab84d..31bf391 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -281,7 +281,6 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
  * obtain the clock speed of all external fixed clock sources from device
  * tree and register it
  */
-#ifdef CONFIG_OF
 void __init samsung_clk_of_register_fixed_ext(struct samsung_clk_provider *ctx,
 			struct samsung_fixed_rate_clock *fixed_rate_clk,
 			unsigned int nr_fixed_rate_clk,
@@ -298,7 +297,6 @@ void __init samsung_clk_of_register_fixed_ext(struct samsung_clk_provider *ctx,
 	}
 	samsung_clk_register_fixed_rate(ctx, fixed_rate_clk, nr_fixed_rate_clk);
 }
-#endif
 
 /* utility function to get the rate of a specified clock */
 unsigned long _get_rate(const char *clk_name)
-- 
1.7.9.5
