Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA0D1632DF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 02:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753065985; cv=none; b=St4wroo5UBQzIH36ZRp0/VpvsvF/NT6IljfncjoAwFjp6bOpIqJEzjUm2ubbLa2iPahNhc2hfCfemX02Q4q68Xf6j5q7KqXFRM7zZAe8LoLmtAoiRH/U2WH+Jutvakexj8G3MOrywN/xOTVvMR6hAt4EqvRN0U6jX+Diq98vh8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753065985; c=relaxed/simple;
	bh=jVhgquFj4+dezliSvyhSlu+NU0F5lh9k1hHbafd7mM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=t5fdc/iirgc9+qBmG67wLtNVT2jE1W+zyyIoXdO7sYq18YhpGw4AztFTzl8HUptcS13BWAXS/sreL2WjJ7il5Q6pkLNt5TENPDrvkzbIbRfq0OAVK+e1vSU6BqYCjl8Xkx4wusigz1KAgXKN3ubKKaWGdZV54CvF8QVpfd80+A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mJMZ9jOh; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mJMZ9jOh"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250721024613epoutp01e28c8453c1dffa195fac319c21b30cd2~UJDcNP5Dj1459614596epoutp01o
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250721024613epoutp01e28c8453c1dffa195fac319c21b30cd2~UJDcNP5Dj1459614596epoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065973;
	bh=vUFTXGMe5S06xGBM3fNsgJULHCqv26p+HxJgpm5kQHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mJMZ9jOhNl916+/ZP7muKMvqHmyNVTTPsmfzv6WeHAJKZfOaJMpm12WFWqLqQ5XVK
	 1f1aN48/NFRozLEDLcVVftj1kwyxcf3HAunRCBdHEQmOim/m9z66MW8B7M0AffxvRr
	 YKztX4q0I+t2Rqi/Kq7qiAnfJUQU1RN8D01n9Xg8=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p498b4fdca264ce2cbe47f9c8de103333f~UJDbnxfzz1440714407epcas2p4y;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.70]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bllC82ZMPz3hhTB; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epcas2p45ddc52c1644f5779c7da822573f03246~UJDZ8DdgR0522205222epcas2p4g;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip2490830e64bdb29131521b3448c98f2ac~UJDZ3iT_W1347413474epsmtip2h;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 1/9] ASoC: samsung: Add generic ABOX management driver
Date: Mon, 21 Jul 2025 11:30:44 +0900
Message-Id: <20250721023052.3586000-2-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024611epcas2p45ddc52c1644f5779c7da822573f03246
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024611epcas2p45ddc52c1644f5779c7da822573f03246
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024611epcas2p45ddc52c1644f5779c7da822573f03246@epcas2p4.samsung.com>

This driver implements the *generic* (fixed) part of the ABOX management
stack for Samsung Automotive SoCs. It does not directly control hardware
but provides common interfaces and state needed by SoC-specific
(variable) drivers.

The abox generic driver manages child drivers and provides an interface
that bridges the fixed and variable parts, connecting the two modules.

Design Note:
 - The abox generic driver has child drivers, but they are built into a
   single kernel module.
 - The generic driver and the SoC-specific (variable) driver do not have
    a parent-child device relationship.
 - Instead, they are independent, peer modules.
 - To bridge the gap, the generic driver exposes shared state
   via a global pointer and EXPORT_SYMBOL accessor.
 - This allows multiple SoC-specific modules to attach to
   common generic functionality without tight coupling.
 - Only one instance of the generic driver is supported.

Future work will focus on integrating this driver tightly with
ALSA SoC components and improving user-space interfaces.

Code style and interface improvements will be made in subsequent patches
based on upstream review feedback.

Tested on Exynos Auto platform for basic initialization and state sharing.

Note:
The ABOX (Audio Box) is an audio DSP hardware block integrated into
Exynos Automotive SoCs. It includes components such as DMA controllers,
I2S interfaces, GIC (interrupt controller), and the ADSP (audio DSP core).

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 sound/soc/samsung/Kconfig                     |   2 +
 sound/soc/samsung/Makefile                    |   1 +
 sound/soc/samsung/auto_abox/Kconfig           |  22 +
 sound/soc/samsung/auto_abox/generic/Kbuild    |  12 +
 .../samsung/auto_abox/generic/abox_generic.c  | 384 ++++++++++++++++++
 .../auto_abox/generic/include/abox_generic.h  |  84 ++++
 6 files changed, 505 insertions(+)
 create mode 100644 sound/soc/samsung/auto_abox/Kconfig
 create mode 100644 sound/soc/samsung/auto_abox/generic/Kbuild
 create mode 100644 sound/soc/samsung/auto_abox/generic/abox_generic.c
 create mode 100644 sound/soc/samsung/auto_abox/generic/include/abox_generic.h

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 60b4b7b75215..359aa67f49db 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -148,4 +148,6 @@ config SND_SOC_SAMSUNG_MIDAS_WM1811
 	help
 	  Say Y if you want to add support for SoC audio on the Midas boards.
 
+source "sound/soc/samsung/auto_abox/Kconfig"
+
 endif #SND_SOC_SAMSUNG
diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 8d5f09147900..5d99cfbfa71c 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -42,3 +42,4 @@ obj-$(CONFIG_SND_SOC_ARNDALE) += snd-soc-arndale.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_TM2_WM5110) += snd-soc-tm2-wm5110.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_ARIES_WM8994) += snd-soc-aries-wm8994.o
 obj-$(CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811) += snd-soc-midas-wm1811.o
+obj-$(CONFIG_SND_SOC_SAMSUNG_AUTO_ABOX) += auto_abox/generic/
\ No newline at end of file
diff --git a/sound/soc/samsung/auto_abox/Kconfig b/sound/soc/samsung/auto_abox/Kconfig
new file mode 100644
index 000000000000..d22b54fb785f
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/Kconfig
@@ -0,0 +1,22 @@
+#: SPDX-License-Identifier: GPL-2.0-only
+
+menu "Exynosauto Automotive Abox Modules Options"
+
+config SND_SOC_SAMSUNG_AUTO_ABOX
+	tristate "ASoC support for Samsung Exynosauto Automotive ABOX Audio"
+	select SND_SOC_COMPRESS
+	help
+		This driver provides a generic management layer for the ABOX
+		audio block on Samsung SoCs.
+
+		The design splits the ABOX support into:
+		- Fixed generic driver
+		- SoC-specific hardware drivers
+
+		These parts are independent modules without parent-child
+		binding. The generic driver therefore exposes a global
+		accessor via EXPORT_SYMBOL so that variable parts can share
+		state and callbacks safely.
+
+endmenu
+
diff --git a/sound/soc/samsung/auto_abox/generic/Kbuild b/sound/soc/samsung/auto_abox/generic/Kbuild
new file mode 100644
index 000000000000..fa6ba7091730
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/Kbuild
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+# Exynosauto Automotive Abox Driver Support
+
+snd-soc-samsung-abox-generic-$(CONFIG_SND_SOC_SAMSUNG_AUTO_ABOX) := \
+	abox_generic.o
+
+ccflags-y += -I./include
+
+obj-$(CONFIG_SND_SOC_SAMSUNG_AUTO_ABOX) += \
+	snd-soc-samsung-abox-generic.o
+
+
diff --git a/sound/soc/samsung/auto_abox/generic/abox_generic.c b/sound/soc/samsung/auto_abox/generic/abox_generic.c
new file mode 100644
index 000000000000..e1e14750ac8d
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/abox_generic.c
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Eunwoo Kim <ew.kim@samsung.com>
+ *
+ * EXYNOS Automotive Abox Generic Driver - abox_generic.c
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+
+#include "include/abox_generic.h"
+
+/**
+ * abox_generic_data_global - Shared state for ABOX generic driver.
+ *
+ * Architecture note:
+ * -------------------------------------------
+ * Our driver stack is split into:
+ *   - Fixed part (Generic): does not directly control HW
+ *   - Variable part (SoC-specific): directly controls HW
+ *
+ * The fixed part (this driver) must expose internal state to
+ * multiple independent variable drivers which are not parent-child related.
+ *
+ * Since there is no device hierarchy or explicit binding between
+ * generic and SoC-specific parts, we use this single global
+ * pointer plus EXPORT_SYMBOL accessors to share the state safely.
+ *
+ * Caution: Only one instance of the generic driver is supported.
+ * Future work may replace this with a dedicated bus or component binding.
+ */
+static struct abox_generic_data *g_abox_generic_data;
+
+struct abox_generic_data *abox_generic_get_abox_generic_data(void)
+{
+	return g_abox_generic_data;
+}
+
+static struct abox_generic_data *abox_generic_get_generic_data_from_child(struct device *child_dev)
+{
+	struct device *generic_dev = child_dev->parent;
+	struct abox_generic_data *generic_data = NULL;
+
+	if (!generic_dev)
+		return NULL;
+
+	generic_data = dev_get_drvdata(generic_dev);
+	if (!generic_data)
+		return NULL;
+
+	return generic_data;
+}
+
+int abox_generic_set_dma_buffer(struct device *pcm_dev)
+{
+	struct abox_generic_data *generic_data = abox_generic_get_generic_data_from_child(pcm_dev);
+
+	if (!generic_data)
+		return -ENODATA;
+
+	if (!generic_data->soc_ioctl)
+		return -ENODATA;
+
+	return generic_data->soc_ioctl(generic_data->soc_dev, ABOX_SOC_IOCTL_SET_DMA_BUFFER,
+		pcm_dev);
+}
+
+int abox_generic_set_pp_pointer(struct device *pcm_dev)
+{
+	struct abox_generic_data *generic_data = abox_generic_get_generic_data_from_child(pcm_dev);
+
+	if (!generic_data)
+		return 0;
+
+	if (!generic_data->soc_ioctl)
+		return 0;
+
+	return generic_data->soc_ioctl(generic_data->soc_dev, ABOX_SOC_IOCTL_SET_PP_POINTER,
+		pcm_dev);
+}
+
+int abox_generic_attach_soc_callback(struct device *soc_dev,
+				     soc_ioctl_fn soc_ioctl)
+{
+	struct abox_generic_data *generic_data = abox_generic_get_abox_generic_data();
+
+	if (!generic_data)
+		return -ENODATA;
+
+	generic_data->soc_dev = soc_dev;
+	generic_data->soc_ioctl = soc_ioctl;
+
+	generic_data->num_of_rdma = generic_data->soc_ioctl(generic_data->soc_dev,
+		ABOX_SOC_IOCTL_GET_NUM_OF_RDMA, NULL);
+	generic_data->num_of_wdma = generic_data->soc_ioctl(generic_data->soc_dev,
+		ABOX_SOC_IOCTL_GET_NUM_OF_WDMA, NULL);
+	generic_data->num_of_uaif = generic_data->soc_ioctl(generic_data->soc_dev,
+		ABOX_SOC_IOCTL_GET_NUM_OF_UAIF, NULL);
+
+	return 0;
+}
+EXPORT_SYMBOL(abox_generic_attach_soc_callback);
+
+/**
+ * abox_generic_get_pcm_platform_dev - Find PCM platform device by ID
+ * @pcm_id: PCM index to find
+ * @stream_type: Stream direction (e.g. playback or capture)
+ *
+ * This API returns the registered PCM platform device that matches
+ * the given PCM ID and stream type.
+ * It is exported for SoC-specific drivers to look up a specific PCM
+ * device instance managed by the generic ABOX layer.
+ *
+ * Return: Pointer to matching platform device, or NULL if not found.
+ */
+struct platform_device *abox_generic_get_pcm_platform_dev(int pcm_id, int stream_type)
+{
+	struct abox_generic_data *generic_data = abox_generic_get_abox_generic_data();
+	struct platform_device **pdev_pcm = NULL;
+
+	if (stream_type == SNDRV_PCM_STREAM_PLAYBACK)
+		pdev_pcm = generic_data->pdev_pcm_playback;
+	else
+		pdev_pcm = generic_data->pdev_pcm_capture;
+
+	return pdev_pcm[pcm_id];
+}
+EXPORT_SYMBOL(abox_generic_get_pcm_platform_dev);
+
+/**
+ * abox_generic_get_num_of_pcm - Get number of supported PCM devices
+ * @stream_type: Stream direction (e.g. playback or capture)
+ *
+ * Returns the total number of PCM platform devices registered for
+ * the given stream direction.
+ * This API is exported for SoC-specific drivers that need to manage
+ * or iterate over all available PCM instances.
+ *
+ * Return: Number of PCM devices.
+ */
+int abox_generic_get_num_of_pcm(int stream_type)
+{
+	struct abox_generic_data *generic_data = abox_generic_get_abox_generic_data();
+
+	if (!generic_data)
+		return -ENODATA;
+
+	return (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ? generic_data->num_pcm_playback :
+		generic_data->num_pcm_capture;
+}
+EXPORT_SYMBOL(abox_generic_get_num_of_pcm);
+
+int abox_generic_get_num_of_i2s_dummy(void)
+{
+	struct abox_generic_data *generic_data = abox_generic_get_abox_generic_data();
+
+	if (!generic_data)
+		return -ENODATA;
+
+	return generic_data->num_i2s_dummy;
+}
+
+int abox_generic_get_num_of_dma(struct device *pcm_dev, int stream_type)
+{
+	struct abox_generic_data *generic_data = abox_generic_get_generic_data_from_child(pcm_dev);
+
+	return (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ?
+		generic_data->num_of_rdma : generic_data->num_of_wdma;
+}
+
+int abox_generic_register_pcm_dev(struct platform_device *pdev_pcm,
+				   unsigned int id, int stream_type)
+{
+	struct device *pcm_dev = &pdev_pcm->dev;
+	struct abox_generic_data *generic_data = abox_generic_get_generic_data_from_child(pcm_dev);
+	int num_of_pcm_dev = 0;
+
+	num_of_pcm_dev = (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ?
+		generic_data->num_pcm_playback : generic_data->num_pcm_capture;
+	if (id >= num_of_pcm_dev) {
+		dev_err(pcm_dev, "%s: invalid id(%u) : Stream Type:%d\n", __func__, id,
+			stream_type);
+		return -EINVAL;
+	}
+
+	if (stream_type == SNDRV_PCM_STREAM_PLAYBACK)
+		generic_data->pdev_pcm_playback[id] = pdev_pcm;
+	else
+		generic_data->pdev_pcm_capture[id] = pdev_pcm;
+
+	return 0;
+}
+
+/**
+ * abox_generic_attach_soc_callback - Register SoC-specific ioctl callback
+ * @soc_dev: Device pointer for the SoC-specific driver
+ * @soc_ioctl: SoC-specific ioctl handler to attach
+ *
+ * This API lets a SoC-specific driver register its ioctl handler with
+ * the generic ABOX driver.
+ * Used to connect variable drivers that directly control hardware
+ * with the generic layer that provides shared infrastructure.
+ *
+ * Return: 0 on success or a negative error code.
+ */
+struct device *abox_generic_find_fe_dev_from_rtd(struct snd_soc_pcm_runtime *be)
+{
+	struct abox_generic_data *generic_data = abox_generic_get_abox_generic_data();
+	struct snd_soc_dpcm *dpcm;
+	struct snd_soc_pcm_runtime *fe;
+	int stream_type;
+
+	if (!generic_data)
+		return NULL;
+
+	for (stream_type = 0; stream_type <= SNDRV_PCM_STREAM_LAST; stream_type++) {
+		int cmpnt_index = 0;
+		struct snd_soc_component *component = NULL;
+
+		for_each_dpcm_fe(be, stream_type, dpcm) {
+			fe = dpcm->fe;
+			if (fe)
+				break;
+		}
+		if (!fe)
+			continue;
+
+		for_each_rtd_components(fe, cmpnt_index, component) {
+			struct platform_device **pdev = NULL;
+			int num_of_pcm_dev = 0;
+			int i;
+
+			if (stream_type == SNDRV_PCM_STREAM_PLAYBACK) {
+				num_of_pcm_dev = generic_data->num_pcm_playback;
+				pdev = generic_data->pdev_pcm_playback;
+			} else {
+				num_of_pcm_dev = generic_data->num_pcm_capture;
+				pdev = generic_data->pdev_pcm_capture;
+			}
+			for (i = 0; i < num_of_pcm_dev; i++)
+				if (pdev[i] && component->dev == &pdev[i]->dev)
+					return component->dev;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(abox_generic_find_fe_dev_from_rtd);
+
+int abox_generic_request_soc_ioctl(struct device *generic_dev, enum abox_soc_ioctl_cmd cmd,
+				   void *data)
+{
+	struct abox_generic_data *generic_data = dev_get_drvdata(generic_dev);
+	struct device *soc_dev = generic_data->soc_dev;
+
+	if (IS_ERR_OR_NULL(soc_dev)) {
+		dev_err(generic_dev, "%s SoC Device is not ready\n", __func__);
+		return -ENODATA;
+	}
+	return generic_data->soc_ioctl(soc_dev, cmd, data);
+}
+
+static struct platform_driver *abox_generic_sub_drivers[] = {
+};
+
+static int abox_generic_read_property_from_dt(struct device *dev, struct abox_generic_data *data)
+{
+	struct device_node *np = dev->of_node;
+	int ret = 0;
+
+	ret = of_property_read_u32(np, "samsung,num-of-pcm_playback", &data->num_pcm_playback);
+	if (ret < 0) {
+		dev_err(dev, "%s property reading fail\n", "samsung,num-of-pcm_playback");
+		return ret;
+	}
+	ret = of_property_read_u32(np, "samsung,num-of-pcm_capture", &data->num_pcm_capture);
+	if (ret < 0) {
+		dev_err(dev, "%s property reading fail\n", "samsung,num-of-pcm_capture");
+		return ret;
+	}
+	ret = of_property_read_u32(np, "samsung,num-of-i2s-dummy-backend", &data->num_i2s_dummy);
+	if (ret < 0) {
+		dev_err(dev, "%s property reading fail\n", "samsung,num-of-i2s-dummy-backend");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int abox_generic_allocate_memory(struct device *dev, struct abox_generic_data *data)
+{
+	data->pdev_pcm_playback = devm_kcalloc(dev, data->num_pcm_playback,
+						sizeof(struct platform_device *),
+						GFP_KERNEL);
+	if (!data->pdev_pcm_playback)
+		return -ENOMEM;
+
+	data->pdev_pcm_capture = devm_kcalloc(dev, data->num_pcm_capture,
+						sizeof(struct platform_device *),
+						GFP_KERNEL);
+	if (!data->pdev_pcm_capture)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int samsung_abox_generic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct abox_generic_data *data;
+	int ret = 0;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->pdev = pdev;
+	ret = abox_generic_read_property_from_dt(dev, data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "%s Failed to read property. ret:%d\n", __func__,
+				ret);
+
+	ret = abox_generic_allocate_memory(dev, data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "%s Failed to allocate memory. ret:%d\n", __func__,
+				ret);
+
+	g_abox_generic_data = data;
+	platform_set_drvdata(pdev, data);
+
+	platform_register_drivers(abox_generic_sub_drivers, ARRAY_SIZE(abox_generic_sub_drivers));
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to populate sub-platform_devices. ret:%d\n",
+				ret);
+
+	return ret;
+}
+
+static void samsung_abox_generic_remove(struct platform_device *pdev)
+{
+	struct abox_generic_data *data = platform_get_drvdata(pdev);
+
+	platform_unregister_drivers(abox_generic_sub_drivers,
+					ARRAY_SIZE(abox_generic_sub_drivers));
+
+	g_abox_generic_data = NULL;
+
+	return 0;
+}
+
+static void samsung_abox_generic_shutdown(struct platform_device *pdev)
+{
+}
+
+static const struct of_device_id samsung_abox_generic_match[] = {
+	{
+		.compatible = "samsung,abox_generic",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, samsung_abox_generic_match);
+
+struct platform_driver samsung_abox_generic_driver = {
+	.probe  = samsung_abox_generic_probe,
+	.remove = samsung_abox_generic_remove,
+	.shutdown = samsung_abox_generic_shutdown,
+	.driver = {
+		.name = "samsung-abox-generic",
+		.of_match_table = of_match_ptr(samsung_abox_generic_match),
+	},
+};
+
+module_platform_driver(samsung_abox_generic_driver);
+/* Module information */
+MODULE_AUTHOR("Eunwoo Kim, <ew.kim@samsung.com>");
+MODULE_DESCRIPTION("Samsung ASoC A-Box Generic Driver");
+MODULE_LICENSE("GPL");
+
diff --git a/sound/soc/samsung/auto_abox/generic/include/abox_generic.h b/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
new file mode 100644
index 000000000000..b2a3f32ac577
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ALSA SoC - Samsung ABOX Share Function and Data structure
+ * for Exynos specific extensions
+ *
+ * Copyright (C) 2013-2020 Samsung Electronics Co., Ltd.
+ *
+ * EXYNOS - sound/soc/samsung/abox/include/abox_generic.h
+ */
+
+#ifndef __SND_SOC_ABOX_GENERIC_BASE_H
+#define __SND_SOC_ABOX_GENERIC_BASE_H
+
+struct snd_soc_pcm_runtime;
+
+enum abox_soc_ioctl_cmd {
+	ABOX_SOC_IOCTL_GET_NUM_OF_RDMA,
+	ABOX_SOC_IOCTL_GET_NUM_OF_WDMA,
+	ABOX_SOC_IOCTL_GET_NUM_OF_UAIF,
+	ABOX_SOC_IOCTL_GET_SOC_TIMER,
+	ABOX_SOC_IOCTL_SET_DMA_BUFFER,
+	ABOX_SOC_IOCTL_SET_PP_POINTER,
+	ABOX_SOC_IOCTL_SET_PERF_PERIOD,
+	ABOX_SOC_IOCTL_CHECK_TIME_MUTEX,
+	ABOX_SOC_IOCTL_CHECK_TIME_NO_MUTEX,
+	ABOX_SOC_IOCTL_PCM_DUMP_INTR,
+	ABOX_SOC_IOCTL_PCM_DUMP_CLOSE,
+	ABOX_SOC_IOCTL_PCM_DUMP_ADD_CONTROL,
+	ABOX_SOC_IOCTL_MAX
+};
+
+/**
+ * SOC_IOCTL - SoC-specific callback prototype
+ * @soc_dev: SoC device pointer
+ * @cmd: Command to handle (enum abox_soc_ioctl_cmd)
+ * @data: Additional argument, type depends on command
+ *
+ * This is the callback type which the SoC-specific driver must provide.
+ * The generic driver calls this to communicate with the hardware layer.
+ *
+ * Return: 0 on success or negative error code.
+ */
+typedef int (*soc_ioctl_fn)(struct device *soc_dev, enum abox_soc_ioctl_cmd cmd, void *data);
+
+struct abox_generic_data {
+	struct platform_device *pdev;
+	struct platform_device **pdev_pcm_playback;
+	struct platform_device **pdev_pcm_capture;
+	unsigned int num_pcm_playback;
+	unsigned int num_pcm_capture;
+	unsigned int num_i2s_dummy;
+	unsigned int num_of_rdma;
+	unsigned int num_of_wdma;
+	unsigned int num_of_uaif;
+	struct device *soc_dev;
+	soc_ioctl_fn soc_ioctl;
+};
+
+struct abox_generic_data *abox_generic_get_abox_generic_data(void);
+
+int abox_generic_set_dma_buffer(struct device *pcm_dev);
+
+int abox_generic_request_soc_ioctl(struct device *generic_dev, enum abox_soc_ioctl_cmd cmd,
+				    void *data);
+
+int abox_generic_set_pp_pointer(struct device *pcm_dev);
+
+int abox_generic_get_num_of_dma(struct device *pcm_dev, int stream_type);
+
+int abox_generic_get_num_of_i2s_dummy(void);
+
+int abox_generic_register_pcm_dev(struct platform_device *pdev_pcm_dev,
+				   unsigned int id, int stream_type);
+
+struct device *abox_generic_find_fe_dev_from_rtd(struct snd_soc_pcm_runtime *be);
+
+struct platform_device *abox_generic_get_pcm_platform_dev(int pcm_id, int stream_type);
+
+int abox_generic_get_num_of_pcm(int stream_type);
+
+int abox_generic_attach_soc_callback(struct device *soc_dev, soc_ioctl_fn soc_ioctl);
+
+#endif //__SND_SOC_ABOX_GENERIC_BASE_H
+
-- 
2.25.1

