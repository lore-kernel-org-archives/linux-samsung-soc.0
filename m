From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/6] [media] s5p-fimc: Explicitly add required header file
Date: Thu, 25 Nov 2010 16:05:09 +0100
Message-ID: <1290697512-30563-4-git-send-email-s.nawrocki@samsung.com>
References: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:42456 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752478Ab0KYPFb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Nov 2010 10:05:31 -0500
In-reply-to: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com

Reported by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-core.h |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-core.h b/drivers/media/video/s5p-fimc/fimc-core.h
index afafebc..6137340 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.h
+++ b/drivers/media/video/s5p-fimc/fimc-core.h
@@ -13,13 +13,15 @@
 
 /*#define DEBUG*/
 
+#include <linux/sched.h>
 #include <linux/types.h>
+#include <linux/videodev2.h>
 #include <media/videobuf-core.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-mediabus.h>
 #include <media/s3c_fimc.h>
-#include <linux/videodev2.h>
+
 #include "regs-fimc.h"
 
 #define err(fmt, args...) \
-- 
1.7.1
