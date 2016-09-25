From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH] drm/exynos: mark exynos_dp_crtc_clock_enable() static
Date: Sun, 25 Sep 2016 15:54:59 +0800
Message-ID: <1474790099-5489-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jingoohan1@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn, han.fei@zte.com.cn, tang.qiang007@zte.com.cn
List-Id: linux-samsung-soc@vger.kernel.org

We get 1 warning when building kernel with W=1:
drivers/gpu/drm/exynos/exynos_dp.c:46:5: warning: no previous prototype for 'exynos_dp_crtc_clock_enable' [-Wmissing-prototypes]

In fact, this function is only used in the file in which it is
declared and don't need a declaration, but can be made static.
So this patch marks it 'static'.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 4f08505..528229f 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -43,7 +43,7 @@ struct exynos_dp_device {
 	struct analogix_dp_plat_data plat_data;
 };
 
-int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
+static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
 				bool enable)
 {
 	struct exynos_dp_device *dp = to_dp(plat_data);
-- 
2.7.4
