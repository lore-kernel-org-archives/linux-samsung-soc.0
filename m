Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2802B35B645
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063743; cv=pass; b=J8XtHy5t/ZA94ZRv/W1XVvczZUj5rVm77T13D0m4tormBwSZTYX/lDYi9Sb/EPv0em0CA/6ubV1KuY/jxJ7seuzspNiyw6nUT417xe5snGM4X1Z/Yp0etKkJ4QmQC7uPTg/kPl7jojPM3638GPNbYGbw0dlKcgV8XdOS2FAo3sM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063743; c=relaxed/simple;
	bh=j4cujlAIKOz/in38oyKHb4PSqXGHVuyQz4LKsTI2JXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJhaeZBWzUr6+z2v1LDYmGTruSq675GsScB27x6ijhoBwUeTBGcKj/GfgYLO2bKlCgGl6xgji/1hOQ1KBI7oq8Chk1nJucDYoGcr8A7EtuainZx4oRfi7wMgSZMvxOm+Xw0gqu3ag3hXo9UjDgUj7LK3cqShVa3qRY5++5Sx/9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJAfmiq6; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJAfmiq6"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5753a289955so4833089e0c.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 07:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780063741; cv=none;
        d=google.com; s=arc-20240605;
        b=UQK81+cc9uAoMHxH/jz6UM7wVrtbJPSJkMgGwf1f+3Q/8tBQDI2ESB7vsINprLKZoE
         BJ4Vm9I6ONoxB9YXpRic+xfHYhroZjEmlGCMw1BVL3+5A6wFcLgtZ0dzmVnof97vhqhx
         KuwFnrlrNleEK4MmrC17d268clyUd8K49GanUaujHItVDoTLRe0pdIBmW5A74wcwViaF
         2AJVfdiOVCLRX9puLTRlMo3ZbsQsdh+OT3bzORObVDPT/xQeW3VPCn1jE6phWwKLsmBW
         Pz7wB6CzNRDCSvkFqqvcMxHDKe60UzNkrNUTfzKY2OF30GmofXBZEuR48bhQrLtIEhDU
         ce/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKQQSeQjkRReUr6YFC2bWAXDEPfRaFYHezUzVYoDBqw=;
        fh=ju942IcYX2L54jGZ2CySnvB9xF+lyZCw/6nQqxOJZuM=;
        b=eyI55I2cqwVVTPOC1AJwgc00yK/EGV7ZSC5UcLsjob8X05uCzk1gdUk72pAotCv3tv
         MY0TSsvghsErtvv6pEDDkyS/E4v3q8z5Of2V2bkh6V4HlDWdHlh/jh+KUwEw3vtFLEAn
         XSVQazBOLBMrUYsr2mTgn8GKP4G2ucUFP4quU/fXidPPNwuYNYLAtbkuBnZa+Qq56P/c
         eQ5RO4tO1J+jLzidYO79eX1zizuk2vGcTbBY5GsCsE9OVR453k6LrzVG1Hs/BZswdncx
         MWQheS9pOI6UDjN89mpIvKq5UmoQ/aeB9iXLPlZRNewdl8QuwH6vXg/BrU8xzaH6L3Fh
         JZFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063741; x=1780668541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKQQSeQjkRReUr6YFC2bWAXDEPfRaFYHezUzVYoDBqw=;
        b=bJAfmiq6xx7PHCxX1bXAuZrYa9cGphDvbVoCrGF2LS2o22jQxYwIXnNZlGDSGm841E
         xgj8684OKK9ISaEPtfW35eyurqVu6Fw4kN0Hd8OwG9QgPhIyQpKAJJ5zcuYEFCPXqyrI
         Bgw4xB1B2CnWZUvIHUk2W6tSXaK00xlmWAdQPG7zQwmLVzhTIEQix4yRj4xJzHqvAXCJ
         7ZZrIYzazphymagPKdrXVnQp16wMAsX0p6Ftph6q/tbrFKlMVkovsVAQ34XoQm+oSm2B
         wvzo/kIy2TuzSI4MjPf9zFgTlbt+Os03bQY8ERVkdsdUMPymGdn8zMXxzoyXAJDdFsTv
         45JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063741; x=1780668541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FKQQSeQjkRReUr6YFC2bWAXDEPfRaFYHezUzVYoDBqw=;
        b=mWNeHYUybEiZnbcM7uium5wayrjqYrTMErfdXffcfMl3qA7c1as03xenZQY+GNLSPM
         MwgsCoZAN3G2rzS1BLcQ36MWGKp/aDtX9MUePhTxDGsHuMz2fFVLW8tDI/uD1Sk574ko
         rhIrVW0civHrr+Kumdk/Nqy7Kg/Oy/EFVJfZLV/iM4/tq97XQH+AA74PuQRPBqWg/C2m
         iZFuvpX8JoZlPoPD4HpBLFPc0Phqzlj4sK0aAQBoa/hzurAf6+8rijCGrYIBiicBpPTL
         Qal8jGbHbQZmtpygP9hYnThOjZqVex00Ptn8nk24c1tAcAtvRfr2qosqHkSQ4b8aV+Ef
         4AmA==
X-Forwarded-Encrypted: i=1; AFNElJ8/RMYft/M2+4RJfmwejwLSXq/g+hqcIx54LV1BNX0xsPOF+Fra4xLRgFPJvORVabB/yJ7HHgtIkjMwR+q8r5JiTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQUd5NeBAV6ZBUOp7rKqvBGSisyo9Vbi3IDO3DWc4SATP+EN3p
	3u1YOxZki/8BQwLc+ukw2L6Wm8cMyUYPUyabt/7IzkmxjrDumx7BkH/OquM0EvALOnu28bn1139
	gOfNuo8vUFLmbBU9P+vXrLIGIeZzPMKE=
X-Gm-Gg: Acq92OEgSLnt9HXkfGDamA4yuq8HLTlEx2TsQ3DOcB74ETJcEmE7ul/VIkD+GBaM/M7
	z3QVslnLwZpeccNU/N5Lvbimj/APn/kBVFN+MYQg/z+hv2nNExjuxn17+4DLnxzOSf1VWqkv20d
	f+vP29tFuraKwgt4/2OqK5I7rXy/srUSJURQKSoJ/6KGG8MMnP18qAtfwxjM2PdCLGhDI2rkarl
	9Nv9NccFZpxiosagyJDTqiUSonlnuUbBdKrMijr+D3i+9bxV8y79hFnJg440KfODLOW1s4I7IQP
	BNhLUU4sUqXg32FewkOA9kNTQP6RYsKmfKsdt3N5JgE5dnrsFiqFS/C7YII=
X-Received: by 2002:a05:6122:3102:b0:56c:ce8a:b07a with SMTP id
 71dfb90a1353d-599f2482c7emr1099623e0c.7.1780063740711; Fri, 29 May 2026
 07:09:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521143624.56906-1-inki.dae@samsung.com> <CAPM=9twLzSJh-rHpNf-JOPBmzFnFevc6v-gu6kWfLCTPeyWLFQ@mail.gmail.com>
 <ahfv4Ox5mFZ5TPCi@phenom.ffwll.local>
In-Reply-To: <ahfv4Ox5mFZ5TPCi@phenom.ffwll.local>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 29 May 2026 23:08:24 +0900
X-Gm-Features: AVHnY4J6q80BjsvOs3e02zPCftWZaBjf3RrxpMJFV7vnSDrj-oxU7SK2s6bFheM
Message-ID: <CAAQKjZOpVCh==G8H7RUpGKDiU2hOdtoz+f-HfC3zwVbTBAbayQ@mail.gmail.com>
Subject: Re: [GIT PULL] exynos-drm-next
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>, airlied@linux.ie, daniel@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 5=EC=9B=94 28=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 4:34, S=
imona Vetter <simona.vetter@ffwll.ch>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue, May 26, 2026 at 11:01:07AM +1000, Dave Airlie wrote:
> > On Fri, 22 May 2026 at 00:36, Inki Dae <inki.dae@samsung.com> wrote:
> > >
> > > Hi Dave and Daniel,
> > >
> > >     This PR brings a cleanup and modernization series for Exynos DRM,
> > >     focused on fbdev emulation and DMA/GEM internals.
> > >
> > > Major changes are:
> > >     - migrate fbdev allocation to DRM client buffers,
> > >     - switch fbdev geometry calculations to DRM format helpers with t=
ighter checks,
> > >     - fix screen_buffer handling to match fb_info semantics,
> > >     - adopt DRM core DMA tracking and remove redundant Exynos-side co=
de.
> > >
> > > Please kindly let me know if there is any problem.
> >
> > Hi Inki,
> >
> > In file included from
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_ge=
m.c:16:
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_ge=
m.c:
> > In function =E2=80=98exynos_drm_alloc_buf=E2=80=99:
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_ge=
m.c:69:49:
> > warning: format =E2=80=98%lx=E2=80=99 expects argument of type =E2=80=
=98long unsigned int=E2=80=99,
> > but argument 6 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned=
 int=E2=80=99} [-Wformat=3D]
> >    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev),
> > "dma_addr(0x%lx), size(0x%lx)\n",
> >       |
> > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    70 |                         (unsigned long)exynos_gem->dma_addr,
> > exynos_gem->base.size);
> >       |
> > ~~~~~~~~~~~~~~~~~~~~~
> >       |
> >               |
> >       |
> >               size_t {aka unsigned int}
> > /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:563:39:
> > note: in definition of macro =E2=80=98drm_dev_dbg=E2=80=99
> >   563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
> >       |                                       ^~~
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_ge=
m.c:69:9:
> > note: in expansion of macro =E2=80=98DRM_DEV_DEBUG_KMS=E2=80=99
> >    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev),
> > "dma_addr(0x%lx), size(0x%lx)\n",
> >       |         ^~~~~~~~~~~~~~~~~
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_ge=
m.c:69:76:
> > note: format string is defined here
> >    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev),
> > "dma_addr(0x%lx), size(0x%lx)\n",
> >       |
> >           ~~^
> >       |
> >             |
> >       |
> >             long unsigned int
> >       |
> >           %x
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_ge=
m.c:
> > In function =E2=80=98exynos_drm_free_buf=E2=80=99:
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_ge=
m.c:83:37:
> > warning: format =E2=80=98%lx=E2=80=99 expects argument of type =E2=80=
=98long unsigned int=E2=80=99,
> > but argument 6 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned=
 int=E2=80=99} [-Wformat=3D]
> >    83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%l=
x)\n",
> >       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
> >    84 |                         (unsigned long)exynos_gem->dma_addr,
> > exynos_gem->base.size);
> >       |
> > ~~~~~~~~~~~~~~~~~~~~~
> >       |
> >               |
> >       |
> >               size_t {aka unsigned int}
> > /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:563:39:
> > note: in definition of macro =E2=80=98drm_dev_dbg=E2=80=99
> >   563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
> >       |                                       ^~~
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_ge=
m.c:83:9:
> > note: in expansion of macro =E2=80=98DRM_DEV_DEBUG_KMS=E2=80=99
> >    83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%l=
x)\n",
> >       |         ^~~~~~~~~~~~~~~~~
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_ge=
m.c:83:64:
> > note: format string is defined here
> >    83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%l=
x)\n",
> >       |                                                              ~~=
^
> >       |                                                                =
|
> >       |
> > long unsigned int
> >       |                                                              %x
> >
> >
> > Can you fix this up in a follow on PR?
>
> Uh, you've pushed this already and it kinda broke my workflow. I've
> applied the fixup from Arnd to sort this out. Apparently there was also a
> fixup by the original author, but that never landed in the right trees.


It looks like the same patch, commit
3470274dca4887e2b56684bd6a482097318d95a5, has already been merged.
Due to my oversight, Arnd Bergmann=E2=80=99s patch was merged instead of th=
e
original patch from Chen-Yu Tsai. I suspect that there may have been
an issue, and Arnd addressed it quickly, which resulted in his patch
being merged.

I had actually prepared Chen-Yu Tsai=E2=80=99s patch, but I appear to have
missed it while moving the patches to the next branch.

I sincerely apologize again for wasting your time.

Thanks,
Inki Dae

>
> Cheers, Sima
> --
> Simona Vetter
> Software Engineer
> http://blog.ffwll.ch
>
