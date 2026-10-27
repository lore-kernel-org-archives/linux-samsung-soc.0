Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118154;
	b=i2/RKloS8tzDwKaUl+ERW/U3dHeiRkxlwH2jUU05fm615eszEeU67BO0UQthLvYsY/Sa
	 F8OV20NtLWcLfpQnxTiVqCXGICqLWTjt2KSGTZKMUKkK0S0ab9s9CWBfSpqINx1qNP5wE
	 a7Ipr7n3ROZBrRIUVfs0oojak32BDlg6XQs/LJNpNgi4r5SqAo9C4FD2Mi1Q5vgCgId/+
	 Q+K/S3hqg2z2+7maxX/HgFfQn1DET8jwzqfaX6/AGA74UGg9xCNU/V5GKXRJrOEleFSVO
	 TmkF5H1Lh4qqh4KJ7gAdT2v9ZOE7lCtcTQR4OUGNyLL5vkk3xnfQFIsUssUTU76M3jQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
	b=j1rdkH12WZfKBr4kSRRB0MPun75sbDX6BH2p/GTNxl9iDdx4kjSP0yOOO0pyLgqsUuce
	 Ud2RVmNz3LQg4kY/VgorM4KiORsMuACgQuJ5UqbdmdLgY2zQ52xosBVGZpUKkL8O856MA
	 iDe82dg36TybTrqVwqGkFbdrQaN27fAj0ijEcZ7467KM08lfBLbF/DsPe1QGwOI2u5Ni9
	 lNdL8inkV8m3xJCA/Ys8MoKvQq4BscXxJp6nwjT5fY1h9n64GolUuHlqThWMFdtyp+zb7
	 6/ppgYdWvpep+yC71LW+asns/oykgEQGH0hxxLzPg6QkppwCjnePzlrO/o8NsX+XcjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1iQHa5S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B68606A31B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 16:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B68606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1iQHa5S
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b06c0794cfso37847307b3.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 09:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118153; cv=none;
        d=google.com; s=arc-20260327;
        b=i8EDz4h8ZcX9Bv1S7CHE5U5JrqqS+mcDc0/32lUHCdK6+E5xoEljVEbpqt8hfHba18
         bYssJvyO2LIivxmGnIKp4Ya5iZY4sZhW7UIYxRtsyVhL1nNBSMJD1T8MSqZGEBKO1Py2
         TXgu1sk4Po73JpeLFHTQNM8/2VQVB/UI+rJA3m8Qsc6W4ysPhXZ/Q0TI/5Disdxsq8Xg
         Q3ltC0Ig2+XwH0/arbEYsMQT6v8C1IVYKmlzuzZT5R+8tt7GqOB9J+jwgNvRBXaGPWeV
         Cnkeyg5zrkdxVj7IzJxYFoS6oPUYqARYXhE5yXOp2NKCrF/IPAWFb25o2ikKQl+GPWik
         9zfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
        fh=dlCkGlInoYDOgPxqcIWuuPo8ktzlgLq7BxVtVg/bYUo=;
        b=Ty3ZAHpHsyWeIDCdQpKXfXEysON54Mz6vaTZT9f7tmFYz+1+eNiuJrTtICbAYslKo3
         PsEDHnVqJf/d8MwteMrF+OMLF+2BrRbrCZJ6gBNNdZ5/CL26U5cd2Og+LA38o69SreTA
         u1W8woU5AZJmOgqfehmWtD2/KJ2gjY2DM20a/NQktgRKcxqxP+BW+S+5cWgrQt722Pv9
         a11Dsn6avEixL+LmN/5/1vq5vMabn6S2TY3XFvuYLCo3ucgDAOy8bU64LAIV+hB4IDAu
         Ns+cDCG00iNooXOcPTy/tfZnLqAwnG7YiTY66IMe91D8mg/9j4fBPE5EarqX1PeB52TD
         2Vcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118153; x=1793722953; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
        b=W1iQHa5SX/Qc+pJyHgnzeP49i7n4MyoEA1Sg3k4vdH/8WuPlX0on9nVDrySw3Zna8i
         VmAyaK3ohLRAwCwDkIuGUhl6lFASHb9v/c6ua/hWP4ZnWIS4Pg/QPxL+h/j2+M/ph6tF
         1vS3HMQklRX7SsooBGhCqQgqAsP87LL1H8P0aiSVUl4bKJTDy8l9YqnJ0x5Ec1X5CdbS
         J+/smu1iGC4WhXJMXPInRtuGzDFJObu3iEpaPAiN+VC9nv1zNGfLCEZH1FiQpKqwIiPf
         VWeWPMWfSjW129zws8g4m5xGzmWq5KHVcVk+cQtM/DXfJbdUlA+dhI85l6M9pPu5/00F
         GlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118153; x=1793722953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
        b=vWGt1pTbLUm5rfFNHMX68hwPryaFTwigXloBJ3/7+AgqIEw3LpdiJQx9pfMsebvayL
         ov40hE7S6gle4cPNYVMz8irUb6FfYljQMwxo4/Zxcbl/swRhTGI59fpDH2P49b52Ni/2
         BWWrAq2elr8C6Xh1RLbATJzxj5X9gaAdJ45rGGdZDYTAACFopc//8vD43wljdMb3f2UL
         ANO94Jv+OFM5Y+9vSZqOK19C2D4IxhvCHQ0taDwhpP83fV7eiZD1ic2FUU1ihJy/WJ0L
         38SUQzRbzO1BHdsPIP3Pd2FkkDZfk5mMMBA24d31XjYiGXttswbLSGfYh5ej1+QpaZyy
         e9YA==
X-Forwarded-Encrypted: i=1; AKwUvByev7hxXKy8yhrAnRnOUO+w8mhL5za0zu/EJyV0HpsEF7bdt9QwE6J9VOB6S4EwivWr3NkI/9xvkzuWjeMrsJyRSg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLJgsCYmzQU6NH/Liu5YFdj8ee1zCoFwx9ZFwtZApjP1KAhSTyN
	55wcsiDoZuwVzK3U2D2DwY6jCmOwDMLLcdTO1w/0emGTbrek4d7eu2+E+U5sFOmI9oS2FUpNyq/
	50ZJqn8f3u9CR8ZLca1c9Afl4jS/Z53E=
X-Gm-Gg: AYBFou03/2EBWxJDnnn4OjLgB+oLnu1A6vuHhSGCZd/pppsRPbibIcyCqmwITCumw8r
	RAYxEFOQnUnsRPJuA2Il6AOWsF1h/j5qquN/Pud4HwgbD/+C5YMBD1vgUbMd+yVK2X+e7yRytNd
	ty8Hg3lqEKCzPnhp/8FNg2qFq3sqgiC6WN8QqBM7HUVb/eIyXE0zroP453P22PBxEMd1wlIfTn4
	hS8JKbrvE6Er14MrHQvbkJtLJ+CrhXSU39ARnqdSGORRNtjtAeYzbNGm2dEiBc5Msve4my9Olht
	Izw5mzu4keLuW/n+U+Em/IZqv3rNB0VqAusMrNYRf5/nP0yyZmi4ubWXd8aebZwEW9YX59kAYeY
	tVBdkSqCNSCuJNnl7dOWYVpzfD8fvzTSIi1O7
X-Received: by 2002:a05:690c:dd6:b0:8b0:cee8:53cf with SMTP id
 00721157ae682-8b1669cb374mr84387667b3.3.1793118152555; Tue, 27 Oct 2026
 09:22:32 -0700 (PDT)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027145313.136305-1-lgs201920130244@gmail.com> <f7d242b6-a401-4ea0-bfac-e988f1497bc0@kernel.org>
In-Reply-To: <f7d242b6-a401-4ea0-bfac-e988f1497bc0@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:22:22 +0800
X-Gm-Features: AclHuK9WhSZ_5Xj4ee9jEQ2X-wRviwNJD5dHM2yTu5byUlkX8Eudsa4g1RS5X-w
Message-ID: <CANUHTR_RYcMEOTevXWRF2iS83oNDc4pXqsbBZKLV7QbSUeYh=A@mail.gmail.com>
Subject: Re: [PATCH] media: exynos4-is: fix DMA memory double free
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 27 Oct 2026 at 23:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/10/2026 15:53, Guangshuo Li wrote:
> > fimc_is_alloc_cpu_memory() frees the coherent DMA buffer when its
> > DMA address does not satisfy the firmware alignment requirement,
> > but leaves is->memory.vaddr non-NULL.
> >
> > Because firmware loading is asynchronous, this error path may run
> > after probe has returned successfully. A later remove can then
> > attempt to free the same DMA allocation again.
> >
> > Set is->memory.vaddr to NULL after freeing the buffer so the
> > existing NULL check in fimc_is_free_cpu_memory() skips the
> > already-freed allocation.
> >
> > This issue was found by our static analysis tool under development.
> >
> > Fixes: db47622c13ae ("media: platform: exynos4-is: remove all references to physical addresses")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
>
> More of postings by bot ignoring any feedback.
>
> Best regards,
> Krzysztof

Thank you for your feedback, and I apologize if our recent submissions
gave the impression that we were ignoring your previous comments.

We did take your earlier suggestions into account and subsequently
submitted a patch series accordingly.

For the more recent patches, however, since they address issues in
different drivers, we thought it would be more appropriate to submit
them separately rather than group them into a single series.

We certainly did not intend to disregard your feedback. We appreciate
your time and guidance, and we will be more careful with our future
submissions.

Thank you for your understanding.

Best regards,
Guangshuo Li
