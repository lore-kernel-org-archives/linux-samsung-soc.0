From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v2] drm/exynos: add has_vtsel flag
Date: Fri, 14 Nov 2014 11:36:02 +0900
Message-ID: <1415932564-16463-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57976 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934582AbaKNCgK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 21:36:10 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF0007LGCK49J10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Nov 2014 11:36:04 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, yj44.cho@samsung.com

The exynos fimd provides video type selection bits from system register
but exynos3 series don't has it, so needs has_vtsel flag and we can
distinguish whether set video type selection bits.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
Changelog from v1:
- rebase on latest exynos-drm-next branch
- add has_vtsel for exynos4415

 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 5cc57f7..93b263e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -96,6 +96,7 @@ struct fimd_driver_data {
 	unsigned int has_clksel:1;
 	unsigned int has_limited_fmt:1;
 	unsigned int has_vidoutcon:1;
+	unsigned int has_vtsel:1;
 };
 
 static struct fimd_driver_data s3c64xx_fimd_driver_data = {
@@ -118,6 +119,7 @@ static struct fimd_driver_data exynos4_fimd_driver_data = {
 	.lcdblk_vt_shift = 10,
 	.lcdblk_bypass_shift = 1,
 	.has_shadowcon = 1,
+	.has_vtsel = 1,
 };
 
 static struct fimd_driver_data exynos4415_fimd_driver_data = {
@@ -127,6 +129,7 @@ static struct fimd_driver_data exynos4415_fimd_driver_data = {
 	.lcdblk_bypass_shift = 1,
 	.has_shadowcon = 1,
 	.has_vidoutcon = 1,
+	.has_vtsel = 1,
 };
 
 static struct fimd_driver_data exynos5_fimd_driver_data = {
@@ -136,6 +139,7 @@ static struct fimd_driver_data exynos5_fimd_driver_data = {
 	.lcdblk_bypass_shift = 15,
 	.has_shadowcon = 1,
 	.has_vidoutcon = 1,
+	.has_vtsel = 1,
 };
 
 struct fimd_win_data {
@@ -354,7 +358,8 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
 		writel(0, timing_base + I80IFCONFBx(0));
 
 		/* set video type selection to I80 interface */
-		if (ctx->sysreg && regmap_update_bits(ctx->sysreg,
+		if (driver_data->has_vtsel && ctx->sysreg &&
+				regmap_update_bits(ctx->sysreg,
 					driver_data->lcdblk_offset,
 					0x3 << driver_data->lcdblk_vt_shift,
 					0x1 << driver_data->lcdblk_vt_shift)) {
-- 
1.9.1
