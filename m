From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [RFC 04/12] s5p-csis: Adding Exynos5250 compatibility
Date: Wed,  6 Mar 2013 17:23:50 +0530
Message-ID: <1362570838-4737-5-git-send-email-shaik.ameer@samsung.com>
References: <1362570838-4737-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1362570838-4737-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, shaik.samsung@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 drivers/media/platform/s5p-fimc/mipi-csis.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/s5p-fimc/mipi-csis.c b/drivers/media/platform/s5p-fimc/mipi-csis.c
index df4411c..debda7c 100644
--- a/drivers/media/platform/s5p-fimc/mipi-csis.c
+++ b/drivers/media/platform/s5p-fimc/mipi-csis.c
@@ -1002,6 +1002,7 @@ static const struct dev_pm_ops s5pcsis_pm_ops = {
 static const struct of_device_id s5pcsis_of_match[] __devinitconst = {
 	{ .compatible = "samsung,exynos3110-csis" },
 	{ .compatible = "samsung,exynos4210-csis" },
+	{ .compatible = "samsung,exynos5250-csis" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, s5pcsis_of_match);
-- 
1.7.9.5
