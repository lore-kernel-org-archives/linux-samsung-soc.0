From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 06/10] exynos4-is: Add missing v4l2_device_unregister() call in
 fimc_md_remove()
Date: Fri, 09 Aug 2013 21:24:08 +0200
Message-ID: <1376076252-30150-6-git-send-email-s.nawrocki@samsung.com>
References: <1376076122-29963-1-git-send-email-s.nawrocki@samsung.com>
 <1376076252-30150-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1376076252-30150-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: a.hajda@samsung.com, arun.kk@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/platform/exynos4-is/media-dev.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 91f21e2..0446ab3 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1544,6 +1544,8 @@ static int fimc_md_remove(struct platform_device *pdev)
 
 	if (!fmd)
 		return 0;
+
+	v4l2_device_unregister(&fmd->v4l2_dev);
 	device_remove_file(&pdev->dev, &dev_attr_subdev_conf_mode);
 	fimc_md_unregister_entities(fmd);
 	fimc_md_pipelines_free(fmd);
-- 
1.7.9.5
