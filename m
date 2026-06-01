Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27A53D75CF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Jun 2026 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326081; cv=pass; b=Md0kXnSxj678bOz7Ion7Az+8JLcIxUCyMI695FG5AHgpm8q7XHc/X6Qv0Cgg2sjZ9Z1+K7qDtUDnunQtDXAmCJ4qurH1OSrPLXoVC/TwcSdhTbWK3ldNiu1dIvpYTS1zVAqbe+EcfxHvaTG7CZtILgy+lB2CJF/w/rSHmT7dGz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326081; c=relaxed/simple;
	bh=Pokojou4baOdF5iO06FVQu9DCeGAprZrkCpKqUuk0ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FeIJOjFKqyoc5TvyKL7QhtM2EetuN6633mlMA+YfG+b507ic5Di7BZEFwSCMisa5nsuTs2TVNA4WpR/E6UWrAoXExLqIYK62rCYv4qKqu2nWVJtt4jcMzg358zp6J+knruQVm8nZR0lqBcAdSyNGrF0hbcoDOcNs+cv/96GuW1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5+huIzJ; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5+huIzJ"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6c3a36fa9edso1765043137.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jun 2026 08:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780326079; cv=none;
        d=google.com; s=arc-20240605;
        b=EmzG1QOnVzhnb3lwNXpTzWLBSB7z1SjrMWGkgXDmBW1aQHkWZiEap7D29T7gx2tP0n
         nm5K2vgpj0RadYR8UDpoT0/iwuTg+Bc/04N4MJTU3pNooQFv1Ov6heRyVuhoSAbqY7FO
         fhIcg62iQc1e3GecQ97WAE3YB+VFi4Fle8EER0pYaiwBNo+0Lz0ZKFy87dGv6nsBlJVs
         RpyTJLfNCX33OpZDca/EsHfCxH2qn7L7Zw9HO28vpxKsufPGRLsbmEjKGpGnypLerov9
         T+zT4IejKn+Sq+WQ3YoFq85VyAj1P9o64B6mOb+lQm1o8SGs3sVag7BkMQkYHlzgg1/O
         Hd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nwk2UuCGq5tLt9Wm80zVPiskYyAlj51G22B+3bC+jcE=;
        fh=hL4gmsG+4sqUXbu9Scm84WPak9nj9PmL20xdEO+yCRM=;
        b=EoXkJNzPodb0t4HU1DpMvNrRlkbnyRxVfxK6fZgT4AIwe89oVeifckpnXfNhZTmn3A
         conj6UDBsGcz8XrCk/XrUBAY6sgdk9fJOIqujLSeaSbTWc7NG2NHa6JC0DA8toDfNWKD
         s31JUmytAI83zEuKM/bwrJY92NdOzLaZh8S0pwSS24vTgXuzLWQ+eevi3NOfGxkHHf6C
         CC2sod7bQVL54oebss5gNeEpSKLvZLU7gtan4xAb5cL7tufW4jeZoXVFFhTxmiKa1PeX
         VUiDET26bN8Fz7oxcJ0cTDDh99iBkgh0EdG12rzGF5GlsrghqNNrCaSKGE52aAVA6aS9
         T+rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326079; x=1780930879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwk2UuCGq5tLt9Wm80zVPiskYyAlj51G22B+3bC+jcE=;
        b=d5+huIzJE7hAMF77aLKwftbsMchj2xxm7jbCljxgjxMXJQNJJCdNgtyQ+Ok6ac+W9U
         OyMESxu6oDl5uADLfe58AWXGuWk3gPgZRz6UQBYpEKz16C7vqzhA89ke7WDFrKa5zAFU
         JjwcDK9oRrt4iZMLHrfBaOAyNe2nlqLkJRhpiW8g8nqpr+08Fe1/7ObkvzWSzZLQbtPU
         kpaJnqTBpjXwLuoTFdQLW8uDCT1/yEcq1AJyUL1HoYVexgZMI8Hd9OIlVDHnl/3YOqj5
         Mx8wikXD56nxJpsx0xB5ypCDkHdgv07KHzIu5bFYpT7F9pdAFIYsIWt15AwDpiITSUc6
         N2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326079; x=1780930879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nwk2UuCGq5tLt9Wm80zVPiskYyAlj51G22B+3bC+jcE=;
        b=Q0Rqk22AGeCs6DNK33Avf9Gpd8Wr+YGw0QRP2EAy6VfClzUtiv8UFTScWMZKXgsKMj
         c6EafSOre8lbNlEUo35L0YGQ0sU9ZUywvYIabQvI/cR6GfVt6cAOC3XjLRl8CA2610sd
         3mB9BZEuk/htalKmcXZOBdPOXf9LVkZl+sy6ytugUKGw+yiy2Pi42wLMBfKS07NljDWY
         PcZeNZ9PSaO7ZmY4hHInL5KQGX3BznlGgwjhs4jL7N5XhaHV2yTg0y9MPeoG3r6vzDcx
         y4XZ4IxEg6MAh5+3HrDT1ZuFMPjzqLpeVzoN1N2OxyDaIp/X0Z5UH6Sz7QiTb3zyCiNE
         6gLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/eFBrZd/Rw54Ran2NE4AnALFNx+J8ovP7k4RGFcE387S/j+39Zrt+igOxczR+ni6Q3FQxiDriVJHyMVZjWCuPlBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw01gSBUFzPmTxhTfb9YNvy0ToWh0wj9bqI3+15ENexZPf26oyd
	VsX8BKi+UeMShi5lwYt8Dq0hXoyeylxxlb2HY6xEinQuEGASCiDjC4FV9yRUxdfDvH0U/3RwjiC
	S9eek/Xc9jUKr3olRyAXWs/NnM1ThFOQ=
X-Gm-Gg: Acq92OFO54av692VWEgVrm0EP09G7K4IF1Cwn9SYLz38L1BCW63c9PQpNtgoBfHiiCB
	fScqG+9Sg4JQeDWx4YnNyQMYt7wV7e9lty/yaf+awjbRALEmSmqvnCnZ2k97JmhMBzjQqfMnghB
	ppc4u6LHKHhxpbPhpmNJmFXODMBgoUaPO8ShE/cWY4/Jv2dJhgFwC0sfswG3QtHP0sdg7SMlDKy
	OChd4gmrefOVwX2L7lVZ/QUhWpxcjzXLkC9PpX5X7hdN8VnrUp5/qSMTGQ2NdNyWRvmEoSRW4U+
	TXt6Dyp+xt0tSBae82Tlt5rwJAnYixLg+r2F8k8ohcmNlJxq
X-Received: by 2002:a05:6102:4414:b0:634:420a:ab25 with SMTP id
 ada2fe7eead31-6c635d16c95mr3802351137.9.1780326077816; Mon, 01 Jun 2026
 08:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260408065112eucas1p129f600747c27e999ec3d42504bc0fd2b@eucas1p1.samsung.com>
 <20260408065055.1353444-1-wenst@chromium.org> <d568fde6-8033-45c1-a2e1-13f8112f1193@samsung.com>
 <CAGXv+5HvO3OjBC=u4EZeB6Aza6oSN0KWrvbQgWEnR=jskczvwg@mail.gmail.com>
In-Reply-To: <CAGXv+5HvO3OjBC=u4EZeB6Aza6oSN0KWrvbQgWEnR=jskczvwg@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 2 Jun 2026 00:00:40 +0900
X-Gm-Features: AVHnY4LiVQgchAwT0M1vmeLVdX-XKywtGIR-vtqCkEB-jmXjcHGzghOfOtlMMIE
Message-ID: <CAAQKjZPgDMvdn8R2dbX10KNQam_PMsm6_FES0WLhx_7pKY4Jdg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos/fimd: fix register offset type in fimd_trigger()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, DRI mailing list <dri-devel@lists.freedesktop.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 6=EC=9B=94 1=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:44, Ch=
en-Yu Tsai <wenst@chromium.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, May 6, 2026 at 2:35=E2=80=AFPM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> >
> > On 08.04.2026 08:50, Chen-Yu Tsai wrote:
> > > Sparse reports:
> > >
> > >     exynos_drm_fimd.c:992:39: warning: incorrect type in initializer =
(different address spaces)
> > >     exynos_drm_fimd.c:992:39:    expected void *timing_base
> > >     exynos_drm_fimd.c:992:39:    got void [noderef] __iomem *
> > >     exynos_drm_fimd.c:1005:33: warning: incorrect type in argument 1 =
(different address spaces)
> > >     exynos_drm_fimd.c:1005:33:    expected void const volatile [noder=
ef] __iomem *addr
> > >     exynos_drm_fimd.c:1005:33:    got void *
> > >     exynos_drm_fimd.c:1007:33: warning: incorrect type in argument 2 =
(different address spaces)
> > >     exynos_drm_fimd.c:1007:33:    expected void volatile [noderef] __=
iomem *addr
> > >     exynos_drm_fimd.c:1007:33:    got void *
> > >
> > > Add "__iomem" to *timing_base to fix its type.
> > >
> > > Fixes: 3854fab24e89 ("drm/exynos: fimd: support LCD I80 interface")
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Inki, you missed this patch as well.

Thanks for letting me know. I will pick it up.

Thanks,
Inki Dae

>
>
> ChenYu
>
> > > ---
> > > random warning I found while checking for the size_t warning.
> > > ---
> > >  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> > > index b6abdc4f2b0a..695d3515d421 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > @@ -989,7 +989,7 @@ static void fimd_trigger(struct device *dev)
> > >  {
> > >       struct fimd_context *ctx =3D dev_get_drvdata(dev);
> > >       const struct fimd_driver_data *driver_data =3D ctx->driver_data=
;
> > > -     void *timing_base =3D ctx->regs + driver_data->timing_base;
> > > +     void __iomem *timing_base =3D ctx->regs + driver_data->timing_b=
ase;
> > >       u32 reg;
> > >
> > >        /*
> >
> > Best regards
> > --
> > Marek Szyprowski, PhD
> > Samsung R&D Institute Poland
> >
>
