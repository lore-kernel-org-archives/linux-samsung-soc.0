Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C736A21A420
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702606; cv=none; b=VM4nZmbazWCUbfHgW6X3CKymN5xuywKHSwRPfiPy7JSPT9hcAwEft2XHBw0S3LOdYOR3TW9XF0XIDxF3n9scW/kZO9uTDPAoquNT7iWXG5u4YbBR3BmW8FIcTWW9Z87DA8bFCrbbf9dvie79WtDOWFj7RXM9GM13n4D/+JkV7wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702606; c=relaxed/simple;
	bh=yyB5CQGhVmNL0L7BcpLJ32JRUO4zLOTRcjHSgygE7Ik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c+IP1mDCY5cLEw+8mmieDBecJjbzZzKpvr8xPL/FatHI6HML5dWK5yUiwv8ourxKV2o/V4PZsaLdyuo5KT89QFnO7189cQDpGwZZCyiLCeMWlYgRBV+622ORpUkGnjv5b+7wOgBrarNYUl+2X+FWH+oqPXep2PLEaCvk2Y4IJ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oEfqu0+F; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oEfqu0+F"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862b364538so1113404f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 05:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702602; x=1735307402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3R4Jhe3KgMdcHWwBtGAqNwkL06pjGhdfYrGLYcX0qU=;
        b=oEfqu0+FX7OUC3BONqiSMd4vX106N8KVi8M/rK6DSfeDKux8vVWbfwAGzd08aScr2+
         Csw0+r5vrWx+8O7X2HDgBVYvhcjs1eADZsLV74sV7oQDq6XhXsS24HEsOKjo2nBItcSI
         pMk82REltjeVSvqNQ8tdLpJf0xIBXXHxVnapz/M1F+e7UjfYMHauW1s61OyT7D5/VDmR
         xc24KdLey4RvHqLrbZf2/6a3CZBQwXkOlZaXtUgw5smrTQwcxetU5qD1u30BawMxS1XV
         G1ssanl3noXmDAFJzQ945hIcPmRhveaeta7gj8JImMpzGrFRJfc4tq055Ak8NfCJWmpe
         vtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702602; x=1735307402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3R4Jhe3KgMdcHWwBtGAqNwkL06pjGhdfYrGLYcX0qU=;
        b=UKCg9YNqSa6LimtwAB/wyBrIIjFvmt4pFf0OQIVsyhrKFSBcBmIpzocrYz0GKKu9O1
         1N5liGeGvZfmO9kAasXsVVaPyxD/OAtiJyMaWB5TWFFCaiFHJPnyjN9maRlUB2pQc5Cs
         BiKizCd6pl8tYY/OLr2YbkLilyHUOUa0fw+2z+BkAkHUFN0wKDD6QZ+h8CSmBu7CFeXa
         350/sthLgXQf7jaGJ9K6EynjlOMrqqkGEw492wFV7RLxeUDOwOdlLg3lM4CPHqcEN1Uu
         8s+FkEUBgHj28mbGwHF7K2+jJ58hLwM96HYJxkJvDC4HwKro1s9FTc+F7M5IliB7TsOK
         SzAA==
X-Forwarded-Encrypted: i=1; AJvYcCXoXZVYcoNb5a61+ho7FZUmCESIVTK98Gbm8164Yn5NME+h3RxEp2LkhzDALJEbPguZrZWngctb5qTDV+IKYoQqGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ONrINsd1x12DVgNoc0RO+wCQM9qW2xfk3i0yN4IcMpAeok0I
	ew8hVlh9XS+TOK47fsNJ7JhRwFhEfTqSu1FoupCnBeRHlv1heid4+CcOAxbWDZs=
X-Gm-Gg: ASbGncueR1PkPnMaO3lHJ1AomhMLOsUK/Pe68JU6I595Uw9nZ56oIivKotwXy0cy29r
	sSjHZ3pplXCfYarNQoy2uOhKz9A+dHaqmkgbUjqXm/ConPxs/hBbY2KoFaUSQBOafmzuK3jd9U3
	MfDWI8EPs2MsNbZRhjW7dd3srBkfALz9oxPPAccQWCAuttLtu7Pq4nEIDCICcfCkN9H6QZtKqJ/
	TMD00kUYeDY1I578grv8mQWgqRAbpn/6uk6KrOtnfEe6bm+ipeSoK6cLXDxhFI9EuutRaXi1OgM
	S0wgdmn6eqmjP3ZfqCN5oo3QZDUkQPQcVnuY
X-Google-Smtp-Source: AGHT+IFO4m1UMUWH98xI6WEcrXsCmyinFas11MjCCiL6zLrmfdc5i7QkqHRJkTCA4ukd1H0E1zdRFw==
X-Received: by 2002:a05:6000:1785:b0:386:3c93:70ff with SMTP id ffacd0b85a97d-38a1a1fdd35mr6675772f8f.8.1734702602133;
        Fri, 20 Dec 2024 05:50:02 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e74sm4044313f8f.30.2024.12.20.05.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:50:01 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 13:49:58 +0000
Subject: [PATCH v6 3/5] mailbox: add support for clients to request
 channels by args
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-acpm-v4-upstream-mbox-v6-3-a6942806e52a@linaro.org>
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734702598; l=5904;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=yyB5CQGhVmNL0L7BcpLJ32JRUO4zLOTRcjHSgygE7Ik=;
 b=vsmN1tUctzs2mQxUDHpQYFZZw2uQY7/lH7aU0MJkG/FL5nc9qKT2nTT5HYlqjC6BnhqU8Jipu
 zaGST/SqFPyALdMnBZnXEks6QaRLLJw/KxnPYpoXUa0ql5fqZ+5W8/P
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

There are clients that can discover channel identifiers at runtime by
parsing a shared memory for example, as in the ACPM interface's case.

Supply a new framework API: mbox_request_channel_by_args().

It works by supplying the usual client pointer as the first argument,
the usual index of the mailbox specifier in the 'mboxes' property as
a second argument, and a pointer to a 'const struct mbox_xlate_args'
as a third. The newly introduced struct is modeled after
'struct of_phandle_args'. The API identifies the controller's device
node, and then calls that controller's xlate() method that will return
a pointer to a mbox_chan or a ERR_PTR. The binding between the channel
and the client is done in the typical way.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mailbox/mailbox.c          | 60 ++++++++++++++++++++++++++++++++++++++
 include/linux/mailbox.h            | 17 +++++++++++
 include/linux/mailbox_client.h     |  3 ++
 include/linux/mailbox_controller.h |  4 +++
 4 files changed, 84 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index d3d26a2c9895..0eecffd5a2ad 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -467,6 +467,66 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 }
 EXPORT_SYMBOL_GPL(mbox_request_channel_byname);
 
+/**
+ * mbox_request_channel_by_args - request a mailbox channel using client's
+ * channel identifiers.
+ * @cl: identity of the client requesting the channel.
+ * @index: index of mailbox specifier in 'mboxes' property.
+ * @spec: arguments that describe the channel.
+ *
+ * Used by clients that can discover the channel identifiers at runtime (by
+ * parsing a shared memory for example). The description of
+ * mbox_request_channel() applies here as well.
+ *
+ * Return: Pointer to the channel assigned to the client if successful.
+ *         ERR_PTR for request failure.
+ */
+struct mbox_chan *mbox_request_channel_by_args(struct mbox_client *cl,
+			int index, const struct mbox_xlate_args *mbox_spec)
+{
+	struct of_phandle_args of_args;
+	struct device *dev = cl->dev;
+	struct mbox_controller *mbox;
+	struct mbox_chan *chan;
+	int ret;
+
+	if (!dev || !dev->of_node) {
+		pr_debug("%s: No owner device node\n", __func__);
+		return ERR_PTR(-ENODEV);
+	}
+
+	if (of_parse_phandle_with_args(dev->of_node, "mboxes",
+				       "#mbox-cells", index, &of_args)) {
+		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
+		return ERR_PTR(-ENODEV);
+	}
+
+	mutex_lock(&con_mutex);
+
+	chan = ERR_PTR(-EPROBE_DEFER);
+	list_for_each_entry(mbox, &mbox_cons, node)
+		if (mbox->dev->of_node == of_args.np && mbox->xlate) {
+			chan = mbox->xlate(mbox, mbox_spec);
+			if (!IS_ERR(chan))
+				break;
+		}
+
+	of_node_put(of_args.np);
+
+	if (IS_ERR(chan)) {
+		mutex_unlock(&con_mutex);
+		return chan;
+	}
+
+	ret = __mbox_bind_client(chan, cl);
+	if (ret)
+		chan = ERR_PTR(ret);
+
+	mutex_unlock(&con_mutex);
+	return chan;
+}
+EXPORT_SYMBOL_GPL(mbox_request_channel_by_args);
+
 /**
  * mbox_free_channel - The client relinquishes control of a mailbox
  *			channel by this call.
diff --git a/include/linux/mailbox.h b/include/linux/mailbox.h
new file mode 100644
index 000000000000..cef88c5ae49d
--- /dev/null
+++ b/include/linux/mailbox.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2024 Linaro Ltd.
+ */
+
+#ifndef __LINUX_MAILBOX_H
+#define __LINUX_MAILBOX_H
+
+#include <linux/types.h>
+
+#define MBOX_XLATE_MAX_ARGS 16
+struct mbox_xlate_args {
+	int args_count;
+	u32 args[MBOX_XLATE_MAX_ARGS];
+};
+
+#endif /* __LINUX_MAILBOX_H */
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index 734694912ef7..06e2721313ca 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -9,6 +9,7 @@
 
 #include <linux/of.h>
 #include <linux/device.h>
+#include <linux/mailbox.h>
 
 struct mbox_chan;
 
@@ -41,6 +42,8 @@ int mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl);
 struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name);
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index);
+struct mbox_chan *mbox_request_channel_by_args(struct mbox_client *cl,
+			int index, const struct mbox_xlate_args *mbox_spec);
 int mbox_send_message(struct mbox_chan *chan, void *mssg);
 int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
 void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 6fee33cb52f5..dfddcf966f9f 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -8,6 +8,7 @@
 #include <linux/hrtimer.h>
 #include <linux/device.h>
 #include <linux/completion.h>
+#include <linux/mailbox.h>
 
 struct mbox_chan;
 
@@ -67,6 +68,7 @@ struct mbox_chan_ops {
  * @txpoll_period:	If 'txdone_poll' is in effect, the API polls for
  *			last TX's status after these many millisecs
  * @of_xlate:		Controller driver specific mapping of channel via DT
+ * @xlate:		Controller driver specific mapping of channel
  * @poll_hrt:		API private. hrtimer used to poll for TXDONE on all
  *			channels.
  * @node:		API private. To hook into list of controllers.
@@ -81,6 +83,8 @@ struct mbox_controller {
 	unsigned txpoll_period;
 	struct mbox_chan *(*of_xlate)(struct mbox_controller *mbox,
 				      const struct of_phandle_args *sp);
+	struct mbox_chan *(*xlate)(struct mbox_controller *mbox,
+				   const struct mbox_xlate_args *sp);
 	/* Internal to API */
 	struct hrtimer poll_hrt;
 	spinlock_t poll_hrt_lock;

-- 
2.47.1.613.gc27f4b7a9f-goog

