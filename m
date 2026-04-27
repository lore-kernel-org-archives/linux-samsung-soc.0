Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DCB3242A4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302260; cv=none; b=Gg1LVinN8zvWEhuoaHIlpMu6I+vjg0VhbyL6SyrQLQv9CoSKj5sHUouqxtYnXSRTRNKcvB+TerNy2cSQxHUU69JlH7RVhr9C8vxq4kvOx5NgmxkutcGADq/oP5v16XVWz5vP8XkYJEZkNYYPuku6wkLkz44M22ekEX5H83WUpRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302260; c=relaxed/simple;
	bh=Ew+fLThVC+dSbzbNb1AU8XHhAhSM9m8r433IWvT/JQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gIy4ABESvE1RGsk9cxKGYxjXKKU+enDBTVDdup4CUx2H0lrIPIyEI/rmoK0Aoa2eWxNVJvysguDdaSAmTN6CF98aSJPJur0JaEvex2yxWPbeWGPs7aHEjiqYhKBDCxjduob5aq/Cax7POGplrXFQyWE0YJO2RGjyjReofYtLurI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N71769j6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N71769j6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so128801725e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302256; x=1777907056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZ7wHKT/b/1jeOqUNO1Le/y2Yble71O6C83Q1O+ta3U=;
        b=N71769j6wVHnXHihmoUacjSEEbz4P5NLhr/wxFHnXXW7cjGdsbcF9/sqdqbTEyY0u0
         MadbvMdVbo6adSOF5RqUcN/N0phbC6OUSC5GFfKtgc8UXwhUn3KTPUvsgT3fjDPz5CBR
         YJQF4Kb/NKximM/Q1SoiEnmlO5guLQZRPpYItE2BGNuMwPxP5JeWc93teJs1UitttB6B
         5ePhFMdPuNVskJrGNHbumXDGBhHjhCW7TGozlkStMXgTVOh5PgFoaEg8g+TDyURrrHuY
         VPBBVubp3jF1az+1sBT0TlLjVD8qn301SJr6m+22i8uDttBm0GzxTZJ5C+Z763Fd22wO
         nxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302256; x=1777907056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RZ7wHKT/b/1jeOqUNO1Le/y2Yble71O6C83Q1O+ta3U=;
        b=oKCf060qZIvWKRTXeUHtyYk52CSVhKAqGUxtndOqKtc9B81GC4nz5aaqE+9uXYaeaN
         rSBSCyI2PnTcSNGSefOv1zdmGOpffAcoYU3hgBD+8r2BSxr7h4YGBmZIQYV9K+9LpMOe
         jAEs3oMIOGjktJZcdUaTy4mADbhtyGgqjkcSOZyfyf5mWqa8CUQFtxl4Mb/WlfYZffto
         mHWb+BBmlcw83gEhE4EqpvB3A2ZItNo7CLA/g/n3mPdSLQXGcsuS7yHl1VGndKt8fVvH
         fHI0flRvFhClGwwwDlMEoySqa5P8o8rt7rpEffBORTRyRbv78jb7SNh0o7ZUItKV1JrZ
         73bw==
X-Forwarded-Encrypted: i=1; AFNElJ8W5A1tmXM8pfZOhIo3UBMkvF5oWvY+p/GrGZR70cJr6KgVf53kc/y9tRm1Blog+I9LrlPXPS5coWpXQR1g5llWCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ApgU+a9rqV/B0+GHVJYF1QubgYiA6i8D8VZngiWoADV0xB1w
	fCJr2DtlG2RROe7QboWDUi5bQJgZXbMtanNSvqjmdodP7pXY2jMUuO/tzA6qM6tL2OI=
X-Gm-Gg: AeBDiesgF6G+qBnjYje++HmXOLpxj4vJmYHCoPNbrVhvqmTqdu2WTAzrUWIVnQ+JZuk
	GsCxLCJ4WjYhaaOv24I/zFRKn3876agdoxDi4SeTt9ovsM/QprSfZygO4F5fFt4WM1sQKsmmYvy
	aRkOaJDLWAy0NLAIQfH5sWDWL29WMQo9fojt3RJI7sZ/GWtKq1AGej5p6EVWLekbsbqkN9ywJCv
	EO56Qek/2SjksGVIIg36L3jeJE8ENbGHPKOBkROFs3BkA88+JJLYCdgkwwZY16T0g14B0GpAlnm
	lndul27zI5w/+GkcKLa8CTF0EvZTdkXfeP6Ig9ujiBkDcqOLEG04mF4DMlVNqKi6J5ut1hRO+8s
	f6E/01pHrvelVq6TLkUMhu1TPFmXWRvzsSsE8Pln9HNBPlZsyoKr+rTX8FkSjYk4RAyo7gkjCzi
	AqRoGcSix83N4dYXjTz/D1w6L1qyXOTsTZxxSKl5EyxfTyJoTFH4BjJRrEb4oQ9pIzY5yILV8LJ
	ttJm720V/h7E/DYZQ==
X-Received: by 2002:a05:600c:6297:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-488fb77155dmr577914705e9.17.1777302256438;
        Mon, 27 Apr 2026 08:04:16 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:15 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 27 Apr 2026 15:04:10 +0000
Subject: [PATCH v2 5/6] firmware: samsung: acpm: Fix out-of-bounds read and
 infinite loop in RX path
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-5-1ff8de94a997@linaro.org>
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=2000;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Ew+fLThVC+dSbzbNb1AU8XHhAhSM9m8r433IWvT/JQk=;
 b=bNdL0A0E7+FoNQEHWtJ8/0fKtqwb636UbTf2X5UWD2LrhRiobr/5jvf4G8NE0a+KNaWY4PLU+
 5i5T2klfbR9CpJBuSWbdOvWAIXalA2MXO7vpbdhquEJVWqHFNX7wee6
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified these bugs in [1].

The ACPM driver reads the rx_front and rx_rear pointers directly from
SRAM and uses them to calculate SRAM offsets and loop termination
conditions.

If a firmware bug writes a value greater than or equal to the queue
length (achan->qlen) at those addresses, two failures occur:

1. Out-of-bounds read: The rear pointer ('i') is used to calculate the
   MMIO address before the modulo operation is applied, leading to an
   immediate out-of-bounds memory access.
2. Infinite loop: The loop iterates using 'i = (i + 1) % achan->qlen'.
   Because 'i' is mathematically capped below qlen, if 'rx_front' is
   greater than or equal to qlen, 'i' will never equal 'rx_front'.
   The CPU will spin forever, holding the rx_lock and deadlocking the
   polling thread.

Protect the kernel by strictly validating the MMIO queue offsets
immediately after reading them.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index c9aa79c2faa4..43658cc1347a 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -230,6 +230,13 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 	rx_front = readl(achan->rx.front);
 	i = readl(achan->rx.rear);
 
+	if (rx_front >= achan->qlen || i >= achan->qlen) {
+		dev_err(achan->acpm->dev,
+			"Invalid RX queue pointers from firmware: front=%u rear=%u qlen=%u\n",
+			rx_front, i, achan->qlen);
+		return -EIO;
+	}
+
 	tx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
 
 	if (i == rx_front) {

-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog

