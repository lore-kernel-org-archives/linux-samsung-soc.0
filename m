Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B0B1DF756
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Jun 2025 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137927; cv=none; b=ASbovpjJNHjt0FNM9hanxYQ3z/floDVMRPOztJ+RRwsy2krPrDLdviKL0Kc7n7TW38i1h+7HBxpv13rRu4Ur2QFB0GYxP6TWoU7Ou+K1mKCrZrMZfsaK+1s/1+wReox21JoaBePsKey6fUjoPO7F5CDTazAGe19SUoivX2IVvzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137927; c=relaxed/simple;
	bh=qNAmmRKC2jTglldpcDlO2KCXuzEUgGG1x8yJRBImMT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bUwqDErMwqoHN6kmD2/6epUmOM3bqFbOhAQjzVwp0Pu6au20pLajaWt3d2b0rIhGMhHmVtCZAinJ+gx7XQuipZhiKH+KDWnfeAN2sWc+ckrvnIrFjVi3ZPlRxMvSN+FlOGiz1Qu+SFEnZsgwUe+xyR8sIws10Ot9H9BiVjFg3Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wPXukdl6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPXukdl6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so9439065e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jun 2025 08:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749137924; x=1749742724; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69scRkVxEedfu2A05mr2qUJ6E6ZjjFxsp+26832+0SY=;
        b=wPXukdl6sdR/2gWrk16Rg0+0rOALlrEYG7h5Nf7K08aVSWeIsYcCIHD9Q7u4rTe+37
         G6KdBzB29OP7Y90dijiOG5eAfmHl6UPmDkIV3VPmt75dUdkY596MB6A/gjFFEARnVJvr
         CXlSCMFj+CqL4LA2z8ksbJhthFhIJmeD43LLzpfU6G++L0N/Y5shh2aMz0LdzHQHpBEe
         nDgozEiNDUiwEwCqMJNdLUDnVX85hbceYj9bCCAlyYtkvjAdA+b+Tm7RY/p/VqHiSdTs
         WqpDTql/RbfyksL+yKSxtPNjp5LCjL+LRiB3/laMMrnXmOuca5XbZNIv+H6h05K0xDRs
         wEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137924; x=1749742724;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69scRkVxEedfu2A05mr2qUJ6E6ZjjFxsp+26832+0SY=;
        b=vriBbkdIzBDlnVK9HW1aslffOi+y8w04+lYRPeuf4VyU07qXubeoovMzDdO3M3PyHG
         XQb/uxddjOrzkdFoFPRlBbSFTQvuO+RXcS0t4hrhigP0wkfsDAHPyHO+oZFMqi/LG2zr
         1VdYY5Xl5f3xfPBHJv3w7+86pSLMND4A1okHPWJnBk1022YCiuQ8wze6HWoYCuRaKF3k
         xNbcWklw1qRz1X2GoRfG1Z7c3wwtaCUtfoBxVJNHN+PbATk6ex+etpV2n/G7smO+eYCq
         eifZQo24TM6/Xq5pifIPYfcgA162vQutt53noJ8hTi12OGWpFDVK7BBHOOFwWXm9LSnZ
         8SxA==
X-Forwarded-Encrypted: i=1; AJvYcCUkoh4L2BjIHMnbe1FId4q5otVfG1h5TQj5lSHMMQr0RszwGUOU/mlbFv8Sbvx3Xw1vKFVkwLpUouL5LOv3dG63cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRU+YxGWECbsbdeUNbfSETqiN0x0H++ltPT3fMGBVbIkQ3OctM
	Ql3+VyePJW34spXiQd0KgJLbAeHz1MTWd9pCdom428TyhqSKSGj6fTrvSG+Rl51/gG4=
X-Gm-Gg: ASbGncutqMCY2YfXx6YVur2Nkzrb/fWyd/rFntlV9nAshfdi8LFz0vjOSZNrsKiYAli
	ltB8uTnHfikPGEXWf44gwOckrauAmiViSkhH7KezyjHYsQFxUiOgaPI5JHN1jLbwt5bl6N7lb/H
	eG+gOJishdhwCJZfn0nP79XPFV5e0AJqXIaMW1TPhVIMOK3duFQgUOfWqv+dAsM5VCccXuM4yo/
	8TDYPbBGYqEM2fax+k9a2f6B5Nt2o2Pge2H/01U4cK9jZNvu0B7J/xHuGG4P9tzSV8AOHUD2/r6
	s34jnvpbbBRBznUQSEpASZyMG/WX8dqkZ61nv+d77YAREAfzbuJcJv7k8ayQCJhL94c+kMdcVtd
	9hKuUAV3cu/nb3nAz20DwcDOChYiKSXg9V4u7La1SSw==
X-Google-Smtp-Source: AGHT+IEasUAnsCjjEU7kkZN4XsU9GWJ8G3GIagukhq7hmK1v/JFF3UnIXc8rWmqtDB232dzP+SQlog==
X-Received: by 2002:a05:600c:8b03:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-451f0fade9fmr66739725e9.32.1749137923998;
        Thu, 05 Jun 2025 08:38:43 -0700 (PDT)
Received: from ta2.c.googlers.com (213.20.187.35.bc.googleusercontent.com. [35.187.20.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb2088a5sm22158835e9.21.2025.06.05.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:38:43 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 05 Jun 2025 15:38:26 +0000
Subject: [PATCH] firmware: exynos-acpm: fix timeouts on xfers handling
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250605-acpm-timeout-v1-1-1dbfdbee30da@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPG5QWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwNT3cTkglzdkszc1PzSEl0TYxNTcwtTA4NEYxMloJaCotS0zAqwcdG
 xtbUAor0BA14AAAA=
X-Change-ID: 20250605-acpm-timeout-434578500a34
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749137922; l=4289;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qNAmmRKC2jTglldpcDlO2KCXuzEUgGG1x8yJRBImMT8=;
 b=1Z/GFCXW1+ZqzSheOjbJBBWUWhL1BfaxkJJGRkPiPuLM//cM8JZvKHw0CmMrB7Drg80EUon9w
 qW0ghk9KheqD1dG72mvPSAGxwmTt5zE9tTIXcHWMMHWa49n73BUgWqT
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The mailbox framework has a single inflight request at a time. If
a request is sent while another is still active, it will be queued
to the mailbox core ring buffer.

ACPM protocol did not serialize the calls to the mailbox subsystem so we
could start the timeout ticks in parallel for multiple requests, while
just one was being inflight.

Consider a hypothetical case where the xfer timeout is 100ms and an ACPM
transaction takes 90ms:
      | 0ms: Message #0 is queued in mailbox layer and sent out, then sits
      |      at acpm_dequeue_by_polling() with a timeout of 100ms
      | 1ms: Message #1 is queued in mailbox layer but not sent out yet.
      |      Since send_message() doesn't block, it also sits at
      |      acpm_dequeue_by_polling() with a timeout of 100ms
      |  ...
      | 25ms: Message #0 is completed, txdone is called and message #1 is sent
      | 31ms: Message #1 times out since the count started at 1ms. Even though
      |       it has only been inflight for 11ms.

Fix the problem by moving mbox_send_message() and mbox_client_txdone()
immediately after the message has been written to the TX queue and while
still keeping the ACPM TX queue lock. We thus tie together the TX write
with the doorbell ring and mark the TX as done after the doorbell has
been rung. This guarantees that the doorbell has been rang before
starting the timeout ticks. We should also see some performance
improvement as we no longer wait to receive a response before ringing
the doorbell for the next request, so the ACPM firmware shall be able to
drain faster the TX queue. Another benefit is that requests are no
longer able to ring the doorbell one for the other, so it eases
debugging. Finally, the mailbox software queue will always contain a
single doorbell request due to the serialization done at the ACPM TX
queue level. Protocols like ACPM, that handle their own hardware queues
need a passthrough mailbox API, where they are able to just ring the
doorbell or flip a bit directly into the mailbox controller. The mailbox
software queue mechanism, the locking done into the mailbox core is not
really needed, so hopefully this lays the foundation for a passthrough
mailbox API.

Reported-by: André Draszik <andre.draszik@linaro.org>
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e02f14f4bd7c96de6ebb50473005de520aba1c4f..56b5cfdc63036b6214e5e8a5d30faabdd63b2dc3 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -430,6 +430,9 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 		return -EOPNOTSUPP;
 	}
 
+	msg.chan_id = xfer->acpm_chan_id;
+	msg.chan_type = EXYNOS_MBOX_CHAN_TYPE_DOORBELL;
+
 	scoped_guard(mutex, &achan->tx_lock) {
 		tx_front = readl(achan->tx.front);
 		idx = (tx_front + 1) % achan->qlen;
@@ -446,25 +449,15 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
 		/* Advance TX front. */
 		writel(idx, achan->tx.front);
-	}
 
-	msg.chan_id = xfer->acpm_chan_id;
-	msg.chan_type = EXYNOS_MBOX_CHAN_TYPE_DOORBELL;
-	ret = mbox_send_message(achan->chan, (void *)&msg);
-	if (ret < 0)
-		return ret;
-
-	ret = acpm_wait_for_message_response(achan, xfer);
+		ret = mbox_send_message(achan->chan, (void *)&msg);
+		if (ret < 0)
+			return ret;
 
-	/*
-	 * NOTE: we might prefer not to need the mailbox ticker to manage the
-	 * transfer queueing since the protocol layer queues things by itself.
-	 * Unfortunately, we have to kick the mailbox framework after we have
-	 * received our message.
-	 */
-	mbox_client_txdone(achan->chan, ret);
+		mbox_client_txdone(achan->chan, ret);
+	}
 
-	return ret;
+	return acpm_wait_for_message_response(achan, xfer);
 }
 
 /**

---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250605-acpm-timeout-434578500a34

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

