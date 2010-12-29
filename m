From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 09/15 v2] [media] s5p-fimc: Enable interworking without subdev
 s_stream
Date: Wed, 29 Dec 2010 18:32:51 +0100
Message-ID: <1293643975-4528-10-git-send-email-s.nawrocki@samsung.com>
References: <1293643975-4528-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:28519 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753484Ab0L2RdB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Dec 2010 12:33:01 -0500
In-reply-to: <1293643975-4528-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Prevent VIDIOC_STREAMON failing when s_stream callback is
not implemented by a sensor subdev driver.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-capture.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-capture.c b/drivers/media/video/s5p-fimc/fimc-capture.c
index 5d6a2cd..8165eb1 100644
--- a/drivers/media/video/s5p-fimc/fimc-capture.c
+++ b/drivers/media/video/s5p-fimc/fimc-capture.c
@@ -192,7 +192,8 @@ static int fimc_stop_capture(struct fimc_dev *fimc)
 			   FIMC_SHUTDOWN_TIMEOUT);
 
 	ret = v4l2_subdev_call(cap->sd, video, s_stream, 0);
-	if (ret)
+
+	if (ret && ret != -ENOIOCTLCMD)
 		v4l2_err(&fimc->vid_cap.v4l2_dev, "s_stream(0) failed\n");
 
 	spin_lock_irqsave(&fimc->slock, flags);
-- 
1.7.2.3
