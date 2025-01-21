Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0051F426C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 15:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737473958; cv=none; b=iQLbdw2iv6UFroDMHxJsKIjgGInP5G0FA1AHO8b/ItB6Usnd4yIAukZjPVFgu6hElyHfOMtMWFwY4Yem/kWXFmXF+jFttdzxY6XYJ3XhySZbZupJrPAj8iV6ovFR6Tw7DOfV4k5Phv8RzyByOI9QHVVK6bc8gkH7O+053ugSiZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737473958; c=relaxed/simple;
	bh=bT3k2Vj7Q4G7sUClDNlxU6qL8y2LUi1aMMF7FNGcWRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcXfUkI5gMimD+oj89SUSTCHYSkGSUuuit5ViLTCYdF7LmoMqrWlRaBafvpQm2TsGWgibGOlw9VswfKsa6tthB14T0HTOzJzAh/S7z4cyBkSqbrVMTM8L9aFmv5hjtfXDi0VVIgiyivhY255nt3KVKak3lOPWtVj2PnHrLmtd70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NPS2ACGm; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NPS2ACGm"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3eba347aa6fso3682371b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 07:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737473956; x=1738078756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpEzaLpUPVgnvbMrcFG9GFnZWyKmfdtZfySlxeDdI9A=;
        b=NPS2ACGmaN8nuMsb+stkJP8Q3mQ7iFhIvWvUkR2FIKUUYv3xJoHq7+K0RP8u0FQmyB
         vHvH+6QP3mDfOlLz3bWCkxT0NhhGWhbttai7u7kMgQ4oym1jVCq8Etb7SYDtv2XEyl7I
         971DJT323aHzTeGOZOpHmPfbtRRw6sQKR8h1GPx0xqZkithYPFLmOOUSx8P9PkjRGLWk
         qV8tqzZWUp/BInmUkrJYJU9fL3QfCjGca4Qg5O91/abSAMO9FKYF9yg4yufFVewkAk8S
         K0v8m24IdDDASuNbwE0Pz/vcWuzWS0DNAZ0QZRiMnCwzEAgrSLyuxmFCsg8PEdpvpe7m
         FATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737473956; x=1738078756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpEzaLpUPVgnvbMrcFG9GFnZWyKmfdtZfySlxeDdI9A=;
        b=QyUX0LWwaMlYQin+/zHAQLPl+2AmWxUl0uPns4mkfMDer/bjUDjyQKadjkNMAaihdL
         R9B9EaJlsLrgXju+i/Mzu3QMuf5E2wRelkXdBVP6J45axmEIjGywN5muSqh4+mB2tc7j
         5uP7bir71+RVkSDcbBWhRaot5+VGbtuM3/mWbH7UVqA58kZx98moTjTOutNXFFb5l7jN
         SKnSV6EekL6FtnWcC3MIxUuqh3WsBXfDbKs04luUGX1KDYwh/lEOBNTsCw3pX+EE4SZ8
         mBPmTHpFZIhjHmO6YMibfEj1/qNPnC+2nt5YwMk34Sm2u1G9HBD3atVJrou0a+H0J4yZ
         HArg==
X-Forwarded-Encrypted: i=1; AJvYcCVc+EKD0OvO+DKYJgEBEyRW1htL36qh945sQKROwNk66o9COuOFPkUkk6eC1OfJRur9wrhKSQYWD65HEnW7wQVSng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOfMM0NxlGGQCFNV4GmSFgSacgacn9EnjNMcJ1TbcfP+wAw+lb
	WZX/YieEF2SUMNeXYp+UthvfPqJlGiP4yC6uEs1TcJDbM3iUWr0QYPZH7syYUzdTiK34qAsXA4C
	rxQbV9yb9LVAN8zM/8gnngtiCAPu7MbnurdKexA==
X-Gm-Gg: ASbGncuK5J44yUI9orKwVZwThXEvMhn3JX1qKR4UtijaCt3t6dpvtyTNPenG5zd6dKX
	yZqicL4mhaUzkNVI1tlYCt7rvqp83aAzIK/QKC6XQCdGaGnPdCWSC
X-Google-Smtp-Source: AGHT+IFnJ8N+5YtYfvuf5S6g2HfynsGmJ0fs0JGatpzubpiLPLSrpQDfhHCLB2qE03TDy/+N2p607XTHlk5N9mzZRTU=
X-Received: by 2002:a05:6808:e89:b0:3eb:623e:84f0 with SMTP id
 5614622812f47-3f19fca135amr11337953b6e.20.1737473955684; Tue, 21 Jan 2025
 07:39:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
 <20250120-pinctrl-fltcon-suspend-v1-3-e77900b2a854@linaro.org> <4e2057fc54022ba5791e482a1e631a1a77551389.camel@linaro.org>
In-Reply-To: <4e2057fc54022ba5791e482a1e631a1a77551389.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 21 Jan 2025 15:39:04 +0000
X-Gm-Features: AbW1kvZgrWDOvgxigY9IkhtO-kvZAjtGMpR8OW203jrMm-5JieouqGyGv-ZCaV0
Message-ID: <CADrjBPr3VVvY4axBhAEO4zVGhLMiDZ8jWHCf=uSfEBMcZSOa=Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: samsung: Add filter selection support for
 alive bank on gs101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, jaewon02.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for your review feedback.

On Tue, 21 Jan 2025 at 11:04, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Hi Peter,
>
> On Mon, 2025-01-20 at 22:34 +0000, Peter Griffin wrote:
> > Newer Exynos based SoCs have a filter selection bitfield in the filter
> > configuration registers on alive bank pins. This allows the selection o=
f
> > a digital or analog delay filter for each pin. Add support for selectin=
g
> > and enabling the filter.
> >
> > On suspend we set the analog filter to all pins in the bank (as the
> > digital filter relies on a clock). On resume the digital filter is
> > reapplied to all pins in the bank. The digital filter is working via
> > a clock and has an adjustable filter delay flt_width bitfield, whereas
> > the analog filter uses a fixed delay.
> >
> > The filter determines to what extent signal fluctuations received throu=
gh
> > the pad are considered glitches.
> >
> > The code path can be exercised using
> > echo mem > /sys/power/state
> > And then wake the device using a eint gpio
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >
> > Note: this patch was previously sent as part of the initial gs101/ Pixe=
l 6
> > series and was dropped in v6. This new version incorporates the review
> > feedback from Sam Protsenko here in v5.
> >
> > Link: https://lore.kernel.org/all/20231201160925.3136868-1-peter.griffi=
n@linaro.org/T/#m79ced98939e895c840d812c8b4c2b3f33ce604c8
> >
> > Changes since previous version
> > * Drop fltcon_type enum and use bool eint_flt_selectable (Sam)
> > * Refactor and add exynos_eint_update_flt_reg() (Sam)
> > * Rename function to exynos_eint_set_filter() for easier readability (S=
am)
> > * Remove comments and `if bank->fltcon_type !=3D FLT_DEFAULT)` checks a=
nd indentation (Sam)
> > ---
> >  drivers/pinctrl/samsung/pinctrl-exynos.c  | 60 +++++++++++++++++++++++=
+++++++-
> >  drivers/pinctrl/samsung/pinctrl-exynos.h  |  9 +++++
> >  drivers/pinctrl/samsung/pinctrl-samsung.c |  1 +
> >  drivers/pinctrl/samsung/pinctrl-samsung.h |  4 +++
> >  4 files changed, 73 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl=
/samsung/pinctrl-exynos.c
> > index ddc7245ec2e5..a0256715f8f6 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > @@ -369,6 +369,60 @@ struct exynos_eint_gpio_save {
> >       u32 eint_mask;
> >  };
> >
> > +static void exynos_eint_update_flt_reg(void __iomem *reg, int cnt, int=
 con)
> > +{
> > +     unsigned int val, shift;
> > +     int i;
> > +
> > +     val =3D readl(reg);
> > +     for (i =3D 0; i < cnt; i++) {
> > +             shift =3D i * EXYNOS_FLTCON_LEN;
> > +             val &=3D ~(EXYNOS_FLTCON_MASK << shift);
>
> This is also clearing FLT_WIDTH. Is this intended? Should the
> value be retained / restored if the digital filter mode is
> selected? It seems in analog mode the width is ignored anyway,
> so maybe it doesn't need to be cleared?

Currently we don't support setting the FLT_WIDTH bitfield and the
reset value is zero. But I guess it would be better to not clear the
bitfield in case the bootloader does set a value in the future. I'll
update to do that in the next version.

> This might be more relevant if samsung-pinctrl implemented
> PIN_CONFIG_INPUT_DEBOUNCE (which it doesn't at the moment),
> but would still be good to allow that to work.
>
> > +             val |=3D con << shift;
> > +     }
> > +     writel(val, reg);
> > +}
> > +
> > +/*
> > + * Set the desired filter (digital or analog delay) to every pin in
> > + * the bank. Note the filter selection bitfield is only found on alive
> > + * banks. The filter determines to what extent signal fluctuations
> > + * received through the pad are considered glitches.
> > + *
> > +  The FLTCON register (on alive banks) has the following layout
> > + *
> > + * BitfieldName[PinNum][Bit:Bit]
> > + * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
> > + * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
> > + * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
> > + * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
> > + *
> > + * FLT_EN    0x0 =3D Disable, 0x1=3DEnable
> > + * FLT_SEL   0x0 =3D Delay filter, 0x1 Digital filter
>
> It's a delay filter filter either way, right? If so, I
> think '0x0 =3D Delay filter' should instead be reworded to
> '0x0 =3D Analog filter'.

I see your point, and kind of agree that Analog is a better name. The
rationale for going with "Digital filter" and "Delay filter" was that
it matches the FLT_SEL bitfield description in the datasheet. I
thought it might confuse people using a different name. The info about
it being Analog filter came via a bug from Samsung. But if folks
prefer Analog I can use that instead.

@Krzysztof any thoughts on the above naming?

>
> > + * FLT_WIDTH Filtering width. Valid when FLT_SEL is 0x1
>
> This complete above register layout description would be
> better suited right above the macro definition in
> pinctrl-exynos.h I believe.

I can move the comment in the next version.

>
> > + */
> > +static void exynos_eint_set_filter(struct samsung_pin_bank *bank, int =
filter)
> > +{
> > +     unsigned int off =3D EXYNOS_GPIO_EFLTCON_OFFSET + bank->eint_fltc=
on_offset;
> > +     void __iomem *reg =3D bank->drvdata->virt_base + off;
> > +     unsigned int con =3D EXYNOS_FLTCON_EN | filter;
> > +     u8 n =3D bank->nr_pins;
> > +
> > +     if (!bank->eint_flt_selectable)
> > +             return;
> > +
> > +     /*
> > +      * If nr_pins > 4, we should set FLTCON0 register fully (pin0~3).
> > +      * So loop 4 times in case of FLTCON0. Loop for FLTCON1 pin4~7.
> > +      */
>
> This comment is a bit confusing now. There is no loop left here (as
> it has moved). The loop is an implementation detail of
> exynos_eint_update_flt_reg() and shouldn't be referred to here.

Will fix.

>
> > +     if (n <=3D 4) {
> > +             exynos_eint_update_flt_reg(reg, n, con);
> > +     } else {
> > +             exynos_eint_update_flt_reg(reg, 4, con);
> > +             exynos_eint_update_flt_reg(reg + 0x4, n - 4, con);
> > +     }
>
> How about something like this instead of if/else:
>
>         for (int n =3D 0; n < bank->nr_pins; n +=3D 4)
>                 exynos_eint_update_flt_reg(reg + n,
>                                            min(bank->nr_pins - n, 4), con=
);

Will update as you suggest.

>
>
> > +}
> > +
> >  /*
> >   * exynos_eint_gpio_init() - setup handling of external gpio interrupt=
s.
> >   * @d: driver data of samsung pinctrl driver.
> > @@ -420,7 +474,7 @@ __init int exynos_eint_gpio_init(struct samsung_pin=
ctrl_drv_data *d)
> >                       ret =3D -ENOMEM;
> >                       goto err_domains;
> >               }
> > -
> > +             exynos_eint_set_filter(bank, EXYNOS_FLTCON_DELAY);
> >       }
> >
> >       return 0;
> > @@ -833,6 +887,8 @@ void gs101_pinctrl_suspend(struct samsung_pin_bank =
*bank)
> >                                bank->name, save->eint_fltcon1);
> >               pr_debug("%s: save    mask %#010x\n",
> >                        bank->name, save->eint_mask);
> > +     } else if (bank->eint_type =3D=3D EINT_TYPE_WKUP) {
> > +             exynos_eint_set_filter(bank, EXYNOS_FLTCON_DELAY);
> >       }
> >  }
> >
> > @@ -888,6 +944,8 @@ void gs101_pinctrl_resume(struct samsung_pin_bank *=
bank)
> >                       writel(save->eint_fltcon1, eint_fltcfg0 + 4);
> >               writel(save->eint_mask, regs + bank->irq_chip->eint_mask
> >                      + bank->eint_offset);
> > +     } else if (bank->eint_type =3D=3D EINT_TYPE_WKUP) {
> > +             exynos_eint_set_filter(bank, EXYNOS_FLTCON_DIGITAL);
> >       }
> >  }
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl=
/samsung/pinctrl-exynos.h
> > index 773f161a82a3..4f2dc6a2e5c7 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> > @@ -52,6 +52,13 @@
> >  #define EXYNOS_EINT_MAX_PER_BANK     8
> >  #define EXYNOS_EINT_NR_WKUP_EINT
> >
> > +/* EINT filter configuration */
> > +#define EXYNOS_FLTCON_EN             BIT(7)
> > +#define EXYNOS_FLTCON_DIGITAL                BIT(6)
> > +#define EXYNOS_FLTCON_DELAY          (0 << 6)
>
> should EXYNOS_FLTCON_DELAY be EXYNOS_FLTCON_ANALOG?

Same comment as above, I used DELAY  because it matches the datasheet
bitfield description but I agree that ANALOG is a better name and
would make code readability better. The downside is we don't match the
datasheet description.

Thanks,

Peter
