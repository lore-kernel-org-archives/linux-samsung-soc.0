Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA1630FC3D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2025 23:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760744128; cv=none; b=hoa/pi/QtUDXq4FY7Zj8iiwK8SR/Olse3euaG2K9RzQK8rc/2hXMLVcr+asBK+P9DY87yqQ0uuHBrC21l4he2ZucOvmeO7puH9Cjrar/nF3kcxodKlTxiE2VdKXvDYdBQWPOAVQSbrdbHm7qFSmT0/8ef9oepP+QgUG04aSjeCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760744128; c=relaxed/simple;
	bh=PUHXsvNqmP4zFXD2cAbNL1hR4/Me7VAaSPyRgLBzYAM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mdYF4rM/TMVUcSdYtU1aB7d8AgNNn/WsxOr+V/xCQtbklx8uxAVIXTRiNvAdiOa9EiWHoq5SisuCNlFm2g5K9ANGeQUtHftKI9C4me58vw+ueObPM9F1+B0cmxFH/JARmVgUfc9pAfsxm9ovBqGoqY9UuRZyA+Q17pXRnHG1Dno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3h6Ogc+g; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3h6Ogc+g"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-26983c4d708so20665545ad.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2025 16:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760744124; x=1761348924; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NtkAIfXViDBGL+tGfSg/QxpJEKFHTxeM9X6CyjSVSh8=;
        b=3h6Ogc+gnukG1Wa5Vws7V8qs1HBmOXNG0Plp1hB45zG/egRuESXbfuxP7qXlWiu/fJ
         u5eagHiU3yS+Qjlb6FVRSe4/kmXVJGym3nHk91JA200KMNPpdGr3kbfan1JPaivsNljw
         Nsg7DELAKOQRoo0k0Ijx0SXpcfV4O6P7YtXPF9h4EDbUPb9zE1bp7JAyPfzrTK/u+JIF
         4QpSFbCw7zdO7k6rXm6DmjV3+QSluXgG4KLWhSvLEo2v50+A7DR4yG6pdz8MaAd7DWQj
         /TQ0NKaV2A8ZIKfSlfIqpXvLJKujB8hpJFgw7GkkJBWcVqdxvOTurJ/MtAGKrRU7hD5H
         RS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760744124; x=1761348924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtkAIfXViDBGL+tGfSg/QxpJEKFHTxeM9X6CyjSVSh8=;
        b=GjrcN2YYSYkeMrCrt3poVqIUYLFgZ6xIVOQMay4uHwsUIlmT0v3HB3PnRWI9Zqfx2Z
         fAj55hTr5DjQADUhgxP80gHAO632Qoh5TD9pTMMoRdtwZbHF3IQGMgB1B9IDf9dAtWkc
         Tba3xMkqpAkplPWIaUuhxknGG8Jc8JZvRVELZk1mhfL+kY2FzuAZmD476XrM1w48StWK
         GIAWoPyarlIWHk9RpUAyko7tqjwx5+IcqIJRcdnNfZ5W49gK1CmRvw9RjG2OcVA9IhA8
         C/62uakKRHWKpAvohXuy/Q4+yASSeVI3q6MXLHVavCng8MBW4KTHz44nud+dzJgzH8am
         bAkw==
X-Forwarded-Encrypted: i=1; AJvYcCV6H8DFDhls/e3Tbwl4PMKzL/1dn/vVDQyhIWlJ6x/aN94cv6MA6a03KPkvOMkpEi/YEhtcElZd7zDA5GeX7AtqHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyNQrSt/OqR335kmiv2I7/qP9RyhGKsR/qoA9t3Dk/cKeyruSp
	25mGXXuFJDJ+sg+qxlu0zRXctNzOFnKvYBnQP/dWD+NPwBNl/x+CXlbq+VS818EWCKu64KaMikL
	usvwPSQ==
X-Google-Smtp-Source: AGHT+IH3EDMpRteW79m5fNdFuRfNrvv8sm03fWyQKsYM4ixjveSFT5FddrwSzq+RMEIYQaGy4AqdP2DXSc8=
X-Received: from ploe13.prod.google.com ([2002:a17:903:240d:b0:290:b8d7:6415])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc44:b0:26d:58d6:3fb2
 with SMTP id d9443c01a7336-290c9c89697mr68067265ad.12.1760744124287; Fri, 17
 Oct 2025 16:35:24 -0700 (PDT)
Date: Fri, 17 Oct 2025 23:34:59 +0000
In-Reply-To: <20251017233459.2409975-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017233459.2409975-3-royluo@google.com>
Subject: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
From: Roy Luo <royluo@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add support for the DWC3 USB controller found on Google Tensor G5.
The controller features dual-role functionality and hibernation.

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
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/dwc3/Kconfig       |  10 +
 drivers/usb/dwc3/Makefile      |   1 +
 drivers/usb/dwc3/dwc3-google.c | 608 +++++++++++++++++++++++++++++++++
 3 files changed, 619 insertions(+)
 create mode 100644 drivers/usb/dwc3/dwc3-google.c

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 310d182e10b5..467515d5f937 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -189,4 +189,14 @@ config USB_DWC3_RTK
 	  or dual-role mode.
 	  Say 'Y' or 'M' if you have such device.
 
+config USB_DWC3_GOOGLE
+	tristate "Google Platform"
+	depends on OF && COMMON_CLK && RESET_CONTROLLER
+	default n
+	help
+	  Support the DesignWare Core USB3 IP found on Google Tensor
+	  SoCs, starting with the G5 generation. This driver includes
+	  support for hibernation in host mode.
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
index 000000000000..d3fec6fb4dcc
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-google.c
@@ -0,0 +1,608 @@
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
+	void __iomem		*host_cfg_base;
+	void __iomem		*usbint_cfg_base;
+	int			hs_pme_irq;
+	int			ss_pme_irq;
+	bool			is_usb2only;
+	bool			is_hibernation;
+};
+
+#define to_dwc3_google(d) container_of((d), struct dwc3_google, dwc)
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
+	irq_status = readl(google->usbint_cfg_base + USBINT_STATUS_OFFSET);
+	irq_status &= (USBINT_STATUS_USBDRD_PME_GEN_U2P_INTR_STS_RAW |
+		       USBINT_STATUS_USBDRD_PME_GEN_U3P_INTR_STS_RAW);
+	if (!irq_status)
+		return irq_status;
+
+	reg_set = readl(google->usbint_cfg_base + USBINT_CFG1_OFFSET);
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
+	writel(reg_set, google->usbint_cfg_base + USBINT_CFG1_OFFSET);
+	writel(reg_clear, google->usbint_cfg_base + USBINT_CFG1_OFFSET);
+
+	return irq_status;
+}
+
+static void dwc3_google_enable_pme_irq(struct dwc3_google *google)
+{
+	u32 reg;
+
+	reg = readl(google->usbint_cfg_base + USBINT_CFG1_OFFSET);
+	reg &= ~(USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK |
+		 USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK);
+	reg |= (USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN |
+		USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN);
+	writel(reg, google->usbint_cfg_base + USBINT_CFG1_OFFSET);
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
+	reg = readl(google->usbint_cfg_base + USBINT_CFG1_OFFSET);
+	reg &= ~(USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_INT_EN |
+		 USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_INT_EN);
+	reg |= (USBINT_CFG1_USBDRD_PME_GEN_U2P_INTR_MSK |
+		USBINT_CFG1_USBDRD_PME_GEN_U3P_INTR_MSK);
+	writel(reg, google->usbint_cfg_base + USBINT_CFG1_OFFSET);
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
+	reg = readl(google->usbint_cfg_base + USBCS_TOP_CTRL_CFG1_OFFSET);
+	reg |= USBCS_TOP_CTRL_CFG1_USB2ONLY_MODE;
+	writel(reg, google->usbint_cfg_base + USBCS_TOP_CTRL_CFG1_OFFSET);
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
+		return dev_err_probe(dev, ret, "failed to init pdom\n");
+
+	google->host_cfg_base =
+		devm_platform_ioremap_resource_byname(pdev, "host_cfg");
+	if (IS_ERR(google->host_cfg_base)) {
+		return dev_err_probe(dev, PTR_ERR(google->host_cfg_base),
+				     "invalid host cfg\n");
+	}
+
+	google->usbint_cfg_base =
+		devm_platform_ioremap_resource_byname(pdev, "usbint_cfg");
+	if (IS_ERR(google->usbint_cfg_base)) {
+		return dev_err_probe(dev, PTR_ERR(google->usbint_cfg_base),
+				     "invalid usbint cfg\n");
+	}
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
+	{ .compatible = "google,gs5-dwc3" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dwc3_google_of_match);
+
+static struct platform_driver dwc3_google_driver = {
+	.probe		= dwc3_google_probe,
+	.remove		= dwc3_google_remove,
+	.driver		= {
+		.name	= "google-dwc3",
+		.pm	= pm_ptr(&dwc3_google_dev_pm_ops),
+		.of_match_table	= dwc3_google_of_match,
+	},
+};
+
+module_platform_driver(dwc3_google_driver);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare DWC3 Google Glue Driver");
-- 
2.51.0.858.gf9c4a03a3a-goog

