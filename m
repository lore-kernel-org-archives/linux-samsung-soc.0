Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE9C22C324
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742575284; cv=none; b=gR5pkjK/znA7SXUYkJ4jyKwkLRuVCo5hnVBm8pxsl/2eVXXzSFsd/gnGkxiWPdFe+psQ3epdi324PmRyalq/398klNfjb4QZJPdVpghiMqMBoJGmMxvyPPKVPqNgj9hoGqPSuKsIlgEoTD9ffujNoFufuetEnaSowTciLHa/PZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742575284; c=relaxed/simple;
	bh=hWUyFAm/NQQwMKBx9+Vamkc7xZdb1GiT/4B+V0cKFg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UTmyBJ7EeJlDYD9RpODuewrS0HoJRB6/Q+iD2pTQMKuP1lEQW0SBuBaqzpTDMKMTogwFleQxZtB8SnNhYZZOMfQf3PdzgLrbNoiKMYqeKgh11qEVl5V3WHqeNc3sMeSO1VMEK02Cf59Yx6O2jIbXz8ycxn0uWt9jXURyXMovGQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZaZtDSSk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZaZtDSSk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab78e6edb99so337805466b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575280; x=1743180080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/oQ5hD1cA9VD/VPcz8yv6T4aW7gPvF07IV6qUGx1gU8=;
        b=ZaZtDSSky47mc1/J9uXS5+EmHUdREKFWmnwapAGmE85j4yU/pqL3rEQ2AeoqD1Fe0Y
         oDrXnnyehSYk686AhgV+0bdtXNtTckwOfNmAmrB4v13XH6/wrQ8OcCgO0T68TIRLkLW3
         356QtMpM6zPh1SIMSFFoO0HPcS/SG8TmNn0CwgdgeKq4i3GUkaA6dvu1tovB/uhiL6qU
         usFHq6uu5orlxWpf8TPtLKS/hev5Vw6iRkAfCZDxGmsZmBAcEp+m2uCUNFyg8YSlm+r+
         9NM3zAx53vYAiauFQ1hS7jbOHJhDMS7tic4iqYVAKtXgHwivLPcql4UX1CKJoXNPMjih
         u57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575280; x=1743180080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oQ5hD1cA9VD/VPcz8yv6T4aW7gPvF07IV6qUGx1gU8=;
        b=BKuTBFMPWrPnflHi3hoWYOpZlrsb/pN4Cjval0m2mgErKam9JSp4YemusictxLVb5/
         sqSdx4cF76oAmQdcNeVs/jH9jgtmFoli0xa4YCZbu1HEpF99r/FDW+uFntdcNnleUiva
         8TC4iuMY5Wl0txTP9UjNDK0CXqpzmfRAP92b0JydwfOKg3UVlu9UUcYqfDcwflD/qBpK
         m8yLYKHocc0hNo/VxCo7h7+yDzMxAmOJj9fhDlzNayXipl6kn/8GrN+CDNgSoJhys+Jm
         s3QcB0ZcDAN45Tk4mtmBubBKQY+wSWmuf7EUASdCEJWYzf240Q6VL171CcwR/lcQb4xO
         mVDA==
X-Forwarded-Encrypted: i=1; AJvYcCU5oFP7fI/DJ0xE6zXWHo7iIeAyBD3IIDnVhnYQ4otQJ+iZznK7eBZnt1LbTy9/G/JapngX+AucoX7mOPWEZDzxQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjLQ693zlVshSG2AgwmlfsmQb8jqkWx9hGEswH+voKmOVD71W2
	xkN8O04R2M17kWJHTxZL+qY0q7i0zv3+/4I0t4TTXEK8JGM8schdbv8tpIQ7lab28L4t3N6mtMR
	iAUw=
X-Gm-Gg: ASbGnctjOHVekpe+MK6EwbgEJG+hJYCTwkfKVlMyRMJ9EPRh1/MY/jV4zJ/q8Xdx7OP
	M1gbBR91tMV+orgRN+b//yI0sM0Nx9EJKdwVFnmoJ5QVctNdYkAoeZVd+xs7N/u1PfMqoVtvzL6
	nspIvWcHyjq+a2zle3T02O2v/usi89XMIUljbGpjSSOs/k+Z01tH++3/eTSBJsgRLjsYZR67M3P
	65fVxuasjjhv7sV3Bsa6Zk8BVerVO8mevxtRhfUgZ7h536Hl82dOQw6KH9E7CaNgcci916NT5RO
	b3a48IXvDo6ZYe6AfGVJ4i1TMLAZKkuVNMG7lo4+Wa5sgnXxlWT1DcucUsIHTJBIkKd6d4I4RGc
	qqtmVxy+pbMl6XG/Jkn3qzQjaLw3h
X-Google-Smtp-Source: AGHT+IHAwCySYHv7J4LG8oqKj+pJ3kDHG2FjXW74oHg2qd/1H+0+7k4RIohqqkos0sYylQOT2uGzTA==
X-Received: by 2002:a17:907:2d87:b0:ac2:fd70:ddb2 with SMTP id a640c23a62f3a-ac3f2086f35mr381559166b.2.1742575280417;
        Fri, 21 Mar 2025 09:41:20 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbdc78esm184015666b.134.2025.03.21.09.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:41:18 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 21 Mar 2025 16:40:57 +0000
Subject: [PATCH 1/2] firmware: exynos-acpm: use ktime APIs for timeout
 detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-acpm-atomic-v1-1-fb887bde7e61@linaro.org>
References: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
In-Reply-To: <20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

acpm_dequeue_by_polling() uses a loop counter and assumes that each
iteration of the loop takes 20us. It may take longer, though, because
usleep_range() may sleep a different amount.

Switch to using ktime_get() / ktime_after() to detect the timeout
condition more reliably.

This change also makes the code easier to follow and it allows us to
adjust the sleep without having to adjust the loop counter exit
condition. This will come in useful in a follow-up patch that changes
the delays.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..d7ed6b77a957af5db5beba7deecce13ac7b30fd2 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -32,8 +32,7 @@
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
 
-/* The unit of counter is 20 us. 5000 * 20 = 100 ms */
-#define ACPM_POLL_TIMEOUT		5000
+#define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
 #define ACPM_GS101_INITDATA_BASE	0xa000
@@ -284,12 +283,13 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 				   const struct acpm_xfer *xfer)
 {
 	struct device *dev = achan->acpm->dev;
-	unsigned int cnt_20us = 0;
+	ktime_t timeout;
 	u32 seqnum;
 	int ret;
 
 	seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
 
+	timeout = ktime_add_us(ktime_get(), ACPM_POLL_TIMEOUT_US);
 	do {
 		ret = acpm_get_rx(achan, xfer);
 		if (ret)
@@ -300,11 +300,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 
 		/* Determined experimentally. */
 		usleep_range(20, 30);
-		cnt_20us++;
-	} while (cnt_20us < ACPM_POLL_TIMEOUT);
+	} while (!ktime_after(ktime_get(), timeout));
 
-	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx, cnt_20us = %d.\n",
-		achan->id, seqnum, achan->bitmap_seqnum[0], cnt_20us);
+	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",
+		achan->id, seqnum, achan->bitmap_seqnum[0]);
 
 	return -ETIME;
 }

-- 
2.49.0.395.g12beb8f557-goog

