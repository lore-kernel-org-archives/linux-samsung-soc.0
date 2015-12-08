From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] [media] exynos4-is: fix a format string bug
Date: Tue,  8 Dec 2015 15:15:54 +0100
Message-ID: <1449584155-20644-1-git-send-email-linux@rasmusvillemoes.dk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:35571 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964805AbbLHOQH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Dec 2015 09:16:07 -0500
Received: by lbpu9 with SMTP id u9so11712449lbp.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Dec 2015 06:16:05 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Ironically, 7d4020c3c400 ("[media] exynos4-is: fix some warnings when
compiling on arm64") fixed some format string bugs but introduced a
new one. buf_index is a simple int, so it should be printed with %d,
not %pad (which is correctly used for dma_addr_t).

Fixes: 7d4020c3c400 ("[media] exynos4-is: fix some warnings when compiling on arm64")
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/media/platform/exynos4-is/fimc-isp-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
index 6e6648446f00..337d49b4d103 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -221,8 +221,8 @@ static void isp_video_capture_buffer_queue(struct vb2_buffer *vb)
 							ivb->dma_addr[i];
 
 			isp_dbg(2, &video->ve.vdev,
-				"dma_buf %pad (%d/%d/%d) addr: %pad\n",
-				&buf_index, ivb->index, i, vb->index,
+				"dma_buf %d (%d/%d/%d) addr: %pad\n",
+				buf_index, ivb->index, i, vb->index,
 				&ivb->dma_addr[i]);
 		}
 
-- 
2.6.1
