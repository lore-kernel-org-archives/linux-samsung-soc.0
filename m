From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 2/3] clk: samsung: remove unnecessary CONFIG_OF from clk.c
Date: Sat, 27 Sep 2014 11:11:58 +0530
Message-ID: <1411796519-19417-3-git-send-email-pankaj.dubey@samsung.com>
References: <1411796519-19417-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11954 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751177AbaI0Fqq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 27 Sep 2014 01:46:46 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCJ00FX6PDXMCC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 27 Sep 2014 14:46:45 +0900 (KST)
In-reply-to: <1411796519-19417-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

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
