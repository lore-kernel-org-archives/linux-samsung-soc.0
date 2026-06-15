Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B113F5BCF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532913; cv=pass; b=luzaVJMWmlawsnFoWT+AUxSoX7zaPsZcIpNOENUzaqG8FdnrMSI5S09DABP1TJT8ufLykYvROyb/zkhSEuDKkWNSTp/3Ai0p2iiKVXCEnePCfJ7lsU1JWWyzWzAV0xIiCeV8h6coPPkSmSr8mspYQKqA8E51MEDJFi8LBgm2fKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532913; c=relaxed/simple;
	bh=xTYJTF9WX1tkILvQ4OfNPiOZwQsAyO+hC34NdNlz0q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tov865MUsyQCiSMlSbGOTxLGcnkAX4iz9LnJnNuC/ewxhmpCrWEsRGx1N/rVfIJQfS+OrrsMZT2tdpO/n7V90wYiptAccO1lYYH7hF0k6cz/IfrgzjZ9SOQy8c0nKEWXmDR+glw7FE6jF8EgmkB0G8lisx4S9VVYrfoTjfAnJEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rENLb8Dx; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rENLb8Dx"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bebc80100efso349022966b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 07:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781532911; cv=none;
        d=google.com; s=arc-20240605;
        b=ITM8Tkvb5gsjrBhvlSKXX+kdLBrp1rwkLSD7V4AomEp7Xma4dVzOCy7vm4M4OYHRjh
         qOuqP2Yj//i2hH5T1ZBcQdBKj7BJMCduXYQNuLvDBFv5+0/8ngyt9fXEBmzBSMPn6Qao
         CQ8rE0ySIHLGiXTDiqUs68G4fiJkKsQmvmowkCDlm9udbDyGp2GpFlCiwSAk5OajFPps
         seSalkgRrXFhp/DOMbZWkG3oOrvUfR1fvU1XLhedxthM0G2NLr+4duoxZlS1USU86V6k
         0ShWIky66h/993KCmKt03OQBNtJBYmYKo4rOBd7XMU4Beo3O0qGIWs8e2PFTeZT6EESc
         GCFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nVryjK2DM4sA5w3mh6UPqm7isJZnfv1jNZ8fuuEu1pk=;
        fh=qclPCs23oyTOI5er0cguGBTexZeGLSRNBCXfsao9t0Y=;
        b=IDplco75gvGaYuPdXpdyJEgXPXiePnci0UdOCxQ/4PMS3Zb++0cN3nEq+vgtYuCfHS
         xYg2si9GBJ1jEB2d55VVCqE9tLNNYesjnw7JwIFYgUegRxviSHCSCYSkK65B3PFYm0NL
         V5S+n05uldF+NwDbVqAW3ET038HKY1WMT60kVlUOxwjwEjDtzwO+FOn114L/9JKvQ8dA
         2RjuxIs4oPgCdZhO7/s+8ixAILVyM0izYh8l5d882rdDg07Tz9l22sEq8C3A6hf5+QN5
         i47FwU5rw1HpSqYfkYvdh0u+tX4sGLDc7CBYedjtM8uwbhvaqov5EtBI6KwQCZh9ZBS0
         DNnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781532911; x=1782137711; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nVryjK2DM4sA5w3mh6UPqm7isJZnfv1jNZ8fuuEu1pk=;
        b=rENLb8DxHg2dzAUvz70MPXSyXBkXXW6Sf13TbnWsNM8nXkt2iBxULOAU290i187Mxu
         B7G+0xJy7bgu4JMWJXdcp2qzInwd158sAog+xjFPHBYISoPyJIAEpTLeau0vN+VHOOWn
         x0enV73x89V2u4TPa5CgVA/T4o2fh0b28cWzB2T6p8kXdCZlGZnY1nfGdwVan40zF9Ww
         dF1CosTJQmUIzOTBoC7U4J1p+HrtXjIppibeo3eoJ2ByQwUEOOTOVvhmqI0VMUIU85+r
         myA4yCXosgJAIjLa4pVqqGYv36ymZhDpPr6nAr7S/i5zzx/ylLOrE2/9w5jH9Ph6io86
         klzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532911; x=1782137711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVryjK2DM4sA5w3mh6UPqm7isJZnfv1jNZ8fuuEu1pk=;
        b=n2lCAKzTOhuIrYTrwHCr8SA80ZF6TDW2l9lqiJtX+Suc/NxUbRYcPWVe3ghIWNC8by
         qEyVz4VofdJ9Xyz1W4UGZhuw3Yhxf/NcUIPNaavdaZvGr6QsmYeF1H7hSv7i3k+HFgTE
         q+EuQcmzIUtrs/1JHJgw7tEPrXqHXAaeF97PWI8442O0W3fv2m7ANxVM59+zI7/Xg5Xg
         aVB/6g/YzFFgcphbB2lhvKf9FCo/HOdVahPMTQ+baY+ZKA+VRE7lgMH9B+1BCC0dpHk7
         FmJ0N8N8xaGi+ApOXTG67o19UX/jL2kuEJvqzEBhL3FLedcPESKOQD4A44B7aezE3GqC
         3J5A==
X-Forwarded-Encrypted: i=1; AFNElJ/jmQQCaAQh6Pwlnp1nAr210AJzIASH6OYZUfDMEuor1n0mECILeF6IJRJiJ4kaUouLp4Ec59DuUL25A3s9r3D+gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTqAKZINHwIoa/qU5pGDWhmwtLfQDLW4ShJLhiZ1r2bXSAeCcj
	vaQEjf06qSKgkyAvXNcjGbVabVTbhziPyWrb/D1PRsTX5vVNOTxWlwz019q4raLZFkn5a4Aj0Qv
	Xj6vZ35VSAhmc0i2DrWYnOyg6LH823fgDqXjidS008g==
X-Gm-Gg: Acq92OEhC70AoHM+lkaG0IQxFfYE4W4o4lJj/Lhv3tj+0RYf/bj7rWlfM1TFFfeXrRy
	LCMl17yB/fu/T1+QbTKuImrT0ioVU47MhPFSoifWrxuubHfgJ5g+UD0v6SFeOY2iAsrXTQAnhA5
	tClrCrqn3gfzNGEnYtpSIGevZSIV1cQ2C40Xs4ytjuPE0NhbTN3RILuaWYKRWuRzPCoTDtDbsdk
	+hLbUuk9xz0DALAVxuH4uYpFslJu71LYktiRl9KtCrw0byB9r7yFrrhtRbbqht1LizmVwuW292y
	3wx9CtVDwLiQtNvdCON3M06xoL4gdEz0+18wCuNzKA==
X-Received: by 2002:a17:906:6312:b0:beb:a412:4597 with SMTP id
 a640c23a62f3a-bfe289041e9mr675217466b.16.1781532910299; Mon, 15 Jun 2026
 07:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260615083423epcas5p3acec08339e81e2d276d7953b3c6ee51a@epcas5p3.samsung.com>
 <20260615085252.1964423-1-alim.akhtar@samsung.com> <20260615085252.1964423-4-alim.akhtar@samsung.com>
In-Reply-To: <20260615085252.1964423-4-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 15 Jun 2026 15:14:58 +0100
X-Gm-Features: AVVi8CegUODrx3rDKzc3HaHPFo8dt4vcr6ypuvp0i1NB7YLXJyBmVm30dPPOny0
Message-ID: <CADrjBPpyNymPXtYgdeOGtp1KDkdp9gTrBAEcJR89B+wwF8uUXw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: samsung: Add Exynos8855 pinctrl configuration
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Alim,

Thanks for your patch. It's great to see more Exynos SoCs being supported!

On Mon, 15 Jun 2026 at 09:34, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add pinctrl configuration for Exynos8855. The bank type
> macros are reused from Exynos850 SoC.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 123 ++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
>  3 files changed, 126 insertions(+)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index fe9f92cb037e..db120ae4d847 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -943,6 +943,129 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
>         .num_ctrl       = ARRAY_SIZE(exynos850_pin_ctrl),
>  };
>

Are you sure you want to use E850 pinctrl macros and not the GS101
ones? The GS101 macros allow the fltcon offset to be specified, which
I think is required for all Exynos9 (including e850 SoC). Youngmin
sent a series previously
https://lore.kernel.org/lkml/20251202093613.852109-1-youngmin.nam@samsung.com/
fixing up some of this but it hasn't been re-spun in a while. In
particular this patch
https://lore.kernel.org/lkml/20251202093613.852109-4-youngmin.nam@samsung.com/.

> +/* pin banks of exynos8855 pin-controller 0 (ALIVE) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks0[] __initconst = {
> +       /* Must start with EINTG banks, ordered by EINT group number. */
> +       EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
> +       EXYNOS850_PIN_BANK_EINTW(4, 0x020, "gpa1", 0x04),
> +       EXYNOS850_PIN_BANK_EINTN(3, 0x040, "gpq0"),
> +       EXYNOS850_PIN_BANK_EINTN(2, 0x060, "gpq1"),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpc0", 0x10),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x0a0, "gpc1", 0x14),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x0c0, "gpc2", 0x18),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x0e0, "gpc3", 0x1c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpc4", 0x20),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpc5", 0x24),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpc6", 0x28),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpc7", 0x2c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpc8", 0x30),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x1a0, "gpc9", 0x34),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x1c0, "gpc10", 0x38),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x1e0, "gpc11", 0x3c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpc12", 0x40),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpc13", 0x44),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpc14", 0x48),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpj0", 0x4c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpj1", 0x50),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x2a0, "gpj2", 0x54),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 1 (CMGP) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks1[] __initconst = {
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x00,  "gpm0",  0x00),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x20,  "gpm1",  0x04),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x40,  "gpm2",  0x08),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x60,  "gpm3",  0x0c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x80,  "gpm4",  0x10),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0xa0,  "gpm5",  0x14),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0xc0,  "gpm6",  0x18),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0xe0,  "gpm7",  0x1c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm8",  0x20),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm9",  0x24),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm10", 0x28),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm11", 0x2c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm12", 0x30),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x1a0, "gpm13", 0x34),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x1c0, "gpm14", 0x38),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x1e0, "gpm15", 0x3c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x40),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x44),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm18", 0x48),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm19", 0x4c),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm20", 0x50),
> +       EXYNOS850_PIN_BANK_EINTW(1, 0x2a0, "gpm21", 0x54),
> +};
> +
> +
> +/* pin banks of exynos8855 pin-controller 2 (HSI UFS) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks2[] __initconst = {
> +       EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gpf3", 0x00),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 3 (PERIC) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks3[] __initconst = {
> +       EXYNOS850_PIN_BANK_EINTG(8, 0x0,   "gpp0", 0x00),
> +       EXYNOS850_PIN_BANK_EINTG(8, 0x20,  "gpp1", 0x04),
> +       EXYNOS850_PIN_BANK_EINTG(6, 0x40,  "gpp2", 0x08),
> +       EXYNOS850_PIN_BANK_EINTG(4, 0x60,  "gpg0", 0x0c),
> +       EXYNOS850_PIN_BANK_EINTG(3, 0x80,  "gpg1", 0x10),
> +       EXYNOS850_PIN_BANK_EINTG(6, 0xa0,  "gpb0", 0x14),
> +       EXYNOS850_PIN_BANK_EINTG(4, 0xc0,  "gpb1", 0x18),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 4 (PERICMMC) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks4[] __initconst = {
> +       EXYNOS850_PIN_BANK_EINTG(7, 0x0, "gpf2", 0x00),
> +};
> +
> +/* pin banks of exynos8855 pin-controller 5 (USI) */
> +static const struct samsung_pin_bank_data exynos8855_pin_banks5[] __initconst = {
> +       EXYNOS850_PIN_BANK_EINTG(8, 0x00, "gpp3", 0x00),
> +       EXYNOS850_PIN_BANK_EINTG(2, 0x20, "gpp4", 0x04),
> +       EXYNOS850_PIN_BANK_EINTG(2, 0x40, "gpg2", 0x08),
> +       EXYNOS850_PIN_BANK_EINTG(1, 0x60, "gpg3", 0x0c),
> +};
> +
> +static const struct samsung_pin_ctrl exynos8855_pin_ctrl[] __initconst = {
> +       {
> +               /* pin-controller instance 0 ALIVE data */
> +               .pin_banks      = exynos8855_pin_banks0,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks0),
> +               .eint_wkup_init = exynos_eint_wkup_init,
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +       }, {

With fltcon_offset specified, you could then use
gs101_pinctrl_suspend/gs101_pinctrl_resume callbacks here.

regards,

Peter.


> +               /* pin-controller instance 1 CMGP data */
> +               .pin_banks      = exynos8855_pin_banks1,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks1),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +       }, {
> +               /* pin-controller instance 2 HSI UFS data */
> +               .pin_banks      = exynos8855_pin_banks2,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks2),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +       }, {
> +               /* pin-controller instance 3 PERIC data */
> +               .pin_banks      = exynos8855_pin_banks3,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks3),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +       }, {
> +               /* pin-controller instance 4 PERICMMC data */
> +               .pin_banks      = exynos8855_pin_banks4,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks4),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +       }, {
> +               /* pin-controller instance 5 USI data */
> +               .pin_banks      = exynos8855_pin_banks5,
> +               .nr_banks       = ARRAY_SIZE(exynos8855_pin_banks5),
> +               .eint_gpio_init = exynos_eint_gpio_init,
> +       },
> +};
> +
> +const struct samsung_pinctrl_of_match_data exynos8855_of_data __initconst = {
> +       .ctrl           = exynos8855_pin_ctrl,
> +       .num_ctrl       = ARRAY_SIZE(exynos8855_pin_ctrl),
> +};
> +
>  /* pin banks of exynos990 pin-controller 0 (ALIVE) */
>  static struct samsung_pin_bank_data exynos990_pin_banks0[] = {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 5ac6f6b02327..5ecc9ed4c44d 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1500,6 +1500,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
>                 .data = &exynos7885_of_data },
>         { .compatible = "samsung,exynos850-pinctrl",
>                 .data = &exynos850_of_data },
> +       { .compatible = "samsung,exynos8855-pinctrl",
> +               .data = &exynos8855_of_data },
>         { .compatible = "samsung,exynos8890-pinctrl",
>                 .data = &exynos8890_of_data },
>         { .compatible = "samsung,exynos8895-pinctrl",
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
> index 937600430a6e..bb02fb49b2af 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -396,6 +396,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos7870_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
> +extern const struct samsung_pinctrl_of_match_data exynos8855_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos8890_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
>  extern const struct samsung_pinctrl_of_match_data exynos9610_of_data;
> --
> 2.34.1
>
