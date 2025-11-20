Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B37828504D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 17:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763660225; cv=none; b=lPqMc8qNQo0zf4M5xK8HUyDI85gHEA494ZJ9GP0V3UrOQBrxZ4jgh455nEWa8/pC0i01vGeqvIqt1M6amQ7RoK0B24wil7TPkOwNC3POxzBQmBjFtzWws6vmt+WSPOo2x4JviUXRMn9Nzl3/DJd/HKCcoZXmHdmmnlQH+VhYm9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763660225; c=relaxed/simple;
	bh=JthHQZ0hDV/qVs0AZiaQnkr3kwkZABgCK3oU2Afa/C0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bmg4EB7d9dVMbsTGZJZ22Q+n/8RhB+rUhQEJK8xa9l7+T6CG3gWaCojNCGDLQAaW+KWo6zXqqMDUVYggRar7tFTwIjiqY1REWl75N08eZwp4uIpkzkUrr323rVJDAq3Q5C8GRjkBwPHBQ3K/ghrnF4Fjnwytq6ljtY2llzTehKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wOyY2glk; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wOyY2glk"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-bce224720d8so2424226a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 09:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763660222; x=1764265022; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r0pYWr10zORS7AAoxyhKFhMXi51TPD7ie0xcMmncmXI=;
        b=wOyY2glkUxWMh3CXOClHXd8r3G67u65Kk7AsIkhDgv7TPMt9KBK2UDaf5GqbZBwzPo
         aGTWHZHuUBI2YJy3fFQRueA4Z/37OfuVU/zKOA06sFb8wGopPr+Y8QrowwlQp3EtDeYd
         1skSbT+fW5Y5myoobb9ANTjuZliEMSM0WRhFd/CfgN4cGQwYf01oSmmtJ+x1QV5oQEnt
         RJwZ42wOXMRzHofqEQePsiO/WRXOpg8h64ihepuTLm728rURa6sR3Due0YiUIQXT+pIq
         l6rQI9rgAocweIlvmQJjL7ulToQD1jSuI7QqhLpxT3NyFLmSUD8xmJ+kSMlJHaIpXI54
         mXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763660222; x=1764265022;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0pYWr10zORS7AAoxyhKFhMXi51TPD7ie0xcMmncmXI=;
        b=qpmja7Hv5p3NCjtdKYowpBJkl4T0lu2Qk1M7nB9r3W6vK19rsg2vCPkJWGaX1fliNY
         frmWX4lcEyoltGycwptmH6kgu1KRKNJa/PY9F0ZC3MNt5rhcff4Q31F3ylG9x88Usp8c
         9cR+CDVYfR2KzOeoHiJDESeHcwZb9paMjY2CShp3bFw4O0xqZlkNN0T4xs7rGIdjDFCq
         47ckHREyiCmvZm+ktlqzaOSpsG6IoEFSZGwA2gOca0YfeP2DfqbKqYMFyYOAkUrYf7kC
         sU2ffzNRVD4hUbC36KIeDcM8JuUM9YowlINF8UjuAepJwqkD9PaNFgDnY7WinE3q0zRH
         cjuA==
X-Forwarded-Encrypted: i=1; AJvYcCX3DXCgzO5hWPVmjBWWlzHh+6+sLejPipAC0YiclZzPeKSsSfzLZbRSG5txigbP2X4NowW1p+eJd8HI6CcGXVp6SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7eE+ZW0KrbKAJOhdWBz5fQuPA2ModNYry7Oi4lG9AqT5Lrk6H
	1iiZCtZh1PUb1XMgKHdFBJBRm84xaXMzGhnVix5ieddEJ9ATyS0CUExkkNjx3F5YLnPUb3/hfpP
	exlBdUA==
X-Google-Smtp-Source: AGHT+IGMr93AWTguT94j6RJ15glPG/ytwr9IWzEBwk0AAQGWW2Q09APJE6CTs2QyROOvqrZmqwVoZFMD8B8=
X-Received: from dlbvp8.prod.google.com ([2002:a05:7022:ff48:b0:119:49ca:6ba3])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ff42:b0:119:e56b:957b
 with SMTP id a92af1059eb24-11c9bc9ace2mr4504c88.0.1763660221559; Thu, 20 Nov
 2025 09:37:01 -0800 (PST)
Date: Thu, 20 Nov 2025 17:36:42 +0000
In-Reply-To: <20251120-phyb4-v6-0-b6694e1f0caf@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120-phyb4-v6-0-b6694e1f0caf@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763660216; l=11357;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=JthHQZ0hDV/qVs0AZiaQnkr3kwkZABgCK3oU2Afa/C0=; b=BQBY0GxRDVwsRKTpeDV6FW7nwmEWxlgskhL+5Bc8yzbCME0adfUKfG3AGFUyoZI1z1hm7pGbQ
 yadcVve2EHuC/MUGTXnXfra5bDBLgownCnhibkzPzownKiEHFBglEHH
X-Mailer: b4 0.14.2
Message-ID: <20251120-phyb4-v6-2-b6694e1f0caf@google.com>
Subject: [PATCH v6 2/2] phy: Add Google Tensor SoC USB PHY driver
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"

Support the USB PHY found on Google Tensor G5 (Laguna). This
particular USB PHY supports both high-speed and super-speed
operations, and is integrated with the SNPS DWC3 controller that's
also on the SoC. This initial patch specifically adds functionality
for high-speed.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/phy/Kconfig          |  13 ++
 drivers/phy/Makefile         |   1 +
 drivers/phy/phy-google-usb.c | 292 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 306 insertions(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 678dd0452f0aa0597773433f04d2a9ba77474d2a..af14ec74542a9879c856dee8236753990fdf3705 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
 	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
 	  Speed and High Speed.
 
+config PHY_GOOGLE_USB
+	tristate "Google Tensor SoC USB PHY driver"
+	depends on HAS_IOMEM
+	depends on OF
+	depends on TYPEC
+	select GENERIC_PHY
+	help
+	  Enable support for the USB PHY on Google Tensor SoCs, starting with
+	  the G5 generation. This driver provides the PHY interfaces to
+	  interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY, both
+	  of which are integrated with the DWC3 USB DRD controller.
+	  This driver currently supports USB high-speed.
+
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..aeaaaf988554a24bb572d8b34b54638a6a3aed73 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
+obj-$(CONFIG_PHY_GOOGLE_USB)		+= phy-google-usb.o
 obj-y					+= allwinner/	\
 					   amlogic/	\
 					   broadcom/	\
diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
new file mode 100644
index 0000000000000000000000000000000000000000..23b988cc5292111872c4acb32f7666e0ce9a39a3
--- /dev/null
+++ b/drivers/phy/phy-google-usb.c
@@ -0,0 +1,292 @@
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
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
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
+enum google_usb_phy_id {
+	GOOGLE_USB2_PHY,
+	GOOGLE_USB_PHY_NUM,
+};
+
+struct google_usb_phy_instance {
+	int index;
+	struct phy *phy;
+	int num_clks;
+	struct clk_bulk_data *clks;
+	int num_rsts;
+	struct reset_control_bulk_data *rsts;
+};
+
+struct google_usb_phy {
+	struct device *dev;
+	struct regmap *usb_cfg_regmap;
+	unsigned int usb2_cfg_offset;
+	void __iomem *usbdp_top_base;
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
+		reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+		reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
+		writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	} else {
+		reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+		reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
+		writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
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
+	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
+	reg &= ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
+	reg &= ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
+	reg |= FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
+	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
+
+	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG19_OFFSET, &reg);
+	reg &= ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
+	reg |= FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);
+	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG19_OFFSET, reg);
+
+	set_vbus_valid(gphy);
+
+	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
+	if (ret)
+		return ret;
+
+	ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
+	if (ret) {
+		clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+		return ret;
+	}
+
+	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
+	reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
+	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
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
+	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
+	reg &= ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
+	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
+
+	reset_control_bulk_assert(inst->num_rsts, inst->rsts);
+	clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
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
+	u32 args[1];
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
+	gphy->usb_cfg_regmap =
+		syscon_regmap_lookup_by_phandle_args(dev->of_node,
+						     "google,usb-cfg-csr",
+						     ARRAY_SIZE(args), args);
+	if (IS_ERR(gphy->usb_cfg_regmap)) {
+		return dev_err_probe(dev, PTR_ERR(gphy->usb_cfg_regmap),
+				     "invalid usb cfg csr\n");
+	}
+
+	gphy->usb2_cfg_offset = args[0];
+
+	gphy->usbdp_top_base = devm_platform_ioremap_resource_byname(pdev,
+								     "usbdp_top");
+	if (IS_ERR(gphy->usbdp_top_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->usbdp_top_base),
+				    "invalid usbdp top\n");
+
+	inst = &gphy->insts[GOOGLE_USB2_PHY];
+	inst->index = GOOGLE_USB2_PHY;
+	phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create usb2 phy instance\n");
+	inst->phy = phy;
+	phy_set_drvdata(phy, inst);
+
+	inst->num_clks = 2;
+	inst->clks = devm_kcalloc(dev, inst->num_clks, sizeof(*inst->clks), GFP_KERNEL);
+	if (!inst->clks)
+		return -ENOMEM;
+	inst->clks[0].id = "usb2";
+	inst->clks[1].id = "usb2_apb";
+	ret = devm_clk_bulk_get(dev, inst->num_clks, inst->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get u2 phy clks\n");
+
+	inst->num_rsts = 2;
+	inst->rsts = devm_kcalloc(dev, inst->num_rsts, sizeof(*inst->rsts), GFP_KERNEL);
+	if (!inst->rsts)
+		return -ENOMEM;
+	inst->rsts[0].id = "usb2";
+	inst->rsts[1].id = "usb2_apb";
+	ret = devm_reset_control_bulk_get_exclusive(dev, inst->num_rsts, inst->rsts);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get u2 phy resets\n");
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
+		.compatible = "google,lga-usb-phy",
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
2.52.0.rc1.455.g30608eb744-goog

