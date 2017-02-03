From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH] drm/exynos: fimd: Do not use HW trigger for exynos3250
Date: Fri, 03 Feb 2017 15:12:16 +0900
Message-ID: <1486102336-639-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170203061230epcas5p23739934b1c206fa61772508b9fecd267@epcas5p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44556 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752230AbdBCGMc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Feb 2017 01:12:32 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKS027LWBWUSP60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Feb 2017 15:12:30 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Commit a6f75aa161c5 ("drm/exynos: fimd: add HW trigger support") added
hardware trigger support to the FIMD controller driver. I have tested
but this broke the display in at least the exynos3250 Gear 2. So until
the issue is fixed, avoid using HW trigger for the exynos3250 based
boards and use SW trigger as it was before the mentioned commit.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index e2e4051..b5e0fe1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -125,10 +125,8 @@ struct fimd_driver_data {
 	.timing_base = 0x20000,
 	.lcdblk_offset = 0x210,
 	.lcdblk_bypass_shift = 1,
-	.trg_type = I80_HW_TRG,
 	.has_shadowcon = 1,
 	.has_vidoutcon = 1,
-	.has_trigger_per_te = 1,
 };
 
 static struct fimd_driver_data exynos4_fimd_driver_data = {
-- 
1.9.1
