From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] spi: Provide per-message prepare and unprepare operations
Date: Wed,  9 Oct 2013 18:01:43 +0100
Message-ID: <1381338104-5550-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:45222 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752216Ab3JIRCO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Oct 2013 13:02:14 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Lukasz Czerwinski <l.czerwinski@samsung.com>, s.nawrocki@samsung.com
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Many SPI drivers perform setup and tear down on every message, usually
doing things like DMA mapping the message. Provide hooks for them to use
to provide such operations.

This is of limited value for drivers that implement transfer_one_message()
but will be of much greater utility with future factoring out of standard
implementations of that function.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi.c       | 22 ++++++++++++++++++++++
 include/linux/spi/spi.h | 11 +++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index b86ba60..253ea3b 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -606,6 +606,18 @@ static void spi_pump_messages(struct kthread_work *work)
 
 	trace_spi_message_start(master->cur_msg);
 
+	if (master->prepare_message) {
+		ret = master->prepare_message(master, master->cur_msg);
+		if (ret) {
+			dev_err(&master->dev,
+				"failed to prepare message: %d\n", ret);
+			master->cur_msg->status = ret;
+			spi_finalize_current_message(master);
+			return;
+		}
+		master->cur_msg_prepared = true;
+	}
+
 	ret = master->transfer_one_message(master, master->cur_msg);
 	if (ret) {
 		dev_err(&master->dev,
@@ -687,6 +699,7 @@ void spi_finalize_current_message(struct spi_master *master)
 {
 	struct spi_message *mesg;
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&master->queue_lock, flags);
 	mesg = master->cur_msg;
@@ -695,6 +708,15 @@ void spi_finalize_current_message(struct spi_master *master)
 	queue_kthread_work(&master->kworker, &master->pump_messages);
 	spin_unlock_irqrestore(&master->queue_lock, flags);
 
+	if (master->cur_msg_prepared && master->unprepare_message) {
+		ret = master->unprepare_message(master, mesg);
+		if (ret) {
+			dev_err(&master->dev,
+				"failed to unprepare message: %d\n", ret);
+		}
+	}
+	master->cur_msg_prepared = false;
+
 	mesg->state = NULL;
 	if (mesg->complete)
 		mesg->complete(mesg->context);
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index b329192..98620486 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -257,6 +257,8 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
  * @queue_lock: spinlock to syncronise access to message queue
  * @queue: message queue
  * @cur_msg: the currently in-flight message
+ * @cur_msg_prepared: spi_prepare_message was called for the currently
+ *                    in-flight message
  * @busy: message pump is busy
  * @running: message pump is running
  * @rt: whether this queue is set to run as a realtime task
@@ -274,6 +276,10 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
  * @unprepare_transfer_hardware: there are currently no more messages on the
  *	queue so the subsystem notifies the driver that it may relax the
  *	hardware by issuing this call
+ * @prepare_message: set up the controller to transfer a single message,
+ *                   for example doing DMA mapping.  Called from threaded
+ *                   context.
+ * @unprepare_message: undo any work done by prepare_message().
  * @cs_gpios: Array of GPIOs to use as chip select lines; one per CS
  *	number. Any individual value may be -ENOENT for CS lines that
  *	are not GPIOs (driven by the SPI controller itself).
@@ -388,11 +394,16 @@ struct spi_master {
 	bool				running;
 	bool				rt;
 	bool				auto_runtime_pm;
+	bool                            cur_msg_prepared;
 
 	int (*prepare_transfer_hardware)(struct spi_master *master);
 	int (*transfer_one_message)(struct spi_master *master,
 				    struct spi_message *mesg);
 	int (*unprepare_transfer_hardware)(struct spi_master *master);
+	int (*prepare_message)(struct spi_master *master,
+			       struct spi_message *message);
+	int (*unprepare_message)(struct spi_master *master,
+				 struct spi_message *message);
 
 	/* gpio chip select */
 	int			*cs_gpios;
-- 
1.8.4.rc3
