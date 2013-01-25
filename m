From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 1/2] drm/exynos: add support for dt based search to exynos4 hdmi
Date: Fri, 25 Jan 2013 05:55:45 -0500
Message-ID: <1359111346-12908-2-git-send-email-rahul.sharma@samsung.com>
References: <1359111346-12908-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57071 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753619Ab3AYKeS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 05:34:18 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH600GZEG0QMXK0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jan 2013 19:34:18 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MH600I57G0W88B0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jan 2013 19:34:17 +0900 (KST)
In-reply-to: <1359111346-12908-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_ddc.c     | 2 ++
 drivers/gpu/drm/exynos/exynos_hdmi.c    | 6 ++++++
 drivers/gpu/drm/exynos/exynos_hdmiphy.c | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_ddc.c b/drivers/gpu/drm/exynos/exynos_ddc.c
index 4e9b5ba..7680809 100644
--- a/drivers/gpu/drm/exynos/exynos_ddc.c
+++ b/drivers/gpu/drm/exynos/exynos_ddc.c
@@ -53,6 +53,8 @@ static struct of_device_id hdmiddc_match_types[] = {
 	{
 		.compatible = "samsung,exynos5-hdmiddc",
 	}, {
+		.compatible = "samsung,exynos4-hdmiddc",
+	}, {
 		/* end node */
 	}
 };
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index fbab3c4..202b65f 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2418,6 +2418,12 @@ static struct platform_device_id hdmi_driver_types[] = {
 #ifdef CONFIG_OF
 static struct of_device_id hdmi_match_types[] = {
 	{
+		.compatible = "samsung,exynos4-hdmi",
+		.data	= (void	*)HDMI_TYPE13,
+	}, {
+		.compatible = "samsung,exynos4-hdmi14",
+		.data	= (void	*)HDMI_TYPE14,
+	}, {
 		.compatible = "samsung,exynos5-hdmi",
 		.data	= (void	*)HDMI_TYPE14,
 	}, {
diff --git a/drivers/gpu/drm/exynos/exynos_hdmiphy.c b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
index ea49d13..2e33f90 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmiphy.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmiphy.c
@@ -51,6 +51,8 @@ static struct of_device_id hdmiphy_match_types[] = {
 	{
 		.compatible = "samsung,exynos5-hdmiphy",
 	}, {
+		.compatible = "samsung,exynos4-hdmiphy",
+	}, {
 		/* end node */
 	}
 };
-- 
1.8.0
