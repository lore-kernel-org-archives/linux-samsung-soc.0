Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD7E1862F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727847229; cv=none; b=nvbyIAvfS+oBYqGlHe0c+eeNx6ffJPcfPtVpoyvTTRFE0UI0jpcFtwBxlQmmkC/uaCjZocL5yiRR3JpRqlAtHpeOy2Aqutw9zpT5eTa/HGr1CFHIPufH3jmDOY6E8N3e06fEh4qssfClpTz71QMRudoeqm5KMldTJ6bo+dyqwl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727847229; c=relaxed/simple;
	bh=WMsmV92SdO2+bnQBFJlCttUVAw3d6Iv66OnOW109FMs=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=SFd+PW1UVvZN8zRt1J1lJxFBWgobxTZqwTMjHWz31b0McoRcU9WdohuvyN2TYOJAhlqMISaA+2i1736blDg/m1xGTHKTKVmvwOiRklNXP5o4bVNMvqrqvHm655ZW2M73n4fiWxUkyPxJQUtE1EDBO8TQ9wAAA4p0pGNFpcYMsNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AxULT9/G; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AxULT9/G"
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241002053344epoutp02160742ae29b8873b652707bb4d035d91~6i_VPCsEZ2858528585epoutp02b
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241002053344epoutp02160742ae29b8873b652707bb4d035d91~6i_VPCsEZ2858528585epoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727847224;
	bh=+CnJS+UU+hqdeqr+7JTcjS+lYJAofjI884KNBCHZSFA=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=AxULT9/GVJdYhjYVNSKrnA9AENN4dz2ufE69KmyghaJ997ccHBNBjRNBlONiSFhTt
	 1qwJzjjxf9MeHWyiqKz1PlZ+l1YqYZ9LChtZFrtYiM2lYP7ntUSckpc1YmKUEWUfIW
	 g7ALL6Q5XM5lKQStaEWbCLiNl5bAY0nxzWKOmyDY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20241002053343epcas1p499228d87db0d650869db4e43ee9bae7a~6i_U516812542525425epcas1p4J;
	Wed,  2 Oct 2024 05:33:43 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.134]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XJNlB5Ly7z4x9QC; Wed,  2 Oct
	2024 05:33:42 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	CA.95.09435.63BDCF66; Wed,  2 Oct 2024 14:33:42 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20241002053341epcas1p48b37d3b2b91dbab9ad702af35d7aa5d1~6i_TRldHO1369513695epcas1p46;
	Wed,  2 Oct 2024 05:33:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241002053341epsmtrp2a7097b4b43d2775951af863bd706d3bc~6i_TQ3eZN3062730627epsmtrp2i;
	Wed,  2 Oct 2024 05:33:41 +0000 (GMT)
X-AuditID: b6c32a36-ac7ff700000024db-1e-66fcdb362d85
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	AF.84.08229.53BDCF66; Wed,  2 Oct 2024 14:33:41 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241002053341epsmtip10d938e936f3fcb54e8b8d1c35c6a0c29~6i_S-6hl42184921849epsmtip13;
	Wed,  2 Oct 2024 05:33:41 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Date: Wed, 02 Oct 2024 14:33:21 +0900
Subject: [PATCH WIP 1/7] drm/exynos: Initial Exynosautov9 drm
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-auto9-v1-1-c4dc3385f415@samsung.com>
In-Reply-To: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,  David Virag
	<virag.david003@gmail.com>,  Sam Protsenko <semen.protsenko@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Kwanghoon Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgk+LIzCtJLcpLzFFi42LZdlhTT9fs9p80g1VrpSwezNvGZjHp/gQW
	i941V5kszp/fwG4x4/w+JovnfUDi+PvHjA7sHjtn3WX32LSqk83jzrU9bB59W1YxenzeJBfA
	GpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0hpJC
	WWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLRArzgxt7g0L10vL7XEytDAwMgUqDAh
	O2NOe07BxY2MFdt3bWFvYPw8gbGLkYNDQsBEYssRjS5GLg4hgR2MEmc3fWODcD4xSnT3nmWH
	cL4xSjxbewmogxOs486K81BVexklHrZ1MUI4rxglvs84wAZSxSagLrGkbS07iM0ioCqxbMl5
	ZhBbWMBW4vmlxywgNq+AoMTJmU/AbGYBeYntb+cwQ8StJF7d+M4EYnMKWEusuvUUbLOIwGlG
	if9zFSHqPSRmPFvHDnGRsMTn3WvALpIQ+MsucWjbWSaIhItE+8cpzDBFr45vgWqQkvj8bi8b
	hJ0tcfQjjF0icX3WIlYI21hi/9LJTKBAYhbQlFi/Sx9iL5/Eu689rJCw45XoaBOCMOUlbnWW
	QzSKSpx5+hFqoIfEyjX9LJDg6WOUuHXkNOsERvlZSL6fheT7WQjLFjAyr2IUSy0ozk1PLTYs
	MILHanJ+7iZGcFLUMtvBOOntB71DjEwcjIcYJTiYlUR47x36mSbEm5JYWZValB9fVJqTWnyI
	0RQYBxOZpUST84FpOa8k3tDE0sDEzMjYxMLQzFBJnPfMlbJUIYH0xJLU7NTUgtQimD4mDk6p
	Bqa1UaZX+2raFHoEf3h/2T6ZV3FFxkQps4YVc8sn39JNnHTeKVb2cm+kH0ebiH7qp/Z3/xaY
	Pi08sP81H+ORnVNVNTpva26dk7ix8cfs+ToHp076qy3SUbPHw0XxJ0fUuQxRn2nuq45L8K3j
	cl+zM+THLv7j+z6EWpf6ZhxfEh+RW+a3wKyCefWEstN/6zj4fzBmdbDz3T3BdS9+1Zoz38qs
	rmx9uk3iSOOtP87NP5+rBW9ne771gsz5X59y5KarTkyxkmir+K3LGFZys+bab7elggdcr51n
	P/zXeUna5BNzrAP0/PXO1lWrclw9asHbmnjkujtz4e6Dxhy5b57d2JT7/zkb/5LYu/8EpU2X
	sJ5VYinOSDTUYi4qTgQABsRiMxMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsWy7bCSnK7p7T9pBr3T9S0ezNvGZjHp/gQW
	i941V5kszp/fwG4x4/w+JovnfUDi+PvHjA7sHjtn3WX32LSqk83jzrU9bB59W1YxenzeJBfA
	GsVlk5Kak1mWWqRvl8CVMac9p+DiRsaK7bu2sDcwfp7A2MXIySEhYCJxZ8V5ti5GLg4hgd2M
	EpfP9LFDJEQlOi43AhVxANnCEocPF0PUvACq2fiQCaSGTUBdYknbWrB6FgFViWVLzjOD2MIC
	thLPLz1mAbF5BQQlTs58wgIyh1lAU2L9Ln2QMLOAvMT2t3OYIUqsJF7d+A42UgjIXrvzDSuI
	zSlgLbHq1lNGkL0iAucYJa792csO0ewhMePZOqg7hSU+717DNoFRcBaSdbMQ1s1Csm4BI/Mq
	RsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgKNDS3MG4fdUHvUOMTByMhxglOJiVRHjv
	HfqZJsSbklhZlVqUH19UmpNafIhRmoNFSZxX/EVvipBAemJJanZqakFqEUyWiYNTqoHJ+3DZ
	e46n3zLWO2YL2s6xv28zYfrKFUKTZOZvq+s427nVqjXikYBu6MnjhWEv1k/bKK7g+nvB5bz4
	aY9vzmVfzXxfmC3gixuDgm/bgfzQled2LqtmC5KRMSotZF/U+0jIRdd/hvGy5C7BPQons787
	OSzb9/GgSeacRWvdr92KebUgdcfaxZKL+TJN1pgVic6dy/JQftHsTTn8QqsMxXeWqRmGeIVO
	VJ5VtsqTaaa06sOIs46GDxKdPl1q8ZiuoeYTvEfzrdZR5oCt0yfEtt3lvp1dp1rGfYT3S9oG
	teB3EYl8c798sXDIu1jsLN/1SUol4+qane99lre95f/KqHjH7f1Rtfk+nfIyxWECPO+VWIoz
	Eg21mIuKEwFoJp7w8QIAAA==
X-CMS-MailID: 20241002053341epcas1p48b37d3b2b91dbab9ad702af35d7aa5d1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241002053341epcas1p48b37d3b2b91dbab9ad702af35d7aa5d1
References: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
	<CGME20241002053341epcas1p48b37d3b2b91dbab9ad702af35d7aa5d1@epcas1p4.samsung.com>

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig          |  17 ++
 drivers/gpu/drm/exynos/Makefile         |   3 +
 drivers/gpu/drm/exynos/exynos_dpp.c     |  96 ++++++++++
 drivers/gpu/drm/exynos/exynos_dpp.h     | 278 +++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_dpu_dma.c | 330 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_dpu_dma.h |  16 ++
 6 files changed, 740 insertions(+)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 733b109a5095..f072743c36a0 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -17,6 +17,23 @@ if DRM_EXYNOS
 
 comment "CRTCs"
 
+config DRM_EXYNOS9_DECON
+	bool "DECON on Exynos9"
+	default DRM_EXYNOS
+	select EXYNOS_IOMMU
+	help
+	  Choose this option if you want to use Exynos DECON for DRM.
+
+config DRM_EXYNOS9_DP
+	bool "DisplayPort TX on Exynos"
+	depends on DRM_EXYNOS9_DECON
+	select DRM_PANEL
+	select DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_DP_HELPER
+	default DRM_EXYNOS
+	help
+	  This enables support for Exynos DisplayPort device.
+
 config DRM_EXYNOS_FIMD
 	bool "FIMD"
 	depends on !FB_S3C
diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 2fd2f3ee4fcf..93394501f975 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -6,6 +6,9 @@
 exynosdrm-y := exynos_drm_drv.o exynos_drm_crtc.o exynos_drm_fb.o \
 		exynos_drm_gem.o exynos_drm_plane.o exynos_drm_dma.o
 
+exynosdrm-$(CONFIG_DRM_EXYNOS9_DECON)	+= exynos9_decon.o exynos_dpp.o exynos_dpu_dma.o
+exynosdrm-$(CONFIG_DRM_EXYNOS9_DP)	+= exynos_drm_dp.o exynos_drm_dp_link_training.o
+
 exynosdrm-$(CONFIG_DRM_FBDEV_EMULATION) += exynos_drm_fbdev.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o
 exynosdrm-$(CONFIG_DRM_EXYNOS5433_DECON)	+= exynos5433_drm_decon.o
diff --git a/drivers/gpu/drm/exynos/exynos_dpp.c b/drivers/gpu/drm/exynos/exynos_dpp.c
new file mode 100644
index 000000000000..183af97460c9
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_dpp.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/component.h>
+#include <linux/irq.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/exynos_drm.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_framebuffer.h>
+
+#include "exynos_dpp.h"
+#include "exynos_drm_fb.h"
+
+#define DPP_RGB_IMG_WIDTH_MIN 16
+#define DPP_RGB_IMG_WIDTH_MAX 8192
+#define DPP_RGB_IMG_WIDTH_ALIGN 1
+
+#define DPP_RGB_IMG_HEIGHT_MIN 16
+#define DPP_RGB_IMG_HEIGHT_MAX 4096
+#define DPP_RGB_IMG_HEIGHT_ALIGN 1
+
+#define DPP_YUV_IMG_WIDTH_MIN 32
+#define DPP_YUV_IMG_WIDTH_MAX 8192
+#define DPP_YUV_IMG_WIDTH_ALIGN 2
+
+#define DPP_YUV_IMG_HEIGHT_MIN 16
+#define DPP_YUV_IMG_HEIGHT_MAX 4096
+#define DPP_YUV_IMG_HEIGHT_ALIGN 2
+
+static const struct of_device_id dpp_of_match[] = {
+	{ .compatible = "samsung,exynosauto-dpp" },
+	{},
+};
+
+void dpp_update(struct exynos_dpp_context *dpp, unsigned int channel,
+		const struct exynos_drm_plane_state *state)
+{
+	writel(DPP_IMG_FORMAT(0), dpp->regs + 0x1000 + DPP_IN_CON);
+	writel(DPP_IMG_HEIGHT(state->src.h) | DPP_IMG_WIDTH(state->src.w),
+	       dpp->regs + 0x1000 + DPP_IMG_SIZE);
+}
+
+static int dpp_bind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *devpriv = drm_dev->dev_private;
+
+	devpriv->dpp_dev = dev;
+
+	return 0;
+}
+
+static const struct component_ops dpp_component_ops = {
+	.bind = dpp_bind,
+};
+
+static int dpp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct exynos_dpp_context *dpp;
+	struct resource *res;
+
+	dpp = devm_kzalloc(dev, sizeof(struct exynos_dpp_context), GFP_KERNEL);
+	if (!dpp)
+		return -ENOMEM;
+
+	dpp->dev = dev;
+
+	dpp->aclk = devm_clk_get_enabled(dpp->dev, "aclk");
+	if (IS_ERR(dpp->aclk))
+		pr_err("failed to get clock");
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	dpp->regs = devm_ioremap_resource(dev, res);
+
+	platform_set_drvdata(pdev, dpp);
+
+	return component_add(dev, &dpp_component_ops);
+}
+
+struct platform_driver dpp_driver = {
+	.probe = dpp_probe,
+	.driver = {
+		   .name = "dpp",
+		   .of_match_table = dpp_of_match,
+	},
+};
diff --git a/drivers/gpu/drm/exynos/exynos_dpp.h b/drivers/gpu/drm/exynos/exynos_dpp.h
new file mode 100644
index 000000000000..a76b3bd09670
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_dpp.h
@@ -0,0 +1,278 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Samsung ExynosAuto DRM DPP(Display Pre-Processor) driver Header
+ *
+ * Copyright (C) 2018 Samsung Electronics Co.Ltd
+ */
+
+#ifndef _EXYNOS_DRM_DPP_H_
+#define _EXYNOS_DRM_DPP_H_
+
+#include <linux/clk.h>
+#include "exynos_drm_drv.h"
+
+/*
+ * DPUM  DPP base: 0x18C2_0000
+ * - DPP GF0 offset: 0x1000
+ * - DPP GF1 offset: 0x2000
+ * - DPP GF2 offset: 0x3000
+ * - DPP GF3 offset: 0x4000
+ * - DPP GF4 offset: 0x5000
+ * - DPP GF5 offset: 0x6000
+ * - DPP VG0 offset: 0x7000
+ * - DPP VG1 offset: 0x8000
+ */
+#define DPP_ENABLE 0x0000
+#define DPP_SRSET (1 << 24)
+#define DPP_HDR_SEL (1 << 11)
+#define DPP_SFR_CLOCK_GATE_EN (1 << 10)
+#define DPP_SRAM_CLOCK_GATE_EN (1 << 9)
+#define DPP_INT_CLOCK_GATE_EN (1 << 8)
+#define DPP_ALL_CLOCK_GATE_EN_MASK (0x7 << 8)
+#define DPP_PSLVERR_EN (1 << 5)
+#define DPP_SFR_UPDATE_FORCE (1 << 4)
+#define DPP_QCHANNEL_EN (1 << 3)
+#define DPP_OP_STATUS (1 << 2)
+#define DPP_TZPC_FLAG (1 << 0)
+
+#define DPP_IRQ 0x0004
+#define DPP_CONFIG_ERROR (1 << 21)
+#define DPP_STATUS_FRAMEDONE_IRQ (1 << 16)
+#define DPP_ALL_IRQ_CLEAR (0x21 << 16)
+#define DPP_CONFIG_ERROR_MASK (1 << 6)
+#define DPP_IRQ_FRAMEDONE_MASK (1 << 1)
+#define DPP_ALL_IRQ_MASK (0x21 << 1)
+#define DPP_IRQ_ENABLE (1 << 0)
+#define DPP_ALL_IRQ (DPP_CONFIG_ERROR | DPP_STATUS_FRAMEDONE_IRQ)
+
+#define DPP_IN_CON 0x0008
+#define DPP_CSC_TYPE(_v) ((_v) << 18)
+#define DPP_CSC_TYPE_MASK (3 << 18)
+#define DPP_CSC_RANGE(_v) ((_v) << 17)
+#define DPP_CSC_RANGE_MASK (1 << 17)
+#define DPP_CSC_MODE(_v) ((_v) << 16)
+#define DPP_CSC_MODE_MASK (1 << 16)
+#define DPP_DITH_MASK_SEL (1 << 5)
+#define DPP_DITH_MASK_SPIN (1 << 4)
+// #define DPP_ALPHA_SEL(_v)			((_v) << 3)
+// #define DPP_ALPHA_SEL_MASK			(1 << 3)
+#define DPP_IMG_FORMAT(_v) ((_v) << 0)
+#define DPP_IMG_FORMAT_MASK (0x7 << 0)
+#define DPP_IMG_FORMAT_ARGB8888 (0 << 0)
+#define DPP_IMG_FORMAT_ARGB8101010 (1 << 0)
+/* VG only */
+#define DPP_IMG_FORMAT_YUV420_8P (2 << 0)
+#define DPP_IMG_FORMAT_YUV420_P010 (3 << 0)
+#define DPP_IMG_FORMAT_YUV420_8P2 (4 << 0)
+#define DPP_IMG_FORMAT_YUV422_8P (5 << 0)
+#define DPP_IMG_FORMAT_YUV422_P210 (6 << 0)
+#define DPP_IMG_FORMAT_YUV422_8P2 (7 << 0)
+
+#define DPP_IMG_SIZE 0x0018
+#define DPP_IMG_HEIGHT(_v) ((_v) << 16)
+#define DPP_IMG_HEIGHT_MASK (0x1FFF << 16)
+#define DPP_IMG_WIDTH(_v) ((_v) << 0)
+#define DPP_IMG_WIDTH_MASK (0x1FFF << 0)
+enum dpp_attr {
+	DPP_ATTR_AFBC = 0,
+	DPP_ATTR_SAJC = 0,
+	DPP_ATTR_BLOCK = 1,
+	DPP_ATTR_FLIP = 2,
+	DPP_ATTR_ROT = 3, /* [KITT2] OTF Rotation is spec-out. */
+	DPP_ATTR_CSC = 4,
+	DPP_ATTR_SCALE = 5,
+	DPP_ATTR_HDR = 6,
+	DPP_ATTR_C_HDR = 7,
+	DPP_ATTR_C_HDR10_PLUS = 8,
+	DPP_ATTR_WCG = 9,
+	DPP_ATTR_SBWC = 10,
+	DPP_ATTR_HDR10_PLUS = 11,
+
+	DPP_ATTR_IDMA = 16,
+	DPP_ATTR_ODMA = 17,
+	DPP_ATTR_DPP = 18,
+	DPP_ATTR_SRAMC = 19,
+	DPP_ATTR_HDR_COMM = 20,
+};
+
+enum dpp_comp_type {
+	COMP_TYPE_NONE = 0,
+	COMP_TYPE_AFBC,
+	COMP_TYPE_SAJC,
+	COMP_TYPE_SBWC, /* lossless */
+	COMP_TYPE_SBWCL, /* lossy */
+};
+
+enum dpp_comp_blk_size {
+	/* SAJC indepedent block size */
+	SAJC_BLK_64B = 0,
+	SAJC_BLK_128B = 1,
+	SAJC_BLK_256B = 2,
+	/* SBWC blk byte num */
+	SBWC_BLK_32x2 = 2,
+	SBWC_BLK_32x3 = 3,
+	SBWC_BLK_32x4 = 4,
+	SBWC_BLK_32x5 = 5,
+	SBWC_BLK_32x6 = 6,
+};
+
+struct dpp_regs {
+	void __iomem *dpp_base_regs;
+	void __iomem *dma_base_regs;
+	void __iomem *dma_common_base_regs;
+	void __iomem *sramc_base_regs;
+	void __iomem *votf_base_regs;
+	void __iomem *scl_coef_base_regs;
+	void __iomem *hdr_comm_base_regs;
+	void __iomem *dpp_debug_base_regs;
+};
+
+/*
+ *                      src_width
+ *    -----------------------------------------------
+ *    | src_offset_x,                               |
+ *    | src_offset_y    img_width                   |
+ *    |      0-------------------------------       |
+ *    |      |//blk_offset_x,///////////////|       |
+ *    |      |//blk_offset_y////////////////|       |
+ *    |      |////0-------------//blk///////| img   |  src
+ *    |      |////|            |/height/////|height | height
+ *    |      |////--------------////////////|       |
+ *    |      |///////blk_width//////////////|       |
+ *    |      --------------------------------       |
+ *    |                                             |
+ *    -----------------------------------------------
+ *
+ *                              ///// accessed region
+ */
+struct dpp_region {
+	unsigned int src_width, src_height;
+	unsigned int src_offset_x, src_offset_y;
+
+	unsigned int img_width, img_height;
+
+	unsigned int blk_width, blk_height;
+	unsigned int blk_offset_x, blk_offset_y;
+};
+
+struct decon_frame {
+	int x;
+	int y;
+	u32 w;
+	u32 h;
+	u32 f_w;
+	u32 f_h;
+};
+
+struct decon_win_rect {
+	int x;
+	int y;
+	u32 w;
+	u32 h;
+};
+
+enum dpp_bpc {
+	DPP_BPC_8 = 0,
+	DPP_BPC_10,
+};
+
+struct dpp_config {
+	struct dpp_region region;
+	// enum dpu_pixel_format format;
+	u32 idma_addr[4];
+
+	bool is_bist;
+	bool is_afbc;
+	bool is_scale;
+	bool is_block;
+	bool is_4p;
+	u32 y_2b_strd;
+	u32 c_2b_strd;
+
+	u32 afbc_recov_cnt;
+};
+
+#define MAX_PLANE_ADDR_CNT 4
+
+struct dpp_params_info {
+	struct decon_frame src;
+	struct decon_frame dst;
+	struct decon_win_rect block;
+	u32 rot;
+
+	u32 min_luminance; /* TODO: remove, if can */
+	u32 max_luminance; /* TODO: remove, if can */
+	u32 y_hd_y2_stride; /* Luminance header (or Y-2B) stride */
+	u32 y_pl_c2_stride; /* Luminance payload (or C-2B) stride */
+	u32 c_hd_stride; /* Chrominance header stride */
+	u32 c_pl_stride; /* Chrominance payload stride */
+
+	bool is_scale;
+	bool is_block;
+	u32 format;
+	dma_addr_t addr[MAX_PLANE_ADDR_CNT];
+	u32 dataspace;
+	int h_ratio;
+	int v_ratio;
+	u32 standard;
+	u32 transfer;
+	u32 range;
+	u32 split;
+	enum dpp_bpc in_bpc;
+
+	unsigned long rcv_num;
+	enum dpp_comp_type comp_type;
+	enum dpp_comp_blk_size blk_size;
+
+	/* votf for output */
+	bool votf_o_en;
+	u32 votf_o_idx;
+	u32 votf_o_base_addr;
+	u32 votf_o_mfc_addr;
+
+	bool votf_en;
+	u32 votf_buf_idx;
+	u32 votf_base_addr;
+
+	/* v910 backward compatibility */;
+	struct dpp_config config_v1;
+};
+
+enum dpp_irq_type {
+	I_FRAMEDONE,
+	I_DEADLOCK,
+	I_READSLAVE,
+	I_CONFIG_ERR,
+	I_FRAMESTART,
+};
+
+/* reference between dpp device and decon/wod. */
+struct dpp_dev_data {
+	const struct dpp_cal_ops *cal_ops;
+	unsigned long irqflags;
+
+	const u8 nr_idma;
+	const u8 nr_dpuf;
+	const unsigned long attr;
+	const u32 *pixel_formats;
+	const u32 num_pixel_formats;
+};
+
+enum dpp_state {
+	DPP_STATE_OFF = 0,
+	DPP_STATE_ON,
+	DPP_STATE_WAIT_OFF,
+};
+
+struct exynos_dpp_context {
+	struct device *dev;
+	void __iomem *regs;
+
+	u32 type;
+	struct clk *aclk;
+};
+
+void dpp_update(struct exynos_dpp_context *dpp, unsigned int channel,
+		const struct exynos_drm_plane_state *state);
+
+#endif
diff --git a/drivers/gpu/drm/exynos/exynos_dpu_dma.c b/drivers/gpu/drm/exynos/exynos_dpu_dma.c
new file mode 100644
index 000000000000..57089d64dbd4
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_dpu_dma.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+
+#include "exynos_drm_fb.h"
+#include "exynos_dpu_dma.h"
+
+#define DMA_SHD_OFFSET 0x0800
+
+#define DPU_DMA_TEST_PATTERN0_3 0x0020
+#define DPU_DMA_TEST_PATTERN0_2 0x0024
+#define DPU_DMA_TEST_PATTERN0_1 0x0028
+#define DPU_DMA_TEST_PATTERN0_0 0x002C
+#define DPU_DMA_TEST_PATTERN1_3 0x0030
+#define DPU_DMA_TEST_PATTERN1_2 0x0034
+#define DPU_DMA_TEST_PATTERN1_1 0x0038
+#define DPU_DMA_TEST_PATTERN1_0 0x003C
+#define DPU_DMA_DEBUG_DATA 0x0104
+
+/*
+ * 1.1 - IDMA Register
+ * < DMA.offset >
+ *  G0      G1      G2      G3      GF0     GF1     VG0     VG1
+ *  0x1000  0x2000  0x3000  0x4000  0x5000  0x6000  0x7000  0x8000
+ */
+
+/* Channel order GF0, G0, VG0, G1, GF1, G2, VG1, G3 */
+static unsigned int channel_map[] = { 5, 1, 7, 2, 6, 3, 8, 4 };
+
+#define IDMA_ENABLE 0x0000
+#define IDMA_IRQ 0x0004
+#define IDMA_AFBC_CONFLICT_IRQ BIT(25)
+#define IDMA_VR_CONFLICT_IRQ BIT(24)
+#define IDMA_AFBC_TIMEOUT_IRQ BIT(23)
+#define IDMA_RECOVERY_START_IRQ BIT(22)
+#define IDMA_CONFIG_ERROR BIT(21)
+#define IDMA_LOCAL_HW_RESET_DONE BIT(20)
+#define IDMA_READ_SLAVE_ERROR BIT(19)
+#define IDMA_STATUS_DEADLOCK_IRQ BIT(17)
+#define IDMA_STATUS_FRAMEDONE_IRQ BIT(16)
+#define IDMA_ALL_IRQ_CLEAR (0x3FB << 16)
+
+#define IDMA_ALL_IRQ                                                           \
+	(IDMA_AFBC_CONFLICT_IRQ | IDMA_VR_CONFLICT_IRQ |                       \
+	 IDMA_AFBC_TIMEOUT_IRQ | IDMA_RECOVERY_START_IRQ | IDMA_CONFIG_ERROR | \
+	 IDMA_LOCAL_HW_RESET_DONE | IDMA_READ_SLAVE_ERROR |                    \
+	 IDMA_STATUS_DEADLOCK_IRQ | IDMA_STATUS_FRAMEDONE_IRQ)
+
+#define IDMA_AFBC_CONFLICT_MASK BIT(10)
+#define IDMA_CONFIG_ERROR_MASK BIT(6)
+#define IDMA_READ_SLAVE_ERROR_MASK BIT(4)
+#define IDMA_IRQ_DEADLOCK_MASK BIT(2)
+#define IDMA_IRQ_FRAMEDONE_MASK BIT(1)
+#define IDMA_ALL_IRQ_MASK (0x3FB << 1)
+#define IDMA_IRQ_ENABLE BIT(0)
+
+#define IDMA_IN_CON 0x0008
+#define IDMA_IMG_FORMAT(_v) ((_v) << 11)
+#define IDMA_IMG_FORMAT_MASK (0x3f << 11)
+#define IDMA_IMG_FORMAT_ARGB8888 (0)
+
+#define IDMA_BLOCK_EN BIT(3)
+
+#define IDMA_SRC_SIZE 0x0010
+#define IDMA_SRC_HEIGHT(_v) ((_v) << 16)
+#define IDMA_SRC_HEIGHT_MASK (0x3FFF << 16)
+#define IDMA_SRC_WIDTH(_v) ((_v) << 0)
+#define IDMA_SRC_WIDTH_MASK (0xFFFF << 0)
+
+#define IDMA_SRC_OFFSET 0x0014
+#define IDMA_SRC_OFFSET_Y(_v) ((_v) << 16)
+#define IDMA_SRC_OFFSET_Y_MASK (0x1FFF << 16)
+#define IDMA_SRC_OFFSET_X(_v) ((_v) << 0)
+#define IDMA_SRC_OFFSET_X_MASK (0x1FFF << 0)
+
+#define IDMA_IMG_SIZE 0x0018
+#define IDMA_IMG_HEIGHT(_v) ((_v) << 16)
+#define IDMA_IMG_HEIGHT_MASK (0x1FFF << 16)
+#define IDMA_IMG_WIDTH(_v) ((_v) << 0)
+#define IDMA_IMG_WIDTH_MASK (0x1FFF << 0)
+
+#define IDMA_BLOCK_OFFSET 0x0024
+#define IDMA_BLK_OFFSET_Y(_v) ((_v) << 16)
+#define IDMA_BLK_OFFSET_Y_MASK (0x1FFF << 16)
+#define IDMA_BLK_OFFSET_X(_v) ((_v) << 0)
+#define IDMA_BLK_OFFSET_X_MASK (0x1FFF << 0)
+
+#define IDMA_BLOCK_SIZE 0x0028
+#define IDMA_BLK_HEIGHT(_v) ((_v) << 16)
+#define IDMA_BLK_HEIGHT_MASK (0x1FFF << 16)
+#define IDMA_BLK_WIDTH(_v) ((_v) << 0)
+#define IDMA_BLK_WIDTH_MASK (0x1FFF << 0)
+
+#define IDMA_2BIT_STRIDE 0x0030
+#define IDMA_CHROMA_2B_STRIDE(_v) ((_v) << 16)
+#define IDMA_CHROMA_2B_STRIDE_MASK (0xFFFF << 16)
+#define IDMA_LUMA_2B_STRIDE(_v) ((_v) << 0)
+#define IDMA_LUMA_2B_STRIDE_MASK (0xFFFF << 0)
+
+#define IDMA_IN_BASE_ADDR_Y 0x0040
+#define IDMA_IN_BASE_ADDR_C 0x0044
+#define IDMA_IN_BASE_ADDR_Y2 0x0048
+#define IDMA_IN_BASE_ADDR_C2 0x004C
+
+#define IDMA_IN_REQ_DEST 0x0068
+#define IDMA_IN_REG_DEST_SEL(_v) ((_v) << 0)
+#define IDMA_IN_REG_DEST_SEL_MASK (0x3 << 0)
+
+#define IDMA_S_CFG_ERR_STATE 0x0870
+#define IDMA_S_CFG_ERR_IMG_AFBC BIT(13)
+#define IDMA_S_CFG_ERR_IMG_ROTATION BIT(12)
+#define IDMA_S_CFG_ERR_IMG_FORMAT BIT(11)
+#define IDMA_S_CFG_ERR_SRC_WIDTH BIT(10)
+#define IDMA_S_CFG_ERR_CHROM_STRIDE BIT(9)
+#define IDMA_S_CFG_ERR_BASE_ADDR_Y BIT(8)
+#define IDMA_S_CFG_ERR_BASE_ADDR_C BIT(7)
+#define IDMA_S_CFG_ERR_IMG_WIDTH_AFBC BIT(6)
+#define IDMA_S_CFG_ERR_IMG_WIDTH BIT(5)
+#define IDMA_S_CFG_ERR_IMG_HEIGHT_ROTATION BIT(4)
+#define IDMA_S_CFG_ERR_IMG_HEIGHT BIT(3)
+#define IDMA_S_CFG_ERR_BLOCKING BIT(2)
+#define IDMA_S_CFG_ERR_SRC_OFFSET_X BIT(1)
+#define IDMA_S_CFG_ERR_SRC_OFFSET_Y BIT(0)
+#define IDMA_S_CFG_ERR_GET(_v) (((_v) >> 0) & 0x7FF)
+
+static inline uint32_t dma_read(struct exynos_dpu_dma_context *ctx, u32 idx,
+				u32 offset)
+{
+	return readl(ctx->regs + 0x1000 * idx + offset);
+}
+static inline uint32_t dma_read_mask(struct exynos_dpu_dma_context *ctx,
+				     u32 idx, u32 offset, u32 mask)
+{
+	uint32_t val = readl(ctx->regs + 0x1000 * idx + offset);
+	val &= (mask);
+	return val;
+}
+static inline void dma_write(struct exynos_dpu_dma_context *ctx, u32 idx,
+			     u32 offset, u32 val)
+{
+	writel(val, ctx->regs + 0x1000 * idx + offset);
+}
+static inline void dma_write_mask(struct exynos_dpu_dma_context *ctx, u32 idx,
+				  u32 offset, u32 val, u32 mask)
+{
+	uint32_t old = dma_read(ctx, idx, offset);
+	val = (val & mask) | (old & ~mask);
+	dma_write(ctx, idx, offset, val);
+}
+
+static void dma_reg_clear_irq(struct exynos_dpu_dma_context *ctx, u32 id,
+			      u32 irq)
+{
+	dma_write_mask(ctx, id, IDMA_IRQ, ~0, irq);
+}
+
+static u32 idma_reg_get_irq_and_clear(struct exynos_dpu_dma_context *ctx,
+				      u32 id)
+{
+	u32 val, cfg_err;
+
+	val = dma_read_mask(ctx, id, IDMA_IRQ, IDMA_ALL_IRQ);
+
+	if (val & IDMA_AFBC_CONFLICT_IRQ) {
+		pr_err("AFBC conflict occur\n");
+	}
+
+	if (val & IDMA_VR_CONFLICT_IRQ) {
+		pr_err("VR conflict occur\n");
+	}
+
+	if (val & IDMA_RECOVERY_START_IRQ) {
+		pr_err("recovery start occur\n");
+	}
+
+	if (val & IDMA_CONFIG_ERROR) {
+		cfg_err = dma_read(ctx, id, IDMA_S_CFG_ERR_STATE);
+		pr_err("config error occur(0x%x)\n", cfg_err);
+	}
+
+	if (val & IDMA_LOCAL_HW_RESET_DONE) {
+		pr_err("local hw reset done\n");
+	}
+
+	if (val & IDMA_READ_SLAVE_ERROR) {
+		pr_err("read slave error occur\n");
+	}
+
+	if (val & IDMA_STATUS_DEADLOCK_IRQ) {
+		pr_err("status deadlock occur\n");
+	}
+
+	if (val & IDMA_STATUS_FRAMEDONE_IRQ) {
+		pr_debug("frame done occur\n");
+	}
+
+	dma_reg_clear_irq(ctx, id, val);
+
+	return val;
+}
+
+static void dma_reg_init(struct exynos_dpu_dma_context *ctx, u32 id,
+			 const unsigned long attr)
+{
+	dma_write_mask(ctx, id, IDMA_IRQ, 0, IDMA_ALL_IRQ_MASK);
+	dma_write_mask(ctx, id, IDMA_IRQ, ~0, IDMA_IRQ_ENABLE);
+}
+
+static irqreturn_t dma_irq_handler(int irq, void *priv)
+{
+	u32 val_dma = 0;
+	struct exynos_dpu_dma_context *ctx = priv;
+
+	val_dma = idma_reg_get_irq_and_clear(ctx, 5);
+
+	/* This interrupt is not mine */
+	if (!val_dma)
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+int dpu_dma_update(struct exynos_dpu_dma_context *ctx, unsigned int channel,
+		   struct exynos_drm_plane_state *state)
+{
+	struct drm_framebuffer *fb = state->base.fb;
+	unsigned int idma = channel_map[channel];
+
+	dma_reg_init(ctx, idma, 0);
+	dma_write(ctx, idma, IDMA_IN_BASE_ADDR_Y,
+		  exynos_drm_fb_dma_addr(fb, 0));
+	dma_write(ctx, idma, IDMA_SRC_OFFSET,
+		  IDMA_SRC_OFFSET_Y(state->src.y) |
+			  IDMA_SRC_OFFSET_X(state->src.x));
+	dma_write(ctx, idma, IDMA_SRC_SIZE,
+		  IDMA_SRC_HEIGHT(fb->height) |
+			  IDMA_SRC_WIDTH(fb->pitches[0] / fb->format->cpp[0]));
+	dma_write(ctx, idma, IDMA_IMG_SIZE,
+		  IDMA_IMG_HEIGHT(state->src.h) | IDMA_IMG_WIDTH(state->src.w));
+
+	dma_write_mask(ctx, idma, IDMA_IN_CON,
+		       IDMA_IMG_FORMAT(IDMA_IMG_FORMAT_ARGB8888),
+		       IDMA_IMG_FORMAT_MASK);
+
+	return 0;
+}
+
+static int dma_bind(struct device *dev, struct device *master, void *data)
+{
+	struct exynos_dpu_dma_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+
+	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
+};
+
+static const struct component_ops dma_component_ops = {
+	.bind = dma_bind,
+};
+
+static int dpu_dma_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct exynos_dpu_dma_context *ctx;
+	struct resource *res;
+
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(struct exynos_dpu_dma_context),
+			   GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, ctx);
+
+	ctx->aclk = devm_clk_get_enabled(dev, "aclk");
+	if (IS_ERR(ctx->aclk))
+		return dev_err_probe(dev, PTR_ERR(ctx->aclk),
+				     "Cannot get aclk\n");
+
+	ctx->irq = platform_get_irq(pdev, 0);
+	if (ctx->irq < 0)
+		return ctx->irq;
+
+	ret = devm_request_irq(dev, ctx->irq, dma_irq_handler, 0, pdev->name,
+			       ctx);
+	if (ret)
+		return ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	ctx->regs = devm_ioremap_resource(dev, res);
+	if (!ctx->regs)
+		return -ENOMEM;
+
+	pm_runtime_enable(dev);
+	/* For turn on attached SYSMMU */
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		pm_runtime_disable(dev);
+		return ret;
+	}
+
+	component_add(dev, &dma_component_ops);
+
+	return 0;
+}
+
+static const struct of_device_id dpu_dma_of_match[] = {
+	{ .compatible = "samsung,exynosauto-dpu-dma" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, dpu_dma_of_match);
+
+struct platform_driver dpu_dma_driver = {
+    .probe          = dpu_dma_probe,
+    .driver         = {
+        .name   = "dpu_dma_driver",
+        .of_match_table = of_match_ptr(dpu_dma_of_match),
+    },
+};
diff --git a/drivers/gpu/drm/exynos/exynos_dpu_dma.h b/drivers/gpu/drm/exynos/exynos_dpu_dma.h
new file mode 100644
index 000000000000..3708ef55b70d
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_dpu_dma.h
@@ -0,0 +1,16 @@
+#ifndef _EXYNOSAUTO_DPU_DMA_H_
+#define _EXYNOSAUTO_DPU_DMA_H_
+
+#include "exynos_drm_drv.h"
+
+struct exynos_dpu_dma_context {
+	struct clk *aclk;
+	int irq;
+	void __iomem *regs;
+	void *dma_priv;
+};
+
+int dpu_dma_update(struct exynos_dpu_dma_context *ctx, unsigned int channel,
+		   struct exynos_drm_plane_state *state);
+
+#endif
\ No newline at end of file

-- 
2.39.2

