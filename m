Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB4F19D891
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2025 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742895974; cv=none; b=KqE/D31bHjBY22J2tI2SxPFmSqLQp/mCtTmgW+/DStNajTBaX/hJfTBUXUnRDKBBbN0+DY0j9FS2hjDqvwcljcMh5qTi5PoAaJHSZCoCAn9c/8h3Tswtvc1JJe2/bOUVaadfwmuM6TH0eiR6wDuLX+CM8xlM6jNftsAZUFA8+d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742895974; c=relaxed/simple;
	bh=ojat30aOqgXxfHLW0VMctCxg1ctIURlE5otCHR4gGXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZl/t3urP6BN2jevFjKDfO/AmwpaCHY1WGf/bp/7bmkGsHoYivGShqwb3UZ1GSjeTK5NW9MNMRIKEgDJqoTWM0St3ExSm29N3wmkQw4u+WrseVHw3Ck0DBvRPguA4D2SY7wk0o797QbNXFSnfj3+mKzYYP/Zd/h2irRRbppXI/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Px6WGxeM; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Px6WGxeM"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso9798987a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2025 02:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742895970; x=1743500770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22F3uA1pFjUSsqH5uZTrmsJjR2r2mTgeguTTuS3Ky1o=;
        b=Px6WGxeMhXQBMSLGq1wFAABogETJ1BkQauAhD8XTDq5jNw52XZ9s+BhfrchA3w+93v
         MOSK4fsrXQWMDBar2h1Xwi9PPWKimAai78el+cPxtKXoEtjK2b5c92FX204N14RzfV54
         CgN2u28mEf1k3/5ZfhygR23viIWCO/hSMydYkdJutB/rdE5hjTc0I+xQ3SIDek+gmXVJ
         j3P48UG5Ikg3/psVBn4G8RW3g24DzNqjPbPTk4abzuTFzopF0Zn3X7p0CAjGAMz5SJKl
         XJ/CGH7i7ivmVvzaQYqFZB0luVNWzBFuQk98146Qh0vp4v8zgoOsv6XDuqnegSbu9ibr
         Dyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742895970; x=1743500770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22F3uA1pFjUSsqH5uZTrmsJjR2r2mTgeguTTuS3Ky1o=;
        b=OIz3y/LO8dp+wTawrRSuPxN9t7X172Xhj8Ma+sVvWMIXbtCpmrpatwlJb5Fqm7uOot
         Nta2U5RQ47xDXFXfvybrZGI+tdRwbh5FwwD85S9LZGLEL91mWO2+BioCluHq0twMl+d9
         E0d9TF/RGyqPSna3fU5tH9sU3JDAN6fMyiWVKPxy1WL2BkCgfqjbUuNYXOFZfbIGIvMr
         lNI4Ix1x/NYP7maXMDMpTu6GdY6es2NNfaOt6KtMWXvPwQOkL054HBzz8c6YUukR+0Qr
         8mYMs+bqdsJBM0eHnRX17eLjiQXdeU6KkmNTCyseUFQ9Uh7jcoAX5yTNRr4JDU92GFT+
         dS6A==
X-Forwarded-Encrypted: i=1; AJvYcCWtrf6Trc+/+UhCjJAEOjyJxkq4Od3IZWIsfO4yH5F3xM6H3rfEIGHoeVvHq/sq6aiEklfgGEZ4PVNrHiJj3LQZ8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHii8BJUWOGXpVjPSfROv/SirQvcV8kssfrOaUxHi0BhbDzcx0
	y1KtqDcgPx2mLiXhibfx0uDkAASA8+O3UmD2hs81zQ6uM9cuDafDWex7VlW6294=
X-Gm-Gg: ASbGnctObh0Fk+8lpyAR9k3Pmkh3pd8NyN+k0pG3zs2IESRDitGshoGk/upAPPRQvQf
	UOgjplPyuxhugLbjy41yjkHhXOGhmwp4R5hCBJ34zC1h6t2c+u7asULL7l9WxFHXl+EGMXkZe5l
	dOtx2U4s/uF/od8X+GqiM5WMsyLvqij57aYHluRTuNAnGyey/p/H8uCmQVqsOreMERbtttjgTN8
	K0Q/84M89EWG+AXbKs1IgGJZLUiVw+Zf5/ja3tSHpPVnFkBlxpqPgiIRsAZQDf8N1DjqrvSh5OD
	2nt1H/DM9AJ7m3uz4e/xvWmck4r5+8CfjpQkBe8MqPRBVdewLIaLW7NlI2pG+ciWLcyo9FGgFSR
	HvvI4KQ4EQtQOCJIPzwY4NohEQ7aK
X-Google-Smtp-Source: AGHT+IHxghepagNA7JYR+0kzFqQK/51FZuRNjy/iCwlqs4UQAA4cdYxiEkKhK4hN7ohtA8n2bEJxNg==
X-Received: by 2002:a17:907:bb4b:b0:ac1:e14a:19d6 with SMTP id a640c23a62f3a-ac3f1e494e8mr1615547566b.0.1742895970048;
        Tue, 25 Mar 2025 02:46:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e509dsm832834566b.68.2025.03.25.02.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 02:46:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 25 Mar 2025 09:46:07 +0000
Subject: [PATCH v3 1/2] firmware: exynos-acpm: use ktime APIs for timeout
 detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-acpm-atomic-v3-1-c66aae7df925@linaro.org>
References: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
In-Reply-To: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
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

Switch to using ktime_get() / ktime_before() to detect the timeout
condition more reliably.

This change also makes the code easier to follow and it allows us to
adjust the sleep if necessary, without having to adjust the loop
counter exit condition.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* slightly reword commit message due to updated patch 2/2

v2:
* add missing ktime.h
* ktime_before() instead of !ktime_after() (Tudor)
---
 drivers/firmware/samsung/exynos-acpm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..542eaff03f9e39422a8c5345ca75e05c1710a9ee 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -15,6 +15,7 @@
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/ktime.h>
 #include <linux/mailbox/exynos-message.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
@@ -32,8 +33,7 @@
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
 
-/* The unit of counter is 20 us. 5000 * 20 = 100 ms */
-#define ACPM_POLL_TIMEOUT		5000
+#define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
 #define ACPM_GS101_INITDATA_BASE	0xa000
@@ -284,12 +284,13 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
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
@@ -300,11 +301,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 
 		/* Determined experimentally. */
 		usleep_range(20, 30);
-		cnt_20us++;
-	} while (cnt_20us < ACPM_POLL_TIMEOUT);
+	} while (ktime_before(ktime_get(), timeout));
 
-	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx, cnt_20us = %d.\n",
-		achan->id, seqnum, achan->bitmap_seqnum[0], cnt_20us);
+	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",
+		achan->id, seqnum, achan->bitmap_seqnum[0]);
 
 	return -ETIME;
 }

-- 
2.49.0.395.g12beb8f557-goog

