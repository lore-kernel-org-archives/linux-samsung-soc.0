From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 1/3] drm/exynos: rotator: Add support for s5pv210
Date: Wed, 19 Dec 2018 16:57:02 +0100
Message-ID: <20181219155704.15264-2-pawel.mikolaj.chmiel@gmail.com>
References: <20181219155704.15264-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219155704.15264-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: inki.dae@samsung.com, krzk@kernel.org, airlied@linux.ie
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This commit adds support for s5pv210.
Currently only NV12 and XRGB8888 formats are supported.
It was tested by using tool from
https://www.spinics.net/lists/linux-samsung-soc/msg60498.html

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index a820a68429b9..a822d340ccf6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -357,6 +357,11 @@ static int rotator_runtime_resume(struct device *dev)
 }
 #endif
 
+static const struct drm_exynos_ipp_limit rotator_s5pv210_rbg888_limits[] = {
+	{ IPP_SIZE_LIMIT(BUFFER, .h = { 8, SZ_16K }, .v = { 8, SZ_16K }) },
+	{ IPP_SIZE_LIMIT(AREA, .h.align = 2, .v.align = 2) },
+};
+
 static const struct drm_exynos_ipp_limit rotator_4210_rbg888_limits[] = {
 	{ IPP_SIZE_LIMIT(BUFFER, .h = { 8, SZ_16K }, .v = { 8, SZ_16K }) },
 	{ IPP_SIZE_LIMIT(AREA, .h.align = 4, .v.align = 4) },
@@ -372,6 +377,11 @@ static const struct drm_exynos_ipp_limit rotator_5250_rbg888_limits[] = {
 	{ IPP_SIZE_LIMIT(AREA, .h.align = 2, .v.align = 2) },
 };
 
+static const struct drm_exynos_ipp_limit rotator_s5pv210_yuv_limits[] = {
+	{ IPP_SIZE_LIMIT(BUFFER, .h = { 32, SZ_64K }, .v = { 32, SZ_64K }) },
+	{ IPP_SIZE_LIMIT(AREA, .h.align = 8, .v.align = 8) },
+};
+
 static const struct drm_exynos_ipp_limit rotator_4210_yuv_limits[] = {
 	{ IPP_SIZE_LIMIT(BUFFER, .h = { 32, SZ_64K }, .v = { 32, SZ_64K }) },
 	{ IPP_SIZE_LIMIT(AREA, .h.align = 8, .v.align = 8) },
@@ -382,6 +392,11 @@ static const struct drm_exynos_ipp_limit rotator_4412_yuv_limits[] = {
 	{ IPP_SIZE_LIMIT(AREA, .h.align = 8, .v.align = 8) },
 };
 
+static const struct exynos_drm_ipp_formats rotator_s5pv210_formats[] = {
+	{ IPP_SRCDST_FORMAT(XRGB8888, rotator_s5pv210_rbg888_limits) },
+	{ IPP_SRCDST_FORMAT(NV12, rotator_s5pv210_yuv_limits) },
+};
+
 static const struct exynos_drm_ipp_formats rotator_4210_formats[] = {
 	{ IPP_SRCDST_FORMAT(XRGB8888, rotator_4210_rbg888_limits) },
 	{ IPP_SRCDST_FORMAT(NV12, rotator_4210_yuv_limits) },
@@ -397,6 +412,11 @@ static const struct exynos_drm_ipp_formats rotator_5250_formats[] = {
 	{ IPP_SRCDST_FORMAT(NV12, rotator_4412_yuv_limits) },
 };
 
+static const struct rot_variant rotator_s5pv210_data = {
+	.formats = rotator_s5pv210_formats,
+	.num_formats = ARRAY_SIZE(rotator_s5pv210_formats),
+};
+
 static const struct rot_variant rotator_4210_data = {
 	.formats = rotator_4210_formats,
 	.num_formats = ARRAY_SIZE(rotator_4210_formats),
@@ -414,6 +434,9 @@ static const struct rot_variant rotator_5250_data = {
 
 static const struct of_device_id exynos_rotator_match[] = {
 	{
+		.compatible = "samsung,s5pv210-rotator",
+		.data = &rotator_s5pv210_data,
+	}, {
 		.compatible = "samsung,exynos4210-rotator",
 		.data = &rotator_4210_data,
 	}, {
-- 
2.17.1
