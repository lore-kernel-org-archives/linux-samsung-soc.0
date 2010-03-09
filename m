From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] S3C: SDHCI: Add platform data parameters for clock
 configuration
Date: Tue, 09 Mar 2010 19:08:57 +0530
Message-ID: <1268141937-10878-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout5.samsung.com ([203.254.224.35]:42781 "EHLO
	mailout5.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752624Ab0CINhy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Mar 2010 08:37:54 -0500
Received: from epmmp2 (mailout5.samsung.com [203.254.224.35])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KZ0006TPOJ4EF@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Mar 2010 22:37:52 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KZ000B6QOIXBI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Mar 2010 22:37:52 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This patch adds two additional parameters in the S3C SDHCI platform
data structure for SDHCI SCLK clock configuration. This patch also
modifies the S3C SDHCI controller driver to use the new parameters.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/plat-samsung/include/plat/sdhci.h |    5 +++++
 drivers/mmc/host/sdhci-s3c.c               |    3 +++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
index b0a0528..705eee8 100644
--- a/arch/arm/plat-samsung/include/plat/sdhci.h
+++ b/arch/arm/plat-samsung/include/plat/sdhci.h
@@ -29,6 +29,8 @@ struct mmc_ios;
  *            is necessary the controllers and/or GPIO blocks require the
  *	      changing of driver-strength and other controls dependant on
  *	      the card and speed of operation.
+ * @sclk_mmc_freq: Clock frequency of SCLK MMC (mmc_bus).
+ * @cfg_clocks: Configure platform specific clocks.
  * @cfg_ext_cd: Configure external interrupt line.
  * @is_card_present: Returns status of card availability.
  * @ext_cd: The external GPIO interrupt number to be used.
@@ -49,6 +51,9 @@ struct s3c_sdhci_platdata {
 			    struct mmc_ios *ios,
 			    struct mmc_card *card);
 
+	unsigned int	sclk_mmc_freq;
+	void		(*cfg_clocks)(struct platform_device *pdev);
+
 	void		(*cfg_ext_cd)(void);
 	unsigned int	(*is_card_present)(void);
 	unsigned int	ext_cd;
diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 073b56f..980f906 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -282,6 +282,9 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 	/* enable the local io clock and keep it running for the moment. */
 	clk_enable(sc->clk_io);
 
+	if (pdata->cfg_clocks)
+		pdata->cfg_clocks(pdev);
+
 	for (clks = 0, ptr = 0; ptr < MAX_BUS_CLK; ptr++) {
 		struct clk *clk;
 		char *name = pdata->clocks[ptr];
-- 
1.6.6.rc2
