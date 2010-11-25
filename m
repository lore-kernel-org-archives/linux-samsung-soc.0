From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 6/6] [media] s5p-fimc: Fix output DMA handling in S5PV310 IP
 revisions
Date: Thu, 25 Nov 2010 16:05:12 +0100
Message-ID: <1290697512-30563-7-git-send-email-s.nawrocki@samsung.com>
References: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59799 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753203Ab0KYPFl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Nov 2010 10:05:41 -0500
In-reply-to: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com

FIMC IP in S5Pv310 series has extended DMA status registers
and some bit fields are marked as reserved comparing to S5PC100/110.
Use correct registers for getting DMA write pointer in each SoC variant
supported by the driver.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/fimc-capture.c |    1 +
 drivers/media/video/s5p-fimc/fimc-core.c    |    2 ++
 drivers/media/video/s5p-fimc/fimc-core.h    |   16 +++++++++++++---
 drivers/media/video/s5p-fimc/regs-fimc.h    |    3 +++
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/fimc-capture.c b/drivers/media/video/s5p-fimc/fimc-capture.c
index c020bf6..ba18acb 100644
--- a/drivers/media/video/s5p-fimc/fimc-capture.c
+++ b/drivers/media/video/s5p-fimc/fimc-capture.c
@@ -522,6 +522,7 @@ static int fimc_cap_streamon(struct file *file, void *priv,
 	INIT_LIST_HEAD(&fimc->vid_cap.active_buf_q);
 	fimc->vid_cap.active_buf_cnt = 0;
 	fimc->vid_cap.frame_count = 0;
+	fimc->vid_cap.buf_index = fimc_hw_get_frame_index(fimc);
 
 	set_bit(ST_CAPT_PEND, &fimc->state);
 	ret = videobuf_streamon(&fimc->vid_cap.vbq);
diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media/video/s5p-fimc/fimc-core.c
index f538eb5..bb99f2d 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.c
+++ b/drivers/media/video/s5p-fimc/fimc-core.c
@@ -1746,6 +1746,7 @@ static struct samsung_fimc_variant fimc0_variant_s5pv310 = {
 	.pix_hoff	 = 1,
 	.has_inp_rot	 = 1,
 	.has_out_rot	 = 1,
+	.has_cistatus2	 = 1,
 	.min_inp_pixsize = 16,
 	.min_out_pixsize = 16,
 	.hor_offs_align	 = 1,
@@ -1755,6 +1756,7 @@ static struct samsung_fimc_variant fimc0_variant_s5pv310 = {
 
 static struct samsung_fimc_variant fimc2_variant_s5pv310 = {
 	.pix_hoff	 = 1,
+	.has_cistatus2	 = 1,
 	.min_inp_pixsize = 16,
 	.min_out_pixsize = 16,
 	.hor_offs_align	 = 1,
diff --git a/drivers/media/video/s5p-fimc/fimc-core.h b/drivers/media/video/s5p-fimc/fimc-core.h
index 6137340..4f047d3 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.h
+++ b/drivers/media/video/s5p-fimc/fimc-core.h
@@ -371,6 +371,7 @@ struct fimc_pix_limit {
  * @pix_hoff: indicate whether horizontal offset is in pixels or in bytes
  * @has_inp_rot: set if has input rotator
  * @has_out_rot: set if has output rotator
+ * @has_cistatus2: 1 if CISTATUS2 register is present in this IP revision
  * @pix_limit: pixel size constraints for the scaler
  * @min_inp_pixsize: minimum input pixel size
  * @min_out_pixsize: minimum output pixel size
@@ -381,6 +382,7 @@ struct samsung_fimc_variant {
 	unsigned int	pix_hoff:1;
 	unsigned int	has_inp_rot:1;
 	unsigned int	has_out_rot:1;
+	unsigned int	has_cistatus2:1;
 	struct fimc_pix_limit *pix_limit;
 	u16		min_inp_pixsize;
 	u16		min_out_pixsize;
@@ -556,11 +558,19 @@ static inline struct fimc_frame *ctx_get_frame(struct fimc_ctx *ctx,
 	return frame;
 }
 
+/* Return an index to the buffer actually being written. */
 static inline u32 fimc_hw_get_frame_index(struct fimc_dev *dev)
 {
-	u32 reg = readl(dev->regs + S5P_CISTATUS);
-	return (reg & S5P_CISTATUS_FRAMECNT_MASK) >>
-		S5P_CISTATUS_FRAMECNT_SHIFT;
+	u32 reg;
+
+	if (dev->variant->has_cistatus2) {
+		reg = readl(dev->regs + S5P_CISTATUS2) & 0x3F;
+		return reg > 0 ? --reg : reg;
+	} else {
+		reg = readl(dev->regs + S5P_CISTATUS);
+		return (reg & S5P_CISTATUS_FRAMECNT_MASK) >>
+			S5P_CISTATUS_FRAMECNT_SHIFT;
+	}
 }
 
 /* -----------------------------------------------------*/
diff --git a/drivers/media/video/s5p-fimc/regs-fimc.h b/drivers/media/video/s5p-fimc/regs-fimc.h
index a57daed..57e33f8 100644
--- a/drivers/media/video/s5p-fimc/regs-fimc.h
+++ b/drivers/media/video/s5p-fimc/regs-fimc.h
@@ -165,6 +165,9 @@
 #define S5P_CISTATUS_VVALID_A		(1 << 15)
 #define S5P_CISTATUS_VVALID_B		(1 << 14)
 
+/* Indexes to the last and the currently processed buffer. */
+#define S5P_CISTATUS2			0x68
+
 /* Image capture control */
 #define S5P_CIIMGCPT			0xc0
 #define S5P_CIIMGCPT_IMGCPTEN		(1 << 31)
-- 
1.7.1
