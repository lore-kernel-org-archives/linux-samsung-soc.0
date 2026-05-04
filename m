Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437A439A064
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 May 2026 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889752; cv=none; b=LOBwhcC863cnWYQmzln3Jno8P7oXGQ9fU3lhmCqhbmgl3DOu1kYUePkR2vyNNBHlVD/tW36UYUBYR/9TKFoxwSNcN9CgMxzN0gfmqCjVtl9HCH7qlbU4jYAHYsnFzAxvO6daFnQwjkovj9PrK2tfpUhO8dJIST7s9DlGJy+YIjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889752; c=relaxed/simple;
	bh=wZGIg1WvrcZuYhDQpreZS8xozMJIsonW/o4iqtdaJ6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SP4EScHY1sBtyAL0y1Tq0wlyhRaJ1eDcM6PGoCMQXwstUbZktQiiTFnCph9ow5P4+nqQms0X1GfK2pISyW/6kY08MEEl85kqePioLZ00UoKVcWQy9dc3EWcJR637KsT/o6zoHrez0nAKOEHtE+UGexCkeVkPj80SfuIkcskQBV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YmeEFNYk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YmeEFNYk"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2293441f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2026 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889750; x=1778494550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AFkvwk1yHFeeDLYag5Oi8EMMsCVOXTu0Co6nMK2/h4=;
        b=YmeEFNYkpQ5ZiugV3nwtJOP2UoMso1zydTxoSDFOcOiPwSBJK1A2qgm9oAZKs4y2Su
         Gqdpt5/YOUSDMlua2l8AwgRNQBs8QxynZF4Ctk+svYENr9qcbV5J04wErinafvucUJYM
         fSeTpEeiLZ+oGj2SdCT5C74/UZmIrvxG1eIFAej9LAX9tlxD2mk7QvEIrrdOZpgLX8+W
         ZzEZQwkzpPVdCJ8zY/wYRrP1tfrwyg9CFchN4FYOFlq2JpLIGU+skG4dQ5LT3g49Be2S
         tcttLuf0S2q1k/mm+1+ckdsGc8Jy/O5YKFh2JcC4ib0hQN8rYXk1itSq8dv4Aco3oRHr
         JLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889750; x=1778494550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4AFkvwk1yHFeeDLYag5Oi8EMMsCVOXTu0Co6nMK2/h4=;
        b=MiHXtbf/TRawPoIVDE5HT2yY4bKBQOOczKdcMrvCOWTFoD0+cceSdoeye4EE92eLgy
         OqfGTZ49Ivp0zZR1uU2Z7u1ke4Kzj2KMozxQiitt6d9A/1vi+HSm7smLNqWc+om0rZzq
         a8VAQJAQd4tZlevG/Vr5cAqlZLIcgwtN1Lq2LTZwz5MiVwJq3eGN53+HDKylzNb4w5u1
         BZ0n+mhdeuu7UZVZWO5paWntetBHw86YihYBvOl0hxIxt+IzV+NQ+klqYrA81C2JW5Z0
         e+y9mHwb2UTwH4Hu6KTdxr1iYJE7Nnn7o3MlY9HLlTXBJxiKQBtjzG7imTsOVlryDYun
         WJYg==
X-Forwarded-Encrypted: i=1; AFNElJ/ziCiX6lerJ+H59znzzUER7FroQq8i1PE+55nLD4GF2RMoWGrPKS+NWt84uZEkAikv6kfVEFf6C9kl2IcYTTSa0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCWrffuwVv3rhRiROQTJ0cufPHXAg5lqhDWxXq7cRHTi701K6E
	Gb9aFK+UYNPVMaCC5jgOAhiZuzzrvL3UzK8Ups0ww65DNEK3dcEQlUSTu9THSOK2qN8=
X-Gm-Gg: AeBDievOlerkSNI6s9lTu+uCFEn5yZteoxHK1MckMVg5VKCJb7ueSL6BxQ02bH+7cEC
	4i9VYGMxmOx54+BhrHnAJ+v521BRzyBm65KoQAEE7C/GeZWLOh98h8h5H7sWAtYSQxb8rdazIKh
	k4p0jt1q86SqTMIBBL+XjsSdhzhQUkGfswslNZVF2V2tu0BJ+F3rJxYCox4ukPNXm+Vyt+I3tqu
	q0RApb/a0mAV9+7oNXbM0LGzrLY8rMvHCflv20LmUPv/p2dTgJDNGbgMGXfEzsWSKJfFrK1th1K
	kdb0Ke5dSWGYrAUvOkDgh0M62Qf+qY7U0MK4dr6/xCnRYRphqhwi5RInxpzvCAkBuUuylye0sGB
	LuGHAUduZ1lwHN98//++zvx0nfD8a9Etw2ongrz7uAUyct4CWUWCxtAXdPrDdh+MOPG6Le5HMDb
	2vvXrPtUIOaKmNlI+cfOdQWHlNiH0EpCqMohymyNvWGmCdOEOgT0NpbYAH3J0RlaJRV1jF4gQct
	mHeoohhbcoWbmzTdA==
X-Received: by 2002:a05:6000:2906:b0:44d:4898:7ed9 with SMTP id ffacd0b85a97d-44d489881bbmr8562220f8f.23.1777889749744;
        Mon, 04 May 2026 03:15:49 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:49 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:47 +0000
Subject: [PATCH v4 4/7] firmware: samsung: acpm: Add memory barrier before
 advancing RX pointer
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-4-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=2113;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=wZGIg1WvrcZuYhDQpreZS8xozMJIsonW/o4iqtdaJ6c=;
 b=suLmSOE+T23wbkQEcy8h90SPyQuIK637mI8IZ9Ruc7euPvI2vIZ2kHtS6x9sSzy80sumoELUw
 twf0j7bUtcvCZwZaVcYPk8Znt+FJlyLRxilXSSdTe46SYqdAH2SzCha
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

