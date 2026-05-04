Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CADF39B94D
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 May 2026 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889754; cv=none; b=e/M1zyTOauEK9eNqnoGNuKzd2RjJdTyXV15CWM0wy0eqbMJm3feYuaKtc4zHC6Mmt31tqgr1g+1hbIgAo5g+LnAX7KhARTJhUDWAJz6TqaRl7s0E8hNXgnndgzmx9kIjW9H7BMG5wqW6T+fLDkU0qtizzc0ep/xWx1OppkBhJZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889754; c=relaxed/simple;
	bh=S69mcWVdJW47YZsriq5gOrBQLK0ksV3oXVdlIgpsiSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LavBqYcXnCFfJiVHAnjRtxwpKVCx5zG+HkUp8gYscWNZTOLsLmmHcd4KMF3f4WP1eAKnNf9bjR23Nz14GpNI6YVgrqqkAR2T7KmiuZ5+4b7tPtSj1Tj3qD6rDNZlHN+fQ55rwo4rJasbPJwo4ob65egyPy09676DPWp6bP/KTOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sCOUUjzp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sCOUUjzp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d64313c39so2767321f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2026 03:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889751; x=1778494551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTcuuyPM1STHES+1Gqa4UfN+n+nje0Qh2APGzRVoQg0=;
        b=sCOUUjzpDEB3+xEWZGtObzI7nBL1chkkPZxpkDaPjMa6rlyXFru106GYixchFQ0zJ1
         BV+BRKZ861o+0AciceXHs39sxDTm7sPbGKlqzoVPAG14sk/RIk2bEw/UTtKv4MxL9eBE
         p1Opq3ZL9ME92Bs37AcJywiZ3YSaCUAnFHI+wCXrTQub/sng630TkaryXUpv4+1OQUGL
         CSN1i+lWJOCAM0vuY5B3OO9WhrsWwRm3MyHcvILMwUVnRCx5C6mfSGQc6WBmz0XpxWo3
         qY/maMx3WlfubaNpObgBq7J1OF+Uz1+sQ2aLHblK/8jdKXASRorM/3CXAGeNkYDJX0j6
         XpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889751; x=1778494551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nTcuuyPM1STHES+1Gqa4UfN+n+nje0Qh2APGzRVoQg0=;
        b=WeZrv5UWc36GtBho11Fu3Vdg4lSRKhIgTYf+mb5x4IoA7AtjfOkcsedsp8Csm6AcJm
         Sk2UGbMDOQ93c8tfYgDXxfZZ4XuG8elfznA/uhdJb0UvxokshiS85eHMfk8hMO1y6MFq
         4QsZyuq4HoAYmaCwwlCrXsDHTQk2VK6qbJSqMP4KZvXblMPGtmS9B085z8nmsLAKy83O
         sDOfhhesrgeCNKT0i++jkoUA/y1HNcrz1HzRbxJK6uXVH5lr+NZC2EslioymUIrcxS30
         M2Jor6rD6DJ1DvZqeB+RRcIdMnedC/fjjZvRQj3oee6wudb5R4x+7XgsR+4iZq2RcgjY
         +Uxg==
X-Forwarded-Encrypted: i=1; AFNElJ+aiMcljBS6EuhP7vNrwZCl/i7qQf7INx1VGRnbCRhM63Z5x0wKVgF4JAb+B/ddk7xxwQ8Le9mE5YRmcyj/kW6Zlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIu4ww3JOXNsAd+R3iAtnoqvhP5bF3cCQzhaWBRyh+09jFo9So
	wfVYZPAYOtiC0vxgtlHXU1OoAQV0ECMbezVgk/YTKN/IEBrGUN69jvj+uDwiSomDSxM=
X-Gm-Gg: AeBDievAs9TtKkKJpboF0fju5lta8sdNTygcuguLwgHO0Rp3wXrLSPSJIEAf14U1IV7
	TJ8vhyCpmsp/x09mAf3JgFB6jK7HNgIbsaeT1+xYluOL794Lxc7kq3L8wApvl9n503pkGj0Mln8
	cRQiqF9E5QRDRcAuFaxENxIIc/WqQoEXAasS11V3seODJoKvjmuzSke6TXZelKt/KsJ7DrJw/bn
	TVjs17I+VctEDCynG5QihPOh+fYdiXpAFDXuX7sDZgE2LvfQ65okgZ4nAp58Yk49OlDfcwHbloo
	5/TB4VRtrecPV7TP8rHmKGD8J+SuGBgKSMdL1K/3xP2sxGRcenGJR+wiv1Fxp3lLmWCVw27fncl
	R13kn9PW4duJmYQdexx0JihfgR8KgGlS6m0WJKr5+2DM2quc67tGL6pzrobxaaL8p5O6oHhvUCR
	caAIeGjxi2dDi2E+zyjvGnvA7tYBRtlTOkDNm52mm/gTZBjVNEhUfl+UhuedhG0aUH4h9f7fpmg
	H2jC58UpNzfo6r28w==
X-Received: by 2002:a05:6000:2909:b0:43d:7a08:a5f8 with SMTP id ffacd0b85a97d-44bb716f0c1mr14231907f8f.35.1777889750758;
        Mon, 04 May 2026 03:15:50 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:50 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:49 +0000
Subject: [PATCH v4 6/7] firmware: samsung: acpm: Fix missing LKMM barriers
 in RX and TX paths
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-6-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=4822;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=S69mcWVdJW47YZsriq5gOrBQLK0ksV3oXVdlIgpsiSo=;
 b=aU0EI1Y314zHAtNas0QYLUH/hfpwP3SCJGJfFc2yuOk2ibOlWMkcTfPdNUELSV9TnyxJXuHQO
 XXPyGVIV0+RCdG6SnrRIXTl/fC/wZ0LIKWwb5d/1//ymnkDUo353pBx
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified memory ordering races in [1].

The ACPM driver relies on a globally shared 'bitmap_seqnum' to
synchronize sequence number allocations across the TX and RX lock
domains. The TX thread allocates bits, while the RX thread frees them.

Because these operations cross lock domains, they are effectively
lockless and require explicit memory barriers. Previously, the driver
used plain bitwise operators (test_bit, set_bit, clear_bit), which lack
LKMM ordering guarantees. This creates two severe race conditions on
weakly ordered architectures like ARM64:

1. RX Release Violation: The RX thread reads the response payload and
   calls clear_bit(). Without a release barrier, the CPU can make the
   cleared bit globally visible before the memory reads complete.
2. TX Acquire Violation: The TX thread loops on test_bit() and then
   writes to the payload buffer. Without an acquire barrier, the CPU
   can speculatively execute the buffer wipe (memset) before the
   sequence number is safely claimed.

If these reorderings overlap, a TX thread can overwrite the buffer
while the RX thread is still actively reading from it.

Fix this by upgrading the bitwise operators. Wrap the TX allocation in
test_and_set_bit_lock() to establish formal LKMM Acquire semantics, and
pair it with clear_bit_unlock() in the RX path to enforce Release
semantics.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index ad677962d10b..6fc6175b8924 100644
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
@@ -210,7 +210,12 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 
 	if (rx_seqnum == tx_seqnum) {
 		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
-		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
+		/*
+		 * Enforce release semantics. Ensures the payload memcpy
+		 * completes before the sequence number is globally visible as
+		 * free.
+		 */
+		clear_bit_unlock(rx_seqnum - 1, achan->bitmap_seqnum);
 	}
 }
 
@@ -270,7 +275,8 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 * loop.
 				 */
 				smp_store_release(&rx_data->completed, true);
-				clear_bit(seqnum, achan->bitmap_seqnum);
+				/* Enforce Release semantics for payload reads */
+				clear_bit_unlock(seqnum, achan->bitmap_seqnum);
 			} else {
 				/*
 				 * The RX data corresponds to another request.
@@ -293,7 +299,8 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 			 * Pairs with smp_load_acquire() in polling loop.
 			 */
 			smp_store_release(&rx_data->completed, true);
-			clear_bit(seqnum, achan->bitmap_seqnum);
+			/* Enforce Release semantics when dropping unneeded payloads */
+			clear_bit_unlock(seqnum, achan->bitmap_seqnum);
 		}
 
 		i = (i + 1) % achan->qlen;
@@ -400,11 +407,18 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
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
 
@@ -414,9 +428,6 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
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

