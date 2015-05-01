From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH] drm/exynos: mixer: Constify platform_device_id
Date: Sat,  2 May 2015 00:56:36 +0900
Message-ID: <1430495796-32016-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

The platform_device_id is not modified by the driver and core uses it as
const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index fbec750574e6..512549a35e96 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1156,7 +1156,7 @@ static struct mixer_drv_data exynos4210_mxr_drv_data = {
 	.has_sclk = 1,
 };
 
-static struct platform_device_id mixer_driver_types[] = {
+static const struct platform_device_id mixer_driver_types[] = {
 	{
 		.name		= "s5p-mixer",
 		.driver_data	= (unsigned long)&exynos4210_mxr_drv_data,
-- 
2.1.4
