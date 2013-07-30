From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 04/35] spi: use dev_get_platdata()
Date: Tue, 30 Jul 2013 16:58:59 +0900
Message-ID: <003601ce8cfa$a63ab120$f2b01360$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51997 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752067Ab3G3H7B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jul 2013 03:59:01 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>

Use the wrapper function for retrieving the platform data instead of
accessing dev->platform_data directly.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/spi/spi-altera.c        |    2 +-
 drivers/spi/spi-ath79.c         |    2 +-
 drivers/spi/spi-au1550.c        |    2 +-
 drivers/spi/spi-bcm63xx.c       |    2 +-
 drivers/spi/spi-bfin-sport.c    |    2 +-
 drivers/spi/spi-bfin-v3.c       |    2 +-
 drivers/spi/spi-bfin5xx.c       |    2 +-
 drivers/spi/spi-coldfire-qspi.c |    2 +-
 drivers/spi/spi-davinci.c       |    4 ++--
 drivers/spi/spi-ep93xx.c        |    2 +-
 drivers/spi/spi-fsl-espi.c      |    4 ++--
 drivers/spi/spi-fsl-lib.c       |    2 +-
 drivers/spi/spi-fsl-spi.c       |   13 +++++++------
 drivers/spi/spi-gpio.c          |    4 ++--
 drivers/spi/spi-mpc512x-psc.c   |    2 +-
 drivers/spi/spi-mpc52xx-psc.c   |    2 +-
 drivers/spi/spi-nuc900.c        |    2 +-
 drivers/spi/spi-oc-tiny.c       |    2 +-
 drivers/spi/spi-omap-100k.c     |    2 +-
 drivers/spi/spi-omap2-mcspi.c   |    2 +-
 drivers/spi/spi-pl022.c         |    3 ++-
 drivers/spi/spi-rspi.c          |    2 +-
 drivers/spi/spi-s3c24xx.c       |    2 +-
 drivers/spi/spi-s3c64xx.c       |    4 ++--
 drivers/spi/spi-sh-msiof.c      |    2 +-
 drivers/spi/spi-sh-sci.c        |    2 +-
 drivers/spi/spi-ti-ssp.c        |    2 +-
 drivers/spi/spi-tle62x0.c       |    2 +-
 drivers/spi/spi-xilinx.c        |    2 +-
 29 files changed, 40 insertions(+), 38 deletions(-)

diff --git a/drivers/spi/spi-altera.c b/drivers/spi/spi-altera.c
index 81b9adb..e53caac 100644
--- a/drivers/spi/spi-altera.c
+++ b/drivers/spi/spi-altera.c
@@ -217,7 +217,7 @@ static irqreturn_t altera_spi_irq(int irq, void *dev)
 
 static int altera_spi_probe(struct platform_device *pdev)
 {
-	struct altera_spi_platform_data *platp = pdev->dev.platform_data;
+	struct altera_spi_platform_data *platp = dev_get_platdata(&pdev->dev);
 	struct altera_spi *hw;
 	struct spi_master *master;
 	struct resource *res;
diff --git a/drivers/spi/spi-ath79.c b/drivers/spi/spi-ath79.c
index 0e06407..37bad95 100644
--- a/drivers/spi/spi-ath79.c
+++ b/drivers/spi/spi-ath79.c
@@ -221,7 +221,7 @@ static int ath79_spi_probe(struct platform_device *pdev)
 	sp = spi_master_get_devdata(master);
 	platform_set_drvdata(pdev, sp);
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 
 	master->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 32);
 	master->setup = ath79_spi_setup;
diff --git a/drivers/spi/spi-au1550.c b/drivers/spi/spi-au1550.c
index e196555..1d00d9b3 100644
--- a/drivers/spi/spi-au1550.c
+++ b/drivers/spi/spi-au1550.c
@@ -776,7 +776,7 @@ static int au1550_spi_probe(struct platform_device *pdev)
 	hw = spi_master_get_devdata(master);
 
 	hw->master = spi_master_get(master);
-	hw->pdata = pdev->dev.platform_data;
+	hw->pdata = dev_get_platdata(&pdev->dev);
 	hw->dev = &pdev->dev;
 
 	if (hw->pdata == NULL) {
diff --git a/drivers/spi/spi-bcm63xx.c b/drivers/spi/spi-bcm63xx.c
index 4ac028d..b454f1b 100644
--- a/drivers/spi/spi-bcm63xx.c
+++ b/drivers/spi/spi-bcm63xx.c
@@ -335,7 +335,7 @@ static int bcm63xx_spi_probe(struct platform_device *pdev)
 {
 	struct resource *r;
 	struct device *dev = &pdev->dev;
-	struct bcm63xx_spi_pdata *pdata = pdev->dev.platform_data;
+	struct bcm63xx_spi_pdata *pdata = dev_get_platdata(&pdev->dev);
 	int irq;
 	struct spi_master *master;
 	struct clk *clk;
diff --git a/drivers/spi/spi-bfin-sport.c b/drivers/spi/spi-bfin-sport.c
index 07ec597..91921b5 100644
--- a/drivers/spi/spi-bfin-sport.c
+++ b/drivers/spi/spi-bfin-sport.c
@@ -756,7 +756,7 @@ static int bfin_sport_spi_probe(struct platform_device *pdev)
 	struct bfin_sport_spi_master_data *drv_data;
 	int status;
 
-	platform_info = dev->platform_data;
+	platform_info = dev_get_platdata(dev);
 
 	/* Allocate master with space for drv_data */
 	master = spi_alloc_master(dev, sizeof(*master) + 16);
diff --git a/drivers/spi/spi-bfin-v3.c b/drivers/spi/spi-bfin-v3.c
index 603d7e9..85fdc12 100644
--- a/drivers/spi/spi-bfin-v3.c
+++ b/drivers/spi/spi-bfin-v3.c
@@ -773,7 +773,7 @@ static irqreturn_t bfin_spi_rx_dma_isr(int irq, void *dev_id)
 static int bfin_spi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct bfin_spi3_master *info = dev->platform_data;
+	struct bfin_spi3_master *info = dev_get_platdata(dev);
 	struct spi_master *master;
 	struct bfin_spi_master *drv_data;
 	struct resource *mem, *res;
diff --git a/drivers/spi/spi-bfin5xx.c b/drivers/spi/spi-bfin5xx.c
index 59a7342..45bdf73 100644
--- a/drivers/spi/spi-bfin5xx.c
+++ b/drivers/spi/spi-bfin5xx.c
@@ -1271,7 +1271,7 @@ static int bfin_spi_probe(struct platform_device *pdev)
 	struct resource *res;
 	int status = 0;
 
-	platform_info = dev->platform_data;
+	platform_info = dev_get_platdata(dev);
 
 	/* Allocate master with space for drv_data */
 	master = spi_alloc_master(dev, sizeof(*drv_data));
diff --git a/drivers/spi/spi-coldfire-qspi.c b/drivers/spi/spi-coldfire-qspi.c
index e4265ea..a84de9a 100644
--- a/drivers/spi/spi-coldfire-qspi.c
+++ b/drivers/spi/spi-coldfire-qspi.c
@@ -382,7 +382,7 @@ static int mcfqspi_probe(struct platform_device *pdev)
 	struct mcfqspi_platform_data *pdata;
 	int status;
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 	if (!pdata) {
 		dev_dbg(&pdev->dev, "platform data is missing\n");
 		return -ENOENT;
diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
index 707966b..8fbfe24 100644
--- a/drivers/spi/spi-davinci.c
+++ b/drivers/spi/spi-davinci.c
@@ -872,8 +872,8 @@ static int davinci_spi_probe(struct platform_device *pdev)
 		goto free_master;
 	}
 
-	if (pdev->dev.platform_data) {
-		pdata = pdev->dev.platform_data;
+	if (dev_get_platdata(&pdev->dev)) {
+		pdata = dev_get_platdata(&pdev->dev);
 		dspi->pdata = *pdata;
 	} else {
 		/* update dspi pdata with that from the DT */
diff --git a/drivers/spi/spi-ep93xx.c b/drivers/spi/spi-ep93xx.c
index 4c9a50c..1ee3030 100644
--- a/drivers/spi/spi-ep93xx.c
+++ b/drivers/spi/spi-ep93xx.c
@@ -874,7 +874,7 @@ static int ep93xx_spi_probe(struct platform_device *pdev)
 	int irq;
 	int error;
 
-	info = pdev->dev.platform_data;
+	info = dev_get_platdata(&pdev->dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
diff --git a/drivers/spi/spi-fsl-espi.c b/drivers/spi/spi-fsl-espi.c
index 6a74d78..b8f1103 100644
--- a/drivers/spi/spi-fsl-espi.c
+++ b/drivers/spi/spi-fsl-espi.c
@@ -584,7 +584,7 @@ static void fsl_espi_remove(struct mpc8xxx_spi *mspi)
 static struct spi_master * fsl_espi_probe(struct device *dev,
 		struct resource *mem, unsigned int irq)
 {
-	struct fsl_spi_platform_data *pdata = dev->platform_data;
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
 	struct spi_master *master;
 	struct mpc8xxx_spi *mpc8xxx_spi;
 	struct fsl_espi_reg *reg_base;
@@ -665,7 +665,7 @@ err:
 static int of_fsl_espi_get_chipselects(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
-	struct fsl_spi_platform_data *pdata = dev->platform_data;
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
 	const u32 *prop;
 	int len;
 
diff --git a/drivers/spi/spi-fsl-lib.c b/drivers/spi/spi-fsl-lib.c
index e947f2d..0b75f26 100644
--- a/drivers/spi/spi-fsl-lib.c
+++ b/drivers/spi/spi-fsl-lib.c
@@ -122,7 +122,7 @@ const char *mpc8xxx_spi_strmode(unsigned int flags)
 int mpc8xxx_spi_probe(struct device *dev, struct resource *mem,
 			unsigned int irq)
 {
-	struct fsl_spi_platform_data *pdata = dev->platform_data;
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
 	struct spi_master *master;
 	struct mpc8xxx_spi *mpc8xxx_spi;
 	int ret = 0;
diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index ca0ddb8..2129fcd 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -574,7 +574,7 @@ static void fsl_spi_grlib_cs_control(struct spi_device *spi, bool on)
 
 static void fsl_spi_grlib_probe(struct device *dev)
 {
-	struct fsl_spi_platform_data *pdata = dev->platform_data;
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct mpc8xxx_spi *mpc8xxx_spi = spi_master_get_devdata(master);
 	struct fsl_spi_reg *reg_base = mpc8xxx_spi->reg_base;
@@ -600,7 +600,7 @@ static void fsl_spi_grlib_probe(struct device *dev)
 static struct spi_master * fsl_spi_probe(struct device *dev,
 		struct resource *mem, unsigned int irq)
 {
-	struct fsl_spi_platform_data *pdata = dev->platform_data;
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
 	struct spi_master *master;
 	struct mpc8xxx_spi *mpc8xxx_spi;
 	struct fsl_spi_reg *reg_base;
@@ -700,7 +700,8 @@ err:
 static void fsl_spi_cs_control(struct spi_device *spi, bool on)
 {
 	struct device *dev = spi->dev.parent->parent;
-	struct mpc8xxx_spi_probe_info *pinfo = to_of_pinfo(dev->platform_data);
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
+	struct mpc8xxx_spi_probe_info *pinfo = to_of_pinfo(pdata);
 	u16 cs = spi->chip_select;
 	int gpio = pinfo->gpios[cs];
 	bool alow = pinfo->alow_flags[cs];
@@ -711,7 +712,7 @@ static void fsl_spi_cs_control(struct spi_device *spi, bool on)
 static int of_fsl_spi_get_chipselects(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
-	struct fsl_spi_platform_data *pdata = dev->platform_data;
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
 	struct mpc8xxx_spi_probe_info *pinfo = to_of_pinfo(pdata);
 	int ngpios;
 	int i = 0;
@@ -790,7 +791,7 @@ err_alloc_flags:
 
 static int of_fsl_spi_free_chipselects(struct device *dev)
 {
-	struct fsl_spi_platform_data *pdata = dev->platform_data;
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
 	struct mpc8xxx_spi_probe_info *pinfo = to_of_pinfo(pdata);
 	int i;
 
@@ -889,7 +890,7 @@ static int plat_mpc8xxx_spi_probe(struct platform_device *pdev)
 	int irq;
 	struct spi_master *master;
 
-	if (!pdev->dev.platform_data)
+	if (!dev_get_platdata(&pdev->dev))
 		return -EINVAL;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/drivers/spi/spi-gpio.c b/drivers/spi/spi-gpio.c
index a54524c..68b69fe 100644
--- a/drivers/spi/spi-gpio.c
+++ b/drivers/spi/spi-gpio.c
@@ -420,7 +420,7 @@ static int spi_gpio_probe(struct platform_device *pdev)
 	if (status > 0)
 		use_of = 1;
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 #ifdef GENERIC_BITBANG
 	if (!pdata || !pdata->num_chipselect)
 		return -ENODEV;
@@ -506,7 +506,7 @@ static int spi_gpio_remove(struct platform_device *pdev)
 	int				status;
 
 	spi_gpio = platform_get_drvdata(pdev);
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 
 	/* stop() unregisters child devices too */
 	status = spi_bitbang_stop(&spi_gpio->bitbang);
diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c
index 29fce6a..de0976c 100644
--- a/drivers/spi/spi-mpc512x-psc.c
+++ b/drivers/spi/spi-mpc512x-psc.c
@@ -474,7 +474,7 @@ static int mpc512x_psc_spi_do_probe(struct device *dev, u32 regaddr,
 					      u32 size, unsigned int irq,
 					      s16 bus_num)
 {
-	struct fsl_spi_platform_data *pdata = dev->platform_data;
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
 	struct mpc512x_psc_spi *mps;
 	struct spi_master *master;
 	int ret;
diff --git a/drivers/spi/spi-mpc52xx-psc.c b/drivers/spi/spi-mpc52xx-psc.c
index fed0571..6e925dc 100644
--- a/drivers/spi/spi-mpc52xx-psc.c
+++ b/drivers/spi/spi-mpc52xx-psc.c
@@ -366,7 +366,7 @@ static irqreturn_t mpc52xx_psc_spi_isr(int irq, void *dev_id)
 static int mpc52xx_psc_spi_do_probe(struct device *dev, u32 regaddr,
 				u32 size, unsigned int irq, s16 bus_num)
 {
-	struct fsl_spi_platform_data *pdata = dev->platform_data;
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
 	struct mpc52xx_psc_spi *mps;
 	struct spi_master *master;
 	int ret;
diff --git a/drivers/spi/spi-nuc900.c b/drivers/spi/spi-nuc900.c
index 150d854..e19a307 100644
--- a/drivers/spi/spi-nuc900.c
+++ b/drivers/spi/spi-nuc900.c
@@ -361,7 +361,7 @@ static int nuc900_spi_probe(struct platform_device *pdev)
 
 	hw = spi_master_get_devdata(master);
 	hw->master = spi_master_get(master);
-	hw->pdata  = pdev->dev.platform_data;
+	hw->pdata  = dev_get_platdata(&pdev->dev);
 	hw->dev = &pdev->dev;
 
 	if (hw->pdata == NULL) {
diff --git a/drivers/spi/spi-oc-tiny.c b/drivers/spi/spi-oc-tiny.c
index 58deb79..8de5056 100644
--- a/drivers/spi/spi-oc-tiny.c
+++ b/drivers/spi/spi-oc-tiny.c
@@ -285,7 +285,7 @@ static int tiny_spi_of_probe(struct platform_device *pdev)
 
 static int tiny_spi_probe(struct platform_device *pdev)
 {
-	struct tiny_spi_platform_data *platp = pdev->dev.platform_data;
+	struct tiny_spi_platform_data *platp = dev_get_platdata(&pdev->dev);
 	struct tiny_spi *hw;
 	struct spi_master *master;
 	struct resource *res;
diff --git a/drivers/spi/spi-omap-100k.c b/drivers/spi/spi-omap-100k.c
index cdcc72c..69ecf05 100644
--- a/drivers/spi/spi-omap-100k.c
+++ b/drivers/spi/spi-omap-100k.c
@@ -441,7 +441,7 @@ static int omap1_spi100k_probe(struct platform_device *pdev)
 	 * You should allocate this with ioremap() before initializing
 	 * the SPI.
 	 */
-	spi100k->base = (void __iomem *) pdev->dev.platform_data;
+	spi100k->base = (void __iomem *)dev_get_platdata(&pdev->dev);
 
 	spi100k->ick = devm_clk_get(&pdev->dev, "ick");
 	if (IS_ERR(spi100k->ick)) {
diff --git a/drivers/spi/spi-omap2-mcspi.c b/drivers/spi/spi-omap2-mcspi.c
index 973c1cb..ed4af47 100644
--- a/drivers/spi/spi-omap2-mcspi.c
+++ b/drivers/spi/spi-omap2-mcspi.c
@@ -1322,7 +1322,7 @@ static int omap2_mcspi_probe(struct platform_device *pdev)
 		if (of_get_property(node, "ti,pindir-d0-out-d1-in", NULL))
 			mcspi->pin_dir = MCSPI_PINDIR_D0_OUT_D1_IN;
 	} else {
-		pdata = pdev->dev.platform_data;
+		pdata = dev_get_platdata(&pdev->dev);
 		master->num_chipselect = pdata->num_cs;
 		if (pdev->id != -1)
 			master->bus_num = pdev->id;
diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
index 07e6db6..20f62ef 100644
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@ -2072,7 +2072,8 @@ pl022_platform_data_dt_get(struct device *dev)
 static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
-	struct pl022_ssp_controller *platform_info = adev->dev.platform_data;
+	struct pl022_ssp_controller *platform_info =
+			dev_get_platdata(&adev->dev);
 	struct spi_master *master;
 	struct pl022 *pl022 = NULL;	/*Data for this driver */
 	struct device_node *np = adev->dev.of_node;
diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index b44a6ac..aa5fc52 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -664,7 +664,7 @@ static irqreturn_t rspi_irq(int irq, void *_sr)
 static int rspi_request_dma(struct rspi_data *rspi,
 				      struct platform_device *pdev)
 {
-	struct rspi_plat_data *rspi_pd = pdev->dev.platform_data;
+	struct rspi_plat_data *rspi_pd = dev_get_platdata(&pdev->dev);
 	dma_cap_mask_t mask;
 	struct dma_slave_config cfg;
 	int ret;
diff --git a/drivers/spi/spi-s3c24xx.c b/drivers/spi/spi-s3c24xx.c
index 68910b3..5d43a28 100644
--- a/drivers/spi/spi-s3c24xx.c
+++ b/drivers/spi/spi-s3c24xx.c
@@ -525,7 +525,7 @@ static int s3c24xx_spi_probe(struct platform_device *pdev)
 	memset(hw, 0, sizeof(struct s3c24xx_spi));
 
 	hw->master = spi_master_get(master);
-	hw->pdata = pdata = pdev->dev.platform_data;
+	hw->pdata = pdata = dev_get_platdata(&pdev->dev);
 	hw->dev = &pdev->dev;
 
 	if (pdata == NULL) {
diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 62f32c4..cb75786 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1254,7 +1254,7 @@ static struct s3c64xx_spi_info *s3c64xx_spi_parse_dt(struct device *dev)
 #else
 static struct s3c64xx_spi_info *s3c64xx_spi_parse_dt(struct device *dev)
 {
-	return dev->platform_data;
+	return dev_get_platdata(dev);
 }
 #endif
 
@@ -1279,7 +1279,7 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	struct resource	*mem_res;
 	struct resource	*res;
 	struct s3c64xx_spi_driver_data *sdd;
-	struct s3c64xx_spi_info *sci = pdev->dev.platform_data;
+	struct s3c64xx_spi_info *sci = dev_get_platdata(&pdev->dev);
 	struct spi_master *master;
 	int ret, irq;
 	char clk_name[16];
diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 6688ce7..2a95435 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -645,7 +645,7 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
 	if (pdev->dev.of_node)
 		p->info = sh_msiof_spi_parse_dt(&pdev->dev);
 	else
-		p->info = pdev->dev.platform_data;
+		p->info = dev_get_platdata(&pdev->dev);
 
 	if (!p->info) {
 		dev_err(&pdev->dev, "failed to obtain device info\n");
diff --git a/drivers/spi/spi-sh-sci.c b/drivers/spi/spi-sh-sci.c
index 097e5060..8eefeb6 100644
--- a/drivers/spi/spi-sh-sci.c
+++ b/drivers/spi/spi-sh-sci.c
@@ -130,7 +130,7 @@ static int sh_sci_spi_probe(struct platform_device *dev)
 	sp = spi_master_get_devdata(master);
 
 	platform_set_drvdata(dev, sp);
-	sp->info = dev->dev.platform_data;
+	sp->info = dev_get_platdata(&dev->dev);
 
 	/* setup spi bitbang adaptor */
 	sp->bitbang.master = spi_master_get(master);
diff --git a/drivers/spi/spi-ti-ssp.c b/drivers/spi/spi-ti-ssp.c
index 10606fc..7d20e12 100644
--- a/drivers/spi/spi-ti-ssp.c
+++ b/drivers/spi/spi-ti-ssp.c
@@ -283,7 +283,7 @@ static int ti_ssp_spi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int error = 0;
 
-	pdata = dev->platform_data;
+	pdata = dev_get_platdata(dev);
 	if (!pdata) {
 		dev_err(dev, "platform data not found\n");
 		return -EINVAL;
diff --git a/drivers/spi/spi-tle62x0.c b/drivers/spi/spi-tle62x0.c
index 3e528c0..2d4010d 100644
--- a/drivers/spi/spi-tle62x0.c
+++ b/drivers/spi/spi-tle62x0.c
@@ -246,7 +246,7 @@ static int tle62x0_probe(struct spi_device *spi)
 	int ptr;
 	int ret;
 
-	pdata = spi->dev.platform_data;
+	pdata = dev_get_platdata(&spi->dev);
 	if (pdata == NULL) {
 		dev_err(&spi->dev, "no device data specified\n");
 		return -EINVAL;
diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index 0f4a093..08ea84a 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -364,7 +364,7 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 	u32 tmp;
 	u8 i;
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 	if (pdata) {
 		num_cs = pdata->num_chipselect;
 		bits_per_word = pdata->bits_per_word;
-- 
1.7.10.4
