From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: [PATCH] drm/exynos: hdmi: replace fb size with mode size from win
 commit
Date: Fri, 30 Jan 2015 17:30:45 +0900
Message-ID: <1422606645-25491-1-git-send-email-sw0312.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:38490 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754513AbbA3Iai (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jan 2015 03:30:38 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NIZ00178EB1ZB80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Jan 2015 17:30:37 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com

For default graphic window, mixer_win_commit() sets display size
register as fb size. Calling setplane with smaller fb size than
mode size to default window causes distorted display result. So
this patch replaces fb size with mode size for display size from
the mixer_win_commit().

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 6766271..086fe0e 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -584,8 +584,8 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 	/* setup display size */
 	if (ctx->mxr_ver == MXR_VER_128_0_0_184 &&
 		win == MIXER_DEFAULT_WIN) {
-		val  = MXR_MXR_RES_HEIGHT(win_data->fb_height);
-		val |= MXR_MXR_RES_WIDTH(win_data->fb_width);
+		val  = MXR_MXR_RES_HEIGHT(win_data->mode_height);
+		val |= MXR_MXR_RES_WIDTH(win_data->mode_width);
 		mixer_reg_write(res, MXR_RESOLUTION, val);
 	}
 
-- 
1.7.9.5
