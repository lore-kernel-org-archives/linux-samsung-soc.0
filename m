Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C462C11D9
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763044443; cv=none; b=ZItnfS+kJE2V4kZ2zNEQJTbDOzofVuO61o3vxzbu1VRzHaXQG6Sl0uRJpbhH7VdsC5GnkfAxnQNg+t7eUTe/rrLJ8UY/G8qSx8yxrt3MRnxObA4MeLZsEyCjVPKH3NOqDK6ouVVh8qd0XhMgLM4xo1N/Hd5GRXM/QYkxlClZCRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763044443; c=relaxed/simple;
	bh=7XvmeYXrTMA06jMNyj1/CDdfDjivHudVL9xtzZF5quw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtERZ7Rd4tRHtR3nJKHwHmB5pMgn7fiBKUeu4pWNr/V0R8quaYA7KRZciBf5aq4PFiVx6V5jfYuP5JHW/2siHc2sFyBw2CQRAhM52qJZKGyBZEaCMX2mcd5ZY279go+iZ5vOzSXG45mWGRvmuYMPWiSkXYNIBdtajFh+lpuXHaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRd1O6+6; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRd1O6+6"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9372164d768so1114950241.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 06:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763044440; x=1763649240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qv/JrdhbRZlCEd1ubK+jM9jWPBpAjvw/CP7fZPI2C48=;
        b=RRd1O6+67Ciz5lxl40fn6oWaGoqnPcyHqRXio7iWOOcD8YIiChq4FAkKeBf3BQVis8
         uEf9MKQTsFf1IyBs3n/LXCSGgrln7+UzTC9alxHzd3Gfb6YASn3NHZK+JE8bv396EcsK
         4bAOBjfv3HmShJ4CRKmVhiUjLPtbBWkRhJSVcLHBPGrzIDyA2qks9UrlSQxch5X5F/H3
         4Ae3f7ACsklbv1fo6UFnI5jWY7FOB5v1I2onGdUVfmjAhuwvON0ESv5JBCc+u+pIT1N2
         f2eDsdPkDRRVH95j28S0OP77joVxqSk049zEa3YDNEjVtTNJgTfjCGsaQQOPBgOYVVny
         IBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044440; x=1763649240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qv/JrdhbRZlCEd1ubK+jM9jWPBpAjvw/CP7fZPI2C48=;
        b=tyA0L+SX2SEsWGujw66q0n0eBkXqsWgpofcaeY/WIynfnc+z6AzFDgCUrA1+xESys3
         4jy4y8ik8khdb8D0EFsJ7GWr2HbSjFok/x/RFoXm9QZ8+GEw07eFiD39vmKUCozN/j2V
         LPoo35IY+viqIE5KqH75n5CnDBzonReXNrFlHm0eMGxKncVSc9Yv1hF9H0Jtt86dxxIg
         hdCEeQLV9GAT86YIjbniEVrn/8vpNOaJlCIux6sIJNd5968J8PHZ16vPUGCPwZQCz2B5
         OrJ0TePUXBzih7YUNrB96UAmnSQkV877Mq+VZjlH5WbvYIpCM7vw3Yg6/7SjO5Jejchd
         3WDg==
X-Forwarded-Encrypted: i=1; AJvYcCWQgk9FYxTA2xsRoaTiiG6WU1PVZuWHL/DarhW4LGB5TafW+0f2xr4K/tCYyXqorkrAUGOrH+9jgVXweZc0i1AM2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Bq1XDa5m3b/iT0yPhhiZin91LcVGk5M/9eDsDjPT+vSWwNqN
	QL3WxByE66FLUSTwn60FCGfDwfigh1uueTB9fluqhHrtpQld/0mPRkWGDzkuGDmMQsRxj4NMGfQ
	GSWg+bypIIEbPLbLm/IyFhk0LS40TzbY=
X-Gm-Gg: ASbGncvygeMNjdtbdEHt0nEaxDE1e42EpaD0NOApbmh6iodfTbYJFFhWvJw6pSuV52+
	Td/+njAeR1GW6rnv/OtQf/HZEiRrgTTZcgtjpNeXEqqVu9JShraVYQ/AVP+LhWl/unoOz+yxSLY
	wpZnPfSnW6WrOhwrj+PQhgHj5NwkP6a0HXX5Qyb9vnzGJttzTGobYcEYhrbBSubk7k1U3KWi9EJ
	tBOrXYe6mVdiNE4osb1IirK0hAHT6VB02mQVPe9PJlCjTpJ6T7arr/bDBA=
X-Google-Smtp-Source: AGHT+IFxA8P7U0p67nbntMP+AJ/1Ive98feU9XP0hJpbEsfyGiZ2cTCG1H/uw7OcCvUbNCvlNz2awdpPad36suAN8GQ=
X-Received: by 2002:a05:6102:38ce:b0:5db:1e4e:6b04 with SMTP id
 ada2fe7eead31-5dfb40e9347mr1377780137.18.1763044439813; Thu, 13 Nov 2025
 06:33:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7@epcas2p2.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com> <20250929043110.3631025-3-hy_fifty.lee@samsung.com>
 <CAAQKjZNCpK4rq6DFUtiQ2rxCeb_34Mp54quVto+9LRJMH3=ZhQ@mail.gmail.com> <000101dc5380$e33e1c10$a9ba5430$@samsung.com>
In-Reply-To: <000101dc5380$e33e1c10$a9ba5430$@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Thu, 13 Nov 2025 23:33:21 +0900
X-Gm-Features: AWmQ_blbp07LBsfmhZq6Hj3qdkeaTe0fO1yFd3NukemDqBNNd4mt1U2vsVx-eHg
Message-ID: <CAAQKjZM23M3hr6Xqk6_f9whWw+CQB5oyvs=JEkBQPp2H3-ocag@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/exynos: Convert to drmm_mode_config_init() and
 drop manual cleanup
To: hy_fifty.lee@samsung.com
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2025=EB=85=84 11=EC=9B=94 12=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 12:03,=
 <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> > -----Original Message-----
> > From: Inki Dae <daeinki@gmail.com>
> > Sent: Monday, November 10, 2025 2:22 PM
> > To: Hoyoung Lee <hy_fifty.lee@samsung.com>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmin Park
> > <kyungmin.park@samsung.com>; David Airlie <airlied@gmail.com>; Simona
> > Vetter <simona@ffwll.ch>; Krzysztof Kozlowski <krzk@kernel.org>; Alim
> > Akhtar <alim.akhtar@samsung.com>; dri-devel@lists.freedesktop.org; linu=
x-
> > arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linu=
x-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 2/3] drm/exynos: Convert to drmm_mode_config_init()
> > and drop manual cleanup
> >
> > 2025=EB=85=84 9=EC=9B=94 29=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:5=
4, Hoyoung Lee <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91
> > =EC=84=B1:
> > >
> > > Switch mode-config initialization to drmm_mode_config_init() so that
> > > the lifetime is tied to drm_device. Remove explicit
> > > drm_mode_config_cleanup() from error and unbind paths since cleanup i=
s
> > now managed by DRM.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
> > > ---
> > >  drivers/gpu/drm/exynos/exynos_drm_drv.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > index 6cc7bf77bcac..1aea71778ab1 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > @@ -257,7 +257,7 @@ static int exynos_drm_bind(struct device *dev)
> > >         dev_set_drvdata(dev, drm);
> > >         drm->dev_private =3D (void *)private;
> > >
> > > -       drm_mode_config_init(drm);
> > > +       drmm_mode_config_init(drm);
> > >
> > >         exynos_drm_mode_config_init(drm);
> > >
> > > @@ -297,7 +297,6 @@ static int exynos_drm_bind(struct device *dev)
> > >  err_unbind_all:
> > >         component_unbind_all(drm->dev, drm);
> > >  err_mode_config_cleanup:
> > > -       drm_mode_config_cleanup(drm);
> >
> > In the current implementation, there is a potential dereference issue
> > because the private object may be freed before to_dma_dev(dev) is calle=
d.
> > When drmm_mode_config_init() is invoked, it registers
> > drm_mode_config_cleanup() as a managed action. This means that the clea=
nup
> > function will be automatically executed later when
> > drm_dev_put() is called.
> >
> > The problem arises when drm_dev_put() is called without explicitly
> > invoking drm_mode_config_cleanup() first, as in the original code. In t=
hat
> > case, the managed cleanup is performed later, which allows
> > to_dma_dev(dev) to be called after the private object has already been
> > released.
> >
> > For reference, the following sequence may occur internally when
> > drm_mode_config_cleanup() is executed:
> > 1. drm_mode_config_cleanup() is called.
> > 2. During the cleanup of FBs, planes, CRTCs, encoders, and connectors,
> > framebuffers or GEM objects may be released.
> > 3. At this point, Exynos-specific code could invoke to_dma_dev(dev).
> >
> > Therefore, the private object must remain valid until
> > drm_mode_config_cleanup() completes.
> > It would be safer to adjust the code so that kfree(private) is performe=
d
> > after drm_dev_put(drm) to ensure the private data remains available dur=
ing
> > cleanup.
> >
> > Thanks,
> > Inki Dae
> >
> > >         exynos_drm_cleanup_dma(drm);
> > >         kfree(private);
> > >         dev_set_drvdata(dev, NULL);
> > > @@ -317,7 +316,6 @@ static void exynos_drm_unbind(struct device *dev)
> > >         drm_atomic_helper_shutdown(drm);
> > >
> > >         component_unbind_all(drm->dev, drm);
> > > -       drm_mode_config_cleanup(drm);
> >
> > Ditto.
> >
> > >         exynos_drm_cleanup_dma(drm);
> > >
> > >         kfree(drm->dev_private);
> > > --
> > > 2.34.1
> > >
> > >
>
> Hi, Inki
> Thanks for the review and for pointing out the to_dma_dev() path
>
> If I understand you correctly, fine with using DRMM, but kfree(priv) shou=
ld occur after drm_dev_put(drm)
> That would mean releasing the drm_device first and freeing dev_private af=
terwards.
> Of course, we will also need to adjust the probe() error-unwind (err_free=
) order accordingly.
> Do you anticipate any side effects from this ordering change? I=E2=80=99d=
 appreciate your thoughts.
>

Yes, that is correct. Also, changing the order of the cleanup steps
should not introduce any issues, because this simply restores the
original sequence that the code previously followed. In fact, the
current patch is, strictly speaking, altering the existing behavior I
think.

Thanks,
Inki Dae

> BRs,
> Hoyoung Lee
>
>
