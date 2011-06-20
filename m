From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 4/6] mmc: sdhci-s3c: Add support for device tree based probe
Date: Mon, 20 Jun 2011 16:32:30 +0530
Message-ID: <1308567752-13451-5-git-send-email-thomas.abraham@linaro.org>
References: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19214 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751980Ab1FTKxN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 06:53:13 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN3002UK4WH3MC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Jun 2011 19:53:12 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN300JSM4W4PB@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Jun 2011 19:53:12 +0900 (KST)
In-reply-to: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, patches@linaro.org

Add of_match_table to enable sdhci-s3c driver to be probed when a compatible
sdhci device node is found in device tree.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
This is temporary patch. sdhci-s3c driver has to be moved to sdhci-pltfm
based driver.

 drivers/mmc/host/sdhci-s3c.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 69e3ee3..5ccbee0 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -629,6 +629,16 @@ static int sdhci_s3c_resume(struct platform_device *dev)
 #define sdhci_s3c_resume NULL
 #endif
 
+#ifdef CONFIG_OF
+static const struct of_device_id s3c_sdhci_match[] = {
+	{ .compatible = "samsung,s3c-sdhci" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, s3c_sdhci_match);
+#else
+#define s3c_sdhci_match NULL
+#endif
+
 static struct platform_driver sdhci_s3c_driver = {
 	.probe		= sdhci_s3c_probe,
 	.remove		= __devexit_p(sdhci_s3c_remove),
@@ -637,6 +647,7 @@ static struct platform_driver sdhci_s3c_driver = {
 	.driver		= {
 		.owner	= THIS_MODULE,
 		.name	= "s3c-sdhci",
+		.of_match_table	= s3c_sdhci_match,
 	},
 };
 
-- 
1.6.6.rc2
