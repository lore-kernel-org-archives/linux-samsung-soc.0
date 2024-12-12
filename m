Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ED118643
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 02:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733970707; cv=none; b=dOeXCyBAusZiE/kZyRcfL8xJAoht3+JiuxrENynTt2cmBwrAj/eCgx30od8GQA87xkpCD1IcOMlUX5hVSq2SDAUX7e/PV1y8RDy77eh8SoiGPNKZjz6QxK5eYdAhqVQ3URNEZNKaPcEn87DNE9aa4Ts5DIGb8pd4GnLIGKCTowc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733970707; c=relaxed/simple;
	bh=9pu6uh9uRK0GjGwt1qMmamdYDigZXCE2x/HlwXOB6BU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgohfnit4ZGDBbTrRJ1xMnCW1hp7lgSma2AdQeGKlCYI9M22HLG/GvQib1JcyaWMvPoDU8xVlurL5ohSmOdCsJyKmniITOvwvDTS9JyBNOfJB3b12/i5WEBqIvTcH3wYhQrQkTLv7KVFyk0MCzS+FQXxMNxz5+/Diho9DSG+UC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlqR4wT2; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlqR4wT2"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c5316f15cso51711241.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2024 18:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733970704; x=1734575504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6og0QJ2S3h7HJsWue7gf3vzk/hBEoszfL21fFLAEEqk=;
        b=MlqR4wT2SKAH+t0z8Zy4Ds/Gm3fKetDv9GcC1QrA3WNMBYLCqKLKRleK7jkpmSK8g2
         aG02ucA/ub6NBCGzHHWSrtvSCAMCxlJELUnJ+Ui7HfT5j6t5uauZzcOpBLm9L9r0FLHH
         CIakUCTQXeTHcruHcXIQbKJBzgtXhzW3qduSzejsdsNC/kMJWXaLFdM5y7bByhqKfroy
         N0vJO/NdX6kpeMIq5zjQcQdEfkMqX5N2Yp94Na8hLqTtD6OckC2Zpr3F/DloZiTyb9I0
         4UdqunRTlPCi8hjmLfGBZFI7AmykRdRwUwLdFJagQ9xvGhBFGQ1KCIwmWkz/PNxBtEBr
         +jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733970704; x=1734575504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6og0QJ2S3h7HJsWue7gf3vzk/hBEoszfL21fFLAEEqk=;
        b=UUFtZ6vjt3RNyAB87ov23CnSskWFabdxnY1dtgJ21zyg+ppyO4fkKrRkS0B0O0nC8K
         gk3+sss2vfFwFK+pVRSf0G/G2ZSPwcZ4iPVsq5YdR0qYkhmi/PAwiQVEXkNhjoMsm2F8
         iGlhIbPi102tu8hfQbkzpBdvTwdTMn1igfebYp0Kh3vUSXtvJQrnqi+EFx0SafhVuE6w
         RXxUxzgsE/VDyqoRbh0kY5MCyDQPNXxAnWv3epaTFVxtJdLgYylztBIp5JvEExqGDLyu
         UVH/z5n2Oarn4uityRBVpU6qJh+vge9om+Z2nulxl1oF/4Ob8TMfDY3IYhSrA5MRCMQi
         gOnA==
X-Forwarded-Encrypted: i=1; AJvYcCUZNUnG5DU4v5QEu1zLPauHfFL+cb3a3aEop8Yq9FWPMJtN6eGdITgLD//7LVNn9U5Nk3jDPr4XlFplSv4phxM8RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNoDFjTfRub9XbbJTo48v/JAvlJf/UPFbULDOjTy1x1f1OyWDM
	r3cnEjD9+pElKft52MPplSfB/MibBLEpsg0dqjZvVEgBXxSL9BCCcLHnieQ39hhnTckgNLiZOAy
	crYIk3K8xAraXvWoku/DItML3jaU=
X-Gm-Gg: ASbGncvLfrkv94wBF04fN/XhV7W2Iyrq5aw8+eE2dSxu7LnVjqgC42TU5i5t8YMF/eW
	LRuqZw0n4tYsm4OAS6LLd28FP9fQupCMCwgEa
X-Google-Smtp-Source: AGHT+IGNsNCgBmG79/swXJPi8C8zSBdsU2p2UOH1lPp9B1MI1N0EIazQCQv3y3EW1IUuXeOyXZY2BygT5h26W1N/y5g=
X-Received: by 2002:a05:6102:b11:b0:4b1:130f:9fbb with SMTP id
 ada2fe7eead31-4b2478e161amr2912068137.26.1733970704638; Wed, 11 Dec 2024
 18:31:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206114531.1271123-1-guoqing.jiang@canonical.com>
In-Reply-To: <20241206114531.1271123-1-guoqing.jiang@canonical.com>
From: Inki Dae <daeinki@gmail.com>
Date: Thu, 12 Dec 2024 11:31:08 +0900
Message-ID: <CAAQKjZMuJc1y-6apj6KMVrg6WMVkLbpZ17A=+G6X1OJep+4rPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: Remove unnecessary checking
To: Guoqing Jiang <guoqing.jiang@canonical.com>
Cc: sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@gmail.com, 
	simona@ffwll.ch, krzk@kernel.org, alim.akhtar@samsung.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2024=EB=85=84 12=EC=9B=94 6=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 8:45, G=
uoqing Jiang <guoqing.jiang@canonical.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> It is not needed since drm_atomic_helper_shutdown checks it.

Correct.

Merged. Thanks,
Inki Dae

>
> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 2a466d8179f4..461384705cf9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -357,8 +357,7 @@ static void exynos_drm_platform_shutdown(struct platf=
orm_device *pdev)
>  {
>         struct drm_device *drm =3D platform_get_drvdata(pdev);
>
> -       if (drm)
> -               drm_atomic_helper_shutdown(drm);
> +       drm_atomic_helper_shutdown(drm);
>  }
>
>  static struct platform_driver exynos_drm_platform_driver =3D {
> --
> 2.35.3
>
>
