Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26452218EA8
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 23:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759792915; cv=none; b=AdpfqScsqfIO1p3aRSI/KxRhKlNKSXThAGLz8dN7RzjcWYCpe1Ejz/Vq4I5ihMnZVvWy+lGQDsgVsFyK6ipf0HChtjSxfmcAfdheosBqu2HN3ir22KVQ+yUXjWTPUf1R+Lxen7P3J04k9HW6qRvGl0CT74NdozPM2bUe0OCJKao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759792915; c=relaxed/simple;
	bh=D0B/3CMcDU9a2Vd2mxDjaxI/NV+yVz5OCUlM/Qg5GDg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BSpA8VMVnOXQCUpMVYnWakr43BfHAHlGxOd6GCRQC4ki6NBWkJQ3+uq8JROSiyHGg0H/9ON13FdjJjAcuKurrjjLnr8YSegwrUg9ZN0Pp2RMvVd2ylUdBo2QxOSQTEAK3LYL7R4tW3g3/6Eb/ILfBP6EWZYu3QMH/4hlUJYeEL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZsXrpdUg; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZsXrpdUg"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-267fa90a2fbso70546955ad.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 16:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759792912; x=1760397712; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w967xfPWK/pzLBoL3jCuMC/cxufe5CBtxtvzybdMgXo=;
        b=ZsXrpdUgAvhBlq5KyDZNSfTxlWhGx3/t1Z5gLg7EQA/J2BLYUqNAlsHjpE1CEger5n
         3aH+Hp0naZFUmuZrafs80wp6VboeIdjtA0y5iHtdLEdwlk/PdnbGfp7/DtaTFVRS85+b
         6DHnKsCcsAi5o1Len8tC8P7cbasC0hOZm02dATBu2NGWukXfWVAX66vOfoWRxBEtRg8N
         u4o/WPoCD2MmayEcca260w27TUIEQOWHsgqBbGbJ5JxlAMU0m8QTW6lT1MBKnICUek1G
         9rPb5hO0JOlfIb+hR9gqjub3xa4v942htzT0wui5ziXbgzHngzwJVuS2HAs8Tn+MeVpV
         LVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759792912; x=1760397712;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w967xfPWK/pzLBoL3jCuMC/cxufe5CBtxtvzybdMgXo=;
        b=rlEpczTMRINrp9ujh+oVWY7Q51SX4ioI4ZnMebvG3hAxMefYL+DAACKsRQK7e/AJap
         mG6T6izdYznaoKgHAawbsz8asSdVHMr6BGZSTuHxRRt9P1tmHvMQq7cNBu971NNrGptR
         zpKBYeESE/Ao3VgBFMPUw2tSqpl3fN+6CinaeHPM6r/piCCfmTD6vHyt6DigTQ2FgcY6
         G/RIOZYFA8t7zG1MXEuFqt+ZZKRLHIHxGBD3ALkul8CLwvBtW4Ve639pwa+/5GbxDuFd
         kuMlxGLbUjh4ILiF46HSAq09LpzS4bJWXAqzJDVQZB7g+0csHAVo/XYt16KJGXtkXAC6
         R+8g==
X-Forwarded-Encrypted: i=1; AJvYcCUlaja0dZCRY83dXw/tyVAPfNOhnuDilV5mT3mWSLuU4Z7y3+klPIsv0yHGQ343Mq27E2kRqz2+jU1gGwlUvpiBug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze9AdJbTlV91x65yo4PwqkM3MI0aWH4iM52r26IAKO8WFh7vQr
	mHBYlNXTg1Llo3FY45Mtt11dIue6PJ8w8AxJlNV6saRqiCeSxgDnyXJUGQUNcQ1Gj0QhArmd4E6
	YWIS9iA==
X-Google-Smtp-Source: AGHT+IGvhZqVEc02AsJccZ+iHZWg9bEyrWDQDXpBN8Z99t8bmtGsNvli1DohWrj10+/6dRyzYRLa4P/feg8=
X-Received: from plbbg10.prod.google.com ([2002:a17:902:8e8a:b0:267:dbc3:f98d])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2c0f:b0:28e:873d:8a
 with SMTP id d9443c01a7336-28ec9c5093dmr14795115ad.15.1759792912366; Mon, 06
 Oct 2025 16:21:52 -0700 (PDT)
Date: Mon,  6 Oct 2025 23:21:22 +0000
In-Reply-To: <20251006232125.1833979-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251006232125.1833979-2-royluo@google.com>
Subject: [PATCH v1 1/4] usb: dwc3: Add Google SoC DWC3 glue driver
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

This patch adds support for the DWC3 USB controller found on Google
Tensor SoCs. The controller features dual-role functionality and
hibernation.

The primary focus is implementing hibernation support in host mode,
enabling the controller to enter a low-power state (D3). This is
particularly relevant during system power state transition and
runtime power management for power efficiency.
Highlights:
- Align suspend callback with dwc3_suspend_common() for deciding
  between a full teardown and hibernation in host mode.
- Integration with `usb_psw_pd` and `usb_top_pd` power domains,
  managing their states and device links to support hibernation.
- A notifier callback dwc3_google_usb_psw_pd_notifier() for
  `usb_psw_pd` power domain events to manage controller state
  transitions to/from D3.
- Coordination of the `usbc_non_sticky` reset during power
  state transitions, asserting it on D3 entry and deasserting
  on D0 entry in hibernation scenario.
- Handling of U2 (high-speed) and U3 (super-speed) PME interrupts
  that are generated by remote wakeup during hibernation.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/dwc3/Kconfig       |   8 +
 drivers/usb/dwc3/Makefile      |   1 +
 drivers/usb/dwc3/dwc3-google.c | 597 +++++++++++++++++++++++++++++++++
 3 files changed, 606 insertions(+)
 create mode 100644 drivers/usb/dwc3/dwc3-google.c

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 310d182e10b5..685405464339 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -189,4 +189,12 @@ config USB_DWC3_RTK
 	  or dual-role mode.
 	  Say 'Y' or 'M' if you have such device.
 
+config USB_DWC3_GOOGLE
+	tristate "Google Platform"
+	depends on OF && COMMON_CLK && RESET_CONTROLLER
+	default USB_DWC3
+	help
+	  Support Google Tensor SoCs with DesignWare core USB3 IP.
+	  Say 'Y' or 'M' if you have one such device.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 830e6c9e5fe0..a94982630657 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -57,3 +57,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
+obj-$(CONFIG_USB_DWC3_GOOGLE)		+= dwc3-google.o
diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
new file mode 100644
index 000000000000..c9737da3ff3b
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-google.c
@@ -0,0 +1,597 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dwc3-google.c - Google DWC3 Specific Glue Layer
+ *
+ * Copyright (c) 2025, Google LLC
+ * Author: Roy Luo <royluo@google.com>
+ */
+
+#include <linux/of.h>
+#include <linux/bitfield.h>
+#include <linux/irq.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/pm_domain.h>
+#include <linux/iopoll.h>
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
+#define DWC3_GOOGLE_MAX_RESETS	5
+
+struct dwc3_google {
+	struct device		*dev;
+	struct dwc3		dwc;
+	struct clk_bulk_data	*clks;
+	int			num_clks;
+	struct reset_control_bulk_data rsts[DWC3_GOOGLE_MAX_RESETS];
+	int			num_rsts;
+	struct reset_control	*usbc_non_sticky_rst;
+	struct device		*usb_psw_pd;
+	struct device_link	*usb_psw_pd_dl;
+	struct notifier_block	usb_psw_pd_nb;
+	struct device		*usb_top_pd;
+	struct device_link	*usb_top_pd_dl;
+	void __iomem		*host_cfg_base;
+	void __iomem		*usbint_base;
+	int			hs_pme_irq;
+	int			ss_pme_irq;
+	bool			is_hibernation;
+};
+
+#define to_dwc3_google(d) container_of((d), struct dwc3_google, dwc)
+
+static int dwc3_google_rst_init(struct dwc3_google *google)
+{
+	int ret;
+
+	google->num_rsts = 5;
+	google->rsts[0].id = "usbc_non_sticky";
+	google->rsts[1].id = "usbc_sticky";
+	google->rsts[2].id = "usb_drd_bus";
+	google->rsts[3].id = "u2phy_apb";
+	google->rsts[4].id = "usb_top_csr";
+
+	ret = devm_reset_control_bulk_get_exclusive(google->dev,
+						    google->num_rsts,
+						    google->rsts);
+
+	if (ret < 0)
+		return ret;
+
+	google->usbc_non_sticky_rst = google->rsts[0].rstc;
+
+	return 0;
+}
+
+static int dwc3_google_set_pmu_state(struct dwc3_google *google, int state)
+{
+	u32 reg;
+	int ret;
+
+	reg = readl(google->host_cfg_base + HOST_CFG1_OFFSET);
+	reg &= ~HOST_CFG1_PM_POWER_STATE_REQUEST;
+	reg |= (FIELD_PREP(HOST_CFG1_PM_POWER_STATE_REQUEST, state) |
+		HOST_CFG1_PME_EN);
+	writel(reg, google->host_cfg_base + HOST_CFG1_OFFSET);
+
+	ret = readl_poll_timeout(google->host_cfg_base + HC_STATUS_OFFSET, reg,
+				 (FIELD_GET(HC_STATUS_CURRENT_POWER_STATE_U2PMU, reg) == state &&
+				  FIELD_GET(HC_STATUS_CURRENT_POWER_STATE_U3PMU, reg) == state),
+				 10, 10000);
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
+	irq_status = readl(google->usbint_base + USBINT_STATUS_OFFSET);
+	irq_status &= (USBINT_STATUS_USBDRD_PME_GEN_U2P_INTR_STS_RAW |
+		       USBINT_STATUS_USBDRD_PME_GEN_U3P_INTR_STS_RAW);
+	if (!irq_status)
+		return irq_status;
+
+	reg_set = readl(google->usbint_base + USBINT_CFG1_OFFSET);
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
+	writel(reg_set, google->usbint_base + USBINT_CFG1_OFFSET);
+	writel(reg_clear, google->usbint_base + USBINT_CFG1_OFFSET);
+
+	return irq_status;
+}
+
+static void dwc3_google_enable_pme_irq(struct dwc3_google *google)
+{
+	u32 reg;
+
+	reg = readl(google->usbint_base + USBINT_CFG1_OFFSET);
+	reg &= ~(USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK |
+		 USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK);
+	reg |= (USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN |
+		USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN);
+	writel(reg, google->usbint_base + USBINT_CFG1_OFFSET);
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
+	reg = readl(google->usbint_base + USBINT_CFG1_OFFSET);
+	reg &= ~(USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN |
+		 USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN);
+	reg |= (USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK |
+		USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK);
+	writel(reg, google->usbint_base + USBINT_CFG1_OFFSET);
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
+		dev_warn(google->dev, "spurious pme irq %d, hibernation %d, dr_role %u\n",
+			 irq, google->is_hibernation, dr_role);
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
+		ret = reset_control_assert(google->usbc_non_sticky_rst);
+		if (ret)
+			dev_err(google->dev, "non sticky reset assert failed: %d\n", ret);
+	} else if (action == GENPD_NOTIFY_ON) {
+		dev_dbg(google->dev, "enter D0 power state\n");
+		dwc3_google_clear_pme_irqs(google);
+		ret = reset_control_deassert(google->usbc_non_sticky_rst);
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
+	 * Estalibsh PM RUNTIME link between dwc dev and its power domain usb_psw_pd,
+	 * register notifier block to handle hibernation.
+	 */
+	google->usb_psw_pd = dev_pm_domain_attach_by_name(google->dev, "usb_psw_pd");
+	if (IS_ERR_OR_NULL(google->usb_psw_pd)) {
+		dev_err(google->dev, "failed to get usb psw pd");
+		ret = google->usb_psw_pd ? PTR_ERR(google->usb_psw_pd) : -ENODATA;
+		return ret;
+	}
+
+	google->usb_psw_pd_nb.notifier_call = dwc3_google_usb_psw_pd_notifier;
+	ret = dev_pm_genpd_add_notifier(google->usb_psw_pd, &google->usb_psw_pd_nb);
+	if (ret) {
+		dev_err(google->dev, "failed to add usb psw pd notifier");
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
+	google->usb_top_pd = dev_pm_domain_attach_by_name(google->dev, "usb_top_pd");
+	if (IS_ERR_OR_NULL(google->usb_top_pd)) {
+		dev_err(google->dev, "failed to get usb top pd");
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
+static int dwc3_google_probe(struct platform_device *pdev)
+{
+	struct dwc3_probe_data	probe_data = {};
+	struct device		*dev = &pdev->dev;
+	struct dwc3_google	*google;
+	struct resource		*res;
+	int			ret;
+
+	google = devm_kzalloc(&pdev->dev, sizeof(*google), GFP_KERNEL);
+	if (!google)
+		return -ENOMEM;
+
+	google->dev = &pdev->dev;
+
+	ret = dwc3_google_pm_domain_init(google);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to init pdom\n");
+
+	ret = devm_clk_bulk_get_all_enabled(dev, &google->clks);
+	if (ret < 0) {
+		ret = dev_err_probe(&pdev->dev, ret, "failed to get and enable clks\n");
+		goto err_deinit_pdom;
+	}
+	google->num_clks = ret;
+
+	ret = dwc3_google_rst_init(google);
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "failed to get resets\n");
+		goto err_deinit_pdom;
+	}
+
+	ret = reset_control_bulk_deassert(google->num_rsts, google->rsts);
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "failed to deassert rsts\n");
+		goto err_deinit_pdom;
+	}
+
+	ret = dwc3_google_request_irq(google, pdev, "hs_pme_irq", "USB HS wakeup");
+	if (ret < 0) {
+		ret = dev_err_probe(&pdev->dev, ret, "failed to request hs pme irq");
+		goto err_reset_assert;
+	}
+	google->hs_pme_irq = ret;
+
+	ret = dwc3_google_request_irq(google, pdev, "ss_pme_irq", "USB SS wakeup");
+	if (ret < 0) {
+		ret = dev_err_probe(&pdev->dev, ret, "failed to request ss pme irq");
+		goto err_reset_assert;
+	}
+	google->ss_pme_irq = ret;
+
+	google->host_cfg_base =
+		devm_platform_ioremap_resource_byname(pdev, "host_cfg_csr");
+	if (IS_ERR(google->host_cfg_base)) {
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(google->host_cfg_base),
+				    "invalid host cfg csr\n");
+		goto err_reset_assert;
+	}
+
+	google->usbint_base =
+		devm_platform_ioremap_resource_byname(pdev, "usbint_csr");
+	if (IS_ERR(google->usbint_base)) {
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(google->usbint_base),
+				    "invalid usbint csr\n");
+		goto err_reset_assert;
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dwc3_core");
+	if (!res) {
+		ret = dev_err_probe(dev, -ENODEV, "invalid dwc3 core memory\n");
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
+#ifdef CONFIG_PM_SLEEP
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
+#else
+#define dwc3_google_complete NULL
+#define dwc3_google_prepare NULL
+#endif /* CONFIG_PM_SLEEP */
+
+#ifdef CONFIG_PM
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
+#endif /* CONFIG_PM */
+
+static const struct dev_pm_ops dwc3_google_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_google_pm_suspend, dwc3_google_pm_resume)
+	SET_RUNTIME_PM_OPS(dwc3_google_runtime_suspend, dwc3_google_runtime_resume,
+			   dwc3_google_runtime_idle)
+	.complete = dwc3_google_complete,
+	.prepare = dwc3_google_prepare,
+};
+
+static const struct of_device_id dwc3_google_of_match[] = {
+	{ .compatible = "google,snps-dwc3" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dwc3_google_of_match);
+
+static struct platform_driver dwc3_google_driver = {
+	.probe		= dwc3_google_probe,
+	.remove		= dwc3_google_remove,
+	.driver		= {
+		.name	= "google-dwc3",
+		.pm	= &dwc3_google_dev_pm_ops,
+		.of_match_table	= dwc3_google_of_match,
+	},
+};
+
+module_platform_driver(dwc3_google_driver);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare DWC3 Google Glue Driver");
-- 
2.51.0.618.g983fd99d29-goog

