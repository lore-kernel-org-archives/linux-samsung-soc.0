From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 3/6] ASoC: max98504: Add max98504 speaker amplifier driver
Date: Mon, 13 Jun 2016 12:52:37 +0200
Message-ID: <1465815160-28504-4-git-send-email-s.nawrocki@samsung.com>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48458 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161051AbcFMKyY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 06:54:24 -0400
In-reply-to: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds driver for the MAX98504 speaker amplifier.  The MAX98504
is a high efficiency mono class D amplifier that features an integrated
boost converter with voltage and current sensing ADCs for Dynamic Speaker
Management.
This driver does not include support for the I2S DAI, as we wouldn't be
able  to test such code in a hardware configuration where the amplifier
has only wired the analogue input.

Signed-off-by: Inha Song <ideal.song@samsung.com>
[k.kozlowski: rebased on 4.1]
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
[s.nawrocki: removed unused macro definitions and regulator handling
 code, rewrote regmap config code, added support for speaker enable
 and global chip enable through DAPM, rewritten as component driver,
 redesigned DT bindings]
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/codecs/Kconfig    |   4 +
 sound/soc/codecs/Makefile   |   2 +
 sound/soc/codecs/max98504.c | 241 ++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/max98504.h |  94 +++++++++++++++++
 4 files changed, 341 insertions(+)
 create mode 100644 sound/soc/codecs/max98504.c
 create mode 100644 sound/soc/codecs/max98504.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index c923c96..46853b2 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -552,6 +552,10 @@ config SND_SOC_MAX98357A
 config SND_SOC_MAX98371
        tristate
 
+config SND_SOC_MAX98504
+	tristate "Maxim MAX98504 speaker amplifier"
+	depends on I2C
+
 config SND_SOC_MAX9867
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 1264fa4..09d581c 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -213,6 +213,7 @@ snd-soc-wm-hubs-objs := wm_hubs.o
 
 # Amp
 snd-soc-max9877-objs := max9877.o
+snd-soc-max98504-objs := max98504.o
 snd-soc-tpa6130a2-objs := tpa6130a2.o
 snd-soc-tas2552-objs := tas2552.o
 
@@ -429,4 +430,5 @@ obj-$(CONFIG_SND_SOC_WM_HUBS)	+= snd-soc-wm-hubs.o
 
 # Amp
 obj-$(CONFIG_SND_SOC_MAX9877)	+= snd-soc-max9877.o
+obj-$(CONFIG_SND_SOC_MAX98504)	+= snd-soc-max98504.o
 obj-$(CONFIG_SND_SOC_TPA6130A2)	+= snd-soc-tpa6130a2.o
diff --git a/sound/soc/codecs/max98504.c b/sound/soc/codecs/max98504.c
new file mode 100644
index 0000000..15035e1
--- /dev/null
+++ b/sound/soc/codecs/max98504.c
@@ -0,0 +1,241 @@
+/*
+ * MAX98504 ALSA SoC Audio driver
+ *
+ * Copyright 2013 - 2014 Maxim Integrated Products
+ * Copyright 2016 Samsung Electronics Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <sound/soc.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+
+#include "max98504.h"
+
+static struct reg_default max98504_reg_defaults[] = {
+	{ 0x01,	0},
+	{ 0x02,	0},
+	{ 0x03,	0},
+	{ 0x04,	0},
+	{ 0x10, 0},
+	{ 0x11, 0},
+	{ 0x12, 0},
+	{ 0x13, 0},
+	{ 0x14, 0},
+	{ 0x15, 0},
+	{ 0x16, 0},
+	{ 0x17, 0},
+	{ 0x18, 0},
+	{ 0x19, 0},
+	{ 0x1A, 0},
+	{ 0x20, 0},
+	{ 0x21, 0},
+	{ 0x22, 0},
+	{ 0x23, 0},
+	{ 0x24, 0},
+	{ 0x25, 0},
+	{ 0x26, 0},
+	{ 0x27, 0},
+	{ 0x28, 0},
+	{ 0x30, 0},
+	{ 0x31, 0},
+	{ 0x32, 0},
+	{ 0x33, 0},
+	{ 0x34, 0},
+	{ 0x35, 0},
+	{ 0x36, 0},
+	{ 0x37, 0},
+	{ 0x38, 0},
+	{ 0x39, 0},
+	{ 0x40, 0},
+	{ 0x41, 0},
+};
+
+static bool max98504_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX98504_REG_INTERRUPT_STATUS:
+	case MAX98504_REG_INTERRUPT_FLAGS:
+	case MAX98504_REG_INTERRUPT_FLAG_CLEARS:
+	case MAX98504_REG_WATCHDOG_CLEAR:
+	case MAX98504_REG_GLOBAL_ENABLE:
+	case MAX98504_REG_SOFTWARE_RESET:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool max98504_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX98504_REG_SOFTWARE_RESET:
+	case MAX98504_REG_WATCHDOG_CLEAR:
+	case MAX98504_REG_INTERRUPT_FLAG_CLEARS:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static int max98504_probe(struct max98504_priv *max98504)
+{
+	struct regmap *map = max98504->regmap;
+
+	/* Software reset */
+	regmap_write(map, MAX98504_REG_SOFTWARE_RESET, 0x01);
+	msleep(20);
+
+	/* DAI PCM/PDM Rx configuration */
+	switch (max98504->rx_path) {
+	case MODE_RX_PCM:
+		regmap_write(map, MAX98504_REG_PCM_RX_ENABLE,
+			     max98504->rx_ch_enable);
+		break;
+	case MODE_RX_PDM0...MODE_RX_PDM1:
+		regmap_write(map, MAX98504_REG_PDM_RX_ENABLE,
+			     M98504_PDM_RX_EN_MASK);
+		break;
+	default:
+		/* Analog input, disable PCM, PDM Rx */
+		regmap_write(map, MAX98504_REG_PCM_RX_ENABLE, 0);
+		regmap_write(map, MAX98504_REG_PDM_RX_ENABLE, 0);
+	}
+
+	regmap_write(map, MAX98504_REG_SPEAKER_SOURCE_SELECT,
+		     max98504->rx_path & M98504_SPK_SRC_SEL_MASK);
+
+	/* DAI PCM/PDM Tx configuration */
+	switch (max98504->tx_path) {
+	case MODE_TX_PCM:
+		regmap_write(map, MAX98504_REG_PCM_TX_ENABLE,
+			     max98504->tx_ch_enable);
+		regmap_write(map, MAX98504_REG_PCM_TX_CHANNEL_SOURCES,
+			     max98504->tx_ch_source);
+		break;
+	default:
+		/* PDM Tx */
+		regmap_write(map, MAX98504_REG_PDM_TX_ENABLE,
+			     max98504->tx_ch_enable);
+		regmap_write(map, MAX98504_REG_PDM_TX_CONTROL,
+			     max98504->tx_ch_source);
+	}
+
+	regmap_write(map, MAX98504_REG_MEASUREMENT_ENABLE, 0x3);
+
+	/* Brownout protection */
+	regmap_write(map, MAX98504_REG_PVDD_BROWNOUT_ENABLE, 0x1);
+	regmap_write(map, MAX98504_REG_PVDD_BROWNOUT_CONFIG(1), 0x33);
+	regmap_write(map, MAX98504_REG_PVDD_BROWNOUT_CONFIG(2), 0x0a);
+	regmap_write(map, MAX98504_REG_PVDD_BROWNOUT_CONFIG(3), 0xff);
+	regmap_write(map, MAX98504_REG_PVDD_BROWNOUT_CONFIG(4), 0xff);
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_route max98504_dapm_routes[] = {
+	{ "SPKOUT", NULL, "Global Enable" },
+};
+
+static const struct snd_soc_dapm_widget max98504_dapm_widgets[] = {
+	SND_SOC_DAPM_SUPPLY("Global Enable", MAX98504_REG_GLOBAL_ENABLE,
+		0, 0, NULL, 0),
+	SND_SOC_DAPM_REG(snd_soc_dapm_spk, "SPKOUT",
+		MAX98504_REG_SPEAKER_ENABLE, 0, 1, 1, 0),
+};
+
+static const struct snd_soc_component_driver max98504_component_driver = {
+	.dapm_widgets		= max98504_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(max98504_dapm_widgets),
+	.dapm_routes		= max98504_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(max98504_dapm_routes),
+};
+
+static const struct regmap_config max98504_regmap = {
+	.reg_bits		= 16,
+	.val_bits		= 8,
+	.max_register		= MAX98504_MAX_REGISTER,
+	.reg_defaults		= max98504_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(max98504_reg_defaults),
+	.volatile_reg		= max98504_volatile_register,
+	.readable_reg		= max98504_readable_register,
+	.cache_type		= REGCACHE_RBTREE,
+};
+
+static void max98504_parse_dt(struct max98504_priv *max98504,
+			      struct device_node *of_node)
+{
+	of_property_read_u32(of_node, "maxim,rx-path",
+			     &max98504->rx_path);
+
+	of_property_read_u32(of_node, "maxim,tx-path",
+			     &max98504->tx_path);
+
+	of_property_read_u32(of_node, "maxim,rx-channel-mask",
+			     &max98504->rx_ch_enable);
+
+	of_property_read_u32(of_node, "maxim,tx-channel-mask",
+			     &max98504->tx_ch_enable);
+
+	of_property_read_u32(of_node, "maxim,tx-channel-source",
+			     &max98504->tx_ch_source);
+}
+
+static int max98504_i2c_probe(struct i2c_client *client,
+			      const struct i2c_device_id *id)
+{
+	struct max98504_priv *max98504;
+	int ret;
+
+	max98504 = devm_kzalloc(&client->dev, sizeof(*max98504), GFP_KERNEL);
+	if (!max98504)
+		return -ENOMEM;
+
+	if (client->dev.of_node)
+		max98504_parse_dt(max98504, client->dev.of_node);
+
+	max98504->regmap = devm_regmap_init_i2c(client, &max98504_regmap);
+	if (IS_ERR(max98504->regmap)) {
+		ret = PTR_ERR(max98504->regmap);
+		dev_err(&client->dev, "regmap initialization failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = max98504_probe(max98504);
+	if (ret < 0)
+		return ret;
+
+	return devm_snd_soc_register_component(&client->dev,
+				&max98504_component_driver, NULL, 0);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id max98504_of_match[] = {
+	{ .compatible = "maxim,max98504", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, rt5651_of_match);
+#endif
+
+static const struct i2c_device_id max98504_i2c_id[] = {
+	{ "max98504" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max98504_i2c_id);
+
+static struct i2c_driver max98504_i2c_driver = {
+	.driver = {
+		.name = "max98504",
+		.of_match_table = of_match_ptr(max98504_of_match),
+	},
+	.probe = max98504_i2c_probe,
+	.id_table = max98504_i2c_id,
+};
+module_i2c_driver(max98504_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC MAX98504 driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/max98504.h b/sound/soc/codecs/max98504.h
new file mode 100644
index 0000000..fa176ffd
--- /dev/null
+++ b/sound/soc/codecs/max98504.h
@@ -0,0 +1,94 @@
+/*
+ * MAX98504 ALSA SoC Audio driver
+ *
+ * Copyright 2011 - 2012 Maxim Integrated Products
+ * Copyright 2016 Samsung Electronics Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef MAX98504_H_
+#define MAX98504_H_
+
+/*
+ * MAX98504 Register Definitions
+ */
+#define MAX98504_REG_INTERRUPT_STATUS		0x01
+#define MAX98504_REG_INTERRUPT_FLAGS		0x02
+#define MAX98504_REG_INTERRUPT_ENABLE		0x03
+#define MAX98504_REG_INTERRUPT_FLAG_CLEARS	0x04
+#define MAX98504_REG_GPIO_ENABLE		0x10
+#define MAX98504_REG_GPIO_CONFIG		0x11
+#define MAX98504_REG_WATCHDOG_ENABLE		0x12
+#define MAX98504_REG_WATCHDOG_CONFIG		0x13
+#define MAX98504_REG_WATCHDOG_CLEAR		0x14
+#define MAX98504_REG_CLOCK_MONITOR_ENABLE	0x15
+#define MAX98504_REG_PVDD_BROWNOUT_ENABLE	0x16
+/* n = 1...4 */
+#define MAX98504_REG_PVDD_BROWNOUT_CONFIG(n)	(0x17 + (n) - 1)
+#define MAX98504_REG_PCM_RX_ENABLE		0x20
+#define MAX98504_REG_PCM_TX_ENABLE		0x21
+#define MAX98504_REG_PCM_TX_HIZ_CONTROL		0x22
+#define MAX98504_REG_PCM_TX_CHANNEL_SOURCES	0x23
+#define MAX98504_REG_PCM_MODE_CONFIG		0x24
+#define MAX98504_REG_PCM_DSP_CONFIG		0x25
+#define MAX98504_REG_PCM_CLOCK_SETUP		0x26
+#define MAX98504_REG_PCM_SAMPLE_RATE_SETUP	0x27
+#define MAX98504_REG_PCM_TO_SPEAKER_MONOMIX	0x28
+#define MAX98504_REG_PDM_TX_ENABLE		0x30
+#define MAX98504_REG_PDM_TX_HIZ_CONTROL		0x31
+#define MAX98504_REG_PDM_TX_CONTROL		0x32
+#define MAX98504_REG_PDM_RX_ENABLE		0x33
+#define MAX98504_REG_SPEAKER_ENABLE		0x34
+#define MAX98504_REG_SPEAKER_SOURCE_SELECT	0x35
+#define MAX98504_REG_MEASUREMENT_ENABLE		0x36
+#define MAX98504_REG_ANALOGUE_INPUT_GAIN	0x37
+#define MAX98504_REG_TEMPERATURE_LIMIT_CONFIG	0x38
+#define MAX98504_REG_ANALOGUE_SPARE		0x39
+#define MAX98504_REG_GLOBAL_ENABLE		0x40
+#define MAX98504_REG_SOFTWARE_RESET		0x41
+#define MAX98504_REG_REV_ID			0x7fff
+
+#define MAX98504_MAX_REGISTER			0x7fff
+
+/* Register Bit Fields */
+
+/* MAX98504_REG_PCM_DSP_CONFIG */
+#define M98504_PCM_DSP_CFG_TX_DITH_EN_MASK	(1 << 7)
+#define M98504_PCM_DSP_CFG_MEAS_DCBLK_EN_MASK	(1 << 6)
+#define M98504_PCM_DSP_CFG_RX_DITH_EN_MASK	(1 << 5)
+#define M98504_PCM_DSP_CFG_RX_FLT_MODE_MASK	(1 << 4)
+
+/* MAX98504_REG_PDM_RX_ENABLE */
+#define M98504_PDM_RX_EN_MASK			(1 << 0)
+
+/* MAX98504_REG_SPEAKER_SOURCE_SELECT */
+#define M98504_SPK_SRC_SEL_MASK			(0x3 << 0)
+#define M98504_SPK_SRC_SEL_PDM_CH1		(0x3 << 0)
+#define M98504_SPK_SRC_SEL_PDM_CH0		(0x2 << 0)
+#define M98504_SPK_SRC_SEL_ANALOG		(0x1 << 0)
+#define M98504_SPK_SRC_SEL_PCM_MONOMIX		(0x0 << 0)
+
+enum max98504_rx_path {
+	MODE_RX_PCM,
+	MODE_RX_AIN,
+	MODE_RX_PDM0,
+	MODE_RX_PDM1,
+};
+
+enum max98504_tx_path {
+	MODE_TX_PCM,
+	MODE_TX_PDM,
+};
+
+struct max98504_priv {
+	struct regmap *regmap;
+	u32 rx_path;
+	u32 tx_path;
+	u32 rx_ch_enable;
+	u32 tx_ch_enable;
+	u32 tx_ch_source;
+};
+
+#endif /* MAX98504_H_ */
-- 
1.9.1
