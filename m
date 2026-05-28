Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502513438AF
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953638; cv=none; b=TZCsNkxM7srTmlf3HLncDpePHkm901ojMW+nBxQCYknR0+LN6MeS3q9UcxvEdLCWpmTms78xPPSUyunlPS2Hc00DPdZifUV5c8YmMINiSZYY+3/2zzgAcwxD6MVGRza+xIOzTcFALNZTOn7cR9FdkOI6AzmCuCxBaFbWHj35rSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953638; c=relaxed/simple;
	bh=RY9fSeHfq2QAue8rVsj9RxP7vq+pN9p8akdEUjeM8J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5AbMzSx2yhNiW4GhGrM2Y+wWlcITvS5StnjxK4thR0DmeY3UEtNnpOP8nitV9NMFoxJokmusiCRSLnTpWvm81ZTZcwGeHJeNMXl124Bb8XfwJKM3Klyg+V9HQY5YZW0dsNhlOFneH4YgycgluykocAj6SxR3NvUPo7t/DVvaQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=lGCQ67YB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="lGCQ67YB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so130892275e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1779953636; x=1780558436; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HaYzHO++GhEFXQR1JkiMJsWACEcNpxKT9x8Fc4Oq/Ck=;
        b=lGCQ67YBWA5/uA7ilIGLyMhsiPVXhkmLZ8fpO3+HgSJKGrdCticMDPRauibe1QcDsL
         hNHcW6ASLgfLVFLHNVz3rKIw8yf1FVuS+Pok01qzvdaBOg64VDrppFH/YtXZoAyjqzMJ
         BVG8AHwPvNddArzT+xsQnWbZOa/xTg57lItTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779953636; x=1780558436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaYzHO++GhEFXQR1JkiMJsWACEcNpxKT9x8Fc4Oq/Ck=;
        b=BsH2cm/V7x5+QwOb3+RKWyiK/rk7L7JXD3QoJ6jpPeoe7jA5gkciuxeprX9vaxiqOx
         MbXfNJe6fI55uar0JWZmptJH/ZVRU/AGbg5nr7Ejo7GbfNguP/x7WY0yq2rSlXh3dByw
         IS/5wMnCnGpb0XTADgixfwf4KlfEtV6VVEhGFMyO2KN7HGX2qF1yD9nZqfufBTLQQPnN
         9y3GuUKjUdUc+sm19v1TzJVxoolrm8qh0dPddycRWpPnpXF/ZPPy3yuccjTdyFSW1qth
         pnT4KY06MTkVR3e7AbnJVQmQmtuRJhGIhR4SMOCikkZWMbyVDk9JeBHP4HOsrCI2znIq
         bIPw==
X-Forwarded-Encrypted: i=1; AFNElJ9FK/WrhTwyWW6ubbjWtWIZYn7LwDl/VVAz6G8tlpg9rcTV5aTx8WrBW4weEbmQ9CcQV0f7Aree/D7GAulF7shTEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyUCkTDX1kqwg7flAZYsZIsBu/tsRXAp2gW0kGhJdYmFVjxV/9
	C//Nbm9seuCuMGMIF/sftd88xLu6JvEjJZd2AS99g+XIB6GbzKarN51hKk++hFsiglM=
X-Gm-Gg: Acq92OFWKEtj/5ZXUu282FgDDw53HpQ11bL3DRRU3reBKgr9CgT6vlpQ1E0OUZ3CckB
	4fI8nOuH9uuDuRIfa1pPGYDbf84YPo53RvUwLYKq/pTar7rWnTygX9k0ZA/vvDQh185KsGuXhj+
	pL+HhPLwn+hiHvF02/Fo3EJz7q7QUcw14Rmr0v+NNnk/RX8ZAb0ahuxYiZxeUJvvK47cqbKb7GF
	a5ubOYQXOkBC+se1phpBqF1Zg+X8ZTjDmpYLS7ThiSSsc7WFszQ9MOtt7AjaH6xVX6SET6BeU7/
	ng7Hd5onZVTyTjaEXmrI0wffpwMT04NbPXsqVo3pNgvlKF/YH7OuqSwo7DA8j8aGy3PmZMSTtDe
	vX/6eGFKqzXYtJ00QfPWG0tmjVUilX3uZtUuVm3/IIPGzv7vgDvzC5K9IyMMZaeOUm8x6Wo4yeI
	xfY24tIbf7WGNp4sl447eMijBBaeG9fERxigvtIeEQBZl/rgrwsLwpR5Ul
X-Received: by 2002:a05:600c:674a:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-49050580a91mr371954875e9.11.1779953635635;
        Thu, 28 May 2026 00:33:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908b8aa05esm11520965e9.13.2026.05.28.00.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:33:54 -0700 (PDT)
Date: Thu, 28 May 2026 09:33:52 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, airlied@linux.ie, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [GIT PULL] exynos-drm-next
Message-ID: <ahfv4Ox5mFZ5TPCi@phenom.ffwll.local>
References: <20260521143624.56906-1-inki.dae@samsung.com>
 <CAPM=9twLzSJh-rHpNf-JOPBmzFnFevc6v-gu6kWfLCTPeyWLFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPM=9twLzSJh-rHpNf-JOPBmzFnFevc6v-gu6kWfLCTPeyWLFQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.19.10+deb14-amd64 

On Tue, May 26, 2026 at 11:01:07AM +1000, Dave Airlie wrote:
> On Fri, 22 May 2026 at 00:36, Inki Dae <inki.dae@samsung.com> wrote:
> >
> > Hi Dave and Daniel,
> >
> >     This PR brings a cleanup and modernization series for Exynos DRM,
> >     focused on fbdev emulation and DMA/GEM internals.
> >
> > Major changes are:
> >     - migrate fbdev allocation to DRM client buffers,
> >     - switch fbdev geometry calculations to DRM format helpers with tighter checks,
> >     - fix screen_buffer handling to match fb_info semantics,
> >     - adopt DRM core DMA tracking and remove redundant Exynos-side code.
> >
> > Please kindly let me know if there is any problem.
> 
> Hi Inki,
> 
> In file included from
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:
> In function ‘exynos_drm_alloc_buf’:
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49:
> warning: format ‘%lx’ expects argument of type ‘long unsigned int’,
> but argument 6 has type ‘size_t’ {aka ‘unsigned int’} [-Wformat=]
>    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev),
> "dma_addr(0x%lx), size(0x%lx)\n",
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    70 |                         (unsigned long)exynos_gem->dma_addr,
> exynos_gem->base.size);
>       |
> ~~~~~~~~~~~~~~~~~~~~~
>       |
>               |
>       |
>               size_t {aka unsigned int}
> /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:563:39:
> note: in definition of macro ‘drm_dev_dbg’
>   563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
>       |                                       ^~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:69:9:
> note: in expansion of macro ‘DRM_DEV_DEBUG_KMS’
>    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev),
> "dma_addr(0x%lx), size(0x%lx)\n",
>       |         ^~~~~~~~~~~~~~~~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:69:76:
> note: format string is defined here
>    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev),
> "dma_addr(0x%lx), size(0x%lx)\n",
>       |
>           ~~^
>       |
>             |
>       |
>             long unsigned int
>       |
>           %x
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:
> In function ‘exynos_drm_free_buf’:
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:83:37:
> warning: format ‘%lx’ expects argument of type ‘long unsigned int’,
> but argument 6 has type ‘size_t’ {aka ‘unsigned int’} [-Wformat=]
>    83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
>       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    84 |                         (unsigned long)exynos_gem->dma_addr,
> exynos_gem->base.size);
>       |
> ~~~~~~~~~~~~~~~~~~~~~
>       |
>               |
>       |
>               size_t {aka unsigned int}
> /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:563:39:
> note: in definition of macro ‘drm_dev_dbg’
>   563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
>       |                                       ^~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:83:9:
> note: in expansion of macro ‘DRM_DEV_DEBUG_KMS’
>    83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
>       |         ^~~~~~~~~~~~~~~~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/exynos/exynos_drm_gem.c:83:64:
> note: format string is defined here
>    83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
>       |                                                              ~~^
>       |                                                                |
>       |
> long unsigned int
>       |                                                              %x
> 
> 
> Can you fix this up in a follow on PR?

Uh, you've pushed this already and it kinda broke my workflow. I've
applied the fixup from Arnd to sort this out. Apparently there was also a
fixup by the original author, but that never landed in the right trees.

Cheers, Sima
-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
