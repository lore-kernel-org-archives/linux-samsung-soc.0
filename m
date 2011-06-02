From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/7] s5p-fimc: Fix possible memory leak during capture devnode
 registration
Date: Thu, 02 Jun 2011 15:49:50 +0200
Message-ID: <1307022590-982-1-git-send-email-s.nawrocki@samsung.com>
References: <1307009524-1208-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1307009524-1208-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, sw0312.kim@samsung.com, riverful.kim@samsung.comi
List-Id: linux-samsung-soc@vger.kernel.org

Add missing kfree on the error path.

Reported-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-capture.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-capture.c b/drivers/media/video/s5p-fimc/fimc-capture.c
index d142b40..7e66455 100644
--- a/drivers/media/video/s5p-fimc/fimc-capture.c
+++ b/drivers/media/video/s5p-fimc/fimc-capture.c
@@ -903,6 +903,7 @@ err_vd_reg:
 err_v4l2_reg:
 	v4l2_device_unregister(v4l2_dev);
 err_info:
+	kfree(ctx);
 	dev_err(&fimc->pdev->dev, "failed to install\n");
 	return ret;
 }
-- 
1.7.5.2
