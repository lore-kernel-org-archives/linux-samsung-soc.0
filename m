Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6751ACEC6;
	Sat, 15 Feb 2025 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739622261; cv=none; b=DZD2luQExBekwVKT+o8jeGhLPCqo0qt0aYYoBBPsELsJRl71K3h1xR2KTXeU4OBCyx4eg/rTYApUABhc0g3jS3jdr0QVMYHGnx5VbHerXpDtvxuMWnIGFD8MfAyfJ7zISIyf09ezHphkKHgJByZiDuN5BF0kADe1bxQ8+d8i+3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739622261; c=relaxed/simple;
	bh=7/4m7iixD1PTtau/qok6kfD7Ona3YZ5ylujX1stuuQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0uiQWFYFQQvQRSgYIQELaO2JPJad12v7W+xKCKBF/TJRNpu4GxQs2qChnimEonzsRU+PGypJ2Cui+WVV4ZOmQ9LBsEiC2loFmkPf2PjOe/O4Vi5cF6+G/f7W1Sdrmri0wP3TlI18o4hYqy83Rbj4pvbzSQtzE9+jiIxRwLQGmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdJwPTVR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdJwPTVR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4395a06cf43so18268215e9.2;
        Sat, 15 Feb 2025 04:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622257; x=1740227057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51FSJwa1B8JQtgUr5uBGNpS4S0Fx4/SRveFo1cyR6gk=;
        b=JdJwPTVR5X8PvcWBoJrMwvdkXgdaga4EAU+9XSvKHv7e83d8f/lOU1o5kEMPXOuQ8v
         ICq19oZ9ce4t3PFv43/6HGcSCEis/w83i/KfewIII/Way2f8D85lK6zaQMXCtr4/6GfT
         pZy2w5cnGNjcQSpA+8Xfm4CkeJ/y1/JEuyefLoclKxCDblYLW69Fi+YPvwRu8cQb2wz5
         ZLkz1dtLlJBKGS0JFdCV25IxIuTTsVgZGX/l4y2Qri0zfNGcoEUKRWL+vCqYiEoDVDb/
         ZkwmMlhbOQD1V8lPRdngi+wvr7oc1pSK6jePamIdsbaMBlrXQHTl7DugIg9uihRbrYRh
         +SHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622257; x=1740227057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51FSJwa1B8JQtgUr5uBGNpS4S0Fx4/SRveFo1cyR6gk=;
        b=IU0auiUyL8qD3u9/GPjUQVsalz7+ucff4XQucsPqYKbkpcv2ilMM9jmadr3SpGLM9t
         H8DpQDE9bm9AmY0OHk8GFIOtSDqTrRv6zRdHBaaeR7Zkd9YitO+lB71nvmD7uTnngwOX
         ksqpBe4ApjGTXL1WpW65+p0VsSu7QqaLMQ6Khx+ZWC8eFAJUFL1EC7ezYMZFAd2RchBH
         fh7Nduo11W0cTMAPcsyw3qsHLWA1bS2F9Jsgzi7QaCC/zq3wmDKfT5IYyj07L32uq22y
         iZalYJdCEZ0tPDYng8udhW8t6gEFwkGfqrjtqIrr1Yr+2yaGQ9hdVVYz3W6uHDezSMHX
         AZ0g==
X-Forwarded-Encrypted: i=1; AJvYcCUoiFgzDQHqfR86jVIpX0fcqgzE5xJw5WObRtmUrNvarZpbPNbgHIIgNdOCo2qRjZL+uMPR3OBUf2fW@vger.kernel.org, AJvYcCWDYaTA9AQPjafPUR163ospjp+ggV2TxkIO14kqs3E5vvW/lp9h+7T8K66D1zCYHyl+IAWw5sdtrzXndu7TcXg5ILA=@vger.kernel.org, AJvYcCWmHmyuuMN1JxNqWzi3ngKQb3R724JxJofSA1u7alIMcRn19rN+1BMLRwgAN/kV7M5V4K5auO1YPVMQvhI/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8x0E4VUniYbFPi8AEvOyZqxiA1FAk0z+CEVjRLCV9OTAxc1Dn
	lxIr5sRo/OVR9BdcDjxO2lMf6oNwVhoNqwSzSgT16ySHRcijsXgI
X-Gm-Gg: ASbGncsqR3eORBigO4mPIkvbxN/Psg7x/ispE99DwPHo61guvMM7JJk9VhWRDbYhwXU
	BbYixq2OKvCtqCiKmB+E+7QvBO88Bb9mLhvoUkHA/n4SMNDO5JzdhyxnEhWngBS+6yyec5lrZE/
	mX76rBHhTiX4yCAX++JQR9uHrq088MlhPpYyKz53+XHZkH0UHxzvJtt52KlB351U9tz6W2ETvl8
	7ZjSZ/5DYphc6B54vk+0lJ7aK6diaxlt/sL4eFfRuT+H6v6Fz1783pJnGLHeH7DSyy+a/4SKQeu
	XXcLj5DTVH8QmxpTVclCs0ahHBvOH/whm6cMRZmAaH2YrTHaWr1KJWJH04Qdm8HSNik=
X-Google-Smtp-Source: AGHT+IGDu08NJm74LFNesvbHRE+N6+Y2beeK3Y8t6PLpq9R6tKeeegQvlmaspOLtMEpL/BcR/opmmQ==
X-Received: by 2002:a05:600c:4f51:b0:434:ff9d:a3a1 with SMTP id 5b1f17b1804b1-4396e6d4aa8mr25721445e9.2.1739622257010;
        Sat, 15 Feb 2025 04:24:17 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5b40sm7188175f8f.68.2025.02.15.04.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:24:16 -0800 (PST)
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
Subject: [PATCH v1 3/4] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Date: Sat, 15 Feb 2025 14:24:08 +0200
Message-ID: <20250215122409.162810-4-ivo.ivanov.ivanov1@gmail.com>
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

The Exynos2200 SoC uses Synopsis eUSB2 PHY for USB 2.0. Add a new
driver for it.

eUSB2 on Exynos SoCs is usually paired alongside a USB PHY controller.
Currently the driver is modelled to take and enable/disable the usb phy
controller when needed.

The driver is based on information from downstream drivers.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/samsung/Kconfig                   |  13 +
 drivers/phy/samsung/Makefile                  |   1 +
 .../phy/samsung/phy-exynos2200-snps-eusb2.c   | 351 ++++++++++++++++++
 3 files changed, 365 insertions(+)
 create mode 100644 drivers/phy/samsung/phy-exynos2200-snps-eusb2.c

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index e2330b089..f62285254 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -77,6 +77,19 @@ config PHY_S5PV210_USB2
 	  particular SoC is compiled in the driver. In case of S5PV210 two phys
 	  are available - device and host.
 
+config PHY_EXYNOS2200_SNPS_EUSB2
+	tristate "Exynos2200 eUSB 2.0 PHY driver"
+	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on USB_DWC3_EXYNOS
+	select GENERIC_PHY
+	select MFD_SYSCON
+	default y
+	help
+	  Enable USBCON PHY support for Exynos2200 SoC.
+	  This driver provides PHY interface for eUSB 2.0 controller
+	  present on Exynos5 SoC series.
+
 config PHY_EXYNOS5_USBDRD
 	tristate "Exynos5 SoC series USB DRD PHY driver"
 	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
index fea1f96d0..90b84c7fc 100644
--- a/drivers/phy/samsung/Makefile
+++ b/drivers/phy/samsung/Makefile
@@ -14,5 +14,6 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4210_USB2)	+= phy-exynos4210-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
+obj-$(CONFIG_PHY_EXYNOS2200_SNPS_EUSB2)	+= phy-exynos2200-snps-eusb2.o
 obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
 obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
diff --git a/drivers/phy/samsung/phy-exynos2200-snps-eusb2.c b/drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
new file mode 100644
index 000000000..ee6d96411
--- /dev/null
+++ b/drivers/phy/samsung/phy-exynos2200-snps-eusb2.c
@@ -0,0 +1,351 @@
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
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+
+#define EXYNOS2200_EUSB2_RST_CTRL		0x0
+#define EXYNOS2200_UTMI_PORT_RESET_MASK		GENMASK(5, 4)
+#define EXYNOS2200_EUSB_PHY_RESET_MASK		GENMASK(1, 0)
+
+#define EXYNOS2200_EUSB2_CMN_CTRL		0x4
+#define EXYNOS2200_PHY_CFG_RPTR_MODE		BIT(10)
+#define EXYNOS2200_REF_FREQ_SEL			GENMASK(6, 4)
+#define EXYNOS2200_PHY_ENABLE			BIT(0)
+
+#define EXYNOS2200_EUSB2_PLLCFG0		0x8
+#define EXYNOS2200_PLL_FB_DIV_MASK		GENMASK(19, 8)
+
+#define EXYNOS2200_EUSB2_PLLCFG1		0xc
+#define EXYNOS2200_PLL_REF_DIV			GENMASK(11, 8)
+
+#define EXYNOS2200_EUSB2_TESTSE			0x20
+#define EXYNOS2200_TEST_IDDQ			BIT(6)
+
+struct exynos2200_snps_eusb2_phy_drvdata {
+	const char * const *clk_names;
+	int n_clks;
+	const char * const *regulator_names;
+	int n_regulators;
+};
+
+struct exynos2200_snps_eusb2_phy {
+	struct phy *phy;
+	void __iomem *base;
+
+	struct clk *ref_clk;
+	struct clk_bulk_data *clks;
+	const struct exynos2200_snps_eusb2_phy_drvdata *drv_data;
+	struct reset_control *phy_reset;
+
+	struct regulator_bulk_data *vregs;
+
+	enum phy_mode mode;
+
+	struct phy *repeater;
+	struct phy *usbcon;
+};
+
+static void exynos2200_snps_eusb2_phy_write_mask(void __iomem *base, u32 offset,
+						 u32 mask, u32 val)
+{
+	u32 reg;
+
+	reg = readl_relaxed(base + offset);
+	reg &= ~mask;
+	reg |= val & mask;
+	writel_relaxed(reg, base + offset);
+
+	/* ensure above write is completed */
+	readl_relaxed(base + offset);
+}
+
+static int exynos2200_snps_eusb2_ref_clk_init(struct exynos2200_snps_eusb2_phy *phy)
+{
+	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
+
+	switch (ref_clk_freq) {
+	case 19200000:
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+						     EXYNOS2200_REF_FREQ_SEL,
+						     0);
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG0,
+						     EXYNOS2200_PLL_FB_DIV_MASK,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 368));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG1,
+						     EXYNOS2200_PLL_REF_DIV,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 0));
+		break;
+
+	case 20000000:
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+						     EXYNOS2200_REF_FREQ_SEL,
+						     FIELD_PREP(EXYNOS2200_REF_FREQ_SEL, 1));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG0,
+						     EXYNOS2200_PLL_FB_DIV_MASK,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 352));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG1,
+						     EXYNOS2200_PLL_REF_DIV,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 0));
+		break;
+
+	case 24000000:
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+						     EXYNOS2200_REF_FREQ_SEL,
+						     FIELD_PREP(EXYNOS2200_REF_FREQ_SEL, 2));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG0,
+						     EXYNOS2200_PLL_FB_DIV_MASK,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 288));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG1,
+						     EXYNOS2200_PLL_REF_DIV,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 0));
+		break;
+
+	case 26000000:
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+						     EXYNOS2200_REF_FREQ_SEL,
+						     FIELD_PREP(EXYNOS2200_REF_FREQ_SEL, 3));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG0,
+						     EXYNOS2200_PLL_FB_DIV_MASK,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 263));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG1,
+						     EXYNOS2200_PLL_REF_DIV,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 0));
+		break;
+
+	case 48000000:
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+						     EXYNOS2200_REF_FREQ_SEL,
+						     FIELD_PREP(EXYNOS2200_REF_FREQ_SEL, 2));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG0,
+						     EXYNOS2200_PLL_FB_DIV_MASK,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 288));
+
+		exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_PLLCFG1,
+						     EXYNOS2200_PLL_REF_DIV,
+						     FIELD_PREP(EXYNOS2200_PLL_FB_DIV_MASK, 1));
+		break;
+
+	default:
+		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int exynos2200_snps_eusb2_phy_init(struct phy *p)
+{
+	struct exynos2200_snps_eusb2_phy *phy = phy_get_drvdata(p);
+	int ret;
+
+	ret = regulator_bulk_enable(phy->drv_data->n_regulators, phy->vregs);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(phy->drv_data->n_clks, phy->clks);
+	if (ret) {
+		dev_err(&p->dev, "failed to enable clocks, %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = phy_init(phy->usbcon);
+	if (ret) {
+		dev_err(&p->dev, "usbcon init failed. %d\n", ret);
+		goto disable_ref_clk;
+	}
+
+	exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_RST_CTRL,
+					     EXYNOS2200_UTMI_PORT_RESET_MASK |
+					     EXYNOS2200_EUSB_PHY_RESET_MASK,
+					     FIELD_PREP(EXYNOS2200_UTMI_PORT_RESET_MASK, 0x1) |
+					     FIELD_PREP(EXYNOS2200_EUSB_PHY_RESET_MASK, 0x1));
+	fsleep(50); /* required after holding phy in reset */
+
+	exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+					     EXYNOS2200_PHY_CFG_RPTR_MODE,
+					     EXYNOS2200_PHY_CFG_RPTR_MODE);
+
+	/* update ref_clk related registers */
+	ret = exynos2200_snps_eusb2_ref_clk_init(phy);
+	if (ret)
+		return ret;
+
+	exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_TESTSE,
+					     EXYNOS2200_TEST_IDDQ,
+					     0);
+	fsleep(10); /* required after releasing test_iddq */
+
+	exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_RST_CTRL,
+					     EXYNOS2200_EUSB_PHY_RESET_MASK,
+					     0);
+
+	exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_CMN_CTRL,
+					     EXYNOS2200_PHY_ENABLE,
+					     EXYNOS2200_PHY_ENABLE);
+
+	exynos2200_snps_eusb2_phy_write_mask(phy->base, EXYNOS2200_EUSB2_RST_CTRL,
+					     EXYNOS2200_UTMI_PORT_RESET_MASK,
+					     0);
+	return 0;
+
+disable_ref_clk:
+	clk_disable_unprepare(phy->ref_clk);
+
+disable_vreg:
+	regulator_bulk_disable(phy->drv_data->n_regulators, phy->vregs);
+
+	return ret;
+}
+
+static int exynos2200_snps_eusb2_phy_exit(struct phy *p)
+{
+	struct exynos2200_snps_eusb2_phy *phy = phy_get_drvdata(p);
+
+	phy_exit(phy->usbcon);
+
+	clk_disable_unprepare(phy->ref_clk);
+	regulator_bulk_disable(phy->drv_data->n_regulators, phy->vregs);
+
+	return 0;
+}
+
+static const struct phy_ops exynos2200_snps_eusb2_phy_ops = {
+	.init		= exynos2200_snps_eusb2_phy_init,
+	.exit		= exynos2200_snps_eusb2_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int exynos2200_snps_eusb2_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct exynos2200_snps_eusb2_phy *phy;
+	const struct exynos2200_snps_eusb2_phy_drvdata *drv_data;
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
+	ret = devm_clk_bulk_get(dev, drv_data->n_clks,
+				phy->clks);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get phy clock(s)\n");
+
+	for (int i = 0; i < phy->drv_data->n_clks; ++i) {
+		if (!strcmp(phy->clks[i].id, "ref")) {
+			phy->ref_clk = phy->clks[i].clk;
+			break;
+		}
+	}
+
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
+	/* we treat the usblink controller phy as a separate phy */
+	phy->usbcon = devm_of_phy_get_by_index(dev, np, 0);
+	if (IS_ERR(phy->usbcon))
+		return dev_err_probe(dev, PTR_ERR(phy->usbcon),
+				     "failed to get usbcon\n");
+
+	generic_phy = devm_phy_create(dev, NULL, &exynos2200_snps_eusb2_phy_ops);
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
+	"ref", "apb", "ctrl",
+};
+
+static const char * const exynos2200_regulator_names[] = {
+	"vdd", "vdda12",
+};
+
+static const struct exynos2200_snps_eusb2_phy_drvdata exynos2200_snps_eusb2_phy = {
+	.clk_names		= exynos2200_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos2200_clk_names),
+	.regulator_names	= exynos2200_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos2200_regulator_names),
+};
+
+static const struct of_device_id exynos2200_snps_eusb2_phy_of_match_table[] = {
+	{
+		.compatible = "samsung,exynos2200-snps-eusb2-phy",
+		.data = &exynos2200_snps_eusb2_phy,
+	}, { },
+};
+MODULE_DEVICE_TABLE(of, exynos2200_snps_eusb2_phy_of_match_table);
+
+static struct platform_driver exynos2200_snps_eusb2_phy_driver = {
+	.probe		= exynos2200_snps_eusb2_phy_probe,
+	.driver = {
+		.name	= "exynos2200-snps-eusb2-hsphy",
+		.of_match_table = exynos2200_snps_eusb2_phy_of_match_table,
+	},
+};
+
+module_platform_driver(exynos2200_snps_eusb2_phy_driver);
+MODULE_DESCRIPTION("Exynos2200 SNPS eUSB2 PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

