From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 1/7] SPI: S3C64XX: Use bus clocks created using clkdev
Date: Fri, 23 Sep 2011 17:23:41 +0530
Message-ID: <1316778827-24694-2-git-send-email-padma.v@samsung.com>
References: <1316778827-24694-1-git-send-email-padma.v@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16588 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752240Ab1IWLr1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Sep 2011 07:47:27 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRZ0026A4R0XMQ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Sep 2011 20:47:26 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRZ009KD4QTUT@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Sep 2011 20:47:26 +0900 (KST)
In-reply-to: <1316778827-24694-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: grant.likely@secretlab.ca, jassisinghbrar@gmail.com, ben-linux@fluff.org, kgene.kim@samsung.com, s.nawrocki@samsung.com

This patch modifies the driver to stop depending on the
clock names being passed from platform and switch over
to lookup clocks generic names using clkdev

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 drivers/spi/spi-s3c64xx.c |   14 +++++---------
 1 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 019a716..dcf7e10 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -971,6 +971,7 @@ static int __init s3c64xx_spi_probe(struct platform_device *pdev)
 	struct s3c64xx_spi_info *sci;
 	struct spi_master *master;
 	int ret;
+	char clk_name[16];
 
 	if (pdev->id < 0) {
 		dev_err(&pdev->dev,
@@ -984,11 +985,6 @@ static int __init s3c64xx_spi_probe(struct platform_device *pdev)
 	}
 
 	sci = pdev->dev.platform_data;
-	if (!sci->src_clk_name) {
-		dev_err(&pdev->dev,
-			"Board init must call s3c64xx_spi_set_info()\n");
-		return -EINVAL;
-	}
 
 	/* Check for availability of necessary resource */
 
@@ -1073,17 +1069,17 @@ static int __init s3c64xx_spi_probe(struct platform_device *pdev)
 		goto err4;
 	}
 
-	sdd->src_clk = clk_get(&pdev->dev, sci->src_clk_name);
+	sprintf(clk_name, "spi_busclk%d", sci->src_clk_nr);
+	sdd->src_clk = clk_get(&pdev->dev, clk_name);
 	if (IS_ERR(sdd->src_clk)) {
 		dev_err(&pdev->dev,
-			"Unable to acquire clock '%s'\n", sci->src_clk_name);
+			"Unable to acquire clock '%s'\n", clk_name);
 		ret = PTR_ERR(sdd->src_clk);
 		goto err5;
 	}
 
 	if (clk_enable(sdd->src_clk)) {
-		dev_err(&pdev->dev, "Couldn't enable clock '%s'\n",
-							sci->src_clk_name);
+		dev_err(&pdev->dev, "Couldn't enable clock '%s'\n", clk_name);
 		ret = -EBUSY;
 		goto err6;
 	}
-- 
1.7.4.4
