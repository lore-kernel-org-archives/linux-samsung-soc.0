From: Rajeshwari Shinde <rajeshwari.s@samsung.com>
Subject: [PATCH V2 1/3] SDHCI: S3C: Use generic clock names for sdhci bus clock
 options
Date: Tue, 11 Oct 2011 13:45:05 +0530
Message-ID: <1318320907-8580-2-git-send-email-rajeshwari.s@samsung.com>
References: <1318320907-8580-1-git-send-email-rajeshwari.s@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61278 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752609Ab1JKIS6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 04:18:58 -0400
In-reply-to: <1318320907-8580-1-git-send-email-rajeshwari.s@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: cjb@laptop.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

This patch modifies the driver to stop depending on the clock names
being passed from the platform and switch over to bus clock lookup
using generic clock names.

Signed-off-by: Rajeshwari Shinde <rajeshwari.s@samsung.com>
---
 drivers/mmc/host/sdhci-s3c.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 82709b6..a5fde87 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -435,14 +435,12 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 
 	for (clks = 0, ptr = 0; ptr < MAX_BUS_CLK; ptr++) {
 		struct clk *clk;
-		char *name = pdata->clocks[ptr];
+		char name[14];
 
-		if (name == NULL)
-			continue;
+		sprintf(name, "mmc_busclk.%d", ptr);
 
 		clk = clk_get(dev, name);
 		if (IS_ERR(clk)) {
-			dev_err(dev, "failed to get clock %s\n", name);
 			continue;
 		}
 
-- 
1.6.6.rc2
