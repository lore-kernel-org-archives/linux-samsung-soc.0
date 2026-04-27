Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E30324B1F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302263; cv=none; b=In0H2tXwjfAJjaMvNps4df3Ddqsyn2pD9JtiVNvRrLdwY4ohoThsvaFu9wvPEIjUUwhHexoKWPSmYRc3SfM84lWyRfHWvJagHlFXwZp3c++Mm5VDz2dJ37DgQxYfYd3TdyG3uImCd9EuBtQuCMBwxk/Hoo7tbC0ru94IbvbtIyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302263; c=relaxed/simple;
	bh=Pfox4HTiotQewHotJo3sawpHHhi3T/+sCUyRrpfeAbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SS3iqyRFQmVMaR18ecxGx3PezSLs5L11RqRDVbfWB5uJLKJ6+dtm0c7tSYnLFYlTJKStQWl3W6lt+EsS+V6QmQJyhQfGvbQrUouL0dIW0HKLShW6mrjyKXH7SfZVcEVtm6HDPK8gXYeJ3DRPSx/rxslo5TX8tsjGkXPyasOMBbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lW5S+Vkd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lW5S+Vkd"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso54444805e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302258; x=1777907058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jr9BfdzOzeMntv3lCO5f0JbSt8ePeb2CrWVw6p0+VLk=;
        b=lW5S+VkdqWcsNUOYc4hnbsvTcyl/hYSh5XS2pZyuy0+gmDBQ+9h0Wy4JtO/V3d5AlZ
         6BNsQHaxfkvIBFWiW99i3O4CU6VwaZXoTd1ZFIvkMh6S8jX/GJB5/Tzzc6SZU6/qn/1R
         Twgr6Bngm6fVnfyf5eRKfYE/PNhS5WlvoKwMWT1rQBygjo1XlCXPT75PwBfbJa/gD2RZ
         m9gO4Q/3dEdgel4kDSXHxGyMCbT+/FmxciThq7gVDeoBrKVV3X69qGbv4wqPxh+CHDCB
         u2WVyDCaRd2Oewmg3IH6idpB1+vo2wprX8yFtuvEgMa0KKMtGM7EI1vKYlP4QYWF1TU6
         HNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302258; x=1777907058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jr9BfdzOzeMntv3lCO5f0JbSt8ePeb2CrWVw6p0+VLk=;
        b=DTiT6yENtENvyXBYzgL0qr2pWFVNRTWbW065k6/tj2b056ANMNqB6p3QlCbV6LvjH7
         hKNeCXrZ07zgYJNC/Xkr24igfySI6W3CamwO1Ygjkb7WGq3ngDSyvdNa2CNh8tcw006e
         Gq4JyuA/BwY6R3yT48qx5GoZ4h6HJx5M+laD4c+DOZu4+U+8VC18SNZZHFMxDoL6ZjnZ
         9COHFC0BBY/kn7b8hLb1x+3jWd0vetBBf8uSLF38oEG1nEREsPgsLUhWJWsNko5gnUsw
         r8EsYSLeuqypkyPDAj+JlGuyrOvsGDUcs3J0UcEd4flDZbOhmE2/5bcF8RmcKiDw3Thv
         63cA==
X-Forwarded-Encrypted: i=1; AFNElJ9Sum9ce2dBGXuu0pEOumksRYvqRI8kopjig0K2ilZbnw8nWK6rjyIzlBfD36XzgCCxbayrh98lfPsI8V+pAVw/Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMIZvqQunK98uZICtuIIdBCwSvBSxk39xSx+DdYtfq6LZ//DPk
	ZcJRVEw7mh0n7+LEoH+wZgcb6N5SxWu6Kx9TB/msph/cPy+dtQeJkPFKh4hArcXKF9U=
X-Gm-Gg: AeBDieu9KInvaNUNI2HKjeLmJSbf046GoiD0E+z6AvOiUIPdgLWP3fKE2aUyJ1hA4xD
	tkeuZ820HOa2SYSFOndV6f3m7Ezj0sq1S/xyLY1STkWUm2oiFC1tiLn8AFJqfdSxavLwzzs+hUF
	kT+WJf07l3xMI1tHR43uL26ZJpehJkmJKmdp6XWyQund/a9STNrNQYrHmQF1PYGKRgB7DheBSaL
	xEfU2aRPTGbBDg9CBkmW/aBsQYbTckL1cn0mF0uz/I1S1Nyz7yrKp1vsab/aIbsSXFB2PT5QfYi
	dY7TQt40ddjfG12Ft3XifvHChayeZqmLcGiDVbr8xnymQ1564uOm6zNpyKjSbdaNnSstIHY7KNM
	uQrcLYV7Isr/QMnVmsp5c9CDftuedL0V38AzCB8GFgVWMEyFjh7Wzj1rc7FuMclgO4GNrPkgkt1
	crsuvKccmxUsGL3T2pIjd10HEPweWZOh39VyAjAqCXWEcVthZln6jw/wRDX5Noo4zj69LhxUZQz
	FLfi5LVnIeW1yf8F1ZlrvsV3CDR
X-Received: by 2002:a05:600c:a31a:b0:488:b239:77ec with SMTP id 5b1f17b1804b1-488fb778db4mr483500285e9.17.1777302257796;
        Mon, 27 Apr 2026 08:04:17 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:16 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 27 Apr 2026 15:04:11 +0000
Subject: [PATCH v2 6/6] firmware: samsung: acpm: Fix infinite loop on
 sequence number exhaustion
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-6-1ff8de94a997@linaro.org>
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=3632;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Pfox4HTiotQewHotJo3sawpHHhi3T/+sCUyRrpfeAbg=;
 b=T6uQ5V1I+QLmMDgHILxHzE6K8w70UcBWioqloz5BhgvWQGhSMPzxfAy0AkhHfQG2ZamvcXx8a
 Q2H+pFf3/J+D/OWHe0FvWpxr8FO1X0YQ9t6yJrretsDXP2JmLZ/djhx
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

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 36 +++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 43658cc1347a..f086084202fb 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -12,6 +12,7 @@
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/find.h>
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -370,29 +371,40 @@ static int acpm_wait_for_queue_slots(struct acpm_chan *achan, u32 next_tx_front)
  * TX queue.
  * @achan:	ACPM channel info.
  * @xfer:	reference to the transfer being prepared.
+ *
+ * Return: 0 on success, -EBUSY if the sequence number pool is exhausted.
  */
-static void acpm_prepare_xfer(struct acpm_chan *achan,
-			      const struct acpm_xfer *xfer)
+static int acpm_prepare_xfer(struct acpm_chan *achan,
+			     const struct acpm_xfer *xfer)
 {
 	struct acpm_rx_data *rx_data;
 	u32 *txd = (u32 *)xfer->txd;
+	unsigned long size = ACPM_SEQNUM_MAX - 1;
+	unsigned long bit;
+
+	bit = find_next_zero_bit(achan->bitmap_seqnum, size, achan->seqnum);
+	if (bit >= size) {
+		bit = find_first_zero_bit(achan->bitmap_seqnum, size);
+		if (bit >= size) {
+			dev_err_ratelimited(achan->acpm->dev,
+					    "ACPM sequence number pool exhausted\n");
+			return -EBUSY;
+		}
+	}
 
-	/* Prevent chan->seqnum from being re-used */
-	do {
-		if (++achan->seqnum == ACPM_SEQNUM_MAX)
-			achan->seqnum = 1;
-	} while (test_bit(achan->seqnum - 1, achan->bitmap_seqnum));
+	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
+	achan->seqnum = bit + 1;
+	set_bit(bit, achan->bitmap_seqnum);
 
 	txd[0] |= FIELD_PREP(ACPM_PROTOCOL_SEQNUM, achan->seqnum);
 
 	/* Clear data for upcoming responses */
-	rx_data = &achan->rx_data[achan->seqnum - 1];
+	rx_data = &achan->rx_data[bit];
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;
 
-	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
-	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);
+	return 0;
 }
 
 /**
@@ -452,7 +464,9 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 		if (ret)
 			return ret;
 
-		acpm_prepare_xfer(achan, xfer);
+		ret = acpm_prepare_xfer(achan, xfer);
+		if (ret)
+			return ret;
 
 		/* Write TX command. */
 		__iowrite32_copy(achan->tx.base + achan->mlen * tx_front,

-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog

