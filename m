From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v5 5/6] spi: s3c64xx: Remove the 'set_level' callback from
 controller data
Date: Wed, 11 Jul 2012 21:11:04 +0530
Message-ID: <1342021265-11212-6-git-send-email-thomas.abraham@linaro.org>
References: <1342021265-11212-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9836 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932839Ab2GKP1l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 11:27:41 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7000KQT5LR5CQ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 00:27:40 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M70002YF5LJ4S00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 00:27:40 +0900 (KST)
In-reply-to: <1342021265-11212-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
Cc: broonie@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, jaswinder.singh@linaro.org

The set_level callback in the controller data, which is used to configure
the slave select line, cannot be supported when migrating the driver to
device tree based discovery. Since all the platforms currently use gpio
as the slave select line, this callback can be removed from the
controller data and replaced with call to gpio_set_value in the driver.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Acked-by: Jaswinder Singh <jaswinder.singh@linaro.org>
Acked-by: Grant Likely <grant.likely@secretlab.ca>
---
 arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |    2 -
 drivers/spi/spi-s3c64xx.c                        |   31 ++++++++++++++++++---
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h b/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
index c818a7c..ceba18d 100644
--- a/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
+++ b/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
@@ -18,7 +18,6 @@ struct platform_device;
  * @fb_delay: Slave specific feedback delay.
  *            Refer to FB_CLK_SEL register definition in SPI chapter.
  * @line: Custom 'identity' of the CS line.
- * @set_level: CS line control.
  *
  * This is per SPI-Slave Chipselect information.
  * Allocate and initialize one in machine init code and make the
@@ -27,7 +26,6 @@ struct platform_device;
 struct s3c64xx_spi_csinfo {
 	u8 fb_delay;
 	unsigned line;
-	void (*set_level)(unsigned line_id, int lvl);
 };
 
 /**
diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 0a9e43e..e4182ea 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -27,6 +27,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
+#include <linux/gpio.h>
 
 #include <mach/dma.h>
 #include <plat/s3c64xx-spi.h>
@@ -411,14 +412,14 @@ static inline void enable_cs(struct s3c64xx_spi_driver_data *sdd,
 		if (sdd->tgl_spi != spi) { /* if last mssg on diff device */
 			/* Deselect the last toggled device */
 			cs = sdd->tgl_spi->controller_data;
-			cs->set_level(cs->line,
-					spi->mode & SPI_CS_HIGH ? 0 : 1);
+			gpio_set_value(cs->line,
+				spi->mode & SPI_CS_HIGH ? 0 : 1);
 		}
 		sdd->tgl_spi = NULL;
 	}
 
 	cs = spi->controller_data;
-	cs->set_level(cs->line, spi->mode & SPI_CS_HIGH ? 1 : 0);
+	gpio_set_value(cs->line, spi->mode & SPI_CS_HIGH ? 1 : 0);
 }
 
 static int wait_for_xfer(struct s3c64xx_spi_driver_data *sdd,
@@ -504,7 +505,7 @@ static inline void disable_cs(struct s3c64xx_spi_driver_data *sdd,
 	if (sdd->tgl_spi == spi)
 		sdd->tgl_spi = NULL;
 
-	cs->set_level(cs->line, spi->mode & SPI_CS_HIGH ? 0 : 1);
+	gpio_set_value(cs->line, spi->mode & SPI_CS_HIGH ? 0 : 1);
 }
 
 static void s3c64xx_spi_config(struct s3c64xx_spi_driver_data *sdd)
@@ -833,11 +834,21 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
 	unsigned long flags;
 	int err = 0;
 
-	if (cs == NULL || cs->set_level == NULL) {
+	if (cs == NULL) {
 		dev_err(&spi->dev, "No CS for SPI(%d)\n", spi->chip_select);
 		return -ENODEV;
 	}
 
+	if (!spi_get_ctldata(spi)) {
+		err = gpio_request(cs->line, dev_name(&spi->dev));
+		if (err) {
+			dev_err(&spi->dev, "request for slave select gpio "
+					"line [%d] failed\n", cs->line);
+			return -EBUSY;
+		}
+		spi_set_ctldata(spi, cs);
+	}
+
 	sdd = spi_master_get_devdata(spi->master);
 	sci = sdd->cntrlr_info;
 
@@ -908,6 +919,15 @@ setup_exit:
 	return err;
 }
 
+static void s3c64xx_spi_cleanup(struct spi_device *spi)
+{
+	struct s3c64xx_spi_csinfo *cs = spi_get_ctldata(spi);
+
+	if (cs)
+		gpio_free(cs->line);
+	spi_set_ctldata(spi, NULL);
+}
+
 static irqreturn_t s3c64xx_spi_irq(int irq, void *data)
 {
 	struct s3c64xx_spi_driver_data *sdd = data;
@@ -1049,6 +1069,7 @@ static int __init s3c64xx_spi_probe(struct platform_device *pdev)
 
 	master->bus_num = sdd->port_id;
 	master->setup = s3c64xx_spi_setup;
+	master->cleanup = s3c64xx_spi_cleanup;
 	master->prepare_transfer_hardware = s3c64xx_spi_prepare_transfer;
 	master->transfer_one_message = s3c64xx_spi_transfer_one_message;
 	master->unprepare_transfer_hardware = s3c64xx_spi_unprepare_transfer;
-- 
1.6.6.rc2
