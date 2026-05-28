Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CDE32ED5C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 07:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953180; cv=none; b=dIGRAZJmKoO3fyfvsbHGU5MXcLQ3YNvRvenfa0nHpwb6H7N86QJq8iaNo4dSeIHD0PU0o1rqt2X5UkpLG4k9ITHhSTtGRX9by/PcvZh1HVQ/pixiDTcj8bMbhOuC4Mkb+klYU6u68pwd7T5+F0xgbhX9wxG7W6yCq2nXslBI0nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953180; c=relaxed/simple;
	bh=mN22yLYavxQD0qrKuY/241cKoIVJqcbyDsB4JLlHb8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JX9YhFO1BcJXQfkCg/FC1uQoiVfCnScnV/JgYOo5z+wHnMg60vSSszl2cSNg/fJsROLM1YBZTB8sCV+OYAchAhuKlD4DMrclyn2XIHfSllGvT7szrC9oF5VTX7dU5wCfrdF4IG3N+sy34Wl5PZYvmNGbldzGJMOLUWLsxTKkpdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Hf+lQ9Qg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Hf+lQ9Qg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4905e190c71so48497355e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 00:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1779953177; x=1780557977; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Okm57YHWqP6DudQxxBoKKLC7I9Qfb5iqn9tysYDvME=;
        b=Hf+lQ9QgAJffwyKaEcDMtlpnRUZRqcszeDeZjaZ+s0HkYHXDvxC17xaplNmaYs1Rtz
         zgwbmAvzb+26qF+jju9dFJMzXewM4ssLw1ohssBFjQND1ELNfYZDecIm9tl9um1g5Y8m
         iJdavpmDCp0GOAZubX1JOm0SN6uFbWlFIfbBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779953177; x=1780557977;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Okm57YHWqP6DudQxxBoKKLC7I9Qfb5iqn9tysYDvME=;
        b=q6DnyONy8uUu3UnGqbNpHEY6eBlLpEgOjAfqtMHqZ4GhXMPmIjvo9ABNtbht4kSFG6
         UB72oRwNaer48CZdcZGRFih7DDzj42hfQtonElMWzfJNXvYk0/zkEvPyXHbhgRkkuvsv
         Aohual9ldbmJrLpQkqVtlvReGTL3C6d+1VDbhaLMvn3LabqJCL/xGTmOZzpHps3hp5aR
         0B+XEjYZvw4ucr8ORcDcxjT9CEkKN7IEUQMB7RFMCOWb4LC99WyCKTCB4CaOqTZCfnMK
         gaaxLxd69e8s1/D+y3fpDENogvew7BjtS2XfHOM706nDnz6wYly5tzwItJV+VOgCtEC/
         V9Jw==
X-Forwarded-Encrypted: i=1; AFNElJ8owfxE2+ieeWcYey+Ql+hzW+1yYw0pVUe7z/lBpEla2cHCR2WJVQoJr2NJVjYV0CILCXwFZ9Uy0RNdjFlhC2leyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4He75nHv0kSoW++u1VOOml34tz+T5uB1EBIJQyv/g04ytaSt2
	z5MQlHmwzbNInq9rBNDdjWFxOmU9DPnW6bwjxqaOAYDRr33CuBMO/p1jkmQy2hTDewA=
X-Gm-Gg: Acq92OGJZBmuJleISfxFUjHaWBNtcqTFM4VqcFNOl4LGg2sO3KHvNgMX6WP2yE3DSnq
	2gzrx4HlnNP4zjbL3W9JOtcOmkNrJr26jQrFUH6Imb8gGpf5SnOi3HGrjMr4GHrnPrAvIo8OQ3J
	/7dAa2vrPLFPSKuChrdrK5Xsl1rzz9eOVpYJUznZEbEmK5m94XRlugPdLcwX0Xz4/wLDd7dDC/s
	EAIif6YMP+foTFTjNmijA8r2jxXHzf21ibvxxXQbDKqPzTMO0jzL6c6ECMQNaPHzy4n+mL9Mglf
	ZO0ALBSkem8OvXUzfxE996/sIkVfn5vRJsmzlD84sIVGusEEihmDmBAGiyC7mOM4wgr7G/rtB1E
	s6okbLimUr71rIXDOe6ck6Ae1cd0+kR3okm+GOwizFn/xLIRVrBi/jioX/xUF0x60HfqouER38T
	Zg8gksv5cJvHfPvEFaJSm0NH4sYoLtq1k5iXcCRPdhtZ+Dj9PrJXNSHOXp
X-Received: by 2002:a05:600c:4510:b0:48f:e230:72fc with SMTP id 5b1f17b1804b1-490428ee268mr403369655e9.33.1779953177104;
        Thu, 28 May 2026 00:26:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909235f98bsm30377995e9.1.2026.05.28.00.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:26:16 -0700 (PDT)
Date: Thu, 28 May 2026 09:26:14 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/exynos: fix size_t format string
Message-ID: <ahfuFv4_-bd47r4w@phenom.ffwll.local>
Mail-Followup-To: Chen-Yu Tsai <wenst@chromium.org>,
	Arnd Bergmann <arnd@kernel.org>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260527194525.45762-1-arnd@kernel.org>
 <CAGXv+5HvJiTkLJMZ13w0OHwgp+nPBftGAC-15nhJ3R=vOPWpUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HvJiTkLJMZ13w0OHwgp+nPBftGAC-15nhJ3R=vOPWpUg@mail.gmail.com>
X-Operating-System: Linux phenom 6.19.10+deb14-amd64 

On Wed, May 27, 2026 at 11:03:03PM +0200, Chen-Yu Tsai wrote:
> On Wed, May 27, 2026 at 9:45 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The exynos_gem->base.size argument is a size_t rather than an
> > unsigned long, so adapt the printk() format string accordingly:
> >
> > In file included from drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
> > drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc_buf':
> > drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: error: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
> >    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
> >       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    70 |                         (unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> >       |                                                              ~~~~~~~~~~~~~~~~~~~~~
> >       |                                                                              |
> >       |                                                                              size_t {aka unsigned int}
> >
> > The dma_addr in the same line is already printed using a cast
> > to unsigned long, so change that similarly to use the correct
> > %pad format.
> >
> > Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> I posted the same patch [1] one and a half months ago when the culprit
> patch was queued up and I got a report about this from the bots.
> 
> Inki hasn't picked up my fix yet.
> 
> And it seems the exynos-drm-next stuff was only merged into drm-next
> yesterday, now causing the warnings to pop up all over.

Yeah that's some pretty bad fail for exynos and I guess also for Dave for
not compile-testing on 32bit before pushing drm-next out. I've noticed it
just this morning trying to do some stuff.

Picked up Arnd's patch as the first one that I've found (after I've typed
it myself already, but hey let's at least give some credit).

Cheers, Sima
> 
> ChenYu
> 
> [1] https://lore.kernel.org/all/20260408064936.1342321-1-wenst@chromium.org/
> 
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> > index 297a93b087cd..8e357f2beb9e 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> > @@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
> >         if (kvmap)
> >                 exynos_gem->kvaddr = exynos_gem->cookie;
> >
> > -       DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
> > -                       (unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> > +       DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0x%zx)\n",
> > +                         &exynos_gem->dma_addr, exynos_gem->base.size);
> >         return 0;
> >  }
> >
> > @@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
> >                 return;
> >         }
> >
> > -       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
> > -                       (unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> > +       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
> > +                         &exynos_gem->dma_addr, exynos_gem->base.size);
> >
> >         dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
> >                         (dma_addr_t)exynos_gem->dma_addr,
> > --
> > 2.39.5
> >

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
