Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A03D3FAE13
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468320; cv=none; b=YD0c0nsYu380u+5iBmnn1ycjqEDRCzxqcGX1HQJn2x68nAUBIVe3q68ntWvJdmjzDYv7Jso5v4zvUWdrF5CEZRopC7c04bDig97rFue0uLfRdlkcbYwDI6KgAI5Aw9ibPgvwz7Ei7BYIJj09LkIySd2asjHcQuPad5BVchfc06U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468320; c=relaxed/simple;
	bh=qIi4uEXjUsPRYYUetGAKlVVsN1QT6jgcMevIIMn2wws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OpLscdtUIWAZZ4HqjS6o95J9dfdXR/acCcTngZ99GETf+1EpW6YlmIfZsa0kyjj+5j+MgdNNklxRTPqTfzxXYpzBelSYgczgeJ05aqeiFsDonRVQ1elAtKJxVe8En6izZu8eTeSjx1cyQBdtSR9Jz0j+qwt6PGoUWmW6KlTMwPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Phta15bj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Phta15bj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so5502285e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777468316; x=1778073116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+M8AOXn9O7RUpeUBA+tCnoNyyooYIprfAY53DgU1d8=;
        b=Phta15bj7dK6ifHnXNE1PUDeeem2mECDR8x7je5w4oXzrzPhi+JLnORS/8c9ITVDxJ
         RzDMTXYEAb0ScTyDEkwZFWkbbzvd9Qfubw3okNrvRhchKSyZrGqLOZXRK4Y22jtFehvU
         EQrY/6LHhi1E1w98gKrEg7tJrgh4CjsMCRHJiQMFAmC0A8gzuxgD03v3oxggZZDu3NY0
         Wv7XqpqVHu1oHnbV3JuV4vU9JADnUNj/9doScTb6A4yS7gJ/VaLPyhoENCF/AEfBrEz3
         3Nbg0ribgzXCWmlCAFDSkTkEgG2Nf5TIpTrTlmNRE3NPJZTmrJsflcZxE4UyGkoHuAtc
         ROmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468316; x=1778073116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w+M8AOXn9O7RUpeUBA+tCnoNyyooYIprfAY53DgU1d8=;
        b=qh7UR5SIOGTgA0YNnTsam2EFLcSA50h4eQocnnB6lLq1m4bnNwFRp2O9gSS6BTw5uY
         EKAu2Vsyg+MUlypDPXhh4pHOOP2SHtWjNWSBNIFi/7BSjHu51i8Q9vgrDeds8ysL290N
         Vihd8YIx1y68qhx5jLIhZdFy+SJqyMz5N5hgcAryFmPzynzHQB4wSBLxr0gCX81MJCt6
         ex5wINqZMTTJAVGuZtIDlPl4j6YGWa7UWhYqJN7tIhYm/sSkDALa02nHWAT9ObKMXqGH
         9syp6M8MQLqxwmF8bEyvbsD4jcyphDaxB2jDz1cKKlAO74u65euzxy8w1B2zaKtKEqDk
         WQLg==
X-Forwarded-Encrypted: i=1; AFNElJ/m860Y4RnF1Zi9cXYSdd1w/xw6gIhkCY2dPergNbDi/mNm6TJDAHBN9IKZV3ZQi6EkkN8Qg9fbbPDAfzUGIkGiZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb28yuO2sMwufcSPSsQpAnBFox1fFa8JgZydhupGbGkA8cVuCb
	tbQwrpKJthxGUs0NP8DO3i/qj6w1GA/wMWp7vntswW7i1DBig3Nod03JfnfYZiuaks4=
X-Gm-Gg: AeBDiesD2rw8kOl7kP99xQrJr1UpOGy79MRO1hygm0/mcGWCTk92ihagpDXRuGiopu2
	dLP9a5dJYx0FABrmVl+lPFPLBnD7Wk5+431VH2BSERdY+Stel3KLZnT77XqnSb0jHgZpjisZGAy
	yn1P8ytJbYSriD2VPKQcJdxHUGmgo2LXD4JmhhUdRLHv5xp5Fs+aHr93kBLUVCfZI+X0VpzKGKJ
	kmSH0x7xhqpE6HIfBLpwW2bvO8XsG9bLG8sE16FiERHtPy/7zYu30nLBaPCdankuiwsu94i9z1U
	uzLp1n8AmwBas8Wqv30AnNFzA9htqIQlDCqqYI6NaC783y3uJD23KOvfmuBwzI2x2BPIptjEmDs
	d4h6j6kVyCgyXdJvrCq0wIwkL3gPOfTixoxAJ5uCff2Sd3J1HFJHoMkZZKGyU7C0AGGJvq32nuL
	sjMCB72us3L9OvD3ol50/DLEp649rENawy9+MkSOEqtIhwYPnwk0l+KPicx0Qp4LmMKSZh7K+8s
	BdzFYNPYmTZ3kXMdg==
X-Received: by 2002:a05:600c:2e0c:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48a7bf39d6fmr31504885e9.0.1777468315731;
        Wed, 29 Apr 2026 06:11:55 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm4752867f8f.34.2026.04.29.06.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:11:55 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 29 Apr 2026 13:11:55 +0000
Subject: [PATCH v3 6/6] firmware: samsung: acpm: Fix memory ordering races
 in RX and polling paths
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-acpm-fixes-sashiko-reports-v3-6-47cf74ab09ad@linaro.org>
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468311; l=5716;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qIi4uEXjUsPRYYUetGAKlVVsN1QT6jgcMevIIMn2wws=;
 b=n6p8KMgV4VXWOdTJOMRAdVfyCy1JYt9VnaozXQPFuRYYG/Sdcg02lvO7Wqps2Wkhke/a6iO7V
 YjeMPAOm5V2CdnvfidMtNJqGt3sYxPv18LMDCqgVxcTKOhqwQUxY7dC
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified a memory ordering race in the RX path [1].

Sequence numbers are allocated by the TX thread and freed by the RX
thread. Because the TX path is protected by 'tx_lock' and the RX path
is protected by 'rx_lock', the shared 'bitmap_seqnum' is modified
across two separate lock domains. Thus, the operations acting on the
bitmap are effectively lockless and require explicit memory barriers.

This patch addresses missing barriers in two paths:

1. The Release Path (RX thread):
When draining the RX queue, the driver reads the payload and uses a
relaxed clear_bit() to free the sequence number. On weakly ordered
architectures like ARM64, this allows the CPU to make the cleared bit
globally visible before the preceding memory reads (memcpy or
__ioread32_copy) have completed. If a concurrent TX thread allocates
the newly freed sequence number, it can execute memset() and corrupt
the buffer while the RX thread is still actively reading from it.
Fix this by replacing clear_bit() with clear_bit_unlock() to enforce
Release semantics.

2. The Acquire Path (Polling thread):
In polling mode, zero-length messages (rxcnt == 0) can have their bits
cleared by a concurrent thread that happens to be draining the queue.
The polling thread waits on test_bit(). Because test_bit() lacks an
acquire barrier, the CPU can speculatively execute the client driver's
subsequent instructions before the RX thread's memory updates are
globally visible. Fix this by pairing the release with
test_bit_acquire().

Note that the TX allocation path (acpm_prepare_xfer) is safe as-is
and does not require an explicit acquire barrier (like
test_and_set_bit_lock) for two reasons:
* Address Dependency: The CPU mathematically cannot calculate the
  destination pointer for the memset() until the non-atomic
  find_next_zero_bit() returns the index, naturally preventing
  speculative execution of the buffer wipe.
* Lock Boundaries: The visibility of the atomic set_bit() to the next
  TX thread is safely protected by the 'tx_lock' boundaries
  (specifically the Release semantics of mutex_unlock).

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index b8a4978b091b..15627b439838 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -7,7 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
-#include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
@@ -207,7 +207,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 
 	if (rx_seqnum == tx_seqnum) {
 		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
-		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
+		clear_bit_unlock(rx_seqnum - 1, achan->bitmap_seqnum);
 	}
 }
 
@@ -268,7 +268,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
 				rx_set = true;
-				clear_bit(seqnum, achan->bitmap_seqnum);
+				clear_bit_unlock(seqnum, achan->bitmap_seqnum);
 			} else {
 				/*
 				 * The RX data corresponds to another request.
@@ -280,7 +280,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 						rx_data->rxcnt);
 			}
 		} else {
-			clear_bit(seqnum, achan->bitmap_seqnum);
+			clear_bit_unlock(seqnum, achan->bitmap_seqnum);
 		}
 
 		i = (i + 1) % achan->qlen;
@@ -322,7 +322,14 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 		if (ret)
 			return ret;
 
-		if (!test_bit(seqnum - 1, achan->bitmap_seqnum))
+		/*
+		 * For zero-length messages (rxcnt == 0), the bit can be
+		 * cleared by a concurrent thread draining the queue. Use
+		 * test_bit_acquire() to prevent the CPU from speculatively
+		 * executing the caller's subsequent instructions before the
+		 * hardware transaction is fully synchronized.
+		 */
+		if (!test_bit_acquire(seqnum - 1, achan->bitmap_seqnum))
 			return 0;
 
 		/* Determined experimentally. */
@@ -392,13 +399,24 @@ static int acpm_prepare_xfer(struct acpm_chan *achan,
 		}
 	}
 
-	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
+	/*
+	 * Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62). We do
+	 * not need an explicit acquire barrier here because visibility to the
+	 * next TX thread is safely protected by the tx_lock boundaries
+	 * (mutex_unlock provides Release semantics). The RX thread only
+	 * blind-clears bits and doesn't care about this.
+	 */
 	achan->seqnum = bit + 1;
 	set_bit(bit, achan->bitmap_seqnum);
 
 	txd[0] |= FIELD_PREP(ACPM_PROTOCOL_SEQNUM, achan->seqnum);
 
-	/* Clear data for upcoming responses */
+	/*
+	 * Clear data for upcoming responses. Speculative execution of memset()
+	 * is prevented by the strict Address Dependency (implicit barrier) on
+	 * 'bit'. The CPU mathematically cannot calculate the destination
+	 * pointer until find_next/first_zero_bit() returns.
+	 */
 	rx_data = &achan->rx_data[bit];
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
 	/* zero means no response expected */

-- 
2.54.0.545.g6539524ca2-goog

