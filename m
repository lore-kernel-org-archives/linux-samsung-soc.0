From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 1/2 v3] spi: s3c64xx: use "cs-gpios" from spi node instead of
 "cs-gpio"
Date: Wed, 11 Jun 2014 12:01:57 +0530
Message-ID: <1402468318-7342-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20645 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752183AbaFKGeo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 02:34:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

Currently, spi-s3c64xx.c needs "cs-gpio" chip select GPIO to be
defined under "controller-data" node under each slave node.

&spi_x {
	cs-gpios <>;
	...
	slave_node {

		controller-data {
			cs-gpio = <>;
			...
		};
		...
	};
	...
};

Where as, SPI core and many other drivers uses "cs-gpios" for
from device tree node.

Hence, make changes in spi-s3c64xx.c driver to make use of
"cs-gpios" from SPI node(parent) instead of "cs-gpio" defined in
slaves "controller-data"(child) node.

Also updates the Device tree Documentation.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <t.figa@samsung.com>
---
Changes since v2:
1. updated the gpios usage in Documentation
2. use the spi->cs_gpio in the driver, instead of parsing the node again.
3. Corrected error check of the of.node and during gpio_free

 .../devicetree/bindings/spi/spi-samsung.txt        |    8 +++-----
 drivers/spi/spi-s3c64xx.c                          |   18 ++++++------------
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-samsung.txt b/Documentation/devicetree/bindings/spi/spi-samsung.txt
index 86aa061..2d29dac 100644
--- a/Documentation/devicetree/bindings/spi/spi-samsung.txt
+++ b/Documentation/devicetree/bindings/spi/spi-samsung.txt
@@ -42,15 +42,13 @@ Optional Board Specific Properties:
 - num-cs: Specifies the number of chip select lines supported. If
   not specified, the default number of chip select lines is set to 1.
 
+- cs-gpios: should specify GPIOs used for chipselects (see spi-bus.txt)
+
 SPI Controller specific data in SPI slave nodes:
 
 - The spi slave nodes should provide the following information which is required
   by the spi controller.
 
-  - cs-gpio: A gpio specifier that specifies the gpio line used as
-    the slave select line by the spi controller. The format of the gpio
-    specifier depends on the gpio controller.
-
   - samsung,spi-feedback-delay: The sampling phase shift to be applied on the
     miso line (to account for any lag in the miso line). The following are the
     valid values.
@@ -85,6 +83,7 @@ Example:
 		#size-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&spi0_bus>;
+		cs-gpios = <&gpa2 5 0>;
 
 		w25q80bw@0 {
 			#address-cells = <1>;
@@ -94,7 +93,6 @@ Example:
 			spi-max-frequency = <10000>;
 
 			controller-data {
-				cs-gpio = <&gpa2 5 1 0 3>;
 				samsung,spi-feedback-delay = <0>;
 			};
 
diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 75a5696..842b148 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -772,24 +772,19 @@ static struct s3c64xx_spi_csinfo *s3c64xx_get_slave_ctrldata(
 
 	cs = kzalloc(sizeof(*cs), GFP_KERNEL);
 	if (!cs) {
-		of_node_put(data_np);
 		return ERR_PTR(-ENOMEM);
 	}
 
-	/* The CS line is asserted/deasserted by the gpio pin */
-	if (sdd->cs_gpio)
-		cs->line = of_get_named_gpio(data_np, "cs-gpio", 0);
-
-	if (!gpio_is_valid(cs->line)) {
+	if (!gpio_is_valid(spi->cs_gpio)) {
 		dev_err(&spi->dev, "chip select gpio is not specified or invalid\n");
-		kfree(cs);
-		of_node_put(data_np);
 		return ERR_PTR(-EINVAL);
 	}
+	cs->line = spi->cs_gpio;
 
 	of_property_read_u32(data_np, "samsung,spi-feedback-delay", &fb_delay);
 	cs->fb_delay = fb_delay;
 	of_node_put(data_np);
+
 	return cs;
 }
 
@@ -828,8 +823,6 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
 					cs->line, err);
 				goto err_gpio_req;
 			}
-
-			spi->cs_gpio = cs->line;
 		}
 
 		spi_set_ctldata(spi, cs);
@@ -884,7 +877,8 @@ setup_exit:
 	/* setup() returns with device de-selected */
 	writel(S3C64XX_SPI_SLAVE_SIG_INACT, sdd->regs + S3C64XX_SPI_SLAVE_SEL);
 
-	gpio_free(cs->line);
+	if (cs->line)
+		gpio_free(cs->line);
 	spi_set_ctldata(spi, NULL);
 
 err_gpio_req:
@@ -1077,7 +1071,7 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	sdd->sfr_start = mem_res->start;
 	sdd->cs_gpio = true;
 	if (pdev->dev.of_node) {
-		if (!of_find_property(pdev->dev.of_node, "cs-gpio", NULL))
+		if (!of_find_property(pdev->dev.of_node, "cs-gpios", NULL))
 			sdd->cs_gpio = false;
 
 		ret = of_alias_get_id(pdev->dev.of_node, "spi");
-- 
1.7.9.5
