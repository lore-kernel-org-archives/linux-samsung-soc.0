Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5347921A453
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 02:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753065995; cv=none; b=kFv6ZtYv4pHctdrO7mdMhND5N3UkoPZO/a1eLVoPNg2FjwMqILfTTfj6vJXPfXezsWjTcuK+IAiK0IZxeHSTGtr3XcdYjegMJHbZJu5aQDSch3uYGb+btPSu5WKJUvaWcLv6tlVD/527zbAmmWzZgdek/wmMi8DLi9kcAQWKWxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753065995; c=relaxed/simple;
	bh=LvufspbpHmwVH73qdIB34NGgKLAZvrit6XLSjxKvye0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=eNze2HN6Tg70YkrFqGjnjHvlJFiplHKJSeuiRA9EhwAAOawDm+rdgwKnNeeU0NsHCDxEZ2TGnLNzKpGiov5gnk+AGPrgTBWxnuQkYCeU2+WwMEFwPbbqrf84Cl2c98LxdvTFDuTiSbRlKuOAZdNURFrEVPwh2s+XN0afIxaixF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GFR82fz/; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GFR82fz/"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250721024614epoutp031f5f883b97f3c16f62d5746ec7744d7f~UJDcZaRar2248122481epoutp03f
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 02:46:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250721024614epoutp031f5f883b97f3c16f62d5746ec7744d7f~UJDcZaRar2248122481epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065974;
	bh=rBhkyVck6faX+Q4i3Q4n2Xl/8diLNferqZU0jeJ2TD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GFR82fz/yqxzpaLCMhOiUoo1w5mVAMLd1vAN76tti+v+uScZcYtyFOCJe41wrYq37
	 IX9D1EKSz+ZE4ZsU2oxJjZTfw5ckO5mxgmKa2T8fQ3B44qEkCYH50XW33UYMwzV2kt
	 LfjeDKgiW4XGaopFXQpGuum9DLQT9GXaGcHSNhUw=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p2e1cf6f150be962b2791dc16898af5eac~UJDbvbLPt2628326283epcas2p25;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bllC84KhKz6B9mD; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epcas2p423f2e6084264b08f43c6f86ce1ad0892~UJDaYumax1440714407epcas2p4v;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip23d8ba8f3f418986fed7f9c2c3434038c~UJDaSO85w1051310513epsmtip2S;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 7/9] ASoC: samsung: Add PCM driver with solution support
Date: Mon, 21 Jul 2025 11:30:50 +0900
Message-Id: <20250721023052.3586000-8-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024611epcas2p423f2e6084264b08f43c6f86ce1ad0892
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024611epcas2p423f2e6084264b08f43c6f86ce1ad0892
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024611epcas2p423f2e6084264b08f43c6f86ce1ad0892@epcas2p4.samsung.com>

Add abox_pcm_dev as an ALSA SoC frontend driver for PCM playback and
capture on the Exynos ABOX audio subsystem.

This driver registers per-PCM frontend devices and connects them to
the SoC-specific DMA engines and I2S dummy backends. It also supports
dynamic routing through DAPM and ALSA kcontrols, enabling flexible
audio path configuration.

Key features:
- Implements compress ops (.open, .set_params, .trigger, etc.)
- Dynamically generates DAPM widgets, routes, and kcontrols
- Integrates post-processing (PP) path support via mux control
- Provides runtime attach interface for solution management

The solution manager (`abox_solution_mgr`) is introduced as an optional
component that can be registered at runtime. When available, it enables
per-chain software audio solution selection via enum-type ALSA kcontrols.

Additionally, a new utility module (`abox_util_generic`) is added to
support reusable helpers for DMA management and device tree parsing.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 sound/soc/samsung/auto_abox/generic/Kbuild    |    5 +-
 .../samsung/auto_abox/generic/abox_generic.c  |  223 +-
 .../auto_abox/generic/abox_ipc_generic.c      |   23 +
 .../samsung/auto_abox/generic/abox_pcm_dev.c  | 2366 +++++++++++++++++
 .../auto_abox/generic/abox_solution_mgr.c     |  456 ++++
 .../auto_abox/generic/abox_util_generic.c     |   48 +
 .../auto_abox/generic/include/abox_generic.h  |   45 +-
 .../generic/include/abox_ipc_generic.h        |   44 +-
 .../auto_abox/generic/include/abox_pcm.h      |  135 +
 .../generic/include/abox_solution_mgr.h       |   98 +
 .../generic/include/abox_util_generic.h       |  110 +
 11 files changed, 3504 insertions(+), 49 deletions(-)
 create mode 100644 sound/soc/samsung/auto_abox/generic/abox_pcm_dev.c
 create mode 100644 sound/soc/samsung/auto_abox/generic/abox_solution_mgr.c
 create mode 100644 sound/soc/samsung/auto_abox/generic/abox_util_generic.c
 create mode 100644 sound/soc/samsung/auto_abox/generic/include/abox_pcm.h
 create mode 100644 sound/soc/samsung/auto_abox/generic/include/abox_solution_mgr.h
 create mode 100644 sound/soc/samsung/auto_abox/generic/include/abox_util_generic.h

diff --git a/sound/soc/samsung/auto_abox/generic/Kbuild b/sound/soc/samsung/auto_abox/generic/Kbuild
index 6a63d0609930..996bc814661a 100644
--- a/sound/soc/samsung/auto_abox/generic/Kbuild
+++ b/sound/soc/samsung/auto_abox/generic/Kbuild
@@ -3,7 +3,10 @@
 
 snd-soc-samsung-abox-generic-$(CONFIG_SND_SOC_SAMSUNG_AUTO_ABOX) := \
 	abox_generic.o \
-	abox_ipc_generic.o
+	abox_ipc_generic.o \
+	abox_util_generic.o \
+	abox_solution_mgr.o \
+	abox_pcm_dev.o
 
 ccflags-y += -I./include
 
diff --git a/sound/soc/samsung/auto_abox/generic/abox_generic.c b/sound/soc/samsung/auto_abox/generic/abox_generic.c
index 2c3f5ea910a2..e00dc07c0109 100644
--- a/sound/soc/samsung/auto_abox/generic/abox_generic.c
+++ b/sound/soc/samsung/auto_abox/generic/abox_generic.c
@@ -15,7 +15,6 @@
 #include "include/abox_generic.h"
 #include "include/abox_ipc_generic.h"
 
-extern struct platform_driver samsung_abox_ipc_generic_driver;
 /**
  * abox_generic_data_global - Shared state for ABOX generic driver.
  *
@@ -57,6 +56,60 @@ static struct abox_generic_data *abox_generic_get_generic_data_from_child(struct
 	return generic_data;
 }
 
+/**
+ * abox_generic_init_soc_route - Initialize SoC-specific PCM DMA routing
+ * @soc_dev: device pointer for the variable part (SoC-level controller)
+ *
+ * This function is called by the variable part (e.g., SoC-specific driver) to request
+ * initialization of PCM-to-DMA routing controls. It stores the given SoC device pointer
+ * and invokes dynamic DMA route kcontrol creation for each registered PCM frontend
+ * (playback and capture) device.
+ *
+ * It uses abox_pcm_dev_register_dma_route_kcontrol() internally to expose the routing
+ * controls as ALSA kcontrols, allowing user-space or driver components to configure
+ * how PCM streams are connected to backend DMA channels.
+ *
+ * Return: 0 on success or a negative error code on failure
+ */
+int abox_generic_init_soc_route(struct device *soc_dev)
+{
+	struct abox_generic_data *generic_data = abox_generic_get_abox_generic_data();
+	struct platform_device **pdev_pcm;
+	unsigned int stream_type;
+	unsigned int num_of_pcm;
+	unsigned int num_of_dma;
+	unsigned int pcm_id;
+	int ret = 0;
+
+	if (!generic_data)
+		return -ENODATA;
+	generic_data->soc_dev = soc_dev;
+
+	for (stream_type = SNDRV_PCM_STREAM_PLAYBACK; stream_type <= SNDRV_PCM_STREAM_CAPTURE;
+		stream_type++) {
+		if (stream_type == SNDRV_PCM_STREAM_PLAYBACK) {
+			pdev_pcm = generic_data->pdev_pcm_playback;
+			num_of_pcm = generic_data->num_pcm_playback;
+			num_of_dma = generic_data->num_rdma;
+		} else {
+			pdev_pcm = generic_data->pdev_pcm_capture;
+			num_of_pcm = generic_data->num_pcm_capture;
+			num_of_dma = generic_data->num_wdma;
+		}
+
+		for (pcm_id = 0; pcm_id < num_of_pcm; pcm_id++) {
+			if (!pdev_pcm[pcm_id])
+				continue;
+			ret = abox_pcm_dev_register_dma_route_kcontrol(&pdev_pcm[pcm_id]->dev,
+				num_of_dma);
+			if (ret < 0)
+				dev_warn(soc_dev, "PCM Failed to attach dma : %d\n", ret);
+		}
+	}
+	return ret;
+}
+EXPORT_SYMBOL(abox_generic_init_soc_route);
+
 int abox_generic_set_dma_buffer(struct device *pcm_dev)
 {
 	struct abox_generic_data *generic_data = abox_generic_get_generic_data_from_child(pcm_dev);
@@ -85,6 +138,21 @@ int abox_generic_set_pp_pointer(struct device *pcm_dev)
 		pcm_dev);
 }
 
+/**
+ * abox_generic_attach_soc_callback - Register SoC callback and retrieve resource info
+ * @soc_dev: device pointer for the variable (SoC-specific) part
+ * @soc_ioctl: function pointer used to query SoC-specific resource info
+ *
+ * This function registers the variable part's device and ioctl callback function
+ * into the ABOX generic context. It is typically called by the SoC-specific
+ * driver during initialization.
+ *
+ * After registration, it queries the number of SoC-specific audio resources,
+ * such as RDMA, WDMA, and UAIF interfaces, and stores them in the generic context.
+ * These values are used later for dynamic kcontrol generation and routing setup.
+ *
+ * Return: 0 on success or -ENODATA if the ABOX generic context is not available
+ */
 int abox_generic_attach_soc_callback(struct device *soc_dev,
 				     soc_ioctl_fn soc_ioctl)
 {
@@ -96,11 +164,11 @@ int abox_generic_attach_soc_callback(struct device *soc_dev,
 	generic_data->soc_dev = soc_dev;
 	generic_data->soc_ioctl = soc_ioctl;
 
-	generic_data->num_of_rdma = generic_data->soc_ioctl(generic_data->soc_dev,
+	generic_data->num_rdma = generic_data->soc_ioctl(generic_data->soc_dev,
 		ABOX_SOC_IOCTL_GET_NUM_OF_RDMA, NULL);
-	generic_data->num_of_wdma = generic_data->soc_ioctl(generic_data->soc_dev,
+	generic_data->num_wdma = generic_data->soc_ioctl(generic_data->soc_dev,
 		ABOX_SOC_IOCTL_GET_NUM_OF_WDMA, NULL);
-	generic_data->num_of_uaif = generic_data->soc_ioctl(generic_data->soc_dev,
+	generic_data->num_uaif = generic_data->soc_ioctl(generic_data->soc_dev,
 		ABOX_SOC_IOCTL_GET_NUM_OF_UAIF, NULL);
 
 	return 0;
@@ -134,7 +202,7 @@ struct platform_device *abox_generic_get_pcm_platform_dev(int pcm_id, int stream
 EXPORT_SYMBOL(abox_generic_get_pcm_platform_dev);
 
 /**
- * abox_generic_get_num_of_pcm - Get number of supported PCM devices
+ * abox_generic_get_num_pcm - Get number of supported PCM devices
  * @stream_type: Stream direction (e.g. playback or capture)
  *
  * Returns the total number of PCM platform devices registered for
@@ -144,7 +212,7 @@ EXPORT_SYMBOL(abox_generic_get_pcm_platform_dev);
  *
  * Return: Number of PCM devices.
  */
-int abox_generic_get_num_of_pcm(int stream_type)
+int abox_generic_get_num_pcm(int stream_type)
 {
 	struct abox_generic_data *generic_data = abox_generic_get_abox_generic_data();
 
@@ -154,9 +222,9 @@ int abox_generic_get_num_of_pcm(int stream_type)
 	return (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ? generic_data->num_pcm_playback :
 		generic_data->num_pcm_capture;
 }
-EXPORT_SYMBOL(abox_generic_get_num_of_pcm);
+EXPORT_SYMBOL(abox_generic_get_num_pcm);
 
-int abox_generic_get_num_of_i2s_dummy(void)
+int abox_generic_get_num_i2s_dummy(void)
 {
 	struct abox_generic_data *generic_data = abox_generic_get_abox_generic_data();
 
@@ -166,14 +234,71 @@ int abox_generic_get_num_of_i2s_dummy(void)
 	return generic_data->num_i2s_dummy;
 }
 
-int abox_generic_get_num_of_dma(struct device *pcm_dev, int stream_type)
+int abox_generic_get_num_dma(struct device *pcm_dev, int stream_type)
 {
 	struct abox_generic_data *generic_data = abox_generic_get_generic_data_from_child(pcm_dev);
 
 	return (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ?
-		generic_data->num_of_rdma : generic_data->num_of_wdma;
+		generic_data->num_rdma : generic_data->num_wdma;
 }
 
+/**
+ * abox_generic_attach_dma - Attach a DMA controller to all PCM frontend devices
+ *                            registered under abox_generic.
+ * @dma_dev: DMA controller device provided by SoC-specific driver.
+ * @dma_id: DMA ID used to identify the specific DMA channel.
+ * @stream_type: PCM stream direction (SNDRV_PCM_STREAM_PLAYBACK or _CAPTURE).
+ * @dma_ioctl: Function pointer to the DMA ioctl interface provided by the DMA driver.
+ *
+ * This function is called by SoC-specific DMA drivers during their probe stage.
+ * It registers the given DMA controller with all PCM frontend devices of the
+ * matching stream type (playback or capture) under the abox_generic framework.
+ *
+ * It does so by iterating through the PCM device list managed by abox_generic
+ * and calling abox_pcm_dev_attach_dma() for each of them.
+ *
+ * Return: 0 on success or the last non-zero error code encountered.
+ */
+int abox_generic_attach_dma(struct device *dma_dev, int dma_id,
+				int stream_type, dma_ioctl_fn dma_ioctl)
+{
+	struct platform_device **pdev_pcm;
+	struct abox_generic_data *data = abox_generic_get_abox_generic_data();
+	struct device *generic_dev;
+	unsigned int num_of_pcm;
+	unsigned int pcm_id;
+	int ret = 0;
+
+	if (!data) {
+		pr_err("%s Failed to get abox_generic_data\n", __func__);
+		return -ENODATA;
+	}
+	generic_dev = &data->pdev->dev;
+
+	dev_info(generic_dev, "%s DMA%d Stream_type:%d\n", __func__, dma_id, stream_type);
+	if (stream_type == SNDRV_PCM_STREAM_PLAYBACK) {
+		pdev_pcm = data->pdev_pcm_playback;
+		num_of_pcm = data->num_pcm_playback;
+	} else if (stream_type == SNDRV_PCM_STREAM_CAPTURE) {
+		pdev_pcm = data->pdev_pcm_capture;
+		num_of_pcm = data->num_pcm_capture;
+	} else {
+		dev_err(generic_dev, "%s Invalied stream type : %d\n", __func__, stream_type);
+		return -EINVAL;
+	}
+
+	for (pcm_id = 0; pcm_id < num_of_pcm; pcm_id++) {
+		if (!pdev_pcm[pcm_id])
+			continue;
+		dev_dbg(generic_dev, "%s DMA%d Register to PCM%d\n", __func__, dma_id, pcm_id);
+		ret = abox_pcm_dev_attach_dma(&pdev_pcm[pcm_id]->dev, dma_dev, dma_id, dma_ioctl);
+		if (ret < 0)
+			dev_err(generic_dev, "%s PCM Failed to attach dma : %d\n", __func__, ret);
+	}
+	return ret;
+}
+EXPORT_SYMBOL(abox_generic_attach_dma);
+
 int abox_generic_register_pcm_dev(struct platform_device *pdev_pcm,
 				   unsigned int id, int stream_type)
 {
@@ -197,6 +322,83 @@ int abox_generic_register_pcm_dev(struct platform_device *pdev_pcm,
 	return 0;
 }
 
+/**
+ * abox_generic_release_active_resource - Request to release pcm device resources
+ *
+ * This function is called by SoC driver during their releasing .
+ * It calls all abox_pcm_dev_release of PCM frontend devices.
+ *
+ */
+void abox_generic_release_active_resource(void)
+{
+	struct abox_generic_data *data = abox_generic_get_abox_generic_data();
+	struct device *generic_dev = &data->pdev->dev;
+	int index;
+
+	if (!data) {
+		dev_err(generic_dev, "%s: Invalid abox data\n", __func__);
+		return;
+	}
+
+	for (index = 0; index < data->num_pcm_playback; index++) {
+		if (!data->pdev_pcm_playback[index])
+			continue;
+		abox_pcm_dev_release(data->pdev_pcm_playback[index]);
+	}
+	for (index = 0; index < data->num_pcm_capture; index++) {
+		if (!data->pdev_pcm_capture[index])
+			continue;
+		abox_pcm_dev_release(data->pdev_pcm_capture[index]);
+	}
+}
+EXPORT_SYMBOL(abox_generic_release_active_resource);
+
+/**
+ * abox_generic_primary_dev_get - Get the primary PCM device number for a stream type
+ * @stream_type: Stream direction (SNDRV_PCM_STREAM_PLAYBACK or _CAPTURE)
+ *
+ * This function returns the ALSA PCM device number of the first available
+ * frontend PCM device for the given stream type (playback or capture).
+ *
+ * It is typically used by user space audio frameworks (e.g., Android Audio HAL)
+ * to identify the primary PCM device to use for audio routing or policy decisions.
+ *
+ * Since SoC-level drivers lack detailed knowledge of ALSA PCM configuration,
+ * this API provides a way for upper layers to query the correct frontend PCM
+ * device managed by the abox_generic framework.
+ *
+ * Return: The PCM device number on success, or a negative error code on failure.
+ */
+int abox_generic_primary_dev_get(int stream_type)
+{
+	struct abox_generic_data *data = abox_generic_get_abox_generic_data();
+	struct device *dev = &data->pdev->dev;
+	struct abox_platform_data *pcm_device_data;
+	struct platform_device **pdev_pcm;
+	unsigned int num_of_pcm;
+	int id;
+
+	if (!data) {
+		dev_err(dev, "%s: Invalid abox data\n", __func__);
+		return -ENODATA;
+	}
+	if (stream_type == SNDRV_PCM_STREAM_PLAYBACK) {
+		pdev_pcm = data->pdev_pcm_playback;
+		num_of_pcm = data->num_pcm_playback;
+	} else {
+		pdev_pcm = data->pdev_pcm_capture;
+		num_of_pcm = data->num_pcm_capture;
+	}
+	for (id = 0; id < num_of_pcm; ++id) {
+		if (pdev_pcm[id]) {
+			pcm_device_data = platform_get_drvdata(pdev_pcm[id]);
+			return pcm_device_data->pcm_dev_num;
+		}
+	}
+	return -EINVAL;
+}
+EXPORT_SYMBOL(abox_generic_primary_dev_get);
+
 /**
  * abox_generic_attach_soc_callback - Register SoC-specific ioctl callback
  * @soc_dev: Device pointer for the SoC-specific driver
@@ -309,6 +511,7 @@ static int abox_generic_allocate_memory(struct device *dev, struct abox_generic_
 
 static struct platform_driver *abox_generic_sub_drivers[] = {
 	&samsung_abox_ipc_generic_driver,
+	&samsung_abox_pcm_dev_driver,
 };
 
 static int samsung_abox_generic_probe(struct platform_device *pdev)
diff --git a/sound/soc/samsung/auto_abox/generic/abox_ipc_generic.c b/sound/soc/samsung/auto_abox/generic/abox_ipc_generic.c
index 58d765cd5bfa..74a8b17c008e 100644
--- a/sound/soc/samsung/auto_abox/generic/abox_ipc_generic.c
+++ b/sound/soc/samsung/auto_abox/generic/abox_ipc_generic.c
@@ -154,6 +154,29 @@ int abox_ipc_generic_request_xfer(enum INTER_IPC_ID ipc_id, struct _abox_inter_i
 	return data->request_xfer(ipc_id, pmsg, sync, ipc_ret, adsp);
 }
 
+int abox_ipc_generic_register_pcm_dev_handler(struct device *pcm_dev, unsigned int irq_id,
+	ipc_generic_irq_handler_t handler)
+{
+	struct abox_ipc_generic_data *data;
+
+	data = abox_ipc_generic_get_data();
+	if (!data) {
+		pr_err("%s: There is no abox_ipc_generic_data\n", __func__);
+		return -EINVAL;
+	}
+	if (irq_id >= data->num_irq) {
+		dev_err(pcm_dev, "%s Invalid pcm irq id %d\n", __func__, irq_id);
+		return -EINVAL;
+	}
+
+	dev_dbg(pcm_dev, "%s[%d] pcm_irq_id(%d) handler is registered\n",
+		__func__, __LINE__, irq_id);
+	data->pcm_dev_irq_handler[irq_id].handler = handler;
+	data->pcm_dev_irq_handler[irq_id].dev = pcm_dev;
+
+	return 0;
+}
+
 static int samsung_abox_ipc_generic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/sound/soc/samsung/auto_abox/generic/abox_pcm_dev.c b/sound/soc/samsung/auto_abox/generic/abox_pcm_dev.c
new file mode 100644
index 000000000000..613908f7e581
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/abox_pcm_dev.c
@@ -0,0 +1,2366 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Eunwoo Kim <ew.kim@samsung.com>
+ *
+ * EXYNOS Automotive Abox Generic Driver - abox_pcm_dev.c
+ *
+ * ALSA SoC frontend driver for PCM playback and capture.
+ *
+ * This driver registers PCM frontend devices for the ABOX audio subsystem
+ * in Exynos Automotive SoCs. It connects to SoC-specific DMA engines,
+ * communicates with the DSP via abox_ipc_generic, and supports post-processing
+ * (PP) features through abox_solution_mgr.
+ *
+ * This driver operates as a child device of abox_generic.
+ */
+
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/dma-mapping.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/ktime.h>
+
+#include <sound/soc.h>
+#include <sound/pcm_params.h>
+#include <sound/tlv.h>
+
+#include "include/abox_generic.h"
+#include "include/abox_pcm.h"
+#include "include/abox_ipc_generic.h"
+#include "include/abox_solution_mgr.h"
+#include "include/abox_util_generic.h"
+
+#define PCM_STREAM_STR(stream) stream ? "Capture":"Playback"
+#define PCM_KCTL_DUMMY_MUX	"DUMMY MUX"
+#define PCM_KCTL_DMA_MUX	"DMA MUX"
+#define DMA_NO_CONNECT		-1
+
+/* "%d" is replaced with PCM device ID (from DT "samsung,id" property) */
+static struct snd_soc_dai_driver abox_pcm_playback_dai_drv[] = {
+	{
+		.name = "PCM%dp",
+		.playback = {
+			.stream_name = "PCM%d Playback",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rates = ABOX_SAMPLING_RATES,
+			.rate_min = 8000,
+			.rate_max = 384000,
+			.formats = ABOX_SAMPLE_FORMATS,
+		},
+	},
+};
+
+/* "%d" is replaced with PCM device ID (from DT "samsung,id" property) */
+static struct snd_soc_dai_driver abox_pcm_capture_dai_drv[] = {
+	{
+		.name = "PCM%dc",
+		.capture = {
+			.stream_name = "PCM%d Capture",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rates = ABOX_SAMPLING_RATES,
+			.rate_min = 8000,
+			.rate_max = 384000,
+			.formats = ABOX_SAMPLE_FORMATS,
+		},
+	},
+};
+
+static const struct snd_compr_caps abox_pcm_dev_compr_caps = {
+	/* Temporary value:  Need to be checked */
+	.direction		= SND_COMPRESS_PLAYBACK,
+	.min_fragment_size	= SZ_4K,
+	.max_fragment_size	= SZ_32K,
+	.min_fragments		= 1,
+	.max_fragments		= 5,
+	.num_codecs		= 1,
+	.codecs			= {
+		SND_AUDIOCODEC_MP3,
+	},
+};
+
+const struct snd_soc_dai_ops abox_compr_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
+/**
+ * abox_pcm_dev_request_ipc - Send IPC to SoC via abox_ipc_generic
+ * @data: ABOX PCM platform data
+ * @msg: IPC message structure
+ * @sync: Whether IPC is synchronous
+ * @ipc_ret: Return payload
+ *
+ * Thin wrapper around abox_ipc_generic_request_xfer() for message passing to ADSP.
+ */
+static int abox_pcm_dev_request_ipc(struct abox_platform_data *data,
+				struct _abox_inter_ipc_msg *msg,
+				bool sync,
+				struct __abox_inter_ipc_ret *ipc_ret)
+{
+	return abox_ipc_generic_request_xfer(msg->ipcid, msg, sync, ipc_ret, data->adsp);
+}
+
+static int abox_pcm_dev_request_soc_ioctl(struct device *pcm_dev,
+					enum abox_soc_ioctl_cmd cmd, void *data)
+{
+	struct device *generic_dev = pcm_dev->parent;
+
+	return abox_generic_request_soc_ioctl(generic_dev, cmd, data);
+}
+
+static void abox_pcm_dev_update_name(struct device *pcm_dev)
+{
+	struct abox_platform_data *pcm_data = dev_get_drvdata(pcm_dev);
+	int ret;
+
+	ret = snprintf(pcm_data->name, DEFAULT_STR_SIZE - 1, "PCM%d %s", pcm_data->id,
+		PCM_STREAM_STR(pcm_data->stream_type));
+	if (ret >= (DEFAULT_STR_SIZE - 1))
+		dev_warn(pcm_dev, "%s(%d) Buffer truncated (needed %d bytes)\n", __func__,
+			__LINE__, ret);
+}
+
+/*
+ * This function returns formatted SoC timer string.
+ * Though it uses a static buffer, this is only used for debug logs
+ * and called sequentially, so there's no practical concurrency issue.
+ */
+static char *abox_pcm_dev_get_soc_time(struct device *pcm_dev)
+{
+	static char soc_time[DEFAULT_STR_SIZE];
+
+	if (!pcm_dev)
+		return soc_time;
+
+	memset(soc_time, 0, DEFAULT_STR_SIZE);
+	abox_pcm_dev_request_soc_ioctl(pcm_dev, ABOX_SOC_IOCTL_GET_SOC_TIMER, soc_time);
+
+	return soc_time;
+}
+
+static struct abox_platform_dma_info *abox_pcm_dev_find_dma_info(struct device *pcm_dev,
+								int dma_id)
+{
+	struct abox_platform_data *data;
+	struct abox_platform_dma_info *dma_info;
+
+	data = dev_get_drvdata(pcm_dev);
+	if (!data)
+		return NULL;
+
+	list_for_each_entry(dma_info, &data->dma_list_head, list) {
+		if (dma_info->dma_id == dma_id)
+			return dma_info;
+	}
+	return NULL;
+}
+
+static struct snd_soc_dapm_widget *abox_pcm_dev_find_widget(struct device *pcm_dev,
+							char *widget_name)
+{
+	struct abox_platform_data *data = dev_get_drvdata(pcm_dev);
+	int i;
+
+	for (i = 0; i < data->cmpnt_drv->num_dapm_widgets; i++) {
+		const struct snd_soc_dapm_widget *widget = &data->cmpnt_drv->dapm_widgets[i];
+
+		if (!strcmp(widget->name, widget_name))
+			return (struct snd_soc_dapm_widget *)widget;
+	}
+	return NULL;
+}
+
+static struct snd_kcontrol_new *abox_pcm_dev_find_kcontrol(struct device *pcm_dev,
+							struct snd_soc_dapm_widget *widget,
+							char *kcontrol_name)
+{
+	int i;
+
+	for (i = 0; i < widget->num_kcontrols; i++) {
+		const struct snd_kcontrol_new *kctl = &widget->kcontrol_news[i];
+
+		if (!kctl)
+			continue;
+		if (!strcmp(kctl->name, kcontrol_name))
+			return (struct snd_kcontrol_new *)kctl;
+	}
+	return NULL;
+}
+
+/* Compose full control name with PCM ID prefix. */
+static int abox_pcm_dev_strcat_with_prefix_name(struct device *pcm_dev,
+						char *dst, const char *src)
+{
+	struct abox_platform_data *data = dev_get_drvdata(pcm_dev);
+
+	if (data->stream_type == SNDRV_PCM_STREAM_PLAYBACK)
+		return snprintf(dst, DEFAULT_STR_SIZE - 1, "PCM%dp %s", data->id, src);
+	else
+		return snprintf(dst, DEFAULT_STR_SIZE - 1, "PCM%dc %s", data->id, src);
+}
+
+/*
+ * DMA status read from IP SFR via ioctl
+ *
+ * Return DMA IP status read via ioctl.
+ * Values are IP-specific and typically:
+ * 0: idle, 1: running, others: error state
+ */
+unsigned int abox_pcm_dev_status(struct device *pcm_dev)
+{
+	struct abox_platform_data *data;
+	struct abox_platform_dma_info *dma_info;
+	unsigned int dma_status;
+	int dma_id;
+
+	data = dev_get_drvdata(pcm_dev);
+	if (!data) {
+		dev_err(pcm_dev, "%s(%d) PCM Drv Data is not ready\n", __func__, __LINE__);
+		return 0;
+	}
+	dma_id = data->dma_id;
+	if (dma_id < 0) {
+		dev_err(pcm_dev, "%s(%d) DMA is not connected\n", __func__, __LINE__);
+		return 0;
+	}
+	dma_info = abox_pcm_dev_find_dma_info(pcm_dev, dma_id);
+	if (!dma_info) {
+		dev_err(pcm_dev, "%s(%d) Can't find DMA%d Info.\n", __func__, __LINE__, dma_id);
+		return 0;
+	}
+	if (!dma_info->dma_ioctl) {
+		dev_err(pcm_dev, "%s(%d) DMA%d Ioctl is not ready\n", __func__, __LINE__, dma_id);
+		return 0;
+	}
+	dma_status = dma_info->dma_ioctl(dma_info->dma_dev, ABOX_DMA_IOCTL_GET_DMA_STATUS, NULL);
+
+	return dma_status;
+}
+
+static int abox_pcm_dev_call_solution_ops(struct device *dev,
+	enum abox_solution_ops_type ops_type, int cmd, void *data)
+{
+	struct abox_platform_data *pcm_data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = abox_solution_mgr_ops(dev, ABOX_SOL_SW, ops_type, cmd, data);
+	if (ret < 0)
+		return ret;
+	if (pcm_data->dma_id >= 0) {
+		struct abox_platform_dma_info *dma_info =
+			abox_pcm_dev_find_dma_info(dev, pcm_data->dma_id);
+
+		if (!dma_info)
+			return -EINVAL;
+
+		ret = abox_solution_mgr_ops(dma_info->dma_dev, ABOX_SOL_HW, ops_type, cmd, data);
+		if (ret < 0)
+			return ret;
+	}
+	return ret;
+}
+
+/*
+ * Sends IPC messages to the ADSP (SoC-side) to notify state transitions.
+ * The ADSP performs DMA initialization, configuration, start, or stop
+ * depending on the current ALSA PCM state.
+ *
+ * This enables a clear separation between the host (control plane)
+ * and the SoC (data plane) via a platform-agnostic IPC interface.
+ */
+
+/*
+ * Sends IPC messages to the ADSP to configure DMA buffer and audio format.
+ * This function corresponds to the ALSA PCM hw_params() stage.
+ */
+static int abox_pcm_dev_hw_params(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct device *dev = component->dev;
+	struct abox_platform_data *data = dev_get_drvdata(dev);
+	struct _abox_inter_ipc_msg msg = {0, };
+	struct inter_ipc_pcmtask_msg *pcmtask_msg = &msg.msg.pcmtask;
+	int id = data->id;
+	int ret;
+	int stream_type = substream->stream;
+	long long period_time;
+	unsigned int sample_rate;
+	unsigned int bit_depth;
+	unsigned int channels;
+	unsigned int period_bytes;
+	unsigned int period_cnt;
+
+	abox_pcm_dev_request_soc_ioctl(dev, ABOX_SOC_IOCTL_CHECK_TIME_MUTEX, (void *)__func__);
+	if (data->pcm_dbg_log.set_kernel_pcm_log & FUNC_LOG)
+		dev_info(dev, "%s %s%s : DMA %d ADSP:%u\n", __func__,
+			abox_pcm_dev_get_soc_time(dev), data->name, data->dma_id, data->adsp);
+
+	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
+	if (ret < 0) {
+		dev_err(dev, "Memory allocation failed(size:%u)\n", params_buffer_bytes(params));
+		return ret;
+	}
+
+	sample_rate = params_rate(params);
+	bit_depth = params_width(params);
+	channels = params_channels(params);
+	period_bytes = params_period_bytes(params);
+	period_cnt = params_periods(params);
+
+	msg.ipcid = (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ?
+		INTER_IPC_PCMPLAYBACK : INTER_IPC_PCMCAPTURE;
+	msg.task_id = pcmtask_msg->pcm_device_id = id;
+	pcmtask_msg->msgtype = INTER_PCM_SET_BUFFER;
+
+	pcmtask_msg->param.setbuff.phyaddr = substream->dma_buffer.addr;
+	pcmtask_msg->param.setbuff.size = period_bytes;
+	pcmtask_msg->param.setbuff.count = period_cnt;
+
+	ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+	if (ret < 0)
+		return ret;
+
+	pcmtask_msg->msgtype = INTER_PCM_PLTDAI_HW_PARAMS;
+	pcmtask_msg->param.hw_params.sample_rate = sample_rate;
+	pcmtask_msg->param.hw_params.bit_depth = bit_depth;
+	pcmtask_msg->param.hw_params.channels = channels;
+
+	ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = abox_pcm_dev_call_solution_ops(dev, ABOX_SOL_HW_PARAM, 0, substream);
+	if (ret < 0) {
+		dev_err(dev, "Solution HW PARAM Failed ret:%d\n", ret);
+		return ret;
+	}
+
+	period_time = GET_PERIOD_TIME(bit_depth, channels, sample_rate, period_bytes);
+	abox_pcm_dev_request_soc_ioctl(dev, ABOX_SOC_IOCTL_SET_PERF_PERIOD, params);
+
+	return 0;
+}
+
+/*
+ * Sends IPC messages to the ADSP (SoC-side) to notify state transitions.
+ * The ADSP performs DMA initialization, configuration, start, or stop
+ * depending on the current ALSA PCM state.
+ *
+ * This enables a clear separation between the host (control plane)
+ * and the SoC (data plane) via a platform-agnostic IPC interface.
+ */
+
+/*
+ * Informs the ADSP to release any DMA or internal resources allocated
+ * during the hw_params stage.
+ *
+ * This function corresponds to the ALSA PCM hw_free() stage.
+ */
+static int abox_pcm_dev_hw_free(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
+{
+	struct device *dev = component->dev;
+	struct abox_platform_data *data = dev_get_drvdata(dev);
+	struct _abox_inter_ipc_msg msg = {0, };
+	struct inter_ipc_pcmtask_msg *pcmtask_msg = &msg.msg.pcmtask;
+	int id = data->id;
+	int stream_type = substream->stream;
+	int ret;
+
+	if (data->pcm_dbg_log.set_kernel_pcm_log & FUNC_LOG)
+		dev_info(dev, "%s %s%s : DMA %d ADSP:%u\n", __func__,
+			abox_pcm_dev_get_soc_time(dev),
+			data->name, data->dma_id, data->adsp);
+
+	if (substream->runtime->state == SNDRV_PCM_STATE_DISCONNECTED) {
+		dev_err(dev, "%s[%d] DMA is disconnected\n", __func__, id);
+		return -EBADFD;
+	}
+
+	ret = abox_pcm_dev_call_solution_ops(dev, ABOX_SOL_HW_FREE, 0, substream);
+	if (ret < 0) {
+		dev_err(dev, "Solution HW FREE Failed ret:%d\n", ret);
+		return ret;
+	}
+
+	msg.ipcid = (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ?
+		INTER_IPC_PCMPLAYBACK : INTER_IPC_PCMCAPTURE;
+	pcmtask_msg->msgtype = INTER_PCM_PLTDAI_HW_FREE;
+	msg.task_id = pcmtask_msg->pcm_device_id = id;
+	ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+	if (ret < 0) {
+		dev_err(dev, "abox_pcm_dev_request_ipc failed : %d\n", ret);
+		return ret;
+	}
+
+	return snd_pcm_lib_free_pages(substream);
+}
+
+/*
+ * Sends IPC messages to the ADSP (SoC-side) to notify state transitions.
+ * The ADSP performs DMA initialization, configuration, start, or stop
+ * depending on the current ALSA PCM state.
+ *
+ * This enables a clear separation between the host (control plane)
+ * and the SoC (data plane) via a platform-agnostic IPC interface.
+ */
+
+/*
+ * Notifies the ADSP that the PCM stream is ready for playback or capture.
+ * This allows the ADSP to prepare its internal state and initialize
+ * runtime structures before actual DMA trigger.
+ *
+ * This function corresponds to the ALSA PCM prepare() stage.
+ */
+static int abox_pcm_dev_prepare(struct snd_soc_component *component,
+	struct snd_pcm_substream *substream)
+{
+	struct device *dev = component->dev;
+	struct abox_platform_data *data = dev_get_drvdata(dev);
+	struct _abox_inter_ipc_msg msg = {0, };
+	struct inter_ipc_pcmtask_msg *pcmtask_msg = &msg.msg.pcmtask;
+	int id = data->id;
+	int stream_type = substream->stream;
+	int ret;
+
+	data->pointer = substream->dma_buffer.addr;
+
+	if (data->pcm_dbg_log.set_kernel_pcm_log & FUNC_LOG)
+		dev_info(dev, "%s %s%s : DMA %d ADSP:%u data->pointer=%u\n",
+			__func__, abox_pcm_dev_get_soc_time(dev), data->name, data->dma_id,
+			data->adsp, data->pointer);
+
+	ret = abox_pcm_dev_call_solution_ops(dev, ABOX_SOL_PREPARE, 0, substream);
+	if (ret < 0) {
+		dev_err(dev, "Solution Prepare Failed ret:%d\n", ret);
+		return ret;
+	}
+
+	msg.ipcid = (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ?
+		INTER_IPC_PCMPLAYBACK : INTER_IPC_PCMCAPTURE;
+	pcmtask_msg->msgtype = INTER_PCM_PLTDAI_PREPARE;
+	msg.task_id = pcmtask_msg->pcm_device_id = id;
+	ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+
+	return ret;
+}
+
+/*
+ * Sends IPC messages to the ADSP (SoC-side) to notify state transitions.
+ * The ADSP performs DMA initialization, configuration, start, or stop
+ * depending on the current ALSA PCM state.
+ *
+ * This enables a clear separation between the host (control plane)
+ * and the SoC (data plane) via a platform-agnostic IPC interface.
+ */
+
+/*
+ * Sends a trigger command (START, STOP, etc.) to the ADSP over IPC.
+ * The ADSP starts or stops the DMA engine and related audio processing blocks
+ * based on the trigger type.
+ *
+ * This function corresponds to the ALSA PCM trigger() stage.
+ */
+static int abox_pcm_dev_trigger(struct snd_soc_component *component,
+	struct snd_pcm_substream *substream, int cmd)
+{
+	struct device *dev = component->dev;
+	struct abox_platform_data *data = dev_get_drvdata(dev);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct _abox_inter_ipc_msg msg = {0, };
+	struct inter_ipc_pcmtask_msg *pcmtask_msg = &msg.msg.pcmtask;
+	int id = data->id;
+	int stream_type = substream->stream;
+	int ret;
+
+	abox_pcm_dev_request_soc_ioctl(dev, ABOX_SOC_IOCTL_CHECK_TIME_NO_MUTEX, (void *)__func__);
+	if (data->pcm_dbg_log.set_kernel_pcm_log & FUNC_LOG)
+		dev_info(dev, "%s %s%s : DMA %d ADSP:%u CMD : %d\n",
+			__func__, abox_pcm_dev_get_soc_time(dev), data->name, data->dma_id,
+			data->adsp, cmd);
+
+	msg.ipcid = (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ?
+		INTER_IPC_PCMPLAYBACK : INTER_IPC_PCMCAPTURE;
+	pcmtask_msg->msgtype = INTER_PCM_PLTDAI_TRIGGER;
+	msg.task_id = pcmtask_msg->pcm_device_id = id;
+	pcmtask_msg->param.dma_trigger.is_real_dma = !data->solution_mgr_data->pp_enabled;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		data->pcm_dbg_log.lastTime = ktime_get();
+
+		ret = abox_pcm_dev_call_solution_ops(dev, ABOX_SOL_TRIGGER, cmd, substream);
+		if (ret < 0) {
+			dev_err(dev, "Solution Trigger Failed ret:%d\n", ret);
+			return ret;
+		}
+		pcmtask_msg->param.dma_trigger.trigger = 1;
+		pcmtask_msg->start_threshold = runtime->start_threshold;
+		ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		if (substream->runtime->state == SNDRV_PCM_STATE_DISCONNECTED) {
+			dev_err(dev, "%s[%d] DMA is disconnected\n", __func__, id);
+			return -EBADFD;
+		}
+
+		pcmtask_msg->param.dma_trigger.trigger = 0;
+		ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+/*
+ * Sends IPC messages to the ADSP (SoC-side) to notify state transitions.
+ * The ADSP performs DMA initialization, configuration, start, or stop
+ * depending on the current ALSA PCM state.
+ *
+ * This enables a clear separation between the host (control plane)
+ * and the SoC (data plane) via a platform-agnostic IPC interface.
+ */
+
+/*
+ * Get current DMA pointer for PCM stream.
+ *
+ * Depending on whether the solution manager's post-processing mode
+ * is enabled, the function either reads from the post-process pointer
+ * register or queries the DMA via ioctl interface.
+ *
+ * Returns the number of PCM frames elapsed in the current buffer.
+ */
+static snd_pcm_uframes_t abox_pcm_dev_pointer(struct snd_soc_component *component,
+	struct snd_pcm_substream *substream)
+{
+	struct device *dev = component->dev;
+	struct abox_platform_data *data = dev_get_drvdata(dev);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	int id;
+	ssize_t pointer;
+	unsigned int dma_status;
+	unsigned int buf_status;
+	snd_pcm_sframes_t frames;
+
+	if (!data)
+		return 0;
+	id = data->id;
+
+	if (data->solution_mgr_data->pp_enabled) {
+		pointer = readl(data->pp_pointer_base);
+	} else {
+		struct abox_platform_dma_info *dma_info;
+		int dma_id;
+
+		dma_id = data->dma_id;
+		if (dma_id < 0) {
+			dev_err(dev, "%s(%d) DMA is not connected\n", __func__, __LINE__);
+			return 0;
+		}
+		dma_info = abox_pcm_dev_find_dma_info(dev, dma_id);
+		if (!dma_info) {
+			dev_err(dev, "%s(%d) Can't find DMA%d Info.\n", __func__, __LINE__,
+				dma_id);
+			return 0;
+		}
+		if (!dma_info->dma_ioctl) {
+			dev_err(dev, "%s(%d) DMA%d Ioctl is not ready\n", __func__, __LINE__,
+				dma_id);
+			return 0;
+		}
+		dma_status = dma_info->dma_ioctl(dma_info->dma_dev, ABOX_DMA_IOCTL_GET_DMA_STATUS,
+						NULL);
+		buf_status = dma_info->dma_ioctl(dma_info->dma_dev, ABOX_DMA_IOCTL_GET_BUF_STATUS,
+						NULL);
+		if (dma_status) {
+			ssize_t offset;
+			ssize_t count;
+			ssize_t buffer_bytes;
+			ssize_t period_bytes;
+
+			buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
+			period_bytes = snd_pcm_lib_period_bytes(substream);
+
+			offset = (ssize_t)dma_info->dma_ioctl(dma_info->dma_dev,
+				ABOX_DMA_IOCTL_GET_BUF_OFFSET, &buf_status);
+			count = (ssize_t)dma_info->dma_ioctl(dma_info->dma_dev,
+				ABOX_DMA_IOCTL_GET_BUF_COUNT, &buf_status);
+
+			while ((offset % period_bytes) && (buffer_bytes >= 0)) {
+				buffer_bytes -= period_bytes;
+				if ((buffer_bytes & offset) == offset)
+					offset = buffer_bytes;
+			}
+			pointer = offset + count;
+		} else {
+			pointer = 0;
+		}
+	}
+
+	frames = bytes_to_frames(runtime, pointer);
+
+	if (data->pcm_dbg_log.set_kernel_pcm_log & POINTER_LOG)
+		dev_info(dev, "%s %s: pointer:%zd frames:%ld\n", __func__,
+			data->name, pointer, frames);
+
+	return frames;
+}
+
+/*
+ * Sends IPC messages to the ADSP (SoC-side) to notify state transitions.
+ * The ADSP performs DMA initialization, configuration, start, or stop
+ * depending on the current ALSA PCM state.
+ *
+ * This enables a clear separation between the host (control plane)
+ * and the SoC (data plane) via a platform-agnostic IPC interface.
+ */
+
+/*
+ * ALSA PCM open callback.
+ *
+ * Sets up runtime hardware constraints, associates substream with driver
+ * data, and notifies the ADSP of stream open via IPC message.
+ * Also invokes platform-specific solution manager hooks.
+ */
+static int abox_pcm_dev_open(struct snd_soc_component *component,
+	struct snd_pcm_substream *substream)
+{
+	struct device *dev = component->dev;
+	struct abox_platform_data *data = dev_get_drvdata(dev);
+	struct _abox_inter_ipc_msg msg = {0, };
+	struct inter_ipc_pcmtask_msg *pcmtask_msg = &msg.msg.pcmtask;
+	int id = data->id;
+	int stream_type = substream->stream;
+	int ret;
+
+	abox_pcm_dev_request_soc_ioctl(dev, ABOX_SOC_IOCTL_CHECK_TIME_MUTEX, (void *)__func__);
+
+	if (data->pcm_dbg_log.set_kernel_pcm_log & FUNC_LOG)
+		dev_info(dev, "%s %s%s : DMA %d ADSP:%u\n",
+			__func__, abox_pcm_dev_get_soc_time(dev), data->name, data->dma_id,
+			data->adsp);
+
+	snd_soc_set_runtime_hwparams(substream, data->abox_dma_hardware);
+	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(dev, "%s[%d] Can't set hw_constraint: %d\n", __func__, id, ret);
+		return ret;
+	}
+
+	/*
+	 * `substream` is stored to allow checking the current ALSA stream state
+	 * when the request originates from the SoC (e.g., via IPC), not ALSA core.
+	 * This ensures proper resource handling even outside standard ALSA callbacks.
+	 */
+	data->substream = substream;
+
+	ret = abox_pcm_dev_call_solution_ops(dev, ABOX_SOL_OPEN, 0, substream);
+	if (ret < 0) {
+		dev_err(dev, "Solution Open Failed ret:%d\n", ret);
+		return ret;
+	}
+	msg.ipcid = (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ?
+		INTER_IPC_PCMPLAYBACK : INTER_IPC_PCMCAPTURE;
+	msg.task_id = pcmtask_msg->pcm_device_id = id;
+	pcmtask_msg->msgtype = INTER_PCM_PLTDAI_OPEN;
+	pcmtask_msg->hw_dma_id = data->dma_id;
+	pcmtask_msg->irq_id = data->irq_id;
+	pcmtask_msg->pcm_alsa_id = data->pcm_dev_num;
+	pcmtask_msg->adsp = data->adsp;
+
+	ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+
+	return ret;
+}
+
+
+/*
+ * Sends IPC messages to the ADSP (SoC-side) to notify state transitions.
+ * The ADSP performs DMA initialization, configuration, start, or stop
+ * depending on the current ALSA PCM state.
+ *
+ * This enables a clear separation between the host (control plane)
+ * and the SoC (data plane) via a platform-agnostic IPC interface.
+ */
+
+/*
+ * ALSA PCM close callback.
+ *
+ * Releases all resources previously allocated for the PCM stream.
+ * This includes invoking solution manager shutdown hooks (software and hardware),
+ * clearing the substream reference, and notifying the ADSP (via IPC) to close the stream.
+ *
+ * If the stream has been disconnected (e.g., due to ADSP failure or hotplug),
+ * the function returns with an error to prevent invalid IPC transmission.
+ */
+static int abox_pcm_dev_close(struct snd_soc_component *component,
+	struct snd_pcm_substream *substream)
+{
+	struct device *dev = component->dev;
+	struct abox_platform_data *data = dev_get_drvdata(dev);
+	struct _abox_inter_ipc_msg msg = {0, };
+	struct inter_ipc_pcmtask_msg *pcmtask_msg = &msg.msg.pcmtask;
+	int id = data->id;
+	int stream_type = substream->stream;
+	int ret;
+
+	if (data->pcm_dbg_log.set_kernel_pcm_log & FUNC_LOG)
+		dev_info(dev, "%s %s%s : DMA %d ADSP:%u\n",
+			__func__, abox_pcm_dev_get_soc_time(dev), data->name, data->dma_id,
+			data->adsp);
+
+	/*
+	 * Clear the substream reference.
+	 * This is necessary because some control paths originate from the SoC
+	 * (not ALSA), and this allows state validation and cleanup later.
+	 */
+	data->substream = NULL;
+	if (substream->runtime->state == SNDRV_PCM_STATE_DISCONNECTED) {
+		dev_err(dev, "%s[%d] DMA is disconnected\n", __func__, id);
+		return -EBADFD;
+	}
+
+	ret = abox_pcm_dev_call_solution_ops(dev, ABOX_SOL_CLOSE, 0, substream);
+	if (ret < 0) {
+		dev_err(dev, "Solution Close Failed ret:%d\n", ret);
+		return ret;
+	}
+	msg.ipcid = (stream_type == SNDRV_PCM_STREAM_PLAYBACK) ?
+		INTER_IPC_PCMPLAYBACK : INTER_IPC_PCMCAPTURE;
+	pcmtask_msg->msgtype = INTER_PCM_PLTDAI_CLOSE;
+	msg.task_id = pcmtask_msg->pcm_device_id = id;
+	ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+	if (ret < 0) {
+		dev_err(dev, "%s: Failed to request ipc=%d\n", __func__, ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int abox_pcm_dev_ioctl(struct snd_soc_component *component,
+	struct snd_pcm_substream *substream, unsigned int cmd, void *arg)
+{
+	return snd_pcm_lib_ioctl(substream, cmd, arg);
+}
+
+static int abox_pcm_dev_mmap(struct snd_soc_component *component,
+	struct snd_pcm_substream *substream,
+	struct vm_area_struct *vma)
+{
+	struct device *dev = component->dev;
+	struct abox_platform_data *data = dev_get_drvdata(dev);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	int id = data->id;
+	int stream_type = substream->stream;
+
+	dev_dbg(dev, "%s PCM%d %s : DMA %d\n", __func__, id,
+		PCM_STREAM_STR(stream_type), data->dma_id);
+
+	return dma_mmap_wc(dev, vma, runtime->dma_area, runtime->dma_addr, runtime->dma_bytes);
+}
+
+static void abox_pcm_dev_set_ops(struct snd_soc_component_driver *drv)
+{
+	drv->open		= abox_pcm_dev_open;
+	drv->close		= abox_pcm_dev_close;
+	drv->ioctl		= abox_pcm_dev_ioctl;
+	drv->hw_params		= abox_pcm_dev_hw_params;
+	drv->hw_free		= abox_pcm_dev_hw_free;
+	drv->prepare		= abox_pcm_dev_prepare;
+	drv->trigger		= abox_pcm_dev_trigger;
+	drv->pointer		= abox_pcm_dev_pointer;
+	drv->mmap		= abox_pcm_dev_mmap;
+}
+
+/*
+ * DMA buffer is not allocated here. It is obtained from the SoC side
+ * (runtime allocated or from reserved memory). This driver merely sets it
+ * into the ALSA framework after retrieving it via abox_generic_set_dma_buffer().
+ */
+static int abox_pcm_dev_allocate_dma_buf(struct device *dev, struct snd_pcm_substream *substream)
+{
+	struct abox_platform_data *platform_data = dev_get_drvdata(dev);
+	struct snd_dma_buffer *dma_buf = &substream->dma_buffer;
+	int ret;
+
+	ret = abox_generic_set_dma_buffer(dev);
+	if (ret < 0)
+		return ret;
+
+	memcpy(dma_buf, platform_data->dma_buffer, sizeof(struct snd_dma_buffer));
+	dma_buf->dev.dev = substream->pcm->card->dev;
+
+	return ret;
+}
+
+static int abox_pcm_dev_construct(struct snd_soc_component *component,
+	struct snd_soc_pcm_runtime *runtime)
+{
+	struct snd_pcm *pcm = runtime->pcm;
+	struct device *dev = component->dev;
+	struct abox_platform_data *data = dev_get_drvdata(dev);
+	int ret = 0;
+	int stream_type = data->stream_type;
+	struct snd_pcm_str *stream = &pcm->streams[stream_type];
+	struct snd_pcm_substream *substream = stream->substream;
+
+	ret = abox_pcm_dev_allocate_dma_buf(dev, substream);
+	if (ret < 0) {
+		dev_warn(dev, "Can't get reserved memory (size:%zd)\n",
+			data->abox_dma_hardware->buffer_bytes_max);
+		return -ENOMEM;
+	}
+	/*
+	 * Store runtime->id as `pcm_dev_num`, which uniquely identifies
+	 * the PCM device number under the ALSA card.
+	 * This value is later passed to the SoC (via IPC) for routing decisions.
+	 */
+	data->pcm_dev_num = runtime->id;
+	dev_dbg(dev, "%s:%s ADSP%u dma_buffer.addr=%llx dma_buffer.bytes=%zd buffer_bytes: %zd\n",
+		__func__, data->name, data->adsp, substream->dma_buffer.addr,
+		substream->dma_buffer.bytes, data->abox_dma_hardware->buffer_bytes_max);
+
+	return ret;
+}
+
+static void abox_pcm_dev_destruct(struct snd_soc_component *component,
+	struct snd_pcm *pcm)
+{
+	struct device *dev = component->dev;
+	struct abox_platform_data *data = dev_get_drvdata(dev);
+	struct snd_pcm_str *stream = &pcm->streams[data->stream_type];
+	struct snd_pcm_substream *substream = stream->substream;
+
+	deallocate_dma_memory(dev, substream);
+}
+
+/*
+ * Device Tree match table for abox PCM playback and capture devices.
+ *
+ * This table binds the compatible strings from the Device Tree to
+ * platform-specific driver data used by the abox_pcm_dev driver.
+ * Each entry provides the base DAI driver pointer and the number
+ * of DAIs for either playback or capture.
+ */
+static const struct of_device_id samsung_abox_pcm_dev_match[] = {
+	{
+		.compatible = "samsung,abox-pcm-playback",
+		.data = (void *)&(struct abox_platform_of_data)
+		{
+			.base_dai_drv = abox_pcm_playback_dai_drv,
+			.num_of_dai_drv = ARRAY_SIZE(abox_pcm_playback_dai_drv),
+		},
+	},
+	{
+		.compatible = "samsung,abox-pcm-capture",
+		.data = (void *)&(struct abox_platform_of_data)
+		{
+			.base_dai_drv = abox_pcm_capture_dai_drv,
+			.num_of_dai_drv = ARRAY_SIZE(abox_pcm_capture_dai_drv),
+		},
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, samsung_abox_pcm_dev_match);
+
+static int abox_pcm_dev_cmpnt_probe(struct snd_soc_component *component)
+{
+	struct device *dev = component->dev;
+	struct abox_platform_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	data->cmpnt = component;
+
+	ret = abox_generic_set_pp_pointer(dev);
+	if (ret < 0) {
+		dev_err(dev, "%s Can't Set PP Pointer. ret : %d\n", __func__, ret);
+		return ret;
+	}
+	if (data->pp_pointer_base)
+		dev_info(dev, "%s pp_pointer:%p pp_pointer_phys:%llx\n", __func__,
+			data->pp_pointer_base, data->pp_pointer_phys);
+
+	/* Register component-specific controls (widgets, kcontrols, etc.) */
+	abox_solution_mgr_add_controls(dev, component);
+
+	return 0;
+}
+
+/*
+ * These memory regions were allocated using devm_kzalloc() during PCM device probe.
+ * They must be explicitly freed here to ensure proper resource cleanup,
+ * especially in rebind or module-unload scenarios.
+ */
+static void abox_pcm_dev_cmpnt_remove(struct snd_soc_component *component)
+{
+	struct device *dev = component->dev;
+	struct abox_platform_data *data = dev_get_drvdata(dev);
+
+	if (data->plat_dapm_widgets)
+		devm_kfree(dev, data->plat_dapm_widgets);
+
+	if (data->plat_kcontrol) {
+		if (data->plat_kcontrol->private_value)
+			devm_kfree(dev,
+				(void *)data->plat_kcontrol->private_value);
+		devm_kfree(dev, data->plat_kcontrol);
+	}
+}
+
+static int abox_pcm_dev_compr_dma_set(struct snd_soc_component *component,
+	struct snd_compr_stream *stream)
+{
+	struct device *dev;
+	struct abox_platform_data *data;
+	struct snd_dma_buffer *dma_buf;
+	struct snd_soc_pcm_runtime *runtime;
+	int ret;
+
+	if (!component || !(component->dev))
+		return -EINVAL;
+
+	dev = component->dev;
+	data = dev_get_drvdata(dev);
+
+	if (!data || !stream) {
+		dev_err(dev, "%s: No data/stream\n", __func__);
+		return -EINVAL;
+	}
+
+	dma_buf = &stream->dma_buffer;
+	memcpy(dma_buf, data->dma_buffer, sizeof(struct snd_dma_buffer));
+	dma_buf->dev.dev = stream->device->card->dev;
+
+	runtime = stream->private_data;
+	data->pcm_dev_num = runtime->id;
+	dev_dbg(dev, "%s:[%d] dma_buffer.addr=%llx dma_buffer.bytes=%zd buffer_bytes: %zd\n",
+		__func__, data->id, stream->dma_buffer.addr, stream->dma_buffer.bytes,
+		data->abox_dma_hardware->buffer_bytes_max);
+
+	return ret;
+}
+
+/*
+ * ALSA compressed stream open callback.
+ *
+ * Initializes the compressed stream by setting up DMA context,
+ * resetting byte counters, and invoking solution manager hooks
+ * for software and hardware setup. Also sends an IPC to the ADSP
+ * to notify the stream open event and relevant configuration.
+ *
+ * All necessary metadata (DMA ID, IRQ ID, ALSA ID, stream direction)
+ * is included in the IPC payload.
+ */
+static int abox_pcm_dev_compr_open(struct snd_soc_component *component,
+			struct snd_compr_stream *cstream)
+{
+	struct device *dev;
+	struct abox_platform_data *data;
+	struct _abox_inter_ipc_msg msg = {0, };
+	struct inter_ipc_offloadtask_msg *offloadtask_msg = &msg.msg.offload_task;
+	int ret;
+
+	if (!component || !(component->dev))
+		return -EINVAL;
+
+	dev = component->dev;
+	data = dev_get_drvdata(dev);
+	if (!data) {
+		dev_err(dev, "%s: No data\n", __func__);
+		return -EINVAL;
+	}
+	abox_pcm_dev_request_soc_ioctl(dev, ABOX_SOC_IOCTL_CHECK_TIME_MUTEX, (void *)__func__);
+
+	data->compr_data.cstream = cstream;
+	data->compr_data.encoded_total_bytes  = 0;
+	data->compr_data.decoded_total_bytes  = 0;
+
+	abox_pcm_dev_compr_dma_set(component, cstream);
+
+	ret = abox_pcm_dev_call_solution_ops(dev, ABOX_SOL_OPEN, 0, NULL);
+	if (ret < 0) {
+		dev_err(dev, "Solution Open Failed ret:%d\n", ret);
+		return ret;
+	}
+
+	msg.ipcid = INTER_IPC_OFFLOAD;
+	msg.task_id = offloadtask_msg->pcm_device_id = data->id;
+	offloadtask_msg->msgtype = OFFLOAD_OPEN;
+	offloadtask_msg->hw_dma_id = data->dma_id;
+	offloadtask_msg->irq_id = data->irq_id;
+	offloadtask_msg->pcm_alsa_id = data->pcm_dev_num;
+	offloadtask_msg->direction = cstream->direction;
+
+	ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+
+	return ret;
+}
+
+/*
+ * ALSA compressed stream free callback.
+ *
+ * Cleans up the compressed stream by releasing any resources allocated
+ * during open or parameter setup. This includes invoking software and
+ * hardware shutdown routines via solution manager, as well as notifying
+ * the ADSP via IPC to terminate the stream.
+ *
+ * Sets `runtime->buffer = NULL` to ensure no stale buffer is referenced.
+ */
+static int abox_pcm_dev_compr_free(struct snd_soc_component *component,
+			struct snd_compr_stream *stream)
+{
+	struct device *dev;
+	struct abox_platform_data *data;
+	struct _abox_inter_ipc_msg msg = {0, };
+	struct inter_ipc_offloadtask_msg *offloadtask_msg = &msg.msg.offload_task;
+	int ret;
+
+	if (!component || !(component->dev))
+		return -EINVAL;
+
+	dev = component->dev;
+	data = dev_get_drvdata(dev);
+
+	if (!data) {
+		dev_err(dev, "%s: No data\n", __func__);
+		return -EINVAL;
+	}
+
+	if (!stream->runtime)
+		return -EINVAL;
+	stream->runtime->buffer = NULL;
+
+	ret = abox_pcm_dev_call_solution_ops(dev, ABOX_SOL_HW_FREE, 0, NULL);
+	if (ret < 0) {
+		dev_err(dev, "Solution Close Failed ret:%d\n", ret);
+		return ret;
+	}
+
+	msg.ipcid = INTER_IPC_OFFLOAD;
+	msg.task_id = offloadtask_msg->pcm_device_id = data->id;
+	offloadtask_msg->msgtype = OFFLOAD_CLOSE;
+	offloadtask_msg->hw_dma_id = data->dma_id;
+	offloadtask_msg->irq_id = data->irq_id;
+	offloadtask_msg->pcm_alsa_id = data->pcm_dev_num;
+	offloadtask_msg->direction = stream->direction;
+
+	ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+
+	return ret;
+}
+
+/*
+ * ALSA compressed stream set_params callback.
+ *
+ * Receives codec configuration parameters from user space and prepares
+ * the internal state for offload playback. It performs the following steps:
+ *
+ * 1. Parses codec-specific fields such as sample rate, bit rate,
+ *    input/output channels, and stores them into `compr_data.codec`.
+ *
+ * 2. Assigns the preallocated DMA buffer (from SoC/reserved memory)
+ *    to the runtime structure for playback.
+ *
+ * 3. Validates that the assigned buffer is large enough for the
+ *    requested buffer size. If not, it returns -ENOMEM.
+ *
+ * 4. Sends an IPC message to the ADSP to inform it of the parameters
+ *    via the `OFFLOAD_SETPARAM` message.
+ *
+ * 5. Invokes software and hardware solution manager hooks to complete
+ *    codec configuration and DMA hardware setup.
+ *
+ * Note:
+ *  - This function is mandatory before issuing any trigger commands.
+ *  - ALSA does not validate the codec type; unknown types must be handled here.
+ *  - The buffer address is passed to ADSP via IPC for direct access.
+ */
+static int abox_pcm_dev_compr_set_params(struct snd_soc_component *component,
+				struct snd_compr_stream *cstream, struct snd_compr_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_compr_runtime *runtime;
+	struct device *dev;
+	struct abox_platform_data *data;
+	struct snd_pcm_str *stream;
+	struct snd_pcm *pcm;
+	struct snd_pcm_substream *substream;
+	struct _abox_inter_ipc_msg msg = {0, };
+	struct inter_ipc_offloadtask_msg *offload_task_msg = &msg.msg.offload_task;
+	int ret;
+
+	if (!component || !(component->dev) || !cstream || !params)
+		return -EINVAL;
+
+	rtd = cstream->private_data;
+	runtime = cstream->runtime;
+	dev = component->dev;
+	data = dev_get_drvdata(dev);
+
+	if (!rtd) {
+		dev_err(dev, "%s: No rtd\n", __func__);
+		return -EINVAL;
+	}
+	pcm = rtd->pcm;
+	stream = &pcm->streams[SNDRV_PCM_STREAM_PLAYBACK];
+	substream = stream->substream;
+
+	if (!data || !runtime) {
+		dev_err(dev, "%s: No data/runtime\n", __func__);
+		return -EINVAL;
+	}
+	data->compr_data.codec = &params->codec;
+
+	switch (data->compr_data.codec->id) {
+	case SND_AUDIOCODEC_MP3:
+	case SND_AUDIOCODEC_AAC:
+	case SND_AUDIOCODEC_FLAC:
+		dev_dbg(dev, "%s: codec id: %d\n", __func__, data->compr_data.codec->id);
+		break;
+	default:
+		dev_err(dev, "%s: unknown codec id: %d\n", __func__, data->compr_data.codec->id);
+		break;
+	}
+	/* Set runtime buffer to pre-allocated DMA area from SoC */
+	runtime->buffer = (void *)data->dma_buffer->area;
+	if (runtime->buffer_size > data->dma_buffer->bytes) {
+		dev_err(dev, "allocated buffer size is smaller than requested(%llu > %zu)\n",
+				runtime->buffer_size, data->dma_buffer->bytes);
+		return -ENOMEM;
+	}
+	msg.ipcid = INTER_IPC_OFFLOAD;
+	msg.task_id = offload_task_msg->pcm_device_id = data->id;
+	offload_task_msg->msgtype = OFFLOAD_SETPARAM;
+	offload_task_msg->hw_dma_id = data->dma_id;
+	offload_task_msg->irq_id = data->irq_id;
+	offload_task_msg->codec_id = data->compr_data.codec->id;
+	offload_task_msg->direction = cstream->direction;
+	offload_task_msg->param.setparam.sample_rate = data->compr_data.codec->sample_rate;
+	offload_task_msg->param.setparam.channels = data->compr_data.codec->ch_out;
+	offload_task_msg->param.setparam.chunk_size = runtime->buffer_size;
+	offload_task_msg->param.setparam.phyaddr = cstream->dma_buffer.addr;
+
+	ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = abox_pcm_dev_call_solution_ops(dev, ABOX_SOL_HW_PARAM, 0, substream);
+	if (ret < 0) {
+		dev_err(dev, "Solution HW PARAM Failed ret:%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int abox_pcm_dev_compr_set_metadata(struct snd_soc_component *component,
+			struct snd_compr_stream *stream, struct snd_compr_metadata *metadata)
+{
+	return 0;
+}
+
+static int abox_pcm_dev_compr_get_caps(struct snd_soc_component *component,
+			struct snd_compr_stream *stream, struct snd_compr_caps *caps)
+{
+	/* Returns the list of audio formats supported */
+	struct device *dev;
+	struct abox_platform_data *data;
+
+	if (!component || !(component->dev))
+		return -EINVAL;
+
+	dev = component->dev;
+	data = dev_get_drvdata(dev);
+
+	if (!data) {
+		dev_err(dev, "%s: No data\n", __func__);
+		return -EINVAL;
+	}
+
+	memcpy(caps, &abox_pcm_dev_compr_caps, sizeof(*caps));
+
+	return 0;
+}
+
+/*
+ * ALSA compressed stream trigger callback.
+ *
+ * Handles runtime control commands such as START, STOP, PAUSE, etc.
+ * Based on the trigger type, it performs:
+ *  - Solution manager callbacks for SW/HW trigger execution
+ *  - IPC notifications to ADSP to reflect state changes
+ *
+ * For START-type triggers, it includes full stream configuration
+ * such as DMA and IRQ IDs, and signals the start of decoding.
+ *
+ * For STOP-type triggers, it resets internal counters and issues a STOP
+ * IPC message to the DSP.
+ *
+ * Note: Only specific commands result in action; others (e.g., RESUME)
+ * are handled as no-ops unless explicitly required.
+ */
+static int abox_pcm_dev_compr_trigger(struct snd_soc_component *component,
+			struct snd_compr_stream *stream, int cmd)
+{
+	struct device *dev;
+	struct abox_platform_data *data;
+	int id;
+	struct _abox_inter_ipc_msg msg = {0, };
+	struct inter_ipc_offloadtask_msg *offloadtask_msg = &msg.msg.offload_task;
+	int ret;
+
+	if (!component || !(component->dev))
+		return -EINVAL;
+
+	dev = component->dev;
+	data = dev_get_drvdata(dev);
+	if (!data) {
+		dev_err(dev, "%s: No data\n", __func__);
+		return -EINVAL;
+	}
+
+	id = data->id;
+	msg.ipcid = INTER_IPC_OFFLOAD;
+	msg.task_id = offloadtask_msg->pcm_device_id = id;
+	offloadtask_msg->param.dma_trigger.is_real_dma = !data->solution_mgr_data->pp_enabled;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SND_COMPR_TRIGGER_NEXT_TRACK:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = abox_pcm_dev_call_solution_ops(dev, ABOX_SOL_TRIGGER, cmd, NULL);
+		if (ret < 0) {
+			dev_err(dev, "Solution Trigger Failed ret:%d\n", ret);
+			return ret;
+		}
+		offloadtask_msg->msgtype = offload_start;
+		offloadtask_msg->hw_dma_id = data->dma_id;
+		offloadtask_msg->irq_id = data->irq_id;
+		offloadtask_msg->direction = stream->direction;
+		offloadtask_msg->param.dma_trigger.trigger = 1;
+		ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+		data->compr_data.encoded_total_bytes  = 0;
+		data->compr_data.decoded_total_bytes  = 0;
+		offloadtask_msg->msgtype = OFFLOAD_STOP;
+		offloadtask_msg->hw_dma_id = data->dma_id;
+		offloadtask_msg->irq_id = data->irq_id;
+		offloadtask_msg->direction = stream->direction;
+		offloadtask_msg->param.dma_trigger.trigger = 0;
+		ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		break;
+	case SNDRV_PCM_TRIGGER_RESUME:
+		break;
+	case SND_COMPR_TRIGGER_DRAIN:
+	case SND_COMPR_TRIGGER_PARTIAL_DRAIN:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int abox_pcm_dev_compr_pointer(struct snd_soc_component *component,
+		struct snd_compr_stream *stream, struct snd_compr_tstamp *tstamp)
+{
+	struct device *dev;
+	struct abox_platform_data *data;
+
+	if (!component || !(component->dev))
+		return -EINVAL;
+
+	dev = component->dev;
+	data = dev_get_drvdata(dev);
+
+	if (!data) {
+		dev_err(dev, "%s: No data\n", __func__);
+		return -EINVAL;
+	}
+
+	//copied_total: Total number of bytes copied from/to ring buffer to/by DSP
+	tstamp->copied_total = data->compr_data.decoded_total_bytes;
+	tstamp->sampling_rate = data->compr_data.codec->sample_rate;
+	tstamp->pcm_io_frames = data->compr_data.pcm_io_frames;
+
+	return 0;
+}
+
+static int abox_pcm_dev_compr_ack(struct snd_soc_component *component,
+			struct snd_compr_stream *stream, size_t bytes)
+{
+	struct device *dev;
+	struct abox_platform_data *data;
+	struct snd_compr_runtime *runtime;
+	u64 app_pointer;
+	int ret;
+	struct _abox_inter_ipc_msg msg = {0, };
+	struct inter_ipc_offloadtask_msg *offloadtask_msg = &msg.msg.offload_task;
+
+	if (!component || !(component->dev))
+		return -EINVAL;
+
+	dev = component->dev;
+	data = dev_get_drvdata(dev);
+	if (!data) {
+		dev_err(dev, "%s: No data\n", __func__);
+		return -EINVAL;
+	}
+
+	runtime = stream->runtime;
+
+	// Send offset and copied size
+	msg.ipcid = INTER_IPC_OFFLOAD;
+	msg.task_id = offloadtask_msg->pcm_device_id = data->id;
+
+	// offset
+	app_pointer = div64_u64(runtime->total_bytes_available, runtime->buffer_size);
+	app_pointer = runtime->total_bytes_available - (app_pointer * runtime->buffer_size);
+	offloadtask_msg->param.write.buff = app_pointer;
+	// size
+	offloadtask_msg->param.write.size = bytes;
+	offloadtask_msg->msgtype = offload_write;
+	offloadtask_msg->hw_dma_id = data->dma_id;
+	offloadtask_msg->irq_id = data->irq_id;
+	offloadtask_msg->pcm_alsa_id = data->pcm_dev_num;
+	offloadtask_msg->direction = stream->direction;
+
+	ret = abox_pcm_dev_request_ipc(data, &msg, true, NULL);
+
+	return ret;
+}
+
+static int abox_pcm_dev_compr_mmap(struct snd_soc_component *component,
+		    struct snd_compr_stream *stream, struct vm_area_struct *vma)
+{
+	return 0;
+}
+
+static int abox_pcm_dev_compr_get_codec_caps(struct snd_soc_component *component,
+				struct snd_compr_stream *stream, struct snd_compr_codec_caps *codec)
+{
+	return 0;
+}
+
+static irqreturn_t abox_pcm_dev_compr_irq_handler(struct device *pcm_dev, int irq_id,
+	struct _abox_inter_ipc_msg *pmsg)
+{
+	struct abox_platform_data *data;
+	struct snd_compr_stream *cstream;
+	int consume_size;
+	struct _abox_inter_ipc_msg *ipc_msg;
+
+
+	data = dev_get_drvdata(pcm_dev);
+	if (!data)
+		return IRQ_HANDLED;
+
+	ipc_msg = (struct _abox_inter_ipc_msg *)pmsg;
+	if (ipc_msg->msg.offload_task.msgtype == offload_write) {
+		consume_size = ipc_msg->msg.offload_task.param.write.size;
+		data->compr_data.pcm_io_frames = ipc_msg->msg.offload_task.param.write.buff;
+	} else
+		return IRQ_HANDLED;
+
+	cstream = data->compr_data.cstream;
+	/*
+	 * If consume_size is 0, it means the DMA engine has stopped on the ADSP side.
+	 * This typically happens at the end of playback when the DSP finishes decoding
+	 * and no more data remains to be consumed.
+	 *
+	 * Since compressed streams are handled entirely by the DSP in offload mode,
+	 * the host must rely on such IRQ notifications to infer playback completion.
+	 * In this case, the ALSA state is explicitly transitioned to PAUSED to reflect
+	 * this condition, as ALSA core does not automatically update the state from
+	 * ADSP-side events.
+	 */
+	if (!consume_size && cstream->runtime->state == SNDRV_PCM_STATE_DRAINING)
+		cstream->runtime->state = SNDRV_PCM_STATE_PAUSED;
+	data->compr_data.decoded_total_bytes += consume_size;
+	snd_compr_fragment_elapsed(cstream);
+
+	return IRQ_HANDLED;
+}
+
+static const struct snd_compress_ops abox_pcm_dev_compress_ops = {
+	.open			= abox_pcm_dev_compr_open,
+	.free			= abox_pcm_dev_compr_free,
+	.set_params		= abox_pcm_dev_compr_set_params,
+	.set_metadata		= abox_pcm_dev_compr_set_metadata,
+	.get_caps		= abox_pcm_dev_compr_get_caps,
+	.trigger		= abox_pcm_dev_compr_trigger,
+	.pointer		= abox_pcm_dev_compr_pointer,
+	.copy			= NULL, // use alsa snd_compr_write_data()
+	.mmap			= abox_pcm_dev_compr_mmap,
+	.ack			= abox_pcm_dev_compr_ack,
+	.get_codec_caps		= abox_pcm_dev_compr_get_codec_caps,
+};
+
+static const struct snd_soc_component_driver abox_pcm_dev_base = {
+	.probe		= abox_pcm_dev_cmpnt_probe,
+	.remove		= abox_pcm_dev_cmpnt_remove,
+	.pcm_construct	= abox_pcm_dev_construct,
+	.pcm_destruct	= abox_pcm_dev_destruct,
+	.probe_order	= SND_SOC_COMP_ORDER_LAST,
+};
+
+static int abox_pcm_dev_get_pp_route(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct device *dev = w->dapm->dev;
+	struct abox_platform_data *pcm_data = dev_get_drvdata(dev);
+
+	ucontrol->value.enumerated.item[0] = pcm_data->solution_mgr_data->pp_enabled;
+
+	return 0;
+}
+
+static int abox_pcm_dev_put_pp_route(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	struct snd_soc_dapm_update *update = NULL;
+	struct device *dev = w->dapm->dev;
+	struct abox_platform_data *pcm_data = dev_get_drvdata(dev);
+	unsigned int item = ucontrol->value.enumerated.item[0];
+
+	if (item >= e->items) {
+		dev_err(dev, "%s: Invalid parameter\n", __func__);
+		return -EINVAL;
+	}
+
+	if (!pcm_data->solution_mgr_data) {
+		dev_info(dev, "%s: PP Solution is not ready\n", __func__);
+		return 0;
+	}
+	pcm_data->solution_mgr_data->pp_enabled = item ? true : false;
+	snd_soc_dapm_mux_update_power(w->dapm, kcontrol, item, e, update);
+
+	return 0;
+}
+
+static const char * const pcm_dev_route_texts[] = {
+	"Direct", "PostProcessing",
+};
+static SOC_ENUM_SINGLE_DECL(pcm_dev_route_enum, SND_SOC_NOPM,
+		0, pcm_dev_route_texts);
+static const struct snd_kcontrol_new pcm_dev_route_controls[] = {
+	SOC_DAPM_ENUM_EXT("DEMUX", pcm_dev_route_enum,
+		abox_pcm_dev_get_pp_route,
+		abox_pcm_dev_put_pp_route),
+	SOC_DAPM_ENUM_EXT("MUX", pcm_dev_route_enum,
+		abox_pcm_dev_get_pp_route,
+		abox_pcm_dev_put_pp_route)
+};
+
+static const char * const pcm_dev_backend_route_texts[] = {
+	"DMA", "I2S Dummy",
+};
+static SOC_ENUM_SINGLE_DECL(pcm_dev_backend_route_enum, SND_SOC_NOPM,
+		0, pcm_dev_backend_route_texts);
+static const struct snd_kcontrol_new pcm_dev_backend_route_controls[] = {
+	SOC_DAPM_ENUM("MUX", pcm_dev_backend_route_enum),
+};
+
+static int abox_pcm_dev_add_route_to_dapm(struct device *pcm_dev,
+	struct snd_soc_dapm_route *add_routes, int add_route_cnt)
+{
+	struct abox_platform_data *data = dev_get_drvdata(pcm_dev);
+	struct snd_soc_dapm_context *dapm;
+
+	dev_dbg(pcm_dev, "[%s] %s Add Route to DAPM\n", __func__, data->name);
+
+	dapm = snd_soc_component_get_dapm(data->cmpnt);
+	if (!dapm) {
+		dev_err(pcm_dev, "%s: can't get dapm from component\n", __func__);
+		return -EINVAL;
+	}
+
+	return snd_soc_dapm_add_routes(dapm, add_routes, add_route_cnt);
+}
+
+static int abox_pcm_dev_add_route_to_cmpnt_drv(struct device *pcm_dev,
+	struct snd_soc_dapm_route *add_routes, int add_route_cnt)
+{
+	struct abox_platform_data *data = dev_get_drvdata(pcm_dev);
+	struct snd_soc_dapm_route *cmpnt_routes;
+	const struct snd_soc_dapm_route *tmp_routes;
+	int current_route_cnt = 0;
+	int total_route_cnt = 0;
+
+	current_route_cnt = data->cmpnt_drv->num_dapm_routes;
+	total_route_cnt = current_route_cnt + add_route_cnt;
+
+	cmpnt_routes = devm_kcalloc(pcm_dev, total_route_cnt, sizeof(struct snd_soc_dapm_route),
+		GFP_KERNEL);
+	if (!cmpnt_routes)
+		return -ENOMEM;
+	tmp_routes = data->cmpnt_drv->dapm_routes;
+	memcpy(cmpnt_routes, data->cmpnt_drv->dapm_routes,
+		sizeof(struct snd_soc_dapm_route) * current_route_cnt);
+	memcpy(&cmpnt_routes[current_route_cnt], add_routes,
+		sizeof(struct snd_soc_dapm_route) * add_route_cnt);
+	data->cmpnt_drv->dapm_routes = cmpnt_routes;
+	data->cmpnt_drv->num_dapm_routes = total_route_cnt;
+
+	devm_kfree(pcm_dev, tmp_routes);
+
+	return 0;
+}
+
+static int abox_pcm_dev_add_route(struct device *pcm_dev,
+	struct snd_soc_dapm_route *add_routes, int add_route_cnt)
+{
+	struct abox_platform_data *data = dev_get_drvdata(pcm_dev);
+
+	if (data->cmpnt)
+		return abox_pcm_dev_add_route_to_dapm(pcm_dev, add_routes, add_route_cnt);
+	else
+		return abox_pcm_dev_add_route_to_cmpnt_drv(pcm_dev, add_routes, add_route_cnt);
+}
+
+static struct snd_soc_dapm_route *abox_pcm_dev_allocating_route(struct device *pcm_dev,
+	const struct snd_soc_dapm_route *routes_base, int num_of_routes,
+	int source_id, int control_id, int sink_id)
+{
+	struct snd_soc_dapm_route *routes;
+	int routes_idx;
+
+	routes = devm_kcalloc(pcm_dev, num_of_routes, sizeof(*routes), GFP_KERNEL);
+	if (!routes)
+		return NULL;
+
+	for (routes_idx = 0; routes_idx < num_of_routes; routes_idx++) {
+		routes[routes_idx].source = devm_kasprintf(pcm_dev, GFP_KERNEL,
+			routes_base[routes_idx].source, source_id);
+		routes[routes_idx].control = devm_kasprintf(pcm_dev, GFP_KERNEL,
+			routes_base[routes_idx].control, control_id);
+		routes[routes_idx].sink = devm_kasprintf(pcm_dev, GFP_KERNEL,
+			routes_base[routes_idx].sink, sink_id);
+		dev_dbg(pcm_dev, "%s(%d):[%d] sink[%s] <- control[%s] <- source[%s]\n",
+			__func__, __LINE__, routes_idx,
+			routes[routes_idx].sink,
+			routes[routes_idx].control,
+			routes[routes_idx].source);
+	}
+	return routes;
+}
+
+static int abox_pcm_dev_making_dma_routes(struct device *pcm_dev, int dma_id)
+{
+	struct abox_platform_data *data = dev_get_drvdata(pcm_dev);
+	int num_of_routes;
+	int source_id;
+	int sink_id;
+	int control_id;
+	int ret;
+	const struct snd_soc_dapm_route *dma_routes_base;
+	struct snd_soc_dapm_route *dma_routes;
+	static const struct snd_soc_dapm_route abox_pcm_playback_routes_base[] = {
+		/* sink, control, source */
+		{"RDMA%d",		"RDMA%d",	"PCM%dp RDMA Route"},
+	};
+	static const struct snd_soc_dapm_route abox_pcm_capture_routes_base[] = {
+		/* sink, control, source */
+		{"PCM%dc WDMA Route",	"WDMA%d",	"WDMA%d"},
+	};
+
+	if (data->stream_type == SNDRV_PCM_STREAM_PLAYBACK) {
+		num_of_routes = ARRAY_SIZE(abox_pcm_playback_routes_base);
+		dma_routes_base = abox_pcm_playback_routes_base;
+		source_id = data->id;
+		control_id = sink_id = dma_id;
+	} else {
+		num_of_routes = ARRAY_SIZE(abox_pcm_capture_routes_base);
+		dma_routes_base = abox_pcm_capture_routes_base;
+		sink_id = data->id;
+		control_id = source_id = dma_id;
+	}
+	dma_routes = abox_pcm_dev_allocating_route(pcm_dev, dma_routes_base, num_of_routes,
+		source_id, control_id, sink_id);
+	ret = abox_pcm_dev_add_route(pcm_dev, dma_routes, num_of_routes);
+	if (ret < 0) {
+		dev_err(pcm_dev, "%s: Failed to add dma routes. ret:%d\n", __func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void abox_pcm_dev_making_routes(struct device *dev,
+	struct abox_platform_data *data,
+	struct snd_soc_component_driver *cmpnt)
+{
+	int i;
+	int stream_type = data->stream_type;
+	int pcm_single_routes_size;
+	const struct snd_soc_dapm_route *abox_pcm_single_routes;
+	int num_of_single_routes;
+	static const struct snd_soc_dapm_route abox_pcm_playback_single_routes[] = {
+		/* sink, control, source */
+		/* Playback to PP route */
+		{"PCM%dp PP Route", NULL, "PCM%d Playback"},
+		/* PP Route to PostProcessing */
+		{"PCM%dp PostProcessing", "PostProcessing", "PCM%dp PP Route"},
+		/* PP Route to Backend Route */
+		{"PCM%dp Backend Route", "Direct", "PCM%dp PP Route"},
+		/* PostProcessing to Backend Route */
+		{"PCM%dp Backend Route", NULL, "PCM%dp PostProcessing"},
+		/* Backend Route to I2S Dummy Route */
+		{"PCM%dp I2S Dummy Route", "I2S Dummy", "PCM%dp Backend Route"},
+		/* Backend Route to RDMA Route */
+		{"PCM%dp RDMA Route", "DMA", "PCM%dp Backend Route"},
+	};
+	static const struct snd_soc_dapm_route abox_pcm_capture_single_routes[] = {
+		/* sink, control, source */
+		/* I2S Dummy Route to Backend Route */
+		{"PCM%dc Backend Route", "I2S Dummy", "PCM%dc I2S Dummy Route"},
+		/* WDMA Route to Backend Route */
+		{"PCM%dc Backend Route", "DMA", "PCM%dc WDMA Route"},
+		/* Backend Route to PP Route */
+		{"PCM%dc PP Route", NULL, "PCM%dc Backend Route"},
+		/* PP Route to PCM Capture by pcm_capture_route_texts */
+		{"PCM%d Capture", "Direct", "PCM%dc PP Route"},
+		/* PP Route to PCM PostProcessing */
+		{"PCM%dc PostProcessing", "PostProcessing", "PCM%dc PP Route"},
+		/* PostProcessing to PCM Capture */
+		{"PCM%d Capture", NULL, "PCM%dc PostProcessing"},
+	};
+
+	if (stream_type == SNDRV_PCM_STREAM_PLAYBACK) {
+		num_of_single_routes = ARRAY_SIZE(abox_pcm_playback_single_routes);
+		pcm_single_routes_size = sizeof(abox_pcm_playback_single_routes);
+		abox_pcm_single_routes = abox_pcm_playback_single_routes;
+	} else {
+		num_of_single_routes = ARRAY_SIZE(abox_pcm_capture_single_routes);
+		pcm_single_routes_size = sizeof(abox_pcm_capture_single_routes);
+		abox_pcm_single_routes = abox_pcm_capture_single_routes;
+	}
+
+	data->plat_dapm_routes = devm_kzalloc(dev, pcm_single_routes_size, GFP_KERNEL);
+	if (!data->plat_dapm_routes)
+		return;
+
+	for (i = 0; i < num_of_single_routes; i++) {
+		if (abox_pcm_single_routes[i].sink)
+			data->plat_dapm_routes[i].sink = devm_kasprintf(dev, GFP_KERNEL,
+				abox_pcm_single_routes[i].sink, data->id);
+		if (abox_pcm_single_routes[i].control)
+			data->plat_dapm_routes[i].control = devm_kasprintf(dev, GFP_KERNEL,
+				abox_pcm_single_routes[i].control);
+		if (abox_pcm_single_routes[i].source)
+			data->plat_dapm_routes[i].source = devm_kasprintf(dev, GFP_KERNEL,
+				abox_pcm_single_routes[i].source, data->id);
+
+		dev_dbg(dev, "%s(%d):[%d] sink[%s] <- control[%s] <- source[%s]\n",
+			__func__, __LINE__, i,
+			data->plat_dapm_routes[i].sink,
+			data->plat_dapm_routes[i].control,
+			data->plat_dapm_routes[i].source);
+	}
+
+	cmpnt->dapm_routes = data->plat_dapm_routes;
+	cmpnt->num_dapm_routes = num_of_single_routes;
+}
+
+static int abox_pcm_dev_get_dma_route(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct device *dev = w->dapm->dev;
+	struct abox_platform_data *pcm_data = dev_get_drvdata(dev);
+	const int no_connect = 1;
+
+	ucontrol->value.enumerated.item[0] = pcm_data->dma_id + no_connect;
+
+	return 0;
+}
+
+static int abox_pcm_dev_put_dma_route(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	struct device *dev = w->dapm->dev;
+	struct abox_platform_data *pcm_data = dev_get_drvdata(dev);
+	struct abox_platform_dma_info *dma_info;
+	struct snd_soc_dapm_update *update;
+	unsigned int item = ucontrol->value.enumerated.item[0];
+	const int no_connect = 1;
+
+	if (item >= e->items) {
+		dev_err(dev, "%s: Invalid parameter\n", __func__);
+		return -EINVAL;
+	}
+
+	pcm_data->dma_id = item - no_connect;
+	if (pcm_data->dma_id >= 0) {
+		dma_info = abox_pcm_dev_find_dma_info(dev, pcm_data->dma_id);
+		dma_info->dma_ioctl(dma_info->dma_dev, ABOX_DMA_IOCTL_SET_ADSP_INFO,
+			&pcm_data->adsp);
+	}
+	snd_soc_dapm_mux_update_power(w->dapm, kcontrol, item, e, update);
+
+	return 0;
+}
+
+static const char * const *abox_pcm_dev_making_enum_str(struct device *pcm_dev,
+	int num_of_enum)
+{
+	struct abox_platform_data *pcm_data = dev_get_drvdata(pcm_dev);
+	const char *default_enum[] = {"PCM_OUT", "PCM_IN"};
+	char **enum_str;
+	int index;
+	int stream_type;
+	int ret;
+
+	stream_type = pcm_data->stream_type;
+	/* The default value of Route is NO_CONNECT, not Widgets.
+	 * Therefore, the size of the enum must be one greater than num_of_dma.
+	 */
+	enum_str = devm_kcalloc(pcm_dev, (num_of_enum + 1), sizeof(char *), GFP_KERNEL);
+	if (!enum_str)
+		return NULL;
+
+	for (index = 0; index < (num_of_enum + 1); index++) {
+		enum_str[index] = devm_kzalloc(pcm_dev, DEFAULT_STR_SIZE, GFP_KERNEL);
+		if (!enum_str[index])
+			return NULL;
+		ret = snprintf(enum_str[index], DEFAULT_STR_SIZE - 1, default_enum[stream_type]);
+		if (ret >= (DEFAULT_STR_SIZE - 1))
+			dev_warn(pcm_dev, "%s(%d) Buffer truncated (needed %d bytes)\n", __func__,
+				__LINE__, ret);
+	}
+
+	return (const char * const *)enum_str;
+}
+
+/**
+ * abox_generic_init_soc_route - Initialize route controls for PCM devices
+ * @soc_dev: Device pointer of the SoC master driver
+ *
+ * This function is called during the probe of the SoC master driver.
+ * It initializes ABOX frontend PCM devices by informing them of the
+ * number of DMA engines (RDMA or WDMA) available for each stream type
+ * (playback or capture). This allows each PCM device to pre-create
+ * the DAPM route kcontrols (e.g., DMA MUX) even before DMA devices
+ * are actually probed and attached.
+ *
+ * Later, when individual DMA devices are registered and attached,
+ * the corresponding mux controls will be dynamically updated to reflect
+ * the actually available routes.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static struct snd_kcontrol_new *abox_pcm_dev_making_dma_kcontrol(struct device *pcm_dev,
+	unsigned int num_of_dma, int *num_of_kcontrols)
+{
+	const char * const *enum_dma_str = abox_pcm_dev_making_enum_str(pcm_dev, num_of_dma);
+	struct soc_enum dma_route_enum_base =
+		SOC_ENUM_DOUBLE(SND_SOC_NOPM, 0, 0, (num_of_dma + 1), enum_dma_str);
+	struct soc_enum *dma_route_enum = devm_kmemdup(pcm_dev, &dma_route_enum_base,
+		sizeof(struct soc_enum), GFP_KERNEL);
+	const struct snd_kcontrol_new dma_route_controls_base[] = {
+		SOC_DAPM_ENUM_EXT(PCM_KCTL_DMA_MUX, (*dma_route_enum),
+			abox_pcm_dev_get_dma_route, abox_pcm_dev_put_dma_route)
+	};
+	struct snd_kcontrol_new *dma_route_controls =
+		devm_kmemdup(pcm_dev, dma_route_controls_base,
+			sizeof(struct snd_kcontrol_new) * ARRAY_SIZE(dma_route_controls_base),
+			GFP_KERNEL);
+	*num_of_kcontrols = ARRAY_SIZE(dma_route_controls_base);
+
+	return dma_route_controls;
+}
+
+static struct snd_kcontrol_new *abox_pcm_dev_making_dummy_kcontrol(struct device *pcm_dev,
+	unsigned int num_of_i2s_dummy, int *num_of_kcontrols)
+{
+	const char * const *enum_dummy_str =
+		abox_pcm_dev_making_enum_str(pcm_dev, num_of_i2s_dummy);
+	struct soc_enum dummy_route_enum_base =
+		SOC_ENUM_DOUBLE(SND_SOC_NOPM, 0, 0, (num_of_i2s_dummy + 1), enum_dummy_str);
+	struct soc_enum *dummy_route_enum = devm_kmemdup(pcm_dev, &dummy_route_enum_base,
+		sizeof(struct soc_enum), GFP_KERNEL);
+	const struct snd_kcontrol_new dummy_route_controls_base[] = {
+		SOC_DAPM_ENUM(PCM_KCTL_DUMMY_MUX, (*dummy_route_enum))
+	};
+	struct snd_kcontrol_new *dummy_route_controls =
+		devm_kmemdup(pcm_dev, dummy_route_controls_base,
+			sizeof(struct snd_kcontrol_new) * ARRAY_SIZE(dummy_route_controls_base),
+			GFP_KERNEL);
+	*num_of_kcontrols = ARRAY_SIZE(dummy_route_controls_base);
+
+	return dummy_route_controls;
+}
+
+int abox_pcm_dev_register_dma_route_kcontrol(struct device *pcm_dev, int num_of_dma)
+{
+	struct abox_platform_data *data = dev_get_drvdata(pcm_dev);
+	struct snd_kcontrol_new *dma_route_controls;
+	struct snd_soc_dapm_widget *dapm_playback_widget;
+	char widget_name[DEFAULT_STR_SIZE] = {0, };
+	int ret;
+	int num_of_kcontrols;
+
+	ret = abox_pcm_dev_strcat_with_prefix_name(pcm_dev, widget_name,
+		data->stream_type == SNDRV_PCM_STREAM_PLAYBACK ? "RDMA Route" : "WDMA Route");
+	if (ret < 0) {
+		dev_err(pcm_dev, "%s(%d) Failed to make widget name\n", __func__, __LINE__);
+		return ret;
+	}
+	dapm_playback_widget = abox_pcm_dev_find_widget(pcm_dev, widget_name);
+	if (!dapm_playback_widget) {
+		dev_err(pcm_dev, "%s(%d) Failed to find widget. Name:%s\n",
+			__func__, __LINE__, widget_name);
+		return -EINVAL;
+	}
+	dma_route_controls =
+		abox_pcm_dev_making_dma_kcontrol(pcm_dev, num_of_dma, &num_of_kcontrols);
+	dapm_playback_widget->kcontrol_news = dma_route_controls;
+	dapm_playback_widget->num_kcontrols = num_of_kcontrols;
+
+	return 0;
+}
+
+static void abox_pcm_dev_register_dummy_route_kcontrol(struct device *pcm_dev)
+{
+	struct snd_kcontrol_new *dummy_route_controls = NULL;
+	struct snd_soc_dapm_widget *dapm_playback_widget = NULL;
+	char widget_name[DEFAULT_STR_SIZE] = {0, };
+	int ret;
+	int num_of_kcontrols;
+	int num_of_i2s_dummy = abox_generic_get_num_i2s_dummy();
+
+	ret = abox_pcm_dev_strcat_with_prefix_name(pcm_dev, widget_name, "I2S Dummy Route");
+	if (ret < 0) {
+		dev_err(pcm_dev, "%s(%d) Failed to make widget name\n", __func__, __LINE__);
+		return;
+	}
+	dapm_playback_widget = abox_pcm_dev_find_widget(pcm_dev, widget_name);
+	if (!dapm_playback_widget) {
+		dev_err(pcm_dev, "%s(%d) Failed to find widget. Name:%s\n",
+			__func__, __LINE__, widget_name);
+		return;
+	}
+	dummy_route_controls = abox_pcm_dev_making_dummy_kcontrol(pcm_dev, num_of_i2s_dummy,
+		&num_of_kcontrols);
+	dapm_playback_widget->kcontrol_news = dummy_route_controls;
+	dapm_playback_widget->num_kcontrols = num_of_kcontrols;
+}
+
+static struct snd_soc_dapm_widget *abox_pcm_dev_get_playback_widget(
+	struct device *dev, struct abox_platform_data *data, int *array_size)
+{
+	struct snd_soc_dapm_widget *dapm_playback_widgets;
+	const struct snd_soc_dapm_widget dapm_playback_widgets_base[] = {
+		SND_SOC_DAPM_DEMUX("PCM%dp PP Route", SND_SOC_NOPM, 0, 0, pcm_dev_route_controls),
+		ABOX_SND_SOC_DAPM_BUFFER("PCM%dp PostProcessing", SND_SOC_NOPM, NULL),
+		SND_SOC_DAPM_DEMUX("PCM%dp Backend Route", SND_SOC_NOPM, 0, 0,
+			pcm_dev_backend_route_controls),
+		SND_SOC_DAPM_DEMUX("PCM%dp I2S Dummy Route", SND_SOC_NOPM, 0, 0, NULL),
+		SND_SOC_DAPM_DEMUX("PCM%dp RDMA Route", SND_SOC_NOPM, 0, 0, NULL),
+	};
+
+	dapm_playback_widgets = devm_kmemdup(dev, dapm_playback_widgets_base,
+		sizeof(dapm_playback_widgets_base), GFP_KERNEL);
+	if (!dapm_playback_widgets)
+		return NULL;
+	*array_size = ARRAY_SIZE(dapm_playback_widgets_base);
+
+	return dapm_playback_widgets;
+}
+
+static struct snd_soc_dapm_widget *abox_pcm_dev_get_capture_widget(
+	struct device *dev, struct abox_platform_data *data, int *array_size)
+{
+	struct snd_soc_dapm_widget *dapm_capture_widgets;
+	const struct snd_soc_dapm_widget dapm_capture_widgets_base[] = {
+		SND_SOC_DAPM_MUX("PCM%dc WDMA Route", SND_SOC_NOPM, 0, 0, NULL),
+		SND_SOC_DAPM_MUX("PCM%dc I2S Dummy Route", SND_SOC_NOPM, 0, 0, NULL),
+		SND_SOC_DAPM_MUX("PCM%dc Backend Route", SND_SOC_NOPM, 0, 0,
+			pcm_dev_backend_route_controls),
+		ABOX_SND_SOC_DAPM_BUFFER("PCM%dc PostProcessing", SND_SOC_NOPM, NULL),
+		SND_SOC_DAPM_DEMUX("PCM%dc PP Route", SND_SOC_NOPM, 0, 0,
+			pcm_dev_route_controls),
+	};
+
+	dapm_capture_widgets = devm_kmemdup(dev, dapm_capture_widgets_base,
+		sizeof(dapm_capture_widgets_base), GFP_KERNEL);
+	if (!dapm_capture_widgets)
+		return NULL;
+	*array_size = ARRAY_SIZE(dapm_capture_widgets_base);
+
+	return dapm_capture_widgets;
+}
+
+static void abox_pcm_dev_making_widget(struct device *dev,
+	struct abox_platform_data *data,
+	struct snd_soc_component_driver *cmpnt)
+{
+	int i;
+	int array_size;
+
+	if (data->stream_type == SNDRV_PCM_STREAM_PLAYBACK)
+		data->plat_dapm_widgets =
+			abox_pcm_dev_get_playback_widget(dev, data, &array_size);
+	else
+		data->plat_dapm_widgets =
+			abox_pcm_dev_get_capture_widget(dev, data, &array_size);
+
+	for (i = 0; i < array_size; i++) {
+		data->plat_dapm_widgets[i].name = devm_kasprintf(dev,
+			GFP_KERNEL, data->plat_dapm_widgets[i].name, data->dai_drv->id);
+
+		dev_dbg(dev, "%s: dapm_widget:%s kcontrol_news:%p\n", __func__,
+			data->plat_dapm_widgets[i].name, data->plat_dapm_widgets[i].kcontrol_news);
+	}
+	cmpnt->dapm_widgets = data->plat_dapm_widgets;
+	cmpnt->num_dapm_widgets = array_size;
+}
+
+static int abox_pcm_dev_register_component(struct device *dev,
+	struct abox_platform_data *data)
+{
+	const struct of_device_id *of_node_id;
+	int ret;
+	int i;
+
+	if (!dev->of_node)
+		return -ENODEV;
+	of_node_id = of_match_node(&samsung_abox_pcm_dev_match[data->stream_type], dev->of_node);
+	if (!of_node_id) {
+		dev_err(dev, "%s(%d) of_node_id is not ready\n", __func__, __LINE__);
+		return -ENODEV;
+	}
+	data->of_data = of_node_id->data;
+
+	data->dai_drv = devm_kcalloc(dev, data->of_data->num_of_dai_drv,
+				sizeof(struct snd_soc_dai_driver), GFP_KERNEL);
+	if (!data->dai_drv)
+		return -ENOMEM;
+
+	memcpy(data->dai_drv, data->of_data->base_dai_drv,
+		sizeof(struct snd_soc_dai_driver) * data->of_data->num_of_dai_drv);
+	for (i = 0; i < data->of_data->num_of_dai_drv; i++) {
+		data->dai_drv[i].id = data->id;
+		data->dai_drv[i].name = devm_kasprintf(dev,
+			GFP_KERNEL, data->dai_drv[i].name, data->id);
+		if (data->stream_type == SNDRV_PCM_STREAM_PLAYBACK) {
+			data->dai_drv[i].playback.stream_name = devm_kasprintf(dev,
+				GFP_KERNEL, data->dai_drv[i].playback.stream_name, data->id);
+			if (data->category == PLATFORM_COMPRESS)
+				data->dai_drv[i].ops = &abox_compr_dai_ops;
+		} else {
+			data->dai_drv[i].capture.stream_name = devm_kasprintf(dev,
+				GFP_KERNEL, data->dai_drv[i].capture.stream_name, data->id);
+		}
+	}
+
+	data->cmpnt_drv = devm_kmemdup(dev, &abox_pcm_dev_base,
+		sizeof(abox_pcm_dev_base), GFP_KERNEL);
+	if (!data->cmpnt_drv)
+		return -ENOMEM;
+
+	abox_pcm_dev_making_widget(dev, data, data->cmpnt_drv);
+	abox_pcm_dev_making_routes(dev, data, data->cmpnt_drv);
+	abox_pcm_dev_register_dummy_route_kcontrol(dev);
+
+	abox_pcm_dev_set_ops(data->cmpnt_drv);
+
+	if (data->category == PLATFORM_COMPRESS) {
+		data->cmpnt_drv->compress_ops = &abox_pcm_dev_compress_ops;
+		ret = abox_generic_set_dma_buffer(dev);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = devm_snd_soc_register_component(dev, data->cmpnt_drv,
+			data->dai_drv, data->of_data->num_of_dai_drv);
+	if (ret < 0)
+		dev_warn(dev, "%s: component register failed:%d\n", __func__,  ret);
+
+	return ret;
+}
+
+static int abox_pcm_dev_update_dma_route_kcontrol_enum(struct device *pcm_dev,
+	int dma_id)
+{
+	struct abox_platform_data *data = dev_get_drvdata(pcm_dev);
+	struct snd_soc_dapm_widget *widget;
+	struct snd_kcontrol_new *kctl;
+	struct soc_enum *dma_enum;
+	const char * const *enum_dma_str;
+	char widget_name[DEFAULT_STR_SIZE] = {0, };
+	int ret;
+
+	if (!data)
+		return -ENODATA;
+
+	ret = abox_pcm_dev_strcat_with_prefix_name(pcm_dev, widget_name,
+		data->stream_type == SNDRV_PCM_STREAM_PLAYBACK ? "RDMA Route" : "WDMA Route");
+	if (ret < 0)
+		return ret;
+
+	widget = abox_pcm_dev_find_widget(pcm_dev, widget_name);
+	if (!widget)
+		return -ENODATA;
+	kctl = abox_pcm_dev_find_kcontrol(pcm_dev, widget, PCM_KCTL_DMA_MUX);
+	if (!kctl)
+		return -ENODATA;
+
+	dma_enum = (struct soc_enum *)kctl->private_value;
+	enum_dma_str = dma_enum->texts;
+	/*
+	 * 'enum_dma_str' is declared as 'const char * const *' to comply with
+	 * ALSA's soc_enum interface, but each entry was originally allocated
+	 * as writable memory via devm_kzalloc(). Therefore, writing to these
+	 * entries is safe and intentional.
+	 *
+	 * The default value of Route is NO_CONNECT, not DMA0.
+	 * Therefore, the size of the enum must be one greater than num_of_dma.
+	 */
+	if (data->stream_type == SNDRV_PCM_STREAM_PLAYBACK)
+		ret = snprintf((char *)enum_dma_str[dma_id + 1], DEFAULT_STR_SIZE - 1,
+			"RDMA%d", dma_id);
+	else
+		ret = snprintf((char *)enum_dma_str[dma_id + 1], DEFAULT_STR_SIZE - 1,
+			"WDMA%d", dma_id);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Add the given DMA information to the list of DMA devices
+ * associated with this PCM device.
+ *
+ * This is typically called from the solution manager or device
+ * registration path when the DMA resource is discovered dynamically.
+ */
+static void abox_pcm_dev_input_list(struct device *pcm_dev,
+	struct abox_platform_dma_info *dma_info)
+{
+	struct abox_platform_data *data;
+
+	data = dev_get_drvdata(pcm_dev);
+	if (!data) {
+		dev_err(pcm_dev, "%s PCM data is not ready\n", __func__);
+		return;
+	}
+	list_add(&dma_info->list, &data->dma_list_head);
+}
+
+void abox_pcm_dev_attach_solution_mgr(struct device *pcm_dev,
+	struct abox_solution_mgr_data *solution_mgr_data)
+{
+	struct abox_platform_data *pcm_data = dev_get_drvdata(pcm_dev);
+
+	if (!pcm_data) {
+		dev_err(pcm_dev, "%s(%d) Failed to get PCM DATA\n", __func__, __LINE__);
+		return;
+	}
+	pcm_data->solution_mgr_data = solution_mgr_data;
+}
+
+int abox_pcm_dev_attach_dma(struct device *pcm_dev, struct device *dma_dev,
+				int dma_id, dma_ioctl_fn dma_ioctl)
+{
+	struct abox_platform_dma_info *dma_info;
+	struct abox_platform_data *data;
+	int ret;
+	int num_of_dma;
+
+	data = dev_get_drvdata(pcm_dev);
+	if (!data)
+		return -ENODATA;
+
+	num_of_dma = abox_generic_get_num_dma(pcm_dev, data->stream_type);
+	if (dma_id >= num_of_dma)
+		return -EINVAL;
+
+	ret = abox_pcm_dev_update_dma_route_kcontrol_enum(pcm_dev, dma_id);
+	if (ret < 0)
+		return ret;
+	ret = abox_pcm_dev_making_dma_routes(pcm_dev, dma_id);
+	if (ret < 0)
+		return ret;
+
+	dma_info = devm_kzalloc(pcm_dev, sizeof(*dma_info), GFP_KERNEL);
+	if (!dma_info)
+		return -ENOMEM;
+	dma_info->dma_dev = dma_dev;
+	dma_info->dma_id = dma_id;
+	dma_info->dma_ioctl = dma_ioctl;
+	abox_pcm_dev_input_list(pcm_dev, dma_info);
+
+	return 0;
+}
+
+static void abox_pcm_dev_print_isr_log(struct device *pcm_dev)
+{
+	struct abox_platform_data *data = dev_get_drvdata(pcm_dev);
+	ktime_t currentTime, intr_gap_time;
+
+	currentTime = ktime_get();
+	intr_gap_time = ktime_to_us(ktime_sub(currentTime, data->pcm_dbg_log.lastTime));
+	data->pcm_dbg_log.lastTime = currentTime;
+
+	if (data->solution_mgr_data->pp_enabled) {
+		unsigned int buf_off = readl(data->pp_pointer_base);
+
+		dev_info(pcm_dev, "%s %s DMA_%d isr_gap %lld usec, buf_off 0x%08x\n",
+			abox_pcm_dev_get_soc_time(pcm_dev), data->name,
+			data->dma_id, intr_gap_time, buf_off);
+	} else if (data->dma_id >= 0) {
+		unsigned int buf_status = 0xDEADC0DE;
+		struct abox_platform_dma_info *dma_info =
+			abox_pcm_dev_find_dma_info(pcm_dev, data->dma_id);
+
+		if (!dma_info) {
+			dev_err(pcm_dev, "%s(%d) Can't find DMA%d Info.\n", __func__, __LINE__,
+				data->dma_id);
+			return;
+		}
+
+		if (!dma_info->dma_ioctl) {
+			dev_err(pcm_dev, "%s(%d) DMA%d Ioctl is not ready\n", __func__, __LINE__,
+				data->dma_id);
+			return;
+		}
+
+		buf_status = dma_info->dma_ioctl(dma_info->dma_dev,
+						ABOX_DMA_IOCTL_GET_BUF_STATUS, NULL);
+		if (buf_status != 0xDEADC0DE) {
+			unsigned int buf_off = (ssize_t)dma_info->dma_ioctl(dma_info->dma_dev,
+				ABOX_DMA_IOCTL_GET_BUF_OFFSET, &buf_status);
+			unsigned int buf_cnt = (ssize_t)dma_info->dma_ioctl(dma_info->dma_dev,
+				ABOX_DMA_IOCTL_GET_BUF_COUNT, &buf_status);
+
+			dev_info(pcm_dev,
+				"%s %s DMA_%d isr_gap %lld usec, POS 0x%08X +0x%04X\n",
+				abox_pcm_dev_get_soc_time(pcm_dev),
+				data->name, data->dma_id, intr_gap_time, buf_off, buf_cnt);
+		}
+	}
+}
+
+/*
+ * IRQ handler for PCM DMA interrupts.
+ *
+ * If post-processing (PP) is enabled, logs PP buffer offset.
+ * Otherwise, queries the DMA driver via ioctl for current buffer status.
+ *
+ * The handler updates the kernel debug timestamp log if enabled,
+ * and signals period elapsed to the ALSA core.
+ *
+ * This function is primarily used to track buffer movement and
+ * trigger audio period completion events in the playback or capture path.
+ */
+static irqreturn_t abox_pcm_dev_irq_handler(struct device *pcm_dev, int irq_id,
+	struct _abox_inter_ipc_msg *pmsg)
+{
+	struct abox_platform_data *data;
+
+	data = dev_get_drvdata(pcm_dev);
+	if (!data || !data->substream)
+		return IRQ_HANDLED;
+
+	if (data->pcm_dbg_log.set_kernel_pcm_log & ISR_LOG)
+		abox_pcm_dev_print_isr_log(pcm_dev);
+
+	data->pointer = 0;
+	snd_pcm_period_elapsed(data->substream);
+
+	return IRQ_HANDLED;
+}
+
+int abox_pcm_dev_release(struct platform_device *pdev)
+{
+	struct abox_platform_data *pcm_data = platform_get_drvdata(pdev);
+
+	if (!pcm_data)
+		return -ENODATA;
+
+	if (!pcm_data->cmpnt)
+		return -ENODATA;
+
+	if (pcm_data->substream && pcm_data->substream->runtime)
+		pcm_data->substream->runtime->state = SNDRV_PCM_STATE_DISCONNECTED;
+
+	return 0;
+}
+
+static int abox_pcm_dev_read_property_from_dt(struct platform_device *pdev,
+	struct abox_platform_data *data)
+{
+	int ret;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const char *category;
+
+	/* Reads the PCM playback/capture id from the device tree and stores in data->id */
+	ret = of_property_read_u32_index(np, "samsung,id", 0, &data->id);
+	if (ret < 0)
+		return ret;
+
+	ret = of_property_read_u32_index(np, "samsung,irq_id", 0, &data->irq_id);
+	if (ret < 0)
+		return ret;
+
+	ret = of_property_read_u32_index(np, "samsung,allocate-adsp", 0, &data->adsp);
+	if (ret < 0)
+		return ret;
+
+	data->category = PLATFORM_DEEPBUFFER;
+	ret = of_property_read_string(np, "samsung,category", &category);
+	if (ret < 0)
+		dev_err(dev, "samsung,category property reading fail\n");
+	else
+		if (!strncmp(category, "compress", strlen("compress")))
+			data->category = PLATFORM_COMPRESS;
+
+	return ret;
+}
+
+static int samsung_abox_pcm_dev_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct abox_platform_data *data;
+	int ret;
+	const struct of_device_id *match;
+
+	match = of_match_device(samsung_abox_pcm_dev_match, dev);
+	if (!match) {
+		dev_err(dev, "%s Failed to get match device info\n", __func__);
+		return -EINVAL;
+	}
+	dev_dbg(dev, "%s: Start Compatible:%s\n", __func__, match->compatible);
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, data);
+	data->pdev = pdev;
+
+	data->pcm_dbg_log.set_fw_intr_gap = 0;
+	data->pcm_dbg_log.set_kernel_pcm_log = 0;
+
+	if (!strncmp(match->compatible, "samsung,abox-pcm-playback", strlen(match->compatible)))
+		data->stream_type = SNDRV_PCM_STREAM_PLAYBACK;
+	else
+		data->stream_type = SNDRV_PCM_STREAM_CAPTURE;
+
+	data->name = devm_kcalloc(dev, DEFAULT_STR_SIZE, sizeof(char), GFP_KERNEL);
+	if (!data->name)
+		return -ENOMEM;
+	abox_pcm_dev_update_name(dev);
+
+	data->dma_id = DMA_NO_CONNECT;
+	data->dma_list_head.next = &data->dma_list_head;
+	data->dma_list_head.prev = &data->dma_list_head;
+
+	ret = abox_pcm_dev_read_property_from_dt(pdev, data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				"%s Failed to read property. ret:%d\n", __func__, ret);
+
+	/*
+	 * pp_pointer_res is an optional memory resource used when post-processing
+	 * is enabled on the ADSP. In this case, the DMA buffer offset is not managed
+	 * by the hardware DMA, but updated by the ADSP.
+	 *
+	 * The resource address is used to map a virtual pointer to track
+	 * ADSP-side write progress into the audio buffer.
+	 *
+	 * This property must be declared in the device tree when post-processing
+	 * is enabled for this PCM stream.
+	 */
+	data->pp_pointer_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+		"pp_pointer_offset");
+	if (IS_ERR_OR_NULL(data->pp_pointer_res))
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+				"Failed to get %s\n", "pp_pointer_offset");
+
+	data->abox_dma_hardware = devm_kzalloc(dev, sizeof(*data->abox_dma_hardware), GFP_KERNEL);
+	if (!data->abox_dma_hardware)
+		return dev_err_probe(dev, -ENOMEM,
+				"%s(%d) Failed to allocate memory for dma_hardware\n",
+				__func__, __LINE__);
+	set_hw_params(np, data->abox_dma_hardware);
+
+	data->dma_buffer = devm_kzalloc(dev, sizeof(*data->dma_buffer), GFP_KERNEL);
+	if (!data->dma_buffer)
+		return dev_err_probe(dev, -ENOMEM,
+					"%s(%d) Failed to allocate memory for dma_buffer\n",
+					__func__, __LINE__);
+
+	ret = abox_generic_register_pcm_dev(pdev, data->id, data->stream_type);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				"%s Can't register %s pcm_dev pdev (%d)\n", __func__,
+				PCM_STREAM_STR(data->stream_type), ret);
+	if (data->category == PLATFORM_DEEPBUFFER)
+		ret = abox_ipc_generic_register_pcm_dev_handler(dev, data->irq_id,
+			abox_pcm_dev_irq_handler);
+	else
+		ret = abox_ipc_generic_register_pcm_dev_handler(dev, data->irq_id,
+			abox_pcm_dev_compr_irq_handler);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "%s Category:%d Can't register IRQ %d\n",
+				__func__, data->category, ret);
+
+	pm_runtime_no_callbacks(dev);
+	pm_runtime_enable(dev);
+
+	ret = abox_pcm_dev_register_component(dev, data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "abox %s failed to register component:%d\n",
+				PCM_STREAM_STR(data->stream_type), ret);
+
+	return ret;
+}
+
+static void samsung_abox_pcm_dev_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+}
+
+/*
+ * - The samsung_abox_pcm_dev_probe() and samsung_abox_pcm_dev_remove() functions
+ * will be called by the kernel when the driver is bound to a device.
+ * - The probe() function is called when the kernel finds the driver in the device tree
+ * and matches the compatible string in the device tree to the compatible string in the
+ * driver.
+ */
+struct platform_driver samsung_abox_pcm_dev_driver = {
+	.probe  = samsung_abox_pcm_dev_probe,
+	.remove = samsung_abox_pcm_dev_remove,
+	.driver = {
+		.name = "samsung-abox-pcm-dev",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(samsung_abox_pcm_dev_match),
+	},
+};
diff --git a/sound/soc/samsung/auto_abox/generic/abox_solution_mgr.c b/sound/soc/samsung/auto_abox/generic/abox_solution_mgr.c
new file mode 100644
index 000000000000..11f6a8f6b0a4
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/abox_solution_mgr.c
@@ -0,0 +1,456 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Eunwoo Kim <ew.kim@samsung.com>
+ *
+ * EXYNOS Automotive Abox Solution Manager - abox_solution_mgr.c
+ *
+ * Software solution management layer for ALSA SoC ABOX audio subsystem.
+ *
+ * This module registers software-based audio processing "solutions" from
+ * solution_proxy and maps them dynamically to PCM frontend devices.
+ * It creates dynamic ALSA kcontrols for selecting solution chains per PCM device
+ * and manages the lifecycle and runtime callbacks for each solution.
+ *
+ * This manager does not directly interface with hardware, but works in coordination
+ * with abox_pcm_dev and abox_ipc_generic under the abox_generic parent.
+ */
+
+#include <linux/platform_device.h>
+#include <sound/pcm.h>
+#include <linux/of.h>
+#include <sound/soc.h>
+
+#include "include/abox_generic.h"
+#include "include/abox_pcm.h"
+#include "include/abox_ipc_generic.h"
+#include "include/abox_solution_mgr.h"
+#include "include/abox_util_generic.h"
+
+#define ABOX_SOLUTION_KCONTROL_FMT(type) \
+	((type) == SNDRV_PCM_STREAM_CAPTURE ? \
+	"PCM%dc SOLUTION CHAIN%d" : "PCM%dp SOLUTION CHAIN%d")
+
+/*
+ * Shared context for abox_solution_mgr.
+ *
+ * This context stores the IPC function pointers registered during init
+ * and is accessed by all solution-related functions.
+ * It replaces static global function pointers to improve structure and maintainability.
+ */
+static struct abox_solution_mgr_context {
+	sol_proxy_ioctl_fn ioctl;
+	sol_proxy_ops_callback_fn callback;
+} solution_mgr_ctx;
+
+int abox_solution_mgr_add_controls(struct device *pcm_dev, struct snd_soc_component *component)
+{
+	struct abox_platform_data *pcm_data = dev_get_drvdata(pcm_dev);
+	struct abox_solution_mgr_data *solution_mgr_data = pcm_data->solution_mgr_data;
+	struct abox_solution_controls *control_list;
+	int ret;
+
+	if (!solution_mgr_data)
+		return -ENODATA;
+
+	if (!solution_mgr_ctx.ioctl)
+		return -ENOLINK;
+
+	control_list = &solution_mgr_data->control_list;
+	ret = snd_soc_add_component_controls(component, control_list->controls,
+		control_list->num_of_controls);
+	if (ret < 0)
+		return ret;
+	ret = solution_mgr_ctx.ioctl(pcm_dev, ABOX_SOL_IOCTL_ADD_SOLUTION_CONTROLS,
+		component, NULL);
+
+	return ret;
+}
+
+int abox_solution_mgr_ops(struct device *pcm_dev, enum abox_solution_type type,
+	enum abox_solution_ops_type ops_type, int cmd, void *data)
+{
+	int ret;
+
+	if (!solution_mgr_ctx.callback) {
+		dev_info(pcm_dev, "%s(%d) Solution is not ready\n", __func__, __LINE__);
+		return -ENOLINK;
+	}
+	ret = solution_mgr_ctx.callback(pcm_dev, type, ops_type, cmd, data);
+
+	return ret;
+}
+
+
+static int abox_solution_get_enum_id(struct soc_enum *solution_enums, char *enum_str)
+{
+	int index;
+
+	for (index = 0; index < solution_enums->items; index++) {
+		if (!strncmp(solution_enums->texts[index], enum_str, ABOX_SOLUTION_NAME_LEN))
+			return index;
+	}
+	return 0;
+}
+
+static void *abox_solution_update_solution_chain(struct device *pcm_dev, int chain_index,
+	void *solution_data)
+{
+	struct abox_platform_data *pcm_data = dev_get_drvdata(pcm_dev);
+	struct abox_solution_mgr_data *solution_mgr_data;
+	void *previous_solution_data;
+
+	solution_mgr_data = pcm_data->solution_mgr_data;
+	previous_solution_data = solution_mgr_data->solution_chain[chain_index];
+	solution_mgr_data->solution_chain[chain_index] = solution_data;
+
+	return previous_solution_data;
+}
+
+static int abox_solution_chain_info(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_info *uinfo)
+{
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+
+	return snd_ctl_enum_info(uinfo, 1, e->items, e->texts);
+}
+
+static int abox_solution_get_chain_index(const char *control_name, int stream_type)
+{
+	int pcm_id;
+	int chain_index;
+	int ret;
+	char parse_fmt[64];
+
+	/* Generate parsing format with "ABOX " prefix */
+	ret = snprintf(parse_fmt, sizeof(parse_fmt), "ABOX %s",
+		       ABOX_SOLUTION_KCONTROL_FMT(stream_type));
+
+	/* Check for truncation or encoding error */
+	if (ret < 0 || ret >= sizeof(parse_fmt))
+		return -EINVAL;
+
+	/* Parse the control name using the composed format */
+	ret = sscanf(control_name, parse_fmt, &pcm_id, &chain_index);
+	if (ret != 2)
+		return -EINVAL;
+
+	return chain_index;
+}
+
+static int abox_solution_get_solution_chain(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct device *pcm_dev = cmpnt->dev;
+	struct abox_platform_data *pcm_data = dev_get_drvdata(pcm_dev);
+	struct abox_solution_mgr_data *solution_mgr_data;
+	int chain_index;
+	char solution_name[ABOX_SOLUTION_NAME_LEN] = {0, };
+
+	if (!pcm_data) {
+		dev_err(pcm_dev, "%s pcm data is NULL\n", __func__);
+		return 0;
+	}
+
+	ucontrol->value.enumerated.item[0] = 0;
+	solution_mgr_data = pcm_data->solution_mgr_data;
+	if (!solution_mgr_data) {
+		dev_dbg(pcm_dev, "%s No solution data\n", __func__);
+		ucontrol->value.enumerated.item[0] = 0;
+		return 0;
+	}
+
+	chain_index = abox_solution_get_chain_index(kcontrol->id.name, pcm_data->stream_type);
+	if (chain_index < 0) {
+		dev_warn(pcm_dev, "Failed to get chain index from control name: %s\n",
+			kcontrol->id.name);
+		return 0;
+	}
+	if (!solution_mgr_data->solution_chain[chain_index]) {
+		ucontrol->value.enumerated.item[0] = 0;
+		return 0;
+	}
+	solution_mgr_ctx.ioctl(pcm_dev, ABOX_SOL_IOCTL_GET_SOLUTION_NAME, (void *)solution_name,
+		&solution_mgr_data->solution_chain[chain_index]);
+	ucontrol->value.enumerated.item[0] =
+		abox_solution_get_enum_id((struct soc_enum *)kcontrol->private_value,
+		solution_name);
+
+	return 0;
+}
+
+static int abox_solution_set_solution_chain(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct soc_enum *solution_enum = (struct soc_enum *)kcontrol->private_value;
+	struct device *pcm_dev = cmpnt->dev;
+	struct abox_platform_data *pcm_data = dev_get_drvdata(pcm_dev);
+	void *solution_data;
+	void *previous_solution_data;
+	unsigned int enum_id;
+	int chain_index;
+	bool connected;
+
+	if (ucontrol->value.enumerated.item[0] >= solution_enum->items) {
+		dev_err(pcm_dev, "%s Wrong enum id:%u\n", __func__,
+			ucontrol->value.enumerated.item[0]);
+		return -EINVAL;
+	}
+
+	chain_index = abox_solution_get_chain_index(kcontrol->id.name, pcm_data->stream_type);
+	if (chain_index < 0) {
+		dev_warn(pcm_dev, "Failed to get chain index from control name: %s\n",
+			kcontrol->id.name);
+		return 0;
+	}
+	enum_id = ucontrol->value.enumerated.item[0];
+	if (enum_id > 0) {
+		solution_mgr_ctx.ioctl(pcm_dev, ABOX_SOL_IOCTL_GET_SOLUTION,
+			(void *)solution_enum->texts[enum_id], &solution_data);
+		if (!solution_data) {
+			dev_err(pcm_dev, "%s(%d) Failed to find solution. Name:%s\n",
+				__func__, __LINE__, solution_enum->texts[enum_id]);
+			return -EINVAL;
+		}
+		connected = true;
+		solution_mgr_ctx.ioctl(pcm_dev, ABOX_SOL_IOCTL_SET_SOLUTION_CONNECT,
+			(void *)&connected, &solution_data);
+	}
+	previous_solution_data = abox_solution_update_solution_chain(pcm_dev, chain_index,
+		solution_data);
+	if (previous_solution_data && previous_solution_data != solution_data) {
+		connected = false;
+		solution_mgr_ctx.ioctl(pcm_dev, ABOX_SOL_IOCTL_SET_SOLUTION_CONNECT,
+			(void *)&connected, &previous_solution_data);
+	}
+
+	return 0;
+}
+
+static int abox_solution_mgr_attach_solutions(struct device *pcm_dev,
+	struct abox_solution_mgr_data *solution_mgr_data, char **enum_str, int num_of_solution)
+{
+	char *solution_name;
+	int enum_id;
+	int solution_id;
+	int ret;
+
+	solution_mgr_data->solution_list = devm_kcalloc(pcm_dev, num_of_solution, sizeof(void *),
+		GFP_KERNEL);
+	if (!solution_mgr_data->solution_list)
+		return -ENOMEM;
+	solution_mgr_data->solution_chain = devm_kcalloc(pcm_dev, num_of_solution, sizeof(void *),
+		GFP_KERNEL);
+	if (!solution_mgr_data->solution_chain)
+		return -ENOMEM;
+	/* enum str = {"NO_USED", "SOL1", "SOL2",,,}
+	 * So solution name starts from '1'.
+	 * And num_of_solution is not length of enum_str, it is num of solution.
+	 */
+	for (enum_id = 0, solution_id = 0; enum_id < num_of_solution; enum_id++) {
+		void **solution_data = NULL;
+
+		solution_name = enum_str[enum_id + 1];
+		solution_data = &solution_mgr_data->solution_list[solution_id];
+
+		ret = solution_mgr_ctx.ioctl(pcm_dev, ABOX_SOL_IOCTL_REQUEST_TO_ADD_SOLUTION,
+			(void *)solution_name, solution_data);
+		if (ret < 0)
+			continue;
+		solution_id++;
+	}
+	solution_mgr_data->num_of_solution = solution_id;
+
+	return solution_id;
+}
+
+static void abox_solution_mgr_detach_solutions(struct device *pcm_dev,
+	struct abox_solution_mgr_data *solution_mgr_data)
+{
+	solution_mgr_ctx.ioctl(pcm_dev, ABOX_SOL_IOCTL_REQUEST_TO_REMOVE_SOLUTION, NULL, NULL);
+
+	solution_mgr_data->solution_list = NULL;
+	solution_mgr_data->solution_chain = NULL;
+}
+
+static int abox_solution_mgr_create_kcontrol(struct device *pcm_dev,
+	struct abox_solution_controls *solution_controls, char **enum_str, int num_of_solution)
+{
+	struct soc_enum solution_enum_base = SOC_ENUM_DOUBLE(SND_SOC_NOPM, 0, 0,
+			num_of_solution + 1, (const char * const *)enum_str);
+	struct soc_enum *solution_enum = devm_kmemdup(pcm_dev, &solution_enum_base,
+		sizeof(struct soc_enum), GFP_KERNEL);
+	const struct snd_kcontrol_new solution_chain_base =
+		ABOX_SOC_DAPM_ENUM_EXT_MULTI(NULL, (*solution_enum),
+			abox_solution_chain_info,
+			abox_solution_get_solution_chain,
+			abox_solution_set_solution_chain);
+	struct snd_kcontrol_new *solution_chain = devm_kcalloc(pcm_dev, num_of_solution,
+		sizeof(struct snd_kcontrol_new), GFP_KERNEL);
+	struct abox_platform_data *pcm_data = dev_get_drvdata(pcm_dev);
+	int solution_id;
+
+	if (!pcm_data)
+		return -ENODATA;
+
+	for (solution_id = 0; solution_id < num_of_solution; solution_id++) {
+		memcpy(&solution_chain[solution_id], &solution_chain_base,
+			sizeof(struct snd_kcontrol_new));
+		solution_chain[solution_id].name = devm_kasprintf(pcm_dev, GFP_KERNEL,
+			ABOX_SOLUTION_KCONTROL_FMT(pcm_data->stream_type),
+			pcm_data->id, solution_id);
+		if (!solution_chain[solution_id].name)
+			return -ENOMEM;
+	}
+	solution_controls->controls = solution_chain;
+	solution_controls->num_of_controls = solution_id;
+
+	return solution_id;
+}
+
+static struct abox_solution_mgr_data *abox_solution_mgr_create_solution(struct device *pcm_dev,
+	char **enum_str, int num_of_solution)
+{
+	struct abox_solution_mgr_data *solution_mgr_data;
+	int num_of_kcontrols;
+
+	solution_mgr_data = devm_kzalloc(pcm_dev, sizeof(struct abox_solution_mgr_data),
+		GFP_KERNEL);
+	if (!solution_mgr_data)
+		return NULL;
+
+	num_of_kcontrols = abox_solution_mgr_create_kcontrol(pcm_dev,
+		&solution_mgr_data->control_list, enum_str, num_of_solution);
+	if (num_of_kcontrols < 0) {
+		dev_err(pcm_dev, "%s(%d) Failed to allocate memory\n", __func__, __LINE__);
+		return NULL;
+	}
+
+	return solution_mgr_data;
+}
+
+/**
+ * abox_solution_mgr_register_ops_callback - Register operation callback from solution_proxy
+ * @callback: callback function to handle solution operations
+ *
+ * This function is called from the solution_proxy (in the variable part) to register
+ * a callback function that handles per-solution operations.
+ *
+ * The registered callback will be invoked by the solution manager during ALSA call steps
+ * (e.g., open, hw_params, trigger, etc.) to execute the corresponding operation
+ * for each solution in the chain.
+ */
+void abox_solution_mgr_register_ops_callback(sol_proxy_ops_callback_fn callback)
+{
+	solution_mgr_ctx.callback = callback;
+}
+EXPORT_SYMBOL(abox_solution_mgr_register_ops_callback);
+
+/**
+ * abox_solution_mgr_init - Initialize and register software solutions for each PCM device
+ * @proxy_dev: device pointer for the solution_proxy
+ * @num_of_solution: total number of software solutions supported by the variable part
+ * @enum_str: array of enum strings used for kcontrol display; contains num_of_solution + 1 strings
+ * @proxy_ioctl: function pointer used to send configuration requests to the solution_proxy
+ *
+ * This function is invoked by the solution_proxy after all solutions have been loaded.
+ * It passes the relevant solution data to the solution manager in the fixed part.
+ *
+ * The solution manager uses this data to attach solution information to each PCM device
+ * and to register the corresponding kcontrols needed to configure solutions per device.
+ *
+ * Return: 0 on success, or a negative error code on failure
+ */
+int abox_solution_mgr_init(struct device *proxy_dev, int num_of_solution, char **enum_str,
+	sol_proxy_ioctl_fn proxy_ioctl)
+{
+	struct platform_device *pdev_pcm;
+	int num_of_pcm;
+	int pcm_id;
+	int stream_type;
+	int ret;
+
+	solution_mgr_ctx.ioctl = proxy_ioctl;
+	if (!num_of_solution)
+		return 0;
+
+	for (stream_type = SNDRV_PCM_STREAM_PLAYBACK; stream_type <= SNDRV_PCM_STREAM_LAST;
+		stream_type++) {
+		struct abox_solution_mgr_data *solution_mgr_data;
+
+		num_of_pcm = abox_generic_get_num_pcm(stream_type);
+		for (pcm_id = 0; pcm_id < num_of_pcm; pcm_id++) {
+			pdev_pcm = abox_generic_get_pcm_platform_dev(pcm_id, stream_type);
+			if (!pdev_pcm)
+				continue;
+			solution_mgr_data = abox_solution_mgr_create_solution(&pdev_pcm->dev,
+				enum_str, num_of_solution);
+			if (!solution_mgr_data) {
+				dev_err(proxy_dev, "%s(%d) Failed to make solution mgr\n",
+					__func__, __LINE__);
+				return -EINVAL;
+			}
+			ret = abox_solution_mgr_attach_solutions(&pdev_pcm->dev, solution_mgr_data,
+				enum_str, num_of_solution);
+			if (ret < 0) {
+				dev_err(proxy_dev, "%s(%d) Failed to attach solution. ret:%d\n",
+					__func__, __LINE__, ret);
+				return ret;
+			}
+			abox_pcm_dev_attach_solution_mgr(&pdev_pcm->dev, solution_mgr_data);
+		}
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(abox_solution_mgr_init);
+
+/**
+ * abox_solution_mgr_deinit - Deinitialize and detach registered software solutions
+ * @proxy_dev: device pointer for the solution_proxy
+ *
+ * This function detaches all previously registered solutions from each PCM device,
+ * deallocates internal solution structures, and resets the shared solution context.
+ *
+ * It is typically called during shutdown or module removal to clean up solution-related state.
+ *
+ * Return: 0 on success
+ */
+int abox_solution_mgr_deinit(struct device *proxy_dev)
+{
+	struct platform_device *pdev_pcm;
+	int num_of_pcm;
+	int pcm_id;
+	int stream_type;
+
+	for (stream_type = SNDRV_PCM_STREAM_PLAYBACK; stream_type <= SNDRV_PCM_STREAM_LAST;
+		stream_type++) {
+		struct abox_solution_mgr_data *solution_mgr_data;
+
+		num_of_pcm = abox_generic_get_num_pcm(stream_type);
+		for (pcm_id = 0; pcm_id < num_of_pcm; pcm_id++) {
+			struct abox_platform_data *pcm_data;
+
+			pdev_pcm = abox_generic_get_pcm_platform_dev(pcm_id, stream_type);
+			if (!pdev_pcm)
+				continue;
+			pcm_data = platform_get_drvdata(pdev_pcm);
+			solution_mgr_data = pcm_data->solution_mgr_data;
+			if (!solution_mgr_data)
+				continue;
+
+			abox_solution_mgr_detach_solutions(&pdev_pcm->dev, solution_mgr_data);
+			devm_kfree(&pdev_pcm->dev, solution_mgr_data->control_list.controls);
+			devm_kfree(&pdev_pcm->dev, solution_mgr_data);
+			pcm_data->solution_mgr_data = NULL;
+		}
+	}
+
+	solution_mgr_ctx.ioctl = NULL;
+	solution_mgr_ctx.callback = NULL;
+
+	return 0;
+}
+EXPORT_SYMBOL(abox_solution_mgr_deinit);
diff --git a/sound/soc/samsung/auto_abox/generic/abox_util_generic.c b/sound/soc/samsung/auto_abox/generic/abox_util_generic.c
new file mode 100644
index 000000000000..d0dead1786a7
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/abox_util_generic.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *
+ * EXYNOS Automotive Abox Utility - abox_util_generic.c
+ *
+ * Common utility functions for ABOX audio drivers.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/of.h>
+
+#include "include/abox_pcm.h"
+#include "include/abox_util_generic.h"
+
+void deallocate_dma_memory(struct device *dev, struct snd_pcm_substream *substream)
+{
+	struct abox_platform_data *platform_data = dev_get_drvdata(dev);
+	struct snd_dma_buffer *dma_buf = &substream->dma_buffer;
+
+	memset(dma_buf, 0, sizeof(struct snd_dma_buffer));
+	memset(platform_data->dma_buffer, 0, sizeof(struct snd_dma_buffer));
+}
+
+void set_hw_params(const struct device_node *np, struct snd_pcm_hardware *hw)
+{
+	int ret = 0;
+	unsigned int buffer_bytes_max = DEFAULT_BUFFER_BYTES_MAX;
+
+	ret = of_property_read_u32(np, "samsung,buffer_bytes_max", &buffer_bytes_max);
+	if (ret < 0)
+		hw->buffer_bytes_max = DEFAULT_BUFFER_BYTES_MAX;
+	else
+		hw->buffer_bytes_max = buffer_bytes_max;
+
+	hw->info = SNDRV_PCM_INFO_INTERLEAVED
+		| SNDRV_PCM_INFO_BLOCK_TRANSFER
+		| SNDRV_PCM_INFO_MMAP
+		| SNDRV_PCM_INFO_MMAP_VALID;
+	hw->formats	= ABOX_SAMPLE_FORMATS;
+	hw->channels_min = 1;
+	hw->channels_max = 32; /* Maximum channel count for multichannel playback */
+	hw->period_bytes_min = PERIOD_BYTES_MIN,
+	hw->period_bytes_max = hw->buffer_bytes_max / 2;
+	hw->periods_min = hw->buffer_bytes_max / hw->period_bytes_max;
+	hw->periods_max = hw->buffer_bytes_max / hw->period_bytes_min;
+}
+
diff --git a/sound/soc/samsung/auto_abox/generic/include/abox_generic.h b/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
index b1e6d9b9345d..bd52caab97f9 100644
--- a/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
+++ b/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
@@ -1,17 +1,22 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * ALSA SoC - Samsung ABOX Share Function and Data structure
- * for Exynos specific extensions
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Eunwoo Kim <ew.kim@samsung.com>
  *
- * Copyright (C) 2013-2020 Samsung Electronics Co., Ltd.
+ * EXYNOS Automotive Abox Generic Driver - abox_generic.h
  *
- * EXYNOS - sound/soc/samsung/abox/include/abox_generic.h
+ * Header file for common functions and shared data structures
+ * used by Exynos Automotive ABOX audio subsystem.
+ *
+ * Provides platform-level interfaces and helpers shared across
+ * ABOX child drivers (e.g., PCM, IPC, I2S dummy backend) and
+ * interacts with core ALSA SoC and solution manager components.
  */
 
 #ifndef __SND_SOC_ABOX_GENERIC_BASE_H
 #define __SND_SOC_ABOX_GENERIC_BASE_H
 
-struct snd_soc_pcm_runtime;
+#include "abox_pcm.h"
 
 enum abox_soc_ioctl_cmd {
 	ABOX_SOC_IOCTL_GET_NUM_OF_RDMA,
@@ -23,9 +28,6 @@ enum abox_soc_ioctl_cmd {
 	ABOX_SOC_IOCTL_SET_PERF_PERIOD,
 	ABOX_SOC_IOCTL_CHECK_TIME_MUTEX,
 	ABOX_SOC_IOCTL_CHECK_TIME_NO_MUTEX,
-	ABOX_SOC_IOCTL_PCM_DUMP_INTR,
-	ABOX_SOC_IOCTL_PCM_DUMP_CLOSE,
-	ABOX_SOC_IOCTL_PCM_DUMP_ADD_CONTROL,
 	ABOX_SOC_IOCTL_MAX
 };
 
@@ -49,9 +51,9 @@ struct abox_generic_data {
 	unsigned int num_pcm_playback;
 	unsigned int num_pcm_capture;
 	unsigned int num_i2s_dummy;
-	unsigned int num_of_rdma;
-	unsigned int num_of_wdma;
-	unsigned int num_of_uaif;
+	unsigned int num_rdma;
+	unsigned int num_wdma;
+	unsigned int num_uaif;
 	struct device *soc_dev;
 	soc_ioctl_fn soc_ioctl;
 };
@@ -65,20 +67,31 @@ int abox_generic_request_soc_ioctl(struct device *generic_dev, enum abox_soc_ioc
 
 int abox_generic_set_pp_pointer(struct device *pcm_dev);
 
-int abox_generic_get_num_of_dma(struct device *pcm_dev, int stream_type);
+int abox_generic_get_num_dma(struct device *pcm_dev, int stream_type);
 
-int abox_generic_get_num_of_i2s_dummy(void);
+int abox_generic_get_num_i2s_dummy(void);
 
 int abox_generic_register_pcm_dev(struct platform_device *pdev_pcm_dev,
 				   unsigned int id, int stream_type);
 
 struct device *abox_generic_find_fe_dev_from_rtd(struct snd_soc_pcm_runtime *be);
 
-struct platform_device *abox_generic_get_pcm_platform_dev(int pcm_id, int stream_type);
-
-int abox_generic_get_num_of_pcm(int stream_type);
+int abox_generic_init_soc_route(struct device *soc_dev);
 
 int abox_generic_attach_soc_callback(struct device *soc_dev, soc_ioctl_fn soc_ioctl);
 
+struct platform_device *abox_generic_get_pcm_platform_dev(int pcm_id,
+	int stream_type);
+
+int abox_generic_get_num_pcm(int stream_type);
+
+int abox_generic_attach_dma(struct device *dma_dev, int dma_id,
+	int stream_type, dma_ioctl_fn dma_ioctl);
+
+void abox_generic_release_active_resource(void);
+
+int abox_generic_primary_dev_get(int stream_type);
+
+
 #endif //__SND_SOC_ABOX_GENERIC_BASE_H
 
diff --git a/sound/soc/samsung/auto_abox/generic/include/abox_ipc_generic.h b/sound/soc/samsung/auto_abox/generic/include/abox_ipc_generic.h
index c28a72306340..f5bca72706c9 100644
--- a/sound/soc/samsung/auto_abox/generic/include/abox_ipc_generic.h
+++ b/sound/soc/samsung/auto_abox/generic/include/abox_ipc_generic.h
@@ -58,19 +58,19 @@ enum INTER_PCMMSG {
 	INTER_PCMMSG_MAX	= 52,
 };
 
-struct PCMTASK_HW_PARAMS {
+struct pcmtask_hw_params {
 	int sample_rate;
 	int bit_depth;
 	int channels;
 };
 
-struct PCMTASK_SET_BUFFER {
+struct pcmtask_set_buffer {
 	int phyaddr;
 	int size;
 	int count;
 };
 
-struct PCMTASK_DMA_TRIGGER {
+struct pcmtask_dma_trigger {
 	int trigger;
 	int rbuf_offset;
 	int rbuf_cnt;
@@ -78,7 +78,7 @@ struct PCMTASK_DMA_TRIGGER {
 };
 
 /* Parameter of the PCMTASK command */
-struct INTER_IPC_PCMTASK_MSG {
+struct inter_ipc_pcmtask_msg {
 	enum INTER_PCMMSG msgtype;
 	int pcm_alsa_id;
 	int pcm_device_id;
@@ -88,14 +88,14 @@ struct INTER_IPC_PCMTASK_MSG {
 	unsigned int adsp;
 	unsigned long start_threshold;
 	union {
-		struct PCMTASK_HW_PARAMS hw_params;
-		struct PCMTASK_SET_BUFFER setbuff;
-		struct PCMTASK_DMA_TRIGGER dma_trigger;
+		struct pcmtask_hw_params hw_params;
+		struct pcmtask_set_buffer setbuff;
+		struct pcmtask_dma_trigger dma_trigger;
 	} param;
 };
 
 /* The parameter of the set_param */
-struct OFFLOAD_SET_PARAM {
+struct offload_set_param {
 	int sample_rate;
 	int bit_depth;
 	int channels;
@@ -104,12 +104,12 @@ struct OFFLOAD_SET_PARAM {
 };
 
 /* The parameter of the start */
-struct OFFLOAD_START {
+struct offload_start {
 	int id;
 };
 
 /* The parameter of the write */
-struct OFFLOAD_WRITE {
+struct offload_write {
 	int id;
 	int buff;
 	int size;
@@ -120,14 +120,14 @@ enum OFFLOADMSG {
 	OFFLOAD_OPEN = 1,
 	OFFLOAD_CLOSE,
 	OFFLOAD_SETPARAM,
-	OFFLOAD_START,
-	OFFLOAD_WRITE,
+	offload_start,
+	offload_write,
 	OFFLOAD_PAUSE,
 	OFFLOAD_STOP,
 };
 
 /* Parameter of the OFFLOADTASK command */
-struct INTER_IPC_OFFLOADTASK_MSG {
+struct inter_ipc_offloadtask_msg {
 	enum OFFLOADMSG msgtype;
 	int codec_id;
 	int pcm_device_id;
@@ -137,19 +137,19 @@ struct INTER_IPC_OFFLOADTASK_MSG {
 	int direction;
 	int domain_id;
 	union {
-		struct OFFLOAD_SET_PARAM setparam;
-		struct OFFLOAD_START start;
-		struct OFFLOAD_WRITE write;
-		struct PCMTASK_DMA_TRIGGER dma_trigger;
+		struct offload_set_param setparam;
+		struct offload_start start;
+		struct offload_write write;
+		struct pcmtask_dma_trigger dma_trigger;
 	} param;
 };
 
 struct _abox_inter_ipc_msg {
 	enum INTER_IPC_ID ipcid;
 	int task_id;
-	union INTER_IPC_MSG {
-		struct INTER_IPC_PCMTASK_MSG pcmtask;
-		struct INTER_IPC_OFFLOADTASK_MSG offload_task;
+	union inter_ipc_msg {
+		struct inter_ipc_pcmtask_msg pcmtask;
+		struct inter_ipc_offloadtask_msg offload_task;
 	} msg;
 };
 
@@ -159,8 +159,6 @@ typedef irqreturn_t (*ipc_generic_irq_handler_t)(struct device *dev, int irq_id,
 typedef int (*ipc_gen_request_xfer_t)(enum INTER_IPC_ID ipc_id, struct _abox_inter_ipc_msg *pmsg,
 	bool sync, struct __abox_inter_ipc_ret *ipc_ret, unsigned int adsp);
 
-struct abox_ipc_generic_irq_handler_t;
-
 struct abox_ipc_generic_data {
 	struct platform_device *pdev;
 	unsigned int num_irq;
@@ -168,6 +166,8 @@ struct abox_ipc_generic_data {
 	ipc_gen_request_xfer_t request_xfer;
 };
 
+extern struct platform_driver samsung_abox_ipc_generic_driver;
+
 int abox_ipc_generic_get_pcm_dev_handler_callback(struct device **dev_ipc_generic,
 	ipc_generic_irq_handler_t *handler);
 int abox_ipc_generic_register_xfer_callback(ipc_gen_request_xfer_t xfer);
diff --git a/sound/soc/samsung/auto_abox/generic/include/abox_pcm.h b/sound/soc/samsung/auto_abox/generic/include/abox_pcm.h
new file mode 100644
index 000000000000..30aebced6581
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/include/abox_pcm.h
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ALSA SoC - Interface definitions for Samsung Exynos ABOX PCM frontend driver.
+ *
+ * This header provides structure definitions, constants, and function
+ * declarations used by the abox_pcm_dev frontend audio driver.
+ *
+ * Intended for use by ABOX child drivers and solution manager modules.
+ */
+
+#ifndef __SND_SOC_ABOX_PCM_H
+#define __SND_SOC_ABOX_PCM_H
+
+struct snd_compr_stream;
+struct snd_codec;
+struct snd_pcm_hardware;
+struct snd_dma_buffer;
+struct snd_soc_pcm_runtime;
+
+struct abox_solution_mgr_data;
+
+#define ABOX_SAMPLING_RATES			(SNDRV_PCM_RATE_KNOT)
+#define ABOX_SAMPLE_FORMATS \
+	(SNDRV_PCM_FMTBIT_S16 | SNDRV_PCM_FMTBIT_S24 | SNDRV_PCM_FMTBIT_S32)
+
+#define DEFAULT_BUFFER_BYTES_MAX		(SZ_32K)
+#define PERIOD_BYTES_MIN			(SZ_128)
+
+#define GET_PERIOD_TIME(bit, ch, rate, period_bytes) \
+		(((long long)period_bytes * 1000000) / (long long)((bit * ch / 8) * rate))
+
+#define ABOX_PCM_NO_CONNECT		-1
+#define MAX_PCM_IRQ_ID			63
+
+enum abox_dma_ioctl_cmd {
+	ABOX_DMA_IOCTL_GET_DMA_STATUS,
+	ABOX_DMA_IOCTL_GET_BUF_STATUS,
+	ABOX_DMA_IOCTL_GET_BUF_OFFSET,
+	ABOX_DMA_IOCTL_GET_BUF_COUNT,
+	ABOX_DMA_IOCTL_SET_ADSP_INFO,
+	ABOX_DMA_IOCTL_MAX
+};
+
+enum abox_platform_category {
+	PLATFORM_DEEPBUFFER,
+	PLATFORM_COMPRESS,
+};
+
+enum abox_kernel_intr_log {
+	FUNC_LOG = BIT(0),
+	ISR_LOG = BIT(1),
+	POINTER_LOG = BIT(2),
+};
+
+typedef unsigned int (*dma_ioctl_fn)(struct device *dma_dev, enum abox_dma_ioctl_cmd cmd,
+	void *data);
+
+struct abox_platform_of_data {
+	struct snd_soc_dai_driver *base_dai_drv;
+	unsigned int num_of_dai_drv;
+};
+
+struct abox_compr_data {
+	/* compress offload */
+	struct snd_compr_stream *cstream;
+	struct snd_codec *codec;
+	uint32_t encoded_total_bytes;
+	uint32_t decoded_total_bytes;
+	uint32_t pcm_io_frames;
+};
+
+struct abox_platform_debug_log {
+	unsigned int set_fw_intr_gap;
+	unsigned int set_kernel_pcm_log;
+	ktime_t lastTime;
+};
+
+struct abox_platform_dma_info {
+	struct list_head list;
+	struct device *dma_dev;
+	int dma_id;
+	dma_ioctl_fn dma_ioctl;
+};
+
+struct abox_platform_data {
+	char *name;                       /* Device name (e.g., "PCM0 Playback") */
+	unsigned int id;                 /* PCM device index (0~31) */
+	unsigned int irq_id;            /* IRQ line index assigned to this PCM */
+	unsigned int pointer;           /* DMA or runtime pointer position */
+	unsigned int pcm_dev_num;       /* Device number from ALSA runtime */
+	unsigned int stream_type;       /* SNDRV_PCM_STREAM_{PLAYBACK,CAPTURE} */
+	int dma_id;                     /* Connected DMA ID, -1 if not connected */
+	unsigned int adsp;              /* ADSP usage flag or ID */
+	struct platform_device *pdev;   /* Owning platform device */
+	struct abox_solution_mgr_data *solution_mgr_data; /* Pointer to PP solution manager */
+
+	struct resource *pp_pointer_res;     /* Resource from DT for PP pointer */
+	void __iomem *pp_pointer_base;      /* Mapped base for PP pointer */
+	phys_addr_t pp_pointer_phys;        /* Physical address for PP pointer */
+	size_t pp_pointer_size;             /* Size of the PP pointer memory */
+
+	const struct abox_platform_of_data *of_data;  /* OF data for dai drivers */
+
+	struct snd_soc_component_driver *cmpnt_drv;   /* Component driver ops */
+	struct snd_soc_component *cmpnt;              /* Component pointer */
+	struct snd_pcm_substream *substream;          /* Active PCM substream */
+	struct snd_pcm_hardware *abox_dma_hardware;   /* PCM hw capabilities */
+	struct snd_pcm_hw_params *params;             /* Current hw_params */
+	struct snd_soc_dai_driver *dai_drv;           /* Associated DAI driver */
+	struct snd_soc_dapm_widget *plat_dapm_widgets; /* DAPM widgets */
+	struct snd_soc_dapm_route *plat_dapm_routes;   /* Primary DAPM routes */
+	struct snd_soc_dapm_route *plat_dapm_post_routes; /* Post routes */
+	struct snd_kcontrol_new *plat_kcontrol;       /* Kcontrols for routes */
+	struct snd_dma_buffer *dma_buffer;            /* DMA buffer (from ADSP) */
+	enum abox_platform_category category;         /* Deepbuffer or Compress */
+	struct abox_compr_data compr_data;            /* Compress stream info */
+	struct abox_platform_debug_log pcm_dbg_log;   /* Debug logging */
+	struct list_head dma_list_head;               /* Connected DMA list */
+};
+
+extern struct platform_driver samsung_abox_pcm_dev_driver;
+
+void abox_pcm_dev_attach_solution_mgr(struct device *pcm_dev,
+	struct abox_solution_mgr_data *solution_mgr_data);
+
+int abox_pcm_dev_attach_dma(struct device *pcm_dev, struct device *dma_dev, int dma_id,
+	dma_ioctl_fn dma_ioctl);
+
+int abox_pcm_dev_register_dma_route_kcontrol(struct device *pcm_dev, int num_of_dma);
+
+unsigned int abox_pcm_dev_status(struct device *pcm_dev);
+
+int abox_pcm_dev_release(struct platform_device *pdev);
+
+#endif /* __SND_SOC_ABOX_PCM_H */
diff --git a/sound/soc/samsung/auto_abox/generic/include/abox_solution_mgr.h b/sound/soc/samsung/auto_abox/generic/include/abox_solution_mgr.h
new file mode 100644
index 000000000000..daef1d5556cf
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/include/abox_solution_mgr.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Eunwoo Kim <ew.kim@samsung.com>
+ *
+ * EXYNOS Automotive Abox Solution Manager - abox_solution_mgr.h
+ *
+ * Header for managing software-based audio processing solutions for ABOX.
+ * Defines structures, enums, and function prototypes for solution control,
+ * used by both the fixed and variable parts of the ABOX audio driver stack.
+ */
+
+#ifndef __SND_SOC_SAMSUNG_ABOX_SOLUTION_MGR_H
+#define __SND_SOC_SAMSUNG_ABOX_SOLUTION_MGR_H
+
+#define ABOX_SOLUTION_NAME_LEN	64
+
+struct abox_solution_mgr_data;
+struct abox_solution_data;
+
+enum abox_solution_ops_type {
+	ABOX_SOL_CONSTRUCT,
+	ABOX_SOL_DESTRUCT,
+	ABOX_SOL_OPEN,
+	ABOX_SOL_CLOSE,
+	ABOX_SOL_HW_PARAM,
+	ABOX_SOL_HW_FREE,
+	ABOX_SOL_PREPARE,
+	ABOX_SOL_TRIGGER
+};
+
+enum abox_solution_type {
+	ABOX_SOL_SW,
+	ABOX_SOL_HW,
+	ABOX_SOL_MAX
+};
+
+enum abox_solution_hw_info {
+	ABOX_SOL_RATE,
+	ABOX_SOL_BIT_DEPTH,
+	ABOX_SOL_CHANNEL,
+	ABOX_SOL_HW_INFO_MAX
+};
+
+/* Keep in sync with solution_mgr implementation */
+enum abox_solution_ioctl_cmd {
+	ABOX_SOL_IOCTL_REQUEST_TO_ADD_SOLUTION,
+	ABOX_SOL_IOCTL_REQUEST_TO_REMOVE_SOLUTION,
+	ABOX_SOL_IOCTL_GET_SOLUTION,
+	ABOX_SOL_IOCTL_GET_SOLUTION_NAME,
+	ABOX_SOL_IOCTL_SET_SOLUTION_CONNECT,
+	ABOX_SOL_IOCTL_ADD_SOLUTION_CONTROLS,
+};
+
+typedef int (*sol_proxy_ioctl_fn)(struct device *proxy_dev, enum abox_solution_ioctl_cmd cmd,
+	void *p_data, void **pp_data);
+typedef int (*sol_proxy_ops_callback_fn)(struct device *dev, enum abox_solution_type type,
+	enum abox_solution_ops_type ops_type, int cmd, void *data);
+
+struct abox_solution_ops {
+	int (*construct)(struct device *dev, struct abox_solution_data *solution_data);
+	int (*destruct)(struct device *dev, struct abox_solution_data *solution_data);
+	int (*open)(struct device *dev, struct abox_solution_data *solution_data, void *data);
+	int (*close)(struct device *dev, struct abox_solution_data *solution_data);
+	int (*hw_params)(struct device *dev, struct abox_solution_data *solution_data, void *data);
+	int (*hw_free)(struct device *dev, struct abox_solution_data *solution_data);
+	int (*prepare)(struct device *dev, struct abox_solution_data *solution_data);
+	int (*trigger)(struct device *dev, struct abox_solution_data *solution_data, int cmd);
+};
+
+struct abox_solution_controls {
+	struct snd_kcontrol_new *controls;
+	int num_of_controls;
+};
+
+/**
+ * struct abox_solution_mgr_data - Solution manager state for one PCM
+ */
+struct abox_solution_mgr_data {
+	bool pp_enabled;
+	void **solution_list;
+	int num_of_solution;
+	void **solution_chain;
+	struct abox_solution_controls control_list;
+};
+
+int abox_solution_mgr_ops(struct device *dev, enum abox_solution_type type,
+	enum abox_solution_ops_type ops_type, int cmd, void *data);
+int abox_solution_mgr_add_controls(struct device *pcm_dev, struct snd_soc_component *component);
+
+void abox_solution_mgr_register_ops_callback(sol_proxy_ops_callback_fn callback);
+
+int abox_solution_mgr_init(struct device *proxy_dev, int num_of_solution, char **enum_str,
+	sol_proxy_ioctl_fn proxy_ioctl);
+
+int abox_solution_mgr_deinit(struct device *proxy_dev);
+
+#endif /* __SND_SOC_SAMSUNG_ABOX_SOLUTION_MGR_H */
diff --git a/sound/soc/samsung/auto_abox/generic/include/abox_util_generic.h b/sound/soc/samsung/auto_abox/generic/include/abox_util_generic.h
new file mode 100644
index 000000000000..15b5087353e6
--- /dev/null
+++ b/sound/soc/samsung/auto_abox/generic/include/abox_util_generic.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Eunwoo Kim <ew.kim@samsung.com>
+ *
+ * EXYNOS Automotive Abox Utility - abox_util_generic.h
+ *
+ * Common macros and utility functions used by ABOX frontend and backend drivers.
+ */
+
+#ifndef __SND_SOC_ABOX_UTIL_GENERIC_H
+#define __SND_SOC_ABOX_UTIL_GENERIC_H
+
+#include <sound/pcm.h>
+
+#define DEFAULT_STR_SIZE	32
+#define ENUM_CTRL_STR_SIZE	32
+
+/*
+ * Define a DAPM buffer widget without event.
+ *
+ * @wname:  Widget name (string)
+ * @wreg:   Register index (used for routing control)
+ * @wcontrols: Pointer to associated kcontrols (can be NULL)
+ */
+#define ABOX_SND_SOC_DAPM_BUFFER(wname, wreg, wcontrols) \
+{	.id = snd_soc_dapm_buffer, .name = wname, .reg = wreg, \
+	.kcontrol_news = wcontrols, .num_kcontrols = 0}
+
+/*
+ * Define a DAPM buffer widget with event callback.
+ *
+ * @wname:  Widget name
+ * @wreg:   Register index
+ * @wcontrols: Pointer to kcontrols
+ * @wevent: Widget event handler
+ * @wflags: Event trigger condition flags (e.g., SND_SOC_DAPM_POST_PMU)
+ */
+#define ABOX_SND_SOC_DAPM_BUFFER_E(wname, wreg, wcontrols, \
+	wevent, wflags) \
+{	.id = snd_soc_dapm_buffer, .name = wname, .reg = wreg, \
+	.kcontrol_news = wcontrols, .num_kcontrols = 0, \
+	.event = wevent, .event_flags = wflags}
+
+/*
+ * Define an ASRC (Asynchronous Sample Rate Converter) widget.
+ *
+ * @wname:     Widget name
+ * @wreg:      Register index
+ * @wshift:    Bit shift
+ * @winvert:   Bit inversion flag
+ * @wcontrols: Array of kcontrols
+ * @wncontrols: Number of controls
+ */
+#define ABOX_SND_SOC_DAPM_ASRC(wname, wreg, wshift, winvert,\
+	 wcontrols, wncontrols) \
+{	.id = snd_soc_dapm_asrc, .name = wname, \
+	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
+	.kcontrol_news = wcontrols, .num_kcontrols = wncontrols}
+
+/*
+ * Define a mixer control using SOC_SINGLE_VALUE with external get/put handlers.
+ *
+ * @xname:        Control name
+ * @xinfo:        Info callback function
+ * @xreg:         Register address
+ * @xshift:       Bit shift for the control value
+ * @xmax:         Maximum value of the control
+ * @xinvert:      Bit inversion flag
+ * @xhandler_get: Getter function
+ * @xhandler_put: Setter function
+ */
+#define ABOX_SOC_SINGLE_EXT_MULTI(xname, xinfo, xreg, xshift, xmax, xinvert, \
+	 xhandler_get, xhandler_put) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = xinfo, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.private_value = SOC_SINGLE_VALUE(xreg, xshift, xmax, xinvert, 0) }
+
+/*
+ * Define a mixer enum control with external get/put handlers.
+ *
+ * @xname:  Control name
+ * @xenum:  soc_enum pointer
+ * @xinfo:  Info callback function
+ * @xget:   Get callback function
+ * @xput:   Set callback function
+ */
+#define ABOX_SOC_DAPM_ENUM_EXT_MULTI(xname, xenum, xinfo, xget, xput) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = xinfo, \
+	.get = xget, \
+	.put = xput, \
+	.private_value = (unsigned long)&xenum }
+
+/*
+ * deallocate_dma_memory - Free DMA memory allocated to a PCM substream
+ * @dev: device requesting deallocation
+ * @substream: PCM substream associated with the buffer
+ */
+void deallocate_dma_memory(struct device *dev, struct snd_pcm_substream *substream);
+
+/*
+ * set_hw_params - Configure PCM hardware parameters from device tree
+ * @np: device node containing hw parameter properties
+ * @hw: target snd_pcm_hardware struct to populate
+ */
+void set_hw_params(const struct device_node *np, struct snd_pcm_hardware *hw);
+
+#endif /* __SND_SOC_ABOX_UTIL_GENERIC_H */
-- 
2.25.1

