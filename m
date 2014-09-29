From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 1/3] clk: samsung: Spelling s/bwtween/between/
Date: Mon, 29 Sep 2014 13:17:46 +0530
Message-ID: <1411976868-22209-2-git-send-email-pankaj.dubey@samsung.com>
References: <1411976868-22209-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63411 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221AbaI2Hwz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 03:52:55 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCN00BP0KK5GKD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Sep 2014 16:52:53 +0900 (KST)
In-reply-to: <1411976868-22209-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Fix a typo in comment section of "struct samsung_clk_provider".

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
