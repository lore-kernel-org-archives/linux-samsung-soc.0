Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792799690;
	b=5JiJlk9ORWLRit6yGcW6glLlk3izuQf2dOeM7oL31cVyna6H468Az0HJsjtmjaRrse/4
	 L/DokhJilKXhUq6ptJVgX7h+mrQ4J2rM3qX0dXA6wXkw+C9pwDgwsMqg20LXBKW25n51o
	 dHKRQ2nGz+mov6Kx2YXR56ZJZc5MQt2iDXrP0AXHSsdKEH7M0ImJYTf6/Zi+yUfloenXZ
	 PS7YXCfJAwjJ1CYX26PkUFA/J0goAvQUXMjnQJkoXRZk24wbg/LQCnrzsEKNfdPxH1vMQ
	 MFPcOphPGM7MTp2bwp//yb+wjnXsDMNA9YBp0250hchAojT+6X8g73iWgg0SYO1cIBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=otAHiqG/cQjuYELHcy0jOidxAXbxufQWbVV3FM523C0=;
	b=1Zr4CQvEVX/54SA75a9Gypvg6nu6UNtoIhF22fW/38imH+02ai+kMZZBr+umgwlnG0nQ
	 CESGxll1BPFaCITXCrnoph/df0AWTJ8qUr5W3l0nzwb73fU6gONXan/vKcZ15X5cIwDdx
	 Uhyy5I99SaS+AoJxRoOmppIx7M6s0NQf7H9D7ikNqeFTju0OyPHQX9OINOXay3EP76jKn
	 /mLHZk467Dw+6RXUhpDw+n+BUwp5nPOV1VGsU/QuP/8rZ9Qa4p+TMafLJqHWHrSimkmHc
	 gnZxKe0XIk+N8DkQFThDeA/inpaQMtXnmnO5isd8etI7iLM8u0sHZkeafq+ugbCm4Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QsIbCZ7A;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A8A606A324
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2026 23:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A8A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QsIbCZ7A
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2576341eec.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2026 16:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792799687; x=1793404487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=otAHiqG/cQjuYELHcy0jOidxAXbxufQWbVV3FM523C0=;
        b=QsIbCZ7Ag2ElkJTiKUcpchmJePQLf6/SKYZ+2pwwvzuAooUsbcWCgJEFXvuyQ49UqF
         pB2Lhfb84o3/4u2Y5SGDqqI3C7qd2w7gfzPH8i0Fce3zxjHsE7Crz746cMrcQL8w2UGl
         p4HAZp+p3sTwtyUUbUkdT8p/YCdiey3a7AT80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799687; x=1793404487;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otAHiqG/cQjuYELHcy0jOidxAXbxufQWbVV3FM523C0=;
        b=0Fvsv66c2PNymAT588m0ceB0nrmVpPfl+o94jpjbcJuVNlYliQLQ3WNRl6O7ClbMXz
         UY3sIE7EOn3ZY/yqHyOUyUPhLBYZ+mmMXtOk5BZpQVzU3qXD+LjBtoCbd1m60dTyk3Ay
         AWYNVqzuuD5BP9yVONpTO1bRqf90F47srtMUHHcPtnCnSVvS1AMjGc36elmfpOPfJGIT
         6P9dcDW2ZH+2I7ltsDrt4IapAjaLLVW817Y3NgsvRwAccoBnkIqbLVlX/OgmO8ysqey3
         rVTXYYBsFuzo+17GJdtBVCcOxNBVsgvEOR+ws54YsuuHgD3rcDYjloLZmsQCltZgl7se
         BJYg==
X-Forwarded-Encrypted: i=1; AKwUvBwl4QVpFucmR5rONdEDzWrJf7lE7G5qeA1HrCDNYT3gFQPXQqCD0vrGsLuRCIYlKX57zUPUcg0SOCWtlKnO9rC8+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJtcuiJO0XLnwHaYWhpovD9Jk4GEO+F8rcOrWg+cAZdcGoBYIlP
	sSR+YL3pO2x0qVNInUPkrI4+ZBSufcxLlTFw5fIPq/kBXnfqPlJx7Hv8bdRvbzJNaA==
X-Gm-Gg: AYBFou0j7DW2yB+ERkgkL6jpQstJnSeHMQJsHeCYGWoeQQnAsxDuOJBVlQZVeJVuPox
	bAHpAjhVJ4hvFdOAFGe2lyBEkAjW3bve8rIOoxjsJYtbg84uHFkd8KoBPCpqryR6pvYEn4JF44B
	nUx4YP5jfwR4QFJMYK5wEj3C+LJ25xFc7O2aBaNIex5SyyF6RkSxeRydf6fNe8MrbmkWTvjr5Vd
	JpjuHMTfEIuAPZT/rv1q1MMuERC4KnlGR3Nz0Zgu8RVI90BYSzYINGHw7uaxWsXdn2o+/FB0DPp
	MgxvQPbUOuepuh6TvV3yCn74FBSLO0Fs4G1pyeAbGzpyjKYkFRDJZlZMCL50vbvz4rKDJvB1CPH
	P4pcLandgYJK2LrSJL6UOx+0kJvKKA3GoTBN3uC/ifxGgc9h0Jus9EM+MZOnOrdShpsLmWi9Cme
	Q2I5NB+7ehgtumGYnplqV2g3HKI8aJ9wHuH4tuG1ejIIOAmeNCmlgvwgDAe9yeQ/42hwuoh7n0E
	2kx4dcp2Coi6+f0Zr2wX019lhVQwvZIPxHRfPnTLXHnMaOGLss7rmScsTBmv9Kb2Q8oF4TN2og8
	0IV4sHG5gaffonUgTukT54UgQbK/G0hPk4eSeUXF
X-Received: by 2002:a05:693c:60d1:b0:366:ae22:a565 with SMTP id 5a478bee46e88-369e8483657mr1064497eec.9.1792799687187;
        Fri, 23 Oct 2026 16:54:47 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:f8c2:b3aa:f878:2faa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm1460608eec.18.2026.10.23.16.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:54:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 4/4] mailbox: goog-mba: Introduce the goog-mba mailbox driver
Date: Fri, 23 Oct 2026 16:52:21 -0700
Message-ID: <20261023165211.v2.4.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261023235408.3063350-1-dianders@chromium.org>
References: <20261023235408.3063350-1-dianders@chromium.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a driver for the MailBox Array IP block present in Laguna SoCs
(AKA "lga", AKA "Google Tensor G5"). The mailbox hardware and theory
of operation is described in detail in the devicetree bindings.

This driver uses two improvements to the mailbox core in order to
function cleanly. Notably:
* mailbox: Allow #mbox-cells = <0> without specifying a custom xlate
* mailbox: Find a matching mailbox by fwnode rather than device

The goog-mba hardware and conventions used to communicate to remote
processors is described in detail in the bindings file. See the
bindings patch ("dt-bindings: mailbox: goog-mba: Add goog-mba mailbox
bindings").

The most unique thing about this mailbox controller is that some
instances of it are designed with a hardware queue, so multiple
mailbox messages can be in flight at once. For RX, this works
seamlessly. For TX, in order to fit into the Linux mailbox framework
we expose a single mailbox as several channels (one per queue slot) so
the mailbox client can effectively use the queue. A custom `fw_xlate`
callback returns the next unclaimed channel when `#mbox-cells = <0>`.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This driver is a rewrite from the downstream driver used in Pixel
phones, which jumped through some awkward hoops because of the way it
got queuing to work.

Changes in v2:
- Expose a mailbox channel per TX queue slot instead of adding
  `has_queue` to the mailbox core.
- For queue mode, read `google,tx-payload-words` from DT instead of
  detecting TX payload size on the first transfer.
- Match "google,lga-mailbox-array" instead of "google,mailbox-array".
- Move MAINTAINERS entries under GOOGLE TENSOR SoC SUPPORT.
- Use guard(spinlock_irqsave) and scoped_guard(spinlock).

 MAINTAINERS                              |   3 +
 drivers/mailbox/Kconfig                  |   8 +
 drivers/mailbox/Makefile                 |   2 +
 drivers/mailbox/goog-mba-priv.h          | 130 +++++
 drivers/mailbox/goog-mba-trace.h         | 183 +++++++
 drivers/mailbox/goog-mba.c               | 621 +++++++++++++++++++++++
 include/linux/mailbox/goog-mba-message.h |  38 ++
 7 files changed, 985 insertions(+)
 create mode 100644 drivers/mailbox/goog-mba-priv.h
 create mode 100644 drivers/mailbox/goog-mba-trace.h
 create mode 100644 drivers/mailbox/goog-mba.c
 create mode 100644 include/linux/mailbox/goog-mba-message.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9388da2a2737..6c0eaff9ca4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11219,17 +11219,20 @@ S:	Maintained
 P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	arch/arm64/boot/dts/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/mailbox/goog-mba*
 F:	drivers/phy/phy-google-usb.c
 F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	drivers/usb/dwc3/dwc3-google.c
 F:	include/dt-bindings/clock/google,gs101*
+F:	include/linux/mailbox/goog-mba-message.h
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ab869769e278..c0ea73446a73 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -409,4 +409,12 @@ config AXIADO_MAILBOX
 	  Axiado SoCs.
 	  If unsure, say N.
 
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
index 45dc59bb3e7f..8c3baac92424 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -86,3 +86,5 @@ obj-$(CONFIG_BCM74110_MAILBOX)	+= bcm74110-mailbox.o
 obj-$(CONFIG_RISCV_SBI_MPXY_MBOX)	+= riscv-sbi-mpxy-mbox.o
 
 obj-$(CONFIG_AXIADO_MAILBOX)	+= axiado-mailbox.o
+
+obj-$(CONFIG_GOOG_MBA_MBOX)	+= goog-mba.o
diff --git a/drivers/mailbox/goog-mba-priv.h b/drivers/mailbox/goog-mba-priv.h
new file mode 100644
index 000000000000..79ddf32ef5ba
--- /dev/null
+++ b/drivers/mailbox/goog-mba-priv.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Google LLC
+ */
+
+#ifndef _GOOG_MBA_PRIV_H_
+#define _GOOG_MBA_PRIV_H_
+
+#include <linux/mailbox_controller.h>
+#include <linux/mutex.h>
+
+struct goog_mbox_info {
+	/** @mbox: Mailbox controller structure. */
+	struct mbox_controller mbox;
+
+	/** @np: Device tree node */
+	struct device_node *np;
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
+	/** @startup_lock: Protects active_chans during startup/shutdown. */
+	struct mutex startup_lock;
+
+	/** @active_chans: Number of channels currently started up. */
+	unsigned int active_chans;
+
+	/** @msg_buffer_words: Number of 32-bit words present in hardware. */
+	unsigned int msg_buffer_words;
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
+	/** @tx_payload_words: For queue mode, number of 32-bit words in a tx mailbox message. */
+	unsigned int tx_payload_words;
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
+	 * @lock: For queue mode, protects TX queue state and hardware writes.
+	 */
+	spinlock_t lock;
+
+	/**
+	 * @tx_fifo: Dynamically allocated circular FIFO of channels with
+	 *	     outstanding TX messages (sized to @mbox.num_chans).
+	 */
+	struct mbox_chan **tx_fifo;
+
+	/**
+	 * @tx_fifo_wr_idx: Write index into @tx_fifo for the next TX message.
+	 */
+	unsigned int tx_fifo_wr_idx;
+
+	/**
+	 * @tx_fifo_rd_idx: Read index into @tx_fifo for the next TX completion.
+	 */
+	unsigned int tx_fifo_rd_idx;
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
+
+	/**
+	 * @num_chans: Number of channels in @chans (1 for non-queue/RX queue
+	 *	       mode, or msg_buffer_words / tx_payload_words for TX
+	 *	       queue mode).
+	 */
+	unsigned int num_chans;
+
+	/** @chans: Mailbox channels for this mailbox. */
+	struct mbox_chan chans[] __counted_by(num_chans);
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
index 000000000000..b7ed27912503
--- /dev/null
+++ b/drivers/mailbox/goog-mba.c
@@ -0,0 +1,621 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Google MailBox Array (MBA) Driver
+ *
+ * Copyright (c) 2025 Google LLC
+ */
+
+#include <linux/cleanup.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/goog-mba-message.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
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
+	unsigned int num_chans = goog_mbox->num_chans;
+	unsigned int reqs_completed;
+	u32 outstanding_msgs;
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
+	if (!goog_mbox->queue_mode) {
+		trace_goog_mba_process_nq_txdone(goog_mbox);
+		mbox_chan_txdone(&goog_mbox->chans[0], 0);
+		return;
+	}
+
+	scoped_guard(spinlock, &goog_mbox->lock) {
+		outstanding_msgs = readl(goog_mbox->iomem + CLIENT_OUTSTANDING_MSG);
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
+	}
+
+	trace_goog_mba_process_q_txdone(goog_mbox, reqs_completed, outstanding_msgs);
+
+	for (i = 0; i < reqs_completed; i++) {
+		struct mbox_chan *chan;
+
+		scoped_guard(spinlock, &goog_mbox->lock) {
+			chan = goog_mbox->tx_fifo[goog_mbox->tx_fifo_rd_idx];
+			goog_mbox->tx_fifo_rd_idx =
+				(goog_mbox->tx_fifo_rd_idx + 1) % num_chans;
+		}
+
+		mbox_chan_txdone(chan, 0);
+	}
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
+	mbox_chan_received_data(&goog_mbox->chans[0], &msg);
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
+	if (queue_mode && !goog_mbox->tx_payload_words) {
+		dev_err(dev, "%pOFP: Can't TX on RX-only queued mailbox\n", goog_mbox->np);
+		return -EINVAL;
+	}
+
+	/*
+	 * In non-queue mode, allow the caller to send any amount of data.
+	 * In queue mode the amount needs to be pre-specified so we know
+	 * how many slots are available in our message buffer.
+	 */
+	if (queue_mode && payload_words != goog_mbox->tx_payload_words) {
+		dev_err(dev, "%pOFP: Payload size mismatch: %u vs %u\n",
+			goog_mbox->np, payload_words, goog_mbox->tx_payload_words);
+		return -EINVAL;
+	}
+
+	/*
+	 * Serialize across all channels of this mailbox so two concurrent
+	 * sends on different channels cannot interleave their payload writes
+	 * and ring SET_HOST_IRQ before an earlier slot has finished being
+	 * written.
+	 */
+	guard(spinlock_irqsave)(&goog_mbox->lock);
+
+	if (queue_mode) {
+		if (goog_mbox->outstanding_msgs >= goog_mbox->num_chans)
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
+	/*
+	 * We need to be careful on how we deal with `outstanding_msgs`.
+	 * The hardware will give us an interrupt every time it transfers
+	 * a message, but if it transfers two messages before our interrupt
+	 * handler fires then we'll still only get one interrupt. We have
+	 * to look at the difference between the hardware's idea of
+	 * `outstanding_msgs` and ours to figure out how many messages were
+	 * actually transferred.
+	 *
+	 * We also keep a local FIFO (`tx_fifo`) mapping each outstanding
+	 * message slot to the `struct mbox_chan` it was submitted on so the
+	 * interrupt handler can complete the corresponding channels in order.
+	 */
+	if (queue_mode) {
+		if (is_init)
+			goog_mbox->tx_idx = 0;
+		else
+			goog_mbox->tx_idx = (goog_mbox->tx_idx + payload_words) %
+					    goog_mbox->msg_buffer_words;
+
+		goog_mbox->tx_fifo[goog_mbox->tx_fifo_wr_idx] = chan;
+		goog_mbox->tx_fifo_wr_idx = (goog_mbox->tx_fifo_wr_idx + 1) %
+					    goog_mbox->num_chans;
+		goog_mbox->outstanding_msgs++;
+	}
+
+	writel(SET_HOST_IRQ, goog_mbox->iomem + CLIENT_IRQ_TRIG_OFFSET);
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
+	guard(mutex)(&goog_mbox->startup_lock);
+	if (goog_mbox->active_chans++ == 0) {
+		writel(ENABLE_HOST_AUTO_ACK | CLIENT_IRQ_MASK_MSG_INT | CLIENT_IRQ_MASK_ACK_INT,
+		       goog_mbox->iomem + CLIENT_IRQ_CONFIG_OFFSET);
+		enable_irq(goog_mbox->irq);
+	}
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
+	guard(mutex)(&goog_mbox->startup_lock);
+	if (--goog_mbox->active_chans == 0) {
+		disable_irq(goog_mbox->irq);
+		writel(0x0, goog_mbox->iomem + CLIENT_IRQ_CONFIG_OFFSET);
+	}
+}
+
+static const struct mbox_chan_ops goog_mba_chan_ops = {
+	.send_data = goog_mba_send_data,
+	.startup = goog_mba_startup,
+	.shutdown = goog_mba_shutdown,
+};
+
+/**
+ * goog_mba_fw_xlate() - Translate fwnode reference args to an unbound channel.
+ * @mbox: The mailbox controller.
+ * @sp: The fwnode reference arguments.
+ *
+ * Return: The next free mbox_chan, or an ERR_PTR() on failure.
+ */
+static struct mbox_chan *goog_mba_fw_xlate(struct mbox_controller *mbox,
+					   const struct fwnode_reference_args *sp)
+{
+	int i;
+
+	if (sp->nargs)
+		return ERR_PTR(-EINVAL);
+
+	/*
+	 * In TX queue mode, each hardware queue slot is exposed as a virtual
+	 * channel while the DT binding uses #mbox-cells = <0>. Return the next
+	 * unclaimed channel so clients can request all queue slots.
+	 */
+	for (i = 0; i < mbox->num_chans; i++) {
+		if (!mbox->chans[i].cl)
+			return &mbox->chans[i];
+	}
+
+	return ERR_PTR(-EBUSY);
+}
+
+/**
+ * goog_mba_get_msg_buf_words() - Return # msg buffer words in HW for this mailbox.
+ * @mba: The mailbox array info.
+ * @iomem: The IO memory for this mailbox.
+ * @np: The device tree node associated with this mailbox.
+ *
+ * Return: The number of 32-bit words in the hardware message buffer.
+ */
+static unsigned int goog_mba_get_msg_buf_words(struct goog_mba_info *mba,
+					       void __iomem *iomem,
+					       struct device_node *np)
+{
+	struct resource res;
+	unsigned int index;
+
+	/*
+	 * On newer IP there's no global space and the register moved to the
+	 * client address space.
+	 */
+	if (!mba->global_iomem)
+		return readl(iomem + CLIENT_NUM_MSG_REG);
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
+ * @mba: The array containing this mailbox.
+ * @np: The device tree node associated with this mailbox.
+ *
+ * Return: 0 or a negative error code. If an error is returned, the error has
+ *	   already been logged.
+ */
+static int goog_mba_mbox_init(struct goog_mba_info *mba, struct device_node *np)
+{
+	struct device *dev = mba->dev;
+	struct goog_mbox_info *goog_mbox;
+	struct mbox_controller *mbox;
+	unsigned int msg_buffer_words;
+	unsigned int num_chans = 1;
+	u32 tx_payload_words = 0;
+	u32 rx_payload_words = 0;
+	void __iomem *iomem;
+	bool queue_mode;
+	int i, ret;
+
+	iomem = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(iomem))
+		return dev_err_probe(dev, PTR_ERR(iomem),
+				     "%pOFP: Failed to map memory\n", np);
+
+	queue_mode = of_property_read_bool(np, "google,mba-queue-mode");
+	of_property_read_u32(np, "google,rx-payload-words", &rx_payload_words);
+	of_property_read_u32(np, "google,tx-payload-words", &tx_payload_words);
+
+	msg_buffer_words = goog_mba_get_msg_buf_words(mba, iomem, np);
+
+	if (queue_mode && !msg_buffer_words)
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOFP: Queue mode requires non-zero buffer\n", np);
+
+	if (tx_payload_words && !queue_mode)
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOFP: Don't specify TX payload (%u) unless queue-mode\n",
+				     np, tx_payload_words);
+
+	/*
+	 * HW can handle full duplex but there is no current scheme for dividing
+	 * up the message buffer between TX and RX portions. Non-queue mode
+	 * could work half-duplex, but that doesn't make sense in queue mode.
+	 * Thus queue mode requires either RX or TX payload words, not both.
+	 */
+	if (queue_mode && ((!rx_payload_words && !tx_payload_words) ||
+			   (rx_payload_words && tx_payload_words)))
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOFP: Queue mode requires either RX or TX payload words\n",
+				     np);
+
+	if (msg_buffer_words < rx_payload_words)
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOFP: Buffer (%u) < RX Payload (%u)\n",
+				     np, msg_buffer_words, rx_payload_words);
+	if (queue_mode && rx_payload_words && msg_buffer_words % rx_payload_words != 0)
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOFP: Queue buffer (%u) must be multiple of RX payload (%u)\n",
+				     np, msg_buffer_words, rx_payload_words);
+
+	if (tx_payload_words && msg_buffer_words % tx_payload_words != 0)
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOFP: Queue buffer (%u) must be multiple of TX payload (%u)\n",
+				     np, msg_buffer_words, tx_payload_words);
+
+	if (tx_payload_words)
+		num_chans = msg_buffer_words / tx_payload_words;
+
+	goog_mbox = devm_kzalloc(dev, struct_size(goog_mbox, chans, num_chans), GFP_KERNEL);
+	if (!goog_mbox)
+		return -ENOMEM;
+
+	goog_mbox->num_chans = num_chans;
+	goog_mbox->mba = mba;
+	goog_mbox->iomem = iomem;
+	goog_mbox->queue_mode = queue_mode;
+	goog_mbox->rx_payload_words = rx_payload_words;
+	goog_mbox->tx_payload_words = tx_payload_words;
+	goog_mbox->msg_buffer_words = msg_buffer_words;
+
+	of_node_get(np);
+	ret = devm_add_action_or_reset(dev, of_node_put_void, np);
+	if (ret)
+		return ret;
+	goog_mbox->np = np;
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
+	if (rx_payload_words) {
+		goog_mbox->rx_buffer = devm_kcalloc(dev, rx_payload_words,
+						    sizeof(*goog_mbox->rx_buffer), GFP_KERNEL);
+		if (!goog_mbox->rx_buffer)
+			return -ENOMEM;
+	}
+
+	mbox = &goog_mbox->mbox;
+	if (queue_mode && tx_payload_words) {
+		goog_mbox->tx_fifo = devm_kcalloc(dev, num_chans, sizeof(*goog_mbox->tx_fifo),
+						  GFP_KERNEL);
+		if (!goog_mbox->tx_fifo)
+			return -ENOMEM;
+
+		mbox->fw_xlate = goog_mba_fw_xlate;
+	}
+
+	mbox->fwnode = of_fwnode_handle(np);
+	mbox->dev = dev;
+	mbox->ops = &goog_mba_chan_ops;
+	mbox->chans = goog_mbox->chans;
+	mbox->num_chans = num_chans;
+	mbox->txdone_irq = true;
+	spin_lock_init(&goog_mbox->lock);
+	mutex_init(&goog_mbox->startup_lock);
+
+	for (i = 0; i < num_chans; i++)
+		goog_mbox->chans[i].con_priv = goog_mbox;
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
+	struct goog_mba_info *mba;
+	int ret;
+
+	mba = devm_kzalloc(dev, sizeof(*mba), GFP_KERNEL);
+	if (!mba)
+		return -ENOMEM;
+	mba->dev = dev;
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
+	for_each_available_child_of_node_scoped(dev->of_node, child_np) {
+		ret = goog_mba_mbox_init(mba, child_np);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id goog_mba_match[] = {
+	{ .compatible = "google,lga-mailbox-array" },
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
2.56.0.257.gf7497c7d27-goog

