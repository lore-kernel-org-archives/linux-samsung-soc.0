From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 5/6] [media] s5p-fimc: Use correct fourcc code for 32-bit RGB
 format
Date: Thu, 25 Nov 2010 16:05:11 +0100
Message-ID: <1290697512-30563-6-git-send-email-s.nawrocki@samsung.com>
References: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:53861 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752939Ab0KYPFc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Nov 2010 10:05:32 -0500
In-reply-to: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com

Replace V4L2_PIX_FMT_RGB24 code with V4L2_PIX_FMT_RGB32
since the hardware uses 24-bits for actual pixel data but pixels
are 4-byte aligned in memory.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-core.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media/video/s5p-fimc/fimc-core.c
index fa82a2a..f538eb5 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.c
+++ b/drivers/media/video/s5p-fimc/fimc-core.c
@@ -50,8 +50,8 @@ static struct fimc_fmt fimc_formats[] = {
 		.planes_cnt = 1,
 		.flags = FMT_FLAGS_M2M,
 	}, {
-		.name = "XRGB-8-8-8-8, 24 bpp",
-		.fourcc	= V4L2_PIX_FMT_RGB24,
+		.name = "XRGB-8-8-8-8, 32 bpp",
+		.fourcc	= V4L2_PIX_FMT_RGB32,
 		.depth = 32,
 		.color	= S5P_FIMC_RGB888,
 		.buff_cnt = 1,
-- 
1.7.1
