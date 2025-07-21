Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D4F1F4165
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 02:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753065987; cv=none; b=Rg6vhkN7TwpgqFZkbTSV5fjkCOv7CxvQjSDRCVg1VeIDo1kM3ClmvMhOd9TjIqYwl0ynog6CFTa9bz3dqEP+5U5HzHt0do0P6KuInsfTJo1WPYoN5D2L/9tyBrDvO3HLLaEtXr/MFSTEhXfarLiEErsxCKQoLjVxXYgvXt4gosY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753065987; c=relaxed/simple;
	bh=VIXQqdbsYW2V3vzup0VusnYVS+1mRAupgxBAlCv7dig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=CxxlrctYm6TvKxvT2sh8yvWmrgfte8qIiDLk2e2yrLNDNYjrhgk0IWrcWmnsDSsWU8vmdpEGrI7aPun5SUPp/1wznaEU+X4VZL3U0pnvi5uoqoZnwL4lcv2CnRjRUxnH0zc9JveDMiTm8PXZod4welaO1gzG6seJme6z1ZwLM0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FT1R3e/K; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FT1R3e/K"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250721024613epoutp045fabec3f471b18e3c53eed8ad94a9900~UJDcKZR-E1564715647epoutp046
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250721024613epoutp045fabec3f471b18e3c53eed8ad94a9900~UJDcKZR-E1564715647epoutp046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065973;
	bh=waPFWsanDUXgWrIWQycKxbRpmhRuR3oZD5faTAIVfLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FT1R3e/KBH4wtMKTN73+4CuzKP01ayldiYor4lQCVHQUNIWpoShF6NKjwGUArbzyQ
	 3iKbfOQ4/EBzmLeNIDKGV9N2SZxiHQ99OjAjqO/OdUm94yUTcVPSchNqU0Un2+h+m9
	 Guwta1YW1S1bhyzfkaLk5++PvrGwj2GnquN5Dwf4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p328f160184ad4e491fa84965a9c470138~UJDboYJzy2776827768epcas2p37;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.97]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bllC822Rsz6B9m9; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epcas2p4baca500b3b1f185dcdc35552b2abe8d9~UJDaJHPW80521705217epcas2p4o;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip20c7e29d4c2eb9c99ef2b46154d2301c9~UJDaEv29L1443514435epsmtip2F;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 4/9] ASoC: samsung: abox: Add IPC generic support for
 message forwarding
Date: Mon, 21 Jul 2025 11:30:47 +0900
Message-Id: <20250721023052.3586000-5-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024611epcas2p4baca500b3b1f185dcdc35552b2abe8d9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024611epcas2p4baca500b3b1f185dcdc35552b2abe8d9
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024611epcas2p4baca500b3b1f185dcdc35552b2abe8d9@epcas2p4.samsung.com>

This adds the IPC generic driver as a child module of abox_generic
to handle bidirectional IPC message and IRQ routing between the
generic fixed layer and the SoC-specific audio side.

The driver:
- Registers a shared IRQ handler to allow SoC (variable part) to notify
  the generic layer of IPC messages.
- Exports a registration interface to allow the generic layer to send
  IPC messages to the SoC side.
- Uses a global singleton (non-DT) to coordinate state and callback
  registration between the layers, due to lack of direct parent-child
  linkage.

The driver is not a standalone module, and is built as part of the
snd-soc-samsung-abox-generic.ko module.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 sound/soc/samsung/auto_abox/Kconfig           |  19 +-
 sound/soc/samsung/auto_abox/generic/Kbuild    |   3 +-
 .../samsung/auto_abox/generic/abox_generic.c  |  13 +-
 .../auto_abox/generic/abox_ipc_generic.c      | 218 ++++++++++++++++++
 .../auto_abox/generic/include/abox_generic.h  |   2 +-
 .../generic/include/abox_ipc_generic.h        | 181 +++++++++++++++
 6 files changed, 421 insertions(+), 15 deletions(-)
 create mode 100644 sound/soc/samsung/auto_abox/generic/abox_ipc_generic.c
 create mode 100644 sound/soc/samsung/auto_abox/generic/include/abox_ipc_generic.h

diff --git a/sound/soc/samsung/auto_abox/Kconfig b/sound/soc/samsung/auto_abox/Kconfig
index d22b54fb785f..55755b4166b8 100644
--- a/sound/soc/samsung/auto_abox/Kconfig
+++ b/sound/soc/samsung/auto_abox/Kconfig
@@ -10,13 +10,20 @@ config SND_SOC_SAMSUNG_AUTO_ABOX
 		audio block on Samsung SoCs.
 
 		The design splits the ABOX support into:
-		- Fixed generic driver
-		- SoC-specific hardware drivers
+			- A fixed generic control layer (ABOX Generic)
+			- SoC-specific hardware drivers (e.g., IPC, PCM, Backend)
 
-		These parts are independent modules without parent-child
-		binding. The generic driver therefore exposes a global
-		accessor via EXPORT_SYMBOL so that variable parts can share
-		state and callbacks safely.
+		These components are tightly coupled and share internal data
+		and callbacks. To ensure correct symbol resolution and
+		initialization ordering, all drivers are built together into
+		a single kernel object: snd-soc-samsung-abox-generic.ko
+
+		The sub-drivers are registered internally from the generic
+		driver's probe using platform_register_drivers(), rather than
+		being standalone platform drivers with independent module init.
+
+		This approach ensures integration consistency for fixed and
+		variable components across different automotive SoCs.
 
 endmenu
 
diff --git a/sound/soc/samsung/auto_abox/generic/Kbuild b/sound/soc/samsung/auto_abox/generic/Kbuild
index fa6ba7091730..6a63d0609930 100644
--- a/sound/soc/samsung/auto_abox/generic/Kbuild
+++ b/sound/soc/samsung/auto_abox/generic/Kbuild
@@ -2,7 +2,8 @@
 # Exynosauto Automotive Abox Driver Support
 
 snd-soc-samsung-abox-generic-$(CONFIG_SND_SOC_SAMSUNG_AUTO_ABOX) := \
-	abox_generic.o
+	abox_generic.o \
+	abox_ipc_generic.o
 
 ccflags-y += -I./include
 
diff --git a/sound/soc/samsung/auto_abox/generic/abox_generic.c b/sound/soc/samsung/auto_abox/generic/abox_generic.c
index e1e14750ac8d..2c3f5ea910a2 100644
--- a/sound/soc/samsung/auto_abox/generic/abox_generic.c
+++ b/sound/soc/samsung/auto_abox/generic/abox_generic.c
@@ -13,7 +13,9 @@
 #include <sound/soc-dapm.h>
 
 #include "include/abox_generic.h"
+#include "include/abox_ipc_generic.h"
 
+extern struct platform_driver samsung_abox_ipc_generic_driver;
 /**
  * abox_generic_data_global - Shared state for ABOX generic driver.
  *
@@ -264,9 +266,6 @@ int abox_generic_request_soc_ioctl(struct device *generic_dev, enum abox_soc_ioc
 	return generic_data->soc_ioctl(soc_dev, cmd, data);
 }
 
-static struct platform_driver *abox_generic_sub_drivers[] = {
-};
-
 static int abox_generic_read_property_from_dt(struct device *dev, struct abox_generic_data *data)
 {
 	struct device_node *np = dev->of_node;
@@ -308,6 +307,10 @@ static int abox_generic_allocate_memory(struct device *dev, struct abox_generic_
 	return 0;
 }
 
+static struct platform_driver *abox_generic_sub_drivers[] = {
+	&samsung_abox_ipc_generic_driver,
+};
+
 static int samsung_abox_generic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -344,14 +347,10 @@ static int samsung_abox_generic_probe(struct platform_device *pdev)
 
 static void samsung_abox_generic_remove(struct platform_device *pdev)
 {
-	struct abox_generic_data *data = platform_get_drvdata(pdev);
-
 	platform_unregister_drivers(abox_generic_sub_drivers,
 					ARRAY_SIZE(abox_generic_sub_drivers));
 
 	g_abox_generic_data = NULL;
-
-	return 0;
 }
 
 static void samsung_abox_generic_shutdown(struct platform_device *pdev)
diff --git a/sound/soc/samsung/auto_abox/generic/abox_ipc_generic.c b/sound/soc/samsung/auto_abox/generic/abox_ipc_generic.c
new file mode 100644
index 000000000000..58d765cd5bfa
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/abox_ipc_generic.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Eunwoo Kim <ew.kim@samsung.com>
+ *
+ * EXYNOS Automotive Abox IPC Generic Driver - abox_ipc_generic.c
+ *
+ * This driver is part of the ABOX generic audio stack and provides
+ * IPC message/IRQ handling between the fixed (generic) layer and the
+ * SoC-specific variable layer.
+ *
+ * It is a child driver managed by abox_generic, and is built as part
+ * of a single kernel module (snd-soc-samsung-abox-generic.ko) along with
+ * other related drivers.
+ *
+ * The IPC generic driver is registered independently as a platform
+ * driver and uses a global singleton to expose callback interfaces.
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+
+#include "include/abox_ipc_generic.h"
+
+struct abox_ipc_generic_irq_handler_t {
+	ipc_generic_irq_handler_t handler;
+	struct device *dev;
+};
+
+/*
+ * Singleton instance for ABOX IPC Generic driver.
+ *
+ * The generic layer and SoC-specific IPC driver are independent modules,
+ * not in a parent-child device relationship. A global symbol is used to
+ * expose internal state and register callbacks.
+ *
+ * Only one instance is supported. Accessed via exported helper functions.
+ */
+static struct abox_ipc_generic_data *g_abox_ipc_generic_data;
+
+static struct abox_ipc_generic_data *abox_ipc_generic_get_data(void)
+{
+	return g_abox_ipc_generic_data;
+}
+
+static irqreturn_t abox_ipc_generic_pcm_dev_irq_handler(struct device *ipc_generic_dev, int irq_id,
+							struct _abox_inter_ipc_msg *pmsg)
+{
+	struct device *pcm_dev;
+	struct abox_ipc_generic_data *data;
+	struct abox_ipc_generic_irq_handler_t *pcm_dev_irq_handler;
+
+	if (!ipc_generic_dev)
+		return IRQ_NONE;
+
+	data = dev_get_drvdata(ipc_generic_dev);
+	if (!data || irq_id >= data->num_irq)
+		return IRQ_NONE;
+
+	pcm_dev_irq_handler = &data->pcm_dev_irq_handler[irq_id];
+	if (!pcm_dev_irq_handler)
+		return IRQ_NONE;
+
+	if (!pcm_dev_irq_handler->handler)
+		return IRQ_NONE;
+
+	pcm_dev = pcm_dev_irq_handler->dev;
+	if (!pcm_dev)
+		return IRQ_NONE;
+
+	return pcm_dev_irq_handler->handler(pcm_dev, irq_id, pmsg);
+}
+
+static int abox_ipc_generic_read_property_from_dt(struct platform_device *pdev,
+						struct abox_ipc_generic_data *data)
+{
+	int ret;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+
+	ret = of_property_read_u32(np, "samsung,num-of-irq", &data->num_irq);
+	if (ret < 0) {
+		dev_err(dev, "%s property reading fail\n", "samsung,num-of-irq");
+		return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * abox_ipc_generic_get_pcm_dev_handler_callback() - Register IRQ handler to receive IPCs from SoC
+ * @dev_ipc_gen: [out] pointer to the generic device
+ * @handler: [out] function pointer to be called on IPC IRQ
+ *
+ * This function is used by SoC-specific drivers to register the IRQ
+ * handler provided by the generic layer, enabling upward message passing.
+ *
+ * Return: 0 on success, -EINVAL on failure
+ */
+int abox_ipc_generic_get_pcm_dev_handler_callback(struct device **dev_ipc_gen,
+						ipc_generic_irq_handler_t *handler)
+{
+	struct abox_ipc_generic_data *data = NULL;
+
+	data = abox_ipc_generic_get_data();
+	if (!data)
+		return -EINVAL;
+
+	*dev_ipc_gen = &data->pdev->dev;
+	*handler = abox_ipc_generic_pcm_dev_irq_handler;
+
+	return 0;
+}
+EXPORT_SYMBOL(abox_ipc_generic_get_pcm_dev_handler_callback);
+
+/**
+ * abox_ipc_generic_register_xfer_callback() - Register callback to send IPC to SoC
+ * @xfer: SoC-provided IPC transmission function
+ *
+ * Used by the generic layer to send IPC messages to the hardware
+ * through the SoC-specific xfer function.
+ *
+ * Return: 0 on success, -EINVAL on failure
+ */
+int abox_ipc_generic_register_xfer_callback(ipc_gen_request_xfer_t xfer)
+{
+	struct abox_ipc_generic_data *data = NULL;
+
+	data = abox_ipc_generic_get_data();
+	if (!data)
+		return -EINVAL;
+
+	data->request_xfer = xfer;
+
+	return 0;
+}
+EXPORT_SYMBOL(abox_ipc_generic_register_xfer_callback);
+
+int abox_ipc_generic_request_xfer(enum INTER_IPC_ID ipc_id, struct _abox_inter_ipc_msg *pmsg,
+				bool sync, struct __abox_inter_ipc_ret *ipc_ret,
+				unsigned int adsp)
+{
+	struct abox_ipc_generic_data *data = NULL;
+
+	data = abox_ipc_generic_get_data();
+	if (!data || !data->request_xfer)
+		return -EINVAL;
+
+	return data->request_xfer(ipc_id, pmsg, sync, ipc_ret, adsp);
+}
+
+static int samsung_abox_ipc_generic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct abox_ipc_generic_data *data;
+	int ret = 0;
+
+	data = devm_kzalloc(dev, sizeof(struct abox_ipc_generic_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->pdev = pdev;
+	platform_set_drvdata(pdev, data);
+	g_abox_ipc_generic_data = data;
+
+	ret = abox_ipc_generic_read_property_from_dt(pdev, data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				"%s Failed to read property ret:%d\n", __func__, ret);
+
+	data->pcm_dev_irq_handler = devm_kcalloc(dev, data->num_irq,
+						sizeof(struct abox_ipc_generic_irq_handler_t),
+						GFP_KERNEL);
+	if (!data->pcm_dev_irq_handler)
+		return dev_err_probe(dev, -ENOMEM,
+				"%s Failed to alloc memory for pcm_dev_irq_handler\n", __func__);
+
+	return ret;
+}
+
+static void samsung_abox_ipc_generic_remove(struct platform_device *pdev)
+{
+	struct abox_ipc_generic_data *data = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < data->num_irq; ++i) {
+		data->pcm_dev_irq_handler[i].handler = NULL;
+		data->pcm_dev_irq_handler[i].dev = NULL;
+	}
+	g_abox_ipc_generic_data = NULL;
+}
+
+static void samsung_abox_ipc_generic_shutdown(struct platform_device *pdev)
+{
+}
+
+static const struct of_device_id samsung_abox_ipc_generic_of_match[] = {
+	{
+		.compatible = "samsung,abox_ipc_generic",
+	},
+	{}
+};
+
+struct platform_driver samsung_abox_ipc_generic_driver = {
+	.probe  = samsung_abox_ipc_generic_probe,
+	.remove = samsung_abox_ipc_generic_remove,
+	.shutdown = samsung_abox_ipc_generic_shutdown,
+	.driver = {
+		.name = "samsung-abox-ipc-generic",
+		.of_match_table = of_match_ptr(samsung_abox_ipc_generic_of_match),
+	},
+};
+
diff --git a/sound/soc/samsung/auto_abox/generic/include/abox_generic.h b/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
index b2a3f32ac577..b1e6d9b9345d 100644
--- a/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
+++ b/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
@@ -30,7 +30,7 @@ enum abox_soc_ioctl_cmd {
 };
 
 /**
- * SOC_IOCTL - SoC-specific callback prototype
+ * soc_ioctl_fn - SoC-specific callback prototype
  * @soc_dev: SoC device pointer
  * @cmd: Command to handle (enum abox_soc_ioctl_cmd)
  * @data: Additional argument, type depends on command
diff --git a/sound/soc/samsung/auto_abox/generic/include/abox_ipc_generic.h b/sound/soc/samsung/auto_abox/generic/include/abox_ipc_generic.h
new file mode 100644
index 000000000000..c28a72306340
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/include/abox_ipc_generic.h
@@ -0,0 +1,181 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Eunwoo Kim <ew.kim@samsung.com>
+ *
+ * ALSA SoC - Samsung ABOX IPC Generic Interface Header
+ *
+ * This header defines IPC message types, data structures, and
+ * interfaces shared between the ABOX generic layer and
+ * SoC-specific IPC handlers.
+ */
+
+#ifndef __SND_SOC_ABOX_IPC_GENERIC_H
+#define __SND_SOC_ABOX_IPC_GENERIC_H
+
+#include <linux/interrupt.h>
+#include <linux/device.h>
+
+/************ IPC DEFINITION ***************/
+/* Categorized IPC, */
+enum INTER_IPC_ID {
+	INTER_NOT_USED0 = BIT(0),
+	INTER_NOT_USED1 = BIT(1),
+	INTER_IPC_PCMPLAYBACK = BIT(2),
+	INTER_IPC_PCMCAPTURE = BIT(3),
+	INTER_IPC_OFFLOAD = BIT(4),
+	INTER_IPC_DMA_INTR = BIT(5),
+	INTER_NOT_USED6 = BIT(6),
+	INTER_NOT_USED7 = BIT(7),
+	INTER_NOT_USED8 = BIT(8),
+	INTER_NOT_USED9 = BIT(9),
+	INTER_NOT_USED10 = BIT(10),
+	INTER_NOT_USED11 = BIT(11),
+	INTER_NOT_USED12 = BIT(12),
+	INTER_NOT_USED13 = BIT(13),
+	INTER_NOT_USED14 = BIT(14),
+	INTER_NOT_USED15 = BIT(15),
+	INTER_IPC_ID_COUNT = 16,
+	INTER_IPC_ID_COUNT_BIT = BIT(INTER_IPC_ID_COUNT),
+};
+
+struct __abox_inter_ipc_ret {
+	int param1;
+};
+
+/******** PCMTASK IPC ***********************/
+enum INTER_PCMMSG {
+	INTER_PCM_PLTDAI_OPEN		= 11,
+	INTER_PCM_PLTDAI_CLOSE		= 12,
+	INTER_PCM_PLTDAI_IOCTL		= 13,
+	INTER_PCM_PLTDAI_HW_PARAMS	= 14,
+	INTER_PCM_PLTDAI_HW_FREE	= 15,
+	INTER_PCM_PLTDAI_PREPARE	= 16,
+	INTER_PCM_PLTDAI_TRIGGER	= 17,
+	INTER_PCM_PLTDAI_POINTER	= 18,
+	INTER_PCM_SET_BUFFER		= 20,
+	INTER_PCM_SET_FW_INTR_GAP_LOG	= 51,
+	INTER_PCMMSG_MAX	= 52,
+};
+
+struct PCMTASK_HW_PARAMS {
+	int sample_rate;
+	int bit_depth;
+	int channels;
+};
+
+struct PCMTASK_SET_BUFFER {
+	int phyaddr;
+	int size;
+	int count;
+};
+
+struct PCMTASK_DMA_TRIGGER {
+	int trigger;
+	int rbuf_offset;
+	int rbuf_cnt;
+	bool is_real_dma;
+};
+
+/* Parameter of the PCMTASK command */
+struct INTER_IPC_PCMTASK_MSG {
+	enum INTER_PCMMSG msgtype;
+	int pcm_alsa_id;
+	int pcm_device_id;
+	int hw_dma_id;           // should know ??
+	int irq_id;
+	unsigned int domain_id;  // SMH - should be removed
+	unsigned int adsp;
+	unsigned long start_threshold;
+	union {
+		struct PCMTASK_HW_PARAMS hw_params;
+		struct PCMTASK_SET_BUFFER setbuff;
+		struct PCMTASK_DMA_TRIGGER dma_trigger;
+	} param;
+};
+
+/* The parameter of the set_param */
+struct OFFLOAD_SET_PARAM {
+	int sample_rate;
+	int bit_depth;
+	int channels;
+	int phyaddr;
+	int chunk_size;
+};
+
+/* The parameter of the start */
+struct OFFLOAD_START {
+	int id;
+};
+
+/* The parameter of the write */
+struct OFFLOAD_WRITE {
+	int id;
+	int buff;
+	int size;
+};
+
+/******** OFFLOAD IPC ***********************/
+enum OFFLOADMSG {
+	OFFLOAD_OPEN = 1,
+	OFFLOAD_CLOSE,
+	OFFLOAD_SETPARAM,
+	OFFLOAD_START,
+	OFFLOAD_WRITE,
+	OFFLOAD_PAUSE,
+	OFFLOAD_STOP,
+};
+
+/* Parameter of the OFFLOADTASK command */
+struct INTER_IPC_OFFLOADTASK_MSG {
+	enum OFFLOADMSG msgtype;
+	int codec_id;
+	int pcm_device_id;
+	int hw_dma_id;
+	int irq_id;
+	int pcm_alsa_id;
+	int direction;
+	int domain_id;
+	union {
+		struct OFFLOAD_SET_PARAM setparam;
+		struct OFFLOAD_START start;
+		struct OFFLOAD_WRITE write;
+		struct PCMTASK_DMA_TRIGGER dma_trigger;
+	} param;
+};
+
+struct _abox_inter_ipc_msg {
+	enum INTER_IPC_ID ipcid;
+	int task_id;
+	union INTER_IPC_MSG {
+		struct INTER_IPC_PCMTASK_MSG pcmtask;
+		struct INTER_IPC_OFFLOADTASK_MSG offload_task;
+	} msg;
+};
+
+typedef irqreturn_t (*ipc_generic_irq_handler_t)(struct device *dev, int irq_id,
+	struct _abox_inter_ipc_msg *pmsg);
+
+typedef int (*ipc_gen_request_xfer_t)(enum INTER_IPC_ID ipc_id, struct _abox_inter_ipc_msg *pmsg,
+	bool sync, struct __abox_inter_ipc_ret *ipc_ret, unsigned int adsp);
+
+struct abox_ipc_generic_irq_handler_t;
+
+struct abox_ipc_generic_data {
+	struct platform_device *pdev;
+	unsigned int num_irq;
+	struct abox_ipc_generic_irq_handler_t *pcm_dev_irq_handler;
+	ipc_gen_request_xfer_t request_xfer;
+};
+
+int abox_ipc_generic_get_pcm_dev_handler_callback(struct device **dev_ipc_generic,
+	ipc_generic_irq_handler_t *handler);
+int abox_ipc_generic_register_xfer_callback(ipc_gen_request_xfer_t xfer);
+int abox_ipc_generic_register_pcm_dev_handler(struct device *dev_pcm, unsigned int irq_id,
+	ipc_generic_irq_handler_t handler);
+int abox_ipc_generic_request_xfer(enum INTER_IPC_ID ipc_id, struct _abox_inter_ipc_msg *pmsg,
+	bool sync, struct __abox_inter_ipc_ret *ipc_ret, unsigned int adsp);
+
+
+#endif /* __SND_SOC_ABOX_IPC_GENERIC_H */
+
-- 
2.25.1

