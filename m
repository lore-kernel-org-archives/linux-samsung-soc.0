Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED0F3CAE94
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965746; cv=pass; b=KPbwbSKOR+dbdfGPFThMIQpL1eDABX/PRKVHickCsJQGFhldqQhXYgM884EBt75s4SeXWH/U1RE/rg5EByE3dmCsGvUWfkVMNLxgYQSnrx6bVNr8bZjCoGVL1COJZYqq3cOf84za/lwCfzBIbYOTU9Wuib9f5h/Mk6oQwPwrsV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965746; c=relaxed/simple;
	bh=ZzeI9Xb98cv+YUFvTK00K5RMj98DUe6FQl4UrKvnXgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APcvVzc6nzeLYe5CGodde9W2znYXRT7oHb9sia16d/OxnElh0au2x4uDgaIvhr8r7Y92UlJx8noZirj0zxEYIyGtUvUm0pNvgPDrzZSexDqqXShpuVPLLqDvJW2/5iAlCpVgRA3/G/p44ZHkt4/RcklTMthCWDJhvY8iV7lVMJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KmMcoUHi; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KmMcoUHi"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-689be822f34so6722463a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 03:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779965741; cv=none;
        d=google.com; s=arc-20240605;
        b=bqIRAYGoH+81q/qTOZQT9CJfchiwlJxXyAkt1hxHwVyTYbBTYwssBAYHdY4SsJMf4k
         UEAAOHBn9orTZ57UZToYwtpBxTQr5Zyh4NxrXN3h78hAo67QAsa8qBBx9bo/SWUk5h7n
         wSflkPghACNkEPdSgplfRuab3ox300OBytMFL9P+3n3Zs6JzCj6VC0gKd9HKSZQAfg4C
         5EIKANh1x0Hg4GTUJuiKo48H0UAg6jZypd3PYALxEHUAuEQSBp2pR3Z42hWnwNe+bTTY
         xshYO+k+zEIc19Zd4Ui2jO6AW2WNzo66KdXb//tqbJw7FfMbgXDu9vTTiqtUErDhv2eH
         U2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d5uo6wkwn+JKE+tD6L/Er2v5SeX7iezWGUT0Vd+Sn2s=;
        fh=p4mxqwgRCTpI4jTEYT09mutUdncxbKZ5ybrNO2zKI2g=;
        b=ZFteV9kNaGx6LayjorPyypwYtfCf3cSx4AUU14cajtbUwtHGmT1+O+DMmSLHAys/D6
         tot5h44Cxxqdk88TwvvgQvAolPg+a1ZVQdYIg0HUQmO3CNy9H2QNutw0nqucHcM12BUf
         H57Bg8jaVYE0/AyIqXdeMdHEQf6Lo8KNsrkX63A6B4hfaMSrXmpO7qNp6K3lrSYkrlCX
         EtgQnG7sfNARh1sqAI+cNKlBHjXIy6OY7K8DzYVG6jIUdoRYaPE4vvHNOJc33NO8bbdE
         rfmiYOayGcsHigIWq6RP+ravWpZrp/GHxbEgGwn2E70qrqXKVb/tRbtZSccXVKj19p7L
         sALA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779965741; x=1780570541; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d5uo6wkwn+JKE+tD6L/Er2v5SeX7iezWGUT0Vd+Sn2s=;
        b=KmMcoUHidoChVHzpSEYmrjJeAaS9rAMiMDq/WY3+raWd50uHiwRRebuIV0/w2DDhKK
         yMqmeMDcuZ3i4j/CLip0uNcOPYWkB3uXS1q3rXhcSdHsomOAIkHjIp1AVbuaeje30deM
         pB9ErHO4wHybEfeKvOcjy7B4qHhVy/BeSyFcWl6CP2LXT0VEyemATUgNrHcxa2cZVKXL
         6X+P0jZC61B4c/7pjyGQd31bKzNJY3A/JX6iKalWcCm335ZAt+OFubqaxE/MxDAKo9O0
         qE8NHToqVw+eVogoBZSttvUI4i4e4UOI5D5uSAI9jmEfh4mv8lViMDRi7acbI+x2ULDf
         uBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779965741; x=1780570541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5uo6wkwn+JKE+tD6L/Er2v5SeX7iezWGUT0Vd+Sn2s=;
        b=sp58jvCMnYsXY0hEYkWPBcF2HlmvMTEL/gHnXDYClbuw24XPatzrMiAqQqeKeibYna
         vBpONW88QHzczxDyUrkdxwPuwkGChY+9muvWpGzRHlsR0PD+QU5gH9DSOisJ9sUxXEMB
         XuNp+tXZPDfjiWKssJh8k4i6qqFLirloQyXu2evBvsS4zZB7h04IEXVp9f0p1y90CJzh
         5UwOGD9euc83j95fHBx0qrTBVHZhO3erp8YdqjLN+07NC6kCGn6YtFpt2zDHS6Zo2+sV
         63xUGrzJ2tvDwO/p8pjcQ8dFM5YcUZZBOvhmzQAKSxIzwUIBS7MbqledVxQTaZk47lqg
         v2Ug==
X-Forwarded-Encrypted: i=1; AFNElJ/oGclM7zzpeULrgTOmvltugNh4qaYplgmhpwXQGF34zdtYsDDwXSJcBABr/M15ON+41mpqasovvCecBNNNbexyzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuw9bWOAGf2ev/fzIcEYBJmLwVTqM6WTwnJj/1qDUgGb08rX5f
	Aj1LhigS390/Up+925iR6EcF444Ij8UkZUqMEhw8iz1J9kC47sMYsHCJSvP6/H1VxKucQcx50F7
	xGdBLNgluhr7GIZ7mdXEtbgU2mk75sQDCOTc1ZZwXQw==
X-Gm-Gg: Acq92OEs41BAHtMVNmVgvkgL05QQUtbCMPTEGBvdS2vAnRohkZ1r77tASWuVFnaDPxI
	QmT/9VajDAs4SXJdykcKwkLIk2e4cFPgu/rz/2qquI3jYFzhtn2NB3KF6yi/J4HiTBgS08i7IwF
	K2jTwoxWNRWwiAKlExoxdUPIr+MoNUmJ9DDlWi9OmdO2Ih6xg+9HIL4+L5CeSqtj9PCT9rvWUJd
	NcbabVYnp8aO7XLHnaO84b4x6xXIeWsf8BLVMQISXPTtfGavg9Zl4AgcXD5itz8LcUbNTIRwRe/
	Y7BZpcU4XqMFv2BF7tk1OGMc0b1VhPSwcciiMT9VStaQaLZZopCM
X-Received: by 2002:a05:6402:354c:b0:681:5b59:648a with SMTP id
 4fb4d7f45d1cf-6889c4412dcmr16690059a12.11.1779965741591; Thu, 28 May 2026
 03:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527194525.45762-1-arnd@kernel.org>
In-Reply-To: <20260527194525.45762-1-arnd@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 May 2026 11:55:30 +0100
X-Gm-Features: AVHnY4Ix0Hmm_eG6_V7iRj-xJ3NfAcKZMBspXlN6j33nPsnkEIVRn4_MuHlGmIA
Message-ID: <CADrjBPp55hZmkJMa3Lz3h=K0ZOBS-k4BY1=EmgtSYfqeCbJg0g@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix size_t format string
To: Arnd Bergmann <arnd@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 May 2026 at 20:45, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The exynos_gem->base.size argument is a size_t rather than an
> unsigned long, so adapt the printk() format string accordingly:
>
> In file included from drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
> drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc_buf':
> drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: error: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
>    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
>       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    70 |                         (unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
>       |                                                              ~~~~~~~~~~~~~~~~~~~~~
>       |                                                                              |
>       |                                                                              size_t {aka unsigned int}
>
> The dma_addr in the same line is already printed using a cast
> to unsigned long, so change that similarly to use the correct
> %pad format.
>
> Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
