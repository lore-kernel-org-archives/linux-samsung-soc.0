From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 3/9] exynos/fimg2d: simplify g2d_fini()
Date: Wed, 10 Jun 2015 15:42:22 +0200
Message-ID: <1433943748-15849-4-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:33617 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933740AbbFJNng (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Jun 2015 09:43:36 -0400
In-Reply-To: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

free()ing a nullptr is a noop, so remove the check.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 5ea42e6..24a06d0 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -254,8 +254,7 @@ struct g2d_context *g2d_init(int fd)
 
 void g2d_fini(struct g2d_context *ctx)
 {
-	if (ctx)
-		free(ctx);
+	free(ctx);
 }
 
 /**
-- 
2.0.5
