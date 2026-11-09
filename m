Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794201649;
	b=ED0rQJfEPDKMOtzADeDKJXLksSrwo4rlzLbVqh3101ctBaMCn/wHxLyWU3ajfKE5Thm9
	 lKWDSOzOCikCTccZjMmLhunIKJdU4JuiHqeLG0RUWpd8ytMzfM0IumsSV6E9ovnT5+ezi
	 90NIItWbdx7Hq8Ql+1zQWQ6g1BEHZmMNvvrA+LpnaL2VbNBGn83t22BgpYHdL0ykCFtba
	 n5zbr0wiKiwGLAmurP4heQUsccSJezvt4/7seMQIV+296YZovnBjgG9CYf4SDN3cPIZaZ
	 M6V0k2rp9EOtjHNgiWkxPHvN2VeO9lEcqQ/CojC8L6uB9M4uCkgmMFDSRwlZVIvUGgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WHqXmw0GVc1+mZ62lwJeX+opySq3aWGZVirYtpV1Hks=;
	b=pepsTlefv1nbSMyLqXXJPmyj8HR4b2PY7Y8qSzhfPRj5SLnBNDpZxtCg7sw39aLZ4tP9
	 sNiaynjhG5eAZoF153RzW2QYzjZKM/XNb35eTejjlwR7Rl8qZ0NcYVGu63lmv4CNAOlxa
	 V4mIXjGnjy7SPPnnFocHfkNajI4RVcrnRFXxho7pPGWA+X90MoVUXnWDlLLMjvCSZdeLK
	 gYwkJmNaFxxp/c7x8WiGmKUytpveqRXeQJL0Zy0cm1V0WYw3rtT73OFQdCugrGyAOwaT+
	 207PbOwRtA4WUTa9cFZXtLkzco9BV8JwkiaEtY2fs0H3HSiX3U+2NZYgEB1gMG7uuKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLQ3CpVu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9438A606A339
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2026 05:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9438A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLQ3CpVu
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso475029a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Nov 2026 21:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794201647; cv=none;
        d=google.com; s=arc-20260327;
        b=A2ijTAs9wnyNy0TaFU5vD7ov2u32OQjP0APbe7amoi2XJRP9CeOFVPJXixR2M2a+31
         gHt69LlYprf4nehUwt8J5KNG52TZt3jKaCa0QLJULw55n8aaFi15LMWIb2tgC4Ji6+6q
         rodCsTiPzGOvVLtM2WNfnI7qGy+zY1q3MpyMv3JhyxVD7bmY7VrhWor12Yy0zRHY8snT
         z9xae47DOr7pW65zA8ZuM+NxXtgAchyIDpxRWsYTq6vBt82H/2x6Ef6nN2WZUrokD9P3
         5QwioqRN/lX0ewAR/nWsCBGaEsCBq+/JDv/PlALGwBwkjZEhIKxBGYGaZC9k617TrxCy
         x46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHqXmw0GVc1+mZ62lwJeX+opySq3aWGZVirYtpV1Hks=;
        fh=qJ089bhsLjsER8e1WOKPFyQpoPgJjTUY3T8ENeHPfBY=;
        b=Eat4f4ZfOh9v3VNaMcpwicPsBM8x2h9wDjWQ1mygodXqn2G72ez1INHmtjI+4nLA9+
         qiAhBiMFT/hNMGcrcoVzpBZbOXpC8+5fQa+KpJ6OC/YIHCiAt0PkGCy3KaCYIEx481zh
         u8MNRg4HszAQPyjims3X/kDz5Ta0o659IHbWkcfkJD0klU8gXpEJqYl0/vb58uOe893X
         Ql6ju8M599YkJUI7Xy3qGHuILCnhel3dO6ZuI5/uYG4ScNAw1XI7O4Bh8rYO/tQZD6Bv
         MVXolX6EfKo/7c7OUIcYKuKhjyOllYEIsv2rvxEkhmulZm7VeY+IQ8FInL+jORjjEqkb
         rN3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201647; x=1794806447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHqXmw0GVc1+mZ62lwJeX+opySq3aWGZVirYtpV1Hks=;
        b=rLQ3CpVuTbT1dCl9LaJTjjKpvxV/Pd2DtsaX8crhoYCT5R3s/JdBhHA78HZiPAZS/8
         KoU9XA+q5I8jpGHV5bOs4oyK795ZZUFPm+Ntd+PNcjXvYQdBg3ssd2OLidnZrecjcPrj
         A0HfkLCCg2zuN5Rb54y+6iKIzvnfyzx0k8oP2D0dySWtEZz8x6Fd7mdZ9grSkvOCxrqV
         kmBKAY7y/Wp0qIlptLY8wyI38yQl1E6mnM6tpiNd3bUtefby9cCRXBtA2fI4c9MIdh4p
         BaPLgUnIAtwtUjO+I1uax7d/oj5moqwWBagQIYS1IFhM9G4jZ3YbvtLz5z2F1ExUYmVr
         jUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201647; x=1794806447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHqXmw0GVc1+mZ62lwJeX+opySq3aWGZVirYtpV1Hks=;
        b=oGc3lZ0K4Dlx84PGkJvl/Ot2PjEDXT9XRLG+E/La/c189DKA97g+GPG/mvzF4qvrmJ
         qyLTU6T5udmOfMh9F9cqG7jCc67K/wKiU5D9mPr6bmMq1BFCKh/OKk+lemL8kBuppqp4
         2Ck7v4h1AsxLmV2+JjImA/fjelOrLnKq2ZEnrSKQzBF0Q1cOMbq+bRP+2eE+JgGT17cZ
         co894XF+M00/Iv2UMPkIoOaqPu4XbnCtZXXpr9s8brGBx/g5pDCqJERLwf2h/yGgwxMQ
         g5+xcgFJ3OyrHy44ZgZuOf10aNCCZ1qwZpSqeR9qq7bYecAfld9R6GloxJwizPKNed9/
         EmCA==
X-Forwarded-Encrypted: i=1; AL+hErG/mbYzIL1vJrk9jxrpWw38wng9OTMaKjXIOBnCRG6rcYPL2TalRD4ai2L6dyEYtYHasE4Shw1LgVVeGuSrbeFHRQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9j/R6ri6/MFR9zpBsMwpu0g1WJAfFjt/WiEib9cJC3JKB+gEah
	JHjonGcaeuNNwdwmKGZrxGafjVgM4wtWBe6VSfqfCkXo/GeZ9aTSJ7z3sdlP2B6pQQjPLozKFh0
	iqvMJgAP16Egib+9d4MmC/G/8bulnZiA=
X-Gm-Gg: AYBFou2N2a4ZBKnKndtawSu8lvFtmlLRapC1H75DAc2MkqF6UpOpQMY77JvlvFAsrmr
	T3B+4673PipEip0ljymEZ9z7aU2674o9FRiG1Cfm+EL3AJyiQp2nPV9BoZgL81MHPzN8jdxwwVM
	ueBdBu0KDXKBV1oViFeGVQPB07RKFlSIhPX8vwpykvvBzoDA8lLqVTjD32r2WURQTMBqmuo/MTC
	CVP/ovZl/bCYRTk9mzlHNGxQM80IzNkcyneKPp0K0pJCAD+x4uGiwiHV0jD87RZm+6jiSg40VSf
	KHtMOFWhVWxq6PIEPegA0NNzlbfvjLIElDSd5iRcf0CYjuYkbdQWlnP9pUp/r/Vmz6/FNGODHKr
	ao7iDtJgwde7Om3WcySSDynM0KBDWvpuQdl2lJdgePBMJrNBaHEU7iDmJ9JW/oiuCn0O6TBdR7j
	BIiqzSnxrK2zcdFHWVWpD1yONmPDaEKISzUarhfJMi+KZvSURZNwk+3TK0Gz90Sgmjff+hOAuKw
	HmujKVRnrQcSbIlY5RRVezU00rIHI1bfnvo8kVKuyyvFC6C4A==
X-Received: by 2002:a05:6402:2349:b0:6b1:d2ee:392f with SMTP id
 4fb4d7f45d1cf-6b722462c10mr1849087a12.25.1794201646678; Sun, 08 Nov 2026
 21:20:46 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005001143.576737-1-rosenp@gmail.com> <CAAQKjZOm5vA+38XVo5D4qV5B9eRT1seOShk-eFk_Jg_EQPdaOg@mail.gmail.com>
In-Reply-To: <CAAQKjZOm5vA+38XVo5D4qV5B9eRT1seOShk-eFk_Jg_EQPdaOg@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 8 Nov 2026 21:20:34 -0800
X-Gm-Features: AclHuK-SIIyleRJSywdY0Z0pO7le2Nv4F_kttBOVsLQnGOrWIxGto2xb9JrsOXE
Message-ID: <CAKxU2N9a6+0DXxtTxNwxWm6yBxmZS+AHpBLzyNBsvfRBasgAWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: gsc: allocate formats as a flexible array member
To: Inki Dae <daeinki@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 8:41=E2=80=AFPM Inki Dae <daeinki@gmail.com> wrote:
>
> Hi,
>
> 2026=EB=85=84 10=EC=9B=94 5=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 9:11,=
 Rosen Penev <rosenp@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >
> > The formats array is allocated separately with devm_kcalloc() and only
> > referenced through the gsc_context. Make it a flexible array member at
> > the end of the context and allocate both in one go with struct_size().
> >
> > Annotate it with __counted_by(num_formats) so the array accesses can be
> > bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.
> >
> > Assisted-by: LLM
>
> The allocation and lifetime changes look reasonable to me, but
> Assisted-by: LLM causes checkpatch.pl to report a non-standard
> signature and an unrecognized email address. Please describe the AI
> assistance in the commit message prose instead.
It just wrote the description. No actual code. I'll use
devm_kzalloc_flex in the next one.
>
> Thanks,
> Inki Dae
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_gsc.c | 17 ++++++-----------
> >  1 file changed, 6 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/=
exynos/exynos_drm_gsc.c
> > index d9637ddfcfc4..f1807ef664e1 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> > @@ -99,7 +99,6 @@ struct gsc_context {
> >         void            *dma_priv;
> >         struct device   *dev;
> >         struct exynos_drm_ipp_task      *task;
> > -       struct exynos_drm_ipp_formats   *formats;
> >         unsigned int                    num_formats;
> >
> >         void __iomem    *regs;
> > @@ -110,6 +109,7 @@ struct gsc_context {
> >         int     id;
> >         int     irq;
> >         bool    rotation;
> > +       struct exynos_drm_ipp_formats   formats[] __counted_by(num_form=
ats);
> >  };
> >
> >  /**
> > @@ -1222,21 +1222,19 @@ static int gsc_probe(struct platform_device *pd=
ev)
> >         struct gsc_context *ctx;
> >         int num_formats, ret, i, j;
> >
> > -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +       num_formats =3D ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_=
formats);
> > +       ctx =3D devm_kzalloc(dev, struct_size(ctx, formats, num_formats=
), GFP_KERNEL);
> >         if (!ctx)
> >                 return -ENOMEM;
> >
> > +       ctx->num_formats =3D num_formats;
> > +       formats =3D ctx->formats;
> > +
> >         driver_data =3D device_get_match_data(dev);
> >         ctx->dev =3D dev;
> >         ctx->num_clocks =3D driver_data->num_clocks;
> >         ctx->clk_names =3D driver_data->clk_names;
> >
> > -       /* construct formats/limits array */
> > -       num_formats =3D ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_=
formats);
> > -       formats =3D devm_kcalloc(dev, num_formats, sizeof(*formats), GF=
P_KERNEL);
> > -       if (!formats)
> > -               return -ENOMEM;
> > -
> >         /* linear formats */
> >         for (i =3D 0; i < ARRAY_SIZE(gsc_formats); i++) {
> >                 formats[i].fourcc =3D gsc_formats[i];
> > @@ -1256,9 +1254,6 @@ static int gsc_probe(struct platform_device *pdev=
)
> >                 formats[j].num_limits =3D driver_data->num_limits;
> >         }
> >
> > -       ctx->formats =3D formats;
> > -       ctx->num_formats =3D num_formats;
> > -
> >         /* clock control */
> >         for (i =3D 0; i < ctx->num_clocks; i++) {
> >                 ctx->clocks[i] =3D devm_clk_get(dev, ctx->clk_names[i])=
;
> > --
> > 2.56.0
> >
> >
