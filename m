Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23D574C14
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 01:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779757281; cv=pass; b=aq+ERYTgDZfXOA6xxgFqEcmpFu9MmHmrLSgxXz/WJ+Z5gzXC/QyEbsecKoMx7HlFJaQyWDlhW5wy/pOLafah5vZm4HS5QYa+QQMuxyt75hlDFjMMDO/ZYTixpbDH63p9LOD3Krh4v8nU/l9TZzcGLyYZjswK6FShjIxrWDS7XkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779757281; c=relaxed/simple;
	bh=XJC1/WwH4YiVfFT3LqX5GTkmKYRBc+idC9p6kZgqS0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFVPtKXkLwOgJA6rZ532EdWL/dIBHANwfh0KVJolScM26lDn7gmSFrIzvsTbNqiv49feaom7yeeC4omxJti4MVoESv8n1XUYcrGhQilX/LkuZ0VXxFYaCSp0qMTCCkAj9FCEYpzlochJtM0fJVaUGqpLbJS8UKR0SztY5EiltXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsFR2Lq+; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsFR2Lq+"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8b74b460d77so138138956d6.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 May 2026 18:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779757279; cv=none;
        d=google.com; s=arc-20240605;
        b=Ix8bAOUXlKzgSx2eKEabtnLcOnOEPREDSIeGgQKohsFpRUm/QYIYXJE0He/ru9QmqH
         EnyzHo/GO/bZqFB429WNaRFNhnZgNOGEMGCxqn+A70BdQVJ9q+Wvs0JRM7cp05sqIh0/
         lzZOa+jXIQKq6HshjGoJvtYf72oaKdy1ZPLNllHVpzeP++qfEyGUJvq5XvjH0Nu2pa9c
         FuWoE4yi8epXdWBw7J+yvZu8avz+jEp5P149zNai7YvEN9QLQu0WeK2nOan6AnO72F8q
         hQ+Tjjmd4qgbmAWHxNtijnGSqPZ2tCD8tyrjbJ2Mc6xVz3pTQP3uRE+vvMIbdDw6WOx0
         hySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WkoDOmIQ5Hj2yranYHm7ebfBS7cyHn6dxBl0N9prozU=;
        fh=rOnt1i1HkInA2ZALVyOZqUTEciZ6ywjITTABDHZGSG8=;
        b=ZodN+T/VVY9+s8+mnXcmOdQNz3i0NzlHDFaNBMkjEKRrxB00K/EcOXtsJ8NaBUCUgO
         rk8X6CAr4lncMoCxBVS2o+TnPDfk26P3pMMd8nNPj5cpDjvs70BiDlcL6WE1wt+8BmEc
         GjaMZ/0MGmMyS8Sl9jWcnJCjQTc07RHkSWhLaR3h91iBQitw5ksT5u2d8AzvLTa89U6l
         2t+pBkjd/V52jlFSb1IG6vMVVXDIjyS3aKO72Mgz71/PivixCiFgOiP3HWiJ8KFJkqYK
         8ZPqYyHS/gFNDs+WmxC6SjNRDRJR2gNviwokEw4JSyZMmzHe8yxWMfZwGasllhmPq4nq
         U/yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779757279; x=1780362079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkoDOmIQ5Hj2yranYHm7ebfBS7cyHn6dxBl0N9prozU=;
        b=IsFR2Lq+FK/LNhdxyEEh4soOG+0S0s5XflCXUpR/Nw3A1kLGKXSepUybiuNkSR3sSn
         eBhsHourJg5IpMuYraoF9uG20xufgX7P9pe0bklfdoJ4/nPeSouA0DWD5+2VdVyU/z6E
         oFbIUK5UB2KxBONMedbPMkl20dOWI6/lkaAaCu0zTBEI7mHKtApKpLrhrHim0ruumwsY
         cZAYhOTXTeQ9+kgkWuYdo6R0x0BhtM6c3sKoJTXdicjHi7lMmumdfgRqini9RnUD0tQ8
         DlTWs7yqWFU2kawk0dX1lzYaoln18h4vRjYnvX9vhl7uY51mhsosJvW2jFgXd+TaA8mQ
         4tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779757279; x=1780362079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WkoDOmIQ5Hj2yranYHm7ebfBS7cyHn6dxBl0N9prozU=;
        b=b2iEyskTlMkwI9xozoxp573hBUHwRVHA5SiR5QbrAHx8BMXmKk/pSlqSxsbeyNDXI0
         Flua75/lmax9L2rQDvPX/3sKaIWVvzZCDlZF6bDoR1pJvVgiIqVoWjZwLF0/mshnly0A
         YY1m/l5TmuL6KnRlguzk3MSK/i3kdLzs+yaGunW7qo0iLQbi9t3DN7orDvdLXIFhmlet
         GgmBZsWbFeuiuQs8onhpbSe7GmAF4uJuoHnLpNZbWdVrih2g3FxnKVeJLW4Ic2UMK/rt
         TGhgZDaHbZs9wsWPdKXNOGdlklCDoK3j7QCF7iomojabYTZ2ywFQqIoST5Z3T03fGL9W
         qdFg==
X-Forwarded-Encrypted: i=1; AFNElJ+YaIVs3qin1RWyDD02XH7G50maRZ9PhLNemZbIflBdc54Vhfd7LOt470NvIaURFpV6Vr7AN+qNso/l9rfFlcDEOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+yQewy7GwJcEFJ3l6eo7rL3vfG1+0BS267Aw0Y+A3uhSlX6QO
	GclaRo5IP0IupJG2cBcM6bxtarR3bUEG/D5cAOvGbU4tnwT6/1aaThMljrLdKDDKCYLi3LbrxpH
	COJvQGgUkKNRw+ECAyMPoEsMxkKNk4KQ=
X-Gm-Gg: Acq92OFTbHpGqTMjsteE4tyuSiL3QTbFpbs3HExstfOb/3TOX1uRd/xzgx8/S8pSEXR
	ZthYvVHSQMSe8B+2cm3QOP6z3oZD68EUss3I6kNiZYuMzVmZM51I+VQGasZmmF+NTdU78viGnOz
	SA1xsF9bO6yhqmxxOpKOtowmSJlBZ0QJzSlFhpX+iw59smkCuZOrk1wK3SimeSJpG7VbJQSLAa7
	/yK558v7mjqsTv2WLfW6X+ppke+Ge1G5Jz5BDkrlCxGAGouvMHMeLSqwREY3SCL5frozxnIOxqy
	IzJX6Awrsoy0YczFdD3yZuQjYoaq7p0471qiYTSVuA+TiJtHJI/HYz9YGHg0ReY2kCY=
X-Received: by 2002:ad4:5cce:0:b0:8a0:7c8:409b with SMTP id
 6a1803df08f44-8cc7b5c7ab0mr282601246d6.33.1779757278711; Mon, 25 May 2026
 18:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521143624.56906-1-inki.dae@samsung.com>
In-Reply-To: <20260521143624.56906-1-inki.dae@samsung.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 26 May 2026 11:01:07 +1000
X-Gm-Features: AVHnY4L_jkvbJSgFydFCJJxizdKRbh_UeuepOxjo5-N1eR69ce0-W7oMKRR46qM
Message-ID: <CAPM=9twLzSJh-rHpNf-JOPBmzFnFevc6v-gu6kWfLCTPeyWLFQ@mail.gmail.com>
Subject: Re: [GIT PULL] exynos-drm-next
To: Inki Dae <inki.dae@samsung.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 22 May 2026 at 00:36, Inki Dae <inki.dae@samsung.com> wrote:
>
> Hi Dave and Daniel,
>
>     This PR brings a cleanup and modernization series for Exynos DRM,
>     focused on fbdev emulation and DMA/GEM internals.
>
> Major changes are:
>     - migrate fbdev allocation to DRM client buffers,
>     - switch fbdev geometry calculations to DRM format helpers with tight=
er checks,
>     - fix screen_buffer handling to match fb_info semantics,
>     - adopt DRM core DMA tracking and remove redundant Exynos-side code.
>
> Please kindly let me know if there is any problem.

Hi Inki,

In file included from
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:=
16:
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:
In function =E2=80=98exynos_drm_alloc_buf=E2=80=99:
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:=
69:49:
warning: format =E2=80=98%lx=E2=80=99 expects argument of type =E2=80=98lon=
g unsigned int=E2=80=99,
but argument 6 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=
=E2=80=99} [-Wformat=3D]
   69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev),
"dma_addr(0x%lx), size(0x%lx)\n",
      |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   70 |                         (unsigned long)exynos_gem->dma_addr,
exynos_gem->base.size);
      |
~~~~~~~~~~~~~~~~~~~~~
      |
              |
      |
              size_t {aka unsigned int}
/home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:563:39:
note: in definition of macro =E2=80=98drm_dev_dbg=E2=80=99
  563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
      |                                       ^~~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:=
69:9:
note: in expansion of macro =E2=80=98DRM_DEV_DEBUG_KMS=E2=80=99
   69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev),
"dma_addr(0x%lx), size(0x%lx)\n",
      |         ^~~~~~~~~~~~~~~~~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:=
69:76:
note: format string is defined here
   69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev),
"dma_addr(0x%lx), size(0x%lx)\n",
      |
          ~~^
      |
            |
      |
            long unsigned int
      |
          %x
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:
In function =E2=80=98exynos_drm_free_buf=E2=80=99:
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:=
83:37:
warning: format =E2=80=98%lx=E2=80=99 expects argument of type =E2=80=98lon=
g unsigned int=E2=80=99,
but argument 6 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=
=E2=80=99} [-Wformat=3D]
   83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n=
",
      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
   84 |                         (unsigned long)exynos_gem->dma_addr,
exynos_gem->base.size);
      |
~~~~~~~~~~~~~~~~~~~~~
      |
              |
      |
              size_t {aka unsigned int}
/home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:563:39:
note: in definition of macro =E2=80=98drm_dev_dbg=E2=80=99
  563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
      |                                       ^~~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:=
83:9:
note: in expansion of macro =E2=80=98DRM_DEV_DEBUG_KMS=E2=80=99
   83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n=
",
      |         ^~~~~~~~~~~~~~~~~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:=
83:64:
note: format string is defined here
   83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n=
",
      |                                                              ~~^
      |                                                                |
      |
long unsigned int
      |                                                              %x


Can you fix this up in a follow on PR?

Dave.
