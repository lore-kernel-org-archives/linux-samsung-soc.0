Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C842C1DE4DA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183026; cv=none; b=ND1FR4/rIFVzPeMUQmAiP9jwfXw49XepaNud50sT/gmNHJRHtTe73PyhXtsCMNtbKcdHaZo4EJyME5YAPg+q4bG0Z8O0l/4vwM9NsW+pSWeJM5hQ/NwW6hzg+En6F3qJCEP2ce3LNauocYfu+nzFNaEVmhbopplsudQ5/wksbG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183026; c=relaxed/simple;
	bh=yP4mrDR7TT7zFyehxyjt1XbOaha8+P66CXX4RkC2Y+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VsWQho3dIY7bnkaRLey8gvS+2vtqbTG86FbaC/8Z+R6fsFiexiqzTOoQhoKycSei0X8TFy0jYU/rNhZAGkdkD1o1Ql5Bm6I+fYfm2BqiK4GGuU50mzXMNoJaqCVZUdEe/GvSmYQLl5a4TAEpfmGbq3qQPokFGH+iyACRAiPW65U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sOFJ1ptl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOFJ1ptl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4314f38d274so16001065e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 09:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729183019; x=1729787819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWAw/cKeoVi0DyEgj1WlGf9TcvQWH3bdvfqRpdguuZo=;
        b=sOFJ1ptlOQb8HlANxoHjnAvMZoL5LIvjPqzEtMPnGuvkLSO2jOwEGSBDymYbfQyKEN
         qHcsBgIwRhBx30+mkyaaqXLi4w/73/JwxdLXF1mZUC5wljmUgok/s3Sut1aiRiE547cg
         ziNY/8emLw5vTTmY7jQdmyAahWcyJzcT9o0SXkXtKCrDaVzTgJklxpdvjKEky7bdsDzD
         Ypm72+jVC/MQprFxDiJnzN0za5G2EWx9/q5KFUXWEHj8/sAUsLTGoK3IS4hWA0s1HapO
         M/o0BbewKSSwmkG3d1FVcIxLxQD6JMtU7lcC/QF3QdUVzUKge5e3kuxRjgby9LUQJ0f8
         SF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729183019; x=1729787819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWAw/cKeoVi0DyEgj1WlGf9TcvQWH3bdvfqRpdguuZo=;
        b=S7MYideGUPaSfPBkgDf+u8fBO55NGhjSpSoMSRrhz6H0tc+SLlo5hYrpojYin+w4fK
         ma4iCzpQIC1GOEQCMVyavGFounbuaHoyIoiY/0VhzrigkI1xrubeR5n1HE72QA8ml/EM
         95WJFV1Z7y5WTdiBwIqMOa6rv8E79vaFoXR0Ioa38L2bN5OSBwjjtF9pN39S7Vq4HuLn
         R7/jxdzS2P8wpr+zU46sYv7YI8CHG5+kl5102uGnTi5WB0AHijdwbczi7rg2CCH+8E2x
         G4HmClbr8cTGXLrd6AKjXimgjaPqNE3nCujPc6q6gjIGKoPXTAHCmIKvFUJxx88QMZws
         EXHw==
X-Forwarded-Encrypted: i=1; AJvYcCWHKDMTKjsCbeOFCCwKJymfIIvLgAbwV5pi4jRLeJJL/DhfiIUVQ1vme5ceMszsMbMpKdE6lEKJqFhkntAzIba+LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9uT25aAV6t4hGvgp927USK6oPSQuhKVOPTqgMFr1Sd3yZiRSD
	Uuyia6Q87fp5UkqLIJbhx/FrdQfYCZDVOwHGsc2SMkNOCsyaXKEz4kz88Jk/+0A=
X-Google-Smtp-Source: AGHT+IFh75U3p5IpYJoVMgO26bnm/M6DBFZJl+8VSyq5GjFpTMpDfHMxcpbrX2E8ip7LUNeMJt/4xA==
X-Received: by 2002:a05:600c:4f49:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-4315c3d18b2mr26898195e9.21.1729183019046;
        Thu, 17 Oct 2024 09:36:59 -0700 (PDT)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc11aefsm7710376f8f.93.2024.10.17.09.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:36:57 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: jassisinghbrar@gmail.com,
	krzk@kernel.org
Cc: alim.akhtar@samsung.com,
	mst@redhat.com,
	javierm@redhat.com,
	tzimmermann@suse.de,
	bartosz.golaszewski@linaro.org,
	luzmaximilian@gmail.com,
	sudeep.holla@arm.com,
	conor.dooley@microchip.com,
	bjorn@rivosinc.com,
	ulf.hansson@linaro.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	marcan@marcan.st,
	neal@gompa.dev,
	alyssa@rosenzweig.io,
	broonie@kernel.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	vincent.guittot@linaro.org,
	daniel.lezcano@linaro.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 1/2] mailbox: add async request mechanism to empower controllers w/ hw queues
Date: Thu, 17 Oct 2024 16:36:48 +0000
Message-ID: <20241017163649.3007062-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current form of the mailbox framework doesn't allow controllers to benefit
of their hardware queue capabilities as the framework handles a single
active request at a time.

The active request is considered completed when TX completes. But it seems
that TX is not in direct relation with RX, so a client can't know to which
TX data the RX data corresponds to. Let's consider a client sends
TX1 data, mbox->ops->send_data() is called, timer is started immediately,
last_tx_done() returns true and the client is notified that TX1 completed.
Client sends TX2 and gets notified that TX2 completed. RX comes,
mbox_chan_received_data(chan, mssg) is called after both TX1 and TX2
completed. Client can't know if the received mssg belongs to TX1 or TX2.

In order to address these shortcomings, add a simple async mechanism
based on requests. A request will contain pointers to tx and rx (if any)
data, along with a pointer to a completion struct. Is the responsibility
of the client to allocate and fill the request:

static int client_send_request(struct demo_client *dc, void *data,
			       size_t data_len)
{
	DECLARE_MBOX_WAIT(wait);
	struct mbox_request req;
	int ret;

	req.wait = &wait;
	req.tx = data;
	req.txlen = data_len;
	/*
	 * Set req.rx = NULL if no response is expected. Here we
	 * use the same memory to get the response.
	 */
	req.rx = data;
	req.rxlen = data_len;

	ret = mbox_send_request(dc->mbox_chan, &req);
	ret = mbox_wait_request(ret, &wait);
	if (ret)
		dev_err(dc->dev, "%s failed %d\n", __func__, ret);
	return ret;
}

mbox_send_request() sends a message on the bus. The call may be in atomic
context. Returns -EINPROGRESS if data is fed into hardware, -ENOSPC when
the hardware queue is full, or zero when the request completes.
The message (queue) handling is thus deferred to the controller.

Similar mechanism is used in the crypto subsystem.

The async req mechanism is mutual exclusive with the current message
software queue handling. In the future the software queue handling can
be used as an opt-in backlog choice for users that need it. But we'll
have to do the conversion from ``void *message`` to
``struct mbox_request *req`` throughout the API.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mailbox/mailbox.c          | 127 +++++++++++++++++++++++------
 include/linux/mailbox_client.h     |   4 +
 include/linux/mailbox_controller.h |   7 ++
 include/linux/mailbox_request.h    |  33 ++++++++
 4 files changed, 148 insertions(+), 23 deletions(-)
 create mode 100644 include/linux/mailbox_request.h

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index d3d26a2c9895..4fe905710458 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -158,6 +158,11 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
  */
 void mbox_chan_received_data(struct mbox_chan *chan, void *mssg)
 {
+	if (chan->mbox->ops->send_request) {
+		dev_dbg(chan->mbox->dev, "Operation not supported for mailbox requests\n");
+		return;
+	}
+
 	/* No buffering the received data */
 	if (chan->cl->rx_callback)
 		chan->cl->rx_callback(chan->cl, mssg);
@@ -176,6 +181,11 @@ EXPORT_SYMBOL_GPL(mbox_chan_received_data);
  */
 void mbox_chan_txdone(struct mbox_chan *chan, int r)
 {
+	if (chan->mbox->ops->send_request) {
+		dev_dbg(chan->mbox->dev, "Operation not supported for mailbox requests\n");
+		return;
+	}
+
 	if (unlikely(!(chan->txdone_method & TXDONE_BY_IRQ))) {
 		dev_err(chan->mbox->dev,
 		       "Controller can't run the TX ticker\n");
@@ -197,6 +207,11 @@ EXPORT_SYMBOL_GPL(mbox_chan_txdone);
  */
 void mbox_client_txdone(struct mbox_chan *chan, int r)
 {
+	if (chan->mbox->ops->send_request) {
+		dev_dbg(chan->mbox->dev, "Operation not supported for mailbox requests\n");
+		return;
+	}
+
 	if (unlikely(!(chan->txdone_method & TXDONE_BY_ACK))) {
 		dev_err(chan->mbox->dev, "Client can't run the TX ticker\n");
 		return;
@@ -261,6 +276,11 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 	if (!chan || !chan->cl)
 		return -EINVAL;
 
+	if (chan->mbox->ops->send_request) {
+		dev_dbg(chan->mbox->dev, "Operation not supported for mailbox requests\n");
+		return -EOPNOTSUPP;
+	}
+
 	t = add_to_rbuf(chan, mssg);
 	if (t < 0) {
 		dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
@@ -289,6 +309,39 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 }
 EXPORT_SYMBOL_GPL(mbox_send_message);
 
+int mbox_send_request(struct mbox_chan *chan, struct mbox_request *req)
+{
+	return chan->mbox->ops->send_request(chan, req);
+}
+EXPORT_SYMBOL_GPL(mbox_send_request);
+
+int mbox_wait_request(int err, struct mbox_wait *wait)
+{
+	switch (err) {
+	case -EINPROGRESS:
+		wait_for_completion(&wait->completion);
+		reinit_completion(&wait->completion);
+		err = wait->err;
+		break;
+	}
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mbox_wait_request);
+
+void mbox_request_complete(struct mbox_request *req, int err)
+{
+	struct mbox_wait *wait;
+
+	if (err == -EINPROGRESS)
+		return;
+
+	wait = req->wait;
+	wait->err = err;
+	complete(&wait->completion);
+}
+EXPORT_SYMBOL_GPL(mbox_request_complete);
+
 /**
  * mbox_flush - flush a mailbox channel
  * @chan: mailbox channel to flush
@@ -311,24 +364,44 @@ int mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 		return -ENOTSUPP;
 
 	ret = chan->mbox->ops->flush(chan, timeout);
-	if (ret < 0)
+	if (ret < 0 && !chan->mbox->ops->send_request)
 		tx_tick(chan, ret);
 
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mbox_flush);
 
+static int mbox_chan_startup(struct mbox_chan *chan, struct mbox_client *cl)
+{
+	struct mbox_controller *mbox = chan->mbox;
+	struct device *dev = cl->dev;
+	int ret;
+
+	if (!mbox->ops->startup)
+		return 0;
+
+	ret = mbox->ops->startup(chan);
+	if (ret) {
+		dev_err(dev, "Unable to startup the chan (%d)\n", ret);
+		mbox_free_channel(chan);
+	}
+
+	return ret;
+}
+
 static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 {
 	struct device *dev = cl->dev;
 	unsigned long flags;
-	int ret;
 
 	if (chan->cl || !try_module_get(chan->mbox->dev->driver->owner)) {
 		dev_dbg(dev, "%s: mailbox not free\n", __func__);
 		return -EBUSY;
 	}
 
+	if (chan->mbox->ops->send_request)
+		return mbox_chan_startup(chan, cl);
+
 	spin_lock_irqsave(&chan->lock, flags);
 	chan->msg_free = 0;
 	chan->msg_count = 0;
@@ -341,17 +414,7 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 
 	spin_unlock_irqrestore(&chan->lock, flags);
 
-	if (chan->mbox->ops->startup) {
-		ret = chan->mbox->ops->startup(chan);
-
-		if (ret) {
-			dev_err(dev, "Unable to startup the chan (%d)\n", ret);
-			mbox_free_channel(chan);
-			return ret;
-		}
-	}
-
-	return 0;
+	return mbox_chan_startup(chan, cl);
 }
 
 /**
@@ -474,13 +537,18 @@ EXPORT_SYMBOL_GPL(mbox_request_channel_byname);
  */
 void mbox_free_channel(struct mbox_chan *chan)
 {
+	struct mbox_controller *mbox;
 	unsigned long flags;
 
 	if (!chan || !chan->cl)
 		return;
 
-	if (chan->mbox->ops->shutdown)
-		chan->mbox->ops->shutdown(chan);
+	mbox = chan->mbox;
+	if (mbox->ops->shutdown)
+		mbox->ops->shutdown(chan);
+
+	if (mbox->ops->send_request)
+		return module_put(mbox->dev->driver->owner);
 
 	/* The queued TX requests are simply aborted, no callbacks are made */
 	spin_lock_irqsave(&chan->lock, flags);
@@ -489,7 +557,7 @@ void mbox_free_channel(struct mbox_chan *chan)
 	if (chan->txdone_method == TXDONE_BY_ACK)
 		chan->txdone_method = TXDONE_BY_POLL;
 
-	module_put(chan->mbox->dev->driver->owner);
+	module_put(mbox->dev->driver->owner);
 	spin_unlock_irqrestore(&chan->lock, flags);
 }
 EXPORT_SYMBOL_GPL(mbox_free_channel);
@@ -506,6 +574,13 @@ of_mbox_index_xlate(struct mbox_controller *mbox,
 	return &mbox->chans[ind];
 }
 
+static void mbox_controller_add_tail(struct mbox_controller *mbox)
+{
+	mutex_lock(&con_mutex);
+	list_add_tail(&mbox->node, &mbox_cons);
+	mutex_unlock(&con_mutex);
+}
+
 /**
  * mbox_controller_register - Register the mailbox controller
  * @mbox:	Pointer to the mailbox controller.
@@ -520,6 +595,17 @@ int mbox_controller_register(struct mbox_controller *mbox)
 	if (!mbox || !mbox->dev || !mbox->ops || !mbox->num_chans)
 		return -EINVAL;
 
+	if (mbox->ops->send_request && mbox->ops->send_data)
+		return -EINVAL;
+
+	if (!mbox->of_xlate)
+		mbox->of_xlate = of_mbox_index_xlate;
+
+	if (mbox->ops->send_request) {
+		mbox_controller_add_tail(mbox);
+		return 0;
+	}
+
 	if (mbox->txdone_irq)
 		txdone = TXDONE_BY_IRQ;
 	else if (mbox->txdone_poll)
@@ -549,12 +635,7 @@ int mbox_controller_register(struct mbox_controller *mbox)
 		spin_lock_init(&chan->lock);
 	}
 
-	if (!mbox->of_xlate)
-		mbox->of_xlate = of_mbox_index_xlate;
-
-	mutex_lock(&con_mutex);
-	list_add_tail(&mbox->node, &mbox_cons);
-	mutex_unlock(&con_mutex);
+	mbox_controller_add_tail(mbox);
 
 	return 0;
 }
@@ -578,7 +659,7 @@ void mbox_controller_unregister(struct mbox_controller *mbox)
 	for (i = 0; i < mbox->num_chans; i++)
 		mbox_free_channel(&mbox->chans[i]);
 
-	if (mbox->txdone_poll)
+	if (!mbox->ops->send_request && mbox->txdone_poll)
 		hrtimer_cancel(&mbox->poll_hrt);
 
 	mutex_unlock(&con_mutex);
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index 734694912ef7..2eb951fdee0b 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -9,6 +9,7 @@
 
 #include <linux/of.h>
 #include <linux/device.h>
+#include <linux/mailbox_request.h>
 
 struct mbox_chan;
 
@@ -47,4 +48,7 @@ void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
 bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
 void mbox_free_channel(struct mbox_chan *chan); /* may sleep */
 
+int mbox_send_request(struct mbox_chan *chan, struct mbox_request *req);
+int mbox_wait_request(int err, struct mbox_wait *wait);
+
 #endif /* __MAILBOX_CLIENT_H */
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 6fee33cb52f5..0582964b10a0 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -8,6 +8,7 @@
 #include <linux/hrtimer.h>
 #include <linux/device.h>
 #include <linux/completion.h>
+#include <linux/mailbox_request.h>
 
 struct mbox_chan;
 
@@ -20,6 +21,10 @@ struct mbox_chan;
  *		transmission of data is reported by the controller via
  *		mbox_chan_txdone (if it has some TX ACK irq). It must not
  *		sleep.
+ * @send_request: The API asks the MBOX controller driver to transmit a message
+ *                on the bus. The call may be in atomic context. Returns
+ *                -EINPROGRESS if data is fed into hardware, -ENOSPC when the
+ *                hardware queue is full, or zero when the request completes.
  * @flush:	Called when a client requests transmissions to be blocking but
  *		the context doesn't allow sleeping. Typically the controller
  *		will implement a busy loop waiting for the data to flush out.
@@ -45,6 +50,7 @@ struct mbox_chan;
  */
 struct mbox_chan_ops {
 	int (*send_data)(struct mbox_chan *chan, void *data);
+	int (*send_request)(struct mbox_chan *chan, struct mbox_request *req);
 	int (*flush)(struct mbox_chan *chan, unsigned long timeout);
 	int (*startup)(struct mbox_chan *chan);
 	void (*shutdown)(struct mbox_chan *chan);
@@ -131,6 +137,7 @@ int mbox_controller_register(struct mbox_controller *mbox); /* can sleep */
 void mbox_controller_unregister(struct mbox_controller *mbox); /* can sleep */
 void mbox_chan_received_data(struct mbox_chan *chan, void *data); /* atomic */
 void mbox_chan_txdone(struct mbox_chan *chan, int r); /* atomic */
+void mbox_request_complete(struct mbox_request *req, int err); /*can sleep */
 
 int devm_mbox_controller_register(struct device *dev,
 				  struct mbox_controller *mbox);
diff --git a/include/linux/mailbox_request.h b/include/linux/mailbox_request.h
new file mode 100644
index 000000000000..69e897e7d3a4
--- /dev/null
+++ b/include/linux/mailbox_request.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2024 Linaro Ltd.
+ */
+
+#ifndef __MAILBOX_REQUEST_H
+#define __MAILBOX_REQUEST_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+#include <linux/completion.h>
+
+struct mbox_wait {
+	struct completion completion;
+	int err;
+};
+
+#define DECLARE_MBOX_WAIT(_wait) \
+	struct mbox_wait _wait = { \
+		COMPLETION_INITIALIZER_ONSTACK((_wait).completion), 0 }
+
+#define MBOX_REQ_MAY_SLEEP	BIT(0)
+
+struct mbox_request {
+	struct mbox_wait *wait;
+	void *tx;
+	void *rx;
+	unsigned int txlen;
+	unsigned int rxlen;
+	u32 flags;
+};
+
+#endif /* __MAILBOX_H */
-- 
2.47.0.rc1.288.g06298d1525-goog

