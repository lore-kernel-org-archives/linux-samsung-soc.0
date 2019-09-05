From: Krzysztof Wilczynski <kw@linux.com>
Subject: [PATCH] drm/exynos: Move static keyword to the front of declaration
Date: Thu,  5 Sep 2019 14:32:02 +0200
Message-ID: <20190905123202.28001-1-kw@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Move the static keyword to the front of declaration of modes,
and resolve the following compiler warning that can be seen
when building with warnings enabled (W=1):

drivers/gpu/drm/exynos/exynos_mixer.c:1074:2: warning:
  ‘static’ is not at beginning of declaration [-Wold-style-declaration]

Signed-off-by: Krzysztof Wilczynski <kw@linux.com>
---
Related: https://lore.kernel.org/r/20190827233017.GK9987@google.com

 drivers/gpu/drm/exynos/exynos_mixer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 7b24338fad3c..6cfdb95fef2f 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1069,9 +1069,9 @@ static bool mixer_mode_fixup(struct exynos_drm_crtc *crtc,
 	struct mixer_context *ctx = crtc->ctx;
 	int width = mode->hdisplay, height = mode->vdisplay, i;
 
-	struct {
+	static const struct {
 		int hdisplay, vdisplay, htotal, vtotal, scan_val;
-	} static const modes[] = {
+	} modes[] = {
 		{ 720, 480, 858, 525, MXR_CFG_SCAN_NTSC | MXR_CFG_SCAN_SD },
 		{ 720, 576, 864, 625, MXR_CFG_SCAN_PAL | MXR_CFG_SCAN_SD },
 		{ 1280, 720, 1650, 750, MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD },
-- 
2.22.1
