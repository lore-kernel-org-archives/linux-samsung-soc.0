Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAB51EC019
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Sep 2024 21:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725398418; cv=none; b=lZTTe3SBw1qKJVRVs5D/Y1Fe0XMVYSl9Szgd+aGChrBdd2yfLYi1P66qILHmgoQh4/zqom2/eSnS/dSwY94oluMFqdCeaKXYmUfBB+e8PBu5ckZZn9jwNRm6i37T4UKT9Z8yxnLHW7yvLhwf2Sk/X7BdFP5esEhFHA3kJOojSIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725398418; c=relaxed/simple;
	bh=zGw+WJkdThsfd9X27i2yWNeI8B8dXTd1oEncs8KiCOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KY6760FcDDcmQ6tBRoKVsuDdnXNuXaAb+HO7L2wt406gLHNj4HehCi0NDA/mt1ZxcSp3qzI3nOZ5tPdCL5yJcS+O4Ehxhot7UIAE7KlOhAYG+n7TrgkEiBnyjyBBqx1EHe5pvkUrmM5NdOCH8wkMgZytSDZkmwBIwUS9x62JzQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WForpjAo; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WForpjAo"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6b6b9867f81so46117177b3.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2024 14:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725398416; x=1726003216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGgWpFqjKdXqQ+We9v9Bm3uUeVDDVvqu7jm5vMgKaSQ=;
        b=WForpjAojep7/hlwURy0tMN/4F/d4AMp5LIXpn+9xcGflz2F+XZExNWxkJRxl+j8Ar
         gYxAX+AOVmU3a1MysEZRV5xF54InbHN6/rnyVJGVwOwKgEYebMk6Qf8iacomdLfcPG1e
         fqKYpjn+J0VlqBG6FhuXtBVrW2OXTSrRMlVA95iZBPgg6HXcX07USz8GfLhhgnG3lRZe
         K5ewxMX/3zDnloc3Ld/FA7HR4lh4/P+IwiouMPej5qs4vcGuTA7Y84HJh4GZ5TSG74bh
         N72kWkSM1kCxzj8Bh/cxyV6bZ0PoqXU9VELTIKJ7KxAJW8JoBsIvzMp5l6+X9ajfNd54
         0grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725398416; x=1726003216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGgWpFqjKdXqQ+We9v9Bm3uUeVDDVvqu7jm5vMgKaSQ=;
        b=ZPWuUFh6YPrVe/5Njd2LJgo7UanNCfgodZUlwMdUXrtOGthltnRwBtm6l6iYRFfF/I
         zVNcNZ9PucHZwids1L/x63H8Tobt622uoQz2cVaSqVbgmDKMnBbW3wolp/9MSJWeUNF1
         p9U/3TCbwjx58KjG695T0fai1xCnHWdUw3tCnwmQ8SD/OAJQg3CW5ZgS0aZUx8kC3c14
         0ceExwD8Re5rSmrVB2eIferMMX/pv3/Ecv7BnJv6wGlPTyDrJ9SfJq6wuEaL9us4fhPQ
         jPFOMpOWpfY3Slo/q/O0aB+ehjekSWOwZnL8zNxejT0y//VVOGs6GW6xosJH0816hQo0
         Tq1A==
X-Forwarded-Encrypted: i=1; AJvYcCX96moVBWtjzwjLIWOdTPXYuQwaMdwnJUWykj8Yuog3kQoDLYslAqw7YALE+wG4vxAU/RQFC1VIn+cNmT/UXoxLsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwa3wpJF4tbdH11uHm8yN9nVeEoXtvBQdrhawdIy0rlE3++yY
	rh230RrHHVLDnGnLHpNm6IP+/LAvQxSRjZ4JzU6rluked3i54NtjTGyY0Rh5ziZ2nCmeI8BObYV
	r9R+/P9ehKLSre1gf4YcekuvmoGTgupY1mGeTlA==
X-Google-Smtp-Source: AGHT+IFytbcUiayfRWAYEBNABArUGnVyJm0Qn9ouaRXgvkcvfg7aIGFmg+Fw0IPzhQndUnCFie5xZeU3v+x6yFT5W2Q=
X-Received: by 2002:a05:690c:6703:b0:6d3:b708:7b19 with SMTP id
 00721157ae682-6d40e782513mr147731587b3.27.1725398415487; Tue, 03 Sep 2024
 14:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com> <20240903124429.107076-6-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20240903124429.107076-6-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 3 Sep 2024 16:20:04 -0500
Message-ID: <CAPLW+4ns=6eO=S4Cz70aBSyVO8CJ5=ixmKL38dZDjD3UgO98ZA@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] pinctrl: samsung: Add exynos8895 SoC pinctrl configuration
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:46=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Add support for the pin-controller found on the Exynos8895 SoC
> used in Samsung Galaxy S8 and S8 Plus phones.
>
> It has a newly applied pinctrl register layer for FSYS0 with a
> different bank type offset that consists of the following bit
> fields:
>
> CON: 4, DAT: 1, PUD: 2, DRV: 3, CONPDN: 2, PUDPDN: 2
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Other than minor comments below, LGTM:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 137 ++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  10 ++
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
>  4 files changed, 150 insertions(+)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index 5480e0884..0d5d14cf0 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -58,6 +58,15 @@ static const struct samsung_pin_bank_type exynos850_ba=
nk_type_alive =3D {
>         .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, },
>  };
>
> +/*
> + * Bank type for non-alive type. Bit fields:
> + * CON: 4, DAT: 1, PUD: 2, DRV: 3, CONPDN: 2, PUDPDN: 2
> + */
> +static const struct samsung_pin_bank_type exynos8895_bank_type_off  =3D =
{
> +       .fld_width =3D { 4, 1, 2, 3, 2, 2, },
> +       .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
> +};
> +
>  /* Pad retention control code for accessing PMU regmap */
>  static atomic_t exynos_shared_retention_refcnt;
>
> @@ -866,6 +875,134 @@ const struct samsung_pinctrl_of_match_data exynosau=
tov920_of_data __initconst =3D
>         .num_ctrl       =3D ARRAY_SIZE(exynosautov920_pin_ctrl),
>  };
>
> +/* pin banks of exynos8895 pin-controller 0 (ALIVE) */
> +static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __init=
const =3D {
> +       EXYNOS_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
> +       EXYNOS_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04),
> +       EXYNOS_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08),
> +       EXYNOS_PIN_BANK_EINTW(8, 0x080, "gpa3", 0x0c),
> +       EXYNOS_PIN_BANK_EINTW(7, 0x0A0, "gpa4", 0x24),
> +};
> +
> +/* pin banks of exynos8895 pin-controller 1 (ABOX) */
> +static const struct samsung_pin_bank_data exynos8895_pin_banks1[] __init=
const =3D {
> +       EXYNOS_PIN_BANK_EINTG(8, 0x000, "gph0", 0x00),
> +       EXYNOS_PIN_BANK_EINTG(7, 0x020, "gph1", 0x04),
> +       EXYNOS_PIN_BANK_EINTG(4, 0x040, "gph3", 0x08),
> +};
> +
> +/* pin banks of exynos8895 pin-controller 2 (VTS) */
> +static const struct samsung_pin_bank_data exynos8895_pin_banks2[] __init=
const =3D {
> +       EXYNOS_PIN_BANK_EINTG(3, 0x000, "gph2", 0x00),
> +};
> +
> +/* pin banks of exynos8895 pin-controller 3 (FSYS0) */
> +static const struct samsung_pin_bank_data exynos8895_pin_banks3[] __init=
const =3D {
> +       EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpi0", 0x00),
> +       EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpi1", 0x04),
> +};
> +
> +/* pin banks of exynos8895 pin-controller 4 (FSYS1) */
> +static const struct samsung_pin_bank_data exynos8895_pin_banks4[] __init=
const =3D {
> +       EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpj1", 0x00),
> +       EXYNOS_PIN_BANK_EINTG(7, 0x020, "gpj0", 0x04),
> +};
> +
> +/* pin banks of exynos8895 pin-controller 5 (BUSC) */
> +static const struct samsung_pin_bank_data exynos8895_pin_banks5[] __init=
const =3D {
> +       EXYNOS_PIN_BANK_EINTG(2, 0x000, "gpb2", 0x00),
> +};
> +
> +/* pin banks of exynos8895 pin-controller 6 (PERIC0) */
> +static const struct samsung_pin_bank_data exynos8895_pin_banks6[] __init=
const =3D {
> +       EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpd0", 0x00),
> +       EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpd1", 0x04),
> +       EXYNOS_PIN_BANK_EINTG(4, 0x040, "gpd2", 0x08),
> +       EXYNOS_PIN_BANK_EINTG(5, 0x060, "gpd3", 0x0C),

Here and below: please use lower-case letters for hex values. So 0x0C
-> 0x0c, etc.

> +       EXYNOS_PIN_BANK_EINTG(4, 0x080, "gpb1", 0x10),
> +       EXYNOS_PIN_BANK_EINTG(8, 0x0A0, "gpe7", 0x14),
> +       EXYNOS_PIN_BANK_EINTG(8, 0x0C0, "gpf1", 0x18),
> +};
> +
> +/* pin banks of exynos8895 pin-controller 7 (PERIC1) */
> +static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __init=
const =3D {
> +       EXYNOS_PIN_BANK_EINTG(3, 0x000, "gpb0", 0x00),
> +       EXYNOS_PIN_BANK_EINTG(5, 0x020, "gpc0", 0x04),
> +       EXYNOS_PIN_BANK_EINTG(5, 0x040, "gpc1", 0x08),
> +       EXYNOS_PIN_BANK_EINTG(8, 0x060, "gpc2", 0x0C),
> +       EXYNOS_PIN_BANK_EINTG(8, 0x080, "gpc3", 0x10),
> +       EXYNOS_PIN_BANK_EINTG(4, 0x0A0, "gpk0", 0x14),
> +       EXYNOS_PIN_BANK_EINTG(8, 0x0C0, "gpe5", 0x18),
> +       EXYNOS_PIN_BANK_EINTG(8, 0x0e0, "gpe6", 0x1C),
> +       EXYNOS_PIN_BANK_EINTG(8, 0x100, "gpe2", 0x20),
> +       EXYNOS_PIN_BANK_EINTG(8, 0x120, "gpe3", 0x24),
> +       EXYNOS_PIN_BANK_EINTG(8, 0x140, "gpe4", 0x28),
> +       EXYNOS_PIN_BANK_EINTG(4, 0x160, "gpf0", 0x2C),
> +       EXYNOS_PIN_BANK_EINTG(8, 0x180, "gpe1", 0x30),
> +       EXYNOS_PIN_BANK_EINTG(2, 0x1A0, "gpg0", 0x34),
> +};
> +
> +static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst =
=3D {
> +       {
> +               /* pin-controller instance 0 Alive data */

Wouldn't it be better to capitalize it, i.e. Alive -> ALIVE?

> +               .pin_banks      =3D exynos8895_pin_banks0,
> +               .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks0),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +               .eint_wkup_init =3D exynos_eint_wkup_init,
> +               .suspend        =3D exynos_pinctrl_suspend,
> +               .resume         =3D exynos_pinctrl_resume,
> +       }, {
> +               /* pin-controller instance 1 ABOX data */
> +               .pin_banks      =3D exynos8895_pin_banks1,
> +               .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks1),
> +       }, {
> +               /* pin-controller instance 2 VTS data */
> +               .pin_banks      =3D exynos8895_pin_banks2,
> +               .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks2),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +       }, {
> +               /* pin-controller instance 3 FSYS0 data */
> +               .pin_banks      =3D exynos8895_pin_banks3,
> +               .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks3),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +               .suspend        =3D exynos_pinctrl_suspend,
> +               .resume         =3D exynos_pinctrl_resume,
> +       }, {
> +               /* pin-controller instance 4 FSYS1 data */
> +               .pin_banks      =3D exynos8895_pin_banks4,
> +               .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks4),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +               .suspend        =3D exynos_pinctrl_suspend,
> +               .resume         =3D exynos_pinctrl_resume,
> +       }, {
> +               /* pin-controller instance 5 BUSC data */
> +               .pin_banks      =3D exynos8895_pin_banks5,
> +               .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks5),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +               .suspend        =3D exynos_pinctrl_suspend,
> +               .resume         =3D exynos_pinctrl_resume,
> +       }, {
> +               /* pin-controller instance 6 PERIC0 data */
> +               .pin_banks      =3D exynos8895_pin_banks6,
> +               .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks6),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +               .suspend        =3D exynos_pinctrl_suspend,
> +               .resume         =3D exynos_pinctrl_resume,
> +       }, {
> +               /* pin-controller instance 7 PERIC1 data */
> +               .pin_banks      =3D exynos8895_pin_banks7,
> +               .nr_banks       =3D ARRAY_SIZE(exynos8895_pin_banks7),
> +               .eint_gpio_init =3D exynos_eint_gpio_init,
> +               .suspend        =3D exynos_pinctrl_suspend,
> +               .resume         =3D exynos_pinctrl_resume,
> +       },
> +};
> +
> +const struct samsung_pinctrl_of_match_data exynos8895_of_data __initcons=
t =3D {
> +       .ctrl           =3D exynos8895_pin_ctrl,
> +       .num_ctrl       =3D ARRAY_SIZE(exynos8895_pin_ctrl),
> +};
> +
>  /*
>   * Pinctrl driver data for Tesla FSD SoC. FSD SoC includes three
>   * gpio/pin-mux/pinconfig controllers.
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index 305cb1d31..7b7ff7ffe 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -141,6 +141,16 @@
>                 .name           =3D id                            \
>         }
>
> +#define EXYNOS8895_PIN_BANK_EINTG(pins, reg, id, offs)         \
> +       {                                                       \
> +               .type           =3D &exynos8895_bank_type_off,    \
> +               .pctl_offset    =3D reg,                          \
> +               .nr_pins        =3D pins,                         \
> +               .eint_type      =3D EINT_TYPE_GPIO,               \
> +               .eint_offset    =3D offs,                         \
> +               .name           =3D id                            \
> +       }
> +
>  #define EXYNOSV920_PIN_BANK_EINTG(pins, reg, id, con_offs, mask_offs, pe=
nd_offs)       \
>         {                                                       \
>                 .type                   =3D &exynos850_bank_type_off,    =
 \
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/=
samsung/pinctrl-samsung.c
> index 623df65a5..ea3214897 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1409,6 +1409,8 @@ static const struct of_device_id samsung_pinctrl_dt=
_match[] =3D {
>                 .data =3D &exynos7885_of_data },
>         { .compatible =3D "samsung,exynos850-pinctrl",
>                 .data =3D &exynos850_of_data },
> +       { .compatible =3D "samsung,exynos8895-pinctrl",
> +               .data =3D &exynos8895_of_data },
>         { .compatible =3D "samsung,exynosautov9-pinctrl",
>                 .data =3D &exynosautov9_of_data },
>         { .compatible =3D "samsung,exynosautov920-pinctrl",
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/=
samsung/pinctrl-samsung.h
> index d50ba6f07..f18877f2f 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -363,6 +363,7 @@ extern const struct samsung_pinctrl_of_match_data exy=
nos5433_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
> +extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynosautov920_of_data=
;
>  extern const struct samsung_pinctrl_of_match_data fsd_of_data;
> --
> 2.34.1
>
>
