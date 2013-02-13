From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [RFC v2 1/3] video: display: Adding frame related ops to MIPI DSI video source struct
Date: Wed, 13 Feb 2013 15:31:05 +0530
Message-ID: <1360749667-12028-2-git-send-email-vikas.sajjan@linaro.org>
References: <1360749667-12028-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1360749667-12028-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-media-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, l.krishna@samsung.com, joshi@samsung.com, aditya.ps@samsung.com, tom.gall@linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, ragesh.r@linaro.org, jesse.barker@linaro.org, robdclark@gmail.com, sumit.semwal@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Adds the frame related ops to MIPI DSI video source struct

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 include/video/display.h |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/video/display.h b/include/video/display.h
index b639fd0..fb2f437 100644
--- a/include/video/display.h
+++ b/include/video/display.h
@@ -117,6 +117,12 @@ struct dsi_video_source_ops {
 
 	void (*enable_hs)(struct video_source *src, bool enable);
 
+	/* frame related */
+	int (*get_frame_done)(struct video_source *src);
+	int (*clear_frame_done)(struct video_source *src);
+	int (*set_early_blank_mode)(struct video_source *src, int power);
+	int (*set_blank_mode)(struct video_source *src, int power);
+
 	/* data transfer */
 	int (*dcs_write)(struct video_source *src, int channel,
 			u8 *data, size_t len);
-- 
1.7.9.5
