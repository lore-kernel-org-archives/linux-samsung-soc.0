Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B89E1EE7D5
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 11:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737457485; cv=none; b=gPFMTClZ6F6HjNrQqx4uOkEf3blMWZqwL5T8D1njzT8tsMO+zZof5dIPxLPagddFKj6Df9cbNiqAcgbw3WpslUeIp2qTZricILu+4Tjja8/HdB4WAVNgmgjKI8LWN6CJGUtxY3n4X10rcZ7wC4zlHN7m9Eafn3fopH7vWy1xzEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737457485; c=relaxed/simple;
	bh=iCZoGBVeXAOA6yjs7erCwYrI5afKjW8JluhSsGR5Du8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cBCXuOcq8P/zWw67eEmA2ldyOXAlWsHAoWiv7ozuFVMwWS9Z6m+oBCT7OARRwyMWacIKADcJouyrzh2EPrKU0zLrPsMBJ9ljOMrMqz0HtNOg/OqeiW66ITXM7IVu71juSnUjCLlNrVzUuxqo1vzQ0AKn+ymaFqflASwBbAFi4dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fK7MSms3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fK7MSms3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43675b1155bso62944125e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 03:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737457481; x=1738062281; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tvPwEcrUyGsLBJo09HOgsP/3MkEVUFnX2qoffysVsKk=;
        b=fK7MSms3Z8urxjtNysGYApEXNU7e8gUgGYSLCSUiBjhq033lCRWtiTDNAIwogpSWhy
         HKOi4vD8nJo3h/pukRl6qB12nR7J1LSIFpuGkghNwehXsfwuU9VN0N7MV5eDahSoyIyD
         89q5iNFrgqtbeg/Jl6tNxGvITRQFoxA1iW+ooqL74fdJPnibDdOe4rOsNSyraRAjWdiR
         XzlWZN0yk4Q0NZhRVMm1PucBUfcIm+f+MHntLCzMW22aj9gCbJjsnOS29F2L1aO+NPV2
         GWv/9U5BEDbBDzxQdNRxOBuQNnSpZ46+7xDoH9cQ4o8I+9ZIP7nvLSIKtgxpI/l35eZM
         Ihyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737457481; x=1738062281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvPwEcrUyGsLBJo09HOgsP/3MkEVUFnX2qoffysVsKk=;
        b=HeblN4WGXDsxUaNhNv2DDSS+7xxg2O9PidMLhjL1KCGNpSUwZkQHI4zF8YuOFZwPTX
         YLt/iHFQIw49G/2isBBZQMTO5jPWfuq1s+L2QMxTjq1ffmA8UMQy1sju0VKsrI42dIoa
         NkpsYcpcT+QERMbiECyVtyteaUPdATnHJKL2IjPiCG2S9XWupgk1Jv+a0ddAOxw47Z7n
         WlvLWegd7nwWWl756WTfQgA3gHNbeYHjB0SYZiZCI/n430K4+Oh6AkQrDZkinXMPiUJZ
         t/mVQp1yuqmekozoAnyH/V25wL0NjZLp+byCYOek+IeJHHHqSvfSyV6o4OFDCoOTvpzd
         9g9A==
X-Forwarded-Encrypted: i=1; AJvYcCVtyBJRHTg+QjW/128rFF12o0iglQUnPAdYnFflI0dHZsfIM+vgDCJCxM3EtcjcL7M/mx1CkanE5ASL8n5SsDD/1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjpCigqqS5gLKYwbV30HFNrumQxs3xgm4Xtf185SKblpfZohTg
	QYbM8WahWqMSoD1IRoNQWe3Ph+jh1yE8mYbAuBMfvbtlwGBUxvQx6LSB1R3prNE=
X-Gm-Gg: ASbGncvmmM6kgsMGuK+5VWNo11yk+/EdFoCZzm4sKlV9PiyTBOt4sT3IkaAeGEDyg0/
	QKn6DR5XGeBkJ7Uy+CNPsgUPLPmuMFm5VjTpQyjxK3kb/Cq0506zL3UOzbzUv7eB2m6d8c+PTVB
	0j0XS8HXznOXBQwDiMScPy2Z2Z5nxjWcbYn+XDldJ3O/sseuf80VCINGIZbtFhi6D5hylRVDJaU
	GeB7bO8VFskzNv2C/yT2UACXKdk6P3WVlDuUXAGDhOm5Oqe8l2RV+8Zr6x0crl1CnitkBcsA4Y=
X-Google-Smtp-Source: AGHT+IFlXV3/L1EDDH4fDN/aqThvkwiMAX8Gl//sKHxctA5DzjcGvtQf+mrhS8mOE9zxwbPm3fM9nQ==
X-Received: by 2002:a5d:6c66:0:b0:385:fae2:f443 with SMTP id ffacd0b85a97d-38bf57a91a1mr14068708f8f.34.1737457480683;
        Tue, 21 Jan 2025 03:04:40 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3214fbdsm13329806f8f.19.2025.01.21.03.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:04:40 -0800 (PST)
Message-ID: <4e2057fc54022ba5791e482a1e631a1a77551389.camel@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: samsung: Add filter selection support for
 alive bank on gs101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
  linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Tue, 21 Jan 2025 11:04:39 +0000
In-Reply-To: <20250120-pinctrl-fltcon-suspend-v1-3-e77900b2a854@linaro.org>
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
	 <20250120-pinctrl-fltcon-suspend-v1-3-e77900b2a854@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Peter,

On Mon, 2025-01-20 at 22:34 +0000, Peter Griffin wrote:
> Newer Exynos based SoCs have a filter selection bitfield in the filter
> configuration registers on alive bank pins. This allows the selection of
> a digital or analog delay filter for each pin. Add support for selecting
> and enabling the filter.
>=20
> On suspend we set the analog filter to all pins in the bank (as the
> digital filter relies on a clock). On resume the digital filter is
> reapplied to all pins in the bank. The digital filter is working via
> a clock and has an adjustable filter delay flt_width bitfield, whereas
> the analog filter uses a fixed delay.
>=20
> The filter determines to what extent signal fluctuations received through
> the pad are considered glitches.
>=20
> The code path can be exercised using
> echo mem > /sys/power/state
> And then wake the device using a eint gpio
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>=20
> Note: this patch was previously sent as part of the initial gs101/ Pixel =
6
> series and was dropped in v6. This new version incorporates the review
> feedback from Sam Protsenko here in v5.
>=20
> Link: https://lore.kernel.org/all/20231201160925.3136868-1-peter.griffin@=
linaro.org/T/#m79ced98939e895c840d812c8b4c2b3f33ce604c8
>=20
> Changes since previous version
> * Drop fltcon_type enum and use bool eint_flt_selectable (Sam)
> * Refactor and add exynos_eint_update_flt_reg() (Sam)
> * Rename function to exynos_eint_set_filter() for easier readability (Sam=
)
> * Remove comments and `if bank->fltcon_type !=3D FLT_DEFAULT)` checks and=
 indentation (Sam)
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0 | 60 +++++++++++++++=
+++++++++++++++-
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h=C2=A0 |=C2=A0 9 +++++
> =C2=A0drivers/pinctrl/samsung/pinctrl-samsung.c |=C2=A0 1 +
> =C2=A0drivers/pinctrl/samsung/pinctrl-samsung.h |=C2=A0 4 +++
> =C2=A04 files changed, 73 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index ddc7245ec2e5..a0256715f8f6 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -369,6 +369,60 @@ struct exynos_eint_gpio_save {
> =C2=A0	u32 eint_mask;
> =C2=A0};
> =C2=A0
> +static void exynos_eint_update_flt_reg(void __iomem *reg, int cnt, int c=
on)
> +{
> +	unsigned int val, shift;
> +	int i;
> +
> +	val =3D readl(reg);
> +	for (i =3D 0; i < cnt; i++) {
> +		shift =3D i * EXYNOS_FLTCON_LEN;
> +		val &=3D ~(EXYNOS_FLTCON_MASK << shift);

This is also clearing FLT_WIDTH. Is this intended? Should the
value be retained / restored if the digital filter mode is
selected? It seems in analog mode the width is ignored anyway,
so maybe it doesn't need to be cleared?

This might be more relevant if samsung-pinctrl implemented
PIN_CONFIG_INPUT_DEBOUNCE (which it doesn't at the moment),
but would still be good to allow that to work.

> +		val |=3D con << shift;
> +	}
> +	writel(val, reg);
> +}
> +
> +/*
> + * Set the desired filter (digital or analog delay) to every pin in
> + * the bank. Note the filter selection bitfield is only found on alive
> + * banks. The filter determines to what extent signal fluctuations
> + * received through the pad are considered glitches.
> + *
> +=C2=A0 The FLTCON register (on alive banks) has the following layout
> + *
> + * BitfieldName[PinNum][Bit:Bit]
> + * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
> + * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
> + * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
> + * FLT_EN[0][7]=C2=A0 FLT_SEL[0][6]=C2=A0 FLT_WIDTH[0][5:0]
> + *
> + * FLT_EN	0x0 =3D Disable, 0x1=3DEnable
> + * FLT_SEL	0x0 =3D Delay filter, 0x1 Digital filter

It's a delay filter filter either way, right? If so, I
think '0x0 =3D Delay filter' should instead be reworded to
'0x0 =3D Analog filter'.

> + * FLT_WIDTH	Filtering width. Valid when FLT_SEL is 0x1

This complete above register layout description would be
better suited right above the macro definition in
pinctrl-exynos.h I believe.

> + */
> +static void exynos_eint_set_filter(struct samsung_pin_bank *bank, int fi=
lter)
> +{
> +	unsigned int off =3D EXYNOS_GPIO_EFLTCON_OFFSET + bank->eint_fltcon_off=
set;
> +	void __iomem *reg =3D bank->drvdata->virt_base + off;
> +	unsigned int con =3D EXYNOS_FLTCON_EN | filter;
> +	u8 n =3D bank->nr_pins;
> +
> +	if (!bank->eint_flt_selectable)
> +		return;
> +
> +	/*
> +	 * If nr_pins > 4, we should set FLTCON0 register fully (pin0~3).
> +	 * So loop 4 times in case of FLTCON0. Loop for FLTCON1 pin4~7.
> +	 */

This comment is a bit confusing now. There is no loop left here (as
it has moved). The loop is an implementation detail of
exynos_eint_update_flt_reg() and shouldn't be referred to here.

> +	if (n <=3D 4) {
> +		exynos_eint_update_flt_reg(reg, n, con);
> +	} else {
> +		exynos_eint_update_flt_reg(reg, 4, con);
> +		exynos_eint_update_flt_reg(reg + 0x4, n - 4, con);
> +	}

How about something like this instead of if/else:

	for (int n =3D 0; n < bank->nr_pins; n +=3D 4)
		exynos_eint_update_flt_reg(reg + n,
					   min(bank->nr_pins - n, 4), con);


> +}
> +
> =C2=A0/*
> =C2=A0 * exynos_eint_gpio_init() - setup handling of external gpio interr=
upts.
> =C2=A0 * @d: driver data of samsung pinctrl driver.
> @@ -420,7 +474,7 @@ __init int exynos_eint_gpio_init(struct samsung_pinct=
rl_drv_data *d)
> =C2=A0			ret =3D -ENOMEM;
> =C2=A0			goto err_domains;
> =C2=A0		}
> -
> +		exynos_eint_set_filter(bank, EXYNOS_FLTCON_DELAY);
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -833,6 +887,8 @@ void gs101_pinctrl_suspend(struct samsung_pin_bank *b=
ank)
> =C2=A0				 bank->name, save->eint_fltcon1);
> =C2=A0		pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n",
> =C2=A0			 bank->name, save->eint_mask);
> +	} else if (bank->eint_type =3D=3D EINT_TYPE_WKUP) {
> +		exynos_eint_set_filter(bank, EXYNOS_FLTCON_DELAY);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -888,6 +944,8 @@ void gs101_pinctrl_resume(struct samsung_pin_bank *ba=
nk)
> =C2=A0			writel(save->eint_fltcon1, eint_fltcfg0 + 4);
> =C2=A0		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> +	} else if (bank->eint_type =3D=3D EINT_TYPE_WKUP) {
> +		exynos_eint_set_filter(bank, EXYNOS_FLTCON_DIGITAL);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index 773f161a82a3..4f2dc6a2e5c7 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -52,6 +52,13 @@
> =C2=A0#define EXYNOS_EINT_MAX_PER_BANK	8
> =C2=A0#define EXYNOS_EINT_NR_WKUP_EINT
> =C2=A0
> +/* EINT filter configuration */
> +#define EXYNOS_FLTCON_EN		BIT(7)
> +#define EXYNOS_FLTCON_DIGITAL		BIT(6)
> +#define EXYNOS_FLTCON_DELAY		(0 << 6)

should EXYNOS_FLTCON_DELAY be EXYNOS_FLTCON_ANALOG?


Cheers,
Andre'

> +#define EXYNOS_FLTCON_MASK		GENMASK(7, 0)
> +#define EXYNOS_FLTCON_LEN		8
> +
> =C2=A0#define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
> =C2=A0	{						\
> =C2=A0		.type		=3D &bank_type_off,	\
> @@ -183,6 +190,7 @@
> =C2=A0		.eint_type		=3D EINT_TYPE_GPIO,	\
> =C2=A0		.eint_offset		=3D offs,			\
> =C2=A0		.eint_fltcon_offset	=3D fltcon_offs,		\
> +		.eint_flt_selectable	=3D false,		\
> =C2=A0		.name			=3D id			\
> =C2=A0	}
> =C2=A0
> @@ -194,6 +202,7 @@
> =C2=A0		.eint_type		=3D EINT_TYPE_WKUP,		\
> =C2=A0		.eint_offset		=3D offs,				\
> =C2=A0		.eint_fltcon_offset	=3D fltcon_offs,			\
> +		.eint_flt_selectable	=3D true,			\
> =C2=A0		.name			=3D id				\
> =C2=A0	}
> =C2=A0
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/=
samsung/pinctrl-samsung.c
> index 375634d8cc79..9b874ab2c89b 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1231,6 +1231,7 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl=
_drv_data *d,
> =C2=A0		bank->eint_mask_offset =3D bdata->eint_mask_offset;
> =C2=A0		bank->eint_pend_offset =3D bdata->eint_pend_offset;
> =C2=A0		bank->eint_fltcon_offset =3D bdata->eint_fltcon_offset;
> +		bank->eint_flt_selectable =3D bdata->eint_flt_selectable;
> =C2=A0		bank->name =3D bdata->name;
> =C2=A0
> =C2=A0		raw_spin_lock_init(&bank->slock);
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/=
samsung/pinctrl-samsung.h
> index e939e5bb0347..22f3c1e15e6a 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -145,6 +145,7 @@ struct samsung_pin_bank_type {
> =C2=A0 * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register of=
fset of bank.
> =C2=A0 * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register of=
fset of bank.
> =C2=A0 * @eint_fltcon_offset: GS101 SoC-specific EINT filter config regis=
ter offset.
> + * @eint_flt_selectable: whether the filter (delay/digital) is selectabl=
e.
> =C2=A0 * @name: name to be prefixed for each pin in this pin bank.
> =C2=A0 */
> =C2=A0struct samsung_pin_bank_data {
> @@ -160,6 +161,7 @@ struct samsung_pin_bank_data {
> =C2=A0	u32		eint_mask_offset;
> =C2=A0	u32		eint_pend_offset;
> =C2=A0	u32		eint_fltcon_offset;
> +	bool		eint_flt_selectable;
> =C2=A0	const char	*name;
> =C2=A0};
> =C2=A0
> @@ -178,6 +180,7 @@ struct samsung_pin_bank_data {
> =C2=A0 * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register of=
fset of bank.
> =C2=A0 * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register of=
fset of bank.
> =C2=A0 * @eint_fltcon_offset: GS101 SoC-specific EINT filter config regis=
ter offset.
> + * @eint_flt_selectable: whether the filter (delay/digital) is selectabl=
e
> =C2=A0 * @name: name to be prefixed for each pin in this pin bank.
> =C2=A0 * @id: id of the bank, propagated to the pin range.
> =C2=A0 * @pin_base: starting pin number of the bank.
> @@ -205,6 +208,7 @@ struct samsung_pin_bank {
> =C2=A0	u32		eint_mask_offset;
> =C2=A0	u32		eint_pend_offset;
> =C2=A0	u32		eint_fltcon_offset;
> +	bool		eint_flt_selectable;
> =C2=A0	const char	*name;
> =C2=A0	u32		id;
> =C2=A0
>=20

