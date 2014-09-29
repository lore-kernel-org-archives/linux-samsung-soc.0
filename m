From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 3/3] clk: samsung: remove unnecessary inclusion of header
 files from clk.h
Date: Mon, 29 Sep 2014 13:17:48 +0530
Message-ID: <1411976868-22209-4-git-send-email-pankaj.dubey@samsung.com>
References: <1411976868-22209-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12032 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751610AbaI2HxC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 03:53:02 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCN0028CKKC6TC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Sep 2014 16:53:00 +0900 (KST)
In-reply-to: <1411976868-22209-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Let's remove unnecessary include of header files from clk.h and add
required one in clk.c

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/clk/samsung/clk.c |    3 ++-
 drivers/clk/samsung/clk.h |    4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 31bf391..952f9ec 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -11,7 +11,8 @@
  * clock framework for Samsung platforms.
 */
 
-#include <linux/syscore_ops.h>
+#include <linux/of_address.h>
+
 #include "clk.h"
 
 void samsung_clk_save(void __iomem *base,
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index a1ece4a..29a5779 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -13,12 +13,8 @@
 #ifndef __SAMSUNG_CLK_H
 #define __SAMSUNG_CLK_H
 
-#include <linux/clk.h>
 #include <linux/clkdev.h>
-#include <linux/io.h>
 #include <linux/clk-provider.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
 #include "clk-pll.h"
 
 /**
-- 
1.7.9.5
