From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH 4/4] drm/exynos/mixer: add support for NV21
Date: Sun,  4 May 2014 23:26:21 +0800
Message-ID: <1399217181-26442-5-git-send-email-djkurtz@chromium.org>
References: <1399217181-26442-1-git-send-email-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1399217181-26442-1-git-send-email-djkurtz@chromium.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, marcheu@chromium.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

AFAICT, the only difference between NV12 and NV21 is Cr:Cb vs Cb:Cr.
Since the video processor can handle either order, it should be able to
handle both formats.

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c |  1 +
 drivers/gpu/drm/exynos/exynos_mixer.c     | 12 +++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 8371cbd..bf2be7a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -31,6 +31,7 @@ static const uint32_t formats[] = {
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV12MT,
+	DRM_FORMAT_NV21,
 };
 
 /*
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index b252ec7..52a94d9 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -383,8 +383,8 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 	struct hdmi_win_data *win_data;
 	unsigned int x_ratio, y_ratio;
 	dma_addr_t luma_addr[2], chroma_addr[2];
-	bool tiled_mode = false;
-	bool crcb_mode = false;
+	bool tiled_mode;
+	bool crcb_mode;
 	u32 val;
 
 	win_data = &ctx->win_data[win];
@@ -392,10 +392,16 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 	switch (win_data->pixel_format) {
 	case DRM_FORMAT_NV12MT:
 		tiled_mode = true;
-		/* fall through */
+		crcb_mode = false;
+		break;
 	case DRM_FORMAT_NV12:
+		tiled_mode = false;
 		crcb_mode = false;
 		break;
+	case DRM_FORMAT_NV21:
+		tiled_mode = false;
+		crcb_mode = true;
+		break;
 	/* TODO: single buffer format NV12, NV21 */
 	default:
 		DRM_ERROR("pixel format for vp is wrong [%d].\n",
-- 
1.9.1.423.g4596e3a
