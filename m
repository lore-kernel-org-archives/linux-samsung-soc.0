Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3D0242D9D
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Jun 2026 04:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780289032; cv=pass; b=k6RyOCCwzkALH6rtAIxBv9hkQaMgXFLC4aTBYLQpIGigAHsAhiTWIzEYtN8rGhAV3jBDx7DzYoYzIM0hiXiOKdI0jufS3He1QNQbCn7tevbe5hbaH+mhquP7gIGiKuy00zE2kjHhKCiJJgkPJqroj9ohnB+gLNlGc7E7oELwOuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780289032; c=relaxed/simple;
	bh=5nmY+5LsENDUu/siPXU4S3sNh3PS4DNCZAyKYLpDklU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsxbGDHfAfBlhi/K8YlMfLtHSVGO026WSJn6cSXnxHANOkO5BZGNWaAn8Yb2Mt7pHJ9AuZmPPwYMBl+gJw3imUqHVtw6EcI08r+/XyQjDZszM1+qni6iNH9Twm8SP1dU0h0Q9RtWtzJrRKUSl63aDa3Zr7OOYhd9LIcY+D6J828=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GU4B3Th4; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GU4B3Th4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa619653e4so1544477e87.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 May 2026 21:43:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780289028; cv=none;
        d=google.com; s=arc-20240605;
        b=Sg4Kq9Z/pqIZgWvhjF5+njk6o5O2GwLLPe0VDQFcPQ4e18M5O8A3vPCBE8zj1L31Yy
         pJUEa7Dy3vJmf/X81JvdWDdvxpcY/WGR4FNKanvaCt7Gep2sVKpkYniGOy/H5noM6e1/
         SGOuDU13JD3fAQXIYJCLF9qBJrKor5K9DN6896We8TQEKyoh505kS/DQO/Ij8F1mKA18
         mOEoF8VzIvvcxU19+kH39QRYT2SQItYtcH5xtyXkCEeW/NwLLyDGRbCxLyOrt4b8JW9h
         dCtyP96i10tx63Kmp1GPadzNxADgHpUWPv4ENgdOPBBQZJxMU9euyESalE/qUOGkHMmm
         9q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zR1cIlAoMp5j8gAxy1mhFkkWhyjEsDYxuuZyh1K4KzI=;
        fh=of/PwppgZtnONgrjr0zxSjSV95ae9wxE21Zrg+ODk18=;
        b=MSLCayk2OnbnZuXiloDFPSRDwKhL6vZBQ4elflBVsQyS+TDv83p2zwzmB3HeLQM3rb
         L8LJi+Qbja40cGCiJeyLSuustvOqoPdxuwi6pNIGKHwHlN3b4/tayrOc3Lo6xy646/9j
         D5lHuswD6J0TRoktqyC9RbegB2WJEfNrLJgTCdLL/UqDVl8yZ7z5W5vNp6XAFAVBIHUD
         3evDDaHh0VJKo52+nA3AOZP54hWUFA9Y0jGDybuICHTfM/Z189rNFkxyx0MKC9VLjiuO
         +VwPnDXGSQJhLAkNuoTrrOPQTlAbV3yXk61mGk2SSmAgmacehpWkkfVd4pE4O/wLZTS3
         RnCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780289028; x=1780893828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zR1cIlAoMp5j8gAxy1mhFkkWhyjEsDYxuuZyh1K4KzI=;
        b=GU4B3Th413j4l4tsAV9YYmGKhnCX4Y9Pv27faVMb3jm+tihV0k8nYkqXupi4PPQfBq
         3gyUmc6m6dBBAsM3zr/zihu/LDY88mXFr4a5S7B/gVS/nubDPmwJDIitSFZxas9hpoZ4
         t33nHv2KB5F5JDSZG+xDC1WCTAKNknx3Yo6oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780289028; x=1780893828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zR1cIlAoMp5j8gAxy1mhFkkWhyjEsDYxuuZyh1K4KzI=;
        b=WBGFdoWMcGiPysr5XJ35aa9mHaxFUqScUswQNLV4B5B4ymCUABQ3ExaW9jkt/8xdXY
         viaIJ8ISMrW1ju4rEpfxKncDf09TP8t6FHW4c4XXcTcpBkh/Uheg1QuK3o17KqQRU0HE
         b8vyZBqpNY2QTOzMmQ28Dp2zqu4ulIVioJ+Y6NyQs6pmr80Wiu5G9WcivEeSsWpH6tY4
         T8yTaQ0zOYGtQLLvTX7V1HRTn2Wngn2ahPtXPZ+Kk+gW76pJZZKth2/9ZXZRwtpO3wlI
         4TI0E4HpB3rvICP5kfcyEINzdF/wxYhvZY5HSrNQUATv0zt+kZeRrs2NHnkB6tXy858y
         DuTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ktE/zhxPzqLMw2B1NBThLLOwNYugGfKHYGW3NchoVGbEZLxZwVF+G9E0lqBkQTBLX3dAayREKstTeKcOETOPokQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvdpn7AH2td4aIZaEc2bvtqBG/d0eIB4SCkQfCYNrxwPXVA6fF
	nn7sdU98fx9F/eXHjKhLWMcq08yjT88+8QF0ZYo6O7oruB65olQ6xt+ye1Qv2st+V/JwnTSOd6q
	7ux51JO9ZjVUBULKRKYuSZ9hrVKQdXk8O0MAmr/sc
X-Gm-Gg: Acq92OGyjKhbERa2vBIGQ5IPxUi/DnmDf8qEbib/tCoOwkuKlBPX4uejZvvJU1i+som
	I8nbfxOJAkwZ4Kfpmxt4jCL+wxA4htykJgh0u5jND1C+HwZYMTQtMdczkQ1oEaHm4aqMlAaVDlf
	JY/p/vdmtwQ3kyYoMLIDVvaxyRMo4mtqCUUthNiBoooao4Caq+71fih7J7+ljaqf1U9JTRFsgcE
	O++8qUqY3WiJg1c9stEXK1Nh/hIDe8PCzi+CKS1PdDF1EbY9cpROg6e3S9cMo6fW02CsZp9vzrR
	g27f7xqXhX62uPuwoi0iisQjNWx1NagN53jDjlaY1VZ6Jt4=
X-Received: by 2002:a05:6512:128b:b0:5a4:a85:ba3b with SMTP id
 2adb3069b0e04-5aa6145b9f6mr2247218e87.19.1780289028315; Sun, 31 May 2026
 21:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260408065112eucas1p129f600747c27e999ec3d42504bc0fd2b@eucas1p1.samsung.com>
 <20260408065055.1353444-1-wenst@chromium.org> <d568fde6-8033-45c1-a2e1-13f8112f1193@samsung.com>
In-Reply-To: <d568fde6-8033-45c1-a2e1-13f8112f1193@samsung.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 1 Jun 2026 12:43:35 +0800
X-Gm-Features: AVHnY4JEx2SIxzD-JGLqt6co1RnSApTjEWdemWCmhyaNJcHSwWHrqMwqc83JIHs
Message-ID: <CAGXv+5HvO3OjBC=u4EZeB6Aza6oSN0KWrvbQgWEnR=jskczvwg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos/fimd: fix register offset type in fimd_trigger()
To: Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 2:35=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 08.04.2026 08:50, Chen-Yu Tsai wrote:
> > Sparse reports:
> >
> >     exynos_drm_fimd.c:992:39: warning: incorrect type in initializer (d=
ifferent address spaces)
> >     exynos_drm_fimd.c:992:39:    expected void *timing_base
> >     exynos_drm_fimd.c:992:39:    got void [noderef] __iomem *
> >     exynos_drm_fimd.c:1005:33: warning: incorrect type in argument 1 (d=
ifferent address spaces)
> >     exynos_drm_fimd.c:1005:33:    expected void const volatile [noderef=
] __iomem *addr
> >     exynos_drm_fimd.c:1005:33:    got void *
> >     exynos_drm_fimd.c:1007:33: warning: incorrect type in argument 2 (d=
ifferent address spaces)
> >     exynos_drm_fimd.c:1007:33:    expected void volatile [noderef] __io=
mem *addr
> >     exynos_drm_fimd.c:1007:33:    got void *
> >
> > Add "__iomem" to *timing_base to fix its type.
> >
> > Fixes: 3854fab24e89 ("drm/exynos: fimd: support LCD I80 interface")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Inki, you missed this patch as well.


ChenYu

> > ---
> > random warning I found while checking for the size_t warning.
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm=
/exynos/exynos_drm_fimd.c
> > index b6abdc4f2b0a..695d3515d421 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > @@ -989,7 +989,7 @@ static void fimd_trigger(struct device *dev)
> >  {
> >       struct fimd_context *ctx =3D dev_get_drvdata(dev);
> >       const struct fimd_driver_data *driver_data =3D ctx->driver_data;
> > -     void *timing_base =3D ctx->regs + driver_data->timing_base;
> > +     void __iomem *timing_base =3D ctx->regs + driver_data->timing_bas=
e;
> >       u32 reg;
> >
> >        /*
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
