Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A868A23ED5B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 02:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763001363; cv=none; b=sIuwNtLi3nbI2ERYaUqfO+/atRX3mrw8E02y8JCqfxqx3z4VJvln6L09fnA+q3zzXiH+y/nOw9BjN4bZ7IVEGNmupzj31yqGssKxMv3f+exlJeY/RvMN4K9ddvam9+VEWni/R3WEjNmcqP6EkYfZ4PZBQz9cHn9fvtpaKj8Ked8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763001363; c=relaxed/simple;
	bh=ubIlJfsZaSXJGvpZwKwcGPU+DMBtEsx5Rg/eYpjZ6zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qq+pi/Qs89dyOb2AkrAG8+Va5es6MmHkWN3J74XYUbEZeOzqCwGkxxAkPA8fDPzT+J29ayC0OUky+iuQjXspUSl6b6NtmcYSAfA81LzvodQ6g5lDlubefCurC/fiSceoQa6rOcEEz6cUBJZbTenH2QbqaR5Jn/L82WpLTBBg0pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WMpGCJRy; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WMpGCJRy"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-786a85a68c6so3367787b3.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 18:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763001359; x=1763606159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWon0gagLotUYcfgUQnl+pqNZXNf3Ov8QiqzoiU14FA=;
        b=WMpGCJRy0iH/0ByndHdF+UoeS/XIV3cXjZcIwCtoXTw87oNRUFcUVnP2Lk57UQzfpS
         bc5nNW3uBAxBVG2zQJJlrWU5ZmJIPxOUTTgpj8m/G+BEPL89vN2Q+Ykt3atbP3bSa5ej
         RmBnFp16E+/iDXeN39QGa6JzvB9Xrb1PkPo+H1KQvYdyyuphWGZ069MzsPO0by/KFR7s
         4RXBlE4tg2qTmctmxJbTLgiIYYlMIfk++NtCL6OpmhRb3mlGnbpv9aL4xQ1YmQUYXx+r
         vh0LjJLtgEUQp5OorHX9RblgUy3xxLNZ/IGbx2AK6E/FkESCsXDJODVJbxGsZV6ei2iN
         6DwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763001359; x=1763606159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWon0gagLotUYcfgUQnl+pqNZXNf3Ov8QiqzoiU14FA=;
        b=baQRvmg+1dcQdn0wdyDuf1wB82FKE0mQOjqW9uvhftQN8BGMgcQF5F23k+K21MTtJY
         miSpzcm7UT5oWZC0fh8OJtXeiLNTC57EuZl32IPgIj2Oz6nish8D3CaMuJfSSPaIheGn
         GtiGzIEP/lyEivkLLNg0uN64bBuyqxJ1V7Cvr1pasLPXrviyuGd+R0ASJqZTBNkorRiJ
         hOWYHFHzmSfLUNWDDonBCnYwP/SH1YU0H3C2z0Ypgo2qtf2f8YHYO3IDAgvk06fGIbrr
         MOJ8u7jB8qp/8w7HbROpaRmxZV2BNUWaJssC0zA/qwhDMwtS/yj1Q/ldL990MrKCbWXW
         QjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlEc1mlTVyBxKVsbqSpTuQrnnY5IAFbhezOm4jqF/DToECrKfBWgcC9DP+i3hWiU+C5xAG9xE1ELtAaCYtxQFYog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+cLatqAmpr4TojFItKkdFzd/FWu3oDewSKbIB64g9DTd3M6S+
	GHvkijPXC8stUjnFM6BXxXmYn4n6ireCiznbDbwSDqIYlqYNXzK5/wMe1YDnkWHXxkmyYWXotaR
	UUuc1Cmc5b08H7jO+z6t21Qi13XJrKY2MSKcJ3lvXREDZkEvyZLER5wM=
X-Gm-Gg: ASbGncsWJGQNi6evlGKxQMawVHokW+ezM8zlxtI76hftdgs1oEGSjbNsOhdVAxfO50x
	f8jhQIFqjRkFvo/BgimXYDsO8FbeRx3qxN9LWPe2AaSR/8YkiQst6+68e1asDw9cEVXsBnDCytL
	LT7g6QHJl1C23HXiA0Xa0ROaHk6IVww6HkcvCRwB+KfyOYQvf0AOcV1WTTbdX1CywTa6NvtaUox
	gJMH1cOPOTVPys+G3q+SGzWHtmJsQjmD+Ao+aqNn9Lw+soJN9/dTnU0tjmUBRMag3Re+3y9HQI8
	kjCYnhJ28SHcQNsZfXk=
X-Google-Smtp-Source: AGHT+IGGRYC6aP/aYZ/xvOKq/SDKbfUHmCU2sTi9MYM5jRStgyMU0GDlogV17HVsWR3WXEqHF2nDsmERjGPCevOD3SI=
X-Received: by 2002:a05:690c:6ac9:b0:786:896d:8858 with SMTP id
 00721157ae682-788136c2887mr43144067b3.47.1763001359439; Wed, 12 Nov 2025
 18:35:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251110082145epcas2p1e56790e7aa72d7d3bcad4cc1faae07ef@epcas2p1.samsung.com>
 <20251110082649.3109858-1-youngmin.nam@samsung.com> <20251110082649.3109858-6-youngmin.nam@samsung.com>
In-Reply-To: <20251110082649.3109858-6-youngmin.nam@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 12 Nov 2025 20:35:47 -0600
X-Gm-Features: AWmQ_bne75c3kVDDhYnC9P0fQXZ2GY8wO37bEGf66FXqroJMyqcMyG1DQt0Y3tY
Message-ID: <CAPLW+4m3=-957mqPC_Gb=2MjHCsQf7sSiBY-k-S=B14yq5bggA@mail.gmail.com>
Subject: Re: [RFT PATCH v1 5/5] pinctrl: samsung: rename gs101_pinctrl_* to exynos9_pinctrl_*
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, peter.griffin@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:21=E2=80=AFAM Youngmin Nam <youngmin.nam@samsung.=
com> wrote:
>
> The suspend/resume helpers named gs101_pinctrl_{suspend,resume} are not
> GS101-specific. They implement the generic save/restore sequence used by
> Exynos9-style controllers that have EINT filter configuration (eint_fltco=
n)
> to preserve.
>
> Rename them to exynos9_pinctrl_{suspend,resume} and update all users:
>   - exynos2200, exynos9810, exynos8895, exynos7885, exynos7870,
>     exynosautov9, fsd, and gs101 controller tables

Not strictly related to this patch, but I wonder if we should also
enable suspend/resume operations for exynos850_pin_ctrl[] later.

>   - prototypes in pinctrl-exynos.h
>   - definitions in pinctrl-exynos.c
>
> This aligns naming with the earlier macro/doc cleanups (e.g. using
> EXYNOS9_PIN_BANK_* and describing eint_fltcon as Exynos9-specific) and
> makes the helpers clearly reusable by other Exynos9-like SoCs.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>

It looks to me as this patch actually fixes handling pinctrl during
suspend/resume for some chips. If it's the case, suggest adding
"Fixes:" tag here.

> ---

LGTM:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

(Not sure how to test it on my E850-96, as suspend/resume is not
enabled there yet, and this patch doesn't really affect Exynos850
anyway; so only R-b tag for this one.)

>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 176 +++++++++---------
>  drivers/pinctrl/samsung/pinctrl-exynos.c      |   4 +-
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |   4 +-
>  3 files changed, 92 insertions(+), 92 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index ea11543e4e26..ccaa8b6b39a9 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -195,16 +195,16 @@ static const struct samsung_pin_ctrl exynos2200_pin=
_ctrl[] =3D {
>                 .nr_banks       =3D ARRAY_SIZE(exynos2200_pin_banks0),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
>                 .eint_wkup_init =3D exynos_eint_wkup_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 1 CMGP data */
>                 .pin_banks      =3D exynos2200_pin_banks1,
>                 .nr_banks       =3D ARRAY_SIZE(exynos2200_pin_banks1),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
>                 .eint_wkup_init =3D exynos_eint_wkup_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 2 HSI1 data */
>                 .pin_banks      =3D exynos2200_pin_banks2,
> @@ -214,36 +214,36 @@ static const struct samsung_pin_ctrl exynos2200_pin=
_ctrl[] =3D {
>                 .pin_banks      =3D exynos2200_pin_banks3,
>                 .nr_banks       =3D ARRAY_SIZE(exynos2200_pin_banks3),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 4 HSI1UFS data */
>                 .pin_banks      =3D exynos2200_pin_banks4,
>                 .nr_banks       =3D ARRAY_SIZE(exynos2200_pin_banks4),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 5 PERIC0 data */
>                 .pin_banks      =3D exynos2200_pin_banks5,
>                 .nr_banks       =3D ARRAY_SIZE(exynos2200_pin_banks5),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 6 PERIC1 data */
>                 .pin_banks      =3D exynos2200_pin_banks6,
>                 .nr_banks       =3D ARRAY_SIZE(exynos2200_pin_banks6),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 7 PERIC2 data */
>                 .pin_banks      =3D exynos2200_pin_banks7,
>                 .nr_banks       =3D ARRAY_SIZE(exynos2200_pin_banks7),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 8 VTS data */
>                 .pin_banks      =3D exynos2200_pin_banks8,
> @@ -710,8 +710,8 @@ static const struct samsung_pin_ctrl exynos7870_pin_c=
trl[] __initconst =3D {
>                 .pin_banks      =3D exynos7870_pin_banks0,
>                 .nr_banks       =3D ARRAY_SIZE(exynos7870_pin_banks0),
>                 .eint_wkup_init =3D exynos_eint_wkup_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 1 DISPAUD data */
>                 .pin_banks      =3D exynos7870_pin_banks1,
> @@ -721,43 +721,43 @@ static const struct samsung_pin_ctrl exynos7870_pin=
_ctrl[] __initconst =3D {
>                 .pin_banks      =3D exynos7870_pin_banks2,
>                 .nr_banks       =3D ARRAY_SIZE(exynos7870_pin_banks2),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 3 FSYS data */
>                 .pin_banks      =3D exynos7870_pin_banks3,
>                 .nr_banks       =3D ARRAY_SIZE(exynos7870_pin_banks3),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 4 MIF data */
>                 .pin_banks      =3D exynos7870_pin_banks4,
>                 .nr_banks       =3D ARRAY_SIZE(exynos7870_pin_banks4),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 5 NFC data */
>                 .pin_banks      =3D exynos7870_pin_banks5,
>                 .nr_banks       =3D ARRAY_SIZE(exynos7870_pin_banks5),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 6 TOP data */
>                 .pin_banks      =3D exynos7870_pin_banks6,
>                 .nr_banks       =3D ARRAY_SIZE(exynos7870_pin_banks6),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 7 TOUCH data */
>                 .pin_banks      =3D exynos7870_pin_banks7,
>                 .nr_banks       =3D ARRAY_SIZE(exynos7870_pin_banks7),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         },
>  };
>
> @@ -819,8 +819,8 @@ static const struct samsung_pin_ctrl exynos7885_pin_c=
trl[] __initconst =3D {
>                 .nr_banks       =3D ARRAY_SIZE(exynos7885_pin_banks0),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
>                 .eint_wkup_init =3D exynos_eint_wkup_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 1 DISPAUD data */
>                 .pin_banks      =3D exynos7885_pin_banks1,
> @@ -830,15 +830,15 @@ static const struct samsung_pin_ctrl exynos7885_pin=
_ctrl[] __initconst =3D {
>                 .pin_banks      =3D exynos7885_pin_banks2,
>                 .nr_banks       =3D ARRAY_SIZE(exynos7885_pin_banks2),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 3 TOP data */
>                 .pin_banks      =3D exynos7885_pin_banks3,
>                 .nr_banks       =3D ARRAY_SIZE(exynos7885_pin_banks3),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         },
>  };
>
> @@ -1175,8 +1175,8 @@ static const struct samsung_pin_ctrl exynos9810_pin=
_ctrl[] __initconst =3D {
>                 .nr_banks       =3D ARRAY_SIZE(exynos9810_pin_banks0),
>                 .eint_wkup_init =3D exynos_eint_wkup_init,
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 1 AUD data */
>                 .pin_banks      =3D exynos9810_pin_banks1,
> @@ -1186,44 +1186,44 @@ static const struct samsung_pin_ctrl exynos9810_p=
in_ctrl[] __initconst =3D {
>                 .pin_banks      =3D exynos9810_pin_banks2,
>                 .nr_banks       =3D ARRAY_SIZE(exynos9810_pin_banks2),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 3 CMGP data */
>                 .pin_banks      =3D exynos9810_pin_banks3,
>                 .nr_banks       =3D ARRAY_SIZE(exynos9810_pin_banks3),
>                 .eint_wkup_init =3D exynos_eint_wkup_init,
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 4 FSYS0 data */
>                 .pin_banks      =3D exynos9810_pin_banks4,
>                 .nr_banks       =3D ARRAY_SIZE(exynos9810_pin_banks4),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 5 FSYS1 data */
>                 .pin_banks      =3D exynos9810_pin_banks5,
>                 .nr_banks       =3D ARRAY_SIZE(exynos9810_pin_banks5),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 6 PERIC0 data */
>                 .pin_banks      =3D exynos9810_pin_banks6,
>                 .nr_banks       =3D ARRAY_SIZE(exynos9810_pin_banks6),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 7 PERIC1 data */
>                 .pin_banks      =3D exynos9810_pin_banks7,
>                 .nr_banks       =3D ARRAY_SIZE(exynos9810_pin_banks7),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 8 VTS data */
>                 .pin_banks      =3D exynos9810_pin_banks8,
> @@ -1295,8 +1295,8 @@ static const struct samsung_pin_ctrl exynosautov9_p=
in_ctrl[] __initconst =3D {
>                 .pin_banks      =3D exynosautov9_pin_banks0,
>                 .nr_banks       =3D ARRAY_SIZE(exynosautov9_pin_banks0),
>                 .eint_wkup_init =3D exynos_eint_wkup_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 1 AUD data */
>                 .pin_banks      =3D exynosautov9_pin_banks1,
> @@ -1306,36 +1306,36 @@ static const struct samsung_pin_ctrl exynosautov9=
_pin_ctrl[] __initconst =3D {
>                 .pin_banks      =3D exynosautov9_pin_banks2,
>                 .nr_banks       =3D ARRAY_SIZE(exynosautov9_pin_banks2),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 3 FSYS1 data */
>                 .pin_banks      =3D exynosautov9_pin_banks3,
>                 .nr_banks       =3D ARRAY_SIZE(exynosautov9_pin_banks3),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 4 FSYS2 data */
>                 .pin_banks      =3D exynosautov9_pin_banks4,
>                 .nr_banks       =3D ARRAY_SIZE(exynosautov9_pin_banks4),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 5 PERIC0 data */
>                 .pin_banks      =3D exynosautov9_pin_banks5,
>                 .nr_banks       =3D ARRAY_SIZE(exynosautov9_pin_banks5),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 6 PERIC1 data */
>                 .pin_banks      =3D exynosautov9_pin_banks6,
>                 .nr_banks       =3D ARRAY_SIZE(exynosautov9_pin_banks6),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         },
>  };
>
> @@ -1715,8 +1715,8 @@ static const struct samsung_pin_ctrl exynos8895_pin=
_ctrl[] __initconst =3D {
>                 .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks0),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
>                 .eint_wkup_init =3D exynos_eint_wkup_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 1 ABOX data */
>                 .pin_banks      =3D exynos8895_pin_banks1,
> @@ -1731,36 +1731,36 @@ static const struct samsung_pin_ctrl exynos8895_p=
in_ctrl[] __initconst =3D {
>                 .pin_banks      =3D exynos8895_pin_banks3,
>                 .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks3),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 4 FSYS1 data */
>                 .pin_banks      =3D exynos8895_pin_banks4,
>                 .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks4),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 5 BUSC data */
>                 .pin_banks      =3D exynos8895_pin_banks5,
>                 .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks5),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 6 PERIC0 data */
>                 .pin_banks      =3D exynos8895_pin_banks6,
>                 .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks6),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 7 PERIC1 data */
>                 .pin_banks      =3D exynos8895_pin_banks7,
>                 .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks7),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         },
>  };
>
> @@ -1819,15 +1819,15 @@ static const struct samsung_pin_ctrl fsd_pin_ctrl=
[] __initconst =3D {
>                 .pin_banks      =3D fsd_pin_banks0,
>                 .nr_banks       =3D ARRAY_SIZE(fsd_pin_banks0),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 1 PERIC data */
>                 .pin_banks      =3D fsd_pin_banks1,
>                 .nr_banks       =3D ARRAY_SIZE(fsd_pin_banks1),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D exynos_pinctrl_suspend,
> -               .resume         =3D exynos_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin-controller instance 2 PMU data */
>                 .pin_banks      =3D fsd_pin_banks2,
> @@ -1927,16 +1927,16 @@ static const struct samsung_pin_ctrl gs101_pin_ct=
rl[] __initconst =3D {
>                 .pin_banks      =3D gs101_pin_alive,
>                 .nr_banks       =3D ARRAY_SIZE(gs101_pin_alive),
>                 .eint_wkup_init =3D exynos_eint_wkup_init,
> -               .suspend        =3D gs101_pinctrl_suspend,
> -               .resume         =3D gs101_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>                 .retention_data =3D &no_retention_data,
>         }, {
>                 /* pin banks of gs101 pin-controller (FAR_ALIVE) */
>                 .pin_banks      =3D gs101_pin_far_alive,
>                 .nr_banks       =3D ARRAY_SIZE(gs101_pin_far_alive),
>                 .eint_wkup_init =3D exynos_eint_wkup_init,
> -               .suspend        =3D gs101_pinctrl_suspend,
> -               .resume         =3D gs101_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>                 .retention_data =3D &no_retention_data,
>         }, {
>                 /* pin banks of gs101 pin-controller (GSACORE) */
> @@ -1951,29 +1951,29 @@ static const struct samsung_pin_ctrl gs101_pin_ct=
rl[] __initconst =3D {
>                 .pin_banks      =3D gs101_pin_peric0,
>                 .nr_banks       =3D ARRAY_SIZE(gs101_pin_peric0),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D gs101_pinctrl_suspend,
> -               .resume         =3D gs101_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin banks of gs101 pin-controller (PERIC1) */
>                 .pin_banks      =3D gs101_pin_peric1,
>                 .nr_banks       =3D ARRAY_SIZE(gs101_pin_peric1),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D gs101_pinctrl_suspend,
> -               .resume         =3D gs101_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin banks of gs101 pin-controller (HSI1) */
>                 .pin_banks      =3D gs101_pin_hsi1,
>                 .nr_banks       =3D ARRAY_SIZE(gs101_pin_hsi1),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D gs101_pinctrl_suspend,
> -               .resume         =3D gs101_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         }, {
>                 /* pin banks of gs101 pin-controller (HSI2) */
>                 .pin_banks      =3D gs101_pin_hsi2,
>                 .nr_banks       =3D ARRAY_SIZE(gs101_pin_hsi2),
>                 .eint_gpio_init =3D exynos_eint_gpio_init,
> -               .suspend        =3D gs101_pinctrl_suspend,
> -               .resume         =3D gs101_pinctrl_resume,
> +               .suspend        =3D exynos9_pinctrl_suspend,
> +               .resume         =3D exynos9_pinctrl_resume,
>         },
>  };
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index 81fe0b08a9af..a6dd0fa59230 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -906,7 +906,7 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank *=
bank)
>         }
>  }
>
> -void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
> +void exynos9_pinctrl_suspend(struct samsung_pin_bank *bank)
>  {
>         struct exynos_eint_gpio_save *save =3D bank->soc_priv;
>         const void __iomem *regs =3D bank->eint_base;
> @@ -961,7 +961,7 @@ void exynosautov920_pinctrl_suspend(struct samsung_pi=
n_bank *bank)
>         }
>  }
>
> -void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
> +void exynos9_pinctrl_resume(struct samsung_pin_bank *bank)
>  {
>         struct exynos_eint_gpio_save *save =3D bank->soc_priv;
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index 476346d163d8..7421cb5fa2dc 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -225,8 +225,8 @@ void exynosautov920_pinctrl_resume(struct samsung_pin=
_bank *bank);
>  void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
>  void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
>  void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
> -void gs101_pinctrl_suspend(struct samsung_pin_bank *bank);
> -void gs101_pinctrl_resume(struct samsung_pin_bank *bank);
> +void exynos9_pinctrl_suspend(struct samsung_pin_bank *bank);
> +void exynos9_pinctrl_resume(struct samsung_pin_bank *bank);
>  struct samsung_retention_ctrl *
>  exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
>                       const struct samsung_retention_data *data);
> --
> 2.39.2
>
