Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0FA335567
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2025 19:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766085865; cv=none; b=JSGOrzXFt7wJIyytMoNpgs8nP6Qa2LK7neGuwBfwlIhrZ6EFMLWn4/nQ+MIoY8+QTymmB5MbooHKP7m93bFpJIiVDS1iVF2pGKUTa/dAX2/u782NJeC6n6z3DXnsSEr6hDINF3Kc+2xAu+qf1P0EfuHjv73kuRhHshB7QZbZyb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766085865; c=relaxed/simple;
	bh=2iDlSpr/82zRsCopcO1q5ZWRx5grxoe/pxjYEpg40eo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BT9UpbQsghVsSXhtEp1ipkP/Sj2hj2C+Wq8/UsQaO0AN7Qog4F8CPwLIdCvyY2Ju1rGEsNHql+BBiIvIknRCk2H+Vg0qaEHQUdC5qCU/ngqn+JJlCyQDLVRXWnnMBlCZ/igjG+M4JrtVAyOkfmTiXR/vcdsKAHT2AN6MaQxzIZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oeh1GzVH; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oeh1GzVH"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34abec8855aso1926063a91.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2025 11:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766085861; x=1766690661; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jgImndQVG3EsY25ZM9AgurNxaelyodY8xLcGYuSwjkk=;
        b=oeh1GzVHJXZ52NwQc+KHmodkKejYHS4F4qtlHmfI3hXPc51ybbvVo8g9MiDRhL4zFb
         w5DFrqnJXlM7xysx82RlgNsiAzkSPQbK5Fzm8Li19kMNm7N4R2IFnoxhms+9rCvTEPLp
         yIWlx8n0kX/CC1ddVVueX1Kz5ixN1sc+LF9BUWFTYyiVFnq/76rPf4ZdeaGsdB2qEv+B
         xwG/fffWVLgp+3kcInIFpZMjntsx7NhkyjRcnFNwL4C55eZuC1KJZOFcLRqmTxm4OSzL
         O5dPd1VvOM44znMeT0qrEk+dLZ0Uf5URkgMQC5MvxMbXgfPRys8O3CNhT+Pos9yP7C9c
         GsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766085861; x=1766690661;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jgImndQVG3EsY25ZM9AgurNxaelyodY8xLcGYuSwjkk=;
        b=PrTpWv5ALkJ5yo90LgN0rRadOWA0r2+YnInfBAnH8GBM5U2KwXzo+9Lmw9rRevAxkv
         77R78a+DUD7+tvSJYREk6lmxLDw5CtXkuqXyjeyVntS34XmMAVqFrvS02WfkFi527Z1S
         V6prUoIBEZdGGnt4t2GnFvoxx5MYGLxNtM9AGavr7YmplZnZ/860v4BBSZuY8SpZ0hXT
         w24fKSop+C9fBw230Gz6eUbJccSipXhg+kOF2tuB89Fey/gOkMqno9HgZEszpu/lCZAD
         7TyZlKcanVXVGAwIxs1uKJOhvbewQ332c1RrH9Ihni4/qO8PyZVzMQ7GaRhCzF9KV8iB
         8dbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrFUVJMEUERVqxlLSVCC36p3g6tb9ZEKw/WVBDA5PNgJcUo04z3ahpel9BrqP8vEkeJL4X60q1t0QEzFHn/9vsYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YztT4y9tZwOXdjjDn5j8pN9k63SPDxYQls1/APgMBDll1cF5EsY
	IGyj7EAknG7zIAelD0i87HgpkjtXAWD4RYwsERqgOhxViVPzdlvw5PopZj6gRWIbsRZM5zbJcBH
	u6/716g==
X-Google-Smtp-Source: AGHT+IGadG7mucqWE7l8oVYUgerPdp1yRlrpFu1i8kQTNVojkmVll153ftz6TRZZLl5SVXkbZvsw49eo4RI=
X-Received: from dlboy6.prod.google.com ([2002:a05:7022:1286:b0:120:5ef6:bc94])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a8a:b0:11b:9386:a3be
 with SMTP id a92af1059eb24-121722e9eb4mr375537c88.41.1766085861529; Thu, 18
 Dec 2025 11:24:21 -0800 (PST)
Date: Thu, 18 Dec 2025 19:23:11 +0000
In-Reply-To: <20251218-controller-v10-0-4047c9077274@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251218-controller-v10-0-4047c9077274@google.com>
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766085855; l=22281;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=2iDlSpr/82zRsCopcO1q5ZWRx5grxoe/pxjYEpg40eo=; b=hAXJ/9L2VNZ8Ze7DS1EPaoEbOmNo0rjkncxA5gseb6NXUhoAvj7eaal4xX1TBvRpqc3oI41XM
 Az+SH7J5ReUAj4Q/eYlp+3nRDxvLoAtnZs3svMOUjsIac1aIjfRsA2x
X-Mailer: b4 0.14.2
Message-ID: <20251218-controller-v10-2-4047c9077274@google.com>
Subject: [PATCH v10 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
From: Roy Luo <royluo@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"

Add support for the DWC3 USB controller found on Google Tensor G5
(codename: laguna). The controller features dual-role functionality
and hibernation.

The primary focus is implementing hibernation support in host mode,
enabling the controller to enter a low-power state (D3). This is
particularly relevant during system power state transition and
runtime power management for power efficiency.
Highlights:
- Align suspend callback with dwc3_suspend_common() for deciding
  between a full teardown and hibernation in host mode.
- Integration with `psw` (power switchable) and `top` power domains,
  managing their states and device links to support hibernation.
- A notifier callback dwc3_google_usb_psw_pd_notifier() for
  `psw` power domain events to manage controller state
  transitions to/from D3.
- Coordination of the `non_sticky` reset during power state
  transitions, asserting it on D3 entry and deasserting on D0 entry
  in hibernation scenario.
- Handling of high-speed and super-speed PME interrupts
  that are generated by remote wakeup during hibernation.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Roy Luo <royluo@google.com>
---
 MAINTAINERS                    |   1 +
 drivers/usb/dwc3/Kconfig       |  11 +
 drivers/usb/dwc3/Makefile      |   1 +
 drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 641 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c8fbbb63c610d4d01ed4d78b1632774603eeaa4..96041a00e71d1b58a0c62161c268507f63d140a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10727,6 +10727,7 @@ F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
+F:	drivers/usb/dwc3/dwc3-google.c
 F:	include/dt-bindings/clock/google,gs101*
 K:	[gG]oogle.?[tT]ensor
 
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index bf3e04635131005096c6bc1802b251490ad2f483..240b15bc52cbd5d5c9d08d9fddd8c63202de1a3c 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -211,4 +211,15 @@ config USB_DWC3_APPLE
 	  mode on these machines.
 	  Say 'Y' or 'M' if you have such device.
 
+config USB_DWC3_GOOGLE
+	tristate "Google Platform"
+	help
+	  Support the DesignWare Core USB3 IP found on Google Tensor SoCs,
+	  starting with the G5 generation (Laguna). This driver includes
+	  support for hibernation in host mode.
+	  Say 'Y' or 'M' if you have one such device.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called dwc3-google.ko.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 89d46ab5006856c51b5007ecdd8fbdf431ecba40..073bef5309b5b5d381c8c4690221091b4df7904a 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -59,3 +59,4 @@ obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
 obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)	+= dwc3-generic-plat.o
+obj-$(CONFIG_USB_DWC3_GOOGLE)		+= dwc3-google.o
diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
new file mode 100644
index 0000000000000000000000000000000000000000..a19857bd6b131d841d165717b70f2959b4bac806
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-google.c
@@ -0,0 +1,628 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dwc3-google.c - Google DWC3 Specific Glue Layer
+ *
+ * Copyright (c) 2025, Google LLC
+ * Author: Roy Luo <royluo@google.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include "core.h"
+#include "glue.h"
+
+/* HOST CFG registers */
+#define HC_STATUS_OFFSET 0x0
+#define HC_STATUS_CURRENT_POWER_STATE_U2PMU GENMASK(1, 0)
+#define HC_STATUS_CURRENT_POWER_STATE_U3PMU GENMASK(4, 3)
+
+#define HOST_CFG1_OFFSET 0x4
+#define HOST_CFG1_PME_EN BIT(3)
+#define HOST_CFG1_PM_POWER_STATE_REQUEST GENMASK(5, 4)
+#define HOST_CFG1_PM_POWER_STATE_D0 0x0
+#define HOST_CFG1_PM_POWER_STATE_D3 0x3
+
+/* USBINT registers */
+#define USBINT_CFG1_OFFSET 0x0
+#define USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK BIT(2)
+#define USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK BIT(3)
+#define USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN BIT(8)
+#define USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN BIT(9)
+#define USBINT_CFG1_USBDRD_PME_GEN_U2_INTR_CLR BIT(14)
+#define USBINT_CFG1_USBDRD_PME_GEN_U3_INTR_CLR BIT(15)
+
+#define USBINT_STATUS_OFFSET 0x4
+#define USBINT_STATUS_USBDRD_PME_GEN_U2P_INTR_STS_RAW BIT(2)
+#define USBINT_STATUS_USBDRD_PME_GEN_U3P_INTR_STS_RAW BIT(3)
+
+#define USBCS_TOP_CTRL_CFG1_OFFSET 0xc
+#define USBCS_TOP_CTRL_CFG1_USB2ONLY_MODE BIT(5)
+
+#define DWC3_GOOGLE_MAX_RESETS	4
+
+struct dwc3_google {
+	struct device		*dev;
+	struct dwc3		dwc;
+	struct clk_bulk_data	*clks;
+	int			num_clks;
+	struct reset_control_bulk_data rsts[DWC3_GOOGLE_MAX_RESETS];
+	int			num_rsts;
+	struct reset_control	*non_sticky_rst;
+	struct device		*usb_psw_pd;
+	struct device_link	*usb_psw_pd_dl;
+	struct notifier_block	usb_psw_pd_nb;
+	struct device		*usb_top_pd;
+	struct device_link	*usb_top_pd_dl;
+	struct regmap		*usb_cfg_regmap;
+	unsigned int		host_cfg_offset;
+	unsigned int		usbint_cfg_offset;
+	int			hs_pme_irq;
+	int			ss_pme_irq;
+	bool			is_usb2only;
+	bool			is_hibernation;
+};
+
+#define to_dwc3_google(d) container_of_const((d), struct dwc3_google, dwc)
+
+static int dwc3_google_rst_init(struct dwc3_google *google)
+{
+	int ret;
+
+	google->num_rsts = 4;
+	google->rsts[0].id = "non_sticky";
+	google->rsts[1].id = "sticky";
+	google->rsts[2].id = "drd_bus";
+	google->rsts[3].id = "top";
+
+	ret = devm_reset_control_bulk_get_exclusive(google->dev,
+						    google->num_rsts,
+						    google->rsts);
+
+	if (ret < 0)
+		return ret;
+
+	google->non_sticky_rst = google->rsts[0].rstc;
+
+	return 0;
+}
+
+static int dwc3_google_set_pmu_state(struct dwc3_google *google, int state)
+{
+	u32 reg;
+	int ret;
+
+	regmap_read(google->usb_cfg_regmap,
+		    google->host_cfg_offset + HOST_CFG1_OFFSET, &reg);
+
+	reg &= ~HOST_CFG1_PM_POWER_STATE_REQUEST;
+	reg |= (FIELD_PREP(HOST_CFG1_PM_POWER_STATE_REQUEST, state) |
+		HOST_CFG1_PME_EN);
+	regmap_write(google->usb_cfg_regmap,
+		     google->host_cfg_offset + HOST_CFG1_OFFSET, reg);
+
+	ret = regmap_read_poll_timeout(google->usb_cfg_regmap,
+				       google->host_cfg_offset + HC_STATUS_OFFSET, reg,
+				       (FIELD_GET(HC_STATUS_CURRENT_POWER_STATE_U2PMU,
+						  reg) == state &&
+					FIELD_GET(HC_STATUS_CURRENT_POWER_STATE_U3PMU,
+						  reg) == state),
+				       10, 10000);
+
+	if (ret)
+		dev_err(google->dev, "failed to set PMU state %d\n", state);
+
+	return ret;
+}
+
+/*
+ * Clear pme interrupts and report their status.
+ * The hardware requires write-1 then write-0 sequence to clear the interrupt bits.
+ */
+static u32 dwc3_google_clear_pme_irqs(struct dwc3_google *google)
+{
+	u32 irq_status, reg_set, reg_clear;
+
+	regmap_read(google->usb_cfg_regmap,
+		    google->usbint_cfg_offset + USBINT_STATUS_OFFSET, &irq_status);
+
+	irq_status &= (USBINT_STATUS_USBDRD_PME_GEN_U2P_INTR_STS_RAW |
+		       USBINT_STATUS_USBDRD_PME_GEN_U3P_INTR_STS_RAW);
+	if (!irq_status)
+		return irq_status;
+
+	regmap_read(google->usb_cfg_regmap,
+		    google->usbint_cfg_offset + USBINT_CFG1_OFFSET, &reg_set);
+
+	reg_clear = reg_set;
+	if (irq_status & USBINT_STATUS_USBDRD_PME_GEN_U2P_INTR_STS_RAW) {
+		reg_set |= USBINT_CFG1_USBDRD_PME_GEN_U2_INTR_CLR;
+		reg_clear &= ~USBINT_CFG1_USBDRD_PME_GEN_U2_INTR_CLR;
+	}
+	if (irq_status & USBINT_STATUS_USBDRD_PME_GEN_U3P_INTR_STS_RAW) {
+		reg_set |= USBINT_CFG1_USBDRD_PME_GEN_U3_INTR_CLR;
+		reg_clear &= ~USBINT_CFG1_USBDRD_PME_GEN_U3_INTR_CLR;
+	}
+
+	regmap_write(google->usb_cfg_regmap,
+		     google->usbint_cfg_offset + USBINT_CFG1_OFFSET, reg_set);
+	regmap_write(google->usb_cfg_regmap,
+		     google->usbint_cfg_offset + USBINT_CFG1_OFFSET, reg_clear);
+
+	return irq_status;
+}
+
+static void dwc3_google_enable_pme_irq(struct dwc3_google *google)
+{
+	u32 reg;
+
+	regmap_read(google->usb_cfg_regmap,
+		    google->usbint_cfg_offset + USBINT_CFG1_OFFSET, &reg);
+	reg &= ~(USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK |
+		 USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK);
+	reg |= (USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN |
+		USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN);
+	regmap_write(google->usb_cfg_regmap,
+		     google->usbint_cfg_offset + USBINT_CFG1_OFFSET, reg);
+
+	enable_irq(google->hs_pme_irq);
+	enable_irq(google->ss_pme_irq);
+	enable_irq_wake(google->hs_pme_irq);
+	enable_irq_wake(google->ss_pme_irq);
+}
+
+static void dwc3_google_disable_pme_irq(struct dwc3_google *google)
+{
+	u32 reg;
+
+	regmap_read(google->usb_cfg_regmap,
+		    google->usbint_cfg_offset + USBINT_CFG1_OFFSET, &reg);
+	reg &= ~(USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN |
+		 USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN);
+	reg |= (USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK |
+		USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK);
+	regmap_write(google->usb_cfg_regmap,
+		     google->usbint_cfg_offset + USBINT_CFG1_OFFSET, reg);
+
+	disable_irq_wake(google->hs_pme_irq);
+	disable_irq_wake(google->ss_pme_irq);
+	disable_irq_nosync(google->hs_pme_irq);
+	disable_irq_nosync(google->ss_pme_irq);
+}
+
+static irqreturn_t dwc3_google_resume_irq(int irq, void *data)
+{
+	struct dwc3_google      *google = data;
+	struct dwc3             *dwc = &google->dwc;
+	u32 irq_status, dr_role;
+
+	irq_status = dwc3_google_clear_pme_irqs(google);
+	dr_role = dwc->current_dr_role;
+
+	if (!irq_status || !google->is_hibernation ||
+	    dr_role != DWC3_GCTL_PRTCAP_HOST) {
+		dev_dbg(google->dev, "spurious pme irq %d, hibernation %d, dr_role %u\n",
+			irq, google->is_hibernation, dr_role);
+		return IRQ_HANDLED;
+	}
+
+	if (dwc->xhci)
+		pm_runtime_resume(&dwc->xhci->dev);
+
+	return IRQ_HANDLED;
+}
+
+static int dwc3_google_request_irq(struct dwc3_google *google, struct platform_device *pdev,
+				   const char *irq_name, const char *req_name)
+{
+	int ret;
+	int irq;
+
+	irq = platform_get_irq_byname(pdev, irq_name);
+	if (irq < 0) {
+		dev_err(google->dev, "invalid irq name %s\n", irq_name);
+		return irq;
+	}
+
+	irq_set_status_flags(irq, IRQ_NOAUTOEN);
+	ret = devm_request_threaded_irq(google->dev, irq, NULL,
+					dwc3_google_resume_irq,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					req_name, google);
+	if (ret < 0) {
+		dev_err(google->dev, "failed to request irq %s\n", req_name);
+		return ret;
+	}
+
+	return irq;
+}
+
+static int dwc3_google_usb_psw_pd_notifier(struct notifier_block *nb, unsigned long action, void *d)
+{
+	struct dwc3_google *google = container_of(nb, struct dwc3_google, usb_psw_pd_nb);
+	int ret;
+
+	if (!google->is_hibernation)
+		return NOTIFY_OK;
+
+	if (action == GENPD_NOTIFY_OFF) {
+		dev_dbg(google->dev, "enter D3 power state\n");
+		dwc3_google_set_pmu_state(google, HOST_CFG1_PM_POWER_STATE_D3);
+		ret = reset_control_assert(google->non_sticky_rst);
+		if (ret)
+			dev_err(google->dev, "non sticky reset assert failed: %d\n", ret);
+	} else if (action == GENPD_NOTIFY_ON) {
+		dev_dbg(google->dev, "enter D0 power state\n");
+		dwc3_google_clear_pme_irqs(google);
+		ret = reset_control_deassert(google->non_sticky_rst);
+		if (ret)
+			dev_err(google->dev, "non sticky reset deassert failed: %d\n", ret);
+		dwc3_google_set_pmu_state(google, HOST_CFG1_PM_POWER_STATE_D0);
+	}
+
+	return NOTIFY_OK;
+}
+
+static void dwc3_google_pm_domain_deinit(struct dwc3_google *google)
+{
+	if (google->usb_top_pd_dl)
+		device_link_del(google->usb_top_pd_dl);
+
+	if (!IS_ERR_OR_NULL(google->usb_top_pd)) {
+		device_set_wakeup_capable(google->usb_top_pd, false);
+		dev_pm_domain_detach(google->usb_top_pd, true);
+	}
+
+	if (google->usb_psw_pd_dl)
+		device_link_del(google->usb_psw_pd_dl);
+
+	if (!IS_ERR_OR_NULL(google->usb_psw_pd)) {
+		dev_pm_genpd_remove_notifier(google->usb_psw_pd);
+		dev_pm_domain_detach(google->usb_psw_pd, true);
+	}
+}
+
+static int dwc3_google_pm_domain_init(struct dwc3_google *google)
+{
+	int ret;
+
+	/*
+	 * Establish PM RUNTIME link between dwc dev and its power domain usb_psw_pd,
+	 * register notifier block to handle hibernation.
+	 */
+	google->usb_psw_pd = dev_pm_domain_attach_by_name(google->dev, "psw");
+	if (IS_ERR_OR_NULL(google->usb_psw_pd)) {
+		dev_err(google->dev, "failed to get psw pd");
+		ret = google->usb_psw_pd ? PTR_ERR(google->usb_psw_pd) : -ENODATA;
+		return ret;
+	}
+
+	google->usb_psw_pd_nb.notifier_call = dwc3_google_usb_psw_pd_notifier;
+	ret = dev_pm_genpd_add_notifier(google->usb_psw_pd, &google->usb_psw_pd_nb);
+	if (ret) {
+		dev_err(google->dev, "failed to add psw pd notifier");
+		goto err;
+	}
+
+	google->usb_psw_pd_dl = device_link_add(google->dev, google->usb_psw_pd,
+						DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
+						DL_FLAG_RPM_ACTIVE);
+	if (!google->usb_psw_pd_dl) {
+		dev_err(google->usb_psw_pd, "failed to add device link");
+		ret = -ENODEV;
+		goto err;
+	}
+
+	/*
+	 * usb_top_pd is the parent power domain of usb_psw_pd. Keeping usb_top_pd on
+	 * while usb_psw_pd is off places the controller in a power-gated state,
+	 * essential for hibernation. Acquire a handle to usb_top_pd and sets it as
+	 * wakeup-capable to allow the domain to be left on during system suspend.
+	 */
+	google->usb_top_pd = dev_pm_domain_attach_by_name(google->dev, "top");
+	if (IS_ERR_OR_NULL(google->usb_top_pd)) {
+		dev_err(google->dev, "failed to get top pd");
+		ret = google->usb_top_pd ? PTR_ERR(google->usb_top_pd) : -ENODATA;
+		goto err;
+	}
+	device_set_wakeup_capable(google->usb_top_pd, true);
+
+	google->usb_top_pd_dl = device_link_add(google->dev, google->usb_top_pd,
+						DL_FLAG_STATELESS);
+	if (!google->usb_top_pd_dl) {
+		dev_err(google->usb_top_pd, "failed to add device link");
+		ret = -ENODEV;
+		goto err;
+	}
+
+	return 0;
+
+err:
+	dwc3_google_pm_domain_deinit(google);
+
+	return ret;
+}
+
+static void dwc3_google_program_usb2only(struct dwc3_google *google)
+{
+	u32 reg;
+
+	regmap_read(google->usb_cfg_regmap,
+		    google->usbint_cfg_offset + USBCS_TOP_CTRL_CFG1_OFFSET, &reg);
+	reg |= USBCS_TOP_CTRL_CFG1_USB2ONLY_MODE;
+	regmap_write(google->usb_cfg_regmap,
+		     google->usbint_cfg_offset + USBCS_TOP_CTRL_CFG1_OFFSET, reg);
+}
+
+static int dwc3_google_probe(struct platform_device *pdev)
+{
+	struct dwc3_probe_data	probe_data = {};
+	struct device		*dev = &pdev->dev;
+	struct dwc3_google	*google;
+	struct resource		*res;
+	int			ret;
+	u32			args[2];
+
+	google = devm_kzalloc(&pdev->dev, sizeof(*google), GFP_KERNEL);
+	if (!google)
+		return -ENOMEM;
+
+	google->dev = &pdev->dev;
+
+	ret = dwc3_google_pm_domain_init(google);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to init pdom\n");
+
+	google->usb_cfg_regmap =
+		syscon_regmap_lookup_by_phandle_args(dev->of_node,
+						     "google,usb-cfg-csr",
+						     ARRAY_SIZE(args), args);
+	if (IS_ERR(google->usb_cfg_regmap)) {
+		return dev_err_probe(dev, PTR_ERR(google->usb_cfg_regmap),
+				     "invalid usb cfg csr\n");
+	}
+
+	google->host_cfg_offset = args[0];
+	google->usbint_cfg_offset = args[1];
+
+	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0) {
+		google->is_usb2only = true;
+		dwc3_google_program_usb2only(google);
+	}
+
+	ret = devm_clk_bulk_get_all_enabled(dev, &google->clks);
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret, "failed to get and enable clks\n");
+		goto err_deinit_pdom;
+	}
+	google->num_clks = ret;
+
+	ret = dwc3_google_rst_init(google);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "failed to get resets\n");
+		goto err_deinit_pdom;
+	}
+
+	ret = reset_control_bulk_deassert(google->num_rsts, google->rsts);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "failed to deassert rsts\n");
+		goto err_deinit_pdom;
+	}
+
+	ret = dwc3_google_request_irq(google, pdev, "hs_pme", "USB HS wakeup");
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret, "failed to request hs pme irq");
+		goto err_reset_assert;
+	}
+	google->hs_pme_irq = ret;
+
+	ret = dwc3_google_request_irq(google, pdev, "ss_pme", "USB SS wakeup");
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret, "failed to request ss pme irq");
+		goto err_reset_assert;
+	}
+	google->ss_pme_irq = ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		ret = dev_err_probe(dev, -ENODEV, "invalid memory\n");
+		goto err_reset_assert;
+	}
+
+	device_init_wakeup(dev, true);
+
+	google->dwc.dev = dev;
+	probe_data.dwc = &google->dwc;
+	probe_data.res = res;
+	probe_data.ignore_clocks_and_resets = true;
+	ret = dwc3_core_probe(&probe_data);
+	if (ret)  {
+		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
+		goto err_reset_assert;
+	}
+
+	return 0;
+
+err_reset_assert:
+	reset_control_bulk_assert(google->num_rsts, google->rsts);
+
+err_deinit_pdom:
+	dwc3_google_pm_domain_deinit(google);
+
+	return ret;
+}
+
+static void dwc3_google_remove(struct platform_device *pdev)
+{
+	struct dwc3 *dwc = platform_get_drvdata(pdev);
+	struct dwc3_google *google = to_dwc3_google(dwc);
+
+	dwc3_core_remove(&google->dwc);
+
+	reset_control_bulk_assert(google->num_rsts, google->rsts);
+
+	dwc3_google_pm_domain_deinit(google);
+}
+
+static int dwc3_google_suspend(struct dwc3_google *google, pm_message_t msg)
+{
+	if (pm_runtime_suspended(google->dev))
+		return 0;
+
+	if (google->dwc.current_dr_role == DWC3_GCTL_PRTCAP_HOST) {
+		/*
+		 * Follow dwc3_suspend_common() guidelines for deciding between
+		 * a full teardown and hibernation.
+		 */
+		if (PMSG_IS_AUTO(msg) || device_may_wakeup(google->dev)) {
+			dev_dbg(google->dev, "enter hibernation");
+			pm_runtime_get_sync(google->usb_top_pd);
+			device_wakeup_enable(google->usb_top_pd);
+			dwc3_google_enable_pme_irq(google);
+			google->is_hibernation = true;
+			return 0;
+		}
+	}
+
+	reset_control_bulk_assert(google->num_rsts, google->rsts);
+	clk_bulk_disable_unprepare(google->num_clks, google->clks);
+
+	return 0;
+}
+
+static int dwc3_google_resume(struct dwc3_google *google, pm_message_t msg)
+{
+	int ret;
+
+	if (google->is_hibernation) {
+		dev_dbg(google->dev, "exit hibernation");
+		dwc3_google_disable_pme_irq(google);
+		device_wakeup_disable(google->usb_top_pd);
+		pm_runtime_put_sync(google->usb_top_pd);
+		google->is_hibernation = false;
+		return 0;
+	}
+
+	if (google->is_usb2only)
+		dwc3_google_program_usb2only(google);
+
+	ret = clk_bulk_prepare_enable(google->num_clks, google->clks);
+	if (ret)
+		return ret;
+
+	ret = reset_control_bulk_deassert(google->num_rsts, google->rsts);
+	if (ret) {
+		clk_bulk_disable_unprepare(google->num_clks, google->clks);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dwc3_google_pm_suspend(struct device *dev)
+{
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_google *google = to_dwc3_google(dwc);
+	int ret;
+
+	ret = dwc3_pm_suspend(&google->dwc);
+	if (ret)
+		return ret;
+
+	return dwc3_google_suspend(google, PMSG_SUSPEND);
+}
+
+static int dwc3_google_pm_resume(struct device *dev)
+{
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_google *google = to_dwc3_google(dwc);
+	int ret;
+
+	ret = dwc3_google_resume(google, PMSG_RESUME);
+	if (ret)
+		return ret;
+
+	return dwc3_pm_resume(&google->dwc);
+}
+
+static void dwc3_google_complete(struct device *dev)
+{
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+
+	dwc3_pm_complete(dwc);
+}
+
+static int dwc3_google_prepare(struct device *dev)
+{
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+
+	return dwc3_pm_prepare(dwc);
+}
+
+static int dwc3_google_runtime_suspend(struct device *dev)
+{
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_google *google = to_dwc3_google(dwc);
+	int ret;
+
+	ret = dwc3_runtime_suspend(&google->dwc);
+	if (ret)
+		return ret;
+
+	return dwc3_google_suspend(google, PMSG_AUTO_SUSPEND);
+}
+
+static int dwc3_google_runtime_resume(struct device *dev)
+{
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_google *google = to_dwc3_google(dwc);
+	int ret;
+
+	ret = dwc3_google_resume(google, PMSG_AUTO_RESUME);
+	if (ret)
+		return ret;
+
+	return dwc3_runtime_resume(&google->dwc);
+}
+
+static int dwc3_google_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
+}
+
+static const struct dev_pm_ops dwc3_google_dev_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(dwc3_google_pm_suspend, dwc3_google_pm_resume)
+	RUNTIME_PM_OPS(dwc3_google_runtime_suspend, dwc3_google_runtime_resume,
+		       dwc3_google_runtime_idle)
+	.complete = pm_sleep_ptr(dwc3_google_complete),
+	.prepare = pm_sleep_ptr(dwc3_google_prepare),
+};
+
+static const struct of_device_id dwc3_google_of_match[] = {
+	{ .compatible = "google,lga-dwc3" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dwc3_google_of_match);
+
+static struct platform_driver dwc3_google_driver = {
+	.probe		= dwc3_google_probe,
+	.remove		= dwc3_google_remove,
+	.driver		= {
+		.name	= "dwc3-google",
+		.pm	= pm_ptr(&dwc3_google_dev_pm_ops),
+		.of_match_table	= dwc3_google_of_match,
+	},
+};
+
+module_platform_driver(dwc3_google_driver);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare DWC3 Google Glue Driver");

-- 
2.52.0.322.g1dd061c0dc-goog

