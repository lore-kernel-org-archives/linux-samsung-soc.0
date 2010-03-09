From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] S3C: SDHCI: Add platform data parameters for GPIO external
 interrupts.
Date: Tue, 09 Mar 2010 19:07:05 +0530
Message-ID: <1268141825-10828-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58836 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752624Ab0CINf7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Mar 2010 08:35:59 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KZ000GISOFXCD@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Mar 2010 22:35:57 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KZ000CLPOFSMW@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Mar 2010 22:35:57 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This patch adds platform parameters for external GPIO support for card
insertion/removal events. This is used for S3C SDHCI controllers that
does not use the SDCD pin for card detection.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/plat-samsung/include/plat/sdhci.h |    7 ++++++
 drivers/mmc/host/sdhci-s3c.c               |   30 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
index 7d07cd7..b0a0528 100644
--- a/arch/arm/plat-samsung/include/plat/sdhci.h
+++ b/arch/arm/plat-samsung/include/plat/sdhci.h
@@ -29,6 +29,9 @@ struct mmc_ios;
  *            is necessary the controllers and/or GPIO blocks require the
  *	      changing of driver-strength and other controls dependant on
  *	      the card and speed of operation.
+ * @cfg_ext_cd: Configure external interrupt line.
+ * @is_card_present: Returns status of card availability.
+ * @ext_cd: The external GPIO interrupt number to be used.
  *
  * Initialisation data specific to either the machine or the platform
  * for the device driver to use or call-back when configuring gpio or
@@ -45,6 +48,10 @@ struct s3c_sdhci_platdata {
 			    void __iomem *regbase,
 			    struct mmc_ios *ios,
 			    struct mmc_card *card);
+
+	void		(*cfg_ext_cd)(void);
+	unsigned int	(*is_card_present)(void);
+	unsigned int	ext_cd;
 };
 
 /**
diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index ebb17ac..073b56f 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -212,6 +212,20 @@ static void sdhci_s3c_set_clock(struct sdhci_host *host, unsigned int clock)
 	}
 }
 
+static irqreturn_t s3c_sdhci_irq_extcd(int irq, void *dev_id)
+{
+	struct sdhci_s3c *sc = dev_id;
+	u32 present = sc->pdata->is_card_present();
+
+	if (present)
+		sc->host->flags &= ~SDHCI_DEVICE_DEAD;
+	else
+		sc->host->flags |= SDHCI_DEVICE_DEAD;
+
+	tasklet_schedule(&sc->host->card_tasklet);
+	return IRQ_HANDLED;
+}
+
 static struct sdhci_ops sdhci_s3c_ops = {
 	.get_max_clock		= sdhci_s3c_get_max_clk,
 	.get_timeout_clock	= sdhci_s3c_get_timeout_clk,
@@ -346,14 +360,30 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 	host->quirks |= (SDHCI_QUIRK_32BIT_DMA_ADDR |
 			 SDHCI_QUIRK_32BIT_DMA_SIZE);
 
+	if (pdata->cfg_ext_cd) {
+		pdata->cfg_ext_cd();
+		if (!pdata->is_card_present())
+			host->flags |= SDHCI_DEVICE_DEAD;
+	}
+
 	ret = sdhci_add_host(host);
 	if (ret) {
 		dev_err(dev, "sdhci_add_host() failed\n");
 		goto err_add_host;
 	}
 
+	if (pdata->cfg_ext_cd) {
+		ret = request_irq(pdata->ext_cd, s3c_sdhci_irq_extcd,
+			IRQF_SHARED, mmc_hostname(host->mmc), sc);
+		if (ret)
+			goto err_req_cdirq;
+	}
+
 	return 0;
 
+ err_req_cdirq:
+	sdhci_remove_host(host, 0);
+
  err_add_host:
 	release_resource(sc->ioarea);
 	kfree(sc->ioarea);
-- 
1.6.6.rc2
