From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 1/3] clk: samsung: Spelling s/bwtween/between/
Date: Sat, 27 Sep 2014 11:11:57 +0530
Message-ID: <1411796519-19417-2-git-send-email-pankaj.dubey@samsung.com>
References: <1411796519-19417-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56466 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751218AbaI0Fqp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 27 Sep 2014 01:46:45 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCJ00MRNPDW3950@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 27 Sep 2014 14:46:44 +0900 (KST)
In-reply-to: <1411796519-19417-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/clk/samsung/clk.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 66ab36b..a1ece4a 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -25,7 +25,7 @@
  * struct samsung_clk_provider: information about clock provider
  * @reg_base: virtual address for the register base.
  * @clk_data: holds clock related data like clk* and number of clocks.
- * @lock: maintains exclusion bwtween callbacks for a given clock-provider.
+ * @lock: maintains exclusion between callbacks for a given clock-provider.
  */
 struct samsung_clk_provider {
 	void __iomem *reg_base;
-- 
1.7.9.5
