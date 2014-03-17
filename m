From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 9/9] drm/exynos/fimd: remove unused variable
Date: Mon, 17 Mar 2014 11:27:25 +0100
Message-ID: <1395052045-23848-10-git-send-email-a.hajda@samsung.com>
References: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1395052045-23848-1-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The patch removes unused vidcon0 field from fimd_context structure.

Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index dbfad4e..375ec66 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -114,7 +114,6 @@ struct fimd_context {
 	struct fimd_win_data		win_data[WINDOWS_NR];
 	unsigned int			default_win;
 	unsigned long			irq_flags;
-	u32				vidcon0;
 	bool				suspended;
 	int				pipe;
 	wait_queue_head_t		wait_vsync_queue;
@@ -270,8 +269,7 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
 	writel(val, ctx->regs + driver_data->timing_base + VIDTCON2);
 
 	/* setup clock source, clock divider, enable dma. */
-	val = ctx->vidcon0;
-	val &= ~(VIDCON0_CLKVAL_F_MASK | VIDCON0_CLKDIR);
+	val = ~(VIDCON0_CLKVAL_F_MASK | VIDCON0_CLKDIR);
 
 	if (ctx->driver_data->has_clksel) {
 		val &= ~VIDCON0_CLKSEL_MASK;
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
