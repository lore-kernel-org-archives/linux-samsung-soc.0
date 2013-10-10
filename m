From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] spi: Provide common spi_message processing loop
Date: Thu, 10 Oct 2013 11:44:53 +0100
Message-ID: <1381401894-17606-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:36586 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753100Ab3JJKul (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 06:50:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

The loops which SPI controller drivers use to process the list of transfers
in a spi_message are typically very similar and have some error prone areas
such as the handling of /CS. Help simplify drivers by factoring this code
out into the core - if drivers provide a transfer_one() function instead
of a transfer_one_message() function the core will handle processing at the
message level.

/CS can be controlled by either setting cs_gpio or providing a set_cs
function. If this is not possible for hardware reasons then both can be
omitted and the driver should continue to implement manual /CS handling.

This is a first step in refactoring and it is expected that there will be
further enhancements, for example factoring out of the mapping of transfers
for DMA and the initiation and completion of interrupt driven transfers.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/spi/spi.c       | 88 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/spi/spi.h | 21 ++++++++++--
 2 files changed, 107 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 253ea3b..49e63c7 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -526,6 +526,91 @@ int spi_register_board_info(struct spi_board_info const *info, unsigned n)
 
 /*-------------------------------------------------------------------------*/
 
+static void spi_set_cs(struct spi_device *spi, bool enable)
+{
+	if (spi->mode & SPI_CS_HIGH)
+		enable = !enable;
+
+	if (spi->cs_gpio >= 0)
+		gpio_set_value(spi->cs_gpio, !enable);
+	else if (spi->master->set_cs)
+		spi->master->set_cs(spi, !enable);
+}
+
+/*
+ * spi_transfer_one_message - Default implementation of transfer_one_message()
+ *
+ * This is a standard implementation of transfer_one_message() for
+ * drivers which impelment a transfer_one() operation.  It provides
+ * standard handling of delays and chip select management.
+ */
+static int spi_transfer_one_message(struct spi_master *master,
+				    struct spi_message *msg)
+{
+	struct spi_transfer *xfer;
+	bool cur_cs = true;
+	bool keep_cs = false;
+	int ret = 0;
+
+	spi_set_cs(msg->spi, true);
+
+	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
+		INIT_COMPLETION(master->xfer_completion);
+
+		ret = master->transfer_one(master, msg->spi, xfer);
+		if (ret < 0) {
+			dev_err(&msg->spi->dev,
+				"SPI transfer failed: %d\n", ret);
+			goto out;
+		}
+
+		if (ret > 0)
+			wait_for_completion(&master->xfer_completion);
+
+		if (msg->status != -EINPROGRESS)
+			goto out;
+
+		if (xfer->delay_usecs)
+			udelay(xfer->delay_usecs);
+
+		if (xfer->cs_change) {
+			if (list_is_last(&xfer->transfer_list,
+					 &msg->transfers)) {
+				keep_cs = true;
+			} else {
+				cur_cs = !cur_cs;
+				spi_set_cs(msg->spi, cur_cs);
+			}
+		}
+
+		msg->actual_length += xfer->len;
+	}
+
+out:
+	if (ret != 0 || !keep_cs)
+		spi_set_cs(msg->spi, false);
+
+	if (msg->status == -EINPROGRESS)
+		msg->status = ret;
+
+	spi_finalize_current_message(master);
+
+	return ret;
+}
+
+/**
+ * spi_finalize_current_transfer - report completion of a transfer
+ *
+ * Called by SPI drivers using the core transfer_one_message()
+ * implementation to notify it that the current interrupt driven
+ * transfer has finised and the next one may be scheduled.
+ */
+void spi_finalize_current_transfer(struct spi_master *master)
+{
+	complete(&master->xfer_completion);
+}
+EXPORT_SYMBOL_GPL(spi_finalize_current_transfer);
+
 /**
  * spi_pump_messages - kthread work function which processes spi message queue
  * @work: pointer to kthread work struct contained in the master struct
@@ -836,6 +921,8 @@ static int spi_master_initialize_queue(struct spi_master *master)
 
 	master->queued = true;
 	master->transfer = spi_queued_transfer;
+	if (!master->transfer_one_message)
+		master->transfer_one_message = spi_transfer_one_message;
 
 	/* Initialize and start queue */
 	ret = spi_init_queue(master);
@@ -1236,6 +1323,7 @@ int spi_register_master(struct spi_master *master)
 	spin_lock_init(&master->bus_lock_spinlock);
 	mutex_init(&master->bus_lock_mutex);
 	master->bus_lock_flag = 0;
+	init_completion(&master->xfer_completion);
 
 	/* register the device, then userspace will see it.
 	 * registration fails if the bus ID is in use.
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 98620486..8c62ba7 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -23,6 +23,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/slab.h>
 #include <linux/kthread.h>
+#include <linux/completion.h>
 
 /*
  * INTERFACES between SPI master-side drivers and SPI infrastructure.
@@ -150,8 +151,7 @@ static inline void *spi_get_drvdata(struct spi_device *spi)
 }
 
 struct spi_message;
-
-
+struct spi_transfer;
 
 /**
  * struct spi_driver - Host side "protocol" driver
@@ -259,6 +259,7 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
  * @cur_msg: the currently in-flight message
  * @cur_msg_prepared: spi_prepare_message was called for the currently
  *                    in-flight message
+ * @xfer_completion: used by core tranfer_one_message()
  * @busy: message pump is busy
  * @running: message pump is running
  * @rt: whether this queue is set to run as a realtime task
@@ -276,9 +277,15 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
  * @unprepare_transfer_hardware: there are currently no more messages on the
  *	queue so the subsystem notifies the driver that it may relax the
  *	hardware by issuing this call
+ * @set_cs: assert or deassert chip select, true to assert.  May be called
+ *          from interrupt context.
  * @prepare_message: set up the controller to transfer a single message,
  *                   for example doing DMA mapping.  Called from threaded
  *                   context.
+ * @transfer_one: transfer a single spi_transfer. When the
+ *	          driver is finished with this transfer it must call
+ *	          spi_finalize_current_transfer() so the subsystem can issue
+ *                the next transfer
  * @unprepare_message: undo any work done by prepare_message().
  * @cs_gpios: Array of GPIOs to use as chip select lines; one per CS
  *	number. Any individual value may be -ENOENT for CS lines that
@@ -395,6 +402,7 @@ struct spi_master {
 	bool				rt;
 	bool				auto_runtime_pm;
 	bool                            cur_msg_prepared;
+	struct completion               xfer_completion;
 
 	int (*prepare_transfer_hardware)(struct spi_master *master);
 	int (*transfer_one_message)(struct spi_master *master,
@@ -405,6 +413,14 @@ struct spi_master {
 	int (*unprepare_message)(struct spi_master *master,
 				 struct spi_message *message);
 
+	/*
+	 * These hooks are for drivers that use a generic implementation
+	 * of transfer_one_message() provied by the core.
+	 */
+	void (*set_cs)(struct spi_device *spi, bool enable);
+	int (*transfer_one)(struct spi_master *master, struct spi_device *spi,
+			    struct spi_transfer *transfer);
+
 	/* gpio chip select */
 	int			*cs_gpios;
 };
@@ -439,6 +455,7 @@ extern int spi_master_resume(struct spi_master *master);
 /* Calls the driver make to interact with the message queue */
 extern struct spi_message *spi_get_next_queued_message(struct spi_master *master);
 extern void spi_finalize_current_message(struct spi_master *master);
+extern void spi_finalize_current_transfer(struct spi_master *master);
 
 /* the spi driver core manages memory for the spi_master classdev */
 extern struct spi_master *
-- 
1.8.4.rc3
