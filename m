Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA25328DB;
	Fri,  6 Sep 2024 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606054; cv=none; b=gHyFmGtF5OAPjooWtPRfOpi5aP/4eJlE4+3Og/iAPxOu4BYqNLcuM3xUpFhf+UqzxW9dAUJLxbAQ4TWzIJbtyRC/JxbO+QfTmxJw4l4OPYG6zXEWryhfTCAnDzdShJwu0oFL+KkqL8EXufY7Fsi+wMHi6BoG3b+3kZs040lslvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606054; c=relaxed/simple;
	bh=a0IpK29gcRaxiGzYOqvJwcXihlwviNea9FYnuHFI7gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOYprlEsBRxkmilLz0GRnCnQfxM6jnVoe7HYbuaeqIE5phmO9TRXVyRRCqYVt+ZTGHdHxeEC4Ble9gEWeZqs6nw+em1zffPrrvPmpPspRrDSVElVAVqGDA1dGGtsNex3jUtMcANs3frEtYD61i0vpJkw7fBDNoeVs8TK1WQJEOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/uRYJmt; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/uRYJmt"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-49be3d534ffso49470137.0;
        Fri, 06 Sep 2024 00:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725606052; x=1726210852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3Ez8XYl6eL7ErMydWXe0O3lPOV2uCplEY60l4avJJ4=;
        b=Z/uRYJmtkz142oOnZp2sd3uC3Y4fxN81ZcPaeG2KHZIup3kRZJXwFw6p3fjYJUKAjv
         n5zDIVpVCD2dg7bZ4bqOBN5LMjOOClRsEuyOhiLxBZ/SLZbzHN1F+mUn1KsAVjmLPBpM
         292p3CWG9xd4WUoRPoOEB2prA4Q2Cxa4T4iePC/ZcOJpPegefgF0ghRfziaMJ2FvJc1+
         1OSrxjVL8Zab6pR7BJbLRhwvbmcGRjcxQjC3GeZo7EznpJqZAEH1EVBecTokB1LP8CVe
         u3borzCwCdLrNpE+oycn8Hh7oeYXonOJBQx/zgzP/qsD6VrMkp1xRXjWu3z6XM2QEKDJ
         bL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725606052; x=1726210852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3Ez8XYl6eL7ErMydWXe0O3lPOV2uCplEY60l4avJJ4=;
        b=sPGvkHfrAuuT3+7VTBSoTjtlQyn76pFz08sWUNmxT/K0ijyVYJ4GMAuBRwvcK7O4SQ
         zDRtA5m8fq3JM/I/0WxVolEGp1HX0b7HkrN+zUkkjLZVU4QO1HJWh8W7McsxJcev19tn
         NO8oyMXpeIWxXtFgh7iXkg/8OLt+skrynvF8HkYtZIMqVwzC4La8bS+8wJSbSfx9gXp9
         QMZ0PI6cux997x7pnnp+ZEWe7YqXvqM4A/XzlSH8BJCwnztgdq6Omj4jfEo1OQigskce
         bjJAIxKfoanSdrECrOLbSTvV6oBVn4v2fA1Ljzp/irYX2E/4ATm9gQcW2HbS1tlei2G+
         NPFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrsjQUt36o1sQW0t0qFlay4KGh3HqoWfKoSIfH3zYOizSVgQ7MLpNcIvuCsxMrHYQR5njD0NFORiru6p4Q@vger.kernel.org, AJvYcCVSqcC7KmsdBOgNFqY3h5weI7cS9YR+BKaC5t1KyDoMYa6ej33s3kC1Bzan/5caZfAFtCNw8M2tFrnRMkT/00U=@vger.kernel.org, AJvYcCW87F9mj+V0fLVyIw/4EYKOktv1w3LdCXdayNzu5C6CrODsu9rVJIQLYW2BMz0yIvl8OqWfBMZAqgrCVkUYWgj+g1k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tETGBPjfUdEFLbKHq7lb0c+fMMgJRd+gd7X4Xp1xuWxqmV4U
	2c7QJSjCi9mGPEGWpbqqKdR/iyG55vRyt8/yMwd4uYKTIXBRMZMI4LqE2j0ufDOQAsYR97IKXnT
	GLeXDLnumd/pwjrJ+xU7hdQSGxB0=
X-Google-Smtp-Source: AGHT+IGdsNQUsmbUOUI+orNngMgxpsTQdp0snOH8gbX5DALySfY8923JRytGglN6HweIwISXhyNuq567FwNajE1v7us=
X-Received: by 2002:a05:6102:1625:b0:49b:dd30:d168 with SMTP id
 ada2fe7eead31-49bde130e32mr1997788137.2.1725606051772; Fri, 06 Sep 2024
 00:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7c4a1ca4525a1d1429c9f16ccfc6d8bf80fc2b63.1720942618.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <7c4a1ca4525a1d1429c9f16ccfc6d8bf80fc2b63.1720942618.git.christophe.jaillet@wanadoo.fr>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 6 Sep 2024 16:00:15 +0900
Message-ID: <CAAQKjZPN742hd=BJHmS+ATOwpR+AdhyhF4W0J8vWAonMKfPXhg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: Constify struct exynos_drm_ipp_funcs
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christophe JAILLET,

2024=EB=85=84 7=EC=9B=94 14=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 4:37, C=
hristophe JAILLET
<christophe.jaillet@wanadoo.fr>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> 'struct exynos_drm_ipp_funcs' are not modified in these drivers.
>
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> =3D=3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>   20446    1746      16   22208    56c0 drivers/gpu/drm/exynos/exynos_drm=
_fimc.o
>
> After:
> =3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>   20446    1714      16   22176    56a0 drivers/gpu/drm/exynos/exynos_drm=
_fimc.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied. Thank for contribution,
Inki Dae

> ---
> Compile tested-only.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimc.c
> index 142184c8c3bc..4d7ea65b7dd8 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -1125,7 +1125,7 @@ static void fimc_abort(struct exynos_drm_ipp *ipp,
>         }
>  }
>
> -static struct exynos_drm_ipp_funcs ipp_funcs =3D {
> +static const struct exynos_drm_ipp_funcs ipp_funcs =3D {
>         .commit =3D fimc_commit,
>         .abort =3D fimc_abort,
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gsc.c
> index 1b111e2c3347..d80b0d1eb734 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -1162,7 +1162,7 @@ static void gsc_abort(struct exynos_drm_ipp *ipp,
>         }
>  }
>
> -static struct exynos_drm_ipp_funcs ipp_funcs =3D {
> +static const struct exynos_drm_ipp_funcs ipp_funcs =3D {
>         .commit =3D gsc_commit,
>         .abort =3D gsc_abort,
>  };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm=
/exynos/exynos_drm_scaler.c
> index a9d469896824..2788105ac780 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -403,7 +403,7 @@ static int scaler_commit(struct exynos_drm_ipp *ipp,
>         return 0;
>  }
>
> -static struct exynos_drm_ipp_funcs ipp_funcs =3D {
> +static const struct exynos_drm_ipp_funcs ipp_funcs =3D {
>         .commit =3D scaler_commit,
>  };
>
> --
> 2.45.2
>
>
