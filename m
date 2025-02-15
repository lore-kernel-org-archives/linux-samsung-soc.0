Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA871C701E;
	Sat, 15 Feb 2025 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739622262; cv=none; b=l6i+b6z/SmZnJlaPZSdnCAC1WjNcd9hrE7VZZxpQCAz8iveIDRkT3rlyNG+yis6sMdW56EjCD6qZrggVQw191BxfU6uG9wnd9QzWsFNy47FkZ5G6JAY/3DaUzfUH0bhtmqaZ0+9CtOXjp3D497sOnkZaUdw9QsmLkLB9q6W7xiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739622262; c=relaxed/simple;
	bh=PWTbb4NCk4QhwwMl7w9Rpf4dKEqqkNa0p4Xwb7dIPQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSrB06luIgc2S5iAo4xrmaJXOtVAE/xBoQIVTJOt6TksORImiZUgRhT0b+5dcAHWLOsEII/tYYrpAM5hZiNWyf4SL903z+wnQlYWgpUCgXTl8y5BWpkQIT8lGRQBK0/M0Az/9FpuM1i6a9jJl9+2hKuGtEXNN/SiBOXmTjUghN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKI7wuY+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKI7wuY+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dc9f3cc80so1152825f8f.0;
        Sat, 15 Feb 2025 04:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622258; x=1740227058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qD+LR+mgJesHBppLUIBDM5D5VZaWL5Rq7rGbj9muQUs=;
        b=BKI7wuY+EyGd+kAiULJanuG2ypJNBuVeRmogVZKZWuk/yRmQQq6fiIDeE3eXKqEFHI
         WIkZJw2zNMPFDKzpRqwDcNMo3OxqpaT9pnAFZZXU891JDq2CYAHINbTD85LFdoquhy1n
         +8niBYhrDC86FOKXU6b0NAGqFPCaGHGq+G0sXqTmupYiw8LYjoPgM/RYp37IUp+abo8/
         7SnK1tVoS6YDYwbi8/BbrHUWcWzqrESsh24zVeDiPcjZnyjZXIXL49Bec+WhWIZm33lC
         Z3dfg3R2ZZeZ4keTkOJkOkrCbxY7e5SuxAasPVk5IuLd7L/qtb3iyqSrt80tg/R0A9nO
         Kpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622258; x=1740227058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qD+LR+mgJesHBppLUIBDM5D5VZaWL5Rq7rGbj9muQUs=;
        b=FWi84TuZXwMmcmyhHNBV/RcnfWIh7FL+0Ieg2k9Z4U5uStufjy4TKIZ5zM7uhDnWD1
         wfWYZjlnun8Qu5z+RgmVc9vrpDx+dbML6pDoTJbwpjveuXfn+2qtDl3hce2Tv3la+LB9
         kHgqcbyxo3YopuuAK83wYodOWqI2HyUMtlRFAhcu9KuAn6q6EVgqlXa07aA6f/g/PRto
         bJKrnWl+qRKK594ANaM21O5XFhR1ycTlyr3bMlG3hIky/WRwGqvDa+357XX509mn/B19
         R4klYqkkfx2rI+GykXllsLFLmxL0aJ4Oh7IxivOiyaXr/f2WiO1k9VvdqlZ3oaQn5AK/
         T80A==
X-Forwarded-Encrypted: i=1; AJvYcCV+NOwBWpH3NBlmEY1kX6Dj+5g7SImQBdnVO6m8x/Sr7Wo261c6u7WtU8fx6fni/f5IoP2ng1mFha/X9Ye8@vger.kernel.org, AJvYcCWL8wVm3cHdb0QXsYMlNx1yQ64blhPhilNNOEX1OYDaJlUBeYHfFMjpXpgFwPBkfFEqfd4B2vg5drep@vger.kernel.org, AJvYcCXnIXprh1RLOHbaGcMl+VrUcTbFoCAF0qCBJapx9bIRYhT5GCL2Wja4VMywQ4BTa9bhFIBpgUSdGoBritW2dS9iNBE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/2SBjT+0sbVRPLg7pUep15LHQBs+f8U13t++abTnHmDFgnkD
	zEP54EYsxv4yGwOWYLCrQA6RwGy2kW2KFFtHY0zzOAi9hLomQCZ+
X-Gm-Gg: ASbGncuNI+QYPucvs7Em5+0NBVZKy1I4mQZ5KvSDVZzAimeGY0YGTn5+reefR8yGsmz
	YPf14VDDVIFZdFHruXnfKTIegcPM/beMVe7r6FMGdikVVJzRbkzd/MORW3LoI/xyL8AHSypj5+L
	/jicjQ+f2XLaZy3jUKmihyQWGi50Kqi/SH0T7kvlc7qqBQTR5pL9WKlPOjQHleORonIvrBQtmlR
	S3UKwhdRg72UoDyFPkVnmJKcg3VXlCiyfIrPzri2kxXDH8zbD4Zre79AIvPFegDAU1VxnCTrnzb
	IM3qvqW8IPCj4RrTv7M6IoXhCZMbl79PQ45Yw01ytprsLxeSOsmZgwR8vJdWcbSjQAk=
X-Google-Smtp-Source: AGHT+IGMOfANBLG/cx0EXR/uYbMS60jtTakWiaRNMheiNjbe6AJXJyIjEb4Ru+s1b0JhHOVPU8mGOA==
X-Received: by 2002:a5d:6dab:0:b0:38f:3073:707 with SMTP id ffacd0b85a97d-38f33f118demr3145135f8f.7.1739622258247;
        Sat, 15 Feb 2025 04:24:18 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5b40sm7188175f8f.68.2025.02.15.04.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:24:17 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] phy: samsung: add Exynos2200 usb phy controller
Date: Sat, 15 Feb 2025 14:24:09 +0200
Message-ID: <20250215122409.162810-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Exynos2200 SoC comes with 3 PHYs - snps eUSB2, snps USBDP combophy
and a cut-off phy that origins from exynos5-usbdrd. The latter is used
for link control, as well as pipe3 attachment and detachment.

Add a new driver for it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/samsung/Kconfig                 |  13 ++
 drivers/phy/samsung/Makefile                |   1 +
 drivers/phy/samsung/phy-exynos2200-usbcon.c | 241 ++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |   3 +
 4 files changed, 258 insertions(+)
 create mode 100644 drivers/phy/samsung/phy-exynos2200-usbcon.c

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index f62285254..47e9b9926 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -90,6 +90,19 @@ config PHY_EXYNOS2200_SNPS_EUSB2
 	  This driver provides PHY interface for eUSB 2.0 controller
 	  present on Exynos5 SoC series.
 
+config PHY_EXYNOS2200_USBCON
+	tristate "Exynos2200 USBCON PHY driver"
+	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on USB_DWC3_EXYNOS
+	select GENERIC_PHY
+	select MFD_SYSCON
+	default y
+	help
+	  Enable USBCON PHY support for Exynos2200 SoC.
+	  This driver provides PHY interface for USB controller present
+	  on Exynos2200 SoC.
+
 config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
 	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
index 90b84c7fc..f70e12ddf 100644
--- a/drivers/phy/samsung/Makefile
+++ b/drivers/phy/samsung/Makefile
@@ -15,5 +15,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
 obj-$(CONFIG_PHY_EXYNOS2200_SNPS_EUSB2)	+= phy-exynos2200-snps-eusb2.o
+obj-$(CONFIG_PHY_EXYNOS2200_USBCON)	+= phy-exynos2200-usbcon.o
 obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
 obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
diff --git a/drivers/phy/samsung/phy-exynos2200-usbcon.c b/drivers/phy/samsung/phy-exynos2200-usbcon.c
new file mode 100644
index 000000000..7968c9792
--- /dev/null
+++ b/drivers/phy/samsung/phy-exynos2200-usbcon.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/soc/samsung/exynos-regs-pmu.h>
+
+#define EXYNOS2200_USBCON_LINKCTRL		0x4
+#define LINKCTRL_FORCE_QACT			BIT(8)
+
+#define EXYNOS2200_USBCON_UTMI_CTRL		0x10
+#define UTMI_CTRL_FORCE_VBUSVALID		BIT(1)
+#define UTMI_CTRL_FORCE_BVALID			BIT(0)
+
+#define EXYNOS2200_USBCON_LINK_CLKRST		0xc
+#define LINK_CLKRST_SW_RST			BIT(0)
+
+struct exynos2200_usbcon_phy_drvdata {
+	const char * const *clk_names;
+	int n_clks;
+	const char * const *regulator_names;
+	int n_regulators;
+	u32 pmu_offset_usbcon_phy;
+};
+
+struct exynos2200_usbcon_phy {
+	struct phy *phy;
+	void __iomem *base;
+	struct regmap *reg_pmu;
+	struct clk_bulk_data *clks;
+	const struct exynos2200_usbcon_phy_drvdata *drv_data;
+	u32 pmu_offset;
+	struct regulator_bulk_data *vregs;
+};
+
+static void exynos2200_usbcon_phy_isol(struct exynos2200_usbcon_phy *inst,
+				       bool isolate)
+{
+	unsigned int val;
+
+	if (!inst->reg_pmu)
+		return;
+
+	val = isolate ? 0 : EXYNOS4_PHY_ENABLE;
+
+	regmap_update_bits(inst->reg_pmu, inst->pmu_offset,
+			   EXYNOS4_PHY_ENABLE, val);
+}
+
+static void exynos2200_usbcon_phy_write_mask(void __iomem *base, u32 offset,
+					     u32 mask, u32 val)
+{
+	u32 reg;
+
+	reg = readl_relaxed(base + offset);
+	reg &= ~mask;
+	reg |= val & mask;
+	writel_relaxed(reg, base + offset);
+
+	/* Ensure above write is completed */
+	readl_relaxed(base + offset);
+}
+
+static int exynos2200_usbcon_phy_init(struct phy *p)
+{
+	struct exynos2200_usbcon_phy *phy = phy_get_drvdata(p);
+	int ret;
+
+	ret = regulator_bulk_enable(phy->drv_data->n_regulators, phy->vregs);
+	if (ret)
+		return ret;
+
+	exynos2200_usbcon_phy_isol(phy, false);
+
+	/*
+	 * Disable HWACG (hardware auto clock gating control). This will force
+	 * QACTIVE signal in Q-Channel interface to HIGH level, to make sure
+	 * the PHY clock is not gated by the hardware.
+	 */
+	exynos2200_usbcon_phy_write_mask(phy->base, EXYNOS2200_USBCON_LINKCTRL,
+					 LINKCTRL_FORCE_QACT,
+					 LINKCTRL_FORCE_QACT);
+
+	/* Reset Link */
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_LINK_CLKRST,
+					 LINK_CLKRST_SW_RST,
+					 LINK_CLKRST_SW_RST);
+
+	fsleep(10); /* required after POR high */
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_LINK_CLKRST,
+					 LINK_CLKRST_SW_RST, 0);
+
+	exynos2200_usbcon_phy_write_mask(phy->base,
+					 EXYNOS2200_USBCON_UTMI_CTRL,
+					 UTMI_CTRL_FORCE_BVALID |
+					 UTMI_CTRL_FORCE_VBUSVALID,
+					 UTMI_CTRL_FORCE_BVALID |
+					 UTMI_CTRL_FORCE_VBUSVALID);
+
+	return 0;
+}
+
+static int exynos2200_usbcon_phy_exit(struct phy *p)
+{
+	struct exynos2200_usbcon_phy *phy = phy_get_drvdata(p);
+
+	exynos2200_usbcon_phy_isol(phy, true);
+
+	regulator_bulk_disable(phy->drv_data->n_regulators, phy->vregs);
+
+	return 0;
+}
+
+static const struct phy_ops exynos2200_usbcon_phy_ops = {
+	.init		= exynos2200_usbcon_phy_init,
+	.exit		= exynos2200_usbcon_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int exynos2200_usbcon_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct exynos2200_usbcon_phy *phy;
+	const struct exynos2200_usbcon_phy_drvdata *drv_data;
+	struct phy_provider *phy_provider;
+	struct phy *generic_phy;
+	int ret;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	drv_data = of_device_get_match_data(dev);
+	if (!drv_data)
+		return -EINVAL;
+	phy->drv_data = drv_data;
+
+	phy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(phy->base))
+		return PTR_ERR(phy->base);
+
+	phy->clks = devm_kcalloc(dev, drv_data->n_clks,
+				 sizeof(*phy->clks), GFP_KERNEL);
+	if (!phy->clks)
+		return -ENOMEM;
+
+	for (int i = 0; i < drv_data->n_clks; ++i)
+		phy->clks[i].id = drv_data->clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, phy->drv_data->n_clks,
+				phy->clks);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get phy clock(s)\n");
+
+	phy->reg_pmu = syscon_regmap_lookup_by_phandle(dev->of_node,
+						       "samsung,pmu-syscon");
+	if (IS_ERR(phy->reg_pmu)) {
+		dev_err(dev, "Failed to lookup PMU regmap\n");
+		return PTR_ERR(phy->reg_pmu);
+	}
+
+	phy->pmu_offset = drv_data->pmu_offset_usbcon_phy;
+	phy->vregs = devm_kcalloc(dev, drv_data->n_regulators,
+				  sizeof(*phy->vregs), GFP_KERNEL);
+	if (!phy->vregs)
+		return -ENOMEM;
+	regulator_bulk_set_supply_names(phy->vregs,
+					drv_data->regulator_names,
+					drv_data->n_regulators);
+	ret = devm_regulator_bulk_get(dev, drv_data->n_regulators,
+				      phy->vregs);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	generic_phy = devm_phy_create(dev, NULL, &exynos2200_usbcon_phy_ops);
+	if (IS_ERR(generic_phy)) {
+		dev_err(dev, "failed to create phy %d\n", ret);
+		return PTR_ERR(generic_phy);
+	}
+
+	dev_set_drvdata(dev, phy);
+	phy_set_drvdata(generic_phy, phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		dev_err(dev, "failed to register phy provider\n");
+		return PTR_ERR(phy_provider);
+	};
+
+	return 0;
+}
+
+static const char * const exynos2200_clk_names[] = {
+	"apb",
+};
+
+static const char * const exynos2200_regulator_names[] = {
+	"vdd1p9", "vdd3",
+};
+
+static const struct exynos2200_usbcon_phy_drvdata exynos2200_usbcon_phy = {
+	.clk_names		= exynos2200_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos2200_clk_names),
+	.pmu_offset_usbcon_phy	= EXYNOS2200_PHY_CTRL_USB20,
+	.regulator_names	= exynos2200_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos2200_regulator_names),
+};
+
+static const struct of_device_id exynos2200_usbcon_phy_of_match_table[] = {
+	{
+		.compatible = "samsung,exynos2200-usbcon-phy",
+		.data = &exynos2200_usbcon_phy,
+	}, { },
+};
+MODULE_DEVICE_TABLE(of, exynos2200_usbcon_phy_of_match_table);
+
+static struct platform_driver exynos2200_usbcon_phy_driver = {
+	.probe		= exynos2200_usbcon_phy_probe,
+	.driver = {
+		.name	= "exynos2200-usbcon-phy",
+		.of_match_table = exynos2200_usbcon_phy_of_match_table,
+	},
+};
+
+module_platform_driver(exynos2200_usbcon_phy_driver);
+MODULE_DESCRIPTION("Exynos2200 USBCON PHY driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index ce1a3790d..b77187ba5 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -185,6 +185,9 @@
 /* Only for S5Pv210 */
 #define S5PV210_EINT_WAKEUP_MASK	0xC004
 
+/* Only for Exynos2200 */
+#define EXYNOS2200_PHY_CTRL_USB20	0x72C
+
 /* Only for Exynos4210 */
 #define S5P_CMU_CLKSTOP_LCD1_LOWPWR	0x1154
 #define S5P_CMU_RESET_LCD1_LOWPWR	0x1174
-- 
2.43.0

