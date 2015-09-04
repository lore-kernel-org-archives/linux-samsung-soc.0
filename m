From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 2/2] drm/exynos: add cursor plane support
Date: Fri,  4 Sep 2015 19:05:57 -0300
Message-ID: <1441404357-9337-2-git-send-email-gustavo@padovan.org>
References: <1441404357-9337-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f182.google.com ([209.85.160.182]:32912 "EHLO
	mail-yk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759298AbbIDWGH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 18:06:07 -0400
Received: by ykei199 with SMTP id i199so34200238yke.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2015 15:06:06 -0700 (PDT)
In-Reply-To: <1441404357-9337-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Set one of the planes for each crtc driver as a cursor plane enabled
window managers to fully work on exynos.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

---
v2: use the top window for cursor on each crtc
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  4 ++--
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_plane.c     | 11 +++++++++++
 drivers/gpu/drm/exynos/exynos_drm_plane.h     |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  4 ++--
 drivers/gpu/drm/exynos/exynos_mixer.c         |  4 ++--
 7 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 2f393b1..4b8dd7c 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -24,6 +24,7 @@
 #include "exynos_drm_iommu.h"
 
 #define WINDOWS_NR	3
+#define CURSOR_WIN	2
 #define MIN_FB_WIDTH_FOR_16WORD_BURST	128
 
 struct decon_context {
@@ -450,8 +451,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 	ctx->pipe = priv->pipe++;
 
 	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = (zpos == DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
-							DRM_PLANE_TYPE_OVERLAY;
+		type = exynos_plane_get_type(zpos, CURSOR_WIN);
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
 				1 << ctx->pipe, type, decon_formats,
 				ARRAY_SIZE(decon_formats), zpos);
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 7a6c069..aa0ae79 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -41,6 +41,7 @@
 #define MIN_FB_WIDTH_FOR_16WORD_BURST 128
 
 #define WINDOWS_NR	2
+#define CURSOR_WIN	1
 
 struct decon_context {
 	struct device			*dev;
@@ -630,8 +631,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = (zpos == DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
-						DRM_PLANE_TYPE_OVERLAY;
+		type = exynos_plane_get_type(zpos, CURSOR_WIN);
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
 					1 << ctx->pipe, type, decon_formats,
 					ARRAY_SIZE(decon_formats), zpos);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 7776768..caa5255 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -88,6 +88,7 @@
 
 /* FIMD has totally five hardware windows. */
 #define WINDOWS_NR	5
+#define CURSOR_WIN	4
 
 struct fimd_driver_data {
 	unsigned int timing_base;
@@ -909,8 +910,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	ctx->pipe = priv->pipe++;
 
 	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = (zpos == DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
-						DRM_PLANE_TYPE_OVERLAY;
+		type = exynos_plane_get_type(zpos, CURSOR_WIN);
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
 					1 << ctx->pipe, type, fimd_formats,
 					ARRAY_SIZE(fimd_formats), zpos);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 7148224..80b2151 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -208,6 +208,17 @@ static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
 	drm_object_attach_property(&plane->base, prop, zpos);
 }
 
+enum drm_plane_type exynos_plane_get_type(unsigned int zpos,
+					  unsigned int cursor_win)
+{
+		if (zpos == DEFAULT_WIN)
+			return DRM_PLANE_TYPE_PRIMARY;
+		else if (zpos == cursor_win)
+			return DRM_PLANE_TYPE_CURSOR;
+		else
+			return DRM_PLANE_TYPE_OVERLAY;
+}
+
 int exynos_plane_init(struct drm_device *dev,
 		      struct exynos_drm_plane *exynos_plane,
 		      unsigned long possible_crtcs, enum drm_plane_type type,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index 476c934..abb641e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -9,6 +9,8 @@
  *
  */
 
+enum drm_plane_type exynos_plane_get_type(unsigned int zpos,
+					  unsigned int cursor_win);
 int exynos_plane_init(struct drm_device *dev,
 		      struct exynos_drm_plane *exynos_plane,
 		      unsigned long possible_crtcs, enum drm_plane_type type,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index fc57687..669362c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -29,6 +29,7 @@
 
 /* vidi has totally three virtual windows. */
 #define WINDOWS_NR		3
+#define CURSOR_WIN		2
 
 #define ctx_from_connector(c)	container_of(c, struct vidi_context, \
 					connector)
@@ -445,8 +446,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	vidi_ctx_initialize(ctx, drm_dev);
 
 	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = (zpos == DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
-						DRM_PLANE_TYPE_OVERLAY;
+		type = exynos_plane_get_type(zpos, CURSOR_WIN);
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
 					1 << ctx->pipe, type, formats,
 					ARRAY_SIZE(formats), zpos);
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index a149153..61f71d6 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -43,6 +43,7 @@
 
 #define MIXER_WIN_NR		3
 #define VP_DEFAULT_WIN		2
+#define CURSOR_WIN		1
 
 /* The pixelformats that are natively supported by the mixer. */
 #define MXR_FORMAT_RGB565	4
@@ -1133,8 +1134,6 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 		const uint32_t *formats;
 		unsigned int fcount;
 
-		type = (zpos == DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
-						DRM_PLANE_TYPE_OVERLAY;
 		if (zpos < VP_DEFAULT_WIN) {
 			formats = mixer_formats;
 			fcount = ARRAY_SIZE(mixer_formats);
@@ -1143,6 +1142,7 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 			fcount = ARRAY_SIZE(vp_formats);
 		}
 
+		type = exynos_plane_get_type(zpos, CURSOR_WIN);
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
 					1 << ctx->pipe, type, formats, fcount,
 					zpos);
-- 
2.1.0
