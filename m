From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/6] [media] s5p-fimc: BKL lock removal - compilation fix
Date: Thu, 25 Nov 2010 16:05:07 +0100
Message-ID: <1290697512-30563-2-git-send-email-s.nawrocki@samsung.com>
References: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58936 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752478Ab0KYPF3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Nov 2010 10:05:29 -0500
In-reply-to: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com

Adapt to recent videobuf_queue_dma_contig_init signature change.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-capture.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-capture.c b/drivers/media/video/s5p-fimc/fimc-capture.c
index e8f13d3..4c70fba 100644
--- a/drivers/media/video/s5p-fimc/fimc-capture.c
+++ b/drivers/media/video/s5p-fimc/fimc-capture.c
@@ -785,7 +785,7 @@ int fimc_register_capture_device(struct fimc_dev *fimc)
 	videobuf_queue_dma_contig_init(&vid_cap->vbq, &fimc_qops,
 		vid_cap->v4l2_dev.dev, &fimc->irqlock,
 		V4L2_BUF_TYPE_VIDEO_CAPTURE, V4L2_FIELD_NONE,
-		sizeof(struct fimc_vid_buffer), (void *)ctx);
+		sizeof(struct fimc_vid_buffer), (void *)ctx, NULL);
 
 	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
 	if (ret) {
-- 
1.7.1
