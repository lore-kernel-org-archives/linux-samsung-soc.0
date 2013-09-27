From: Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v9 12/13] V4L: s5k6a3: Change sensor min/max resolutions
Date: Fri, 27 Sep 2013 16:29:17 +0530
Message-ID: <1380279558-21651-13-git-send-email-arun.kk@samsung.com>
References: <1380279558-21651-1-git-send-email-arun.kk@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380279558-21651-1-git-send-email-arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kilyeon.im-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arunkk.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

s5k6a3 sensor has actual pixel resolution of 1408x1402 against
the active resolution 1392x1392. The real resolution is needed
when raw sensor SRGB data is dumped to memory by fimc-lite.

Signed-off-by: Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/media/i2c/s5k6a3.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/s5k6a3.c b/drivers/media/i2c/s5k6a3.c
index ccbb4fc..e70e217 100644
--- a/drivers/media/i2c/s5k6a3.c
+++ b/drivers/media/i2c/s5k6a3.c
@@ -25,10 +25,12 @@
 #include <media/v4l2-async.h>
 #include <media/v4l2-subdev.h>
 
-#define S5K6A3_SENSOR_MAX_WIDTH		1392
-#define S5K6A3_SENSOR_MAX_HEIGHT	1392
-#define S5K6A3_SENSOR_MIN_WIDTH		32
-#define S5K6A3_SENSOR_MIN_HEIGHT	32
+#define S5K6A3_SENSOR_MAX_WIDTH		1408
+#define S5K6A3_SENSOR_MAX_HEIGHT	1402
+#define S5K6A3_SENSOR_ACTIVE_WIDTH	1392
+#define S5K6A3_SENSOR_ACTIVE_HEIGHT	1392
+#define S5K6A3_SENSOR_MIN_WIDTH		(32 + 16)
+#define S5K6A3_SENSOR_MIN_HEIGHT	(32 + 10)
 
 #define S5K6A3_DEF_PIX_WIDTH		1296
 #define S5K6A3_DEF_PIX_HEIGHT		732
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
