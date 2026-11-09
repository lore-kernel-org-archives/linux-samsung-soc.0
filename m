Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794198842;
	b=SVVY5iDc/cpNHLjoDeJC/Xk6qRrStH7QO+Ulvu5nspyOh0dw8NceZbk+F+NmAE8qOx+y
	 APBAd08spqnQ5tCXiYtBCPyPiEOAQk8RBiOCOYrLaXCMPFb6P4XzwFKwil577IZaZ2Quh
	 sEZ7M2B54Uvn9Ium4+iBzD0MuQ4B78HzzpAznA8y5SWSg3RVFLuPSq4pNFb7YrKOqvXDh
	 R+TdIl6vxvKkb4b26079cTYQYX9rvAFTKrTkjuoCz224uSmmWBKx46savgjroyQExeZtk
	 mn5AnygLN9qHO9JpOsmhXL+UsBNdZSHeCu2jnPevY+Vx3vMboJugFBgw2jp1grvySbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+KZfMQTyVl02e8ANbgPdMXZ52kWV3/1B9wyIuCkTXxg=;
	b=yGTytfyQBQZJvE4NMGZeQMXZmoiQ8et2TV/rK/WE02gPM4poeHjtdEWONwvgL/TXL2nb
	 W2x/dFg0p6A2kRG+a2S6t6G3VdfUyir8h7E4tkOBsSV0iLSZP6XsVkKcHU2pm0bjwBprr
	 mCd+Z1MtfYCGq6XoMSMYNtirOxMSOcb72KqHe40QDvYTIxCbmjOIqcfboz2jF+zY7unUc
	 SwdX9iiW2KpIOnAaEiLfXPzCWiKwv91B3ZMuNxjIbhZY2m5o2bNy6pkdC9/fhmyiD0PRO
	 1rieJfAFkny5ZXC6Qs/41mw0tkP4hY1j5InH6+TEtLiOkMvxdaAofPAoPjNI6noTgog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cE+TvgUh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBE2606A33F
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2026 04:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CBE2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cE+TvgUh
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4ceaee6770so57898266b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Nov 2026 20:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794198840; cv=none;
        d=google.com; s=arc-20260327;
        b=aH/lhSOV+QT12YPNSGTTTtCkdeqWqMc0DOB2/9wVXTk8Czd/SMCvytlkbqJnidIIEc
         p2aRc6UAebAPBucshapjWQYZe81/DLTbtPnhPkuDSD/VUEdYKOcqEFxRKgssF7oxzyaR
         QmTjl/mjiJXxjFnqZxE3t3gPTOxuMIw4hzEx/rB+ASYVaW0zYvjBhaVarSRBdIgJYqQC
         BqiMxbZwJfyCJ8BpQSrJijUMXpzF6llvu5/BLUBchtm2dUBeGgOnQrk75f6DWKXT2y9R
         scNZ/Toam7IONOOFuy/a6xlsnztz8s0u37E4cw4uBsvZtjSjvbx6c4Q7fyKkgeOiwumH
         Tb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KZfMQTyVl02e8ANbgPdMXZ52kWV3/1B9wyIuCkTXxg=;
        fh=6nP9BLrHBGbEy9Z8bUwHoZNY4Ae+kDV0T1z6qbYiY6o=;
        b=jRGNrsKcrxEpVuP0uijxuseF/LG29fWhzY+Tqm9zTU4oc9Q3Ut3ziou31rcGGH2ZKI
         9LLhEM2HjL4z0rnpVSevyO7lEL2wm61vklMVyp0qwCTKLp84dFoZwnMd0lf9wttKpJXK
         Q/w7gd98ckXRxaM/fuST9ND8bquYTUrWG984cdyIgSyAf4NAPWjfBX7Z3CledoRQ5LDc
         C/+hs9uN6ndHOXBLUOQ0ABzJcGnrFlW+q25JD+MXdSzOYtAED+iRoSKeU8YKWAtKE5Ec
         lc3tnc+L6W0W9G08ikB0bMGr31swC8OxGymMvmNFG9mGNC7B1q+1hcQEyNzlg7sPx7yC
         80tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794198840; x=1794803640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KZfMQTyVl02e8ANbgPdMXZ52kWV3/1B9wyIuCkTXxg=;
        b=cE+TvgUhFThTLr3JE+C1ZlQ+Q55N6LLNa0OrEiv09d8eghwiw2yMa6WZV12mkUrdMl
         6Mvy1LGFKpPerf4MWw5xwfnNBxN2q7iDFIUUYYvKZUI5mNWTU29YtpXqsIEYqb38YrVC
         87R94ilSNUWGde3/XNm3SoMTaPSPkCN/sD4icSKv0BxLBA0NndnohpeajtrujTTERf+o
         cyPO5iVi7O4afFUufZoGNOdUi+2WtqRUVXk7xsGwOd/glIUVjMg4D9DmY/t4Kk7N0J6E
         5sl3Ulzmz8xDP4ew87+pN+PBjCzZsZyUUn/faa1N5nFEUcx6Hbk6sgeo4HN371cKMSG+
         kM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794198840; x=1794803640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KZfMQTyVl02e8ANbgPdMXZ52kWV3/1B9wyIuCkTXxg=;
        b=ROYq7RBcSkQOiPs4+DkZ0h4Jtajf8Ug55CBuH+g+Te6lZx1uFN9tEmCZWYG5G0Hbx0
         +uGbXR38askbh3MhVdmi+fgNqO+I5OiEC++hvrWMPok9jujcwPPi73PYLtQsKf/pgEAu
         mjaPuk1J3AmsljwVsmR9899fZlM16vGsI+HBzpzfGd1bM5Zmu3dBIyu1aVWP6+kQbDwY
         vViNhYncy0jTNIPIQ5P5P+pkSLFJPVQVZJgQm3Mm5MDnqtL7DZkMfs2SvxmCSbmKwRoU
         6qA2kFJ1S3ZUVTemP8mZT361ZfJNtWQ803T1hr8S9Ee1BcWAuNBQMvynUg7Pcx/U4HVx
         y0sA==
X-Forwarded-Encrypted: i=1; AL+hErHH9BKmRDXtIH4ZEZtjkhB5wFi0yB8MqSeaWIkOxHPbuX+xn/mmHS/yuJGYBAqVINlYQIA7f/Ntk236sjIXYyatpw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+oqe81BsrOBAJy4LMYOW/DfsFLMIoWo3wXxjcvf8/JdZGyRCRd
	LaBQA/wlK90K0HsV6R9pkfS4KZPY88oXvOFFEhndhP0Jpqshlf7gn+UqyuDVesX5Ja5E4ayJMN8
	KNwitqfRor7jn+adt6zJn95i6lKKsLVo=
X-Gm-Gg: AYBFou1RK/pAjhX3Qk7tn1905UFWxC+rvQ09eyo2/2Gwj0A1zwfBoXf0JJkujN9ifyZ
	pNPYcpU4Ds6j0uq8cSApCal/2xQ1rX6jALQ0T/ywsuEU/7HY3th+Uoh4sidNrq3nV5kmEICWo68
	0DpqzUcVQ+dlfL51P/BQw+e/zNbdPWCFG0ZLQ2cWENemVE1+Csmfs5aNOU3PKPeuhJBtM0MKd6p
	E7cByKU7xJ06sKfLIQJLUYPhsn8TKZvpoB4rq/LlmKLzuHycsYLIfbmWFy9Ro2KJgrMqRVGMwz9
	/dZVwuLwUtfEAma7k5jZR23awvzep5UllAnTIoOunmpXWSV7IAYaviHufLBAGZsJfNH9bxF+Rw/
	VZwBvhgvjdQH7W0eiO00eVHG/L0rRXUhJ5uM6pn3J3Xx1vrZMc7QGxjgqc8myp/21KLNmK4SWLM
	9o1/KxNgp8BdlS
X-Received: by 2002:a17:907:72c2:b0:c2e:4292:d268 with SMTP id
 a640c23a62f3a-c4d6daf7c64mr226694166b.16.1794198840452; Sun, 08 Nov 2026
 20:34:00 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005001118.576198-1-rosenp@gmail.com>
In-Reply-To: <20261005001118.576198-1-rosenp@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:33:24 +0900
X-Gm-Features: AclHuK8JGFlUXZkSE5CgvPvR5Q5pqnVQnyO-MTmGLdNc0lY8Yjx1OxeFaWmjmHc
Message-ID: <CAAQKjZObmQm1X28cbpjd+dEVx93wfBwKNaaaxpU08o8JeFaZfA@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fimc: allocate formats as a flexible array member
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
> referenced through the fimc_context. Make it a flexible array member at
> the end of the context and allocate both in one go with struct_size().
>
> Annotate it with __counted_by(num_formats) so the array accesses can be
> bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

The allocation size, initialization order, and format array lifetime
look correct to me.
checkpatch.pl reports an error for Assisted-by: LLM like below. Please
describe the AI assistance in the commit message instead of using this
trailer.

WARNING: Non-standard signature: Assisted-by:
#57:
Assisted-by: LLM

ERROR: Unrecognized email address: 'LLM'
#57:
Assisted-by: LLM


Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimc.c
> index 09e33a26caaf..079d24d0671c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -99,7 +99,6 @@ struct fimc_context {
>         void            *dma_priv;
>         struct device   *dev;
>         struct exynos_drm_ipp_task      *task;
> -       struct exynos_drm_ipp_formats   *formats;
>         unsigned int                    num_formats;
>
>         void __iomem    *regs;
> @@ -108,6 +107,7 @@ struct fimc_context {
>         struct fimc_scaler      sc;
>         int     id;
>         int     irq;
> +       struct exynos_drm_ipp_formats   formats[] __counted_by(num_format=
s);
>  };
>
>  static u32 fimc_read(struct fimc_context *ctx, u32 reg)
> @@ -1273,20 +1273,16 @@ static int fimc_probe(struct platform_device *pde=
v)
>         if (exynos_drm_check_fimc_device(dev) !=3D 0)
>                 return -ENODEV;
>
> -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       num_formats =3D ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_=
formats);
> +       ctx =3D devm_kzalloc(dev, struct_size(ctx, formats, num_formats),=
 GFP_KERNEL);
>         if (!ctx)
>                 return -ENOMEM;
>
> +       ctx->num_formats =3D num_formats;
> +       formats =3D ctx->formats;
>         ctx->dev =3D dev;
>         ctx->id =3D of_alias_get_id(dev->of_node, "fimc");
>
> -       /* construct formats/limits array */
> -       num_formats =3D ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_=
formats);
> -       formats =3D devm_kcalloc(dev, num_formats, sizeof(*formats),
> -                              GFP_KERNEL);
> -       if (!formats)
> -               return -ENOMEM;
> -
>         /* linear formats */
>         if (ctx->id < 3) {
>                 limits =3D fimc_4210_limits_v1;
> @@ -1320,9 +1316,6 @@ static int fimc_probe(struct platform_device *pdev)
>                 formats[j].num_limits =3D num_limits;
>         }
>
> -       ctx->formats =3D formats;
> -       ctx->num_formats =3D num_formats;
> -
>         /* resource memory */
>         ctx->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(ctx->regs))
> --
> 2.56.0
>
>
