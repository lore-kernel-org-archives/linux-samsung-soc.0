From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 16/16] drm: exynos: mixer: fix using usleep() in atomic context
Date: Fri, 25 Sep 2015 14:48:29 +0200
Message-ID: <1443185309-13827-17-git-send-email-a.hajda@samsung.com>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:30176 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932207AbbIYMtJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Sep 2015 08:49:09 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NV800KUNGXSJ970@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Sep 2015 13:49:04 +0100 (BST)
In-reply-to: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

From: Tomasz Stanislawski <t.stanislaws@samsung.com>

This patch fixes calling usleep_range() after taking reg_slock
using spin_lock_irqsave(). The mdelay() is used instead.
Waiting in atomic context is not the best idea in general.
Hopefully, waiting occurs only when Video Processor fails
to reset correctly.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 7f81cce..ecf956c 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -652,7 +652,7 @@ static void vp_win_reset(struct mixer_context *ctx)
 		/* waiting until VP_SRESET_PROCESSING is 0 */
 		if (~vp_reg_read(res, VP_SRESET) & VP_SRESET_PROCESSING)
 			break;
-		usleep_range(10000, 12000);
+		mdelay(10);
 	}
 	WARN(tries == 0, "failed to reset Video Processor\n");
 }
-- 
1.9.1
