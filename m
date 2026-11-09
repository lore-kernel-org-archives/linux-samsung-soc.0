Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794199309;
	b=BMRxJF9Z8IZKSYAoIJ3Kk5zWKNNCaAHWgqkIIm4MOzfmMVJxIsyEnNut7o4MKRcTbkBu
	 M3PL/H0ZxLXmSwGcxjryagxLWDxV7XgU1oyAYSkF0CXmiCzyckp23CfMJuEf9ui6njN2Z
	 A9SxQhR+39B4qv2N728ZACRdKigOmOvS1/Dh+M/6ColjpiUHmXLpHZiEKO9RWtojLm00M
	 e5eBv8ZCOfagK75Js/FpmKhQY5Vhq8ZQ/idATskeP4vHU46n+84rfvDXIwsrlWH2EjgLP
	 7sufa3Ox+PEKVIx/LBG8XMdv9A9mOfk7e7INW5SvDFWqlEO30n7lEeQqfU1uF5VF59A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794199309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=27RG8D8CerxM4BmQ9ucwQVVSwZlvRge1TEEkPaNQ8Qk=;
	b=JeNzMqQf+B0zTC2lb4+f/7KbDjKy6nuJy18X8a8MgbLfVliNgGzfg4/2nM+fivkCJjWq
	 QTwZ+lGElIMNB8AeDco2HdocenduNT22ucOvgpR7wH7ZGuURHMDg4X6oOZhlMBrliNN5L
	 Of2Y5pwKpD5/1M3FDm0VpFaDMvVNr6+x8oUadVlUoO18j2yOoMe/WQ0h8zUguaIgstccc
	 yHIKZ9OhofCSBoE9eTYYjiNydMs7+oiUp3d+dXncxVs8rx1BDmEJbQrv9/XtNtzNFKHom
	 qqS772jTmNRnpb9D1J8CeYcdXjDzbRAQkFnikB1S16H1/pDqI3uux3sjCPoj5HZgBIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XL67E+6C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC09606A32A
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2026 04:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC09606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XL67E+6C
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d473cfff6so57599766b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Nov 2026 20:41:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794199307; cv=none;
        d=google.com; s=arc-20260327;
        b=poctat/P2e1vtMuipN6dvZ7EYnrtw7ZlNAzPlr7/Ey9vZzAF9D05CKbN9mHgTvF7KY
         KXoIs4EOfZFiOaUsu5Fid+2Zy8jOF0EEf8thDJhNQBBm3AQT4v8utbtjfu/KkhoFCwse
         oeWPXLZ2jmF/1NGvaYju2HWJ/dqp8atwD839TY6VhqMilr8kaWruzzSZDNQruEqBFP23
         9AfvCq8osxbzDad7YcmTqaoov9aB2bX5tUtJzxGhGLYmziNReS2EoJMaY3qqxufJsRXc
         A54D5KgA/fRrP27hL621NzeyATAnt8KLTrOSdQQ04gp3hI9cPxmYOOLX6TnDh5xKYOM7
         q03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27RG8D8CerxM4BmQ9ucwQVVSwZlvRge1TEEkPaNQ8Qk=;
        fh=lZ/34jbSpbu7eO0Nsk9VdjKlnbqQfa/ut6RZ7F+V74o=;
        b=K2Y8F9Ibt8SQI8BGFlIImh7IVmgr8aS/A1nNEF1smNJCM/NDi62OES8HU+MwSQS7GH
         ERcxYdqfA//OqfLLSjqxF3pj1fHbveqxFYhRGT+m4vIW+lISoXMR/GMf9MiLHjI27Loy
         DkKhu4MaXt/sFkH8gP78ykOGhhVHTGJFMOIJA+pyfQrNq7++5XtxoXGKHbR+PgG6g9O2
         2Y1Cz+QfIalHwu0CH3s1bcmZld9tWT73F7ptJ9Kl7ttxR3iB0QdKAWxva4RkMebypPUV
         zjgqG1Q2fXZJLwHu2/2AYfhq1nqra8v8oETrTj3DuviPHsjIsAzubM3AIsOs43c2ZOx4
         5eVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199307; x=1794804107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27RG8D8CerxM4BmQ9ucwQVVSwZlvRge1TEEkPaNQ8Qk=;
        b=XL67E+6CWlgF6TMSKOxYtrmXheerI7gxjQHnzgaJ8fObVIn9fOePSsXpAm4jOuofTF
         JUa9+99lY+OsAfdXl17zL3hpp5FHvDYFIf9QjfViZnwYD0NNrDWWEqJ4hlW67FAJMPQB
         dQYuwABZR3fG8/wG3BSpt4hD2vPDv0MQ4bZ3WCwMGSQ0wz7vDhFUYrfW6deENy/fRobF
         G+5XDXtDBwA9XC5kYyw3Mv+ab8M405NnZp86LZuTYErY080guobrxmbyglJuPwyWkK8/
         xZTCgu0NmSgTNnE2WBiHipzOOotnAdFJ4HoM8GEXJYJWF51slx7oNW8Yovbo8OhkbFHu
         mwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199307; x=1794804107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27RG8D8CerxM4BmQ9ucwQVVSwZlvRge1TEEkPaNQ8Qk=;
        b=TSuKLaNyLbziNbskwa1BbLvq8L51gsTP+n9pOkjDqo2hKTH00lPu1ngOePwm3HoqmB
         SW7Y/93PcGYfQrbh1rxut5//4MUFvW+AU21nRLHNJAsfQaVT4zPp1fAQI9C3mhf0KYSr
         5z5kNGmi5RjxKQ+g8+CNsGbB9xde2pAjMzDtBv/awRNrzLgsQg+BoffYAV5fH1m0LaDz
         LaxqciAeEiD1Ov42l6GbiHx5zRW9anMsMswviPg2PvEN/3JF5Se3X1lUlyXxqnWIOb00
         8/BQCc1sWv1RsCEwd9iy6Tq3ePbhhomwntekImKnnUCGPZmsVGz9VupDNgJe2JyBbqQU
         yT6g==
X-Forwarded-Encrypted: i=1; AL+hErFMTl4qE3HHq6Pjl+5jISizWhesaXRJXPz5Orx4bB2ziRH4ZWRcMhCfPxwBzqIva1pznxcSvrtXsDzwDtD3Xbx1dA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8o1z5cEeUyv/jRLhm7dQ0MmkLsPJN9RP9ZDkKyAb6ST2x9oCHb
	nAqsqecPU06+4SbRidfZhkVcxRQhtqYAG3A/tcIXaTm0RQqdEbYBOzOV8QdaGFaw6GQbIhdO26G
	YNfsQEnu20V10KugRx0mlx//jnh1Ypobhj5EwMY8rVg==
X-Gm-Gg: AYBFou2IJlw2QTyZ33BoP/aM0svy0cR63jnlS4nIapfFztTiZ9NsX95sUxoLJ+BhgA+
	UKgqTEB6eybmZhiBHnBHuuKSMSgd0/UbaoAMbIeXV9UzSCGWMsocjfyFYZf7yOb9IdZHHOng6AH
	qwE4FvVnpW3cOzvCkqieYv/EsgjUlauqDZV59uYVSAPxE0bpCWXKEOctPDZwT9JGHvWy2+kDd2i
	8Sn6gnkmHOidwRYwmLRaY6cZA8+0f2uo1Xr/2dFlcnbzM7EZvFoEbDUittmF4F09ISt5JgWlc+c
	E48outKNTDhb6p9tFCMctqoMHFRyWDpMCl5PZDBuGSEGPnNrOSCCFmv884M65I2EqFsYZCn7iEv
	3PJ2W7jUJYa5ZlM9t9xdw3R3L+2SXPd25gMAsV4J1QyhiAk8/hmTl6ZD9l0qo07sIlVY=
X-Received: by 2002:a17:907:2d93:b0:c26:19de:9aec with SMTP id
 a640c23a62f3a-c4d6dd8cb24mr224378766b.43.1794199307082; Sun, 08 Nov 2026
 20:41:47 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005001143.576737-1-rosenp@gmail.com>
In-Reply-To: <20261005001143.576737-1-rosenp@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:41:10 +0900
X-Gm-Features: AclHuK-aAUizeCRuM8WnAlvp8mvibSB9oiekBPg9ucUpGQvhhZ0l_iKHx8QZ7R4
Message-ID: <CAAQKjZOm5vA+38XVo5D4qV5B9eRT1seOShk-eFk_Jg_EQPdaOg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: gsc: allocate formats as a flexible array member
To: Rosen Penev <rosenp@gmail.com>
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

Hi,

2026=EB=85=84 10=EC=9B=94 5=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 9:11, R=
osen Penev <rosenp@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The formats array is allocated separately with devm_kcalloc() and only
> referenced through the gsc_context. Make it a flexible array member at
> the end of the context and allocate both in one go with struct_size().
>
> Annotate it with __counted_by(num_formats) so the array accesses can be
> bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.
>
> Assisted-by: LLM

The allocation and lifetime changes look reasonable to me, but
Assisted-by: LLM causes checkpatch.pl to report a non-standard
signature and an unrecognized email address. Please describe the AI
assistance in the commit message prose instead.

Thanks,
Inki Dae

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gsc.c
> index d9637ddfcfc4..f1807ef664e1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -99,7 +99,6 @@ struct gsc_context {
>         void            *dma_priv;
>         struct device   *dev;
>         struct exynos_drm_ipp_task      *task;
> -       struct exynos_drm_ipp_formats   *formats;
>         unsigned int                    num_formats;
>
>         void __iomem    *regs;
> @@ -110,6 +109,7 @@ struct gsc_context {
>         int     id;
>         int     irq;
>         bool    rotation;
> +       struct exynos_drm_ipp_formats   formats[] __counted_by(num_format=
s);
>  };
>
>  /**
> @@ -1222,21 +1222,19 @@ static int gsc_probe(struct platform_device *pdev=
)
>         struct gsc_context *ctx;
>         int num_formats, ret, i, j;
>
> -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       num_formats =3D ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_fo=
rmats);
> +       ctx =3D devm_kzalloc(dev, struct_size(ctx, formats, num_formats),=
 GFP_KERNEL);
>         if (!ctx)
>                 return -ENOMEM;
>
> +       ctx->num_formats =3D num_formats;
> +       formats =3D ctx->formats;
> +
>         driver_data =3D device_get_match_data(dev);
>         ctx->dev =3D dev;
>         ctx->num_clocks =3D driver_data->num_clocks;
>         ctx->clk_names =3D driver_data->clk_names;
>
> -       /* construct formats/limits array */
> -       num_formats =3D ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_fo=
rmats);
> -       formats =3D devm_kcalloc(dev, num_formats, sizeof(*formats), GFP_=
KERNEL);
> -       if (!formats)
> -               return -ENOMEM;
> -
>         /* linear formats */
>         for (i =3D 0; i < ARRAY_SIZE(gsc_formats); i++) {
>                 formats[i].fourcc =3D gsc_formats[i];
> @@ -1256,9 +1254,6 @@ static int gsc_probe(struct platform_device *pdev)
>                 formats[j].num_limits =3D driver_data->num_limits;
>         }
>
> -       ctx->formats =3D formats;
> -       ctx->num_formats =3D num_formats;
> -
>         /* clock control */
>         for (i =3D 0; i < ctx->num_clocks; i++) {
>                 ctx->clocks[i] =3D devm_clk_get(dev, ctx->clk_names[i]);
> --
> 2.56.0
>
>
