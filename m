From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 6/7] s5p-fimc: Use pix_mp for the color format lookup
Date: Thu, 02 Jun 2011 12:12:03 +0200
Message-ID: <1307009524-1208-7-git-send-email-s.nawrocki@samsung.com>
References: <1307009524-1208-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1307009524-1208-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, sw0312.kim@samsung.com, riverful.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

With multi-planar formats fmt.pix_mp member of struct v4l2_format
should be used rather than fmt.pix. Fix find_fmt() function to do
the right thing.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-core.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media/video/s5p-fimc/fimc-core.c
index 85b47a3..873a879 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.c
+++ b/drivers/media/video/s5p-fimc/fimc-core.c
@@ -841,7 +841,7 @@ struct fimc_fmt *find_format(struct v4l2_format *f, unsigned int mask)
 
 	for (i = 0; i < ARRAY_SIZE(fimc_formats); ++i) {
 		fmt = &fimc_formats[i];
-		if (fmt->fourcc == f->fmt.pix.pixelformat &&
+		if (fmt->fourcc == f->fmt.pix_mp.pixelformat &&
 		   (fmt->flags & mask))
 			break;
 	}
-- 
1.7.5.2
