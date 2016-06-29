From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: max98504: Add max98504 speaker
	amplifier driver" to the asoc tree
Date: Wed, 29 Jun 2016 20:23:24 +0100
Message-ID: <E1bIL52-00086N-Ql@finisterre>
References: <1467199599-6892-5-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1467199599-6892-5-git-send-email-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: robh@kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, inki.dae@samsung.com, devicetree@vger.kernel.org, broonie@kernel.org, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: max98504: Add max98504 speaker amplifier driver

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 4c5d1469297d14d59f5f673493bc02fc939293a4 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 29 Jun 2016 13:26:37 +0200
Subject: [PATCH] ASoC: max98504: Add max98504 speaker amplifier driver

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
[s.nawrocki: removed unused macro definitions, rewrote regulator supply
 related parts, rewrote regmap configuration code, added support for speaker
 enable and global chip enable through DAPM, rewritten as component driver,
 added PDM DAI definition and TDM callbacks for PDM channels configuration]
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
--
Changes since v2:
 - added parsing of the VBAT brownout DT properties,
 - removed MAX98504_REG_SPEAKER_SOURCE_SELECT register initialization,
 - removed unused macro definitions.

Changes since v1:
 - none.

Changes since initial version:
 - added regulator supply handling,
 - added DAPM widges for speaker source selection,
 - added PDM DAI definition and TDM callbacks for setting up active
   PDM Tx channels and I/V sense ADC data mapping,
 - removed all optional DT properties, added regulator supply properties
   in the DT binding.
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig    |   4 +
 sound/soc/codecs/Makefile   |   2 +
 sound/soc/codecs/max98504.c | 383 ++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/max98504.h |  59 +++++++
 4 files changed, 448 insertions(+)
 create mode 100644 sound/soc/codecs/max98504.c
 create mode 100644 sound/soc/codecs/max98504.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 4d82a58ff6b0..b141d7816878 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -535,6 +535,10 @@ config SND_SOC_MAX98357A
 config SND_SOC_MAX98371
        tristate
 
+config SND_SOC_MAX98504
+	tristate "Maxim MAX98504 speaker amplifier"
+	depends on I2C
+
 config SND_SOC_MAX9867
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 0f548fd34ca3..fd8c477244e8 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -208,6 +208,7 @@ snd-soc-wm-hubs-objs := wm_hubs.o
 
 # Amp
 snd-soc-max9877-objs := max9877.o
+snd-soc-max98504-objs := max98504.o
 snd-soc-tpa6130a2-objs := tpa6130a2.o
 snd-soc-tas2552-objs := tas2552.o
 
@@ -419,4 +420,5 @@ obj-$(CONFIG_SND_SOC_WM_HUBS)	+= snd-soc-wm-hubs.o
 
 # Amp
 obj-$(CONFIG_SND_SOC_MAX9877)	+= snd-soc-max9877.o
+obj-$(CONFIG_SND_SOC_MAX98504)	+= snd-soc-max98504.o
 obj-$(CONFIG_SND_SOC_TPA6130A2)	+= snd-soc-tpa6130a2.o
diff --git a/sound/soc/codecs/max98504.c b/sound/soc/codecs/max98504.c
new file mode 100644
index 000000000000..a7320e709890
--- /dev/null
+++ b/sound/soc/codecs/max98504.c
@@ -0,0 +1,383 @@
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
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <sound/soc.h>
+
+#include "max98504.h"
+
+static const char * const max98504_supply_names[] = {
+	"DVDD",
+	"DIOVDD",
+	"PVDD",
+};
+#define MAX98504_NUM_SUPPLIES ARRAY_SIZE(max98504_supply_names)
+
+struct max98504_priv {
+	struct regmap *regmap;
+	struct regulator_bulk_data supplies[MAX98504_NUM_SUPPLIES];
+	unsigned int pcm_rx_channels;
+	bool brownout_enable;
+	unsigned int brownout_threshold;
+	unsigned int brownout_attenuation;
+	unsigned int brownout_attack_hold;
+	unsigned int brownout_timed_hold;
+	unsigned int brownout_release_rate;
+};
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
+	case MAX98504_INTERRUPT_STATUS:
+	case MAX98504_INTERRUPT_FLAGS:
+	case MAX98504_INTERRUPT_FLAG_CLEARS:
+	case MAX98504_WATCHDOG_CLEAR:
+	case MAX98504_GLOBAL_ENABLE:
+	case MAX98504_SOFTWARE_RESET:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool max98504_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX98504_SOFTWARE_RESET:
+	case MAX98504_WATCHDOG_CLEAR:
+	case MAX98504_INTERRUPT_FLAG_CLEARS:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static int max98504_pcm_rx_ev(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *c = snd_soc_dapm_to_component(w->dapm);
+	struct max98504_priv *max98504 = snd_soc_component_get_drvdata(c);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		regmap_write(max98504->regmap, MAX98504_PCM_RX_ENABLE,
+			     max98504->pcm_rx_channels);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		regmap_write(max98504->regmap, MAX98504_PCM_RX_ENABLE, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static int max98504_component_probe(struct snd_soc_component *c)
+{
+	struct max98504_priv *max98504 = snd_soc_component_get_drvdata(c);
+	struct regmap *map = max98504->regmap;
+	int ret;
+
+	ret = regulator_bulk_enable(MAX98504_NUM_SUPPLIES, max98504->supplies);
+	if (ret < 0)
+		return ret;
+
+	regmap_write(map, MAX98504_SOFTWARE_RESET, 0x1);
+	msleep(20);
+
+	if (!max98504->brownout_enable)
+		return 0;
+
+	regmap_write(map, MAX98504_PVDD_BROWNOUT_ENABLE, 0x1);
+
+	regmap_write(map, MAX98504_PVDD_BROWNOUT_CONFIG_1,
+		     (max98504->brownout_threshold & 0x1f) << 3 |
+		     (max98504->brownout_attenuation & 0x3));
+
+	regmap_write(map, MAX98504_PVDD_BROWNOUT_CONFIG_2,
+		     max98504->brownout_attack_hold & 0xff);
+
+	regmap_write(map, MAX98504_PVDD_BROWNOUT_CONFIG_3,
+		     max98504->brownout_timed_hold & 0xff);
+
+	regmap_write(map, MAX98504_PVDD_BROWNOUT_CONFIG_4,
+		     max98504->brownout_release_rate & 0xff);
+
+	return 0;
+}
+
+static void max98504_component_remove(struct snd_soc_component *c)
+{
+	struct max98504_priv *max98504 = snd_soc_component_get_drvdata(c);
+
+	regulator_bulk_disable(MAX98504_NUM_SUPPLIES, max98504->supplies);
+}
+
+static const char *spk_source_mux_text[] = {
+	"PCM Monomix", "Analog In", "PDM Left", "PDM Right"
+};
+
+static const struct soc_enum spk_source_mux_enum =
+	SOC_ENUM_SINGLE(MAX98504_SPEAKER_SOURCE_SELECT,
+			0, ARRAY_SIZE(spk_source_mux_text),
+			spk_source_mux_text);
+
+static const struct snd_kcontrol_new spk_source_mux =
+	SOC_DAPM_ENUM("SPK Source", spk_source_mux_enum);
+
+static const struct snd_soc_dapm_route max98504_dapm_routes[] = {
+	{ "SPKOUT", NULL, "Global Enable" },
+	{ "SPK Source", "PCM Monomix", "DAC PCM" },
+	{ "SPK Source", "Analog In", "AIN" },
+	{ "SPK Source", "PDM Left", "DAC PDM" },
+	{ "SPK Source", "PDM Right", "DAC PDM" },
+};
+
+static const struct snd_soc_dapm_widget max98504_dapm_widgets[] = {
+	SND_SOC_DAPM_SUPPLY("Global Enable", MAX98504_GLOBAL_ENABLE,
+		0, 0, NULL, 0),
+	SND_SOC_DAPM_INPUT("AIN"),
+	SND_SOC_DAPM_AIF_OUT("AIF2OUTL", "AIF2 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF2OUTR", "AIF2 Capture", 1, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_DAC_E("DAC PCM", NULL, SND_SOC_NOPM, 0, 0,
+		max98504_pcm_rx_ev,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_DAC("DAC PDM", NULL, MAX98504_PDM_RX_ENABLE, 0, 0),
+	SND_SOC_DAPM_MUX("SPK Source", SND_SOC_NOPM, 0, 0, &spk_source_mux),
+	SND_SOC_DAPM_REG(snd_soc_dapm_spk, "SPKOUT",
+		MAX98504_SPEAKER_ENABLE, 0, 1, 1, 0),
+};
+
+static int max98504_set_tdm_slot(struct snd_soc_dai *dai,
+		unsigned int tx_mask, unsigned int rx_mask,
+		int slots, int slot_width)
+{
+	struct max98504_priv *max98504 = snd_soc_dai_get_drvdata(dai);
+	struct regmap *map = max98504->regmap;
+
+
+	switch (dai->id) {
+	case MAX98504_DAI_ID_PCM:
+		regmap_write(map, MAX98504_PCM_TX_ENABLE, tx_mask);
+		max98504->pcm_rx_channels = rx_mask;
+		break;
+
+	case MAX98504_DAI_ID_PDM:
+		regmap_write(map, MAX98504_PDM_TX_ENABLE, tx_mask);
+		break;
+	default:
+		WARN_ON(1);
+	}
+
+	return 0;
+}
+static int max98504_set_channel_map(struct snd_soc_dai *dai,
+		unsigned int tx_num, unsigned int *tx_slot,
+		unsigned int rx_num, unsigned int *rx_slot)
+{
+	struct max98504_priv *max98504 = snd_soc_dai_get_drvdata(dai);
+	struct regmap *map = max98504->regmap;
+	unsigned int i, sources = 0;
+
+	for (i = 0; i < tx_num; i++)
+		if (tx_slot[i])
+			sources |= (1 << i);
+
+	switch (dai->id) {
+	case MAX98504_DAI_ID_PCM:
+		regmap_write(map, MAX98504_PCM_TX_CHANNEL_SOURCES,
+			     sources);
+		break;
+
+	case MAX98504_DAI_ID_PDM:
+		regmap_write(map, MAX98504_PDM_TX_CONTROL, sources);
+		break;
+	default:
+		WARN_ON(1);
+	}
+
+	regmap_write(map, MAX98504_MEASUREMENT_ENABLE, sources ? 0x3 : 0x01);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops max98504_dai_ops = {
+	.set_tdm_slot		= max98504_set_tdm_slot,
+	.set_channel_map	= max98504_set_channel_map,
+};
+
+#define MAX98504_FORMATS	(SNDRV_PCM_FMTBIT_S8|SNDRV_PCM_FMTBIT_S16_LE|\
+				SNDRV_PCM_FMTBIT_S24_LE|SNDRV_PCM_FMTBIT_S32_LE)
+#define MAX98504_PDM_RATES	(SNDRV_PCM_RATE_8000|SNDRV_PCM_RATE_16000|\
+				SNDRV_PCM_RATE_32000|SNDRV_PCM_RATE_44100|\
+				SNDRV_PCM_RATE_48000|SNDRV_PCM_RATE_88200|\
+				SNDRV_PCM_RATE_96000)
+
+static struct snd_soc_dai_driver max98504_dai[] = {
+	/* TODO: Add the PCM interface definitions */
+	{
+		.name = "max98504-aif2",
+		.id = MAX98504_DAI_ID_PDM,
+		.playback = {
+			.stream_name	= "AIF2 Playback",
+			.channels_min	= 1,
+			.channels_max	= 2,
+			.rates		= MAX98504_PDM_RATES,
+			.formats	= MAX98504_FORMATS,
+		},
+		.capture = {
+			.stream_name	= "AIF2 Capture",
+			.channels_min	= 1,
+			.channels_max	= 2,
+			.rates		= MAX98504_PDM_RATES,
+			.formats	= MAX98504_FORMATS,
+		},
+		.ops = &max98504_dai_ops,
+	},
+};
+
+static const struct snd_soc_component_driver max98504_component_driver = {
+	.probe			= max98504_component_probe,
+	.remove			= max98504_component_remove,
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
+static int max98504_i2c_probe(struct i2c_client *client,
+			      const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct device_node *node = dev->of_node;
+	struct max98504_priv *max98504;
+	int i, ret;
+
+	max98504 = devm_kzalloc(dev, sizeof(*max98504), GFP_KERNEL);
+	if (!max98504)
+		return -ENOMEM;
+
+	if (node) {
+		if (!of_property_read_u32(node, "maxim,brownout-threshold",
+					&max98504->brownout_threshold))
+			max98504->brownout_enable = true;
+
+		of_property_read_u32(node, "maxim,brownout-attenuation",
+					&max98504->brownout_attenuation);
+		of_property_read_u32(node, "maxim,brownout-attack-hold-ms",
+					&max98504->brownout_attack_hold);
+		of_property_read_u32(node, "maxim,brownout-timed-hold-ms",
+					&max98504->brownout_timed_hold);
+		of_property_read_u32(node, "maxim,brownout-release-rate-ms",
+					&max98504->brownout_release_rate);
+	}
+
+	max98504->regmap = devm_regmap_init_i2c(client, &max98504_regmap);
+	if (IS_ERR(max98504->regmap)) {
+		ret = PTR_ERR(max98504->regmap);
+		dev_err(&client->dev, "regmap initialization failed: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < MAX98504_NUM_SUPPLIES; i++)
+		max98504->supplies[i].supply = max98504_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, MAX98504_NUM_SUPPLIES,
+				      max98504->supplies);
+	if (ret < 0)
+		return ret;
+
+	i2c_set_clientdata(client, max98504);
+
+	return devm_snd_soc_register_component(dev, &max98504_component_driver,
+				max98504_dai, ARRAY_SIZE(max98504_dai));
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id max98504_of_match[] = {
+	{ .compatible = "maxim,max98504" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, max98504_of_match);
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
index 000000000000..afbefad2d5ce
--- /dev/null
+++ b/sound/soc/codecs/max98504.h
@@ -0,0 +1,59 @@
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
+#define MAX98504_INTERRUPT_STATUS		0x01
+#define MAX98504_INTERRUPT_FLAGS		0x02
+#define MAX98504_INTERRUPT_ENABLE		0x03
+#define MAX98504_INTERRUPT_FLAG_CLEARS		0x04
+#define MAX98504_GPIO_ENABLE			0x10
+#define MAX98504_GPIO_CONFIG			0x11
+#define MAX98504_WATCHDOG_ENABLE		0x12
+#define MAX98504_WATCHDOG_CONFIG		0x13
+#define MAX98504_WATCHDOG_CLEAR			0x14
+#define MAX98504_CLOCK_MONITOR_ENABLE		0x15
+#define MAX98504_PVDD_BROWNOUT_ENABLE		0x16
+#define MAX98504_PVDD_BROWNOUT_CONFIG_1		0x17
+#define MAX98504_PVDD_BROWNOUT_CONFIG_2		0x18
+#define MAX98504_PVDD_BROWNOUT_CONFIG_3		0x19
+#define MAX98504_PVDD_BROWNOUT_CONFIG_4		0x1a
+#define MAX98504_PCM_RX_ENABLE			0x20
+#define MAX98504_PCM_TX_ENABLE			0x21
+#define MAX98504_PCM_TX_HIZ_CONTROL		0x22
+#define MAX98504_PCM_TX_CHANNEL_SOURCES		0x23
+#define MAX98504_PCM_MODE_CONFIG		0x24
+#define MAX98504_PCM_DSP_CONFIG			0x25
+#define MAX98504_PCM_CLOCK_SETUP		0x26
+#define MAX98504_PCM_SAMPLE_RATE_SETUP		0x27
+#define MAX98504_PCM_TO_SPEAKER_MONOMIX		0x28
+#define MAX98504_PDM_TX_ENABLE			0x30
+#define MAX98504_PDM_TX_HIZ_CONTROL		0x31
+#define MAX98504_PDM_TX_CONTROL			0x32
+#define MAX98504_PDM_RX_ENABLE			0x33
+#define MAX98504_SPEAKER_ENABLE			0x34
+#define MAX98504_SPEAKER_SOURCE_SELECT		0x35
+#define MAX98504_MEASUREMENT_ENABLE		0x36
+#define MAX98504_ANALOGUE_INPUT_GAIN		0x37
+#define MAX98504_TEMPERATURE_LIMIT_CONFIG	0x38
+#define MAX98504_GLOBAL_ENABLE			0x40
+#define MAX98504_SOFTWARE_RESET			0x41
+#define MAX98504_REV_ID				0x7fff
+
+#define MAX98504_MAX_REGISTER			0x7fff
+
+#define MAX98504_DAI_ID_PCM			1
+#define MAX98504_DAI_ID_PDM			2
+
+#endif /* MAX98504_H_ */
-- 
2.8.1
