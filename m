From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] drm: exynos: constify mixer_match_types and *_mxr_drv_data.
Date: Mon, 19 Jun 2017 15:42:42 +0530
Message-ID: <28c361b34389bfc40fbca6250f6ff24f5f7afe97.1497866987.git.arvind.yadav.cs@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33067 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751090AbdFSKNU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 06:13:20 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

File size before:
   text	   data	    bss	    dec	    hex	filename
   9983	   1424	      0	  11407	   2c8f	drivers/gpu/drm/exynos/exynos_mixer.o

File size after constify:
   text	   data	    bss	    dec	    hex	filename
  11231	    176	      0	  11407	   2c8f	drivers/gpu/drm/exynos/exynos_mixer.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 25edb63..778cae2 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1097,28 +1097,28 @@ static int mixer_atomic_check(struct exynos_drm_crtc *crtc,
 	.atomic_check		= mixer_atomic_check,
 };
 
-static struct mixer_drv_data exynos5420_mxr_drv_data = {
+static const struct mixer_drv_data exynos5420_mxr_drv_data = {
 	.version = MXR_VER_128_0_0_184,
 	.is_vp_enabled = 0,
 };
 
-static struct mixer_drv_data exynos5250_mxr_drv_data = {
+static const struct mixer_drv_data exynos5250_mxr_drv_data = {
 	.version = MXR_VER_16_0_33_0,
 	.is_vp_enabled = 0,
 };
 
-static struct mixer_drv_data exynos4212_mxr_drv_data = {
+static const struct mixer_drv_data exynos4212_mxr_drv_data = {
 	.version = MXR_VER_0_0_0_16,
 	.is_vp_enabled = 1,
 };
 
-static struct mixer_drv_data exynos4210_mxr_drv_data = {
+static const struct mixer_drv_data exynos4210_mxr_drv_data = {
 	.version = MXR_VER_0_0_0_16,
 	.is_vp_enabled = 1,
 	.has_sclk = 1,
 };
 
-static struct of_device_id mixer_match_types[] = {
+static const struct of_device_id mixer_match_types[] = {
 	{
 		.compatible = "samsung,exynos4210-mixer",
 		.data	= &exynos4210_mxr_drv_data,
-- 
1.9.1
