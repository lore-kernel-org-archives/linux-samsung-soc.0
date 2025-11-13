Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843620C029
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 01:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762996363; cv=none; b=lpz5/Ml9so+MZIYzXfHoktZa54yKpqZh/cVHwk4cjWdg6fMibSQo38wH/uSZCYOEvYSywAYrOKrfK16MVrNZJze7r7DrdgScUtvCSWnLdJfTPe8Cx0WyB9nfSOXXObm9cBRBgrWVUFmEdEZps4rkzAbZQKKd1dFjWusLeaea020=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762996363; c=relaxed/simple;
	bh=Y8Wp0+51eGjMpieNfgifQKA0SNc0ivu/Zv9iOF6I+lU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f60w+zxcNLX/WcbrmCuOVqbJvA9rOVxja6pHG9GGPrw1okPNMk/Zb2wHpmJFURF8O6nUnlTzUdAIscTe1lsMdY7ZBmOiEKctNgzC1BygWih6DahGo8xUxJBuLARmZx/KdsKQnyZpvOMnFS4PZvMMN02v1TzR0N4blU29N7jOqO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+LK1Dev; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+LK1Dev"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78817f3af10so2998967b3.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 17:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762996355; x=1763601155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnAQZORedOYZCyk3Rk46D/rovJhog70DUTKqea/mrNU=;
        b=e+LK1DevRQ5cMtoAtMeSUJtmFtJX6EP4TLJXJ8bOUZNFuB0AxIe1A3QLZXMdfs2b7J
         nJEPqU6INtAg312cS/U05y6IaOU9TicceICj0fF7MuZZVlEsh8rVZDpwyJHAD46oxJV4
         q65HnXZ1+AhyicPLBxr7y5UfiZBrEYNxBK7C7h09S0Ve/u4E9eqKLnIfbN6iA/d4SGyX
         JGp/rpwleBCyVqds6EhvpzqMdWxV/qPaNaoPjhW36hXhigaHsrrPt3NGRn6PCez1S3FK
         TMmy7YUsfnZ2wiVYrXvCPOX5ZTcKfmvvoRpQWnaMIuOsXJP7nSegXU8oSjjb29lsHsmT
         uahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762996355; x=1763601155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pnAQZORedOYZCyk3Rk46D/rovJhog70DUTKqea/mrNU=;
        b=JQdCCS/PoKCZ+vo7+ap3Cf8SUO3zm8LjcOYN3IWZN1q6oEaZdAhvN8HhLIzT7g72vK
         haUhOfJ/7pUzjdEgP2jtiwhk0hefma32bJyXCh2u4VRFmX4jH+1FER6K+KGU8qkRln8h
         mnT3hGTT1dJ5pt8RU3kQwlXzqrP8SHuEGkzMJvTBEXGEalskzyF16dvYvDoFxlHnkoz7
         ++o7fmqo4Gi8HLiP59sfszQphJPRno8VUhX2UijHoUAl6sE0iHANU53CAY6pkvYfVwYD
         v1xAuTruLx9oO8/yMiVVPfedVGr2wmTGkrJSIP22kdKHBq2CfAmKiZI7ItyImp0hkG0a
         UgXA==
X-Forwarded-Encrypted: i=1; AJvYcCV+C6JSN3IwMeYY2uVQ0h9hm/tSyDxy+gLV0jGiR7ZTLzgfoxySndFVmoz/NXHQXtA6ru8CzWUO0Gn4FSekGiwbPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GpkhOmJBEeh2dm2ipEmhuzkhCFQ+3GM4R6wkoSQRPe8Mk3V6
	5mNU8Z1IqDWsy9ZV9GnjQAK4ymS2B7KWCsTMLFKojOQy21uD2nhGzEApe1iqGq5cslithGz4LIo
	Jr7N3+TMwUeuVQfkfoZ0gpG+su+9J+pRDmXh4geEEUw==
X-Gm-Gg: ASbGncs0p/tOBwAd20ZS8Vs6znmE1xDLy1PtViKsRzRf+RaVC0O6ChilVpLgX0Ayb1+
	iIRV+1bz+ayfkHYb9Ko+Hosh4+M+K3wcmsu7fMDNsuZa6FScG3+NObx8MY2FVRFqsLZwJURiKJ/
	yVYgLDHThO1tBaFD5CJCiVctyLzE3OLfa0X9Il5X67cIdkOND6C0fiLecxInPBj7PbBmdrMJSWI
	MoVDKPNp74eXkqgX0uJRW62OBo0gorX2uP5OhYEanCt07QM+FCBQgQc0ZzHw4oUV3NvJtQ4VY2j
	vhK7PRIqlc92jgcptJpbP4GWtHBQgQ==
X-Google-Smtp-Source: AGHT+IFnILiMubnTx/pnTRMVTQJLpQ7FTBBlE9RsrpOw/C3qCtRgekAn7Dk7RgmqSXkUz5NmpsE0CCfwvF6hiTKMGsU=
X-Received: by 2002:a05:690c:a742:b0:784:a232:b3d9 with SMTP id
 00721157ae682-78813621726mr38505827b3.18.1762996354799; Wed, 12 Nov 2025
 17:12:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251110082138epcas2p3ef6274056af49f2619030c766412b36d@epcas2p3.samsung.com>
 <20251110082649.3109858-1-youngmin.nam@samsung.com> <20251110082649.3109858-2-youngmin.nam@samsung.com>
In-Reply-To: <20251110082649.3109858-2-youngmin.nam@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 12 Nov 2025 19:12:23 -0600
X-Gm-Features: AWmQ_blR7z6S4wOKu7n7QolDWd2VYxB0GkmxfNE2kuV5a8z8-t_Lxu5wDtMpr5E
Message-ID: <CAPLW+4k0EwTAn0LLunKsyCbL5SORCfF05HXACSxNKxNBSOsX7Q@mail.gmail.com>
Subject: Re: [RFT PATCH v1 1/5] pinctrl: samsung: Consolidate pin-bank macros
 under EXYNOS9_* and pass bank_type explicitly
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, peter.griffin@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:21=E2=80=AFAM Youngmin Nam <youngmin.nam@samsung.=
com> wrote:
>
> Modern Exynos platforms have several near-duplicate pin-bank macro
> families (EXYNOS850_*, EXYNOS8895_*, EXYNOS7870_*), which makes
> tables verbose and harder to share across SoCs that differ only by
> bank_type (alive/off) layout.
>
> This patch unifies them into one EXYNOS9_* macro family and makes the
> bank_type an explicit argument. The common 850-era bank types are also
> renamed to `exynos9_bank_type_{alive,off}` to reflect their reuse on
> later Exynos 9xxx=E2=80=93generation parts.
>
> Naming rationale:
> - Use of the EXYNOS9_* prefix indicates that these macros target
>   current Exynos generations sharing the same register layout and
>   EINT wiring model. Compared to SoC-specific prefixes
>   (EXYNOS850_*, EXYNOS8895_*),
>   EXYNOS9_* is clearer and more future-proof for modern parts.
>

Exynos9 sounds like a name for SoC generation or family to me. I
wonder if Samsung has some specific name for chips covered in this
series (i.e. modern ARM64 Exynos chips) internally, and if it's
actually Exynos9?

> Key changes:
> - Introduce:
>   - `EXYNOS9_PIN_BANK_EINTN(types, pins, reg, id)`
>   - `EXYNOS9_PIN_BANK_EINTG(types, pins, reg, id, offs)`
>   - `EXYNOS9_PIN_BANK_EINTW(types, pins, reg, id, offs)`

Suggestion: change "types" to "type", as it means "bank's type".

> - Rename:
>   - `exynos850_bank_type_alive` -> `exynos9_bank_type_alive`
>   - `exynos850_bank_type_off`   -> `exynos9_bank_type_off`
> - Convert pin-bank tables for:
>   - Exynos2200, 7870, 7885, 850, 990, 9810, 8890, 8895,
>     AutoV9, AutoV920, FSD
> - Update GS101/EXYNOSV920 helpers to reference `exynos9_bank_type_*`
>   instead of the old exynos850 names.
> - Standardize on EXYNOS9_* macros while keeping SoC-specific
>   `*_bank_type_*` when layouts differ (e.g., 7870/8895).
>
> No functional change intended.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> ---

Except for the minor comments below:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

I can tell a lot of tedious work went into this, and having reviewed
it to the best of my abilities, I didn't find any real errors. Tested
on E850-96.

>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 785 +++++++++---------
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  49 +-
>  2 files changed, 402 insertions(+), 432 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index 627dca504d7a..f8fbdd921d00 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -53,7 +53,7 @@ static const struct samsung_pin_bank_type exynos7870_ba=
nk_type_alive =3D {
>   * Bank type for non-alive type. Bit fields:
>   * CON: 4, DAT: 1, PUD: 4, DRV: 4, CONPDN: 2, PUDPDN: 4
>   */
> -static const struct samsung_pin_bank_type exynos850_bank_type_off  =3D {
> +static const struct samsung_pin_bank_type exynos9_bank_type_off  =3D {
>         .fld_width =3D { 4, 1, 4, 4, 2, 4, },
>         .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
>  };
> @@ -62,7 +62,7 @@ static const struct samsung_pin_bank_type exynos850_ban=
k_type_off  =3D {
>   * Bank type for alive type. Bit fields:
>   * CON: 4, DAT: 1, PUD: 4, DRV: 4
>   */
> -static const struct samsung_pin_bank_type exynos850_bank_type_alive =3D =
{
> +static const struct samsung_pin_bank_type exynos9_bank_type_alive =3D {
>         .fld_width =3D { 4, 1, 4, 4, },
>         .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, },
>  };
> @@ -90,11 +90,11 @@ static atomic_t exynos_shared_retention_refcnt;
>
>  /* pin banks of exynos2200 pin-controller - ALIVE */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x20, "gpa1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x40, "gpa2", 0x08),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x60, "gpa3", 0x0c),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x80, "gpa4", 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x20, "gpa1", =
0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", =
0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", =
0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", =
0x10),

For all patches in the series: please break the lines to not exceed 80
characters, as stated in the kernel coding style doc [1]. Not sure
what's the maintainers' stance on this nowadays, but I'd prefer this
for consistency and other reasons.

[1] https://www.kernel.org/doc/html/latest/process/coding-style.html#breaki=
ng-long-lines-and-strings

>         EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
>         EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
>         EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
> @@ -102,90 +102,90 @@ static const struct samsung_pin_bank_data exynos220=
0_pin_banks0[] __initconst =3D
>
>  /* pin banks of exynos2200 pin-controller - CMGP */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks1[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x0, "gpm0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x20, "gpm1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x40, "gpm2", 0x08),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x60, "gpm3", 0x0c),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x80, "gpm4", 0x10),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0xa0, "gpm5", 0x14),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0xc0, "gpm6", 0x18),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0xe0, "gpm7", 0x1c),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x100, "gpm8", 0x20),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x120, "gpm9", 0x24),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x140, "gpm10", 0x28),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x160, "gpm11", 0x2c),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x180, "gpm12", 0x30),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x1a0, "gpm13", 0x34),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x1c0, "gpm14", 0x38),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x1e0, "gpm15", 0x3c),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x40),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x44),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm20", 0x48),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm21", 0x4c),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm22", 0x50),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x2a0, "gpm23", 0x54),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x2c0, "gpm24", 0x58),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0, "gpm0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x20, "gpm1", =
0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x40, "gpm2", =
0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x60, "gpm3", =
0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpm4", =
0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xa0, "gpm5", =
0x14),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xc0, "gpm6", =
0x18),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xe0, "gpm7", =
0x1c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x100, "gpm8",=
 0x20),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x120, "gpm9",=
 0x24),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x140, "gpm10"=
, 0x28),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x160, "gpm11"=
, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x180, "gpm12"=
, 0x30),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x1a0, "gpm13"=
, 0x34),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm14"=
, 0x38),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm15"=
, 0x3c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16"=
, 0x40),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17"=
, 0x44),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm20"=
, 0x48),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm21"=
, 0x4c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm22"=
, 0x50),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2a0, "gpm23"=
, 0x54),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2c0, "gpm24"=
, 0x58),
>  };
>
>  /* pin banks of exynos2200 pin-controller - HSI1 */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks2[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x0, "gpf0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpf0", 0x0=
0),
>  };
>
>  /* pin banks of exynos2200 pin-controller - UFS */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks3[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(7, 0x0, "gpf1", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpf1", 0x0=
0),
>  };
>
>  /* pin banks of exynos2200 pin-controller - HSI1UFS */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks4[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gpf2", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0, "gpf2", 0x0=
0),
>  };
>
>  /* pin banks of exynos2200 pin-controller - PERIC0 */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks5[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x0, "gpb0",  0x00),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpb1",  0x04),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpb2",  0x08),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x60, "gpb3",  0x0c),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp4",  0x10),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0xa0, "gpc0",  0x14),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0xc0, "gpc1",  0x18),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpc2",  0x1c),
> -       EXYNOS850_PIN_BANK_EINTG(7, 0x100, "gpg1",  0x20),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpg2",  0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpb0",  0x=
00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpb1",  0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpb2",  0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpb3",  0=
x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp4",  0=
x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xa0, "gpc0",  0=
x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xc0, "gpc1",  0=
x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc2",  0=
x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x100, "gpg1",  =
0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpg2",  =
0x24),
>  };
>
>  /* pin banks of exynos2200 pin-controller - PERIC1 */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks6[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x0,  "gpp7",  0x00),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp8",  0x04),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp9",  0x08),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x60, "gpp10", 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0,  "gpp7",  0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp8",  0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp9",  0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp10", 0=
x0c),
>  };
>
>  /* pin banks of exynos2200 pin-controller - PERIC2 */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks7[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x0, "gpp0",  0x00),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp1",  0x04),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp2",  0x08),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x60, "gpp3",  0x0c),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp5",  0x10),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0xa0, "gpp6",  0x14),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0xc0, "gpp11", 0x18),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpc3",  0x1c),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x100, "gpc4",  0x20),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpc5",  0x24),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x140, "gpc6",  0x28),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x160, "gpc7",  0x2c),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x180, "gpc8",  0x30),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpc9",  0x34),
> -       EXYNOS850_PIN_BANK_EINTG(5, 0x1c0, "gpg0",  0x38),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpp0",  0x=
00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp1",  0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp2",  0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp3",  0=
x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp5",  0=
x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xa0, "gpp6",  0=
x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xc0, "gpp11", 0=
x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc3",  0=
x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpc4",  =
0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpc5",  =
0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x140, "gpc6",  =
0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x160, "gpc7",  =
0x2c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x180, "gpc8",  =
0x30),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpc9",  =
0x34),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x1c0, "gpg0",  =
0x38),
>  };
>
>  /* pin banks of exynos2200 pin-controller - VTS */
>  static const struct samsung_pin_bank_data exynos2200_pin_banks8[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(7, 0x0, "gpv0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpv0", 0x0=
0),
>  };
>
>  static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] =3D {
> @@ -638,70 +638,70 @@ const struct samsung_pinctrl_of_match_data exynos7_=
of_data __initconst =3D {
>
>  /* pin banks of exynos7870 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks0[] __init=
const =3D {
> -       EXYNOS7870_PIN_BANK_EINTN(6, 0x000, "etc0"),
> -       EXYNOS7870_PIN_BANK_EINTN(3, 0x020, "etc1"),
> -       EXYNOS7870_PIN_BANK_EINTW(8, 0x040, "gpa0", 0x00),
> -       EXYNOS7870_PIN_BANK_EINTW(8, 0x060, "gpa1", 0x04),
> -       EXYNOS7870_PIN_BANK_EINTW(8, 0x080, "gpa2", 0x08),
> -       EXYNOS7870_PIN_BANK_EINTN(2, 0x0c0, "gpq0"),
> +       EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 6, 0x000, "etc=
0"),
> +       EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 3, 0x020, "etc=
1"),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa=
0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa=
1", 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x080, "gpa=
2", 0x08),
> +       EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 2, 0x0c0, "gpq=
0"),
>  };
>
>  /* pin banks of exynos7870 pin-controller 1 (DISPAUD) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks1[] __init=
const =3D {
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpz0", 0x00),
> -       EXYNOS8895_PIN_BANK_EINTG(6, 0x020, "gpz1", 0x04),
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x040, "gpz2", 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpz0"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x020, "gpz1"=
, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpz2"=
, 0x08),
>  };
>
>  /* pin banks of exynos7870 pin-controller 2 (ESE) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks2[] __init=
const =3D {
> -       EXYNOS8895_PIN_BANK_EINTG(5, 0x000, "gpc7", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpc7"=
, 0x00),
>  };
>
>  /* pin banks of exynos7870 pin-controller 3 (FSYS) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks3[] __init=
const =3D {
> -       EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpr0", 0x00),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpr1", 0x04),
> -       EXYNOS8895_PIN_BANK_EINTG(2, 0x040, "gpr2", 0x08),
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x060, "gpr3", 0x0c),
> -       EXYNOS8895_PIN_BANK_EINTG(6, 0x080, "gpr4", 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpr0"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpr1"=
, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x040, "gpr2"=
, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpr3"=
, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x080, "gpr4"=
, 0x10),
>  };
>
>  /* pin banks of exynos7870 pin-controller 4 (MIF) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks4[] __init=
const =3D {
> -       EXYNOS8895_PIN_BANK_EINTG(2, 0x000, "gpm0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "gpm0"=
, 0x00),
>  };
>
>  /* pin banks of exynos7870 pin-controller 5 (NFC) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks5[] __init=
const =3D {
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpc2", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpc2"=
, 0x00),
>  };
>
>  /* pin banks of exynos7870 pin-controller 6 (TOP) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks6[] __init=
const =3D {
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpb0", 0x00),
> -       EXYNOS8895_PIN_BANK_EINTG(3, 0x020, "gpc0", 0x04),
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x040, "gpc1", 0x08),
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x060, "gpc4", 0x0c),
> -       EXYNOS8895_PIN_BANK_EINTG(2, 0x080, "gpc5", 0x10),
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x0a0, "gpc6", 0x14),
> -       EXYNOS8895_PIN_BANK_EINTG(2, 0x0c0, "gpc8", 0x18),
> -       EXYNOS8895_PIN_BANK_EINTG(2, 0x0e0, "gpc9", 0x1c),
> -       EXYNOS8895_PIN_BANK_EINTG(7, 0x100, "gpd1", 0x20),
> -       EXYNOS8895_PIN_BANK_EINTG(6, 0x120, "gpd2", 0x24),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x140, "gpd3", 0x28),
> -       EXYNOS8895_PIN_BANK_EINTG(7, 0x160, "gpd4", 0x2c),
> -       EXYNOS8895_PIN_BANK_EINTG(3, 0x1a0, "gpe0", 0x34),
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x1c0, "gpf0", 0x38),
> -       EXYNOS8895_PIN_BANK_EINTG(2, 0x1e0, "gpf1", 0x3c),
> -       EXYNOS8895_PIN_BANK_EINTG(2, 0x200, "gpf2", 0x40),
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x220, "gpf3", 0x44),
> -       EXYNOS8895_PIN_BANK_EINTG(5, 0x240, "gpf4", 0x48),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpb0"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x020, "gpc0"=
, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpc1"=
, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpc4"=
, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpc5"=
, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x0a0, "gpc6"=
, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpc8"=
, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0e0, "gpc9"=
, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x100, "gpd1"=
, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x120, "gpd2"=
, 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x140, "gpd3"=
, 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x160, "gpd4"=
, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x1a0, "gpe0"=
, 0x34),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x1c0, "gpf0"=
, 0x38),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x1e0, "gpf1"=
, 0x3c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x200, "gpf2"=
, 0x40),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x220, "gpf3"=
, 0x44),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x240, "gpf4"=
, 0x48),
>  };
>
>  /* pin banks of exynos7870 pin-controller 7 (TOUCH) */
>  static const struct samsung_pin_bank_data exynos7870_pin_banks7[] __init=
const =3D {
> -       EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpc3", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpc3"=
, 0x00),
>  };
>
>  static const struct samsung_pin_ctrl exynos7870_pin_ctrl[] __initconst =
=3D {
> @@ -770,46 +770,46 @@ const struct samsung_pinctrl_of_match_data exynos78=
70_of_data __initconst =3D {
>  static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __init=
const =3D {
>         EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
>         EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x080, "gpa2", 0x08),
> -       EXYNOS850_PIN_BANK_EINTW(5, 0x0a0, "gpq0", 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0",=
 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1",=
 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2",=
 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x0a0, "gpq0",=
 0x0c),
>  };
>
>  /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
>  static const struct samsung_pin_bank_data exynos7885_pin_banks1[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x020, "gpb1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(5, 0x040, "gpb2", 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x020, "gpb1", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x040, "gpb2", 0=
x08),
>  };
>
>  /* pin banks of exynos7885 pin-controller 2 (FSYS) */
>  static const struct samsung_pin_bank_data exynos7885_pin_banks2[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf2", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x040, "gpf3", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x060, "gpf4", 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf2", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x040, "gpf3", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x060, "gpf4", 0=
x0c),
>  };
>
>  /* pin banks of exynos7885 pin-controller 3 (TOP) */
>  static const struct samsung_pin_bank_data exynos7885_pin_banks3[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpp0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(3, 0x020, "gpg0", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp1", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp2", 0x0c),
> -       EXYNOS850_PIN_BANK_EINTG(3, 0x080, "gpp3", 0x10),
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x0a0, "gpp4", 0x14),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x0c0, "gpp5", 0x18),
> -       EXYNOS850_PIN_BANK_EINTG(5, 0x0e0, "gpp6", 0x1c),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x100, "gpp7", 0x20),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpp8", 0x24),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x140, "gpg1", 0x28),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x160, "gpg2", 0x2c),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x180, "gpg3", 0x30),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpg4", 0x34),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x1c0, "gpc0", 0x38),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x1e0, "gpc1", 0x3c),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x200, "gpc2", 0x40),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpp0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x020, "gpg0", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0=
x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x080, "gpp3", 0=
x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0a0, "gpp4", 0=
x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0c0, "gpp5", 0=
x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x0e0, "gpp6", 0=
x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpp7", 0=
x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpp8", 0=
x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x140, "gpg1", 0=
x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x160, "gpg2", 0=
x2c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x180, "gpg3", 0=
x30),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpg4", 0=
x34),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x1c0, "gpc0", 0=
x38),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpc1", 0=
x3c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpc2", 0=
x40),
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
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
> -       EXYNOS850_PIN_BANK_EINTW(4, 0x080, "gpa4", 0x10),
> -       EXYNOS850_PIN_BANK_EINTN(3, 0x0a0, "gpq0"),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0",=
 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1",=
 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2",=
 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3",=
 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x080, "gpa4",=
 0x10),
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x0a0, "gpq0")=
,
>  };
>
>  /* pin banks of exynos850 pin-controller 1 (CMGP) */
>  static const struct samsung_pin_bank_data exynos850_pin_banks1[] __initc=
onst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0c),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x0a0, "gpm5", 0x14),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x0c0, "gpm6", 0x18),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x0e0, "gpm7", 0x1c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0",=
 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1",=
 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2",=
 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3",=
 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4",=
 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5",=
 0x14),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6",=
 0x18),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7",=
 0x1c),
>  };
>
>  /* pin banks of exynos850 pin-controller 2 (AUD) */
>  static const struct samsung_pin_bank_data exynos850_pin_banks2[] __initc=
onst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(5, 0x020, "gpb1", 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gpb1", 0=
x04),
>  };
>
>  /* pin banks of exynos850 pin-controller 3 (HSI) */
>  static const struct samsung_pin_bank_data exynos850_pin_banks3[] __initc=
onst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf2", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf2", 0=
x00),
>  };
>
>  /* pin banks of exynos850 pin-controller 4 (CORE) */
>  static const struct samsung_pin_bank_data exynos850_pin_banks4[] __initc=
onst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf1", 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf1", 0=
x04),
>  };
>
>  /* pin banks of exynos850 pin-controller 5 (PERI) */
>  static const struct samsung_pin_bank_data exynos850_pin_banks5[] __initc=
onst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpg0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpp0", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp1", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp2", 0x0c),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg1", 0x10),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x0a0, "gpg2", 0x14),
> -       EXYNOS850_PIN_BANK_EINTG(1, 0x0c0, "gpg3", 0x18),
> -       EXYNOS850_PIN_BANK_EINTG(3, 0x0e0, "gpc0", 0x1c),
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x100, "gpc1", 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpg0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpp0", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0=
x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg1", 0=
x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpg2", 0=
x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 1, 0x0c0, "gpg3", 0=
x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x0e0, "gpc0", 0=
x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x100, "gpc1", 0=
x20),
>  };
>
>  static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst =
=3D {
> @@ -946,98 +946,97 @@ const struct samsung_pinctrl_of_match_data exynos85=
0_of_data __initconst =3D {
>  /* pin banks of exynos990 pin-controller 0 (ALIVE) */
>  static struct samsung_pin_bank_data exynos990_pin_banks0[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x080, "gpa4", 0x10),
> -       EXYNOS850_PIN_BANK_EINTN(7, 0x0A0, "gpq0"),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0",=
 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1",=
 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2",=
 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3",=
 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x080, "gpa4",=
 0x10),
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 7, 0x0A0, "gpq0")=
,
>  };
>
>  /* pin banks of exynos990 pin-controller 1 (CMGP) */
>  static struct samsung_pin_bank_data exynos990_pin_banks1[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS850_PIN_BANK_EINTN(1, 0x000, "gpm0"),
> -       EXYNOS850_PIN_BANK_EINTN(1, 0x020, "gpm1"),
> -       EXYNOS850_PIN_BANK_EINTN(1, 0x040, "gpm2"),
> -       EXYNOS850_PIN_BANK_EINTN(1, 0x060, "gpm3"),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x00),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x04),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x08),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x0c),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm8", 0x10),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm9", 0x14),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm10", 0x18),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm11", 0x1c),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm12", 0x20),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x1A0, "gpm13", 0x24),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x1C0, "gpm14", 0x28),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x1E0, "gpm15", 0x2c),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x30),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x34),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm18", 0x38),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm19", 0x3c),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm20", 0x40),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x2A0, "gpm21", 0x44),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x2C0, "gpm22", 0x48),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x2E0, "gpm23", 0x4c),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x300, "gpm24", 0x50),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x320, "gpm25", 0x54),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x340, "gpm26", 0x58),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x360, "gpm27", 0x5c),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x380, "gpm28", 0x60),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x3A0, "gpm29", 0x64),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x3C0, "gpm30", 0x68),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x3E0, "gpm31", 0x6c),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x400, "gpm32", 0x70),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x420, "gpm33", 0x74),
> -
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x000, "gpm0")=
,
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x020, "gpm1")=
,
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x040, "gpm2")=
,
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x060, "gpm3")=
,
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4",=
 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0A0, "gpm5",=
 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0C0, "gpm6",=
 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0E0, "gpm7",=
 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm8",=
 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm9",=
 0x14),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm10"=
, 0x18),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm11"=
, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm12"=
, 0x20),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1A0, "gpm13"=
, 0x24),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1C0, "gpm14"=
, 0x28),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1E0, "gpm15"=
, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16"=
, 0x30),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17"=
, 0x34),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm18"=
, 0x38),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm19"=
, 0x3c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm20"=
, 0x40),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2A0, "gpm21"=
, 0x44),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2C0, "gpm22"=
, 0x48),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2E0, "gpm23"=
, 0x4c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x300, "gpm24"=
, 0x50),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x320, "gpm25"=
, 0x54),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x340, "gpm26"=
, 0x58),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x360, "gpm27"=
, 0x5c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x380, "gpm28"=
, 0x60),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3A0, "gpm29"=
, 0x64),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3C0, "gpm30"=
, 0x68),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3E0, "gpm31"=
, 0x6c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x400, "gpm32"=
, 0x70),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x420, "gpm33"=
, 0x74),
>  };
>
>  /* pin banks of exynos990 pin-controller 2 (HSI1) */
>  static struct samsung_pin_bank_data exynos990_pin_banks2[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(3, 0x040, "gpf2", 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x040, "gpf2", 0=
x08),
>  };
>
>  /* pin banks of exynos990 pin-controller 3 (HSI2) */
>  static struct samsung_pin_bank_data exynos990_pin_banks3[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpf3", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf3", 0=
x00),
>  };
>
>  /* pin banks of exynos990 pin-controller 4 (PERIC0) */
>  static struct samsung_pin_bank_data exynos990_pin_banks4[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpp3", 0x0C),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpp4", 0x10),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x0A0, "gpg0", 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp3", 0=
x0C),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp4", 0=
x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0A0, "gpg0", 0=
x14),
>  };
>
>  /* pin banks of exynos990 pin-controller 5 (PERIC1) */
>  static struct samsung_pin_bank_data exynos990_pin_banks5[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp5", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp6", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp7", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpp8", 0x0C),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpp9", 0x10),
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x0A0, "gpc0", 0x14),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x0C0, "gpg1", 0x18),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x0E0, "gpb0", 0x1C),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x100, "gpb1", 0x20),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x120, "gpb2", 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp5", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp6", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp7", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp8", 0=
x0C),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp9", 0=
x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0A0, "gpc0", 0=
x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0C0, "gpg1", 0=
x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0E0, "gpb0", 0=
x1C),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb1", 0=
x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb2", 0=
x24),
>  };
>
>  /* pin banks of exynos990 pin-controller 6 (VTS) */
>  static struct samsung_pin_bank_data exynos990_pin_banks6[] =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS850_PIN_BANK_EINTG(7, 0x000, "gpv0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpv0", 0=
x00),
>  };
>
>  static const struct samsung_pin_ctrl exynos990_pin_ctrl[] __initconst =
=3D {
> @@ -1085,88 +1084,88 @@ const struct samsung_pinctrl_of_match_data exynos=
990_of_data __initconst =3D {
>
>  /* pin banks of exynos9810 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks0[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTN(6, 0x000, "etc1"),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08),
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x080, "gpa3", 0x0c),
> -       EXYNOS850_PIN_BANK_EINTN(6, 0x0A0, "gpq0"),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x0C0, "gpa4", 0x10),
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 6, 0x000, "etc1")=
,
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa0",=
 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa1",=
 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa2",=
 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa3",=
 0x0c),
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 6, 0x0A0, "gpq0")=
,
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0C0, "gpa4",=
 0x10),
>  };
>
>  /* pin banks of exynos9810 pin-controller 1 (AUD) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks1[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpb1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpb2", 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpb2", 0=
x08),
>  };
>
>  /* pin banks of exynos9810 pin-controller 2 (CHUB) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks2[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gph0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(5, 0x020, "gph1", 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gph0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gph1", 0=
x04),
>  };
>
>  /* pin banks of exynos9810 pin-controller 3 (CMGP) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks3[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm10", 0x20),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm11", 0x24),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm12", 0x28),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm13", 0x2C),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm14", 0x30),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x1A0, "gpm15", 0x34),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x1C0, "gpm16", 0x38),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x1E0, "gpm17", 0x3C),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm40", 0x40),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm41", 0x44),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm42", 0x48),
> -       EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm43", 0x4C),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0",=
 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1",=
 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2",=
 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3",=
 0x0C),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4",=
 0x10),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0A0, "gpm5",=
 0x14),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0C0, "gpm6",=
 0x18),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0E0, "gpm7",=
 0x1C),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm10"=
, 0x20),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm11"=
, 0x24),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm12"=
, 0x28),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm13"=
, 0x2C),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm14"=
, 0x30),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1A0, "gpm15"=
, 0x34),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1C0, "gpm16"=
, 0x38),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1E0, "gpm17"=
, 0x3C),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm40"=
, 0x40),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm41"=
, 0x44),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm42"=
, 0x48),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm43"=
, 0x4C),
>  };
>
>  /* pin banks of exynos9810 pin-controller 4 (FSYS0) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks4[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpf0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf0", 0=
x00),
>  };
>
>  /* pin banks of exynos9810 pin-controller 5 (FSYS1) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks5[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(7, 0x000, "gpf1", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf2", 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpf1", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf2", 0=
x04),
>  };
>
>  /* pin banks of exynos9810 pin-controller 6 (PERIC0) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks6[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp3", 0x0C),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg0", 0x10),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x0A0, "gpg1", 0x14),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x0C0, "gpg2", 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp3", 0=
x0C),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg0", 0=
x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0A0, "gpg1", 0=
x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0C0, "gpg2", 0=
x18),
>  };
>
>  /* pin banks of exynos9810 pin-controller 7 (PERIC1) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks7[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp4", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp5", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp6", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpc0", 0x0C),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpc1", 0x10),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x0A0, "gpd0", 0x14),
> -       EXYNOS850_PIN_BANK_EINTG(7, 0x0C0, "gpg3", 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp4", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp5", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp6", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpc0", 0=
x0C),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpc1", 0=
x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0A0, "gpd0", 0=
x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0C0, "gpg3", 0=
x18),
>  };
>
>  /* pin banks of exynos9810 pin-controller 8 (VTS) */
>  static const struct samsung_pin_bank_data exynos9810_pin_banks8[] __init=
const =3D {
> -       EXYNOS850_PIN_BANK_EINTG(3, 0x000, "gpt0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x000, "gpt0", 0=
x00),
>  };
>
>  static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst =
=3D {
> @@ -1239,55 +1238,55 @@ const struct samsung_pinctrl_of_match_data exynos=
9810_of_data __initconst =3D {
>
>  /* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks0[] __in=
itconst =3D {
> -       EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTW(2, 0x020, "gpa1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTN(2, 0x040, "gpq0"),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0",=
 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x020, "gpa1",=
 0x04),
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0x040, "gpq0")=
,
>  };
>
>  /* pin banks of exynosautov9 pin-controller 1 (AUD) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks1[] __in=
itconst =3D {
> -       EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpb1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpb2", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpb3", 0x0C),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpb2", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpb3", 0=
x0C),
>  };
>
>  /* pin banks of exynosautov9 pin-controller 2 (FSYS0) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks2[] __in=
itconst =3D {
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf1", 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0=
x04),
>  };
>
>  /* pin banks of exynosautov9 pin-controller 3 (FSYS1) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks3[] __in=
itconst =3D {
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf8", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf8", 0=
x00),
>  };
>
>  /* pin banks of exynosautov9 pin-controller 4 (FSYS2) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks4[] __in=
itconst =3D {
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf2", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf3", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(7, 0x040, "gpf4", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpf5", 0x0C),
> -       EXYNOS850_PIN_BANK_EINTG(7, 0x080, "gpf6", 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf2", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf3", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x040, "gpf4", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpf5", 0=
x0C),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x080, "gpf6", 0=
x10),
>  };
>
>  /* pin banks of exynosautov9 pin-controller 5 (PERIC0) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks5[] __in=
itconst =3D {
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(5, 0x060, "gpg0", 0x0C),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x060, "gpg0", 0=
x0C),
>  };
>
>  /* pin banks of exynosautov9 pin-controller 6 (PERIC1) */
>  static const struct samsung_pin_bank_data exynosautov9_pin_banks6[] __in=
itconst =3D {
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp3", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp4", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp5", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpg1", 0x0C),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg2", 0x10),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x0A0, "gpg3", 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp3", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp4", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp5", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpg1", 0=
x0C),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg2", 0=
x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0A0, "gpg3", 0=
x14),
>  };
>
>  static const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] __initconst=
 =3D {
> @@ -1349,7 +1348,7 @@ const struct samsung_pinctrl_of_match_data exynosau=
tov9_of_data __initconst =3D {
>  static const struct samsung_pin_bank_data exynosautov920_pin_banks0[] =
=3D {
>         EXYNOSV920_PIN_BANK_EINTW(8, 0x0000, "gpa0", 0x18, 0x24, 0x28),
>         EXYNOSV920_PIN_BANK_EINTW(2, 0x1000, "gpa1", 0x18, 0x20, 0x24),
> -       EXYNOS850_PIN_BANK_EINTN(2, 0x2000, "gpq0"),
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0x2000, "gpq0"=
),
>  };
>
>  /* pin banks of exynosautov920 pin-controller 1 (AUD) */
> @@ -1488,94 +1487,94 @@ const struct samsung_pinctrl_of_match_data exynos=
autov920_of_data __initconst =3D
>  /* pin banks of exynos8890 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks0[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS7870_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
> -       EXYNOS7870_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
> -       EXYNOS7870_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
> -       EXYNOS7870_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x000, "gpa=
0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x020, "gpa=
1", 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa=
2", 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa=
3", 0x0c),
>  };
>
>  /* pin banks of exynos8890 pin-controller 1 (AUD) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS8895_PIN_BANK_EINTG(7, 0x000, "gph0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gph0"=
, 0x00),
>  };
>
>  /* pin banks of exynos8890 pin-controller 2 (CCORE) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS8895_PIN_BANK_EINTG(2, 0x000, "etc0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "etc0"=
, 0x00),
>  };
>
>  /* pin banks of exynos8890 pin-controller 3 (ESE) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks3[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS8895_PIN_BANK_EINTG(5, 0x000, "gpf3", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpf3"=
, 0x00),
>  };
>
>  /* pin banks of exynos8890 pin-controller 4 (FP) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpf2", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpf2"=
, 0x00),
>  };
>
>  /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpi1", 0x00),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpi2", 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpi1"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi2"=
, 0x04),
>  };
>
>  /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks6[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS8895_PIN_BANK_EINTG(7, 0x000, "gpj0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gpj0"=
, 0x00),
>  };
>
>  /* pin banks of exynos8890 pin-controller 7 (NFC) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks7[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpf0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf0"=
, 0x00),
>  };
>
>  /* pin banks of exynos8890 pin-controller 8 (PERIC0) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS8895_PIN_BANK_EINTG(6, 0x000, "gpi0", 0x00),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpd0", 0x04),
> -       EXYNOS8895_PIN_BANK_EINTG(6, 0x040, "gpd1", 0x08),
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x060, "gpd2", 0x0c),
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x080, "gpd3", 0x10),
> -       EXYNOS8895_PIN_BANK_EINTG(2, 0x0A0, "gpb1", 0x14),
> -       EXYNOS8895_PIN_BANK_EINTG(2, 0x0C0, "gpb2", 0x18),
> -       EXYNOS8895_PIN_BANK_EINTG(3, 0x0E0, "gpb0", 0x1c),
> -       EXYNOS8895_PIN_BANK_EINTG(5, 0x100, "gpc0", 0x20),
> -       EXYNOS8895_PIN_BANK_EINTG(5, 0x120, "gpc1", 0x24),
> -       EXYNOS8895_PIN_BANK_EINTG(6, 0x140, "gpc2", 0x28),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x160, "gpc3", 0x2c),
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x180, "gpk0", 0x30),
> -       EXYNOS8895_PIN_BANK_EINTG(7, 0x1A0, "etc1", 0x34),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x000, "gpi0"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpd0"=
, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1"=
, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2"=
, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3"=
, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0A0, "gpb1"=
, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0C0, "gpb2"=
, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0E0, "gpb0"=
, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0"=
, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1"=
, 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2"=
, 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3"=
, 0x2c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0"=
, 0x30),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x1A0, "etc1"=
, 0x34),
>  };
>
>  /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __init=
const =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x000, "gpe0", 0x00),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpe5", 0x04),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x040, "gpe6", 0x08),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x060, "gpj1", 0x0c),
> -       EXYNOS8895_PIN_BANK_EINTG(2, 0x080, "gpj2", 0x10),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x0A0, "gpe2", 0x14),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x0C0, "gpe3", 0x18),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x0E0, "gpe4", 0x1c),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x100, "gpe1", 0x20),
> -       EXYNOS8895_PIN_BANK_EINTG(4, 0x120, "gpe7", 0x24),
> -       EXYNOS8895_PIN_BANK_EINTG(3, 0x140, "gpg0", 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x000, "gpe0"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpe5"=
, 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6"=
, 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1"=
, 0x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2"=
, 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0A0, "gpe2"=
, 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0C0, "gpe3"=
, 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0E0, "gpe4"=
, 0x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1"=
, 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7"=
, 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0"=
, 0x28),
>  };
>
>  /* pin banks of exynos8890 pin-controller 10 (TOUCH) */
>  static const struct samsung_pin_bank_data exynos8890_pin_banks10[] __ini=
tconst =3D {
>         /* Must start with EINTG banks, ordered by EINT group number. */
> -       EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpf1", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf1"=
, 0x00),
>  };
>
>  static const struct samsung_pin_ctrl exynos8890_pin_ctrl[] __initconst =
=3D {
> @@ -1644,69 +1643,69 @@ const struct samsung_pinctrl_of_match_data exynos=
8890_of_data __initconst =3D {
>
>  /* pin banks of exynos8895 pin-controller 0 (ALIVE) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __init=
const =3D {
> -       EXYNOS_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
> -       EXYNOS_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04),
> -       EXYNOS_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08),
> -       EXYNOS_PIN_BANK_EINTW(8, 0x080, "gpa3", 0x0c),
> -       EXYNOS_PIN_BANK_EINTW(7, 0x0a0, "gpa4", 0x24),
> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x020, "gpa0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 7, 0x0a0, "gpa4", 0x24),
>  };
>
>  /* pin banks of exynos8895 pin-controller 1 (ABOX) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks1[] __init=
const =3D {
> -       EXYNOS_PIN_BANK_EINTG(8, 0x000, "gph0", 0x00),
> -       EXYNOS_PIN_BANK_EINTG(7, 0x020, "gph1", 0x04),
> -       EXYNOS_PIN_BANK_EINTG(4, 0x040, "gph3", 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gph0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gph1", 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gph3", 0x08),
>  };
>
>  /* pin banks of exynos8895 pin-controller 2 (VTS) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks2[] __init=
const =3D {
> -       EXYNOS_PIN_BANK_EINTG(3, 0x000, "gph2", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gph2", 0x00),
>  };
>
>  /* pin banks of exynos8895 pin-controller 3 (FSYS0) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks3[] __init=
const =3D {
> -       EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpi0", 0x00),
> -       EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpi1", 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpi0"=
, 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi1"=
, 0x04),
>  };
>
>  /* pin banks of exynos8895 pin-controller 4 (FSYS1) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks4[] __init=
const =3D {
> -       EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpj1", 0x00),
> -       EXYNOS_PIN_BANK_EINTG(7, 0x020, "gpj0", 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpj1", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gpj0", 0x04),
>  };
>
>  /* pin banks of exynos8895 pin-controller 5 (BUSC) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks5[] __init=
const =3D {
> -       EXYNOS_PIN_BANK_EINTG(2, 0x000, "gpb2", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x000, "gpb2", 0x00),
>  };
>
>  /* pin banks of exynos8895 pin-controller 6 (PERIC0) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks6[] __init=
const =3D {
> -       EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpd0", 0x00),
> -       EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpd1", 0x04),
> -       EXYNOS_PIN_BANK_EINTG(4, 0x040, "gpd2", 0x08),
> -       EXYNOS_PIN_BANK_EINTG(5, 0x060, "gpd3", 0x0C),
> -       EXYNOS_PIN_BANK_EINTG(4, 0x080, "gpb1", 0x10),
> -       EXYNOS_PIN_BANK_EINTG(8, 0x0a0, "gpe7", 0x14),
> -       EXYNOS_PIN_BANK_EINTG(8, 0x0c0, "gpf1", 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpd0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x020, "gpd1", 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gpd2", 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x060, "gpd3", 0x0C),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x080, "gpb1", 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0a0, "gpe7", 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpf1", 0x18),
>  };
>
>  /* pin banks of exynos8895 pin-controller 7 (PERIC1) */
>  static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __init=
const =3D {
> -       EXYNOS_PIN_BANK_EINTG(3, 0x000, "gpb0", 0x00),
> -       EXYNOS_PIN_BANK_EINTG(5, 0x020, "gpc0", 0x04),
> -       EXYNOS_PIN_BANK_EINTG(5, 0x040, "gpc1", 0x08),
> -       EXYNOS_PIN_BANK_EINTG(8, 0x060, "gpc2", 0x0C),
> -       EXYNOS_PIN_BANK_EINTG(8, 0x080, "gpc3", 0x10),
> -       EXYNOS_PIN_BANK_EINTG(4, 0x0a0, "gpk0", 0x14),
> -       EXYNOS_PIN_BANK_EINTG(8, 0x0c0, "gpe5", 0x18),
> -       EXYNOS_PIN_BANK_EINTG(8, 0x0e0, "gpe6", 0x1C),
> -       EXYNOS_PIN_BANK_EINTG(8, 0x100, "gpe2", 0x20),
> -       EXYNOS_PIN_BANK_EINTG(8, 0x120, "gpe3", 0x24),
> -       EXYNOS_PIN_BANK_EINTG(8, 0x140, "gpe4", 0x28),
> -       EXYNOS_PIN_BANK_EINTG(4, 0x160, "gpf0", 0x2C),
> -       EXYNOS_PIN_BANK_EINTG(8, 0x180, "gpe1", 0x30),
> -       EXYNOS_PIN_BANK_EINTG(2, 0x1a0, "gpg0", 0x34),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0C),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1C),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2C),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30),
> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34),
>  };
>
>  static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst =
=3D {
> @@ -1777,41 +1776,41 @@ const struct samsung_pinctrl_of_match_data exynos=
8895_of_data __initconst =3D {
>
>  /* pin banks of FSD pin-controller 0 (FSYS) */
>  static const struct samsung_pin_bank_data fsd_pin_banks0[] __initconst =
=3D {
> -       EXYNOS850_PIN_BANK_EINTG(7, 0x00, "gpf0", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x20, "gpf1", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(3, 0x40, "gpf6", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(2, 0x60, "gpf4", 0x0c),
> -       EXYNOS850_PIN_BANK_EINTG(6, 0x80, "gpf5", 0x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x00, "gpf0", 0x=
00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x20, "gpf1", 0x=
04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x40, "gpf6", 0x=
08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x60, "gpf4", 0x=
0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x80, "gpf5", 0x=
10),
>  };
>
>  /* pin banks of FSD pin-controller 1 (PERIC) */
>  static const struct samsung_pin_bank_data fsd_pin_banks1[] __initconst =
=3D {
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpc8", 0x00),
> -       EXYNOS850_PIN_BANK_EINTG(7, 0x020, "gpf2", 0x04),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpf3", 0x08),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpd0", 0x0c),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpb0", 0x10),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x0a0, "gpb1", 0x14),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x0c0, "gpb4", 0x18),
> -       EXYNOS850_PIN_BANK_EINTG(4, 0x0e0, "gpb5", 0x1c),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x100, "gpb6", 0x20),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x120, "gpb7", 0x24),
> -       EXYNOS850_PIN_BANK_EINTG(5, 0x140, "gpd1", 0x28),
> -       EXYNOS850_PIN_BANK_EINTG(5, 0x160, "gpd2", 0x2c),
> -       EXYNOS850_PIN_BANK_EINTG(7, 0x180, "gpd3", 0x30),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x1a0, "gpg0", 0x34),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x1c0, "gpg1", 0x38),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x1e0, "gpg2", 0x3c),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x200, "gpg3", 0x40),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x220, "gpg4", 0x44),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x240, "gpg5", 0x48),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x260, "gpg6", 0x4c),
> -       EXYNOS850_PIN_BANK_EINTG(8, 0x280, "gpg7", 0x50),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpc8", 0=
x00),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x020, "gpf2", 0=
x04),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpf3", 0=
x08),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpd0", 0=
x0c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpb0", 0=
x10),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpb1", 0=
x14),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0c0, "gpb4", 0=
x18),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0e0, "gpb5", 0=
x1c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb6", 0=
x20),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb7", 0=
x24),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x140, "gpd1", 0=
x28),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x160, "gpd2", 0=
x2c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x180, "gpd3", 0=
x30),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1a0, "gpg0", 0=
x34),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1c0, "gpg1", 0=
x38),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpg2", 0=
x3c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpg3", 0=
x40),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x220, "gpg4", 0=
x44),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x240, "gpg5", 0=
x48),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x260, "gpg6", 0=
x4c),
> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x280, "gpg7", 0=
x50),
>  };
>
>  /* pin banks of FSD pin-controller 2 (PMU) */
>  static const struct samsung_pin_bank_data fsd_pin_banks2[] __initconst =
=3D {
> -       EXYNOS850_PIN_BANK_EINTN(3, 0x00, "gpq0"),
> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x00, "gpq0"),
>  };
>
>  static const struct samsung_pin_ctrl fsd_pin_ctrl[] __initconst =3D {
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index c9c38f8988dd..536b01b4fd4a 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -132,37 +132,18 @@
>                 .pctl_res_idx   =3D pctl_idx,                     \
>         }                                                       \
>
> -#define EXYNOS7870_PIN_BANK_EINTN(pins, reg, id)               \
> +#define EXYNOS9_PIN_BANK_EINTN(types, pins, reg, id)           \

"types" name is a bit confusing, as it's actually only one type (type
of the bank), and not an array or list. Maybe just make it "type" (as
in "bank's type")?

>         {                                                       \
> -               .type           =3D &exynos7870_bank_type_alive,  \
> +               .type           =3D &types,                       \
>                 .pctl_offset    =3D reg,                          \
>                 .nr_pins        =3D pins,                         \
>                 .eint_type      =3D EINT_TYPE_NONE,               \
>                 .name           =3D id                            \
>         }
>
> -#define EXYNOS7870_PIN_BANK_EINTW(pins, reg, id, offs)         \
> +#define EXYNOS9_PIN_BANK_EINTG(types, pins, reg, id, offs)     \
>         {                                                       \
> -               .type           =3D &exynos7870_bank_type_alive,  \
> -               .pctl_offset    =3D reg,                          \
> -               .nr_pins        =3D pins,                         \
> -               .eint_type      =3D EINT_TYPE_WKUP,               \
> -               .eint_offset    =3D offs,                         \
> -               .name           =3D id                            \
> -       }
> -
> -#define EXYNOS850_PIN_BANK_EINTN(pins, reg, id)                        \
> -       {                                                       \
> -               .type           =3D &exynos850_bank_type_alive,   \
> -               .pctl_offset    =3D reg,                          \
> -               .nr_pins        =3D pins,                         \
> -               .eint_type      =3D EINT_TYPE_NONE,               \
> -               .name           =3D id                            \
> -       }
> -
> -#define EXYNOS850_PIN_BANK_EINTG(pins, reg, id, offs)          \
> -       {                                                       \
> -               .type           =3D &exynos850_bank_type_off,     \
> +               .type           =3D &types,                       \
>                 .pctl_offset    =3D reg,                          \
>                 .nr_pins        =3D pins,                         \
>                 .eint_type      =3D EINT_TYPE_GPIO,               \
> @@ -170,9 +151,9 @@
>                 .name           =3D id                            \
>         }
>
> -#define EXYNOS850_PIN_BANK_EINTW(pins, reg, id, offs)          \
> +#define EXYNOS9_PIN_BANK_EINTW(types, pins, reg, id, offs)     \
>         {                                                       \
> -               .type           =3D &exynos850_bank_type_alive,   \
> +               .type           =3D &types,                       \
>                 .pctl_offset    =3D reg,                          \
>                 .nr_pins        =3D pins,                         \
>                 .eint_type      =3D EINT_TYPE_WKUP,               \
> @@ -180,19 +161,9 @@
>                 .name           =3D id                            \
>         }
>
> -#define EXYNOS8895_PIN_BANK_EINTG(pins, reg, id, offs)         \
> -       {                                                       \
> -               .type           =3D &exynos8895_bank_type_off,    \
> -               .pctl_offset    =3D reg,                          \
> -               .nr_pins        =3D pins,                         \
> -               .eint_type      =3D EINT_TYPE_GPIO,               \
> -               .eint_offset    =3D offs,                         \
> -               .name           =3D id                            \
> -       }
> -
>  #define EXYNOSV920_PIN_BANK_EINTG(pins, reg, id, con_offs, mask_offs, pe=
nd_offs)       \
>         {                                                       \
> -               .type                   =3D &exynos850_bank_type_off,    =
 \
> +               .type                   =3D &exynos9_bank_type_off,      =
 \
>                 .pctl_offset            =3D reg,                         =
 \
>                 .nr_pins                =3D pins,                        =
 \
>                 .eint_type              =3D EINT_TYPE_GPIO,              =
 \
> @@ -204,7 +175,7 @@
>
>  #define EXYNOSV920_PIN_BANK_EINTW(pins, reg, id, con_offs, mask_offs, pe=
nd_offs)       \
>         {                                                       \
> -               .type                   =3D &exynos850_bank_type_alive,  =
 \
> +               .type                   =3D &exynos9_bank_type_alive,    =
 \
>                 .pctl_offset            =3D reg,                         =
 \
>                 .nr_pins                =3D pins,                        =
 \
>                 .eint_type              =3D EINT_TYPE_WKUP,              =
 \
> @@ -216,7 +187,7 @@
>
>  #define GS101_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs) \
>         {                                                       \
> -               .type                   =3D &exynos850_bank_type_off,    =
 \
> +               .type                   =3D &exynos9_bank_type_off,      =
 \
>                 .pctl_offset            =3D reg,                  \
>                 .nr_pins                =3D pins,                 \
>                 .eint_type              =3D EINT_TYPE_GPIO,       \
> @@ -227,7 +198,7 @@
>
>  #define GS101_PIN_BANK_EINTW(pins, reg, id, offs, fltcon_offs) \
>         {                                                               \
> -               .type                   =3D &exynos850_bank_type_alive,  =
 \
> +               .type                   =3D &exynos9_bank_type_alive,    =
 \
>                 .pctl_offset            =3D reg,                         =
 \
>                 .nr_pins                =3D pins,                        =
 \
>                 .eint_type              =3D EINT_TYPE_WKUP,              =
 \
> --
> 2.39.2
>
