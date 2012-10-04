From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 8/8] arm: exynos: add exynos5 drm-hdmi common platform device
Date: Thu, 04 Oct 2012 21:44:28 +0530
Message-ID: <1349367268-32553-9-git-send-email-rahul.sharma@samsung.com>
References: <1349367268-32553-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39129 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755127Ab2JDH43 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Oct 2012 03:56:29 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBC002ZYZDNUOM0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Oct 2012 16:56:28 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBC00ERUZCY1M40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Oct 2012 16:56:28 +0900 (KST)
In-reply-to: <1349367268-32553-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, fahad.k@samsung.com, l.krishna@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch adds drm-hdmi-common platform device which abstracts hdmi
and mixer device. This is software module hence not palced as device
tree node.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/mach-exynos/dev-drm.c            |    5 +++++
 arch/arm/mach-exynos/mach-exynos5-dt.c    |    2 ++
 arch/arm/plat-samsung/include/plat/devs.h |    1 +
 3 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/dev-drm.c b/arch/arm/mach-exynos/dev-drm.c
index 17c9c6e..ca811de 100644
--- a/arch/arm/mach-exynos/dev-drm.c
+++ b/arch/arm/mach-exynos/dev-drm.c
@@ -27,3 +27,8 @@ struct platform_device exynos_device_drm = {
 		.coherent_dma_mask	= DMA_BIT_MASK(32),
 	}
 };
+
+/* common drm-hdmi device which abstracts hdmi and mixer dev*/
+struct platform_device exynos_drm_hdmi_device = {
+	.name	= "exynos-drm-hdmi",
+};
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index db3447c..db7092e 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -79,8 +79,10 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 };
 
 static struct platform_device *exynos5_devices[] __initdata = {
+	&exynos_drm_hdmi_device,
 	&exynos_device_drm,
 };
+
 static void __init exynos5250_dt_map_io(void)
 {
 	exynos_init_io(NULL, 0);
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 5da4b4f..cda177e 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -134,6 +134,7 @@ extern struct platform_device exynos4_device_pcm2;
 extern struct platform_device exynos4_device_spdif;
 
 extern struct platform_device exynos_device_drm;
+extern struct platform_device exynos_drm_hdmi_device;
 
 extern struct platform_device samsung_asoc_dma;
 extern struct platform_device samsung_asoc_idma;
-- 
1.7.0.4
