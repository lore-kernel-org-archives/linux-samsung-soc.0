From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: drm/exynos: remove superfluous checks in g2d_check_reg_offset()
Date: Tue, 18 Aug 2015 00:51:23 +0200
Message-ID: <1439851884-3346-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:57084 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752000AbbHQWvh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Aug 2015 18:51:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The cases of the switch statement ensure that reg_type
can never be REG_TYPE_NONE here.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index ba00839..211af37 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -973,8 +973,6 @@ static int g2d_check_reg_offset(struct device *dev,
 				goto err;
 
 			reg_type = g2d_get_reg_type(reg_offset);
-			if (reg_type == REG_TYPE_NONE)
-				goto err;
 
 			/* check userptr buffer type. */
 			if ((cmdlist->data[index] & ~0x7fffffff) >> 31) {
@@ -989,8 +987,6 @@ static int g2d_check_reg_offset(struct device *dev,
 				goto err;
 
 			reg_type = g2d_get_reg_type(reg_offset);
-			if (reg_type == REG_TYPE_NONE)
-				goto err;
 
 			buf_desc = &buf_info->descs[reg_type];
 			value = cmdlist->data[index + 1];
@@ -1003,8 +999,6 @@ static int g2d_check_reg_offset(struct device *dev,
 				goto err;
 
 			reg_type = g2d_get_reg_type(reg_offset);
-			if (reg_type == REG_TYPE_NONE)
-				goto err;
 
 			buf_desc = &buf_info->descs[reg_type];
 			value = cmdlist->data[index + 1];
@@ -1018,8 +1012,6 @@ static int g2d_check_reg_offset(struct device *dev,
 				goto err;
 
 			reg_type = g2d_get_reg_type(reg_offset);
-			if (reg_type == REG_TYPE_NONE)
-				goto err;
 
 			buf_desc = &buf_info->descs[reg_type];
 			value = cmdlist->data[index + 1];
-- 
2.0.5
