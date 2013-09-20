From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH] [media] v4l2-mem2mem: Don't schedule the context if abort job is called
Date: Fri, 20 Sep 2013 11:56:18 +0530
Message-ID: <1379658378-31163-2-git-send-email-shaik.ameer@samsung.com>
References: <1379658378-31163-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:52576 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754051Ab3ITGXR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Sep 2013 02:23:17 -0400
In-Reply-To: <1379658378-31163-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, posciak@google.com, shaik.ameer@samsung.com

When the current context is running,
1] If release is called, it waits until the job is finished.
2] As soon as the job is finished, v4l2_mem_ctx_release()tries to
   release the vb2 queues.
3] But if the current context can be scheduled in the v4l2_m2m_job_finish()
   it schedules the context and tries to call device_run().
4] As the release() and device_run() sequence can't be predicted sometimes
   device_run() may get empty vb2 buffers.

This patch adds the ABORT state to the job_flags. Once the job_abort() or
release() is called on the context, the same context will not be scheduled in
the v4l2_m2m_job_finish().

Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 7c43712..d5741be 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -41,6 +41,8 @@ module_param(debug, bool, 0644);
 #define TRANS_QUEUED		(1 << 0)
 /* Instance is currently running in hardware */
 #define TRANS_RUNNING		(1 << 1)
+/* Instance is currently aborting */
+#define TRANS_ABORT		(1 << 2)
 
 
 /* Offset base for buffers on the destination queue - used to distinguish
@@ -221,6 +223,14 @@ static void v4l2_m2m_try_schedule(struct v4l2_m2m_ctx *m2m_ctx)
 	}
 
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags_job);
+
+	/* If the context is aborted then don't schedule it */
+	if (m2m_ctx->job_flags & TRANS_ABORT) {
+		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
+		dprintk("Aborted context\n");
+		return;
+	}
+
 	if (m2m_ctx->job_flags & TRANS_QUEUED) {
 		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
 		dprintk("On job queue already\n");
@@ -280,6 +290,8 @@ static void v4l2_m2m_cancel_job(struct v4l2_m2m_ctx *m2m_ctx)
 
 	m2m_dev = m2m_ctx->m2m_dev;
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
+
+	m2m_ctx->job_flags |= TRANS_ABORT;
 	if (m2m_ctx->job_flags & TRANS_RUNNING) {
 		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 		m2m_dev->m2m_ops->job_abort(m2m_ctx->priv);
-- 
1.7.9.5
