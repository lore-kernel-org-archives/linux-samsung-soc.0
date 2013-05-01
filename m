From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 4/4] drm/exynos: fimd: Add support for S3C64xx SoCs
Date: Wed,  1 May 2013 21:02:29 +0200
Message-ID: <1367434949-14838-5-git-send-email-tomasz.figa@gmail.com>
References: <1367434949-14838-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f178.google.com ([209.85.215.178]:57993 "EHLO
	mail-ea0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756051Ab3EATCr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 May 2013 15:02:47 -0400
Received: by mail-ea0-f178.google.com with SMTP id o10so790640eaj.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2013 12:02:45 -0700 (PDT)
In-Reply-To: <1367434949-14838-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, t.figa@samsung.com, Tomasz Figa <tomasz.figa@gmail.com>

The FIMD block present on S3C6400/S3C6410 SoCs is compatible with this
driver, so it can be supported by it as well.

This patch adds appropriate device IDs and driver data to enable this
driver for S3C64xx SoCs.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a2e385d..a1669d4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -68,6 +68,11 @@ struct fimd_driver_data {
 	unsigned int has_clksel:1;
 };
 
+static struct fimd_driver_data s3c64xx_fimd_driver_data = {
+	.timing_base = 0x0,
+	.has_clksel = 1,
+};
+
 static struct fimd_driver_data exynos4_fimd_driver_data = {
 	.timing_base = 0x0,
 	.has_shadowcon = 1,
@@ -117,6 +122,8 @@ struct fimd_context {
 
 #ifdef CONFIG_OF
 static const struct of_device_id fimd_driver_dt_match[] = {
+	{ .compatible = "samsung,s3c6400-fimd",
+	  .data = &s3c64xx_fimd_driver_data },
 	{ .compatible = "samsung,exynos4210-fimd",
 	  .data = &exynos4_fimd_driver_data },
 	{ .compatible = "samsung,exynos5250-fimd",
@@ -1108,6 +1115,9 @@ static int fimd_runtime_resume(struct device *dev)
 
 static struct platform_device_id fimd_driver_ids[] = {
 	{
+		.name		= "s3c64xx-fb",
+		.driver_data	= (unsigned long)&s3c64xx_fimd_driver_data,
+	}, {
 		.name		= "exynos4-fb",
 		.driver_data	= (unsigned long)&exynos4_fimd_driver_data,
 	}, {
-- 
1.8.2.1
