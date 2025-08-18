Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E9B25B1C7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 22:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755556048; cv=none; b=Qu0C2BO9tE52WmBlpnI382jKUvdLwN2UyONRMQ0mh6a+3vBhYt2UKX8gFzvwvzxfXluTwJRwVoQHdsTV5psXRcoLZTSr3KB7Pl+hhcw4lNaIP8j4sqkQDE2i11s19B4npfYOmbJAFFyeSNWkT3ZT7OMSW2xhsQZSvfduURtgbes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755556048; c=relaxed/simple;
	bh=4GnconOYETG187lwN0wKDqqPuWaknNEmUH5TmtWL1cM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kRbmWWhBbaMEHabaIOxQOXY620daSfEBrVQwqbifw7wGpuFnBe5vM6ksAS6rKFhDXAFT9pyRstdY2L2Ue4lpaYgGZV/648WJvSfC7bJPp0TrjjD0aUa3NPjRFmC6Bp9eo4Ggi2Vvgi6cUKBF/qG/ueTolUuRf5GRcfp9UzVGY74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xhm86hu2; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xhm86hu2"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e931c71a1baso4742920276.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 15:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755556044; x=1756160844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6GHquVYXzgy3eg0gKU71NB7gwzG68GwWf56FpOt+cA=;
        b=Xhm86hu2tQSdjW/onnnhODIDx9mo8V4ZDN9E9s7+0236Y3KrPJUSxJDupTYybZy4BW
         vEQJzo7OEBRt6SmUJ+b2t1UYyT4g4Bz/c8BFj//DxQS5qW+JLUporocpywiINASY3Y7q
         4gWPmMKvJ5XsjBs4IsCAr6O2UcW4cx+rh+eQVSsllwbpP7Ax8rKvLs71Pd2W9fSpSVY5
         CpLzHHYJEscP1zFGaL70dpcjn8jfoAg+DJY+Shxc+GrJvWwfGNzi7ZAfMs0BM/7EBi3X
         AoQN12IRz6fwOdpiEAMqeI+U7BHwhLaG+1NckB/F1DfKudwsInjLYUS81yD2eOGP24Jz
         +2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755556044; x=1756160844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6GHquVYXzgy3eg0gKU71NB7gwzG68GwWf56FpOt+cA=;
        b=PFaF2n6+dD+bZsxsIlQy3YPbhnBgpXKWWeukglCw/pCjNmSohkCMO8Zf77zRv+Jg5J
         JKeR2+jChf8azl79WR6FCRu5LTUQ6kQOWqCrKsWkGQWf+1ywSrLjDMjCP6urMvLlJxHe
         a0qWoxANv1Xnlj4YEUtsCRuVT2CiY6R5oVBeKR2kjjI1xlKs/OpBNIK68YXVv+toVEVJ
         qL9bQLT0FTSBkAHsWsMzFPOa9G8ur90m73SGylC3vl/E79Y0xlaKVhUiLfOKl5z12JNK
         zyWddE4LxPxNUJTBDabDuqlKdc0nfuP8sq8qaqlxIM+Il0HKOx5hiWBFzV0lXi0LSgBt
         IdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4JL0Z3pbpPQFQ95qDhtqHPTNB3WI1eX+od4H2DHfA6qsgINKSkyTu9cC/1x24UpobHuYRl9rovBlGx9O+eNvtVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QBnCUXTKym5XoMgZm5AT62vmNL/+/QfYb9fbkTCxpqHM+Ikp
	Mmg49UtiP/tYNReOx5hs1YgIc8+veIDTBlHk8EdmnoKyLaYW2LpyPSPRPhJeI8kxMDPwoGD9Ino
	iHObpfcOn+yLnsMbSlIbMnmtUDqosGwFJ01Zg4IaazQ==
X-Gm-Gg: ASbGncsayKuy+rB1D+mquXmkiAkKZelidPJ8IfhNwB86GRavRfEC2/tdickDppr8Ect
	Lp0U9fyLIfUTxgBs2qNflqGGAzxLQuMtXEa6uav/XtimcNrzqDDOCL1hakp67rVC1AQ/aXcUvtL
	7VXU/sXP/jyB1Me2HMJiDvcdLdLo/gtC1bjPvdgRnT/TXj/GYk2GSp5SCrYpLzgAgBGEpwv9mpy
	/Ynbw==
X-Google-Smtp-Source: AGHT+IEZsy19x5o98/r/4pLWO9YODI0vvSUQTbdAUdhq77x6WDR5zVwjMfdFgml+3tCPHJRWGhBSBH2CxRxauE2CLfo=
X-Received: by 2002:a05:6902:f84:b0:e93:3d8b:4e3f with SMTP id
 3f1490d57ef6-e94e61bd04emr669336276.13.1755556044632; Mon, 18 Aug 2025
 15:27:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c@epcas2p3.samsung.com>
 <20250818021826.623830-1-sw617.shin@samsung.com> <20250818021826.623830-3-sw617.shin@samsung.com>
In-Reply-To: <20250818021826.623830-3-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 18 Aug 2025 17:27:13 -0500
X-Gm-Features: Ac12FXxZ-jPQHli_YsB9TH41Az0ILCITH7EMyT1TjZMDBHz6hJ2bX99BQB7uVbk
Message-ID: <CAPLW+4m4S=j8Z0ue9LcxH+8HBsPKTfLuG9nV+6v4NLE=Qp+wnQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, dongil01.park@samsung.com, khwan.seo@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 9:24=E2=80=AFPM Sangwook Shin <sw617.shin@samsung.c=
om> wrote:
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
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 95f7207e390a..1e8cf0299713 100644
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
> @@ -410,9 +411,14 @@ static inline unsigned long s3c2410wdt_get_freq(stru=
ct s3c2410_wdt *wdt)
>  static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wd=
t)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
> +       const u64 n_max =3D (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
> +                       S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;
> +       u64 t_max =3D div64_ul(n_max, freq);
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

Thanks for working on this, Sangwook! It looks much better now.

>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool ma=
sk)
> --
> 2.25.1
>
