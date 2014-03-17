From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 9/9] drm/exynos/fimd: remove unused variable
Date: Mon, 17 Mar 2014 14:16:12 +0100
Message-ID: <1395062172-19756-1-git-send-email-a.hajda@samsung.com>
References: <1395052045-23848-10-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1395052045-23848-10-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Denis Carikli <denis@eukrea.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch removes unused vidcon0 field from fimd_context structure.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
v2:
- corrected vidcon0 calculation
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index dbfad4e..158d53a 100644
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
@@ -269,26 +268,19 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
 	       VIDTCON2_HOZVAL_E(mode->hdisplay - 1);
 	writel(val, ctx->regs + driver_data->timing_base + VIDTCON2);
 
-	/* setup clock source, clock divider, enable dma. */
-	val = ctx->vidcon0;
-	val &= ~(VIDCON0_CLKVAL_F_MASK | VIDCON0_CLKDIR);
+	/*
+	 * fields of register with prefix '_F' would be updated
+	 * at vsync(same as dma start)
+	 */
+	val = VIDCON0_ENVID | VIDCON0_ENVID_F;
 
-	if (ctx->driver_data->has_clksel) {
-		val &= ~VIDCON0_CLKSEL_MASK;
+	if (ctx->driver_data->has_clksel)
 		val |= VIDCON0_CLKSEL_LCD;
-	}
 
 	clkdiv = fimd_calc_clkdiv(ctx, mode);
 	if (clkdiv > 1)
 		val |= VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR;
-	else
-		val &= ~VIDCON0_CLKDIR;	/* 1:1 clock */
 
-	/*
-	 * fields of register with prefix '_F' would be updated
-	 * at vsync(same as dma start)
-	 */
-	val |= VIDCON0_ENVID | VIDCON0_ENVID_F;
 	writel(val, ctx->regs + VIDCON0);
 }
 
-- 
1.8.3.2
