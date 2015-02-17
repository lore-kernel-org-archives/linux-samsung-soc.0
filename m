From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] drm/exynos: Check for NULL dereference of crtc
Date: Tue, 17 Feb 2015 17:14:41 +0000
Message-ID: <1424193281-30401-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: inki.dae@samsung.com
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The commit "drm/exynos: remove exynos_plane_dpms" (d9ea6256) removed the
use of the enabled flag, which means that the code may attempt to call
win_enable on a NULL crtc. This results in the following oops on
Arndale:

[    1.673479] Unable to handle kernel NULL pointer dereference at virtual address 00000368
[    1.681500] pgd = c0004000
[    1.684154] [00000368] *pgd=00000000
[    1.687713] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    1.693012] Modules linked in:
[    1.696045] CPU: 1 PID: 1 Comm: swapper/0 Not tainted
3.19.0-07545-g57485fa #1907
[    1.703524] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
(....)
[    2.014803] [<c02f9cfc>] (exynos_plane_destroy) from [<c02e61b4>] (drm_mode_config_cleanup+0x168/0x20c)
[    2.024178] [<c02e61b4>] (drm_mode_config_cleanup) from [<c02f66fc>] (exynos_drm_load+0xac/0x12c)

This patch adds in a check to ensure exynos_crtc is not NULL before it
is dereferenced.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 2dfb847..78fc0a1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -176,7 +176,7 @@ static int exynos_disable_plane(struct drm_plane *plane)
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(plane->crtc);
 
-	if (exynos_crtc->ops->win_disable)
+	if (exynos_crtc && exynos_crtc->ops->win_disable)
 		exynos_crtc->ops->win_disable(exynos_crtc,
 					      exynos_plane->zpos);
 
-- 
1.7.2.5
