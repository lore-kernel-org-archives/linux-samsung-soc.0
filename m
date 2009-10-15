From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v2 4/4] S3C: sdhci: Enable ADMA feature in S3C sdhci controller.
Date: Thu, 15 Oct 2009 15:04:57 +0900
Message-ID: <1255586697-7803-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37190 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934682AbZJOGIa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Oct 2009 02:08:30 -0400
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.63)
	(envelope-from <thomas.ab@samsung.com>)
	id 1MyJUz-0006yW-J7
	for linux-samsung-soc@vger.kernel.org; Thu, 15 Oct 2009 08:07:41 +0200
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
	by meercat.kr.gnumonks.org with esmtp (Exim 4.68)
	(envelope-from <thomas.ab@samsung.com>)
	id 1MyJSL-000227-DI
	for linux-samsung-soc@vger.kernel.org; Thu, 15 Oct 2009 15:04:57 +0900
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This patch enables ADMA feature in S3C SDHCI controller driver.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/mmc/host/sdhci-s3c.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 7400ba0..03f7e3b 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -341,12 +341,7 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 	host->irq = irq;
 
 	/* Setup quirks for the controller */
-
-	/* Currently with ADMA enabled we are getting some length
-	 * interrupts that are not being dealt with, do disable
-	 * ADMA until this is sorted out. */
-	host->quirks |= SDHCI_QUIRK_BROKEN_ADMA;
-	host->quirks |= SDHCI_QUIRK_32BIT_ADMA_SIZE;
+	host->quirks |= SDHCI_QUIRK_NO_ENDATTR_IN_NOPDESC;
 
 #ifndef CONFIG_MMC_SDHCI_S3C_DMA
 
-- 
1.5.3.4
