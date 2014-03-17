From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/9] drm/exynos: init kms poll after creation of connectors
Date: Mon, 17 Mar 2014 11:27:18 +0100
Message-ID: <1395052045-23848-3-git-send-email-a.hajda@samsung.com>
References: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
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

KMS poll init helper should be run when connectors are created,
otherwise it will not schedule connection detector.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 25f45b8..dfee083 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -71,9 +71,6 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 
 	drm_mode_config_init(dev);
 
-	/* init kms poll for handling hpd */
-	drm_kms_helper_poll_init(dev);
-
 	exynos_drm_mode_config_init(dev);
 
 	ret = exynos_drm_initialize_managers(dev);
@@ -93,6 +90,9 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto err_manager_cleanup;
 
+	/* init kms poll for handling hpd */
+	drm_kms_helper_poll_init(dev);
+
 	ret = drm_vblank_init(dev, MAX_CRTC);
 	if (ret)
 		goto err_display_cleanup;
-- 
1.8.3.2
