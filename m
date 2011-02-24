From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 6/7] s5p-fimc: Use dynamic debug
Date: Thu, 24 Feb 2011 15:33:53 +0100
Message-ID: <1298558034-10768-7-git-send-email-s.nawrocki@samsung.com>
References: <1298558034-10768-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1298558034-10768-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Use pr_debug instead of printk so it is possible to control
debug traces at runtime.
E.g. to enable debug trace in file fimc-core.c use command:
echo -n 'file fimc-core.c +p' > /sys/kernel/debug/dynamic_debug/control
or
echo -n 'file fimc-core.c -p' > /sys/kernel/debug/dynamic_debug/control
to disable.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-core.h |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-core.h b/drivers/media/video/s5p-fimc/fimc-core.h
index 41b1352..3beb1e5 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.h
+++ b/drivers/media/video/s5p-fimc/fimc-core.h
@@ -29,12 +29,8 @@
 #define err(fmt, args...) \
 	printk(KERN_ERR "%s:%d: " fmt "\n", __func__, __LINE__, ##args)
 
-#ifdef DEBUG
 #define dbg(fmt, args...) \
-	printk(KERN_DEBUG "%s:%d: " fmt "\n", __func__, __LINE__, ##args)
-#else
-#define dbg(fmt, args...)
-#endif
+	pr_debug("%s:%d: " fmt "\n", __func__, __LINE__, ##args)
 
 /* Time to wait for next frame VSYNC interrupt while stopping operation. */
 #define FIMC_SHUTDOWN_TIMEOUT	((100*HZ)/1000)
-- 
1.7.4.1
