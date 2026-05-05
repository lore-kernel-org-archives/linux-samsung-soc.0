Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C721F44A71C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 May 2026 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986839; cv=none; b=Q6M/ShXFDWNuCQB3SCGWiOU38WeAxiCXy9u6Kfvgo0AtLZV1lHixGq+dPWI0Z+fwcAOCgHpuOxcWE6koH2TSrgBq6vHy/fgieVdygTwAZKN96IYvA/ewe/Sthsf2WdIvqAhrMSlSKfeAzh3qh0x8Duyhqe7VyPBT0eyPBg6X364=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986839; c=relaxed/simple;
	bh=y3CzFzYBC79FHo60Bgq3OAMyWY2i8lL9XzUZoMqVK/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iox6kyAWatBMrqgCg7vRUxdGrkEuNVxvGsmZ3IVbrEOa4BijjtK2ufs01puspYfjz0vlfsxhs9OcBBSO816q6/Tj1nymMvpeMSJMCia3IpkGm0RtL2oHRD8HstqFkGX8rNxZxULSdHLZQaIWHYK7rZHUMez8JYMYXQH7uLrAOSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OOvstt5I; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOvstt5I"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso55528125e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2026 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777986834; x=1778591634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr+MxyFx7bMkGaeeMjkJNvF3dfsBwvJKWr4lu6sjRpo=;
        b=OOvstt5I++shryBnY4nSxXOj668i27YIEMsAPeKjy4AlhSzIUQDJ1XJy+MD84hyMUM
         w4Sn5VySnZbibX0bbinj5xdXaBQqD+BCgIXp1nx9olNY3cV46HbR/CCA+g6l1xsoZYEX
         F1D5aErWk/WqsNKMe9QcNDYNhqVkXuPKnR/3fW69GfPhl8hVAMBHYPLWI4cmiBZMHWE1
         HMzzrUGncHxCnnK+KRxHhYqXzV8YBTi4AIoJfPJwCe6zoXuwXDbYAXpuvl13MebMhOzK
         yu58Zx7clIF0MHQxZSxBbRWWGK4KABxZhe7zJmSjz7iMuylC6V9EfVyNmR1ThTP0hJMz
         +qVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986834; x=1778591634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pr+MxyFx7bMkGaeeMjkJNvF3dfsBwvJKWr4lu6sjRpo=;
        b=MjJA9Prdga4m5hbVe54Qk/fSQgcpaG8UUpczHufbU5/5rHwZwiUkk+CAkaZXrPB7LB
         V8pXbSM2PRpKzhM90Md5DzOVaTvoqaRV/Dx82653JTzonp7kS4kXQi+k6gyo8qehOtWC
         YbDmIDu8JmE9ja4qdPuZvi5Ra5RWpBdWLDR2u44qEpLeW3PEhC2GOdbrvODnnkRUSvBQ
         x6KdSCYoXD4Avsk7pscaTr2jm+dkykJTHFLN3BWclPGYxm3zMm0fbCISOf1jGze+ldv5
         u+mt+2IuJ62jS3vv5kvedg1bq/9T2AYGCcHeHMbrN21V2KVlymT1NQ7dz87z14hUv/Im
         VASQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WtOw5Cf/eHxFNl1GxGt4ZvFzb2G3z8EMt/9cpXlVfZ2MVhvRbEFp12W2GQo2l8YEF3JH0EcxQ8hNDC3CgRrOQ1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoHsQunQorT7vs0ZhB3QUkUU1BHr0mPUi6HKExVLLcXNdYcAWU
	uYdeBDcC229sr98wJWTOZ4qtjB1JI/sN+Gdm4qjioSPPWkPAMI0B9mwyS1At485oqMc=
X-Gm-Gg: AeBDietBi38igwtlI8pBvQVDQZa/jKrCiw6SneYyPj+R/HznphNh66ul18jXMt+adSF
	Dv5pWfsQtDCtBHvnDbmNcGbk+Gtsw6o3+edUmE/QarmvDa4KWW8HV0BF16uR2vsPL0Li13n/AgK
	CEJO9hlYOxTTR+tGmO9y9lP8P07g/SOzoNvs6JmFRBwqbM1Z0zNS38rb7nPaJaAdSJAYMNQeYHa
	sJ1zYGDtZFIb8jixHNIb46hvpK3bzb2ABwcBAQCw5jmXkl1+br3y0kz0iICr5429dps3hlUmit1
	MTab9I/AdRFqdxUcBBotlUJQX6bvKb8dMIkp1gc2HXPNEcO1frESrii8ROb8C+kPzl+O0bTWHJF
	uMUnfHzYORu3tvtGYKlrqONBSqaaXqztyxjAposRnOsvM/PonpMss48Gd96tQq+0LsWD8WWBeG9
	nfxnBXKuQ0o7UZpy/eFVnrIL6+15L8o4CXVC+TBMg6MnlUAmX2pCUqfBXrRNi3Gxvm7lBFAwzMf
	uawkJKtxCIFRCqzs3KTJiqnDm+R
X-Received: by 2002:a05:600c:42d5:b0:48d:c0a:3813 with SMTP id 5b1f17b1804b1-48d0c0a38e7mr74267125e9.3.1777986834145;
        Tue, 05 May 2026 06:13:54 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm366599525e9.6.2026.05.05.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:53 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 05 May 2026 13:13:02 +0000
Subject: [PATCH v5 5/7] firmware: samsung: acpm: Fix false timeouts and
 Use-After-Free in polling
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-acpm-fixes-sashiko-reports-v5-5-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777986831; l=8240;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=y3CzFzYBC79FHo60Bgq3OAMyWY2i8lL9XzUZoMqVK/U=;
 b=PEYKzv2ZhBQp/FxhrFEHzZLE4K2AoV5DdiBbO1toNYl3zeHv+9j10qVqVimuouZYidiSb6fz9
 t8l+thgFTWRAD4tryh4vFbkUaSH2Mq7ngIppD+z3HyTjP0ZT+2U/JPM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified severe races in the polling state machine [1].

In the ACPM driver's polling mode, threads waited for responses by
monitoring the globally shared 'bitmap_seqnum'. This caused false
timeouts because if a thread processed its response and freed the
sequence number, a concurrent TX thread could immediately reallocate
it before the polling thread woke up.

Additionally, the driver suffered from a cross-thread Use-After-Free
(UAF) preemption race. Previously, acpm_get_rx() cleared the sequence
number of whichever RX message it drained from the hardware queue. This
meant Thread A could globally free Thread B's sequence slot while
Thread B was asleep. A new Thread C could then steal the slot,
overwrite the buffer, and leave Thread B to wake up to corrupted state
or a timeout.

Fix this by rewriting the polling state machine:
1. Decouple polling from the global allocator by introducing a per-slot
   'completed' flag, synchronized via smp_store_release() and
   smp_load_acquire().
2. Strip acpm_get_saved_rx() out of acpm_get_rx() to make it a pure
   queue-draining function. Introduce a 'native_match' boolean argument
   which evaluates to true only if the thread natively processed its
   own sequence number during the call. This explicitly informs the
   polling loop whether it must retrieve its payload from the
   cross-thread cache.
3. Centralize the cache fallback and sequence number free (clear_bit)
   inside the polling loop. Crucially, the free operation now strictly
   targets the thread's own TX sequence number (xfer->txd[0]), rather
   than the drained RX sequence number. This enforces strict ownership:
   a thread only ever frees its own allocated sequence slot, and only
   at the exact moment it completes its poll, eliminating the UAF
   window.

Furthermore, explicitly guard the 'native_match' assignment with an
if (rx_seqnum == tx_seqnum) check, even for zero-length (no payload)
responses. While an unguarded assignment wouldn't crash (because the
cache fallback acpm_get_saved_rx() safely returns early on zero-length
transfers) doing so would "lie" to the state machine. If a thread
drained the queue and found another thread's zero-length message,
setting native_match = true would falsely convince the polling loop
that it natively handled its own response. Maintaining a rigorous state
machine requires that native_match is only set when a thread explicitly
processes its own sequence number.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 68 ++++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a9449bc33bd0..2dea9b7bfe91 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -106,11 +106,14 @@ struct acpm_queue {
  * @cmd:	pointer to where the data shall be saved.
  * @n_cmd:	number of 32-bit commands.
  * @rxcnt:	expected length of the response in 32-bit words.
+ * @completed:	flag indicating if the firmware response has been fully
+ *		processed.
  */
 struct acpm_rx_data {
 	u32 *cmd;
 	size_t n_cmd;
 	size_t rxcnt;
+	bool completed;
 };
 
 #define ACPM_SEQNUM_MAX    64
@@ -205,26 +208,28 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 
 	rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
 
-	if (rx_seqnum == tx_seqnum) {
+	if (rx_seqnum == tx_seqnum)
 		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
-		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
-	}
 }
 
 /**
  * acpm_get_rx() - get response from RX queue.
  * @achan:	ACPM channel info.
  * @xfer:	reference to the transfer to get response for.
+ * @native_match: pointer to a boolean set to true if the thread natively
+ *                processed its own sequence number during this call.
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
+static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer,
+		       bool *native_match)
 {
 	u32 rx_front, rx_seqnum, tx_seqnum, seqnum;
 	const void __iomem *base, *addr;
 	struct acpm_rx_data *rx_data;
 	u32 i, val, mlen;
-	bool rx_set = false;
+
+	*native_match = false;
 
 	guard(mutex)(&achan->rx_lock);
 
@@ -233,10 +238,8 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 
 	tx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
 
-	if (i == rx_front) {
-		acpm_get_saved_rx(achan, xfer, tx_seqnum);
+	if (i == rx_front)
 		return 0;
-	}
 
 	base = achan->rx.base;
 	mlen = achan->mlen;
@@ -260,8 +263,13 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 		if (rx_data->rxcnt) {
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
-				rx_set = true;
-				clear_bit(seqnum, achan->bitmap_seqnum);
+				/*
+				 * Signal completion to the polling thread.
+				 * Pairs with smp_load_acquire() in polling
+				 * loop.
+				 */
+				smp_store_release(&rx_data->completed, true);
+				*native_match = true;
 			} else {
 				/*
 				 * The RX data corresponds to another request.
@@ -271,9 +279,21 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 */
 				__ioread32_copy(rx_data->cmd, addr,
 						rx_data->rxcnt);
+				/*
+				 * Signal completion to the polling thread.
+				 * Pairs with smp_load_acquire() in polling
+				 * loop.
+				 */
+				smp_store_release(&rx_data->completed, true);
 			}
 		} else {
-			clear_bit(seqnum, achan->bitmap_seqnum);
+			/*
+			 * Signal completion to the polling thread.
+			 * Pairs with smp_load_acquire() in polling loop.
+			 */
+			smp_store_release(&rx_data->completed, true);
+			if (rx_seqnum == tx_seqnum)
+				*native_match = true;
 		}
 
 		i = (i + 1) % achan->qlen;
@@ -285,13 +305,6 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 	/* We saved all responses, mark RX empty. */
 	writel(rx_front, achan->rx.rear);
 
-	/*
-	 * If the response was not in this iteration of the queue, check if the
-	 * RX data was previously saved.
-	 */
-	if (!rx_set)
-		acpm_get_saved_rx(achan, xfer, tx_seqnum);
-
 	return 0;
 }
 
@@ -306,6 +319,7 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 				   const struct acpm_xfer *xfer)
 {
 	struct device *dev = achan->acpm->dev;
+	bool native_match;
 	ktime_t timeout;
 	u32 seqnum;
 	int ret;
@@ -314,12 +328,25 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 
 	timeout = ktime_add_us(ktime_get(), ACPM_POLL_TIMEOUT_US);
 	do {
-		ret = acpm_get_rx(achan, xfer);
+		ret = acpm_get_rx(achan, xfer, &native_match);
 		if (ret)
 			return ret;
 
-		if (!test_bit(seqnum - 1, achan->bitmap_seqnum))
+		/*
+		 * Safely check if our specific transaction has been processed.
+		 * smp_load_acquire prevents the CPU from speculatively
+		 * executing subsequent instructions before the transaction is
+		 * synchronized.
+		 */
+		if (smp_load_acquire(&achan->rx_data[seqnum - 1].completed)) {
+			/* Retrieve payload if another thread cached it for us */
+			if (!native_match)
+				acpm_get_saved_rx(achan, xfer, seqnum);
+
+			/* Relinquish ownership of the sequence slot */
+			clear_bit(seqnum - 1, achan->bitmap_seqnum);
 			return 0;
+		}
 
 		/* Determined experimentally. */
 		udelay(20);
@@ -384,6 +411,7 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[achan->seqnum - 1];
+	rx_data->completed = false;
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;

-- 
2.54.0.545.g6539524ca2-goog

