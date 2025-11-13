Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3790D267B07
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 01:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762997247; cv=none; b=HhqIdLJh9uyFGMV/NgpmVotGrAiaJZXBt3X9tS6GSpWnk14UIqrsEKi9yrFYmuZgFq0zFBN7gG13LPdSZJSEPCDG8ZeuJZr5CXjTOPik2UsuFzvTTh2BF5A+99q7Nh0Ey3qrdMQL/l9XvzZLrX/c2RHutKaE5eESZRnjnTFz+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762997247; c=relaxed/simple;
	bh=DMmHYEm2j9R/dx1MgW+ROQg8hzcBAIDN8sloZqkr7T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2fFFq1FjvH54pgukmH96AEtOJwJLX9ynTXJMFgWguke2l/Y5MvtsybzvEYgak9RyL8f4v+f362mA3oWM/8KY2t5NKYKQNZh64yH/XjF+u2QlW1sKIswttaG5kcV8YGLDl3r7L1nf5+uduaKS48QTL1eIDe+9nPon9UZXKKyw54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=waWVK2aN; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="waWVK2aN"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63fbbad0ac3so259685d50.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 17:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762997242; x=1763602042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bj/H8k/wDIAyT74iISCzcLQmX/HGf/HJxbprY9lANIs=;
        b=waWVK2aNwFLqh/40hVwqLfl62NVDSjNw9hCxrqgWHnuZ/Sf+J0dzv8rSoV/wBVM5vv
         gGxxOLU4hrEnZLmp6IGPuusqMvTVlneSQoJeGbiPTRIEUL5Fx9HidMAkU8LkpDTZUpN0
         q6IIrQ9BH36a3+ZEmMeWTNfoNk/fKuBZQF0tquDQeMgSiAZQpK47keooPlDPIqnYRxvW
         NC4FS1SZ6qd29LS+goZGc7PQcmTFg6yHAJ60oV0YTlVHfGOIavv5/twv3tz62kH1loAx
         YQxw1rCtq8gZXHGvE//1ZgDt+vzrSdSSVvroxohNiRmtppKvaf45oybvgQfjfiq2CztW
         PGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762997242; x=1763602042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bj/H8k/wDIAyT74iISCzcLQmX/HGf/HJxbprY9lANIs=;
        b=gis7rLlSoJ705O7qVu/WymguSAhiOwAmFB1SytJrr6CIYdNy77S/UeID5qYcrs4+qj
         /uYbl1H5xayLVUAE9sUJ2095HxKEcMOe750n8rizy8ODodaOVzmBdQld7iDxS2sGxT9J
         7kfN1DNHpDyqp6f7o1G1oBH3uMb79/ZsmIZ4MGMG0kVDncQJmLLHarD9T3tHIs/ad8oe
         wdC/pOubLezFmeYtw4w50/JMFK4Q4Uft/xOxUiPEp4BYe0r3PWA3wMeQXb6fftidn34A
         wuMtvZQ0MfDOMg/RAk+xjrgp7j1U90jm/DkFx3N2AMcW7nMzpO2wAkXV4kb8RphrD6sA
         EPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/ukQQXp9SITJobi8CbQjtFSNs+vaTB5sF6rUUrYpKgqu+zwV24zatGlyDmVX0abwOiLBBSG2gq5E8TtwVJZCw8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5IJzPHWZEgJ0DI5yp2p+VXf6VPDzSK9iISh0LEGPazq3gKr1b
	ff4TiYInFs7tj5RWuAPm2hNf5SyKDx3VNDA07hq2V4T+nncRQn7iRQH58rXkD/yijtOB5x83jFg
	lojxYYxN1Lm6A99ORi5gwdpblvKTYGqQgbKWoKtBV4A==
X-Gm-Gg: ASbGncvMY5R4zGSak4Uc0ZJfC4BM+OQd1s5igdL3kPMdCuSVwM1/hBBBXBo0ZRcHyqE
	WFaAgxHDdrV5ehFGW/XlmV+pjG45C+sCALomkbR/pyMxjmMvZzAm+pz4Obu7AMhXc2hPr2EvFz+
	NYLy+FJ4RYSrsWZ+8xCYaOgnZ6fVekShKT2sSVqRwYDkZwiKE15dfqEExAcizLSeOrjcEVi+OF0
	GzfxAqtYcW/xgYYCZ2NIeVjKwZNuqbOGiRnRDi+2PDypUHkyOirNLQBVUxhm0Z1ABeJ5nIWTuBs
	5CYca+3iDoR9S2VKJuU=
X-Google-Smtp-Source: AGHT+IGMrZsm9v26Vy5dB5DAIqQ29p3j2jTsDoiSg9FkYmCTJqULBb+CrEMPQI0nnWvwWcrbPCovQAGUMTsryS3gQk4=
X-Received: by 2002:a53:d048:0:20b0:63f:9e5e:52f4 with SMTP id
 956f58d0204a3-64101b58448mr3806166d50.64.1762997242596; Wed, 12 Nov 2025
 17:27:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251110082141epcas2p4de27828f15600071f03611d2c67db9ab@epcas2p4.samsung.com>
 <20251110082649.3109858-1-youngmin.nam@samsung.com> <20251110082649.3109858-3-youngmin.nam@samsung.com>
In-Reply-To: <20251110082649.3109858-3-youngmin.nam@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 12 Nov 2025 19:27:11 -0600
X-Gm-Features: AWmQ_bn49Cu4uFKXqrZ33nnpoFIS5_42ZYNgDBeeePUqbFbDYnsqIhiu6cLFYiE
Message-ID: <CAPLW+4m9kmmpBswK_vo0hjqE-MUbN7BA3-5Uo4NdJRFG3VJ7iQ@mail.gmail.com>
Subject: Re: [RFT PATCH v1 2/5] pinctrl: samsung: fix incorrect pin-bank
 entries on Exynos2200/7885/8890/8895
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, peter.griffin@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:21=E2=80=AFAM Youngmin Nam <youngmin.nam@samsung.=
com> wrote:
>
> This patch corrects wrong pin bank table definitions for 4 SoCs
> based on their TRMs.
>
> Exynos2200
> - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(),

Nitpick: please keep the lines as long as possible without unnecessary
breaks, when those are not really needed.

>   which implies a bank_type_off layout (.fld_width =3D {4,1,2,2,2,2}).
> - Per the SoC TRM these banks must use the =E2=80=9Calive=E2=80=9D layout

Nitpick: please avoid using UTF-8 characters when it's possible to
make do with just ASCII. UTF-8 might make grepping or git-grepping the
patches difficult. Not sure if there are any strict rules for this,
but I think sticking to old good ASCII when possible is a good idea in
general.

>   (.fld_width =3D {4,1,4,4}).
> - Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, =E2=80=
=A6).
>
> Exynos7885
> - etc0, etc1: update bank type to match the SoC TRM.
> - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.
>
> Exynos8890
> - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
>   a non-external interrupt bank.
> - gpi1, gpi2: update bank type to match the SoC TRM.
>   exynos8895_bank_type_off (.fld_width =3D {4,1,2,3,2,2}) ->
>   exynos5433_bank_type_off (.fld_width =3D {4,1,2,4,2,2})
> - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
>
> Exynos8895
> - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
>   change EINTW -> EINTN.
>   (The bank_type itself was correct and is kept unchanged.)
>
> This aligns the pin-bank tables with the documented bitfield layouts and
> wakeup domains. No DT/ABI change.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>

Suggest adding "Fixes:" tag here, if this patch actually fixes some
functionality, so it can be backported to the stable kernels further.

> ---

Apart from the minor comments:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index f8fbdd921d00..6e874ce40ff5 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -95,9 +95,9 @@ static const struct samsung_pin_bank_data exynos2200_pi=
n_banks0[] __initconst =3D
>         EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", =
0x08),
>         EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", =
0x0c),
>         EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", =
0x10),
> -       EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
> -       EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
> -       EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 4, 0xa0, "gpq0"),
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xc0, "gpq1"),
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xe0, "gpq2"),
>  };
>
>  /* pin banks of exynos2200 pin-controller - CMGP */
> @@ -768,12 +768,12 @@ const struct samsung_pinctrl_of_match_data exynos78=
70_of_data __initconst =3D {
>
>  /* pin banks of exynos7885 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __init=
const =3D {
> -       EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
> -       EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x000, "etc0")=
,
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x020, "etc1")=
,
>         EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0",=
 0x00),
>         EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1",=
 0x04),
>         EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2",=
 0x08),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x0a0, "gpq0",=
 0x0c),
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 5, 0x0a0, "gpq0")=
,
>  };
>
>  /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
> @@ -1502,7 +1502,7 @@ static const struct samsung_pin_bank_data exynos889=
0_pin_banks1[] __initconst =3D
>  /* pin banks of exynos8890 pin-controller 2 (CCORE) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "etc0"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 2, 0x000, "gpb3"=
),
>  };
>
>  /* pin banks of exynos8890 pin-controller 3 (ESE) */
> @@ -1520,8 +1520,8 @@ static const struct samsung_pin_bank_data exynos889=
0_pin_banks4[] __initconst =3D
>  /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpi1"=
, 0x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi2"=
, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2"=
, 0x04),
>  };
>
>  /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
> @@ -1552,7 +1552,7 @@ static const struct samsung_pin_bank_data exynos889=
0_pin_banks8[] __initconst =3D
>         EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2"=
, 0x28),
>         EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3"=
, 0x2c),
>         EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0"=
, 0x30),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x1A0, "etc1"=
, 0x34),
> +       EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 7, 0x1A0, "etc1"=
),

Might as well lower case 0x1A0 to 0x1a0 while at it. Kernel prefers
lower case style for hex numbers.

>  };
>
>  /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
> @@ -1647,7 +1647,7 @@ static const struct samsung_pin_bank_data exynos889=
5_pin_banks0[] __initconst =3D
>         EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
>         EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
>         EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
> -       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 7, 0x0a0, "gpa4", 0x24),
> +       EXYNOS9_PIN_BANK_EINTN(bank_type_alive, 7, 0x0a0, "gpa4"),
>  };
>
>  /* pin banks of exynos8895 pin-controller 1 (ABOX) */
> --
> 2.39.2
>
