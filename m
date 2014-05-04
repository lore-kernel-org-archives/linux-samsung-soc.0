From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH 1/4] drm/exynos/mixer: move format definitions to regs-mixer
Date: Sun,  4 May 2014 23:26:18 +0800
Message-ID: <1399217181-26442-2-git-send-email-djkurtz@chromium.org>
References: <1399217181-26442-1-git-send-email-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1399217181-26442-1-git-send-email-djkurtz@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, seanpaul@chromium.org, Daniel Kurtz <djkurtz@chromium.org>, marcheu@chromium.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

These constants directly define register values, so move them to the
register definition header.

Also, the logic used for setting fmt from bpp is either/or, so just use
if/else.

** No functional change

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 19 ++++---------------
 drivers/gpu/drm/exynos/regs-mixer.h   |  4 ++++
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index ce28881..475eb49 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -518,21 +518,10 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 
 	win_data = &ctx->win_data[win];
 
-	#define RGB565 4
-	#define ARGB1555 5
-	#define ARGB4444 6
-	#define ARGB8888 7
-
-	switch (win_data->bpp) {
-	case 16:
-		fmt = ARGB4444;
-		break;
-	case 32:
-		fmt = ARGB8888;
-		break;
-	default:
-		fmt = ARGB8888;
-	}
+	if (win_data->bpp == 16)
+		fmt = MXR_GRP_CFG_FORMAT_ARGB4444;
+	else
+		fmt = MXR_GRP_CFG_FORMAT_ARGB8888;
 
 	/* 2x scaling feature */
 	x_ratio = 0;
diff --git a/drivers/gpu/drm/exynos/regs-mixer.h b/drivers/gpu/drm/exynos/regs-mixer.h
index 4537026..785a97a 100644
--- a/drivers/gpu/drm/exynos/regs-mixer.h
+++ b/drivers/gpu/drm/exynos/regs-mixer.h
@@ -114,6 +114,10 @@
 #define MXR_GRP_CFG_PIXEL_BLEND_EN	(1 << 16)
 #define MXR_GRP_CFG_FORMAT_VAL(x)	MXR_MASK_VAL(x, 11, 8)
 #define MXR_GRP_CFG_FORMAT_MASK		MXR_GRP_CFG_FORMAT_VAL(~0)
+#define MXR_GRP_CFG_FORMAT_RGB565	4
+#define MXR_GRP_CFG_FORMAT_ARGB1555	5
+#define MXR_GRP_CFG_FORMAT_ARGB4444	6
+#define MXR_GRP_CFG_FORMAT_ARGB8888	7
 #define MXR_GRP_CFG_ALPHA_VAL(x)	MXR_MASK_VAL(x, 7, 0)
 
 /* bits for MXR_GRAPHICn_WH */
-- 
1.9.1.423.g4596e3a
