Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8393242A4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 15:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302256; cv=none; b=ugeHnWgU2BlhyUGOYlR0gTIysuX3ddbW1I7OIKLtglzOD0hnJYAoRNmuXqNJjNyqPoAJt9XWvSWTQ2neToPmaN1UZvl7vbouDppWuG5DzlUbl5Wa38wE0cQg/kmksaftImrPEXbTyUDLAQhBZhILiML34dEihh4C5rZ4rw+Y2Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302256; c=relaxed/simple;
	bh=Ba+dTVUBhKnEfFMyTWML1d2ClIcN7W0bbbcIFyIYV0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nuTS14MyngNUjRlmBkjCk8QEdmm3a5vTr4njjAlbfvczVL/1JL7RPw2mkgXRHhPdP29co/rTqe3sgvEkrelsgh2g8fLDyQsf8bMhcNB8tONyef/UIp33LbVIuMEJEwlLWqOB429B2MVEtNE5ptMD/OlCwEDKdtWsgyp79dvrqGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=afgIxeEs; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="afgIxeEs"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so6736854f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 08:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302253; x=1777907053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th+fTKGfuo6huv0uM66BibBdeXURX3Gjx4cjUN6LP74=;
        b=afgIxeEstITQJMJ6gENwrk3sK6SxAbqZawE65ujqjjxYitWrkP6igePZ6I8x3BdUDm
         8ZExyyPOq5m5WxZ2FhPqO3gxIEEVJnIfOUbBDS5WgSPdo0rD07uBJNS5oi4Ci9nI0nRL
         RpAuTf68Af8YksvnXUpU7ziDKBg7gurNonTGAnlr1xtClQnhEuRQqRYtkZ/AJkbBPOw8
         7iMyEBuW4QxK0qnDvgF9jLy/VGNUJpNu57TyPSFKVTU0ZRK97JRCHJIucDnjPIRFy4UR
         3823vF2fOesV/875scsUHhl5b063JMCkTrrEcOYx7kU3JUcknznExK4gU7zEi3HokidP
         l+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302253; x=1777907053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=th+fTKGfuo6huv0uM66BibBdeXURX3Gjx4cjUN6LP74=;
        b=T/50Za92vd00lovC+uFwvW+U16ivq3THmR6oUnZGbBkp1QbzZIOuMA8ZSV/E9OvSom
         0tMGi0JGlc4oKug65dLAxJFyphR9ZYcnxXFHnWc+lUkYzOn0cYO1Wwlg0ZvtWxk2mRUw
         wQkDufJnvNXcXgydF3iSoy2wJwQDd+caMikNDpmSlO8YOnuMksRU9urmTqEb8hs7U7Vd
         r+B0bvBdzUVY+DjxmpdFq5v2cZpjwU8ov9+JlIZobAu0zu9kHfGUrqXp/O27M2qsWFHX
         Itg6q8PnCe8LH6JacL+5YqPT5pg5pchkZzQyKhGJ09wqwysVGzkkxeuVvh39NY4i+alK
         W5lg==
X-Forwarded-Encrypted: i=1; AFNElJ+VW2VwiXJvyIZHyVqpmkRUwSoUHrcRXz7Sk853Lo3L5QYKi3eILQGYzBAdBGjdicyNpijSjhnv6QcDo1cXRNPRng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo7g3luYjBcrXyFa08F9M5g1vs2WEjeTYm3Zm4YETmZW0lgnSe
	0uLkOGe0ksG+OhneuTv2mACA2JMLE46WinUnLzwlbJnw9/evrMni4mEJNGUxwGp0DZI=
X-Gm-Gg: AeBDiesYMM0/AhCMameFaaN7oy5HJQjYoL8hi3Atu6214mghbYiZ8RnF6QMxQI48naY
	3Ls7XhVvm29BND5UoR4MhJPejZmdu42NIrTySYuRYtbWJYDOiPuVrVAUEbwmBKqFmuprZ9kngJI
	JNxf5vWCKX7pCAO+zOmKAUqi61LkYYtRCjfB0EwU6WAO8qWfF/gmH06DbM6EAY87SpJ517nm/Ib
	Gl1MEjjKBrkJt0yyErg57F2UBw9MH3KUpRlsnRXPfMDp82Cbqu1DWcldGe2S5axdvZo+qkbbtDF
	nFbRU4LFVyYHy/bpO8pKSafUEk9dWDCE/NMTe4U7La25dra5Soiv8htkiQVtVZGd2J/M+NWS+wN
	yBPWCVDGgp1JHRjT1dXVd/ZHckrUBUUWsVOrofh+yoHkOrqLPLPNSdvkVhqM+WiO6Y4SMakHXaR
	mshmMejDAgblbypfo22kTpjr+teZTIa2MP59yrXjqKZU/JsdlSxPLE4Guwo9njh88aOeZv8muZq
	ynRTOG6jBE9Sil75g==
X-Received: by 2002:a05:600c:5295:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-488fb780463mr598840525e9.22.1777302252912;
        Mon, 27 Apr 2026 08:04:12 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:11 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 27 Apr 2026 15:04:07 +0000
Subject: [PATCH v2 2/6] firmware: samsung: acpm: Fix mailbox channel leak
 on probe error
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-2-1ff8de94a997@linaro.org>
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=2357;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Ba+dTVUBhKnEfFMyTWML1d2ClIcN7W0bbbcIFyIYV0Y=;
 b=+4DHqrrOrGVH6m6Wr5Ur7SY6SyVl3EwK2I9IlGtYy5oHdPr9Pl50/6Hc5kvjbRc6gNH+qLFVB
 ynehG37WZSHCZr4+uQEBK/+nnABGuiJG/bdVGw9ezePZ9tunC9qr/lM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified the leak at [1].

The ACPM driver allocates hardware mailbox channels using
`mbox_request_channel()` during `acpm_channels_init()`. However, the
driver lacked a `.remove` callback and did not free these channels on
subsequent error paths inside `acpm_probe()`.

Additionally, if `acpm_achan_alloc_cmds()` failed during the channel
initialization loop, the function returned immediately, bypassing the
manual cleanup and permanently leaking any channels successfully
requested in previous loop iterations.

Fix this by modifying `acpm_free_mbox_chans()` to match the `devres`
action signature and registering it via `devm_add_action_or_reset()`.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e95edc350efa..bd0d48e9d157 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -529,8 +529,9 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
  * acpm_free_mbox_chans() - free mailbox channels.
  * @acpm:	pointer to driver data.
  */
-static void acpm_free_mbox_chans(struct acpm_info *acpm)
+static void acpm_free_mbox_chans(void *data)
 {
+	struct acpm_info *acpm = data;
 	int i;
 
 	for (i = 0; i < acpm->num_chans; i++)
@@ -558,6 +559,10 @@ static int acpm_channels_init(struct acpm_info *acpm)
 	if (!acpm->chans)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(dev, acpm_free_mbox_chans, acpm);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add mbox free action.\n");
+
 	chans_shmem = acpm->sram_base + readl(&shmem->chans);
 
 	for (i = 0; i < acpm->num_chans; i++) {
@@ -579,10 +584,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
 		cl->dev = dev;
 
 		achan->chan = mbox_request_channel(cl, 0);
-		if (IS_ERR(achan->chan)) {
-			acpm_free_mbox_chans(acpm);
+		if (IS_ERR(achan->chan))
 			return PTR_ERR(achan->chan);
-		}
 	}
 
 	return 0;

-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog

