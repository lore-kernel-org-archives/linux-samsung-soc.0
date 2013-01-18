From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V6 02/10] ASoC: SAMSUNG: Add DT support for i2s
Date: Fri, 18 Jan 2013 17:17:01 +0530
Message-ID: <1358509629-20471-3-git-send-email-padma.v@samsung.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60289 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751618Ab3ARLvl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 06:51:41 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGT00C7QKX7DEU0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:51:40 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGT00LG7KPYX890@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:51:39 +0900 (KST)
In-reply-to: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org

Add support for device based discovery.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 .../devicetree/bindings/sound/samsung-i2s.txt      |   63 ++++++
 sound/soc/samsung/dma.c                            |    3 +-
 sound/soc/samsung/dma.h                            |    1 +
 sound/soc/samsung/i2s.c                            |  209 +++++++++++++++-----
 4 files changed, 230 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
new file mode 100644
index 0000000..3070046
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
@@ -0,0 +1,63 @@
+* Samsung I2S controller
+
+Required SoC Specific Properties:
+
+- compatible : "samsung,i2s-v5"
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- dmas: list of DMA controller phandle and DMA request line ordered pairs.
+- dma-names: identifier string for each DMA request line in the dmas property.
+  These strings correspond 1:1 with the ordered pairs in dmas.
+
+Optional SoC Specific Properties:
+
+- samsung,supports-6ch: If the I2S Primary sound source has 5.1 Channel
+  support, this flag is enabled.
+- samsung,supports-rstclr: This flag should be set if I2S software reset bit
+  control is required. When this flag is set I2S software reset bit will be
+  enabled or disabled based on need.
+- samsung,supports-secdai:If I2S block has a secondary FIFO and internal DMA,
+  then this flag is enabled.
+- samsung,idma-addr: Internal DMA register base address of the audio
+  sub system(used in secondary sound source).
+
+Required Board Specific Properties:
+
+- gpios: The gpio specifier for data out,data in, LRCLK, CDCLK and SCLK
+  interface lines. The format of the gpio specifier depends on the gpio
+  controller.
+  The syntax of samsung gpio specifier is
+	<[phandle of the gpio controller node]
+	 [pin number within the gpio controller]
+	 [mux function]
+	 [flags and pull up/down]
+	 [drive strength]>
+
+Example:
+
+- SoC Specific Portion:
+
+i2s@03830000 {
+	compatible = "samsung,i2s-v5";
+	reg = <0x03830000 0x100>;
+	dmas = <&pdma0 10
+		&pdma0 9
+		&pdma0 8>;
+	dma-names = "tx", "rx", "tx-sec";
+	samsung,supports-6ch;
+	samsung,supports-rstclr;
+	samsung,supports-secdai;
+	samsung,idma-addr = <0x03000000>;
+};
+
+- Board Specific Portion:
+
+i2s@03830000 {
+	gpios = <&gpz 0 2 0 0>, /* I2S_0_SCLK */
+		<&gpz 1 2 0 0>, /* I2S_0_CDCLK */
+		<&gpz 2 2 0 0>, /* I2S_0_LRCK */
+		<&gpz 3 2 0 0>, /* I2S_0_SDI */
+		<&gpz 4 2 0 0>, /* I2S_0_SDO[1] */
+		<&gpz 5 2 0 0>, /* I2S_0_SDO[2] */
+		<&gpz 6 2 0 0>; /* I2S_0_SDO[3] */
+};
diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
index db87628..21b7926 100644
--- a/sound/soc/samsung/dma.c
+++ b/sound/soc/samsung/dma.c
@@ -174,7 +174,8 @@ static int dma_hw_params(struct snd_pcm_substream *substream,
 		config.width = prtd->params->dma_size;
 		config.fifo = prtd->params->dma_addr;
 		prtd->params->ch = prtd->params->ops->request(
-				prtd->params->channel, &req);
+				prtd->params->channel, &req, rtd->cpu_dai->dev,
+				prtd->params->ch_name);
 		prtd->params->ops->config(prtd->params->ch, &config);
 	}
 
diff --git a/sound/soc/samsung/dma.h b/sound/soc/samsung/dma.h
index 73d8c7c..189a7a6 100644
--- a/sound/soc/samsung/dma.h
+++ b/sound/soc/samsung/dma.h
@@ -19,6 +19,7 @@ struct s3c_dma_params {
 	int dma_size;			/* Size of the DMA transfer */
 	unsigned ch;
 	struct samsung_dma_ops *ops;
+	char *ch_name;
 };
 
 int asoc_dma_platform_register(struct device *dev);
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index ed5eeae..9e9c20c 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -15,11 +15,15 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
 
+#include <mach/dma.h>
+
 #include <linux/platform_data/asoc-s3c.h>
 
 #include "dma.h"
@@ -34,6 +38,10 @@ enum samsung_dai_type {
 	TYPE_SEC,
 };
 
+struct samsung_i2s_dai_data {
+	int dai_type;
+};
+
 struct i2s_dai {
 	/* Platform device for this DAI */
 	struct platform_device *pdev;
@@ -71,6 +79,7 @@ struct i2s_dai {
 	u32	suspend_i2smod;
 	u32	suspend_i2scon;
 	u32	suspend_i2spsr;
+	unsigned long gpios[7];	/* i2s gpio line numbers */
 };
 
 /* Lock for cross i/f checks */
@@ -997,19 +1006,76 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 	return i2s;
 }
 
+#ifdef CONFIG_OF
+static int samsung_i2s_parse_dt_gpio(struct i2s_dai *i2s)
+{
+	struct device *dev = &i2s->pdev->dev;
+	int index, gpio, ret;
+
+	for (index = 0; index < 7; index++) {
+		gpio = of_get_gpio(dev->of_node, index);
+		if (!gpio_is_valid(gpio)) {
+			dev_err(dev, "invalid gpio[%d]: %d\n", index, gpio);
+			goto free_gpio;
+		}
+
+		ret = gpio_request(gpio, dev_name(dev));
+		if (ret) {
+			dev_err(dev, "gpio [%d] request failed\n", gpio);
+			goto free_gpio;
+		}
+		i2s->gpios[index] = gpio;
+	}
+	return 0;
+
+free_gpio:
+	while (--index >= 0)
+		gpio_free(i2s->gpios[index]);
+	return -EINVAL;
+}
+
+static void samsung_i2s_dt_gpio_free(struct i2s_dai *i2s)
+{
+	unsigned int index;
+	for (index = 0; index < 7; index++)
+		gpio_free(i2s->gpios[index]);
+}
+#else
+static int samsung_i2s_parse_dt_gpio(struct i2s_dai *dai)
+{
+	return -EINVAL;
+}
+
+static void samsung_i2s_dt_gpio_free(struct i2s_dai *dai)
+{
+}
+
+#endif
+
+static const struct of_device_id exynos_i2s_match[];
+
 static inline int samsung_i2s_get_driver_data(struct platform_device *pdev)
 {
-	return platform_get_device_id(pdev)->driver_data;
+#ifdef CONFIG_OF
+	struct samsung_i2s_dai_data *data;
+	if (pdev->dev.of_node) {
+		const struct of_device_id *match;
+		match = of_match_node(exynos_i2s_match, pdev->dev.of_node);
+		data = (struct samsung_i2s_dai_data *) match->data;
+		return data->dai_type;
+	} else
+#endif
+		return platform_get_device_id(pdev)->driver_data;
 }
 
 static int samsung_i2s_probe(struct platform_device *pdev)
 {
-	u32 dma_pl_chan, dma_cp_chan, dma_pl_sec_chan;
 	struct i2s_dai *pri_dai, *sec_dai = NULL;
-	struct s3c_audio_pdata *i2s_pdata;
-	struct samsung_i2s *i2s_cfg;
+	struct s3c_audio_pdata *i2s_pdata = pdev->dev.platform_data;
+	struct samsung_i2s *i2s_cfg = NULL;
 	struct resource *res;
-	u32 regs_base, quirks;
+	u32 regs_base, quirks = 0, idma_addr = 0;
+	struct device_node *np = pdev->dev.of_node;
 	enum samsung_dai_type samsung_dai_type;
 	int ret = 0;
 
@@ -1024,31 +1090,60 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		return 0;
 	}
 
-	i2s_pdata = pdev->dev.platform_data;
-	if (i2s_pdata == NULL) {
-		dev_err(&pdev->dev, "Can't work without s3c_audio_pdata\n");
-		return -EINVAL;
+	pri_dai = i2s_alloc_dai(pdev, false);
+	if (!pri_dai) {
+		dev_err(&pdev->dev, "Unable to alloc I2S_pri\n");
+		return -ENOMEM;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Unable to get I2S-TX dma resource\n");
-		return -ENXIO;
-	}
-	dma_pl_chan = res->start;
+	if (!np) {
+		res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
+		if (!res) {
+			dev_err(&pdev->dev,
+				"Unable to get I2S-TX dma resource\n");
+			return -ENXIO;
+		}
+		pri_dai->dma_playback.channel = res->start;
 
-	res = platform_get_resource(pdev, IORESOURCE_DMA, 1);
-	if (!res) {
-		dev_err(&pdev->dev, "Unable to get I2S-RX dma resource\n");
-		return -ENXIO;
-	}
-	dma_cp_chan = res->start;
+		res = platform_get_resource(pdev, IORESOURCE_DMA, 1);
+		if (!res) {
+			dev_err(&pdev->dev,
+				"Unable to get I2S-RX dma resource\n");
+			return -ENXIO;
+		}
+		pri_dai->dma_capture.channel = res->start;
 
-	res = platform_get_resource(pdev, IORESOURCE_DMA, 2);
-	if (res)
-		dma_pl_sec_chan = res->start;
-	else
-		dma_pl_sec_chan = 0;
+		if (i2s_pdata == NULL) {
+			dev_err(&pdev->dev, "Can't work without s3c_audio_pdata\n");
+			return -EINVAL;
+		}
+
+		if (&i2s_pdata->type)
+			i2s_cfg = &i2s_pdata->type.i2s;
+
+		if (i2s_cfg) {
+			quirks = i2s_cfg->quirks;
+			idma_addr = i2s_cfg->idma_addr;
+		}
+	} else {
+		if (of_find_property(np, "samsung,supports-6ch", NULL))
+			quirks |= QUIRK_PRI_6CHAN;
+
+		if (of_find_property(np, "samsung,supports-secdai", NULL))
+			quirks |= QUIRK_SEC_DAI;
+
+		if (of_find_property(np, "samsung,supports-rstclr", NULL))
+			quirks |= QUIRK_NEED_RSTCLR;
+
+		if (of_property_read_u32(np, "samsung,idma-addr",
+					 &idma_addr)) {
+			if (quirks & QUIRK_SEC_DAI) {
+				dev_err(&pdev->dev, "idma address is not"\
+						"specified");
+				return -EINVAL;
+			}
+		}
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -1063,24 +1158,14 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	}
 	regs_base = res->start;
 
-	i2s_cfg = &i2s_pdata->type.i2s;
-	quirks = i2s_cfg->quirks;
-
-	pri_dai = i2s_alloc_dai(pdev, false);
-	if (!pri_dai) {
-		dev_err(&pdev->dev, "Unable to alloc I2S_pri\n");
-		ret = -ENOMEM;
-		goto err;
-	}
-
 	pri_dai->dma_playback.dma_addr = regs_base + I2STXD;
 	pri_dai->dma_capture.dma_addr = regs_base + I2SRXD;
 	pri_dai->dma_playback.client =
 		(struct s3c2410_dma_client *)&pri_dai->dma_playback;
+	pri_dai->dma_playback.ch_name = "tx";
 	pri_dai->dma_capture.client =
 		(struct s3c2410_dma_client *)&pri_dai->dma_capture;
-	pri_dai->dma_playback.channel = dma_pl_chan;
-	pri_dai->dma_capture.channel = dma_cp_chan;
+	pri_dai->dma_capture.ch_name = "rx";
 	pri_dai->dma_playback.dma_size = 4;
 	pri_dai->dma_capture.dma_size = 4;
 	pri_dai->base = regs_base;
@@ -1099,20 +1184,34 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		sec_dai->dma_playback.dma_addr = regs_base + I2STXDS;
 		sec_dai->dma_playback.client =
 			(struct s3c2410_dma_client *)&sec_dai->dma_playback;
-		/* Use iDMA always if SysDMA not provided */
-		sec_dai->dma_playback.channel = dma_pl_sec_chan ? : -1;
+		sec_dai->dma_playback.ch_name = "tx-sec";
+
+		if (!np) {
+			res = platform_get_resource(pdev, IORESOURCE_DMA, 2);
+			if (res)
+				sec_dai->dma_playback.channel = res->start;
+		}
+
 		sec_dai->dma_playback.dma_size = 4;
 		sec_dai->base = regs_base;
 		sec_dai->quirks = quirks;
-		sec_dai->idma_playback.dma_addr = i2s_cfg->idma_addr;
+		sec_dai->idma_playback.dma_addr = idma_addr;
 		sec_dai->pri_dai = pri_dai;
 		pri_dai->sec_dai = sec_dai;
 	}
 
-	if (i2s_pdata->cfg_gpio && i2s_pdata->cfg_gpio(pdev)) {
-		dev_err(&pdev->dev, "Unable to configure gpio\n");
-		ret = -EINVAL;
-		goto err;
+	if (np) {
+		if (samsung_i2s_parse_dt_gpio(pri_dai)) {
+			dev_err(&pdev->dev, "Unable to configure gpio\n");
+			ret = -EINVAL;
+			goto err;
+		}
+	} else {
+		if (i2s_pdata->cfg_gpio && i2s_pdata->cfg_gpio(pdev)) {
+			dev_err(&pdev->dev, "Unable to configure gpio\n");
+			ret = -EINVAL;
+			goto err;
+		}
 	}
 
 	snd_soc_register_dai(&pri_dai->pdev->dev, &pri_dai->i2s_dai_drv);
@@ -1132,10 +1231,14 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 {
 	struct i2s_dai *i2s, *other;
 	struct resource *res;
+	struct s3c_audio_pdata *i2s_pdata = pdev->dev.platform_data;
 
 	i2s = dev_get_drvdata(&pdev->dev);
 	other = i2s->pri_dai ? : i2s->sec_dai;
 
+	if (!i2s_pdata->cfg_gpio && pdev->dev.of_node)
+		samsung_i2s_dt_gpio_free(i2s->pri_dai);
+
 	if (other) {
 		other->pri_dai = NULL;
 		other->sec_dai = NULL;
@@ -1167,6 +1270,21 @@ static struct platform_device_id samsung_i2s_driver_ids[] = {
 };
 MODULE_DEVICE_TABLE(platform, samsung-i2s-driver-ids);
 
+#ifdef CONFIG_OF
+static struct samsung_i2s_dai_data samsung_i2s_dai_data_array[] = {
+	[TYPE_PRI] = { TYPE_PRI },
+	[TYPE_SEC] = { TYPE_SEC },
+};
+
+static const struct of_device_id exynos_i2s_match[] = {
+	{ .compatible = "samsung,i2s-v5",
+	  .data = &samsung_i2s_dai_data_array[TYPE_PRI],
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_i2s_match);
+#endif
+
 static struct platform_driver samsung_i2s_driver = {
 	.probe  = samsung_i2s_probe,
 	.remove = samsung_i2s_remove,
@@ -1174,6 +1292,7 @@ static struct platform_driver samsung_i2s_driver = {
 	.driver = {
 		.name = "samsung-i2s",
 		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(exynos_i2s_match),
 	},
 };
 
-- 
1.7.4.4
