Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550AB2376FD
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 May 2026 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986837; cv=none; b=d9xuKvCXpvrGdlKGhn5ENt0AHCCwJPVLlB7IJaij+yz2z0CmXG/51YGbA2cKcfumnj1QKthx7t0mdVQSSy0vHJXl2IlKTxKdzez9bJox0MCmNrYuIq3A5cGUPUw5Fr7Enc7R9UhmUlikT/qUKDIGoDWuXpB8/la2CFMeNR++HhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986837; c=relaxed/simple;
	bh=wZGIg1WvrcZuYhDQpreZS8xozMJIsonW/o4iqtdaJ6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oiAwf1NbbSIkOhyNWrg7INJaFvD44FzzKDEnSo6XLTSV50Ak7aoTBuju955AB1miBpJQRxr8hyBHLxqfnrvNcRUCfwTeHqpAyLn65KgmYSIiT0oix8ISjUxt+llFkHCot5XwH9DJhjYbzmuDYmbPcW+DUocUJHULKA1Qq5g3X8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XXkWU+aW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXkWU+aW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d77f6092eso3246081f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2026 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777986834; x=1778591634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AFkvwk1yHFeeDLYag5Oi8EMMsCVOXTu0Co6nMK2/h4=;
        b=XXkWU+aW+daHNNqDIsHjJ3uyxbDzWRwtswENztA6dDymG4WzW+n/ZifxLiG+3t7Qh+
         rIOVZoexAMo2HhZNouA5f8Nn3F+d1gnPzgn3qbEAXkbY4ilKIVjoyWWE32SxVcTualRT
         oRPxQlLKyutDpHkLb8fQBTvG1WDdZi1wyDvBsfwPTNra2XrWK+dilMqBUOU77nZM4XEn
         acBBvoLuIl7uPLkjCnLYX3cy4wEtWHl5xfFr1oWShWsCtXQ4aYStAHI7EPxc6EeFurnA
         0A8PjfiAkyhNRJeIsBfzmhjiGr6bV1dVv9cZkHJ4FDw72bB78gKAUzmCGg2duAvMoYb+
         yY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986834; x=1778591634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4AFkvwk1yHFeeDLYag5Oi8EMMsCVOXTu0Co6nMK2/h4=;
        b=ZisVceYLXXuLjdqOOS1z656ojaZmlowEgDoIgO46VGaOuqeCXHyonFA1F1ZPUNQdTo
         xUyPWqIOvBa9N3U5n1P847koz7yuRu/07kzudUwGpxG5l6qPgXQD4LgFM7UsBAcZrcVC
         F+5KA3C19/5P+EywOIgrjChVhBe7czfnG2IrOu7tGPBGvoxvxphY6/WlObchppY/GEw4
         XWCUqpAf4BRGRW3xq71jm2T6VpeX71dDqWYodXOlmJ7sy0F+GjbA4C+Jwsg/DHGEPCwG
         SDwy3ykgrikMQbwLTY8MMpqvDOGy3oRQL02e9S3i1vBIicMgAyz8m7WUw4SG/Jly+Hlc
         kCkg==
X-Forwarded-Encrypted: i=1; AFNElJ8Y0odnQGHok59A/eaEbT2y961yPdnSsgKtXvlv7nkTt7aDu1+S2MQakXh0zn88FiYnyD1elDxnwaOGIHKtCdyM+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYJVMQfYAFOwSDJTu53iif24B/WXb9hGkp5Q/UQoS0YMGlLhsI
	XtTA5ANGhp8L+pw+Yb2Uglc09r05NiEUQeAuunyRcEOlLsGcEOcmG3ec84xiU/otNR8=
X-Gm-Gg: AeBDiesYFmKY+rVEIlFYzBGznA9FD4Kxv+UXc3Q5gMUAkGl7wudFp7pohr398iDvkPC
	k7pnCbWQ8MU9IYJlzT28KUQrwrMiLkdjOgkZNWvXVmZnSbXCujVljlKHA8X3TqIg5gCybmS1H/M
	4JWNgKaBRbQEkKXOCiCwbly39ixmZ61D8B8yI8oz0+7YtD9SDFWokN6pkr6ZWXxTyFbnkmisJQq
	fkyaUMinAQbRV92+H6//pQ0ftJ/WdpXq++r89oOoMOFS396p+RvO9fRyMdzD9cQAc0HrB6vK+Lu
	Iehyw62+Ka8p0w5mDoMeNA2V85+wfKddZbx9B4rM2gpNWvDjv5kL2c2mCgDtv2T7MlWr/X9HqKZ
	Cr5fp39pkfmViylxNb7VCP8VpfAodlYvA25XCFTXDSZumK64PCs+bz88TRhnVwv12k2QxodBGJu
	ZfhqrdA9EdUJqApD9lKmP6Xk04HcXrTtIgC7mo5SNX0dPq/S5UqZCy1MP/Okwm5Xtr8QE8By8lw
	SD4I+4DQUQ4yNR34QFC4gj/iUmx
X-Received: by 2002:a05:600c:5296:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-48d17fe008emr47062135e9.0.1777986833570;
        Tue, 05 May 2026 06:13:53 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm366599525e9.6.2026.05.05.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:53 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 05 May 2026 13:13:01 +0000
Subject: [PATCH v5 4/7] firmware: samsung: acpm: Add memory barrier before
 advancing RX pointer
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-acpm-fixes-sashiko-reports-v5-4-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777986831; l=2113;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=wZGIg1WvrcZuYhDQpreZS8xozMJIsonW/o4iqtdaJ6c=;
 b=vzW22Fo9gyaBKn9uKemzB9qhAaJduQL/9Ushx5qlHjwMWCJOJHUz+8hJn8xmalmTzQus8kfYn
 MCGqMwi9nOYByz3EpsQutQNfFuol5X6gMNNK0rl0Glzn7AHBpqYO299
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified a silent data corruption in [1].

In acpm_get_rx(), the driver reads the response payload from SRAM using
__ioread32_copy() and subsequently updates the hardware RX rear pointer
via writel().

On weakly ordered architectures like ARM64, writel() provides a write
memory barrier (wmb()), which strictly orders prior writes against
subsequent writes. However, it does not order prior reads against
subsequent writes. Consequently, the CPU is permitted to reorder the
writel() store to become globally visible before the payload reads
have completed.

If this reordering occurs, the firmware may observe the updated rear
pointer, assume the queue slot is available, and overwrite the SRAM
payload while the kernel is still actively reading from it, leading
to silent data corruption.

Fix this by inserting a full memory barrier (mb()) before the writel()
to guarantee that all payload reads have completed before the hardware
queue pointer is advanced.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad%40linaro.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 9766425a44ab..a9449bc33bd0 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -5,6 +5,7 @@
  * Copyright 2024 Linaro Ltd.
  */
 
+#include <asm/barrier.h>
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/bits.h>
@@ -278,6 +279,9 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 		i = (i + 1) % achan->qlen;
 	} while (i != rx_front);
 
+	/* Ensure all payload reads complete before advancing the rear pointer */
+	mb();
+
 	/* We saved all responses, mark RX empty. */
 	writel(rx_front, achan->rx.rear);
 

-- 
2.54.0.545.g6539524ca2-goog

