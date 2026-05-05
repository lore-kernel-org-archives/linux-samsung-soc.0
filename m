Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEE647CC63
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 May 2026 13:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986841; cv=none; b=X6SEGCr8lVrHLdn+SzlMr0ZLF+YLKAQxabyAAyQ8FHQ2xTtaAXAtu5oYjM5byl27IFBv+WxeaZMX5d/Seu676Nvel6MjUR8cLUyAfQqy/lR7DRRa/85tgSf6SEFQ/fysRRtsT9gCSAk9c8Pm6iusXlhQY66l0hp4R4P0UKEemsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986841; c=relaxed/simple;
	bh=PCWsEmI/WUR42uueqaiei2Cmh0aP35hqHHvduAG7Yz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hu2+9tHqzDcfyGMe6EKuETKIxfNptAyZwDbXWECY4ukGCPcMbfopfiu+qb0tnmbaq3sGZV9kUVtssTCrEtgqzEL6W8wGwJSiaeF1k4AqDOjcxWLv8qcshTJeJ0JdSiySEBj8Gw5N7c2lkGrSM379WNRkxqGrhnbESnmUG4Uo7V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ldYT3nXZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ldYT3nXZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so67664735e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2026 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777986835; x=1778591635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbpOUBhAHisNgJxpl8N8vXVEUriSOoMRSDM7NHjdJoU=;
        b=ldYT3nXZK26hstoHaQTnGll9VN+sMEgmaw7fzna9+7XVwjrK9Yhw7oSunsJqAYQbN8
         cL0P1u36dSfEjvhNu8FnCIeckQnVJJjtGU450Ctl9JSJsxnjBv92ihxcUlB88GFMnMhf
         p7E/zO8jz1PtZWWy26inyoU1NOeUGeulxln2Nq9VWfls3Fvflv43g93sODanqiinCWmN
         DkNRdGX4ymV3mYVeB0Nl90PnDentQvWseroyaWOZ+fjbHexH55p9UuTntavgT9RLjz/I
         ROk4fetj7Jwue18VStiDPswYl5tMuJAH/g497KkWclRSSwMOkl8GoPUwC17LMbwH30/S
         iQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986835; x=1778591635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XbpOUBhAHisNgJxpl8N8vXVEUriSOoMRSDM7NHjdJoU=;
        b=D+7SDJWy0DwmKoQEEvnASjsCxNvRs3WsF5c0cnIDpHn3h1JVKGXZ2NKI6vSnR3xach
         aoYjkpuroZQKCGYMmmuFnv8bkS6ntS+1hspgsb+/P7Kb+icOT3ipUbd5Xm16AS67Y/Gc
         nF1pw+GKwgK8xZ4L9XhERq3OwBf6giO9lVe7pfVUG6mzcBuCQ+9kg+CzQ2q4xBy/5el6
         6dz4m0ed8/9DKF8BopLoDmOhvOVO+ZQO3n+dK60hOj0pKzN4NulCzqhoV6hCknrahyOC
         Zv9yhGAvrkhd9zc2puWNmDHNwNnJXXT99SpwgxjS7VgqjY8/qSRfaWZQf8loQsD3v2Yj
         5plQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QLPXQlYxnqQnmaQ/wbpeNDhDet3X7aeFWOuRL6YF+U5gbW2T70lXCp4HksNYqLVTBlZCvORz1ralGmpJUkNpn/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSTE8zpy4gnr51TTk/AuA77CqRvmoVcS5h3FErE7FerAItgREM
	0ORUDaAdPvuR/Yyg7vX/qim9AP5ozPICCntFhK5W25q+P+pe7RGsNZFBkx1R4F5v+F0=
X-Gm-Gg: AeBDiet5q92pbbynO9o9oqI+kXuyEyNS/CpJp0gzy3xOzeiovIsgmItkVP6kcLhIAxa
	+2AbABn6jMoL2yPnDoQG7TTWM9h1waMmCbuC+9TPzrD5KuC8a3KS+RyYfyB7+jdQ6SlHqjOsKxF
	+2rM+1MesXMAG6hvocC3PjxpZmm0MOpp7Z/ooIBk83TX7KIzKpDOeazTVSqcS80PSYtHr3PqEBy
	9qd/Yj0dh9WHmt7XOFad083tiSUlWp69JYSBpTUBzbgJwJ3ZDDRg8ecPIEATo+KT1AzFuwEohQv
	v4N8BVZTIiGly5gzJnap2MjROQrigSv/He/aXrNtF7TvQvBS3mwQFgUI7SkCIii3l4LCZ/d7LM6
	8DcT4AqFswC8tA0Pzf79k3BabYm0U4bs8C02r3RMQMsRsX60F86NibGkJ/phU91wo4UMJ8gn3bt
	c5L36Dc+Itm7TP46Zz//1iFPBHI3dblUYBpZPQxCSX6UQhmggQTgZEiidJ2cKQPtZ+k468A/015
	G7xLNTyn25BI8V51g==
X-Received: by 2002:a05:600c:828a:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-48a98638119mr230594515e9.9.1777986834642;
        Tue, 05 May 2026 06:13:54 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm366599525e9.6.2026.05.05.06.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:54 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 05 May 2026 13:13:03 +0000
Subject: [PATCH v5 6/7] firmware: samsung: acpm: Fix missing LKMM barriers
 in sequence allocator
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-acpm-fixes-sashiko-reports-v5-6-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777986831; l=3932;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=PCWsEmI/WUR42uueqaiei2Cmh0aP35hqHHvduAG7Yz0=;
 b=6xEALCsBvLgFLhQqxJE6EKeqjKKLMRa/BgZwjSGhuyo/8qCLag5h9khWX13dP5jGqQFFSnkGf
 zLyzE9iH3B9AXvc8+kToq57C7FccRBTmsZom4GoFmepT6jQmeA5ZBD1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified memory ordering races in [1].

The ACPM driver uses a globally shared 'bitmap_seqnum' to track
available sequence numbers. Even though threads now strictly free their
own sequence numbers, the allocation and freeing of these bits across
concurrent threads are effectively lockless operations and require
explicit LKMM memory barriers.

Previously, the driver used plain bitwise operators (test_bit, set_bit,
clear_bit), which lack ordering guarantees. This creates two race
conditions on weakly ordered architectures like ARM64:

1. Polling Release Violation: The polling thread copies its payload and
   calls clear_bit(). Without a release barrier, the CPU can reorder
   the memory operations, making the cleared bit globally visible
   before the payload reads have fully completed.
2. TX Acquire Violation: The TX thread loops on test_bit(), calls
   set_bit(), and then wipes the payload buffer via memset(). Without
   an acquire barrier, the CPU can speculatively execute the memset()
   before the bit is safely and formally claimed.

If these reorderings overlap, a new TX thread can claim the sequence
number and overwrite the buffer while the original polling thread is
still actively reading from it.

Fix this by upgrading the bitwise operators. Wrap the TX allocation in
test_and_set_bit_lock() to establish formal LKMM Acquire semantics, and
pair it with clear_bit_unlock() in the polling path to enforce Release
semantics.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 2dea9b7bfe91..fd2e46e9f7e9 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -8,7 +8,7 @@
 #include <asm/barrier.h>
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
-#include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
@@ -344,7 +344,7 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 				acpm_get_saved_rx(achan, xfer, seqnum);
 
 			/* Relinquish ownership of the sequence slot */
-			clear_bit(seqnum - 1, achan->bitmap_seqnum);
+			clear_bit_unlock(seqnum - 1, achan->bitmap_seqnum);
 			return 0;
 		}
 
@@ -401,11 +401,18 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 	struct acpm_rx_data *rx_data;
 	u32 *txd = (u32 *)xfer->txd;
 
-	/* Prevent chan->seqnum from being re-used */
+	/*
+	 * Prevent chan->seqnum from being re-used.
+	 * test_and_set_bit_lock() provides formal LKMM Acquire semantics.
+	 * It pairs with the RX thread's clear_bit_unlock() to ensure the CPU
+	 * does not speculatively execute the rx_data buffer wipe (memset)
+	 * before the sequence number is safely claimed.
+	 */
 	do {
 		if (++achan->seqnum == ACPM_SEQNUM_MAX)
 			achan->seqnum = 1;
-	} while (test_bit(achan->seqnum - 1, achan->bitmap_seqnum));
+		/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
+	} while (test_and_set_bit_lock(achan->seqnum - 1, achan->bitmap_seqnum));
 
 	txd[0] |= FIELD_PREP(ACPM_PROTOCOL_SEQNUM, achan->seqnum);
 
@@ -415,9 +422,6 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;
-
-	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
-	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);
 }
 
 /**

-- 
2.54.0.545.g6539524ca2-goog

