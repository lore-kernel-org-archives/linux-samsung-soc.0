From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 03/15 v2] v4l: Add multiplanar format fourccs for s5p-fimc
 driver
Date: Wed, 29 Dec 2010 18:32:45 +0100
Message-ID: <1293643975-4528-4-git-send-email-s.nawrocki@samsung.com>
References: <1293643975-4528-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:29488 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753500Ab0L2RdA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Dec 2010 12:33:00 -0500
In-reply-to: <1293643975-4528-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Add definitions for format with color planes non-contiguous
in physical memory. These formats apply only if the V4L2 multiplane
extension is used.

V4L2_PIX_FMT_NV12M   - 2-plane Y/CbCr
V4L2_PIX_FMT_NV12MT  - 2-plane Y/CbCr tiled (64x32 pixel macroblocks)
V4L2_PIX_FMT_YUV420M - 3-plane Y/Cb/Cr

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 include/linux/videodev2.h |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index d30c98d..b68ca56 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -339,6 +339,13 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV16    v4l2_fourcc('N', 'V', '1', '6') /* 16  Y/CbCr 4:2:2  */
 #define V4L2_PIX_FMT_NV61    v4l2_fourcc('N', 'V', '6', '1') /* 16  Y/CrCb 4:2:2  */
 
+/* two non contiguous planes - one Y, one Cr + Cb interleaved  */
+#define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/CbCr 4:2:0  */
+#define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 64x32 macroblocks */
+
+/* three non contiguous planes - Y, Cb, Cr */
+#define V4L2_PIX_FMT_YUV420M v4l2_fourcc('Y', 'M', '1', '2') /* 12  YUV420 planar */
+
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
 #define V4L2_PIX_FMT_SGBRG8  v4l2_fourcc('G', 'B', 'R', 'G') /*  8  GBGB.. RGRG.. */
-- 
1.7.2.3
