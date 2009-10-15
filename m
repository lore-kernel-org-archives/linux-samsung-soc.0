From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v2 3/4] S3C: sdhci: Configure clock source and populate module exit function.
Date: Thu, 15 Oct 2009 15:03:24 +0900
Message-ID: <1255586604-6934-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37189 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934670AbZJOGIb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Oct 2009 02:08:31 -0400
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.63)
	(envelope-from <thomas.ab@samsung.com>)
	id 1MyJUz-0006yU-GV
	for linux-samsung-soc@vger.kernel.org; Thu, 15 Oct 2009 08:07:41 +0200
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
	by meercat.kr.gnumonks.org with esmtp (Exim 4.68)
	(envelope-from <thomas.ab@samsung.com>)
	id 1MyJQq-0001o6-3v
	for linux-samsung-soc@vger.kernel.org; Thu, 15 Oct 2009 15:03:24 +0900
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This patch sets the parent clock, source clock and sdhci module
clock speed for 6410 sdhci controller. It also populates the module
exit function.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/mmc/host/sdhci-s3c.c |   58 +++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 57 insertions(+), 1 deletions(-)

diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 50997d2..7400ba0 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -22,6 +22,8 @@
 
 #include <plat/sdhci.h>
 #include <plat/regs-sdhci.h>
+#include <plat/clock.h>
+#include <plat/cpu.h>
 
 #include "sdhci.h"
 
@@ -36,6 +38,8 @@
  * @cur_clk: The index of the current bus clock.
  * @clk_io: The clock for the internal bus interface.
  * @clk_bus: The clocks that are available for the SD/MMC bus clock.
+ * @clk_mmc: The SDHCI controller clock source.
+ * @clk_parent: The SDHCI controller clock source's parent.
  */
 struct sdhci_s3c {
 	struct sdhci_host	*host;
@@ -46,6 +50,8 @@ struct sdhci_s3c {
 
 	struct clk		*clk_io;
 	struct clk		*clk_bus[MAX_BUS_CLK];
+	struct clk		*clk_mmc;
+	struct clk		*clk_parent;
 };
 
 static inline struct sdhci_s3c *to_s3c(struct sdhci_host *host)
@@ -222,6 +228,7 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 	struct sdhci_s3c *sc;
 	struct resource *res;
 	int ret, irq, ptr, clks;
+	struct clk *clk_mmc, *clk_parent;
 
 	if (!pdata) {
 		dev_err(dev, "no device data specified\n");
@@ -240,10 +247,26 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
+	clk_mmc = clk_get(dev, pdata->clk_source_name);
+	if (IS_ERR(clk_mmc)) {
+		dev_err(dev, "could not obtain source clock\n");
+		return -ENODEV;
+	}
+
+	clk_parent = clk_get(dev, pdata->clk_parent_name);
+	if (IS_ERR(clk_parent)) {
+		clk_put(clk_mmc);
+		dev_err(dev, "could not obtain parent clock");
+		return -ENODEV;
+	}
+	clk_set_parent(clk_mmc, clk_parent);
+	clk_set_rate(clk_mmc, pdata->clk_speed);
+
 	host = sdhci_alloc_host(dev, sizeof(struct sdhci_s3c));
 	if (IS_ERR(host)) {
 		dev_err(dev, "sdhci_alloc_host() failed\n");
-		return PTR_ERR(host);
+		ret = PTR_ERR(host);
+		goto err_host_alloc;
 	}
 
 	sc = sdhci_priv(host);
@@ -251,6 +274,8 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 	sc->host = host;
 	sc->pdev = pdev;
 	sc->pdata = pdata;
+	sc->clk_mmc = clk_mmc;
+	sc->clk_parent = clk_parent;
 
 	platform_set_drvdata(pdev, host);
 
@@ -367,11 +392,42 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
  err_io_clk:
 	sdhci_free_host(host);
 
+ err_host_alloc:
+	clk_put(clk_mmc);
+	clk_put(clk_parent);
+
 	return ret;
 }
 
 static int __devexit sdhci_s3c_remove(struct platform_device *pdev)
 {
+	struct sdhci_host *host =  platform_get_drvdata(pdev);
+	struct sdhci_s3c *sc = sdhci_priv(host);
+	int ptr, dead = 0;
+	u32 scratch;
+
+	scratch = readl(host->ioaddr + SDHCI_INT_STATUS);
+	if (scratch == (u32)-1)
+		dead = 1;
+
+	sdhci_remove_host(host, dead);
+
+	for (ptr = 0; ptr < ARRAY_SIZE(sc->clk_bus); ptr++) {
+		clk_disable(sc->clk_bus[ptr]);
+		clk_put(sc->clk_bus[ptr]);
+	}
+	clk_disable(sc->clk_io);
+	clk_put(sc->clk_io);
+	clk_put(sc->clk_mmc);
+	clk_put(sc->clk_parent);
+
+	iounmap(host->ioaddr);
+	release_resource(sc->ioarea);
+	kfree(sc->ioarea);
+
+	sdhci_free_host(host);
+	platform_set_drvdata(pdev, NULL);
+
 	return 0;
 }
 
-- 
1.5.3.4
