From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 05/10] drm/exynos: remove exynos_crtc commit() callback
Date: Fri,  4 Sep 2015 17:15:47 -0300
Message-ID: <1441397752-6672-6-git-send-email-gustavo@padovan.org>
References: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f180.google.com ([209.85.160.180]:34098 "EHLO
	mail-yk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760503AbbIDUQK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 16:16:10 -0400
Received: by ykdg206 with SMTP id g206so31890245ykd.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2015 13:16:10 -0700 (PDT)
In-Reply-To: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

It turns out that .commit() was never executed, because
at the time .mode_set_nofb() called it ctx->suspended was still false
and .commit() would return. It removes the callback from FIMD DECON 7 and
DECON 5433.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 2697ebc..0bbe537 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -888,7 +888,6 @@ static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
 	.enable = fimd_enable,
 	.disable = fimd_disable,
 	.mode_fixup = fimd_mode_fixup,
-	.commit = fimd_commit,
 	.enable_vblank = fimd_enable_vblank,
 	.disable_vblank = fimd_disable_vblank,
 	.wait_for_vblank = fimd_wait_for_vblank,
-- 
2.1.0
