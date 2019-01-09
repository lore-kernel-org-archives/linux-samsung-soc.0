From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH] media: s5p-jpeg: Correct step and max values for V4L2_CID_JPEG_RESTART_INTERVAL
Date: Wed,  9 Jan 2019 19:00:41 +0100
Message-ID: <20190109180041.31052-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andrzej.p@samsung.com
Cc: jacek.anaszewski@gmail.com, mchehab@kernel.org, s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This commit corrects max and step values for v4l2 control for
V4L2_CID_JPEG_RESTART_INTERVAL. Max should be 0xffff and step should be 1.
It was found by using v4l2-compliance tool and checking result of
VIDIOC_QUERY_EXT_CTRL/QUERYMENU test.
Previously it was complaining that step was bigger than difference
between max and min.

Fixes: 15f4bc3b1f42 ("[media] s5p-jpeg: Add JPEG controls support")
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 drivers/media/platform/s5p-jpeg/jpeg-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index 3f9000b70385..33e9927db9a0 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -2002,7 +2002,7 @@ static int s5p_jpeg_controls_create(struct s5p_jpeg_ctx *ctx)
 
 		v4l2_ctrl_new_std(&ctx->ctrl_handler, &s5p_jpeg_ctrl_ops,
 				  V4L2_CID_JPEG_RESTART_INTERVAL,
-				  0, 3, 0xffff, 0);
+				  0, 0xffff, 1, 0);
 		if (ctx->jpeg->variant->version == SJPEG_S5P)
 			mask = ~0x06; /* 422, 420 */
 	}
-- 
2.17.1
