Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47D021FF41
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 23:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759792921; cv=none; b=dBVALF5eIBzprg6c0heYCbulNPj6OMp+PfLsPInUTR5TyDnsMvvpXCcdWiFBiKzkccroZE74nXrf4DnyR94vDdJdyrtobIH2/NPWvxew3qRTBzgkB8UB+SAeBDTXzxtZ9ANLnNqdm7VRo9FNdWK7wGCnX/WOPP9cQ4x8bDSpDJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759792921; c=relaxed/simple;
	bh=Cwv/If4l9BZSBeyP4X7g96kJ+qNzG9ehV7SgUgJNwII=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FhuRR1pGKcJB8RSUrVwdzocpZrKdRhnbmV5oXTmHOmbUw68UdXFggGMWHzEjEu45MzgekDzujxF2vU6cBOoVEKH7cOML8WHVdqDQ6/RIiM6lNuwwTb1VCtvPS0+d5lKQ1yXIi3ntEJvpF79xdRgGerxVfTuuTqFJUgW0NfFbcwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hifXR65g; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hifXR65g"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-336b646768eso6697334a91.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 16:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759792918; x=1760397718; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HdBa1dNHqFCAS2+hTTbLrjvc4+nTHZT05jW4kQYHqAU=;
        b=hifXR65gZv1fjfBSS67glwUCXvhD6++vHvZHDKzCk5hr3mqPBzUhCFyq6bo/Airt4C
         7nNscNbhSiMqanxiqy1DovqLkJ3zw78nJGLltfgt8pZkztYlHNeOoeDY1adrtCkX9+1Q
         oLBVMoYNzeQvhyheguT1nS6Ck2PTteWeKBmikMcNIXAWniEeqU5tSaaj1DsW3P4UA3GB
         8+JPM7BXMSC5P+vqWlhYRpeCur19m7W9SXObBDbMDvhO6YVozra4v5KOqIePaf6ihPjd
         zdvy8SMQTmM0fXfdNc0AscR1DrASQkvUaoXEOEOqIWGDk8X2E+rvRBFGXFqgZD0wVVnl
         iGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759792918; x=1760397718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HdBa1dNHqFCAS2+hTTbLrjvc4+nTHZT05jW4kQYHqAU=;
        b=jO889cd6EMIZRcOGNhxUVBE3nDYlKv7qF3gPHojHq/A++Z2Dw2lUp5ATiYEw5CGO8Y
         lHVxt6K7RD7Lnsdb9QmiQgt2zS2uhWqTO30DPNhWaZKptNrvFi0hLEeFnE2WvE+XClgp
         cgPb5qXUAf8V/guua0476x42iiblnPvYXitQ+wA37lCWbV4aJoTuBzE3p6Dztrux9ocn
         0DKfrkTy2wLildTzNQmebY4RBtfnk04pXUupIoJMARZHwSdhJYnLQkGPc3IEt1Fj0v1O
         ll5FRWTckgVz32ZOQqWGyC1WEoH9fDvi1efVXIXLDeFOsplnNvYoSqmH6rddirQ0URsh
         KdXg==
X-Forwarded-Encrypted: i=1; AJvYcCXxONGcOrGrOx15uLnec5CV0b7AoeIUqUFClIP9xs8x2PsZH/zCn+993Ye6Ta+B8eh92a0F5SqTJA4x9ImPVEWrKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK25AQjKGREklX9fT81JqnEE0wzf1kgT2YbBCaeyhAfcw+oLgd
	5tX4sbiXEM6rzWE0CnZBM7NpHPSRmZ4QJHqVhTOyqSsQBeYpMOoK59hRIlHNY3eUY6X+U89lqa5
	FjbunKQ==
X-Google-Smtp-Source: AGHT+IHCrazxJE0VodxQkYh/ySiAwffUOkcLakkOzySzdYCDetGseFf+qCf9zIoQeCWY/XlH7ga9uvTYgzY=
X-Received: from pjbb16.prod.google.com ([2002:a17:90a:110:b0:32f:46d:993b])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a8f:b0:330:852e:2bcc
 with SMTP id 98e67ed59e1d1-339c27b94e9mr15676987a91.21.1759792918222; Mon, 06
 Oct 2025 16:21:58 -0700 (PDT)
Date: Mon,  6 Oct 2025 23:21:24 +0000
In-Reply-To: <20251006232125.1833979-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251006232125.1833979-4-royluo@google.com>
Subject: [PATCH v1 3/4] usb: dwc3: Add Google SoC USB PHY driver
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Support the USB PHY found on Google Tensor SoCs.
This particular USB PHY supports both high-speed and super-speed
operations, and is paired with the SNPS DWC3 controller that's also
integrated on the SoCs.
This initial patch specifically adds functionality for high-speed.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/phy/Kconfig                 |   1 +
 drivers/phy/Makefile                |   1 +
 drivers/phy/google/Kconfig          |  15 ++
 drivers/phy/google/Makefile         |   2 +
 drivers/phy/google/phy-google-usb.c | 286 ++++++++++++++++++++++++++++
 5 files changed, 305 insertions(+)
 create mode 100644 drivers/phy/google/Kconfig
 create mode 100644 drivers/phy/google/Makefile
 create mode 100644 drivers/phy/google/phy-google-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 58c911e1b2d2..7772c04d5f5c 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -106,6 +106,7 @@ source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
 source "drivers/phy/freescale/Kconfig"
+source "drivers/phy/google/Kconfig"
 source "drivers/phy/hisilicon/Kconfig"
 source "drivers/phy/ingenic/Kconfig"
 source "drivers/phy/lantiq/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c670a8dac468..1b6dd784351c 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -18,6 +18,7 @@ obj-y					+= allwinner/	\
 					   broadcom/	\
 					   cadence/	\
 					   freescale/	\
+					   google/	\
 					   hisilicon/	\
 					   ingenic/	\
 					   intel/	\
diff --git a/drivers/phy/google/Kconfig b/drivers/phy/google/Kconfig
new file mode 100644
index 000000000000..2ba13b77c819
--- /dev/null
+++ b/drivers/phy/google/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Phy drivers for Google platforms
+#
+config PHY_GOOGLE_USB
+	tristate "Google Tensor SoC series USB PHY driver"
+	depends on HAS_IOMEM
+	depends on OF
+	depends on TYPEC
+	depends on USB_DWC3_GOOGLE
+	select GENERIC_PHY
+	default y
+	help
+	  Add support for the USB PHY on Google SoC series, providing
+	  the PHY interface for the integrated USB DRD controller.
diff --git a/drivers/phy/google/Makefile b/drivers/phy/google/Makefile
new file mode 100644
index 000000000000..f926bd033533
--- /dev/null
+++ b/drivers/phy/google/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PHY_GOOGLE_USB)	+= phy-google-usb.o
diff --git a/drivers/phy/google/phy-google-usb.c b/drivers/phy/google/phy-google-usb.c
new file mode 100644
index 000000000000..f666ea6fbd4e
--- /dev/null
+++ b/drivers/phy/google/phy-google-usb.c
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * phy-google-usb.c - Google USB PHY driver
+ *
+ * Copyright (C) 2025, Google LLC
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/mutex.h>
+#include <linux/cleanup.h>
+#include <linux/usb/typec_mux.h>
+
+#define USBCS_USB2PHY_CFG19_OFFSET 0x0
+#define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
+
+#define USBCS_USB2PHY_CFG21_OFFSET 0x8
+#define USBCS_USB2PHY_CFG21_PHY_ENABLE BIT(12)
+#define USBCS_USB2PHY_CFG21_REF_FREQ_SEL GENMASK(15, 13)
+#define USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL BIT(19)
+
+#define USBCS_PHY_CFG1_OFFSET 0x28
+#define USBCS_PHY_CFG1_SYS_VBUSVALID BIT(17)
+
+#define USBCS_TOP_CTRL_CFG1_OFFSET 0x0
+#define USBCS_TOP_CTRL_CFG1_USB2ONLY_MODE BIT(5)
+
+enum google_usb_phy_id {
+	GOOGLE_USB2_PHY,
+	GOOGLE_USB_PHY_NUM,
+};
+
+struct google_usb_phy_instance {
+	int index;
+	struct phy *phy;
+	struct clk *clk;
+	struct reset_control *rst;
+};
+
+struct google_usb_phy {
+	struct device *dev;
+	void __iomem *usb2_cfg_base;
+	void __iomem *dp_top_base;
+	void __iomem *usb_top_cfg_base;
+	struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
+	/* serialize phy access */
+	struct mutex phy_mutex;
+	struct typec_switch_dev *sw;
+	enum typec_orientation orientation;
+};
+
+static inline struct google_usb_phy *to_google_usb_phy(struct google_usb_phy_instance *inst)
+{
+	return container_of(inst, struct google_usb_phy, insts[inst->index]);
+}
+
+static void set_vbus_valid(struct google_usb_phy *gphy)
+{
+	u32 reg;
+
+	if (gphy->orientation == TYPEC_ORIENTATION_NONE) {
+		reg = readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
+		reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
+		writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
+	} else {
+		reg = readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
+		reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
+		writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
+	}
+}
+
+static int google_usb_set_orientation(struct typec_switch_dev *sw,
+				      enum typec_orientation orientation)
+{
+	struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
+
+	dev_dbg(gphy->dev, "set orientation %d\n", orientation);
+
+	gphy->orientation = orientation;
+
+	if (pm_runtime_suspended(gphy->dev))
+		return 0;
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	set_vbus_valid(gphy);
+
+	return 0;
+}
+
+static int google_usb2_phy_init(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = to_google_usb_phy(inst);
+	u32 reg;
+	int ret = 0;
+
+	dev_dbg(gphy->dev, "initializing usb2 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	 /*
+	  * TODO: usb2only mode should be removed once usb3 is supported
+	  */
+	reg = readl(gphy->usb_top_cfg_base + USBCS_TOP_CTRL_CFG1_OFFSET);
+	reg |= USBCS_TOP_CTRL_CFG1_USB2ONLY_MODE;
+	writel(reg, gphy->usb_top_cfg_base + USBCS_TOP_CTRL_CFG1_OFFSET);
+
+	reg = readl(gphy->usb2_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+	reg &= ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
+	reg &= ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
+	reg |= FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
+	writel(reg, gphy->usb2_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+
+	reg = readl(gphy->usb2_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
+	reg &= ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
+	reg |= FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);
+	writel(reg, gphy->usb2_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
+
+	set_vbus_valid(gphy);
+
+	ret = clk_prepare_enable(inst->clk);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(inst->rst);
+	if (ret) {
+		clk_disable_unprepare(inst->clk);
+		return ret;
+	}
+
+	reg = readl(gphy->usb2_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+	reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
+	writel(reg, gphy->usb2_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+
+	return ret;
+}
+
+static int google_usb2_phy_exit(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = to_google_usb_phy(inst);
+	u32 reg;
+
+	dev_dbg(gphy->dev, "exiting usb2 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	reg = readl(gphy->usb2_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+	reg &= ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
+	writel(reg, gphy->usb2_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
+
+	reset_control_assert(inst->rst);
+	clk_disable_unprepare(inst->clk);
+
+	return 0;
+}
+
+static const struct phy_ops google_usb2_phy_ops = {
+	.init		= google_usb2_phy_init,
+	.exit		= google_usb2_phy_exit,
+};
+
+static struct phy *google_usb_phy_xlate(struct device *dev,
+					const struct of_phandle_args *args)
+{
+	struct google_usb_phy *gphy = dev_get_drvdata(dev);
+
+	if (args->args[0] >= GOOGLE_USB_PHY_NUM) {
+		dev_err(dev, "invalid PHY index requested from DT\n");
+		return ERR_PTR(-ENODEV);
+	}
+	return gphy->insts[args->args[0]].phy;
+}
+
+static int google_usb_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct google_usb_phy *gphy;
+	struct phy *phy;
+	struct google_usb_phy_instance *inst;
+	struct phy_provider *phy_provider;
+	struct typec_switch_desc sw_desc = { };
+	int ret;
+
+	gphy = devm_kzalloc(dev, sizeof(*gphy), GFP_KERNEL);
+	if (!gphy)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, gphy);
+	gphy->dev = dev;
+
+	ret = devm_mutex_init(dev, &gphy->phy_mutex);
+	if (ret)
+		return ret;
+
+	gphy->usb2_cfg_base =
+			devm_platform_ioremap_resource_byname(pdev, "usb2_cfg_csr");
+	if (IS_ERR(gphy->usb2_cfg_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->usb2_cfg_base),
+				    "invalid usb2 cfg csr\n");
+
+	gphy->dp_top_base =
+			devm_platform_ioremap_resource_byname(pdev, "dp_top_csr");
+	if (IS_ERR(gphy->dp_top_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->dp_top_base),
+				    "invalid dp top csr\n");
+
+	gphy->usb_top_cfg_base =
+			devm_platform_ioremap_resource_byname(pdev, "usb_top_cfg_csr");
+	if (IS_ERR(gphy->usb_top_cfg_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->usb_top_cfg_base),
+				    "invalid usb top cfg csr\n");
+
+	inst = &gphy->insts[GOOGLE_USB2_PHY];
+	inst->index = GOOGLE_USB2_PHY;
+	phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create usb2 phy instance\n");
+	inst->phy = phy;
+	phy_set_drvdata(phy, inst);
+	inst->clk = devm_clk_get(dev, "usb2_phy_clk");
+	if (IS_ERR(inst->clk))
+		return dev_err_probe(dev, PTR_ERR(inst->clk),
+				     "failed to get usb2 phy clk\n");
+	inst->rst = devm_reset_control_get_exclusive(dev, "usb2_phy_reset");
+	if (IS_ERR(inst->rst))
+		return dev_err_probe(dev, PTR_ERR(inst->rst),
+				     "failed to get usb2 phy reset\n");
+
+	phy_provider = devm_of_phy_provider_register(dev, google_usb_phy_xlate);
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(dev, PTR_ERR(phy_provider),
+				     "failed to register phy provider\n");
+
+	pm_runtime_enable(dev);
+
+	sw_desc.fwnode = dev_fwnode(dev);
+	sw_desc.drvdata = gphy;
+	sw_desc.name = fwnode_get_name(dev_fwnode(dev));
+	sw_desc.set = google_usb_set_orientation;
+
+	gphy->sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(gphy->sw))
+		return dev_err_probe(dev, PTR_ERR(gphy->sw),
+				     "failed to register typec switch\n");
+
+	return 0;
+}
+
+static void google_usb_phy_remove(struct platform_device *pdev)
+{
+	struct google_usb_phy *gphy = dev_get_drvdata(&pdev->dev);
+
+	typec_switch_unregister(gphy->sw);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct of_device_id google_usb_phy_of_match[] = {
+	{
+		.compatible = "google,usb-phy",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, google_usb_phy_of_match);
+
+static struct platform_driver google_usb_phy = {
+	.probe	= google_usb_phy_probe,
+	.remove = google_usb_phy_remove,
+	.driver = {
+		.name		= "google-usb-phy",
+		.of_match_table	= google_usb_phy_of_match,
+	}
+};
+
+module_platform_driver(google_usb_phy);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Google USB phy driver");
-- 
2.51.0.618.g983fd99d29-goog

