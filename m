From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 04/10] exynos4-is: Initialize the ISP subdev sd->owner field
Date: Fri, 09 Aug 2013 21:24:06 +0200
Message-ID: <1376076252-30150-4-git-send-email-s.nawrocki@samsung.com>
References: <1376076122-29963-1-git-send-email-s.nawrocki@samsung.com>
 <1376076252-30150-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1376076252-30150-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: a.hajda@samsung.com, arun.kk@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Set the subdevs owner module so the exynos4_fimc_is module cannot
be unloaded when the FIMC-IS driver is in use.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/platform/exynos4-is/fimc-isp.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/exynos4-is/fimc-isp.c b/drivers/media/platform/exynos4-is/fimc-isp.c
index cf520a7..d2e6cba 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp.c
@@ -672,6 +672,8 @@ int fimc_isp_subdev_create(struct fimc_isp *isp)
 	mutex_init(&isp->subdev_lock);
 
 	v4l2_subdev_init(sd, &fimc_is_subdev_ops);
+
+	sd->owner = THIS_MODULE;
 	sd->grp_id = GRP_ID_FIMC_IS;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	snprintf(sd->name, sizeof(sd->name), "FIMC-IS-ISP");
-- 
1.7.9.5
