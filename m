From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 3/3] [WATCHDOG] s3c2410_wdt - Fix on handling of the request_mem_region fail
Date: Thu, 20 May 2010 19:28:31 +0900
Message-ID: <1274351311-6879-4-git-send-email-kgene.kim@samsung.com>
References: <1274351311-6879-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36983 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755480Ab0EWWtV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 May 2010 18:49:21 -0400
In-Reply-To: <1274351311-6879-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Wim Van Sebroeck <wim@iguana.be>, Banajit Goswami <banajit.g@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Banajit Goswami <banajit.g@samsung.com>

If the request for wdt_mem region fails, this patch modifies the driver
such that, it does not try to release the wdt_mem region on exit.

Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Acked-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/watchdog/s3c2410_wdt.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index e4cebef..d421258 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -426,8 +426,7 @@ static int __devinit s3c2410wdt_probe(struct platform_device *pdev)
 	wdt_mem = request_mem_region(res->start, size, pdev->name);
 	if (wdt_mem == NULL) {
 		dev_err(dev, "failed to get memory region\n");
-		ret = -ENOENT;
-		goto err_req;
+		return -EBUSY;
 	}
 
 	wdt_base = ioremap(res->start, size);
-- 
1.6.2.5
