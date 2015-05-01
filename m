From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 1/4] media: platform: exynos-gsc: Constify platform_device_id
Date: Sat,  2 May 2015 00:51:00 +0900
Message-ID: <1430495463-31633-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kamil Debski <k.debski@samsung.com>, Jeongtae Park <jtp.park@samsung.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

The platform_device_id is not modified by the driver and core uses it as
const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/media/platform/exynos-gsc/gsc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
index fd2891c886a3..9b9e423e4fc4 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/exynos-gsc/gsc-core.c
@@ -967,7 +967,7 @@ static struct gsc_driverdata gsc_v_100_drvdata = {
 	.lclk_frequency = 266000000UL,
 };
 
-static struct platform_device_id gsc_driver_ids[] = {
+static const struct platform_device_id gsc_driver_ids[] = {
 	{
 		.name		= "exynos-gsc",
 		.driver_data	= (unsigned long)&gsc_v_100_drvdata,
-- 
2.1.4
