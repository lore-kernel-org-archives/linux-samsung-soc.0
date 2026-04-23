Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F4B317715
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953952; cv=none; b=gFbJzpdxuRSbgOpGlfqwf6DbCAqRV73zdvOoveKqpsbrFZb/ZCfxC6zllmtbhg+Rhcrav+u1AFUallAGvSAUSYlvqfeooaDRyyqF1oNTLtB1/ncHqW0KNUBJx9M45NKVquJ2uSB2K6iEkp2eASYNLzZHGEAJ4rn8bHNAGzZc2b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953952; c=relaxed/simple;
	bh=VTtVl0TWCNfgfLbp5ijesyzVwlK/9w/oJ2E+cqfjm08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dVAnzxNJg4S87jlI/wv4UWvm8o6E5FY5qRNIVyOYEX6UnemUPQ9UzTKP5PioVhoweoyE/k/RijrJUy+p7DBouiq7GjBYJqR5mOa6wQVNFIG+akY5kAfyxDw6oPP8qX+pZIEEw7QDvlfkoFqd7TPf7hQi7MhdiUbvmUlepiNHhl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wgofPDmD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wgofPDmD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so5340179f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776953949; x=1777558749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tpkzzua20tAlQ0uvVtVJePBkUzc26KvQoLCnhghAYSc=;
        b=wgofPDmDy+Oejp5qEq5Lsec7Z/BYdEaTK1eUvKo9E+UWTwQK1Z143HA7+E8ObgdkMh
         xU374ou7r+34Vzqg0s80H33C4lYXxcPnVNNgJ2qIrwdcOtHKJGp5ZATqJ94JdzZD2i4B
         apB2Lf4HtraReBL71qKoqDDfrjD2pSkcfTEuOxNVy2ZS/8R1EnakrZaxjFSyAgNISXs8
         F+oq8t+bhD1As/2jhF6H70gUQVbCZ1NMn/Mg0xOrtHAO7wwGX5AwH5C0RCss9pRz9W2h
         7dqFvKJ6Odger0Vc+YVW9lnBlODckx9SAjMGb0OkOMH7KnIlIKeqty95nDsEi+bZsD6r
         4R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953949; x=1777558749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tpkzzua20tAlQ0uvVtVJePBkUzc26KvQoLCnhghAYSc=;
        b=D/3kTMTMWCZgRp0JzJ2ConRuhFgjTId/z/075mCxw7dlN7CRL/HcXIN2BHkx1S8vli
         OR8x5EcIcvt6GucsWcFO5sJaUhlpmlgE8UslN4U1Cyfh6aYHpyKAqHaTSheWPIGOfRAB
         /CGJ7X3yP1Smt2zfIdA6IfB1wV/UTx3a3Etcmn2U+8aHai8AdLmuxTUX85RYuQIWJnmF
         xTz5PU/D4ZH/i6OJXeeiTSyGn9NvVHEFJN8Ef4U2E32Fyc10xl9p0FjHOfF8zfZXb5RB
         oDIOCTF1GhU+KD8qwp9MltxSPiEmWdAL7DxQ3ikIkw6cHS4TY59onMQSq4gTYCJUh5rB
         yUHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sMy1DG8P/p67Jq+lufKPU2j76dUjFni6Xuz9RhBTnLUHQMhXBzB0GsGNaJohVXQfxlQsBBnavzyY2Nfs33Su0qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWlbpy5Oc68BEzbsx3JOwcBGJf3lfR/XxB7tmPpUkrrOylKu5J
	ZFqeoNiYVl2+c/iepxUi8EBla/hWwvyjUC6UXx8t+kMppIJLUOE9FgN2KCl9Nq+S8lQ=
X-Gm-Gg: AeBDietfTf+rQ/HnrYjHUUHWs5JuQuvfyHlUzzz6phSZLSE1YKPooH2ly70O6iz+N4j
	G3Jt2YK7Po+F2OneJBZyM6L8kjNL4/BYN6iyVf5QNSKunYiqc6VxdLcQygaEtRScU3246/fnmjW
	PB5FjKYKHl2dzAz88RXGizg6PaZXwrTvwTca2f40++UTfL8wkjNlxb/X0ZmVofjQWoFgeGR8xYo
	TKgf+Tfp19SsoPBuRW+gdAEfyJeW5gdXwZ9BcVOPibjksQot47dILwHRUDp0jc41zRqHCXglwHc
	qmK3/9swGaLOCelyfa1k4TVU5TV63KLv7ahqJOzmtsQAfOrWzJXJ0p88UmoEUoyPCx/JnFqLVrJ
	qZRoTu+7X5/KfBYkgm81V+sfk4wq4wCAYQhKBsJ28SIu8UqAQEbWtj9uXVK0pGfy9uZODNZCxLp
	x+xZucdZWqJGM5mlLY46NsdewM+SLhZL/EqkstBJ5s0PTMSulpcwsgDtEYzEg93ApJKEZhKbgEz
	fu6Ro0LWu/CZSmtzw==
X-Received: by 2002:a05:6000:2511:b0:43c:f3ef:ee36 with SMTP id ffacd0b85a97d-43fe3e0a460mr42116126f8f.33.1776953949040;
        Thu, 23 Apr 2026 07:19:09 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm51107483f8f.31.2026.04.23.07.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:19:08 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 14:19:06 +0000
Subject: [PATCH 2/4] firmware: samsung: acpm: Fix sequence number leak and
 infinite loop
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-fixes-sashiko-reports-v1-2-2217b790925e@linaro.org>
References: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
In-Reply-To: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776953946; l=2635;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=VTtVl0TWCNfgfLbp5ijesyzVwlK/9w/oJ2E+cqfjm08=;
 b=DYOtC6hQ0ucn9EaI7t93WN6xfszysLjwGSxnLnt8/zLOQRojSUpaUAulT4yyaGqqznnu6d/eb
 IAZVKMnj/bSAiKaA92rMrcQ3twPuFvC4hYcAzccEMqK1+YuZ1KzxgbP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified a sequence number leak and a possible infinite loop
[1].

ACPM IPC sequence numbers are tracked via a 64-bit bitmap
(`bitmap_seqnum`) to manage concurrent transactions. A bit is set when
a sequence number is allocated in `acpm_prepare_xfer()`.

Previously, if a transfer timed out during RX polling, or if the
underlying hardware mailbox failed to send the message via
`mbox_send_message()`, the allocated sequence number bit was never
cleared.

As these transient errors accumulate, all 63 available sequence numbers
could eventually be leaked. Once the bitmap is full, the next call to
`acpm_prepare_xfer()` would enter an infinite `while` loop attempting
to find a free sequence number, permanently deadlocking the CPU.

Fix this by ensuring the sequence number bit is explicitly cleared on
all error paths:
1. In `acpm_do_xfer()`, clear the bit if the mailbox transmission
   fails.
2. In `acpm_dequeue_by_polling()`, clear the bit if the queue read fails
   or if the response times out.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e95edc350efa..a9baed5762d5 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -311,8 +311,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 	timeout = ktime_add_us(ktime_get(), ACPM_POLL_TIMEOUT_US);
 	do {
 		ret = acpm_get_rx(achan, xfer);
-		if (ret)
+		if (ret) {
+			clear_bit(seqnum - 1, achan->bitmap_seqnum);
 			return ret;
+		}
 
 		if (!test_bit(seqnum - 1, achan->bitmap_seqnum))
 			return 0;
@@ -324,6 +326,8 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",
 		achan->id, seqnum, achan->bitmap_seqnum[0]);
 
+	clear_bit(seqnum - 1, achan->bitmap_seqnum);
+
 	return -ETIME;
 }
 
@@ -455,8 +459,10 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 		writel(idx, achan->tx.front);
 
 		ret = mbox_send_message(achan->chan, (void *)&msg);
-		if (ret < 0)
+		if (ret < 0) {
+			clear_bit(achan->seqnum - 1, achan->bitmap_seqnum);
 			return ret;
+		}
 
 		mbox_client_txdone(achan->chan, 0);
 	}

-- 
2.54.0.545.g6539524ca2-goog

