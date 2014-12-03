From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 3/3] clk: samsung: remove unnecessary inclusion of header
 files from clk.h
Date: Wed, 03 Dec 2014 17:01:32 +0530
Message-ID: <1417606292-26063-4-git-send-email-pankaj.dubey@samsung.com>
References: <1417606292-26063-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23936 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753351AbaLCLiy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 06:38:54 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NG0008MY8CTKV00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Dec 2014 20:38:53 +0900 (KST)
In-reply-to: <1417606292-26063-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, Pankaj Dubey <pankaj.dubey@samsung.com>

Let's remove unnecessary include of header files from clk.h and add
required one in clk.c

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/clk/samsung/clk.c |    1 +
 drivers/clk/samsung/clk.h |    4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 1b4cf3b..75d4215 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -12,6 +12,7 @@
 */
 
 #include <linux/syscore_ops.h>
+#include <linux/of_address.h>
 #include "clk.h"
 
 static LIST_HEAD(clock_reg_cache_list);
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 101a43b..8acabe1 100644
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
