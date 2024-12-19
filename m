Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C8E22371F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2024 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734613679; cv=none; b=oXdfHW8eyLkRWjCJjs05SzWYbyIJbSKH3IvbRKvFDYOE6hAP+gGyPQM9s/qxf40PKm6pdrRgS575+0uXwLKf1HcqCLNYPvyedGYoCw5RvJnMDRl+jBw6w6vy88xgwM25CANHzu4sy9rpfVN0wQSOBeRgYVlQJ2jk9xDnSpDyvwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734613679; c=relaxed/simple;
	bh=Q2/Ilfy56ojSZu1+fOIemD2xiXcbZHn9eQaGm8k0miI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uiFNtJKVbSrn/TPGQ9xL+MsJvLD3leOFBFDsT9c7ILSxXFb23GO0N8BO5kNeWEhZzNeiHbRnXLRodn3DW/NsEUA6CX/6xmmCd9yIX/3vD6VUCwPtlptutgCiWtFBe0hq3NYPfYhvKImzeIy57E1o3yKs60OpSZz2gLizC+5ynfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vM2w2UZf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vM2w2UZf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso5322425e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2024 05:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734613674; x=1735218474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUOQPXTRe3lg7UV1cQpho3gjLjQwoiMIh3ZBdN3lBVY=;
        b=vM2w2UZfTgGQ1TWvMZe5Z05/bs0aPR0XP6U/OW9xAihQrYRWBnJVHPZneHg0Siiu6E
         EQuWZj1QOg3LAsTdTu/cwKF9a5Zv1ZrstBi/ONNegZnXFakAYNqcMDXQc3UnjbgUW31Y
         rCEE6QVvpTd0yz5HOYSsEFHrOMtMv0tKkm242z6nwZHSDDpGzjS06xEJTTtCmCdPlEK6
         N2b/sgnYlMVEUkxvXizukbp12MpBPmJ5DC8Pl17DyAAll3Py4WLhk+oPfzn58jexUSPV
         yWgpjF8s0ynLbmhjSyZUVaaWOZwVDfon8YIoz0q6WvcxXzsigjrCRqkmLaVT1wTJdnQp
         HDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734613674; x=1735218474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUOQPXTRe3lg7UV1cQpho3gjLjQwoiMIh3ZBdN3lBVY=;
        b=KTRvirNRQMJZYl447eD58Pcr8NZtOTH0ZXq+4n2q/IcsBXcx89e7AYaTBT4z+nQC4z
         ZVR3osWb7znag5y2aB+45grdnQWpztrcqwdDzaM8ASrS9XpQR4CH4pptdIrHyNxw10Eh
         wI1tz6gaUlvlpZGFe9VQ8sgrTn9kufQfCC/4wTiLxmEpnJRSYSqylEVcKaBLeU/3dgzB
         euycONXEHSOfEHy8Tuu44FjqkD+Ej9PJspZV0qlpB43mc8yV8MUo20OBAMuswZgCur7x
         5jThIFvHqfDwfXDUGWIX5e9IPdvuPAZ4qNH74ePabDZ0UaZwwiqICjgjMzuBssrkqwem
         aC3g==
X-Forwarded-Encrypted: i=1; AJvYcCWRjHY5Fc+7+eCCQUW6644d6mACEmbXgWs1Q0TuvedtA9aMfstg4v7vCbJ3pFdZNhUv8jj6pqh6UNIH1RoLC7kjSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuouQfV9uckqRU2WtZjRsFZ6kP2fCHHk7vF7PL+PpggM7/r6IE
	OgCW1IUmYkrI5FcPeuepkmv3E4LshVnO97/qjJL83GWOtd5IxZVvSRyk24islXw=
X-Gm-Gg: ASbGncsiUIT0aANSAafSXokbm3SDyd2vZ86fzCPilq6EW5vQsqQHt3YTlk4dQwSl7au
	W4hmfF6hk2jydLght+XBy2bDvMNGwU/OxnxFXX/WrkP/HO/VcjDp1Zo6IzMxKvfQWdFGFx2f0fP
	wumSYpZfV4vcqtiQKO81GOKw+5R+9VlfBLKDzBy5DnzwMB7CJO9lnF21cijbzyl8cvKtjPSEYUq
	HBHlL9fv6+8zh1pf0M9XC8UwsgO8zbM+2BOKgjR1jkl0eoyzbn8bjN2SPr46rMByjUVvktvFZnD
	G8aXdY8cYH1Jisx1CjJe7zwHFuOzvverCTD8
X-Google-Smtp-Source: AGHT+IH7QXzVbmArkNE6kY0mh8UxCymkYvZfRaYwodpZUWknXO1JZt6pMIJoZmzQeGk94zIBsb8bHw==
X-Received: by 2002:a05:600c:350c:b0:436:1c04:aa8e with SMTP id 5b1f17b1804b1-4365c7942b6mr32991725e9.16.1734613674393;
        Thu, 19 Dec 2024 05:07:54 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm17436705e9.6.2024.12.19.05.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 05:07:53 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 19 Dec 2024 13:07:47 +0000
Subject: [PATCH 2/2] mailbox: add support for clients to request channels
 by arguments
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-mbox_request_channel_by_args-v1-2-617a6910f842@linaro.org>
References: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
In-Reply-To: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734613671; l=5667;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Q2/Ilfy56ojSZu1+fOIemD2xiXcbZHn9eQaGm8k0miI=;
 b=DjvbKV9+OxuCn/g6zNLfMtnGo0ac9oiSZ61hg9UOxS8u84Deij/SZOVt8RZG/MWpoV+4CNVYI
 JGsGxeG3VrmBjbJEriNyu7OXAB4fQa5a+qF3YVvdcTl7LG3+UQDNJyw
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

There are clients that can discover channel identifiers at runtime by
parsing a shared memory for example, as in the ACPM interface's case.

Supply a new framework API: mbox_request_channel_by_args().

It works by supplying the usual client pointer as the first argument and
a pointer to a ``const struct mbox_xlate_args`` as a second. The newly
introduced struct is modeled after ``struct of_phandle_args``. The API
will search the client's node for a ``mbox`` phandle, identify the
controller's device node, and then call that controller's xlate() method
that will return a pointer to a mbox_chan or a ERR_PTR. The binding
between the channel and the client is done in the typical way.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mailbox/mailbox.c          | 57 ++++++++++++++++++++++++++++++++++++++
 include/linux/mailbox.h            | 17 ++++++++++++
 include/linux/mailbox_client.h     |  3 ++
 include/linux/mailbox_controller.h |  4 +++
 4 files changed, 81 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index d3d26a2c9895..07ea32ebab80 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -467,6 +467,63 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 }
 EXPORT_SYMBOL_GPL(mbox_request_channel_byname);
 
+/**
+ * mbox_request_channel_by_args - request a mailbox channel using client's
+ * channel identifiers.
+ * @cl: identity of the client requesting the channel.
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
+					const struct mbox_xlate_args *spec)
+{
+	struct device *dev = cl->dev;
+	struct mbox_controller *mbox;
+	struct device_node *mbox_np;
+	struct mbox_chan *chan;
+	int ret;
+
+	if (!dev || !dev->of_node) {
+		pr_debug("%s: No owner device node\n", __func__);
+		return ERR_PTR(-ENODEV);
+	}
+
+	mbox_np = of_parse_phandle(dev_of_node(dev), "mbox", 0);
+	if (!mbox_np)
+		return ERR_PTR(-ENODEV);
+
+	mutex_lock(&con_mutex);
+
+	chan = ERR_PTR(-EPROBE_DEFER);
+	list_for_each_entry(mbox, &mbox_cons, node)
+		if (mbox->dev->of_node == mbox_np && mbox->xlate) {
+			chan = mbox->xlate(mbox, spec);
+			if (!IS_ERR(chan))
+				break;
+		}
+
+	of_node_put(mbox_np);
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
index 734694912ef7..a9f4d108c48c 100644
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
+			     const struct mbox_xlate_args *spec);
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

