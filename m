From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 2/3] clk: samsung: remove unnecessary CONFIG_OF from clk.c
Date: Wed, 03 Dec 2014 17:01:31 +0530
Message-ID: <1417606292-26063-3-git-send-email-pankaj.dubey@samsung.com>
References: <1417606292-26063-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63629 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751930AbaLCLit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 06:38:49 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NG000JKO8CNJF60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Dec 2014 20:38:47 +0900 (KST)
In-reply-to: <1417606292-26063-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, Pankaj Dubey <pankaj.dubey@samsung.com>

Remove unnecessary CONFIG_OF from samsung/clk.c.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/clk/samsung/clk.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index dd1f7c9..1b4cf3b 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -283,7 +283,6 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
  * obtain the clock speed of all external fixed clock sources from device
  * tree and register it
  */
-#ifdef CONFIG_OF
 void __init samsung_clk_of_register_fixed_ext(struct samsung_clk_provider *ctx,
 			struct samsung_fixed_rate_clock *fixed_rate_clk,
 			unsigned int nr_fixed_rate_clk,
@@ -300,7 +299,6 @@ void __init samsung_clk_of_register_fixed_ext(struct samsung_clk_provider *ctx,
 	}
 	samsung_clk_register_fixed_rate(ctx, fixed_rate_clk, nr_fixed_rate_clk);
 }
-#endif
 
 /* utility function to get the rate of a specified clock */
 unsigned long _get_rate(const char *clk_name)
-- 
1.7.9.5
