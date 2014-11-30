From: tjakobi@math.uni-bielefeld.de
Subject: drm: exynos: mixer: fix using usleep() in atomic context
Date: Sun, 30 Nov 2014 01:35:25 +0100
Message-ID: <1417307725-5975-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1417307725-5975-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from unibi-smtp-b.hrz.uni-bielefeld.de ([129.70.208.22]:60140 "EHLO
	unibi-smtp-b.hrz.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751804AbaK3Auo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 29 Nov 2014 19:50:44 -0500
Received: from leena.entropy ([84.119.19.8])
 by unibi-smtp-b.hrz.uni-bielefeld.de
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPPA id <0NFT00K8VTNFTJ90@unibi-smtp-b.hrz.uni-bielefeld.de>
 for linux-samsung-soc@vger.kernel.org; Sun, 30 Nov 2014 01:35:42 +0100 (CET)
In-reply-to: <1417307725-5975-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Tomasz Stanislawski <t.stanislaws@samsung.com>

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
index a41c84e..cc7cccc 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -632,7 +632,7 @@ static void vp_win_reset(struct mixer_context *ctx)
 		/* waiting until VP_SRESET_PROCESSING is 0 */
 		if (~vp_reg_read(res, VP_SRESET) & VP_SRESET_PROCESSING)
 			break;
-		usleep_range(10000, 12000);
+		mdelay(10);
 	}
 	WARN(tries == 0, "failed to reset Video Processor\n");
 }
-- 
2.0.4
