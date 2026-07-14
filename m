Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190AE43550F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jul 2026 22:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067894; cv=none; b=JvFKv6xSZ8TB6NMRwpHz39yymNCKL1r80cGb0D/kCRNSdf47EXdAXTzckz5UfGMoMrDtK6EzI4PgaKxraQIRVA7A9Ubk3sDqPZp0WBAnYb5LpVMTskbjTd2Dkc7o9KzEuYdq9ryKgTfhW7FxfnVssBXJxFtCa74jsOgl452fnaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067894; c=relaxed/simple;
	bh=Ujy0XHkirJSJ3wGD92Jb4eJyERiKPRG4jijIky8EgcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j5RXn3HghBUB3itJs9t8s0Vzcl3eNUXP4iSgsEvjYpKUpuOGAriVp+EF2ubAkHimjqTiKuFEEVyzMP8qXfhTRrKl5O319BWU0vxruJk4Uhou1goe3RmTPFqSw5lJNDEcerQqcvfRI8zQxcu+uE7l5gJ9OeKDU+AoCvt6s5clbDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=es80Ke0s; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="es80Ke0s"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so5397951b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jul 2026 15:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784067891; x=1784672691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RlvMMMAfe3VlNvLEnfKxJEvAH3Aa6/N0yJs40GrdW0o=;
        b=es80Ke0sWBdergolzPuWuiypivqM23mifcDZVldiML5LklcU9CiDktccBNpaqEcmg0
         Q94NRhcfFwQzQYjpD4pZMylODwiTeFnjvf7U7MgOEivUZFsB2KwGY9rFe3RZWed2CwA3
         3+Lxg7arRZNE/kTw53+RF3bKO2KCsU2oLX0FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067891; x=1784672691;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlvMMMAfe3VlNvLEnfKxJEvAH3Aa6/N0yJs40GrdW0o=;
        b=HU35bfgHlsjUXg1qzhKxzT5+YzP0ypOQ8cnl14NVgcrl/QeGMoqBdDnr+A2xlGbbRf
         y1ZNZUWbpDpzF6hFUg3OqNXeIxmWrEx4Ijnal6I3fIh9SWEv7sXtsjR8sb+7s52FTYDm
         24/yVM1muANxJ0K1uxAjK6IaSIKjdp9v3A6osJPP2MdAmwcwzNzpP5MYsEHVo5iWJBBZ
         SvWQi711koIgWq94Bpa1EcXH+Fz+TcnFmz+3Rz7ufUz1Xe6GTsOgiZNPeoK3zZvPXNQK
         zGhL9rHBQKnGY7fGotGDihBBUuBTRWdTBXrYOPmk/w3PMRTkHZ3nwecsefEnUAaLU7SY
         OfXA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+MynjX9PJa9ZPGBAzid0zTU6CI1SEycr7GRGN1D+OpaCvBu5y/pp9LRWYvATRL1IuYXDZMm6QJEvbspI5HdXIcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGxy/R3ABlMmUGhpUs+fdJKu6NkjzRhoyLdnVosHv4SHjDAlyx
	3PJSc1KAHN1ejQdp/jgoF5z0cym0lmPXjUcKTg0UBOBiSmvHJj1gMJ1hecuxW+wxOG4g2wi55mm
	XdQY=
X-Gm-Gg: AfdE7clk5hQBkO5XiwtUhlLZeJ8E3U/g6IO97UPEutXzdKvxPgbTcGwuE1OyOXcdDuO
	ch3ZaII15hdFT/EVtGJC5qKCm17EGrahplHCgcpG4TETMPwKgeaJAGShcLtSfaMUmz3LHYzgy+C
	9tuLmk/g0SmgcT7P1Fok0eImZb/VrjvHXac5CcvwMZ/z0NpNBtXDpHbgLtRHwebPwjDjH9U6Grl
	m5xEXkET1W+66gZgyv/NDkLX2qi7GAWyELUku/NECamv93Xxsj9/6Vt70fWYiQD6ZoHtJvZf4nc
	QIrBggiYj02FhiAxeliLhNoog1u8LFzrHhVumudRHCk9kdoKbq4pKQRuZcomnTLhtrCAyl4H3eh
	NZ18IXWXFt/50y2knicyOer3gbNfp2C6U2IhXgfwzjJuMamRKemWGJXtjV9j7TE2rrp7nk7vCrK
	YyAuf/x4IMqfkd2UOdV6tBOhw55cNRpzmpK1JOFiKY7KFX7FxTshBjOVi846gcLXspwc27iQ==
X-Received: by 2002:a05:6a21:6b83:b0:3bf:6c05:a6 with SMTP id adf61e73a8af0-3c34d880814mr6208792637.53.1784067891162;
        Tue, 14 Jul 2026 15:24:51 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:32cb:eed4:7c:dc87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm76540741eec.9.2026.07.14.15.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:24:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
Date: Tue, 14 Jul 2026 15:21:46 -0700
Message-ID: <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260714222338.2965707-1-dianders@chromium.org>
References: <20260714222338.2965707-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a driver for the MailBox Array IP block present in Laguna SoCs
(AKA "lga", AKA "Google Tensor G5"). The mailbox hardware and theory
of operation is described in detail in the devicetree bindings.

This driver requires two improvements to the mailbox core in order to
function properly. Notably:
* mailbox: Add support for mailbox controllers that can queue
* mailbox: Find a matching mailbox by fwnode rather than device

The goog-mba hardware and conventions used to communicate to remote
processors is described in detail in the bindings file. See the
bindings patch ("dt-bindings: mailbox: goog-mba: Add goog-mba mailbox
bindings").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This driver is a rewrite from the downstream driver used in Pixel
phones and thus is only lightly tested. The downstream driver needed
to jump through some awkward hoops in order to work around the above
two patches not being present in the mailbox core.

 MAINTAINERS                              |   8 +
 drivers/mailbox/Kconfig                  |   8 +
 drivers/mailbox/Makefile                 |   2 +
 drivers/mailbox/goog-mba-priv.h          | 108 +++++
 drivers/mailbox/goog-mba-trace.h         | 183 ++++++++
 drivers/mailbox/goog-mba.c               | 567 +++++++++++++++++++++++
 include/linux/mailbox/goog-mba-message.h |  38 ++
 7 files changed, 914 insertions(+)
 create mode 100644 drivers/mailbox/goog-mba-priv.h
 create mode 100644 drivers/mailbox/goog-mba-trace.h
 create mode 100644 drivers/mailbox/goog-mba.c
 create mode 100644 include/linux/mailbox/goog-mba-message.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f37a81950e25..09da5b3a0e86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11070,6 +11070,14 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/firmware/google/
 F:	include/linux/coreboot.h
 
+GOOGLE MAILBOX ARRAY
+M:	Douglas Anderson <dianders@chromium.org>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mailbox/google,mba.yaml
+F:	drivers/mailbox/goog-mba*
+F:	include/linux/mailbox/goog-mba-message.h
+
 GOOGLE TENSOR SoC SUPPORT
 M:	Peter Griffin <peter.griffin@linaro.org>
 R:	André Draszik <andre.draszik@linaro.org>
diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 3062ee352f78..ddd08e473b57 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -399,4 +399,12 @@ config RISCV_SBI_MPXY_MBOX
 	  or HS-mode hypervisor). Say Y here, unless you are sure you do not
 	  need this.
 
+config GOOG_MBA_MBOX
+	tristate "Google Tensor MBA Mailbox"
+	help
+	  An implementation of the Google MailBox Array (MBA) driver present in
+	  Google Tensor SoCs starting with Laguna (G5). It is used for
+	  inter-processor communication between the application processor and
+	  co-processors.
+
 endif
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 944d8ea39f34..56b18641f50e 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -84,3 +84,5 @@ obj-$(CONFIG_CIX_MBOX)	+= cix-mailbox.o
 obj-$(CONFIG_BCM74110_MAILBOX)	+= bcm74110-mailbox.o
 
 obj-$(CONFIG_RISCV_SBI_MPXY_MBOX)	+= riscv-sbi-mpxy-mbox.o
+
+obj-$(CONFIG_GOOG_MBA_MBOX)	+= goog-mba.o
diff --git a/drivers/mailbox/goog-mba-priv.h b/drivers/mailbox/goog-mba-priv.h
new file mode 100644
index 000000000000..bfe03993a7d4
--- /dev/null
+++ b/drivers/mailbox/goog-mba-priv.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Google LLC
+ */
+
+#ifndef _GOOG_MBA_PRIV_H_
+#define _GOOG_MBA_PRIV_H_
+
+#include <linux/mailbox_controller.h>
+
+struct goog_mbox_info {
+	/** @mbox: Mailbox controller structure. */
+	struct mbox_controller mbox;
+
+	/** @np: Device tree node */
+	struct device_node *np;
+
+	/** @chan: Mailbox channel structure; only 1 channel per mailbox. */
+	struct mbox_chan chan;
+
+	/** @mba: Pointer to the mailbox array containing this mailbox. */
+	struct goog_mba_info *mba;
+
+	/** @iomem: IO memory associated with this mailbox. */
+	void __iomem *iomem;
+
+	/** @irq: Linux IRQ associated with this mailbox. */
+	int irq;
+
+	/** @msg_buffer_words: Number of 32-bit words present in hardware. */
+	unsigned int msg_buffer_words;
+
+	/**
+	 * @tx_payload_words: Number of 32-bit words in a tx mailbox message.
+	 *
+	 * In queue mode this is detected on the first TX transfer and subsequent
+	 * transfers must match.
+	 */
+	unsigned int tx_payload_words;
+
+	/** @rx_payload_words: Number of 32-bit words in a rx mailbox message. */
+	unsigned int rx_payload_words;
+
+	/**
+	 * @rx_buffer: Memory storage for payload when receiving
+	 *
+	 * When we get a message from the other side we copy it here before
+	 * acknowledging the message and passing it to the client. Buffer
+	 * is `payload_words * 4` bytes big.
+	 */
+	u32 *rx_buffer;
+
+	/**
+	 * @queue_mode: If true, the other side uses the "queue mode" protocol.
+	 *
+	 * In the "queue mode" protocol, we can send more than one message at
+	 * once and we treat the message buffer like a circular queue, with
+	 * each entry being `payload_words` big.
+	 */
+	bool queue_mode;
+
+
+	/* QUEUE MODE ONLY BELOW */
+
+	/**
+	 * @tx_idx: For queue mode, index into msg buffer to write the next msg.
+	 *
+	 * Always between 0 and msg_buffer_words - 1. Increments by payload_words
+	 * after each transmission and wraps to 0 if it's == msg_buffer_words.
+	 */
+	unsigned int tx_idx;
+
+	/**
+	 * @rx_idx: For queue mode, index into msg buffer to read the next msg.
+	 *
+	 * Always between 0 and msg_buffer_words - 1. Increments by rx_payload_words
+	 * after each reception and wraps to 0 if it's == msg_buffer_words.
+	 */
+	unsigned int rx_idx;
+
+	/**
+	 * @lock: For queue mode, protects outstanding_msgs
+	 *
+	 * We update `outstanding_msgs` in the interrupt handler and when
+	 * queuing up a message. This protects those two accesses.
+	 */
+	spinlock_t lock;
+
+	/**
+	 * @outstanding_msgs: For queue mode, num msgs we've written but not acked
+	 *
+	 * After we start each transmission we grab the `lock` and increment
+	 * this by 1. In the interrupt handler when we see that some messages
+	 * were transferred we decrease this and send out the proper number
+	 * of acks.
+	 */
+	unsigned int outstanding_msgs;
+};
+
+struct goog_mba_info {
+	/** @dev: Pointer to the `struct device` */
+	struct device *dev;
+
+	/** @global_iomem: Pointer to global IO memory, or NULL */
+	void __iomem *global_iomem;
+};
+
+#endif /* _GOOG_MBA_PRIV_H_ */
diff --git a/drivers/mailbox/goog-mba-trace.h b/drivers/mailbox/goog-mba-trace.h
new file mode 100644
index 000000000000..02be79757fcb
--- /dev/null
+++ b/drivers/mailbox/goog-mba-trace.h
@@ -0,0 +1,183 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM goog_mba
+
+#if !defined(_GOOG_MBA_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _GOOG_MBA_TRACE_H
+
+#include <linux/tracepoint.h>
+
+#include "goog-mba-priv.h"
+
+TRACE_EVENT(
+	goog_mba_process_nq_txdone,
+
+	TP_PROTO(const struct goog_mbox_info *goog_mbox),
+
+	TP_ARGS(goog_mbox),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(goog_mbox->mba->dev))
+		__string(name, goog_mbox->np->full_name)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(name);
+	),
+
+	TP_printk("%s %s", __get_str(dev_name), __get_str(name))
+);
+
+TRACE_EVENT(
+	goog_mba_process_q_txdone,
+
+	TP_PROTO(const struct goog_mbox_info *goog_mbox, u32 reqs_completed, u32 outstanding_msgs),
+
+	TP_ARGS(goog_mbox, reqs_completed, outstanding_msgs),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(goog_mbox->mba->dev))
+		__string(name, goog_mbox->np->full_name)
+		__field(u32, outstanding_msgs)
+		__field(u32, reqs_completed)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(name);
+		__entry->outstanding_msgs = outstanding_msgs;
+		__entry->reqs_completed = reqs_completed;
+	),
+
+	TP_printk("%s %s: reqs_completed=%u outstanding_msgs=%u",
+		  __get_str(dev_name), __get_str(name), __entry->reqs_completed,
+		  __entry->outstanding_msgs)
+);
+
+TRACE_EVENT(
+	goog_mba_send_data_nq,
+
+	TP_PROTO(const struct goog_mbox_info *goog_mbox, const u32 *payload,
+		 unsigned int payload_words),
+
+	TP_ARGS(goog_mbox, payload, payload_words),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(goog_mbox->mba->dev))
+		__string(name, goog_mbox->np->full_name)
+		__field(u32, payload_words)
+		__dynamic_array(u32, payload, payload_words)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(name);
+		__entry->payload_words = payload_words;
+		memcpy(__get_dynamic_array(payload), payload,
+		       payload_words * sizeof(u32));
+	),
+
+	TP_printk("%s %s: data=%s",
+		  __get_str(dev_name), __get_str(name),
+		  __print_array(__get_dynamic_array(payload),
+				__entry->payload_words, sizeof(u32)))
+);
+
+TRACE_EVENT(
+	goog_mba_send_data_q,
+
+	TP_PROTO(const struct goog_mbox_info *goog_mbox, const u32 *payload,
+		 unsigned int payload_words),
+
+	TP_ARGS(goog_mbox, payload, payload_words),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(goog_mbox->mba->dev))
+		__string(name, goog_mbox->np->full_name)
+		__field(u32, tx_idx)
+		__field(u32, payload_words)
+		__dynamic_array(u32, payload, payload_words)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(name);
+		__entry->tx_idx = goog_mbox->tx_idx;
+		__entry->payload_words = payload_words;
+		memcpy(__get_dynamic_array(payload), payload,
+		       payload_words * sizeof(u32));
+	),
+
+	TP_printk("%s %s: tx_idx=%u data=%s",
+		  __get_str(dev_name), __get_str(name), __entry->tx_idx,
+		  __print_array(__get_dynamic_array(payload),
+				__entry->payload_words, sizeof(u32)))
+);
+
+TRACE_EVENT(
+	goog_mba_process_nq_rx,
+
+	TP_PROTO(const struct goog_mbox_info *goog_mbox),
+
+	TP_ARGS(goog_mbox),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(goog_mbox->mba->dev))
+		__string(name, goog_mbox->np->full_name)
+		__field(u32, rx_payload_words)
+		__dynamic_array(u32, payload, goog_mbox->rx_payload_words)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(name);
+		__entry->rx_payload_words = goog_mbox->rx_payload_words;
+		memcpy(__get_dynamic_array(payload), goog_mbox->rx_buffer,
+		       goog_mbox->rx_payload_words * sizeof(u32));
+	),
+
+	TP_printk("%s %s: data=%s",
+		  __get_str(dev_name), __get_str(name),
+		  __print_array(__get_dynamic_array(payload),
+				__entry->rx_payload_words, sizeof(u32)))
+);
+
+TRACE_EVENT(
+	goog_mba_process_q_rx,
+
+	TP_PROTO(const struct goog_mbox_info *goog_mbox),
+
+	TP_ARGS(goog_mbox),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(goog_mbox->mba->dev))
+		__string(name, goog_mbox->np->full_name)
+		__field(u32, rx_idx)
+		__field(u32, rx_payload_words)
+		__dynamic_array(u32, payload, goog_mbox->rx_payload_words)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(name);
+		__entry->rx_idx = goog_mbox->rx_idx;
+		__entry->rx_payload_words = goog_mbox->rx_payload_words;
+		memcpy(__get_dynamic_array(payload), goog_mbox->rx_buffer,
+		       goog_mbox->rx_payload_words * sizeof(u32));
+	),
+
+	TP_printk("%s %s: rx_idx=%u data=%s",
+		  __get_str(dev_name), __get_str(name), __entry->rx_idx,
+		  __print_array(__get_dynamic_array(payload),
+				__entry->rx_payload_words, sizeof(u32)))
+);
+
+#endif /* _GOOG_MBA_TRACE_H */
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../drivers/mailbox
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE goog-mba-trace
+#include <trace/define_trace.h>
diff --git a/drivers/mailbox/goog-mba.c b/drivers/mailbox/goog-mba.c
new file mode 100644
index 000000000000..54b6ed787b71
--- /dev/null
+++ b/drivers/mailbox/goog-mba.c
@@ -0,0 +1,567 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Google MailBox Array (MBA) Driver
+ *
+ * Copyright (c) 2025 Google LLC
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/goog-mba-message.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include "goog-mba-priv.h"
+
+#define CREATE_TRACE_POINTS
+#include "goog-mba-trace.h"
+
+#define CLIENT_IRQ_TRIG_OFFSET		0x0
+#define SET_HOST_IRQ			0x1
+
+#define CLIENT_IRQ_CONFIG_OFFSET	0x4
+#define ENABLE_HOST_AUTO_ACK		BIT(8)
+#define CLIENT_IRQ_MASK_MSG_INT		BIT(16)
+#define CLIENT_IRQ_MASK_ACK_INT		BIT(24)
+
+#define CLIENT_IRQ_STATUS_OFFSET	0x8
+#define CLIENT_IRQ_STATUS_MSG_INT	0x1
+#define CLIENT_IRQ_STATUS_ACK_INT	0x100
+
+#define CLIENT_MBA_IP_VER		0x30
+#define CLIENT_NUM_MSG_REG		0x34
+#define CLIENT_OUTSTANDING_MSG		0x10
+
+#define GLOBAL_NUM_MSG_REG_OFFSET(x)	(0x10 + ((x) * 4))
+#define GLOBAL_MBA_IP_VER_OFFSET	4
+
+#define CLIENT_CLIENT_DOORBELL_TRIG	0x20
+#define CLIENT_DOORBELL_MASK_OFFSET	0x24
+#define CLIENT_DOORBELL_STATUS_OFFSET	0x28
+#define CLIENT_HOST_DOORBELL_OFFSET	0x38
+#define CLIENT_CLIENT_DOORBELL_OFFSET	0x3c
+
+#define MAX_MBA_CHANNELS		1
+#define NR_PHANDLE_ARG_COUNT		1
+
+#define MSG_OFFSET(i)			(0x100 + (i) * sizeof(u32))
+
+#define MBA_IP_MAJOR_VER_1		0x1
+#define MBA_IP_MAJOR_VER_3		0x3
+
+#define MBA_IP_MAJOR_VER_SHIFT		24
+#define MBA_IP_MAJOR_VER_MASK		0xff
+#define MBA_IP_MINOR_VER_SHIFT		16
+#define MBA_IP_MINOR_VER_MASK		0xff
+#define MBA_IP_INCREMENTAL_VER_SHIFT	0
+#define MBA_IP_INCREMENTAL_VER_MASK	0xffff
+
+/**
+ * goog_mba_handle_tx_interrupt() - Handle interrupt that remote Acked our msg.
+ * @goog_mbox: The mailbox info.
+ */
+static void goog_mba_handle_tx_interrupt(struct goog_mbox_info *goog_mbox)
+{
+	unsigned int reqs_completed;
+	int i;
+
+	/*
+	 * ACK interrupt needs to be cleared before reading CLIENT_OUTSTANDING_MSG.
+	 * Then if a "race" happens and another message gets Acked after we clear
+	 * but before we read CLIENT_OUTSTANDING_MSG then the worst that will
+	 * happen is we'll get a followup interrupt that will show 0 reqs_completed.
+	 */
+	writel(CLIENT_IRQ_STATUS_ACK_INT, goog_mbox->iomem + CLIENT_IRQ_STATUS_OFFSET);
+
+	if (goog_mbox->queue_mode) {
+		u32 outstanding_msgs;
+
+		outstanding_msgs = readl(goog_mbox->iomem + CLIENT_OUTSTANDING_MSG);
+		spin_lock(&goog_mbox->lock);
+
+		if (goog_mbox->outstanding_msgs >= outstanding_msgs) {
+			reqs_completed = goog_mbox->outstanding_msgs - outstanding_msgs;
+		} else {
+			/*
+			 * The hardware's track of outstanding messages should always
+			 * be less than or equal to the number of messages we queued.
+			 * If it thinks there are more messages outstanding than we
+			 * queued, something is wrong. Assume nothing was completed.
+			 */
+			dev_warn_ratelimited(goog_mbox->mba->dev,
+					     "%pOFP: unexpected outstanding msgs: %u -> %u\n",
+					     goog_mbox->np, goog_mbox->outstanding_msgs,
+					     outstanding_msgs);
+			reqs_completed = 0;
+		}
+		goog_mbox->outstanding_msgs = outstanding_msgs;
+		spin_unlock(&goog_mbox->lock);
+
+		trace_goog_mba_process_q_txdone(goog_mbox, reqs_completed, outstanding_msgs);
+	} else {
+		reqs_completed = 1;
+		trace_goog_mba_process_nq_txdone(goog_mbox);
+	}
+
+	for (i = 0; i < reqs_completed; i++)
+		mbox_chan_txdone(&goog_mbox->chan, 0);
+}
+
+/**
+ * goog_mba_handle_rx_interrupt() - Handle interrupt that remote send a msg.
+ * @goog_mbox: The mailbox info.
+ */
+static void goog_mba_handle_rx_interrupt(struct goog_mbox_info *goog_mbox)
+{
+	struct goog_mba_rx_msg msg = {
+		.payload = goog_mbox->rx_buffer,
+		.payload_words = goog_mbox->rx_payload_words,
+	};
+	int i;
+
+	for (i = 0; i < goog_mbox->rx_payload_words; i++)
+		goog_mbox->rx_buffer[i] = readl(goog_mbox->iomem +
+						MSG_OFFSET(goog_mbox->rx_idx + i));
+
+	if (goog_mbox->queue_mode) {
+		goog_mbox->rx_idx = (goog_mbox->rx_idx + goog_mbox->rx_payload_words) %
+				    goog_mbox->msg_buffer_words;
+		trace_goog_mba_process_q_rx(goog_mbox);
+	} else {
+		trace_goog_mba_process_nq_rx(goog_mbox);
+	}
+
+	/*
+	 * Ack the interrupt after we've read the message to local memory but
+	 * before passing it to the client. This frees up space for the remote
+	 * processor to send another message as the client is processing this one.
+	 */
+	writel(CLIENT_IRQ_STATUS_MSG_INT, goog_mbox->iomem + CLIENT_IRQ_STATUS_OFFSET);
+
+	mbox_chan_received_data(&goog_mbox->chan, &msg);
+}
+
+/**
+ * goog_mba_isr() - Main interrupt routine
+ * @irq: The IRQ number.
+ * @data: Data passed when registering (the goog_mbox_info for this IRQ).
+ *
+ * Return: IRQ_HANDLED if IRQ was handled; IRQ_NONE if no interrupt was found.
+ */
+static irqreturn_t goog_mba_isr(int irq, void *data)
+{
+	struct goog_mbox_info *goog_mbox = data;
+	u32 irq_status;
+
+	irq_status = readl(goog_mbox->iomem + CLIENT_IRQ_STATUS_OFFSET);
+	if (!irq_status)
+		return IRQ_NONE;
+
+	while (true) {
+		if (irq_status & CLIENT_IRQ_STATUS_ACK_INT)
+			goog_mba_handle_tx_interrupt(goog_mbox);
+
+		if (irq_status & CLIENT_IRQ_STATUS_MSG_INT) {
+			goog_mba_handle_rx_interrupt(goog_mbox);
+
+			/*
+			 * In queue mode the RX interrupt will re-assert itself
+			 * right after we clear it if there is more than one
+			 * message waiting. As an optimization to avoid returning
+			 * and immediately re-triggering our interrupt, re-check.
+			 *
+			 * NOTE: we don't need to loop for the TX (Ack) case
+			 * since TX interrupts aren't counted in the same way.
+			 */
+			if (goog_mbox->queue_mode)
+				irq_status = readl(goog_mbox->iomem + CLIENT_IRQ_STATUS_OFFSET);
+			else
+				break;
+		} else {
+			break;
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * goog_mba_send_data() - Mailbox op for send_data.
+ * @chan: The Linux mbox_chan structure associated with the mailbox.
+ * @msg: The mailbox message, expected to be of type `struct goog_mba_tx_msg`.
+ *	 If NULL, we'll assume a 0-byte doorbell-only message.
+ *
+ * Return: 0 if the data was sent; -EBUSY if the queue was full; other
+ *	   negative error values for other problems.
+ */
+static int goog_mba_send_data(struct mbox_chan *chan, void *msg)
+{
+	struct goog_mbox_info *goog_mbox = chan->con_priv;
+	struct device *dev = goog_mbox->mba->dev;
+	bool queue_mode = goog_mbox->queue_mode;
+	unsigned int payload_words = 0;
+	const u32 *payload = NULL;
+	bool is_init = false;
+	unsigned int tx_idx;
+	unsigned int i;
+	unsigned long flags;
+
+	if (msg) {
+		struct goog_mba_tx_msg *mba_msg = msg;
+
+		payload_words = mba_msg->payload_words;
+		payload = mba_msg->payload;
+		is_init = mba_msg->init;
+	}
+
+	if (payload_words > goog_mbox->msg_buffer_words) {
+		dev_err(dev, "%pOFP: Payload too big: %u > %u\n",
+			goog_mbox->np, payload_words, goog_mbox->msg_buffer_words);
+		return -EINVAL;
+	}
+
+	/*
+	 * Currently all queue-mode transfers need to be the same size and
+	 * need to evenly divide the message buffer. If this is the first
+	 * transfer, we need to validate/store the payload_words. For subsequent
+	 * transfers we just need to confirm it hasn't changed.
+	 */
+	if (queue_mode) {
+		if (!goog_mbox->tx_payload_words && payload_words) {
+			if (goog_mbox->msg_buffer_words % payload_words != 0) {
+				dev_err(dev, "%pOFP: Invalid initial TX queue payload words: %u\n",
+					goog_mbox->np, payload_words);
+				return -EINVAL;
+			}
+			goog_mbox->tx_payload_words = payload_words;
+		} else if (payload_words != goog_mbox->tx_payload_words) {
+			dev_err(dev, "%pOFP: Payload size mismatch: %u vs %u\n",
+				goog_mbox->np, payload_words, goog_mbox->tx_payload_words);
+			return -EINVAL;
+		}
+	}
+
+	/*
+	 * HW can handle full duplex but there is no current scheme for dividing
+	 * up the message buffer between TX and RX portions. Non-queue mode
+	 * could work half-duplex, but that doesn't make sense in queue mode.
+	 * If space is reserved for RX then disallow using it for TX.
+	 */
+	if (queue_mode && payload_words && goog_mbox->rx_payload_words) {
+		dev_err(dev, "%pOFP: Can't TX if buffer is used for RX\n", goog_mbox->np);
+		return -EINVAL;
+	}
+
+	if (queue_mode) {
+		bool out_of_space;
+
+		spin_lock_irqsave(&goog_mbox->lock, flags);
+		out_of_space = payload_words &&
+			       (goog_mbox->outstanding_msgs >=
+				goog_mbox->msg_buffer_words / payload_words);
+		spin_unlock_irqrestore(&goog_mbox->lock, flags);
+
+		/*
+		 * IMPORTANT: don't print an error for this. It's normal and
+		 * expected that the core will keep trying to queue messages
+		 * until the controller reports -EBUSY.
+		 */
+		if (out_of_space)
+			return -EBUSY;
+
+		tx_idx = goog_mbox->tx_idx;
+		trace_goog_mba_send_data_q(goog_mbox, payload, payload_words);
+	} else {
+		tx_idx = 0;
+		trace_goog_mba_send_data_nq(goog_mbox, payload, payload_words);
+	}
+
+	for (i = 0; i < payload_words; i++)
+		writel(payload[i], goog_mbox->iomem + MSG_OFFSET(tx_idx + i));
+
+	if (queue_mode) {
+		if (is_init)
+			goog_mbox->tx_idx = 0;
+		else
+			goog_mbox->tx_idx = (goog_mbox->tx_idx + payload_words) %
+					    goog_mbox->msg_buffer_words;
+	}
+
+	/*
+	 * We need to be careful on how we deal with `outstanding_msgs`.
+	 * The hardware will give us an interrupt every time it transfers
+	 * a message, but if it transfers two messages before our interrupt
+	 * handler fires then we'll still only get one interrupt. We have
+	 * to look at the difference between the hardware's idea of
+	 * `outstanding_msgs` and ours to figure out how many messages were
+	 * actually transferred.
+	 *
+	 * We need to start the transfer and increment our concept of
+	 * `outstanding_msgs` in lockstep so protect against the interrupt
+	 * handler also touching `outstanding_msgs`.
+	 */
+	if (queue_mode)
+		spin_lock_irqsave(&goog_mbox->lock, flags);
+
+	writel(SET_HOST_IRQ, goog_mbox->iomem + CLIENT_IRQ_TRIG_OFFSET);
+
+	if (queue_mode) {
+		goog_mbox->outstanding_msgs++;
+		spin_unlock_irqrestore(&goog_mbox->lock, flags);
+	}
+
+	return 0;
+}
+
+/**
+ * goog_mba_startup() - Mailbox op for startup.
+ * @chan: The Linux mbox_chan structure associated with the mailbox.
+ *
+ * Return: 0 for OK; negative error code if problems.
+ */
+static int goog_mba_startup(struct mbox_chan *chan)
+{
+	struct goog_mbox_info *goog_mbox = chan->con_priv;
+
+	writel(ENABLE_HOST_AUTO_ACK | CLIENT_IRQ_MASK_MSG_INT | CLIENT_IRQ_MASK_ACK_INT,
+	       goog_mbox->iomem + CLIENT_IRQ_CONFIG_OFFSET);
+	enable_irq(goog_mbox->irq);
+
+	return 0;
+}
+
+/**
+ * goog_mba_shutdown() - Mailbox op for shutdown.
+ * @chan: The Linux mbox_chan structure associated with the mailbox.
+ */
+static void goog_mba_shutdown(struct mbox_chan *chan)
+{
+	struct goog_mbox_info *goog_mbox = chan->con_priv;
+
+	disable_irq(goog_mbox->irq);
+	writel(0x0, goog_mbox->iomem + CLIENT_IRQ_CONFIG_OFFSET);
+}
+
+static const struct mbox_chan_ops goog_mba_chan_ops = {
+	.send_data = goog_mba_send_data,
+	.startup = goog_mba_startup,
+	.shutdown = goog_mba_shutdown,
+};
+
+/**
+ * goog_mba_get_msg_buf_words() - Return # msg buffer words in HW for this mailbox.
+ * @goog_mbox: The mailbox info.
+ * @np: The device tree node associated with this mailbox.
+ *
+ * Return: The number of 32-bit words in the hardware message buffer.
+ */
+static unsigned int goog_mba_get_msg_buf_words(struct goog_mbox_info *goog_mbox,
+					       struct device_node *np)
+{
+	struct goog_mba_info *mba = goog_mbox->mba;
+	struct resource res;
+	unsigned int index;
+
+	/*
+	 * On newer IP there's no global space and the register moved to the
+	 * client address space.
+	 */
+	if (!mba->global_iomem)
+		return readl(goog_mbox->iomem + CLIENT_NUM_MSG_REG);
+
+	/*
+	 * On older IP we need to find the index so we can look up the value
+	 * in the global memory. Our index is based on the physical address
+	 * of the mbox since on older hardware mailboxes are 4K apart.
+	 */
+	if (of_address_to_resource(np, 0, &res)) {
+		dev_err(mba->dev, "%pOFP: Failed to find physical address\n", np);
+		return 0;
+	}
+	index = (res.start & 0x1ffff) / 0x1000;
+
+	return readl(mba->global_iomem + GLOBAL_NUM_MSG_REG_OFFSET(index));
+}
+
+/**
+ * of_node_put_void() - of_node_put() for passing to devm_add_action_or_reset().
+ * @data: Our struct device_node pointer.
+ */
+static void of_node_put_void(void *data)
+{
+	of_node_put(data);
+}
+
+/**
+ * goog_mba_mbox_init() - Initialize one single mailbox.
+ * @goog_mbox: The mailbox info.
+ * @mba: The array containing this mailbox.
+ * @np: The device tree node associated with this mailbox.
+ *
+ * Return: 0 or a negative error code. If an error is returned, the error has
+ *	   already been logged.
+ */
+static int goog_mba_mbox_init(struct goog_mbox_info *goog_mbox,
+			      struct goog_mba_info *mba, struct device_node *np)
+{
+	struct mbox_controller *mbox = &goog_mbox->mbox;
+	struct mbox_chan *chan = &goog_mbox->chan;
+	struct device *dev = mba->dev;
+	unsigned int msg_buffer_words;
+	u32 rx_payload_words;
+	int ret;
+
+	goog_mbox->mba = mba;
+
+	of_node_get(np);
+	ret = devm_add_action_or_reset(dev, of_node_put_void, np);
+	if (ret)
+		return ret;
+	goog_mbox->np = np;
+
+	goog_mbox->iomem = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(goog_mbox->iomem))
+		return dev_err_probe(dev, PTR_ERR(goog_mbox->iomem),
+				     "%pOFP: Failed to map memory\n", np);
+
+	/* Start with all interrupts disabled and cleared */
+	writel(0x0, goog_mbox->iomem + CLIENT_IRQ_CONFIG_OFFSET);
+	writel(CLIENT_IRQ_STATUS_MSG_INT | CLIENT_IRQ_STATUS_ACK_INT,
+	       goog_mbox->iomem + CLIENT_IRQ_STATUS_OFFSET);
+
+	goog_mbox->irq = of_irq_get(np, 0);
+	if (goog_mbox->irq <= 0) {
+		if (goog_mbox->irq == 0)
+			goog_mbox->irq = -EINVAL;
+		return dev_err_probe(dev, goog_mbox->irq, "%pOFP: Failed to get IRQ\n", np);
+	}
+	ret = devm_request_irq(dev, goog_mbox->irq, goog_mba_isr,
+			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
+			       NULL, goog_mbox);
+	if (ret)
+		return dev_err_probe(dev, ret, "%pOFP: Failed to request interrupt\n", np);
+
+	goog_mbox->queue_mode = of_property_read_bool(np, "google,mba-queue-mode");
+
+	rx_payload_words = 0;
+	ret = of_property_read_u32(np, "google,rx-payload-words", &rx_payload_words);
+	goog_mbox->rx_payload_words = rx_payload_words;
+
+	msg_buffer_words = goog_mba_get_msg_buf_words(goog_mbox, np);
+	goog_mbox->msg_buffer_words = msg_buffer_words;
+
+	if (goog_mbox->queue_mode && !msg_buffer_words)
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOFP: Queue mode requires non-zero buffer\n", np);
+
+	if (msg_buffer_words < rx_payload_words)
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOFP: Buffer (%u) < RX Payload (%u)\n",
+				     np, msg_buffer_words, rx_payload_words);
+	if (goog_mbox->queue_mode && rx_payload_words && msg_buffer_words % rx_payload_words != 0)
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOFP: Queue buffer (%u) must be multiple of RX payload (%u)\n",
+				     np, msg_buffer_words, rx_payload_words);
+
+	if (rx_payload_words) {
+		goog_mbox->rx_buffer = devm_kcalloc(dev, rx_payload_words,
+						    sizeof(*goog_mbox->rx_buffer), GFP_KERNEL);
+		if (!goog_mbox->rx_buffer)
+			return -ENOMEM;
+	}
+
+	mbox->fwnode = of_fwnode_handle(np);
+	mbox->dev = dev;
+	mbox->ops = &goog_mba_chan_ops;
+	mbox->chans = chan;
+	mbox->num_chans = 1;
+	mbox->txdone_irq = true;
+	mbox->has_queue = goog_mbox->queue_mode;
+	spin_lock_init(&goog_mbox->lock);
+
+	chan->con_priv = goog_mbox;
+
+	ret = devm_mbox_controller_register(dev, mbox);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "%pOFP: Failed to register mailbox controller\n", np);
+
+	return 0;
+}
+
+/**
+ * goog_mba_probe() - MBA probe routine.
+ * @pdev: Our platform device.
+ *
+ * Return: 0 or a negative error code.
+ */
+static int goog_mba_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct goog_mbox_info *goog_mboxes;
+	struct goog_mba_info *mba;
+	unsigned int num_mboxes;
+	unsigned int i;
+	int ret;
+
+	mba = devm_kzalloc(dev, sizeof(*mba), GFP_KERNEL);
+	if (!mba)
+		return -ENOMEM;
+	mba->dev = dev;
+
+	num_mboxes = of_get_available_child_count(dev->of_node);
+	goog_mboxes = devm_kzalloc(dev, sizeof(*goog_mboxes) * num_mboxes, GFP_KERNEL);
+	if (!goog_mboxes)
+		return -ENOMEM;
+
+	/*
+	 * The first memory range is the memory range that the other side
+	 * of the mailbox uses. The second memory range is the shared/global
+	 * range. Note that newer versions of the IP don't have the global
+	 * range, so mba->global_iomem is left NULL on newer IP.
+	 */
+	if (platform_get_resource(pdev, IORESOURCE_MEM, 1)) {
+		mba->global_iomem = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(mba->global_iomem))
+			return dev_err_probe(dev, PTR_ERR(mba->global_iomem),
+					     "Failed to iomap global region\n");
+	}
+
+	i = 0;
+	for_each_available_child_of_node_scoped(dev->of_node, child_np) {
+		ret = goog_mba_mbox_init(&goog_mboxes[i], mba, child_np);
+		if (ret)
+			return ret;
+		i++;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id goog_mba_match[] = {
+	{ .compatible = "google,mailbox-array" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, goog_mba_match);
+
+static struct platform_driver mba = {
+	.driver = {
+		.name = "goog-mba",
+		.of_match_table = goog_mba_match,
+	},
+	.probe = goog_mba_probe,
+};
+
+module_platform_driver(mba);
+
+MODULE_DESCRIPTION("Google MailBox Array (MBA) Driver");
+MODULE_AUTHOR("Douglas Anderson <dianders@chromium.org>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mailbox/goog-mba-message.h b/include/linux/mailbox/goog-mba-message.h
new file mode 100644
index 000000000000..5c3d47e3ded3
--- /dev/null
+++ b/include/linux/mailbox/goog-mba-message.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Google MailBox Array (MBA) Mailbox Message
+ *
+ * Copyright (c) 2025 Google LLC
+ */
+
+#ifndef _LINUX_MAILBOX_GOOG_MBA_MESSAGE_H_
+#define _LINUX_MAILBOX_GOOG_MBA_MESSAGE_H_
+
+#include <linux/types.h>
+
+struct goog_mba_tx_msg {
+	/** @payload: The contents of the message to send. */
+	const u32 *payload;
+
+	/** @payload_words: The number of 32-bit words in the payload. */
+	u8 payload_words;
+
+	/**
+	 * @init: Initialize queue settings after sending.
+	 *
+	 * Tell the mailbox driver that this is a special "initialize"
+	 * message for a queue-based mailbox. This allows the mailbox driver
+	 * to keep its state synced with the remote side of the mailbox.
+	 */
+	bool init;
+};
+
+struct goog_mba_rx_msg {
+	/** @payload: The contents of the message received. */
+	const u32 *payload;
+
+	/** @payload_words: The number of 32-bit words in the payload. */
+	u8 payload_words;
+};
+
+#endif /* _LINUX_MAILBOX_GOOG_MBA_MESSAGE_H_ */
-- 
2.55.0.141.g00534a21ce-goog

