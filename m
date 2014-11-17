From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 2/9] drm/exynos: fimd: move shadow unprotection position
Date: Mon, 17 Nov 2014 22:00:09 +0900
Message-ID: <1416229216-32018-3-git-send-email-yj44.cho@samsung.com>
References: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35157 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944AbaKQNAY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 08:00:24 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF600HBGPGK1R80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Nov 2014 22:00:20 +0900 (KST)
In-reply-to: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com

The C#_EN_F in SHADOWCON register is updated per frame.
So it should be protected by fimd_shadow_protect_win().

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index ec2d170..77ba961 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -751,15 +751,15 @@ static void fimd_win_commit(struct exynos_drm_manager *mgr, int zpos)
 	val |= WINCONx_ENWIN;
 	writel(val, ctx->regs + WINCON(win));
 
-	/* Enable DMA channel and unprotect windows */
-	fimd_shadow_protect_win(ctx, win, false);
-
 	if (ctx->driver_data->has_shadowcon) {
 		val = readl(ctx->regs + SHADOWCON);
 		val |= SHADOWCON_CHx_ENABLE(win);
 		writel(val, ctx->regs + SHADOWCON);
 	}
 
+	/* Enable DMA channel and unprotect windows */
+	fimd_shadow_protect_win(ctx, win, false);
+
 	win_data->enabled = true;
 
 	if (ctx->i80_if)
-- 
1.9.0
