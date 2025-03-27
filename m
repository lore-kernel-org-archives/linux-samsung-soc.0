Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB88D204F70
	for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Mar 2025 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065717; cv=none; b=r7QxAwOQUAP4JyzpSXm+FtPsYJlBoTXguOlUlfuk5ShqWdruMaXuBNrqhdpnmzd3ciCBWhztCJMS+oSbyZcS0gVyvcu0QCi0pXKNn4K0ZwJf14Eacfji2PUtlL6uQrylvmGxsh/wXUTXpJTqKEDP/ksIWoFsu3x959D0wjQh2Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065717; c=relaxed/simple;
	bh=+uDTvw0NAiJshNKjCFWBDchrHudSaZlgESjIlq6pqXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pq0kbv8rDMFmRTsNSv5lJqz8uVSEgez8CmwSlvqS8zugr1TNnDX36Es8PAYmsquiuN779i1VXe/p99IXJvnFa4VH8OgG4FuJ2qw+TnMcCq8CK+pO8DxCFdd/o7M6+K+ePNq+JObawHcVNrUU4uRyV+RTa9m4dUlZ2Lukn1Rl+M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IqdVU7g1; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IqdVU7g1"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bfed67e08so7393651fa.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Mar 2025 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743065714; x=1743670514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xX7zOJmIvIc+c8CVP1kOsZxrERdgtODAYGQ6WCW63GA=;
        b=IqdVU7g1Xz13ZgqO4JK3tYrV8oHwpXhJZ7ooi7U6/PSoq05JIDqIpAM4dapKpQ5+8T
         /tpZpdolEnH4zF+0nT0WBLqr6olcKJrHc/r/j6FlrMmBGY+IVKqRO7qFobJ4opyr5IhM
         v7sTOeRrZbE7n5WPRwEYLlZjfpcrIP+/NsekQJrYM6PlC+vyMRWBa0Xs1M4zGJWm4PZG
         36J45HDizuCsbovrtn/C2XooJuCi2JUPBpJR7tUNsuiWBMVRsVaKlqyShE5kRL7//vLZ
         g/msJu1E7DtiTKQZ3HlUQL5nlRWcZ6xgQyHE1VWgGsIc7ADcIctoU3e6ZmC0fr0fmP2i
         S37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065714; x=1743670514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xX7zOJmIvIc+c8CVP1kOsZxrERdgtODAYGQ6WCW63GA=;
        b=WmC5QHunmjJqGriXs0aZWRsaDRvIF13sa7rJQ0XaeFGeed3ZH3bWZeUSdFovRZrVXl
         AvUAIfP5tKtW0fNzcYAA4WID6MgSdhPtRh3QAvp244T1kr1XfdbZmbz4o1hpNwei7jGg
         uNiLVZYasSVuapu8g3hlAD5skiZntnzpgTMHnxh/IlbhXAZtqDL0oPreWwpqRPpnEiVG
         Ta97wygdpQHVnI61u2IIoJRXjY9T8QSYZZoeqC3TnQa4wRS7iMm10WfMkztv/eWRs4Di
         i7unRyj4+/BDpj3hJf2qBjn6vBgrzv2LJluFnG2XK0O1lEcLp4gMy9mD4vDoueEmoZow
         ryuw==
X-Forwarded-Encrypted: i=1; AJvYcCW3cp5tlWDaPVxnZg7OOIkwInZ/KiVHodWpG+vKlE2j+CenhoXPMBtf0KiB01QkNIbGPrqip8fOFQQ8jjgDpqzBRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCzASFZUMQIHtKJYxWh5GDr9YpHZnUpoLHqAwjgqyBW+gV7jOs
	X+4VChHCTaTxutqmjGhwoCoBl8uCUNYLRLvYfaavP4gN/nUAm1VAI9YJ8bgWfIpmxIGbznLh5FO
	DWTfaio1uyaFNzhF5ezq3SSkaCbBBkNZqiqsMLRaMuUW0xR6n
X-Gm-Gg: ASbGncsBBSA7oT8MiwQ5MBbVgYs9z9tovugwwvwRfvlls8ggiQpQUlu07EwCG3oCxEW
	cBYz6prcyjys9lTphaOrs0mMcd8UniIB1s//Hg30RZBYrPsLOLGMI43D1znaxi3E+LaCaoqB0OI
	ga8ZMcW+R3UiQH/khms/sqTldJxO2aH8w2EoGLH9vNHfGqG6hcIHJW+bEtKw==
X-Google-Smtp-Source: AGHT+IHuWctoQSNtfRvqowbNw6/p2JfMs654EQsPOQDnh4CHiSDaXjQHp2k71yGY5aW9byJLFzlKPfX/Zmi4wUmU4J0=
X-Received: by 2002:a2e:a548:0:b0:30b:ee81:9622 with SMTP id
 38308e7fff4ca-30dc5f45824mr11654211fa.31.1743065714014; Thu, 27 Mar 2025
 01:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250327004945.563765-1-peng.fan@oss.nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Mar 2025 09:55:03 +0100
X-Gm-Features: AQ5f1JrNDKi6eoVNVGn9D2px89ZzGel4NmYjoMJzgLZI_iKwInQJa47frSxKq4I
Message-ID: <CAMRc=Me8YdNcU1CHH23Bsi8yp33OL8a00-MiMNwA7skD7S0Jbw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, broonie@kernel.org
Cc: linus.walleij@linaro.org, krzk@kernel.org, lgirdwood@gmail.com, 
	andriy.shevchenko@intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 1:50=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> This is prepare patch for switching s5m8767 regulator driver to
> use GPIO descriptor. DTS for exynos5250 spring incorrectly specifies
> "active low" polarity for the DVS and DS line. But per datasheet,
> they are actually active high. So add polarity quirk for it.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>
> V2:
>  New patch
>
>  drivers/gpio/gpiolib-of.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index eb667f8f1ead..83559dd24f32 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -222,6 +222,15 @@ static void of_gpio_try_fixup_polarity(const struct =
device_node *np,
>                  */
>                 { "lantiq,pci-xway",    "gpio-reset",   false },
>  #endif
> +#if IS_ENABLED(CONFIG_REGULATOR_S5M8767)
> +               /*
> +                * According to S5M8767, the DVS and DS pin are
> +                * active-high signals. However, exynos5250-spring.dts us=
e
> +                * active-low setting.
> +                */
> +               { "samsung,s5m8767-pmic", "s5m8767,pmic-buck-dvs-gpios", =
true },
> +               { "samsung,s5m8767-pmic", "s5m8767,pmic-buck-ds-gpios", t=
rue },
> +#endif
>  #if IS_ENABLED(CONFIG_TOUCHSCREEN_TSC2005)
>                 /*
>                  * DTS for Nokia N900 incorrectly specified "active high"
> --
> 2.37.1
>

Mark,

Once v6.15-rc1 is tagged, I'd like to pick it up and provide you with
an immutable tag so that you can take the corresponding regulator
patch through your tree, does it sound good to you?

Bartosz
