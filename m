From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 1/7] ARM: SAMSUNG: Add clkdev infrastructure
Date: Fri, 20 May 2011 02:48:20 +0530
Message-ID: <1305839906-1815-2-git-send-email-thomas.ab@samsung.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12916 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932627Ab1ESVLW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2011 17:11:22 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLG00BKZO6OS4F0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:21 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLG00EO5O6MUX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 06:11:21 +0900 (KST)
In-reply-to: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

The struct clk definition for Samsung platforms is extended to include
a instance of struct clk_lookup and a device name. When clocks are
registered using s3c24xx_register_clock function, the dev_id, con_id
and clk members are initialized with information from the struct clk
instance and struct clk_lookup member is registered.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/plat-samsung/clock.c              |   83 ++--------------------------
 arch/arm/plat-samsung/include/plat/clock.h |    3 +
 2 files changed, 8 insertions(+), 78 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 7728928..6956fed 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -71,74 +71,6 @@ static int clk_null_enable(struct clk *clk, int enable)
 	return 0;
 }
 
-static int dev_is_s3c_uart(struct device *dev)
-{
-	struct platform_device **pdev = s3c24xx_uart_devs;
-	int i;
-	for (i = 0; i < ARRAY_SIZE(s3c24xx_uart_devs); i++, pdev++)
-		if (*pdev && dev == &(*pdev)->dev)
-			return 1;
-	return 0;
-}
-
-/*
- * Serial drivers call get_clock() very early, before platform bus
- * has been set up, this requires a special check to let them get
- * a proper clock
- */
-
-static int dev_is_platform_device(struct device *dev)
-{
-	return dev->bus == &platform_bus_type ||
-	       (dev->bus == NULL && dev_is_s3c_uart(dev));
-}
-
-/* Clock API calls */
-
-struct clk *clk_get(struct device *dev, const char *id)
-{
-	struct clk *p;
-	struct clk *clk = ERR_PTR(-ENOENT);
-	int idno;
-
-	if (dev == NULL || !dev_is_platform_device(dev))
-		idno = -1;
-	else
-		idno = to_platform_device(dev)->id;
-
-	spin_lock(&clocks_lock);
-
-	list_for_each_entry(p, &clocks, list) {
-		if (p->id == idno &&
-		    strcmp(id, p->name) == 0 &&
-		    try_module_get(p->owner)) {
-			clk = p;
-			break;
-		}
-	}
-
-	/* check for the case where a device was supplied, but the
-	 * clock that was being searched for is not device specific */
-
-	if (IS_ERR(clk)) {
-		list_for_each_entry(p, &clocks, list) {
-			if (p->id == -1 && strcmp(id, p->name) == 0 &&
-			    try_module_get(p->owner)) {
-				clk = p;
-				break;
-			}
-		}
-	}
-
-	spin_unlock(&clocks_lock);
-	return clk;
-}
-
-void clk_put(struct clk *clk)
-{
-	module_put(clk->owner);
-}
-
 int clk_enable(struct clk *clk)
 {
 	if (IS_ERR(clk) || clk == NULL)
@@ -241,8 +173,6 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 	return ret;
 }
 
-EXPORT_SYMBOL(clk_get);
-EXPORT_SYMBOL(clk_put);
 EXPORT_SYMBOL(clk_enable);
 EXPORT_SYMBOL(clk_disable);
 EXPORT_SYMBOL(clk_get_rate);
@@ -346,14 +276,11 @@ int s3c24xx_register_clock(struct clk *clk)
 	if (clk->enable == NULL)
 		clk->enable = clk_null_enable;
 
-	/* add to the list of available clocks */
-
-	/* Quick check to see if this clock has already been registered. */
-	BUG_ON(clk->list.prev != clk->list.next);
-
-	spin_lock(&clocks_lock);
-	list_add(&clk->list, &clocks);
-	spin_unlock(&clocks_lock);
+	/* fill up the clk_lookup structure and register it*/
+	clk->lookup.dev_id = clk->devname;
+	clk->lookup.con_id = clk->name;
+	clk->lookup.clk = clk;
+	clkdev_add(&clk->lookup);
 
 	return 0;
 }
diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
index 983c578..87d5b38 100644
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
@@ -47,6 +49,7 @@ struct clk {
 
 	struct clk_ops		*ops;
 	int		    (*enable)(struct clk *, int enable);
+	struct clk_lookup	lookup;
 #if defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS)
 	struct dentry		*dent;	/* For visible tree hierarchy */
 #endif
-- 
1.6.6.rc2
