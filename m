From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 1/2] mmc: sdhci-s3c: Keep a copy of platform data and use it
Date: Sun, 17 Jul 2011 10:21:14 +0530
Message-ID: <1310878275-1422-2-git-send-email-thomas.abraham@linaro.org>
References: <1310878275-1422-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27653 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328Ab1GQEju (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jul 2011 00:39:50 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOG00DSGNM95P10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 17 Jul 2011 13:39:49 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOG00EGHNM4T7@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 17 Jul 2011 13:39:50 +0900 (KST)
In-reply-to: <1310878275-1422-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: cjb@laptop.org, ben-linux@fluff.org, linux-mmc@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The platform data is copied into driver's private data and the copy is
used for all access to the platform data. This simpifies the addition
of device tree support for the sdhci-s3c driver.

While at it, a redundant mmc caps setting is removed and
MMC_CAP_8_BIT_DATA is enabled, if the bus width is 8-bits wide.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 drivers/mmc/host/sdhci-s3c.c |   25 ++++++++++++-------------
 1 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 69e3ee3..bb159cc 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -43,7 +43,7 @@ struct sdhci_s3c {
 	struct sdhci_host	*host;
 	struct platform_device	*pdev;
 	struct resource		*ioarea;
-	struct s3c_sdhci_platdata *pdata;
+	struct s3c_sdhci_platdata pdata;
 	unsigned int		cur_clk;
 	int			ext_cd_irq;
 	int			ext_cd_gpio;
@@ -134,7 +134,7 @@ static unsigned int sdhci_s3c_consider_clock(struct sdhci_s3c *ourhost,
 	 * Clock divider's step is different as 1 from that of host controller
 	 * when 'clk_type' is S3C_SDHCI_CLK_DIV_EXTERNAL.
 	 */
-	if (ourhost->pdata->clk_type) {
+	if (ourhost->pdata.clk_type) {
 		rate = clk_round_rate(clksrc, wanted);
 		return wanted - rate;
 	}
@@ -209,8 +209,8 @@ static void sdhci_s3c_set_clock(struct sdhci_host *host, unsigned int clock)
 
 		ios.clock = clock;
 
-		if (ourhost->pdata->cfg_card)
-			(ourhost->pdata->cfg_card)(ourhost->pdev, host->ioaddr,
+		if (ourhost->pdata.cfg_card)
+			(ourhost->pdata.cfg_card)(ourhost->pdev, host->ioaddr,
 						   &ios, NULL);
 	}
 }
@@ -341,7 +341,7 @@ static irqreturn_t sdhci_s3c_gpio_card_detect_thread(int irq, void *dev_id)
 {
 	struct sdhci_s3c *sc = dev_id;
 	int status = gpio_get_value(sc->ext_cd_gpio);
-	if (sc->pdata->ext_cd_gpio_invert)
+	if (sc->pdata.ext_cd_gpio_invert)
 		status = !status;
 	sdhci_s3c_notify_change(sc->pdev, status);
 	return IRQ_HANDLED;
@@ -349,7 +349,7 @@ static irqreturn_t sdhci_s3c_gpio_card_detect_thread(int irq, void *dev_id)
 
 static void sdhci_s3c_setup_card_detect_gpio(struct sdhci_s3c *sc)
 {
-	struct s3c_sdhci_platdata *pdata = sc->pdata;
+	struct s3c_sdhci_platdata *pdata = &sc->pdata;
 	struct device *dev = &sc->pdev->dev;
 
 	if (gpio_request(pdata->ext_cd_gpio, "SDHCI EXT CD") == 0) {
@@ -375,14 +375,14 @@ static void sdhci_s3c_setup_card_detect_gpio(struct sdhci_s3c *sc)
 
 static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 {
-	struct s3c_sdhci_platdata *pdata = pdev->dev.platform_data;
+	struct s3c_sdhci_platdata *pdata;
 	struct device *dev = &pdev->dev;
 	struct sdhci_host *host;
 	struct sdhci_s3c *sc;
 	struct resource *res;
 	int ret, irq, ptr, clks;
 
-	if (!pdata) {
+	if (!pdev->dev.platform_data) {
 		dev_err(dev, "no device data specified\n");
 		return -ENOENT;
 	}
@@ -407,9 +407,10 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 
 	sc = sdhci_priv(host);
 
+	memcpy(&sc->pdata, pdev->dev.platform_data, sizeof(*pdata));
+	pdata = &sc->pdata;
 	sc->host = host;
 	sc->pdev = pdev;
-	sc->pdata = pdata;
 	sc->ext_cd_gpio = -1; /* invalid gpio number */
 
 	platform_set_drvdata(pdev, host);
@@ -509,6 +510,8 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 	if (pdata->cd_type == S3C_SDHCI_CD_PERMANENT)
 		host->mmc->caps = MMC_CAP_NONREMOVABLE;
 
+	if (pdata->max_width == 8)
+		host->mmc->caps |= MMC_CAP_8_BIT_DATA;
 	if (pdata->host_caps)
 		host->mmc->caps |= pdata->host_caps;
 
@@ -528,10 +531,6 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 		sdhci_s3c_ops.get_max_clock = sdhci_cmu_get_max_clock;
 	}
 
-	/* It supports additional host capabilities if needed */
-	if (pdata->host_caps)
-		host->mmc->caps |= pdata->host_caps;
-
 	ret = sdhci_add_host(host);
 	if (ret) {
 		dev_err(dev, "sdhci_add_host() failed\n");
-- 
1.7.1
