Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659D2346AED
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Aug 2026 12:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846835; cv=pass; b=Ej7PSvXROohjHuiVUwldUoYygBV+3Uk25jrrfYbFs0EdJFYT5gFtZm6A6ZiCvvvI2h4nM/Ruaqm4fe4si/cjYULWmKbB3Rb9TGvRtFDQ+ksvJeOMMiEXW5/YgmXaZow2zXYBPQBS2KAKanYzp2Lm02mv2MosyP5DQOowYin8pQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846835; c=relaxed/simple;
	bh=IBuhooViAZsSl5tNScG0EXhj9Y0b4obTPLkC51mt4ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARrqEyMsoKThyfo/odvmIXJOGVKFpI9SPQSJZ7uUdTtPOSAyYJnMyzQcQmUZ6YseKXsAipMnr+d/6lBHulqCf6Hg4xoGFPkl1kb5n13PJSpIKmqTwnz40O8S/7N499Xm0Wz/rOrRUnmDAs4eP1RLCPCThMqKjOZ74IEOy5vAPxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vv0VVUjG; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vv0VVUjG"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a18180so5705720a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Aug 2026 05:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785846831; cv=none;
        d=google.com; s=arc-20260327;
        b=EO0xOdS0v3ey0c9T75J1VZJhI2xIkUv3cJumUsH0eu4zmcwYNidbgbE8sPePhjaLyB
         G2AeIoGbuB+B3iL8iVEuF5AgCj/YspyKqC503ckId+3yhoJ3D+A+YxIEiPt2mrWrG082
         FIKbWr7q8MnJbHq3dk6+wIBDIghJ2/EzcK70jo+lqAsKyHHvenV7OvUew3kj5UeiBi/4
         3p/7nuOG78qAEEUU1eGtm8qlHrIHjZ0RmHF12Yn+bk3MLTaEqe1puG7Yyw3DUAl/nobH
         TtPPk7bzCBdYOigGMD52w6lO6v6qIqQrqGouvd9OV7pGwg7n+KyuJ1EVVE5QXcKrRYRa
         5TCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HxBuSuUOsN3xcHdKVMUU11HrTG94kQJTqxpKG7QuLAE=;
        fh=lxpQRSX86/o0D5hnLKJfJpOlKcKqQIpO4XGLP2GCun4=;
        b=RqAFaP9Eb6ef9WvWxFIBQ6RtAtwyzjSKcCcnPd4jRfzliBmuo7lsEUd9X5FKDSKgU8
         VSfPGeDu/WkjXd7EloYfv370jSvnfWSj/YiNRPa/2vkPe0osZVLHR19Y3ygZova/mKL0
         Wj9GlRQ0R5riwhxjq+pvlbGIQlUO2+uGQ6ZKG5/poV82XmYyCvAeDfWycO1qk7tv63UV
         jxm0rKhRhP55tjrD++volP+Jg45Va69dETetiqAqn8WduaTUEoTxHu02irIpGssTIl1W
         Bj3Hzs3BIt3Aq5eIZDHrcDyJ1OnGp5brbSMa0In241EB4bHy5n2DZvNaj8G5xKETF3ar
         EhnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785846831; x=1786451631; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxBuSuUOsN3xcHdKVMUU11HrTG94kQJTqxpKG7QuLAE=;
        b=vv0VVUjGsARLJwmLIE/TBiLY/Ug9TG2ANp75oWPHKdSmLfWGDodQHR2TlssFYLdFmk
         oHOsEV9LsqOzGQmX5pCFI9qoy4uBkbWhUnWr7pkfCSrTxbnMoKrJ/BTrwix5VbR03h2p
         1V2Htuf9U62GajkE0h1Tzi0O1oajlsa5DKzrVEc7pBE5zI3JJZ3EmdW6kw6rUUssRR6J
         OZ93W75Rle4mxl3rgguS8y3T7IM7RKTtIu1bCrPq/6YL/mJTzbU5hNdKo4n8fVfnLYtc
         YgP4Q9cDAxMHDhTEE3/SHUEclHm75NHM8ddKu752VO+vKgt1KGcfBOG/D41K9pgjatX+
         SniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846831; x=1786451631;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HxBuSuUOsN3xcHdKVMUU11HrTG94kQJTqxpKG7QuLAE=;
        b=eu96bC4vYTPUDzKNLJHPkrBaYwBqdFAddjigiw4QiK+A7BFrl9J3bu9LMRL3cbDZeA
         Alfwkdiy1FZApYhLufETzOPJZrLfkmPop/s2WiB0uyJk/RQWklqd1qMnzSZyAWMkXuWW
         AMyL4LCCw/cOfrLvmCJ5IBUGEY591RxEYmC3RN+Mcd+vUme3PhA1slR2R4FmJ7+Nlsu2
         Sv6gYqvJCxzNbVj2ZmN4/lCRO89u9FgASvXGnzApymsenVWAFOxWDBHJ4uvd5bxeWm/B
         kOjygdYOnnRUtHDxI021IUB9REi176O0dELCrY0uEyyAyuuALHTcjumjYG/I3pdM4g18
         7/7w==
X-Forwarded-Encrypted: i=1; AHgh+Ro0sxmfWn+gtLhW4UBwXOLIEMqhM91I/JDk2Xp3nb3Te49W03qWc6nNU76hKOHXvrFVAjVxSzLTqayAyperVpyvmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA8WKwJySbO3dygoZYu65mm2hq9bzSWekgaywzAV0smD7XMzYU
	2f69U5O4BvDXKOBCAOAEjrhDvyutFHwcFAVrcJghzESMUlOa7dQ/8sJA7qPNtG067Um/IIxpcvd
	/SMCm2jGii3vgoNHlmphBNS3cPFU3bzWONJCVEVLr/Q==
X-Gm-Gg: AR+sD10Emg/WRfm8UjVr5F4BXs+MGaqSNlncxLxS4bR+bDGuzEA5giCfHHNwcJlf5op
	0Zj5HcAdMh+fTHpWZVSQyvaRxi7H59q3DBfmNpdPhwNdaznzll50ZYa4KoVHmm+uEMYqkijp42O
	3BJlOvufLVDA9GfjTlH/zK8eytZinST9v1x82P7jUME5bp21k8hOFIu8iMY/n9J/tC3558dmLF6
	qGFL422PnO+SCnDOkoZouK7BvBTWXcmGMy/3QmEfddWO+GxP6csnxj/QJHrcaQYpaNg6raaIzUJ
	PGCB79vCK0rBmaX+Edfp9z+vS9OsinFjom+noJ7bOeNXdsGDh+894zx7QVRY/UTVvlwFT7fuVai
	7fc0=
X-Received: by 2002:a05:6402:a6ca:20b0:6a0:dda3:83db with SMTP id
 4fb4d7f45d1cf-6a0dda38483mr5803047a12.0.1785846831292; Tue, 04 Aug 2026
 05:33:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803135322.2898247-1-wenst@chromium.org>
In-Reply-To: <20260803135322.2898247-1-wenst@chromium.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:33:39 +0100
X-Gm-Features: AUfX_myS2cidHM43LBbhd8UVPlKcCVWzzAL3r2Xg4qgdaYQLg0tQthlf_dnS1Jc
Message-ID: <CADrjBPqVOTqfj6Xx6LMvnrVS8-gxrwh=-_XevD56Nf+ypSNhAg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos/gem: Drop extra "0x" prefix in front of "%pad" format
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Aug 2026 at 15:28, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> The recent size_t format string fix for exynos DRM driver left the "0x"
> prefix in front of "%pad" format around. Since the pointer format output
> already provides "0x" prefix, this ends up adding an extra prefix.
>
> Drop the redundant "0x" prefix".
>
> Fixes: 3470274dca48 ("drm/exynos: fix size_t format string")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 0208c9259572..acb8def747de 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -80,7 +80,7 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
>                 return;
>         }
>
> -       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
> +       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
>                           &exynos_gem->dma_addr, exynos_gem->base.size);
>
>         dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
> --
> 2.55.0.571.g244d577d93-goog
>
>
