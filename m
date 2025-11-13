Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40D299A9E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 02:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763000256; cv=none; b=ElFtTev6xn7Ef8eLphnPER5LIYwoL1XgQONNAt1rOr4YVpjhTvRoAodehvNqyJrCyC+esIAx0nCGBzM/bismnpBYn9yrdCywcL+9DNpeFMspdSj9j+o1lm/I2VPZb/QmWHUdRlP0ssVKHx4DMWL58NJpLFBw6Pqfm29I5TWlPvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763000256; c=relaxed/simple;
	bh=oFMuSJl9maaqiD41NlM/1biLAahX8XMfEocOTyB66Vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7Y+Sz6v5/IO1luKKQsVnOGtGscs/gAiueI97yyIEkzXlmzM3jbf2GzNkeAZUuvMligmkZkkJ6CPejyNWSAonKC+qLRLYxfaj6mS8aiblg2JEflK28s6AUUzQxq0zjC3PSLFrrA2h7pabE4cGqETTUMY/Zjf40HiFIvMOyjlQPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pddvydeh; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pddvydeh"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-787be077127so3487297b3.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 18:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763000251; x=1763605051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21ZyYqGXKQqEomJc3MbmDkq7hKuKwr4eQ3J3lbp4Z3c=;
        b=Pddvydehj95P8daaU0EYG59u1hRwoAnhIpNcE6eVoOi3j/0avi+bSfww2kiX6v2jAz
         YT8ZSNo8i7G+tBDJ2hXjC1oQ/auvT38g06rd+t0uayajEZOLbq4H6MBWCVdI5HJRMmGa
         SRtrqWX70dqudNnYIT/6WiUdKHNwCG0YEvPtk6JoT65GcYiNLJAaK7P25S7uhPxcGZi6
         RYjve+dtpr4QuNBtesy8CP8dxyg2DIj6Y071aGsdXcRdNcImxhMJ/UIW/1JRbie5Zinx
         yY1cu5n85z8pqPEVEUv6pRup0dnqkWxtpLFo5IDZekfkTdWxCW8wZdLaaYTKENujiN1m
         2bWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763000251; x=1763605051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=21ZyYqGXKQqEomJc3MbmDkq7hKuKwr4eQ3J3lbp4Z3c=;
        b=YBFTree3NDRr4E/UE3ry6hMefRphKtuL1Ke9P0Zz5Pa2LDP82XyXeguhcwuw3AGdOg
         gsKOizj5ojsTpFDFtiy1pCygx5HA2eDKRrQC6UrCsL8tIymRj7lh2P6Pi9EDJCH6id+t
         /yOSoQykLv7Ez4oAdSEqvRbPnOQbbXuihBRCDt83+v9b84c9AmSbs7fevosWDuqYZ5xL
         Y14fdV8JMkcYthPlJIUTGlfLkpzk4sR+DETyUywKh1AaVGeJQK1Q4Gqr1boafDBxphgw
         zomtOE6HcaEvAhhkcWHoVg/XtnVLBkwPusq3qs6dyxSaPoMTFUwN4rMNTy7Q9f+PZLMk
         OfZA==
X-Forwarded-Encrypted: i=1; AJvYcCVbL0r4DXrZL2ALlytXBopPUplzG6Td44rfF0kgKqRa8hbMnmtVcQv8hV6kivfkvy2XPU0Xz8EgHoN4TlSx6mEsqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWB01eENJie7CPnR8ctOmDYNM0qDk8mj88KmHbTltKEyaZ8pUN
	kcvbJ2mcrRT6ufCm6XO0zTh9lz4q9vbqp/8bWOw3mEVy0esolaafM2kSEh1J+rb1paqt7tDgFWR
	Kyq9uJ2hw3OpfOoTxcOZtjpD7AIs/v+AbOgSLPBHAAg==
X-Gm-Gg: ASbGncvodPMSci+1TcTf+UfDzyvujALZwZ0KggOE947GZrE+7hTMa4cpmlvOnPW2Hwh
	lJ0idARVWAnGt4FlOrbhgyBVtbgej4zOYQOdV+EI9hc1PSwpyXn890nN3ea4KO4Ccz++LKG3Ju5
	hGJ1nRLBHgKWxps+1MrIzxRAswLgAeggeYUlk9fqQHdwXYEEBuYUQhnvLzee/FMlqQ+tgg59LBb
	mu6SStPgzjGlkqNE6knxVfgtNOcttbGwn+y6RRJVOp4qk8ZE2cHLG44DOpVkj3RqMps9AInEKsu
	GG6C/CMwKQzKayQtltk=
X-Google-Smtp-Source: AGHT+IE6f4b5EhSoqce4A+ki3S/IpZqZY3EboCU8XJ/g4WEGMfoBLssHR2ddN+Doy4G7w4cjJYEp0iTcaslhclAlHXY=
X-Received: by 2002:a05:690c:8681:20b0:786:540c:ed21 with SMTP id
 00721157ae682-788134e9ce6mr43537187b3.0.1763000250852; Wed, 12 Nov 2025
 18:17:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251110082142epcas2p367ab78c8dc9f74664b2773d918e9c4ab@epcas2p3.samsung.com>
 <20251110082649.3109858-1-youngmin.nam@samsung.com> <20251110082649.3109858-4-youngmin.nam@samsung.com>
In-Reply-To: <20251110082649.3109858-4-youngmin.nam@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 12 Nov 2025 20:17:19 -0600
X-Gm-Features: AWmQ_bkHUBXWZMS4CW2_30iU34OhhpaOL_ZFZQ9wh0dmwUrS7KTB9J8WhHgHHm8
Message-ID: <CAPLW+4kBseE6bWx406W3Uye=8-_2QT-FZ_AyfYUzKn8vNukmcw@mail.gmail.com>
Subject: Re: [RFT PATCH v1 3/5] pinctrl: samsung: add per-bank FLTCON offset
 to EXYNOS9_PIN_BANK_* and fix tables
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, peter.griffin@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:21=E2=80=AFAM Youngmin Nam <youngmin.nam@samsung.=
com> wrote:
>
> Several Exynos9-era pin-bank tables were implicitly assuming that the
> filter control (FLTCON) registers are laid out contiguously
> from the EINT base offset. Per the TRMs this is not always true. FLTCON
> can live at a separate per-bank offset, and the current tables cause the
> driver to program the wrong FLTCON addresses for some banks.
>
> - Extends EXYNOS9_PIN_BANK_EINTG()/EINTW() to take an explicit
>   .eint_fltcon_offset parameter.
> - Updates pin-bank tables with the correct FLTCON offsets for:
>   Exynos2200 (ALIVE/CMGP/HSI1/UFS/HSI1UFS/PERIC0/1/2/VTS),
>   Exynos7870 (ALIVE/DISPAUD/ESE/FSYS/MIF/NFC/TOP/TOUCH),
>   Exynos7885 (ALIVE/DISPAUD/FSYS/TOP),
>   Exynos850  (ALIVE/CMGP/AUD/HSI/CORE/PERI),
>   Exynos990  (ALIVE/CMGP/HSI1/HSI2/PERIC0/1/VTS),
>   Exynos9810 (ALIVE/AUD/CHUB/CMGP/FSYS0/FSYS1/PERIC0/1/VTS),
>   ExynosAuto v9 (ALIVE/AUD/FSYS0/1/2/PERIC0/1),
>   Exynos8890 (ALIVE/AUD/CCORE/ESE/FP/FSYS0/1/NFC/PERIC0/1/TOUCH),
>   Exynos8895 (ALIVE/ABOX/VTS/FSYS0/1/BUSC/PERIC0/1),
>   and FSD (FSYS/PERIC).
>
> Notes:
> - GS101 already programs per-bank filter control registers. This change
>   aligns the Exynos9 path with that model.
> - Banks without filters (EINTN) are unaffected.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>

If this patch actually fixes some incorrect behavior, suggest adding
the "Fixes:" tag.

> ---

Just noticed that linux-kernel mailing list is not present in your To:
and Cc:. For future, please make sure to use the
scripts/get_maintainer.pl output for submission, or use 'b4 prep
--auto-to-cc' if you're using 'b4' tool. This goes for the whole
series.

The patch itself looks good to me (spotted only some minor style issues):

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../pinctrl/saexynos2200_pin_banks5[]msung/pinctrl-exynos-arm64.c    | 7=
44 +++++++++---------
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  30 +-
>  2 files changed, 388 insertions(+), 386 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index 6e874ce40ff5..d4b2e9f8baef 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -90,11 +90,11 @@ static atomic_t exynos_shared_retention_refcnt;
>
>  /* pin banks of exynos2200 pin-controller - ALIVE */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x20, "gpa1", =
0x04),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", =
0x08),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", =
0x0c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", =
0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0=
x00, 0x00),

As mentioned in comments for the previous patches, please try to limit
the lines to 80 characters max when possible.

> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x20, "gpa1", =
0x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", =
0x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", =
0x0c, 0x18),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", =
0x10, 0x20),
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 4, 0xa0, "gpq0"),
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xc0, "gpq1"),
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xe0, "gpq2"),
> @@ -102,90 +102,90 @@ static const struct samsung_pin_bank_data exynos220=
0_pin_banks0[] __initconst =3D
>
>  /* pin banks of exynos2200 pin-controller - CMGP */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks1[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0, "gpm0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x20, "gpm1", =
0x04),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x40, "gpm2", =
0x08),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x60, "gpm3", =
0x0c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpm4", =
0x10),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xa0, "gpm5", =
0x14),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xc0, "gpm6", =
0x18),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xe0, "gpm7", =
0x1c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x100, "gpm8",=
 0x20),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x120, "gpm9",=
 0x24),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x140, "gpm10"=
, 0x28),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x160, "gpm11"=
, 0x2c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x180, "gpm12"=
, 0x30),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x1a0, "gpm13"=
, 0x34),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm14"=
, 0x38),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm15"=
, 0x3c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16"=
, 0x40),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17"=
, 0x44),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm20"=
, 0x48),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm21"=
, 0x4c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm22"=
, 0x50),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2a0, "gpm23"=
, 0x54),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2c0, "gpm24"=
, 0x58),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0, "gpm0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x20, "gpm1", =
0x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x40, "gpm2", =
0x08, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x60, "gpm3", =
0x0c, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpm4", =
0x10, 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xa0, "gpm5", =
0x14, 0x14),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xc0, "gpm6", =
0x18, 0x18),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xe0, "gpm7", =
0x1c, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x100, "gpm8",=
 0x20, 0x20),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x120, "gpm9",=
 0x24, 0x24),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x140, "gpm10"=
, 0x28, 0x28),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x160, "gpm11"=
, 0x2c, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x180, "gpm12"=
, 0x30, 0x30),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x1a0, "gpm13"=
, 0x34, 0x34),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm14"=
, 0x38, 0x38),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm15"=
, 0x3c, 0x3c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16"=
, 0x40, 0x40),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17"=
, 0x44, 0x44),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm20"=
, 0x48, 0x48),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm21"=
, 0x4c, 0x4c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm22"=
, 0x50, 0x50),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2a0, "gpm23"=
, 0x54, 0x54),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2c0, "gpm24"=
, 0x58, 0x58),
>  };
>
>  /* pin banks of exynos2200 pin-controller - HSI1 */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks2[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpf0", 0x0=
0),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpf0", 0x0=
0, 0x00),
>  };
>
>  /* pin banks of exynos2200 pin-controller - UFS */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks3[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpf1", 0x0=
0),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpf1", 0x0=
0, 0x00),
>  };
>
>  /* pin banks of exynos2200 pin-controller - HSI1UFS */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks4[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0, "gpf2", 0x0=
0),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0, "gpf2", 0x0=
0, 0x00),
>  };
>
>  /* pin banks of exynos2200 pin-controller - PERIC0 */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks5[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpb0",  0x=
00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpb1",  0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpb2",  0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpb3",  0=
x0c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp4",  0=
x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xa0, "gpc0",  0=
x14),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xc0, "gpc1",  0=
x18),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc2",  0=
x1c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x100, "gpg1",  =
0x20),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpg2",  =
0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpb0",  0x=
00, 0x00),

Style: spotted double spaces (here and below). I know it was already
like that, but why not make it pretty while at it :)

> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpb1",  0=
x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpb2",  0=
x08, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpb3",  0=
x0c, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp4",  0=
x10, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xa0, "gpc0",  0=
x14, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xc0, "gpc1",  0=
x18, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc2",  0=
x1c, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x100, "gpg1",  =
0x20, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpg2",  =
0x24, 0x24),
>  };
>
>  /* pin banks of exynos2200 pin-controller - PERIC1 */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks6[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0,  "gpp7",  0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp8",  0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp9",  0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp10", 0=
x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0,  "gpp7",  0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp8",  0=
x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp9",  0=
x08, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp10", 0=
x0c, 0x0c),
>  };
>
>  /* pin banks of exynos2200 pin-controller - PERIC2 */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks7[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpp0",  0x=
00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp1",  0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp2",  0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp3",  0=
x0c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp5",  0=
x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xa0, "gpp6",  0=
x14),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xc0, "gpp11", 0=
x18),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc3",  0=
x1c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpc4",  =
0x20),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpc5",  =
0x24),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x140, "gpc6",  =
0x28),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x160, "gpc7",  =
0x2c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x180, "gpc8",  =
0x30),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpc9",  =
0x34),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x1c0, "gpg0",  =
0x38),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpp0",  0x=
00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp1",  0=
x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp2",  0=
x08, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp3",  0=
x0c, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp5",  0=
x10, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xa0, "gpp6",  0=
x14, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xc0, "gpp11", 0=
x18, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc3",  0=
x1c, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpc4",  =
0x20, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpc5",  =
0x24, 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x140, "gpc6",  =
0x28, 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x160, "gpc7",  =
0x2c, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x180, "gpc8",  =
0x30, 0x30),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpc9",  =
0x34, 0x34),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x1c0, "gpg0",  =
0x38, 0x38),
>  };
>
>  /* pin banks of exynos2200 pin-controller - VTS */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks8[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpv0", 0x0=
0),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpv0", 0x0=
0, 0x00),
>  };
>
>  static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] =3D {
> @@ -640,68 +640,68 @@ const struct samsung_pinctrl_of_match_data exynos7_=
of_data __initconst =3D {
>  static const struct samsung_pin_bank_data exynos7870_pin_banks0[] __init=
const =3D {
>         EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 6, 0x000, "etc=
0"),
>         EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 3, 0x020, "etc=
1"),
> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa=
0", 0x00),
> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa=
1", 0x04),
> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x080, "gpa=
2", 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa=
0", 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa=
1", 0x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x080, "gpa=
2", 0x08, 0x10),
>         EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 2, 0x0c0, "gpq=
0"),
>  };
>
>  /* pin banks of exynos7870 pin-controller 1 (DISPAUD) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks1[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpz0"=
, 0x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x020, "gpz1"=
, 0x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpz2"=
, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpz0"=
, 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x020, "gpz1"=
, 0x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpz2"=
, 0x08, 0x0c),
>  };
>
>  /* pin banks of exynos7870 pin-controller 2 (ESE) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks2[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpc7"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpc7"=
, 0x00, 0x00),
>  };
>
>  /* pin banks of exynos7870 pin-controller 3 (FSYS) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks3[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpr0"=
, 0x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpr1"=
, 0x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x040, "gpr2"=
, 0x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpr3"=
, 0x0c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x080, "gpr4"=
, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpr0"=
, 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpr1"=
, 0x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x040, "gpr2"=
, 0x08, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpr3"=
, 0x0c, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x080, "gpr4"=
, 0x10, 0x14),
>  };
>
>  /* pin banks of exynos7870 pin-controller 4 (MIF) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks4[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "gpm0"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "gpm0"=
, 0x00, 0x00),
>  };
>
>  /* pin banks of exynos7870 pin-controller 5 (NFC) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks5[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpc2"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpc2"=
, 0x00, 0x00),
>  };
>
>  /* pin banks of exynos7870 pin-controller 6 (TOP) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks6[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpb0"=
, 0x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x020, "gpc0"=
, 0x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpc1"=
, 0x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpc4"=
, 0x0c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpc5"=
, 0x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x0a0, "gpc6"=
, 0x14),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpc8"=
, 0x18),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0e0, "gpc9"=
, 0x1c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x100, "gpd1"=
, 0x20),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x120, "gpd2"=
, 0x24),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x140, "gpd3"=
, 0x28),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x160, "gpd4"=
, 0x2c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x1a0, "gpe0"=
, 0x34),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x1c0, "gpf0"=
, 0x38),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x1e0, "gpf1"=
, 0x3c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x200, "gpf2"=
, 0x40),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x220, "gpf3"=
, 0x44),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x240, "gpf4"=
, 0x48),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpb0"=
, 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x020, "gpc0"=
, 0x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpc1"=
, 0x08, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpc4"=
, 0x0c, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpc5"=
, 0x10, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x0a0, "gpc6"=
, 0x14, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpc8"=
, 0x18, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0e0, "gpc9"=
, 0x1c, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x100, "gpd1"=
, 0x20, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x120, "gpd2"=
, 0x24, 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x140, "gpd3"=
, 0x28, 0x30),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x160, "gpd4"=
, 0x2c, 0x38),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x1a0, "gpe0"=
, 0x34, 0x48),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x1c0, "gpf0"=
, 0x38, 0x4c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x1e0, "gpf1"=
, 0x3c, 0x50),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x200, "gpf2"=
, 0x40, 0x54),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x220, "gpf3"=
, 0x44, 0x58),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x240, "gpf4"=
, 0x48, 0x5c),
>  };
>
>  /* pin banks of exynos7870 pin-controller 7 (TOUCH) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks7[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpc3"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpc3"=
, 0x00, 0x00),
>  };
>
>  static const struct samsung_pin_ctrl exynos7870_pin_ctrl[] __initconst =
=3D {
> @@ -770,46 +770,46 @@ const struct samsung_pinctrl_of_match_data exynos78=
70_of_data __initconst =3D {
>  static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __init=
const =3D {
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x000, "etc0")=
,
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x020, "etc1")=
,
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0",=
 0x00),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1",=
 0x04),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2",=
 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0",=
 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1",=
 0x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2",=
 0x08, 0x10),
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 5, 0x0a0, "gpq0")=
,
>  };
>
>  /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
>  static const struct samsung_pin_bank_data exynos7885_pin_banks1[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x020, "gpb1", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x040, "gpb2", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x020, "gpb1", 0=
x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x040, "gpb2", 0=
x08, 0x0c),
>  };
>
>  /* pin banks of exynos7885 pin-controller 2 (FSYS) */
>  static const struct samsung_pin_bank_data exynos7885_pin_banks2[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf2", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x040, "gpf3", 0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x060, "gpf4", 0=
x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf2", 0=
x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x040, "gpf3", 0=
x08, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x060, "gpf4", 0=
x0c, 0x14),
>  };
>
>  /* pin banks of exynos7885 pin-controller 3 (TOP) */
>  static const struct samsung_pin_bank_data exynos7885_pin_banks3[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpp0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x020, "gpg0", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0=
x0c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x080, "gpp3", 0=
x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0a0, "gpp4", 0=
x14),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0c0, "gpp5", 0=
x18),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x0e0, "gpp6", 0=
x1c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpp7", 0=
x20),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpp8", 0=
x24),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x140, "gpg1", 0=
x28),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x160, "gpg2", 0=
x2c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x180, "gpg3", 0=
x30),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpg4", 0=
x34),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x1c0, "gpc0", 0=
x38),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpc1", 0=
x3c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpc2", 0=
x40),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpp0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x020, "gpg0", 0=
x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0=
x08, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0=
x0c, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x080, "gpp3", 0=
x10, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0a0, "gpp4", 0=
x14, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0c0, "gpp5", 0=
x18, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x0e0, "gpp6", 0=
x1c, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpp7", 0=
x20, 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpp8", 0=
x24, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x140, "gpg1", 0=
x28, 0x30),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x160, "gpg2", 0=
x2c, 0x38),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x180, "gpg3", 0=
x30, 0x40),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpg4", 0=
x34, 0x48),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x1c0, "gpc0", 0=
x38, 0x4c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpc1", 0=
x3c, 0x50),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpc2", 0=
x40, 0x58),
>  };
>
>  static const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst =
=3D {
> @@ -850,59 +850,59 @@ const struct samsung_pinctrl_of_match_data exynos78=
85_of_data __initconst =3D {
>  /* pin banks of exynos850 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynos850_pin_banks0[] __initc=
onst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0",=
 0x00),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1",=
 0x04),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2",=
 0x08),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3",=
 0x0c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x080, "gpa4",=
 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0",=
 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1",=
 0x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2",=
 0x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3",=
 0x0c, 0x18),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x080, "gpa4",=
 0x10, 0x20),
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x0a0, "gpq0")=
,
>  };
>
>  /* pin banks of exynos850 pin-controller 1 (CMGP) */
>  static const struct samsung_pin_bank_data exynos850_pin_banks1[] __initc=
onst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0",=
 0x00),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1",=
 0x04),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2",=
 0x08),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3",=
 0x0c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4",=
 0x10),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5",=
 0x14),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6",=
 0x18),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7",=
 0x1c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0",=
 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1",=
 0x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2",=
 0x08, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3",=
 0x0c, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4",=
 0x10, 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5",=
 0x14, 0x14),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6",=
 0x18, 0x18),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7",=
 0x1c, 0x1c),
>  };
>
>  /* pin banks of exynos850 pin-controller 2 (AUD) */
>  static const struct samsung_pin_bank_data exynos850_pin_banks2[] __initc=
onst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gpb1", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gpb1", 0=
x04, 0x08),
>  };
>
>  /* pin banks of exynos850 pin-controller 3 (HSI) */
>  static const struct samsung_pin_bank_data exynos850_pin_banks3[] __initc=
onst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf2", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf2", 0=
x00, 0x00),
>  };
>
>  /* pin banks of exynos850 pin-controller 4 (CORE) */
>  static const struct samsung_pin_bank_data exynos850_pin_banks4[] __initc=
onst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf1", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf1", 0=
x04, 0x04),
>  };
>
>  /* pin banks of exynos850 pin-controller 5 (PERI) */
>  static const struct samsung_pin_bank_data exynos850_pin_banks5[] __initc=
onst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpg0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpp0", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0=
x0c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg1", 0=
x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpg2", 0=
x14),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 1, 0x0c0, "gpg3", 0=
x18),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x0e0, "gpc0", 0=
x1c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x100, "gpc1", 0=
x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpg0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpp0", 0=
x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0=
x08, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0=
x0c, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg1", 0=
x10, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpg2", 0=
x14, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 1, 0x0c0, "gpg3", 0=
x18, 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x0e0, "gpc0", 0=
x1c, 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x100, "gpc1", 0=
x20, 0x2c),
>  };
>
>  static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst =
=3D {
> @@ -946,11 +946,11 @@ const struct samsung_pinctrl_of_match_data exynos85=
0_of_data __initconst =3D {
>  /* pin banks of exynos990 pin-controller 0 (ALIVE) */
>  static struct samsung_pin_bank_data exynos990_pin_banks0[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0",=
 0x00),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1",=
 0x04),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2",=
 0x08),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3",=
 0x0c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x080, "gpa4",=
 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0",=
 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1",=
 0x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2",=
 0x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3",=
 0x0c, 0x18),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x080, "gpa4",=
 0x10, 0x20),
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 7, 0x0A0, "gpq0")=
,
>  };
>
> @@ -961,82 +961,82 @@ static struct samsung_pin_bank_data exynos990_pin_b=
anks1[] =3D {
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x020, "gpm1")=
,
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x040, "gpm2")=
,
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x060, "gpm3")=
,
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4",=
 0x00),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0A0, "gpm5",=
 0x04),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0C0, "gpm6",=
 0x08),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0E0, "gpm7",=
 0x0c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm8",=
 0x10),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm9",=
 0x14),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm10"=
, 0x18),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm11"=
, 0x1c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm12"=
, 0x20),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1A0, "gpm13"=
, 0x24),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1C0, "gpm14"=
, 0x28),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1E0, "gpm15"=
, 0x2c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16"=
, 0x30),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17"=
, 0x34),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm18"=
, 0x38),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm19"=
, 0x3c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm20"=
, 0x40),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2A0, "gpm21"=
, 0x44),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2C0, "gpm22"=
, 0x48),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2E0, "gpm23"=
, 0x4c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x300, "gpm24"=
, 0x50),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x320, "gpm25"=
, 0x54),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x340, "gpm26"=
, 0x58),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x360, "gpm27"=
, 0x5c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x380, "gpm28"=
, 0x60),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3A0, "gpm29"=
, 0x64),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3C0, "gpm30"=
, 0x68),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3E0, "gpm31"=
, 0x6c),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x400, "gpm32"=
, 0x70),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x420, "gpm33"=
, 0x74),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4",=
 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0A0, "gpm5",=
 0x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0C0, "gpm6",=
 0x08, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0E0, "gpm7",=
 0x0c, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm8",=
 0x10, 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm9",=
 0x14, 0x14),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm10"=
, 0x18, 0x18),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm11"=
, 0x1c, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm12"=
, 0x20, 0x20),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1A0, "gpm13"=
, 0x24, 0x24),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1C0, "gpm14"=
, 0x28, 0x28),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1E0, "gpm15"=
, 0x2c, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16"=
, 0x30, 0x30),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17"=
, 0x34, 0x34),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm18"=
, 0x38, 0x38),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm19"=
, 0x3c, 0x3c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm20"=
, 0x40, 0x40),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2A0, "gpm21"=
, 0x44, 0x44),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2C0, "gpm22"=
, 0x48, 0x48),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2E0, "gpm23"=
, 0x4c, 0x4c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x300, "gpm24"=
, 0x50, 0x50),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x320, "gpm25"=
, 0x54, 0x54),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x340, "gpm26"=
, 0x58, 0x58),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x360, "gpm27"=
, 0x5c, 0x5c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x380, "gpm28"=
, 0x60, 0x60),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3A0, "gpm29"=
, 0x64, 0x64),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3C0, "gpm30"=
, 0x68, 0x68),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3E0, "gpm31"=
, 0x6c, 0x6c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x400, "gpm32"=
, 0x70, 0x70),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x420, "gpm33"=
, 0x74, 0x74),
>  };
>
>  /* pin banks of exynos990 pin-controller 2 (HSI1) */
>  static struct samsung_pin_bank_data exynos990_pin_banks2[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x040, "gpf2", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0=
x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x040, "gpf2", 0=
x08, 0x0c),
>  };
>
>  /* pin banks of exynos990 pin-controller 3 (HSI2) */
>  static struct samsung_pin_bank_data exynos990_pin_banks3[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf3", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf3", 0=
x00, 0x00),
>  };
>
>  /* pin banks of exynos990 pin-controller 4 (PERIC0) */
>  static struct samsung_pin_bank_data exynos990_pin_banks4[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp3", 0=
x0C),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp4", 0=
x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0A0, "gpg0", 0=
x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0=
x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0=
x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp3", 0=
x0C, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp4", 0=
x10, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0A0, "gpg0", 0=
x14, 0x28),
>  };
>
>  /* pin banks of exynos990 pin-controller 5 (PERIC1) */
>  static struct samsung_pin_bank_data exynos990_pin_banks5[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp5", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp6", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp7", 0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp8", 0=
x0C),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp9", 0=
x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0A0, "gpc0", 0=
x14),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0C0, "gpg1", 0=
x18),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0E0, "gpb0", 0=
x1C),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb1", 0=
x20),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb2", 0=
x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp5", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp6", 0=
x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp7", 0=
x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp8", 0=
x0C, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp9", 0=
x10, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0A0, "gpc0", 0=
x14, 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0C0, "gpg1", 0=
x18, 0x30),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0E0, "gpb0", 0=
x1C, 0x34),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb1", 0=
x20, 0x3c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb2", 0=
x24, 0x44),
>  };
>
>  /* pin banks of exynos990 pin-controller 6 (VTS) */
>  static struct samsung_pin_bank_data exynos990_pin_banks6[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpv0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpv0", 0=
x00, 0x00),
>  };
>
>  static const struct samsung_pin_ctrl exynos990_pin_ctrl[] __initconst =
=3D {
> @@ -1085,87 +1085,87 @@ const struct samsung_pinctrl_of_match_data exynos=
990_of_data __initconst =3D {
>  /* pin banks of exynos9810 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks0[] __init=
const =3D {
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 6, 0x000, "etc1")=
,
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa0",=
 0x00),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa1",=
 0x04),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa2",=
 0x08),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa3",=
 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa0",=
 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa1",=
 0x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa2",=
 0x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa3",=
 0x0c, 0x18),
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 6, 0x0A0, "gpq0")=
,
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0C0, "gpa4",=
 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0C0, "gpa4",=
 0x10, 0x20),
>  };
>
>  /* pin banks of exynos9810 pin-controller 1 (AUD) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks1[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpb2", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0=
x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpb2", 0=
x08, 0x10),
>  };
>
>  /* pin banks of exynos9810 pin-controller 2 (CHUB) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks2[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gph0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gph1", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gph0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gph1", 0=
x04, 0x08),
>  };
>
>  /* pin banks of exynos9810 pin-controller 3 (CMGP) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks3[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0",=
 0x00),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1",=
 0x04),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2",=
 0x08),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3",=
 0x0C),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4",=
 0x10),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0A0, "gpm5",=
 0x14),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0C0, "gpm6",=
 0x18),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0E0, "gpm7",=
 0x1C),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm10"=
, 0x20),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm11"=
, 0x24),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm12"=
, 0x28),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm13"=
, 0x2C),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm14"=
, 0x30),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1A0, "gpm15"=
, 0x34),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1C0, "gpm16"=
, 0x38),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1E0, "gpm17"=
, 0x3C),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm40"=
, 0x40),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm41"=
, 0x44),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm42"=
, 0x48),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm43"=
, 0x4C),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0",=
 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1",=
 0x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2",=
 0x08, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3",=
 0x0C, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4",=
 0x10, 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0A0, "gpm5",=
 0x14, 0x14),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0C0, "gpm6",=
 0x18, 0x18),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0E0, "gpm7",=
 0x1C, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm10"=
, 0x20, 0x20),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm11"=
, 0x24, 0x24),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm12"=
, 0x28, 0x28),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm13"=
, 0x2C, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm14"=
, 0x30, 0x30),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1A0, "gpm15"=
, 0x34, 0x34),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1C0, "gpm16"=
, 0x38, 0x38),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1E0, "gpm17"=
, 0x3C, 0x3c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm40"=
, 0x40, 0x40),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm41"=
, 0x44, 0x44),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm42"=
, 0x48, 0x48),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm43"=
, 0x4C, 0x4c),
>  };
>
>  /* pin banks of exynos9810 pin-controller 4 (FSYS0) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks4[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf0", 0=
x00, 0x00),
>  };
>
>  /* pin banks of exynos9810 pin-controller 5 (FSYS1) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks5[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpf1", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf2", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpf1", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf2", 0=
x04, 0x08),
>  };
>
>  /* pin banks of exynos9810 pin-controller 6 (PERIC0) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks6[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp3", 0=
x0C),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg0", 0=
x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0A0, "gpg1", 0=
x14),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0C0, "gpg2", 0=
x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0=
x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0=
x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp3", 0=
x0C, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg0", 0=
x10, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0A0, "gpg1", 0=
x14, 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0C0, "gpg2", 0=
x18, 0x2c),
>  };
>
>  /* pin banks of exynos9810 pin-controller 7 (PERIC1) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks7[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp4", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp5", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp6", 0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpc0", 0=
x0C),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpc1", 0=
x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0A0, "gpd0", 0=
x14),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0C0, "gpg3", 0=
x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp4", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp5", 0=
x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp6", 0=
x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpc0", 0=
x0C, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpc1", 0=
x10, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0A0, "gpd0", 0=
x14, 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0C0, "gpg3", 0=
x18, 0x28),
>  };
>
>  /* pin banks of exynos9810 pin-controller 8 (VTS) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks8[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x000, "gpt0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x000, "gpt0", 0=
x00, 0x00),
>  };
>
>  static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst =
=3D {
> @@ -1238,55 +1238,55 @@ const struct samsung_pinctrl_of_match_data exynos=
9810_of_data __initconst =3D {
>
>  /* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks0[] __in=
itconst =3D {
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0",=
 0x00),
> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x020, "gpa1",=
 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0",=
 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x020, "gpa1",=
 0x04, 0x08),
>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0x040, "gpq0")=
,
>  };
>
>  /* pin banks of exynosautov9 pin-controller 1 (AUD) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks1[] __in=
itconst =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpb2", 0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpb3", 0=
x0C),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0=
x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpb2", 0=
x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpb3", 0=
x0C, 0x18),
>  };
>
>  /* pin banks of exynosautov9 pin-controller 2 (FSYS0) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks2[] __in=
itconst =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0=
x04, 0x08),
>  };
>
>  /* pin banks of exynosautov9 pin-controller 3 (FSYS1) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks3[] __in=
itconst =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf8", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf8", 0=
x00, 0x00),
>  };
>
>  /* pin banks of exynosautov9 pin-controller 4 (FSYS2) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks4[] __in=
itconst =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf2", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf3", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x040, "gpf4", 0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpf5", 0=
x0C),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x080, "gpf6", 0=
x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf2", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf3", 0=
x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x040, "gpf4", 0=
x08, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpf5", 0=
x0C, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x080, "gpf6", 0=
x10, 0x1c),
>  };
>
>  /* pin banks of exynosautov9 pin-controller 5 (PERIC0) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks5[] __in=
itconst =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x060, "gpg0", 0=
x0C),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0=
x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0=
x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x060, "gpg0", 0=
x0C, 0x18),
>  };
>
>  /* pin banks of exynosautov9 pin-controller 6 (PERIC1) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks6[] __in=
itconst =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp3", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp4", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp5", 0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpg1", 0=
x0C),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg2", 0=
x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0A0, "gpg3", 0=
x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp3", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp4", 0=
x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp5", 0=
x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpg1", 0=
x0C, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg2", 0=
x10, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0A0, "gpg3", 0=
x14, 0x28),
>  };
>
>  static const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] __initconst=
 =3D {
> @@ -1487,16 +1487,16 @@ const struct samsung_pinctrl_of_match_data exynos=
autov920_of_data __initconst =3D
>  /* pin banks of exynos8890 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks0[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x000, "gpa=
0", 0x00),
> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x020, "gpa=
1", 0x04),
> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa=
2", 0x08),
> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa=
3", 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x000, "gpa=
0", 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x020, "gpa=
1", 0x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa=
2", 0x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa=
3", 0x0c, 0x18),
>  };
>
>  /* pin banks of exynos8890 pin-controller 1 (AUD) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gph0"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gph0"=
, 0x00, 0x00),
>  };
>
>  /* pin banks of exynos8890 pin-controller 2 (CCORE) */
> @@ -1508,73 +1508,73 @@ static const struct samsung_pin_bank_data exynos8=
890_pin_banks2[] __initconst =3D
>  /* pin banks of exynos8890 pin-controller 3 (ESE) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks3[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpf3"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpf3"=
, 0x00, 0x00),
>  };
>
>  /* pin banks of exynos8890 pin-controller 4 (FP) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpf2"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpf2"=
, 0x00, 0x00),
>  };
>
>  /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1"=
, 0x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2"=
, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1"=
, 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2"=
, 0x04, 0x04),
>  };
>
>  /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks6[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gpj0"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gpj0"=
, 0x00, 0x00),
>  };
>
>  /* pin banks of exynos8890 pin-controller 7 (NFC) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks7[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf0"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf0"=
, 0x00, 0x00),
>  };
>
>  /* pin banks of exynos8890 pin-controller 8 (PERIC0) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x000, "gpi0"=
, 0x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpd0"=
, 0x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1"=
, 0x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2"=
, 0x0c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3"=
, 0x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0A0, "gpb1"=
, 0x14),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0C0, "gpb2"=
, 0x18),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0E0, "gpb0"=
, 0x1c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0"=
, 0x20),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1"=
, 0x24),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2"=
, 0x28),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3"=
, 0x2c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0"=
, 0x30),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x000, "gpi0"=
, 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpd0"=
, 0x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1"=
, 0x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2"=
, 0x0c, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3"=
, 0x10, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0A0, "gpb1"=
, 0x14, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0C0, "gpb2"=
, 0x18, 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0E0, "gpb0"=
, 0x1c, 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0"=
, 0x20, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1"=
, 0x24, 0x34),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2"=
, 0x28, 0x3c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3"=
, 0x2c, 0x44),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0"=
, 0x30, 0x4c),
>         EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 7, 0x1A0, "etc1"=
),
>  };
>
>  /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x000, "gpe0"=
, 0x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpe5"=
, 0x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6"=
, 0x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1"=
, 0x0c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2"=
, 0x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0A0, "gpe2"=
, 0x14),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0C0, "gpe3"=
, 0x18),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0E0, "gpe4"=
, 0x1c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1"=
, 0x20),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7"=
, 0x24),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0"=
, 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x000, "gpe0"=
, 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpe5"=
, 0x04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6"=
, 0x08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1"=
, 0x0c, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2"=
, 0x10, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0A0, "gpe2"=
, 0x14, 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0C0, "gpe3"=
, 0x18, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0E0, "gpe4"=
, 0x1c, 0x34),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1"=
, 0x20, 0x3c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7"=
, 0x24, 0x44),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0"=
, 0x28, 0x48),
>  };
>
>  /* pin banks of exynos8890 pin-controller 10 (TOUCH) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks10[] __ini=
tconst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf1"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf1"=
, 0x00, 0x00),
>  };
>
>  static const struct samsung_pin_ctrl exynos8890_pin_ctrl[] __initconst =
=3D {
> @@ -1643,69 +1643,69 @@ const struct samsung_pinctrl_of_match_data exynos=
8890_of_data __initconst =3D {
>
>  /* pin banks of exynos8895 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x020, "gpa0", 0x00),
> -       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
> -       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
> -       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x020, "gpa0", 0x00, 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04, 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08, 0=
x10),
> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c, 0=
x18),
>         EXYNOS9_PIN_BANK_EINTN(bank_type_alive, 7, 0x0a0, "gpa4"),
>  };
>
>  /* pin banks of exynos8895 pin-controller 1 (ABOX) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks1[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gph0", 0x00),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gph1", 0x04),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gph3", 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gph0", 0x00, 0x0=
0),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gph1", 0x04, 0x0=
8),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gph3", 0x08, 0x1=
0),
>  };
>
>  /* pin banks of exynos8895 pin-controller 2 (VTS) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks2[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gph2", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gph2", 0x00, 0x0=
0),
>  };
>
>  /* pin banks of exynos8895 pin-controller 3 (FSYS0) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks3[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpi0"=
, 0x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi1"=
, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpi0"=
, 0x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi1"=
, 0x04, 0x04),
>  };
>
>  /* pin banks of exynos8895 pin-controller 4 (FSYS1) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks4[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpj1", 0x00),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gpj0", 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpj1", 0x00, 0x0=
0),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gpj0", 0x04, 0x0=
8),
>  };
>
>  /* pin banks of exynos8895 pin-controller 5 (BUSC) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks5[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x000, "gpb2", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x000, "gpb2", 0x00, 0x0=
0),
>  };
>
>  /* pin banks of exynos8895 pin-controller 6 (PERIC0) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks6[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpd0", 0x00),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x020, "gpd1", 0x04),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gpd2", 0x08),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x060, "gpd3", 0x0C),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x080, "gpb1", 0x10),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0a0, "gpe7", 0x14),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpf1", 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpd0", 0x00, 0x0=
0),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x020, "gpd1", 0x04, 0x0=
8),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gpd2", 0x08, 0x1=
0),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x060, "gpd3", 0x0C, 0x1=
4),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x080, "gpb1", 0x10, 0x1=
c),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0a0, "gpe7", 0x14, 0x2=
0),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpf1", 0x18, 0x2=
8),
>  };
>
>  /* pin banks of exynos8895 pin-controller 7 (PERIC1) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __init=
const =3D {
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0C),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1C),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2C),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30),
> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00, 0x0=
0),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04, 0x0=
4),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08, 0x0=
c),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0C, 0x1=
4),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10, 0x1=
c),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14, 0x2=
4),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18, 0x2=
8),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1C, 0x3=
0),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20, 0x3=
8),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24, 0x4=
0),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28, 0x4=
8),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2C, 0x5=
0),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30, 0x5=
4),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34, 0x5=
c),
>  };
>
>  static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst =
=3D {
> @@ -1776,36 +1776,36 @@ const struct samsung_pinctrl_of_match_data exynos=
8895_of_data __initconst =3D {
>
>  /* pin banks of FSD pin-controller 0 (FSYS) */
>  static const struct samsung_pin_bank_data fsd_pin_banks0[] __initconst =
=3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x00, "gpf0", 0x=
00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x20, "gpf1", 0x=
04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x40, "gpf6", 0x=
08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x60, "gpf4", 0x=
0c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x80, "gpf5", 0x=
10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x00, "gpf0", 0x=
00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x20, "gpf1", 0x=
04, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x40, "gpf6", 0x=
08, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x60, "gpf4", 0x=
0c, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x80, "gpf5", 0x=
10, 0x18),
>  };
>
>  /* pin banks of FSD pin-controller 1 (PERIC) */
>  static const struct samsung_pin_bank_data fsd_pin_banks1[] __initconst =
=3D {
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpc8", 0=
x00),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x020, "gpf2", 0=
x04),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpf3", 0=
x08),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpd0", 0=
x0c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpb0", 0=
x10),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpb1", 0=
x14),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0c0, "gpb4", 0=
x18),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0e0, "gpb5", 0=
x1c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb6", 0=
x20),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb7", 0=
x24),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x140, "gpd1", 0=
x28),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x160, "gpd2", 0=
x2c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x180, "gpd3", 0=
x30),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1a0, "gpg0", 0=
x34),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1c0, "gpg1", 0=
x38),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpg2", 0=
x3c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpg3", 0=
x40),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x220, "gpg4", 0=
x44),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x240, "gpg5", 0=
x48),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x260, "gpg6", 0=
x4c),
> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x280, "gpg7", 0=
x50),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpc8", 0=
x00, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x020, "gpf2", 0=
x04, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpf3", 0=
x08, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpd0", 0=
x0c, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpb0", 0=
x10, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpb1", 0=
x14, 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0c0, "gpb4", 0=
x18, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0e0, "gpb5", 0=
x1c, 0x34),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb6", 0=
x20, 0x38),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb7", 0=
x24, 0x40),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x140, "gpd1", 0=
x28, 0x48),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x160, "gpd2", 0=
x2c, 0x50),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x180, "gpd3", 0=
x30, 0x58),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1a0, "gpg0", 0=
x34, 0x60),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1c0, "gpg1", 0=
x38, 0x68),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpg2", 0=
x3c, 0x70),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpg3", 0=
x40, 0x78),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x220, "gpg4", 0=
x44, 0x80),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x240, "gpg5", 0=
x48, 0x88),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x260, "gpg6", 0=
x4c, 0x90),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x280, "gpg7", 0=
x50, 0x98),
>  };
>
>  /* pin banks of FSD pin-controller 2 (PMU) */
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index 536b01b4fd4a..c0f4639dbb0e 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -141,24 +141,26 @@
>                 .name           =3D id                            \
>         }
>
> -#define EXYNOS9_PIN_BANK_EINTG(types, pins, reg, id, offs)     \
> +#define EXYNOS9_PIN_BANK_EINTG(types, pins, reg, id, offs, fltcon_offs) =
       \

Here and further: please align all "\" characters to make a nice
vertical bar. That simplifies reading the code.

>         {                                                       \
> -               .type           =3D &types,                       \
> -               .pctl_offset    =3D reg,                          \
> -               .nr_pins        =3D pins,                         \
> -               .eint_type      =3D EINT_TYPE_GPIO,               \
> -               .eint_offset    =3D offs,                         \
> -               .name           =3D id                            \
> +               .type                   =3D &types,               \
> +               .pctl_offset            =3D reg,                  \
> +               .nr_pins                =3D pins,                 \
> +               .eint_type              =3D EINT_TYPE_GPIO,       \
> +               .eint_offset            =3D offs,                 \
> +               .eint_fltcon_offset     =3D fltcon_offs,          \
> +               .name                   =3D id                    \
>         }
>
> -#define EXYNOS9_PIN_BANK_EINTW(types, pins, reg, id, offs)     \
> +#define EXYNOS9_PIN_BANK_EINTW(types, pins, reg, id, offs, fltcon_offs) =
       \
>         {                                                       \
> -               .type           =3D &types,                       \
> -               .pctl_offset    =3D reg,                          \
> -               .nr_pins        =3D pins,                         \
> -               .eint_type      =3D EINT_TYPE_WKUP,               \
> -               .eint_offset    =3D offs,                         \
> -               .name           =3D id                            \
> +               .type                   =3D &types,               \
> +               .pctl_offset            =3D reg,                  \
> +               .nr_pins                =3D pins,                 \
> +               .eint_type              =3D EINT_TYPE_WKUP,       \
> +               .eint_offset            =3D offs,                 \
> +               .eint_fltcon_offset     =3D fltcon_offs,          \
> +               .name                   =3D id                    \
>         }
>
>  #define EXYNOSV920_PIN_BANK_EINTG(pins, reg, id, con_offs, mask_offs, pe=
nd_offs)       \
> --
> 2.39.2
>
