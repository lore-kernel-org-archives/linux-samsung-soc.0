From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 1/3] clk: samsung: Spelling s/bwtween/between/
Date: Wed, 03 Dec 2014 17:01:30 +0530
Message-ID: <1417606292-26063-2-git-send-email-pankaj.dubey@samsung.com>
References: <1417606292-26063-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23897 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753191AbaLCLie (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 06:38:34 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NG0008JS8C9N900@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Dec 2014 20:38:33 +0900 (KST)
In-reply-to: <1417606292-26063-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, Pankaj Dubey <pankaj.dubey@samsung.com>

Fix a typo in comment section of "struct samsung_clk_provider".

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/clk/samsung/clk.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 3f471e9..101a43b 100644
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
