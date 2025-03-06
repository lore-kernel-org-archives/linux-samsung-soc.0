Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEBE1DDA35
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 15:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741273958; cv=none; b=m4tNrSeNl3LVVC5DVAphib7gLiN42FfAl4rBoUUZiGiNHTkXTnsLJk7t4CnAJ+1CBqAT7fs6wy3TL1nq0WxoNXZQebyLdM8s5zn6tcYybIHfFWR24gq+ozv358dgST0uxnBDNLp32T2WS9yCL2yVJBRNKKFfaFRhaJUZ9/+qP5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741273958; c=relaxed/simple;
	bh=MbaA8Jl8S3jVUvq6r2rR5IWHnrkzSP2fS8HSagCBdRM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VFTiGh/NIt5lBHCYS1nL4fLS6QM9Pr0OKmpFKVz2F8R6zq5RtcU64rS+J8ncvd5uqAoBKefOasUNJqoH7+o36J74wh2mmIEdchvXSjAKv3USO9i8RZZp9xaUwHxY7hwLxAhkXk2FkeRT67zr5ztbI4g9WS6UDHpSPz3lx5AuTn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1iNrT1s; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1iNrT1s"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abf5f4e82caso155157466b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2025 07:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741273954; x=1741878754; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t63bq+d/LpsIykq1hi1k/LtwI40WtvQ23p3N/1mWz+k=;
        b=B1iNrT1s8vE2ZKV+ggwmXWvnlpKw0n+8TpDKyJDt04+bQL59JHvAP/Y9xpDYPxBN/R
         A/ToL45rIBBaNK06mHrAmOebK0yPPM/GlHENm3u/4EE8vHH7XxDTZFu9nCvY1ETtoXsl
         Spcjq0z2C9Y4KZT3ts0vKJKzPnIn0hVA+wEs2sLR0foZwsPajMRA4bh8NQXWUp2tF7UA
         YFu76ePxiEUYvr8I6yyw+TlDwFGQxH924F0b/5zz0ekQ1CM8tFzxWY90hpjPu8RRzEyM
         ZMUT40Pdx3FlgrRGVXYCat5mWRKMO8u4c1+7fOZUEzaK3XoIGMcQmncE3/z/irg8wbM8
         17nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741273954; x=1741878754;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t63bq+d/LpsIykq1hi1k/LtwI40WtvQ23p3N/1mWz+k=;
        b=p2Xd3bHhML3MRdkUL40MaP1yieJrb86F6jNYf3TCn2N0MC1VeBz/DFRWMWrg/pXPVi
         shCD8GYI2pP6BE4XAz+RGKuGtAYJq/czMot4A9N5xUFHZxyUcP1y4+CWf3ojCokt5eMV
         bME+s1CJRlOZp+gwSD9kqJl65fIjnhpvr76/Pw09SQ/bhlbDyHzrBwAONk3jEbfJnWL4
         Puuy5veO9CB472OVfNyxtJr4QoztUU+Wue6PnDv4smgnMW410CTyBLLG4uVEui9azFOY
         3FOLV9cPPSAp4+DCXVFC9RuCcQV7VK9AIzrBQSLae5dOqG0b2LznwnAk+oCbaE67Hcyk
         N8mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEFqhrse9noJ6MoXFNEO1KVwMMwtZZFPnq3S79VQ4UGvuKQ/SYKnX0i5jBmuyFCD8hUPc5mCL0T3VzpYZYBnHe0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvR2d4wowr89HAFNg8ixjN1sWtuGSpPjSR4DjO9x5Llj9h4xtd
	P/SvNUqYv4MMSJIOiNCb1922o9ZLSfXa5VYjyvpl54OYEC4TYBykNdmB1yxElRuEYvHJc/PQcBO
	pwKfooA==
X-Gm-Gg: ASbGncuyH7oLy1QyaZMLae4ahvXnwA351JjWqZZUcYLPZQQPoY9NGsAg4Oy40zn1+ZV
	KpN4zh4RYjxOAl+PLi0nT0YX9SXDekHdwSud6wGkwAx9oRQ+YfWyvkXffMs9c+i2W1tlNuSObKw
	Sfail9aL9uNN+gfUcAWiLwK8MeHUP+n7IqQa7jNS2X48W6vgHiAdUvWRWOCchJj/Bk3N7+VW6gM
	FXTEjvG5oLcFLikfHL7WYXx/rTay0ffL+e9SiQR1tBHzN5TTDeSRNxH/aTVSoVbEwhOTeQ/RYnx
	034HbmxVk/sr1IExWGwQu5W35lqb5zDztBLKA5WfKO5tO0ci
X-Google-Smtp-Source: AGHT+IH7SBrGMUK6lepD8VBY8jodF8Fc1H+Cg8ymOlKEi3QzrC0KSEIuP1OA3o6i6LlXHdXrzopcZA==
X-Received: by 2002:a17:907:7f89:b0:ac1:db49:99b7 with SMTP id a640c23a62f3a-ac20e42964amr851164166b.51.1741273954310;
        Thu, 06 Mar 2025 07:12:34 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239488be1sm110733966b.74.2025.03.06.07.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:12:33 -0800 (PST)
Message-ID: <5fe34e1193a167c24c7af900f5b7cf85140d66e0.camel@linaro.org>
Subject: Re: [PATCH v2 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com, stable@vger.kernel.org
Date: Thu, 06 Mar 2025 15:12:32 +0000
In-Reply-To: <20250301-pinctrl-fltcon-suspend-v2-3-a7eef9bb443b@linaro.org>
References: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
	 <20250301-pinctrl-fltcon-suspend-v2-3-a7eef9bb443b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-03-01 at 11:43 +0000, Peter Griffin wrote:
> gs101 differs to other SoCs in that fltcon1 register doesn't
> always exist. Additionally the offset of fltcon0 is not fixed
> and needs to use the newly added eint_fltcon_offset variable.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configurati=
on")
> Cc: stable@vger.kernel.org
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 24 ++++-----
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 71 ++++++++++++++++++++++++++
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A03 files changed, 85 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index 57c98d2451b5..fca447ebc5f5 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -1455,15 +1455,15 @@ static const struct samsung_pin_ctrl gs101_pin_ct=
rl[] __initconst =3D {
> =C2=A0		.pin_banks	=3D gs101_pin_alive,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(gs101_pin_alive),
> =C2=A0		.eint_wkup_init =3D exynos_eint_wkup_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
> =C2=A0		.pin_banks	=3D gs101_pin_far_alive,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(gs101_pin_far_alive),
> =C2=A0		.eint_wkup_init =3D exynos_eint_wkup_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin banks of gs101 pin-controller (GSACORE) */
> =C2=A0		.pin_banks	=3D gs101_pin_gsacore,
> @@ -1477,29 +1477,29 @@ static const struct samsung_pin_ctrl gs101_pin_ct=
rl[] __initconst =3D {
> =C2=A0		.pin_banks	=3D gs101_pin_peric0,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(gs101_pin_peric0),
> =C2=A0		.eint_gpio_init =3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin banks of gs101 pin-controller (PERIC1) */
> =C2=A0		.pin_banks	=3D gs101_pin_peric1,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(gs101_pin_peric1),
> =C2=A0		.eint_gpio_init =3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume	=3D exynos_pinctrl_resume,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin banks of gs101 pin-controller (HSI1) */
> =C2=A0		.pin_banks	=3D gs101_pin_hsi1,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(gs101_pin_hsi1),
> =C2=A0		.eint_gpio_init =3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin banks of gs101 pin-controller (HSI2) */
> =C2=A0		.pin_banks	=3D gs101_pin_hsi2,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(gs101_pin_hsi2),
> =C2=A0		.eint_gpio_init =3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index d65a9fba0781..ddc7245ec2e5 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -801,6 +801,41 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank =
*bank)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
> +{
> +	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> +	const void __iomem *regs =3D bank->eint_base;
> +
> +	exynos_set_wakeup(bank);

As for patch 2, would be good to have this if / else, to make it more
obvious that this is conditional, too.

> +
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> +		save->eint_con =3D readl(regs + EXYNOS_GPIO_ECON_OFFSET
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> +
> +		save->eint_fltcon0 =3D readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET +
> +					=C2=A0=C2=A0 bank->eint_fltcon_offset);

If there's another version, maybe align style where the '+'
is placed (end of line vs start of line). It seems this file
generally uses + at start of line.

> +
> +		/* fltcon1 register only exists for pins 4-7 */
> +		if (bank->nr_pins > 4)
> +			save->eint_fltcon1 =3D readl(regs +
> +						EXYNOS_GPIO_EFLTCON_OFFSET +
> +						bank->eint_fltcon_offset + 4);
> +
> +		save->eint_mask =3D readl(regs + bank->irq_chip->eint_mask
> +					+ bank->eint_offset);
> +
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x\n",
> +			 bank->name, save->eint_con);
> +		pr_debug("%s: save fltcon0 %#010x\n",
> +			 bank->name, save->eint_fltcon0);
> +		if (bank->nr_pins > 4)
> +			pr_debug("%s: save fltcon1 %#010x\n",
> +				 bank->name, save->eint_fltcon1);
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n",
> +			 bank->name, save->eint_mask);
> +	}
> +}
> +
> =C2=A0void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
> =C2=A0{
> =C2=A0	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> @@ -820,6 +855,42 @@ void exynosautov920_pinctrl_suspend(struct samsung_p=
in_bank *bank)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
> +{
> +	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> +
> +	void __iomem *regs =3D bank->eint_base;
> +	void __iomem *eint_fltcfg0 =3D regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +		=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_fltcon_offset;
> +
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> +		pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", bank-=
>name,
> +			 readl(regs + EXYNOS_GPIO_ECON_OFFSET
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset), save->eint=
_con);
> +
> +		pr_debug("%s: fltcon0 %#010x =3D> %#010x\n", bank->name,
> +			 readl(eint_fltcfg0), save->eint_fltcon0);
> +
> +		/* fltcon1 register only exists for pins 4-7 */
> +		if (bank->nr_pins > 4) {
> +			pr_debug("%s: fltcon1 %#010x =3D> %#010x\n", bank->name,
> +				 readl(eint_fltcfg0 + 4), save->eint_fltcon1);
> +		}

If there's another version, braces are not needed here.

Cheers,
Andre'


> +		pr_debug("%s:=C2=A0=C2=A0=C2=A0 mask %#010x =3D> %#010x\n", bank->name=
,
> +			 readl(regs + bank->irq_chip->eint_mask
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset), save->eint=
_mask);
> +
> +		writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> +		writel(save->eint_fltcon0, eint_fltcfg0);
> +
> +		if (bank->nr_pins > 4)
> +			writel(save->eint_fltcon1, eint_fltcfg0 + 4);
> +		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> +	}
> +}
> +
> =C2=A0void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
> =C2=A0{
> =C2=A0	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index 35c2bc4ea488..773f161a82a3 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -225,6 +225,8 @@ void exynosautov920_pinctrl_resume(struct samsung_pin=
_bank *bank);
> =C2=A0void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
> =C2=A0void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
> =C2=A0void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
> +void gs101_pinctrl_suspend(struct samsung_pin_bank *bank);
> +void gs101_pinctrl_resume(struct samsung_pin_bank *bank);
> =C2=A0struct samsung_retention_ctrl *
> =C2=A0exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct samsung_retention_dat=
a *data);
>=20

