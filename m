From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 3/5] ARM: SAMSUNG: Add clkdev support
Date: Mon, 28 Mar 2011 16:37:38 +0530
Message-ID: <1301310460-20974-4-git-send-email-thomas.ab@samsung.com>
References: <1301310460-20974-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16858 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751111Ab1C1LHn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2011 07:07:43 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIR001LOLKQC3A0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Mar 2011 20:07:38 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIR00B5JLKIZA@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Mar 2011 20:07:38 +0900 (KST)
In-reply-to: <1301310460-20974-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

Add infrastructure for clkdev support on samsung platforms.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/plat-samsung/clock.c              |   18 ++++++++++++++++++
 arch/arm/plat-samsung/include/plat/clock.h |    5 +++++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 7728928..177580e 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -71,6 +71,12 @@ static int clk_null_enable(struct clk *clk, int enable)
 	return 0;
 }
 
+/*
+ * When all Samsung platforms use clkdev, pdev->id based clock lookup
+ * code can be removed.
+ */
+#ifndef CONFIG_CLKDEV_LOOKUP
+
 static int dev_is_s3c_uart(struct device *dev)
 {
 	struct platform_device **pdev = s3c24xx_uart_devs;
@@ -139,6 +145,8 @@ void clk_put(struct clk *clk)
 	module_put(clk->owner);
 }
 
+#endif /* CONFIG_CLKDEV_LOOKUP */
+
 int clk_enable(struct clk *clk)
 {
 	if (IS_ERR(clk) || clk == NULL)
@@ -241,8 +249,10 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 	return ret;
 }
 
+#ifndef CONFIG_CLKDEV_LOOKUP
 EXPORT_SYMBOL(clk_get);
 EXPORT_SYMBOL(clk_put);
+#endif
 EXPORT_SYMBOL(clk_enable);
 EXPORT_SYMBOL(clk_disable);
 EXPORT_SYMBOL(clk_get_rate);
@@ -346,6 +356,7 @@ int s3c24xx_register_clock(struct clk *clk)
 	if (clk->enable == NULL)
 		clk->enable = clk_null_enable;
 
+#ifndef CONFIG_CLKDEV_LOOKUP
 	/* add to the list of available clocks */
 
 	/* Quick check to see if this clock has already been registered. */
@@ -354,6 +365,13 @@ int s3c24xx_register_clock(struct clk *clk)
 	spin_lock(&clocks_lock);
 	list_add(&clk->list, &clocks);
 	spin_unlock(&clocks_lock);
+#else
+	/* fill up the clk_lookup structure and register it*/
+	clk->lookup.dev_id = clk->devname;
+	clk->lookup.con_id = clk->name;
+	clk->lookup.clk = clk;
+	clkdev_add(&clk->lookup);
+#endif
 
 	return 0;
 }
diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
index 9a82b88..5ef5ec1 100644
--- a/arch/arm/plat-samsung/include/plat/clock.h
+++ b/arch/arm/plat-samsung/include/plat/clock.h
@@ -10,6 +10,7 @@
 */
 
 #include <linux/spinlock.h>
+#include <linux/clkdev.h>
 
 struct clk;
 
@@ -40,6 +41,7 @@ struct clk {
 	struct module        *owner;
 	struct clk           *parent;
 	const char           *name;
+	const char		*devname;
 	int		      id;
 	int		      usage;
 	unsigned long         rate;
@@ -47,6 +49,9 @@ struct clk {
 
 	struct clk_ops		*ops;
 	int		    (*enable)(struct clk *, int enable);
+#ifdef CONFIG_CLKDEV_LOOKUP
+	struct clk_lookup	lookup;
+#endif
 #if defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS)
 	struct dentry		*dent;	/* For visible tree hierarchy */
 #endif
-- 
1.6.6.rc2
