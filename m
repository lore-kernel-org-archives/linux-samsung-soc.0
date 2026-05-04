Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEF039C019
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 May 2026 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889755; cv=none; b=XPLfMYSB1tF3O8mpyNdUyebhajAwnWcDOrECdKv1HxOpz6oljslAqIzrSkoNZqmnY3JThonRmCaFRIDYSBSxOxdaTxjmlmN8R8Ww74f4pbiQuLIGZx7rtftiED53O2W2eXHjQnh/CS1efR/gysOiIncUOpOe1yCtZvSbuDTMrv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889755; c=relaxed/simple;
	bh=fDS0JpnSnl+5Js3iBpG8K3eo2zfUH/0qtj2UHYu+zRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rG1/XYJUm7v26qObcIHnxwnAbGTTPM3DPjGqzv64KclZucC4vXsNVmuXImhmDa6UOle/ikuX8trfzr0Cdlck3XBANVxUBGpu2kXjKb2V2ikki3qWWeZ2iUatVeBGDctYRGvvPiqGjGyYYXvu+NpiT0DKOfJj83YRTT9N1bWSatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ytJPAyHK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ytJPAyHK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so31116315e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2026 03:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889751; x=1778494551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0EVyq5EhiXQLJCeHZ7MP6twyErqWEjaRaq7xPSg8wE=;
        b=ytJPAyHK8wX9XQ1P01wDVXpp/yXfRWBXC2JqnAD9VcpKhiyuRZYgjYJEI+QRbCB3IM
         ZakmrmHzazjcNsp7dbLfRUS8xtAYkbj7vqYCl6346LmthAv/zDo8WxY2sa80BeYeYPrh
         Q0x8tkdHNjEDeU5nZAeH/n80MAG/ttkjY9BTUxSRjpwIJuG7EeV48Jz/4d5ck9QRgzw+
         tP9EKF7qGsWOVrG6Kpk4zsSJ+hL910UXfrWnAllCZjiqaJ1ImaWj8GJ93KPyq/E7q63d
         A+EzpJCBNMEmYHyT1ClCJBlpbAD01h01Irsf9jK1SPLuEl5GfLw+Bc71MdFosOKh+/BC
         VztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889751; x=1778494551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L0EVyq5EhiXQLJCeHZ7MP6twyErqWEjaRaq7xPSg8wE=;
        b=BIAiH1bb2azFWFYTG1pO352GvFrOpDwTZwoIWKL00umhG4FiKvitn+czxd9xHq62dP
         roGhw10gt6tn9E7U5kMFXEd1dcIeI3OG6H1HY/lV2f+CeITXqPrbl5LTXKp0bzxsqpFx
         onBrNbXrcYCOB64aI32PVOq0LxLaXKYinu+OFg30Y7JN/36lx+9TwU5Dd10/hayXuEpV
         qvtNNB3R6vNbLsFLfOJOI3MKugx76LaQAz75PyGcREv51a0TNb6xTXDaxb47ntN+Cf77
         C9JqgsqtKsvQujicntvz77F99ePwnGKGgnBlDCLMZ1Irwhvm1pLDvDCTlpYQznbizCMG
         ol+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/J2ssddFPh3d8ZSCsZzp2gyRCuOiq2gTUwIIkSN7kFbXW8Erz2opuKU/T0ka4Iba7Nej2l6yaSHb2vyjoryBclgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqEh5U04ci/C+KrZc3hPcEYQiPfwBxYhDdPJZUbjslBQadADAK
	Fddfnn18Bpn5OK8Og4g2HlbNYpicfcc2846xx9k6bvUuWHZI4sOaZr/JGx3c2bbSht8=
X-Gm-Gg: AeBDieskNhJQ6f7+iSsP8/IHpXkDuUGnCrKr1rL7ezXxbZ+CQdmzXkyZGZcHLn2FAqe
	G+3aVGxARlr7f+LIYxA6yDyzOMr8zqiIwtP359VYK6tP0E5AB9w8BtacpiyrnAmqJmABmU7fmDV
	xkTQpHYDGU95Pqdgs959Gp3/o+XKQVTDlxdzTUksP4MlM5KIoQrdaN3XKPYfyTTzvBblHer7VL4
	9lcSjRl4R0WcppnoYMlxuVW6CR6yGc8aTl/wvXiCTQtjJa1vkQxIGrF2RDh+J2yQOxXGVaKJcDk
	mJgPYCIUKS7Bi2oOGeoY5LCmQ7n9B2wxhpvILMEA6wkvI7765C/fWqxrsFvb21712boFhaeFKep
	DIXmd5h6CiG5esnRF9MUqiDut5zQdZEEK16fESbttcFW0Qdc8g9UPgM3BaoBZn67c+AQg6EycuW
	K+buE0DScl9HrQ0z6mxImdU0OnpPFF+ofY2s0oNfwp/fj/ir60j/MX3xpHxu6hIOrzsHcE6RHXl
	e7W4BQdmZuiwyYfVg==
X-Received: by 2002:a05:600c:3f06:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-48a9852cc0bmr154515165e9.4.1777889751256;
        Mon, 04 May 2026 03:15:51 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:50 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:50 +0000
Subject: [PATCH v4 7/7] firmware: samsung: acpm: Fix infinite loop on
 sequence number exhaustion
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-7-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=4772;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=fDS0JpnSnl+5Js3iBpG8K3eo2zfUH/0qtj2UHYu+zRQ=;
 b=et8FDig/iX24q+66VwgJtip7dWRrdghXCQvxyY2KUGVWF5Oq9JbEmfl/MKYHq0HlKvtRufdd8
 j9tiPLh/skeDLaQo318hWVNn8p0C8tDZeD642tBjGcnJEULMcw1LtCz
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified a possible infinite loop [1].

ACPM IPC sequence numbers are tracked via a 64-bit bitmap. Previously,
acpm_prepare_xfer() used a do...while loop to search for a free
sequence number.

If all 63 available sequence numbers are leaked due to transient
hardware timeouts or mailbox failures, the bitmap becomes full.
The next call to acpm_prepare_xfer() would enter an infinite loop.

Fix this by utilizing the kernel's optimized bitmap search functions
(find_next_zero_bit / find_first_zero_bit). If the pool is completely
exhausted, log the failure and return -EBUSY to allow the kernel to
fail gracefully instead of hanging.

Furthermore, drop the allocation loop entirely. Because
acpm_prepare_xfer() is strictly called under the 'tx_lock' mutex,
sequence number allocations are perfectly serialized. If
find_next_zero_bit() locates a free bit, a single
test_and_set_bit_lock() is mathematically guaranteed to succeed.

To enforce this locking invariant, wrap the allocation in a
WARN_ON_ONCE. If the atomic set fails, it indicates the driver's
mutex serialization is fundamentally broken. The warning generates a
stack trace for debugging, while returning -EIO immediately aborts the
transfer to prevent silent payload corruption.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 45 +++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 6fc6175b8924..e31a1b616391 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -13,6 +13,7 @@
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/find.h>
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -400,34 +401,48 @@ static int acpm_wait_for_queue_slots(struct acpm_chan *achan, u32 next_tx_front)
  * TX queue.
  * @achan:	ACPM channel info.
  * @xfer:	reference to the transfer being prepared.
+ *
+ * Return: 0 on success, -errno otherwise.
  */
-static void acpm_prepare_xfer(struct acpm_chan *achan,
-			      const struct acpm_xfer *xfer)
+static int acpm_prepare_xfer(struct acpm_chan *achan,
+			     const struct acpm_xfer *xfer)
 {
 	struct acpm_rx_data *rx_data;
 	u32 *txd = (u32 *)xfer->txd;
+	unsigned long size = ACPM_SEQNUM_MAX - 1;
+	unsigned long bit = achan->seqnum;
+
+	bit = find_next_zero_bit(achan->bitmap_seqnum, size, bit);
+	if (bit >= size) {
+		bit = find_first_zero_bit(achan->bitmap_seqnum, size);
+		if (bit >= size) {
+			dev_err_ratelimited(achan->acpm->dev,
+					    "ACPM sequence number pool exhausted\n");
+			return -EBUSY;
+		}
+	}
 
 	/*
-	 * Prevent chan->seqnum from being re-used.
-	 * test_and_set_bit_lock() provides formal LKMM Acquire semantics.
-	 * It pairs with the RX thread's clear_bit_unlock() to ensure the CPU
-	 * does not speculatively execute the rx_data buffer wipe (memset)
-	 * before the sequence number is safely claimed.
+	 * Execute the atomic set to formally claim the bit and establish
+	 * LKMM Acquire semantics against the RX thread's clear_bit_unlock().
+	 * A loop is unnecessary because allocations are strictly serialized
+	 * by tx_lock.
 	 */
-	do {
-		if (++achan->seqnum == ACPM_SEQNUM_MAX)
-			achan->seqnum = 1;
-		/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
-	} while (test_and_set_bit_lock(achan->seqnum - 1, achan->bitmap_seqnum));
+	if (WARN_ON_ONCE(test_and_set_bit_lock(bit, achan->bitmap_seqnum)))
+		return -EIO;
 
+	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
+	achan->seqnum = bit + 1;
 	txd[0] |= FIELD_PREP(ACPM_PROTOCOL_SEQNUM, achan->seqnum);
 
 	/* Clear data for upcoming responses */
-	rx_data = &achan->rx_data[achan->seqnum - 1];
+	rx_data = &achan->rx_data[bit];
 	rx_data->completed = false;
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;
+
+	return 0;
 }
 
 /**
@@ -487,7 +502,9 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 		if (ret)
 			return ret;
 
-		acpm_prepare_xfer(achan, xfer);
+		ret = acpm_prepare_xfer(achan, xfer);
+		if (ret)
+			return ret;
 
 		/* Write TX command. */
 		__iowrite32_copy(achan->tx.base + achan->mlen * tx_front,

-- 
2.54.0.545.g6539524ca2-goog

