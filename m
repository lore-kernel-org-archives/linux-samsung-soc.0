Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DD429B78F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Aug 2025 17:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754500680; cv=none; b=HovgvV80qZEZYa6tZyL+xbdBGD3Nf3DQQx+3U3UljyY8QW+HstzalsJw0KC97DN+vfdrR9WrvUiNMOu548mNNYbL1x+a/uUGO7nnsl7VzxvuMHW8r0tuV0BewjgH9xiUyah0Oxwf/31A+tnKnHzuiTR2GNdUuYClbhzOvpO5JCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754500680; c=relaxed/simple;
	bh=Y0fD4MpRo3g7NK5y3s9VeqYtv1/oJ4ikGjJ95epd7uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRxlg72mHBZr0i56dNpwLa52Gkmv9RWB0RPoCUOUzZp6eOXbgS9HBQ3ob3+jM2YcKIV+61ls9qiYuRp12xh/xbC5nueKXZzs5bumMdq2SjVW5faIkWCtJ2X+9O7WFf3nz8uaAR2XFAa+/dHv5bGEBgqc75hmCM2heGY9ughD+8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=snZU1FjK; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="snZU1FjK"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e8da1fd7b6bso134639276.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Aug 2025 10:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754500677; x=1755105477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCJFY1Ry1l45cujmFWN8iUaZroZ2v+N4zhO/u5g0qWo=;
        b=snZU1FjKYXt9Xjr3LWONV8Z5qsaR+qsU3ZZ8DUO2IxnBmbXN+ci4hKywQpjvIOdZgz
         Jx8P9J0wteBg9JhbPUpxI/fh5Q9PVnqh0XtKgr/2S5YZE3jhEHhiIzG++vXXdccWt03e
         OmLMAgxzIeo5p7C3/joiOxauQ0LYPI1YFAcE2jlF0l5F+1diqR6W0LWnIUxG7ArcFp4D
         +upo7BrtWilipH/UOlIrOAwAOcwDDP+oB7CdWWTnZmov+4c5rpGEJnymnE7u71M2aXpY
         2TjKCBySiYDFIg2h3QqqqE5g03nGcVTLuF/7ysX6rUdV13sUGHQV4bfOY9dcE4wLpS4s
         jRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754500677; x=1755105477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCJFY1Ry1l45cujmFWN8iUaZroZ2v+N4zhO/u5g0qWo=;
        b=oYqD88XeMtIjby+xQB/wojmYiamjx/8elJjSP0jOmXrCy8+9ce/mhhU5plCNV8kX9v
         cvBt5CEUPt2cmLHHxMWPBKDOwzHuZ8Ilb68EdxErhGIDAUlVSPvjOMGdf/B5YZhx2zCZ
         Brxhai3Trd85+GcesPK1P2A0m8GtR+vXQ9rB0VCviLemBSNM9L4MwiVU4pVmx6hOrUwz
         nRRbAEw15JYPDE1eqCGD+oyQjDuGQSBA6t2QZVKYj1oc4CHS5DiVApph9/50IyHIBmgY
         fb1DLMp3FFexPN/WNkSLwwRpXY2BAnrZDdrF5XoDVlo6gcYjaI7hvrFilEhXt3h9/O5e
         v8uw==
X-Forwarded-Encrypted: i=1; AJvYcCUm+hO4qZsOp1ISv937/cafdfscNqrVRaY8eKgMMnZ9bBycrtrGH0ZzzcdRetEny8dhdtQOL7TGJuCv2aIumOBd8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNzJ7cHS83GgP+a5noVZxMYuIhmW+FNhZxjwUqrD36WaKBFDhN
	USbkHmdmUOxNi2e8bHk3ImQ3zPSafLmVXcBPG42ElQtjzHbmbhf2/1K1ZUwiO2U6zl1ZPL/E4yK
	VD/Eph8iXWlW1VG6RDWv8LgSg5kWameSU3lmwi1pa9g==
X-Gm-Gg: ASbGnctcVqjc2LcGks7798eLimhx5pQWoC20N1zB3dlyNjjKJ3Axr0HAi67UKmjc8z/
	sEK6zXJ99m4nmvM1rjVP63dm9AT5Gk3T2DlHKnfB2cXmb8aAhiCQl5i4u7FY/FBiB9MOtgqPIVK
	VEcVUs7/PJWuSZxFocYKCmGd4DMcWPxPirmBXH2edxitXe54PA8aUAsl/Y523/kBDkxQHwIMTsk
	QU1ojR0nb508kb15JboFhWDFtQ=
X-Google-Smtp-Source: AGHT+IF/PATUAgO1kyiILLwJ2Hz+mfCVgzAsnenKM/M4eB9tFIphDugm0X2Ki4Larr5HlLbqkJkCKKOb501IL1PCi98=
X-Received: by 2002:a05:690c:f03:b0:71a:3484:abe8 with SMTP id
 00721157ae682-71bc98866fbmr51496647b3.34.1754500677372; Wed, 06 Aug 2025
 10:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250806070029epcas2p1f764301b115b766f88b422b0dbdd68f1@epcas2p1.samsung.com>
 <20250806065514.3688485-1-sw617.shin@samsung.com> <20250806065514.3688485-3-sw617.shin@samsung.com>
In-Reply-To: <20250806065514.3688485-3-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 6 Aug 2025 12:17:46 -0500
X-Gm-Features: Ac12FXyGsSXeAvPSWY26uUPOsx4RabuRz1OCuoO1ZxYtOJ0aBX2ZDz4rGIPWY70
Message-ID: <CAPLW+4=Lf5rs3p3+D17HDGYd1FHk-PDghOq4fygRzZi7VZXcHQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, dongil01.park@samsung.com, khwan.seo@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 2:00=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.co=
m> wrote:
>
> Fix the issue of max_timeout being calculated larger than actual value.
> The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
> S3C2410_WTCON_MAXDIV is smaller than the actual value because the remaind=
er
> is discarded during the calculation process. This leads to a larger
> calculated value for max_timeout compared to the actual settable value.
> To resolve this issue, the order of calculations in the computation proce=
ss
> has been adjusted.
>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 95f7207e390a..0a4c0ab2a3d6 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -27,6 +27,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/delay.h>
> +#include <linux/math64.h>
>
>  #define S3C2410_WTCON          0x00
>  #define S3C2410_WTDAT          0x04
> @@ -410,9 +411,13 @@ static inline unsigned long s3c2410wdt_get_freq(stru=
ct s3c2410_wdt *wdt)
>  static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wd=
t)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
> +       //(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV =3D 0x8=
000

This single-line comment style (//) is usually not used in the kernel
code. Prefer multi-line comment style instead (/* */). More
importantly, this comment is not needed: using the raw 0x8000 value
below is still hard-coding it, and this comment is not the best way to
fix that. So declare either a proper constant or a define, and use it
further. I'd go with this:

    const u64 cnt_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
                        S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;

and then:

    u64 t_max =3D div64_ul(cnt_max, freq);

Sorry I didn't catch your related comment earlier in v4!

With that addressed, feel free to add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +       u64 t_max =3D div64_ul((u64)S3C2410_WTCNT_MAXCNT * 0x8000, freq);
>
> -       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX=
 + 1)
> -                                      / S3C2410_WTCON_MAXDIV);
> +       if (t_max > UINT_MAX)
> +               t_max =3D UINT_MAX;
> +
> +       return t_max;
>  }
>
>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool ma=
sk)
> --
> 2.25.1
>
