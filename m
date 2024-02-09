Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B977815C0
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Feb 2024 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707474950; cv=none; b=BxaOCtD2JY2MEiTuwKZcHEQjNPJhp7/iMtuRfdTf3VIct56y0yPdhcgichVZO2tWYrYnR9TjFYtR+2JL918WoHd8FDf1DWW2B2hEd+bPHRBeBbLVuPAP1hpXJuQtUCWAXioBdZ1hWuhHtRFoEVVf9O3vCLQhdROwNDSBdGuXQh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707474950; c=relaxed/simple;
	bh=Mh1E9PeJjOSqtWbFh8Fz3144DuBxk5lGa2WIC0FhKC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sswQ/GleH6COEFIR5MSFoJnmjuVdY+GmSrt38S/EIe8WX4LByvs7rSK7onquHEPYZ5vwWWtL6P0JaREI7E7vqlxh6o12l8CFedBsZyOn4ydwwmrB4rS5j6NX8wofBO/BUejdDGRDKmMPSTYSr2882/ly0RqkyHr6s8tTmhHLrME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yy4r/7GI; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yy4r/7GI"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-46d37c74f53so192219137.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Feb 2024 02:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707474946; x=1708079746; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C0AaPX0aZcuXGu3S0z1IdEkLhaMcgiZgBjdGD9S23tA=;
        b=Yy4r/7GIDScXh0YKhQ+K+7/UDlksVqIZSC/3XkNdbh0jR2n0ivk7AHz/vCdahltYA4
         nCl5kpQR628ANHMInbKrsuUNAJ0IeRJhHTWGJ5lRptaPLZBUY3CDpsUQ4IBW13yKlghC
         hNGOXAv11z/5BFoYVWKG3kVtOfzPudNQVxcZWOijsha4n7r8k1HkKZhoFeQvHZ98vKGA
         Ljoue7aHfqoGt+FUtm4ATV3Lwdhp0g6zRni9txWfXP6i/xF+PKdCA7wJthN4FGZmFy+0
         Rap9p7qieMK1M2hts5nf8R2IDie/DRgbKdySYqJRcpLoBPd6RTwaZ4rgDLi45DeqACou
         ZW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707474946; x=1708079746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0AaPX0aZcuXGu3S0z1IdEkLhaMcgiZgBjdGD9S23tA=;
        b=lYnC9tlqv2nGOz+ucvlmXu4mzbOsSiHESzTgENlY2ohlMqZNkmug+5Hl/1WMh3G1rF
         2qkXw/0RLmiL+qR6GkQpdoTA4L7TjvN/PLA5L8HDcYTq443xTcP8hwJ5O19LVF5slr2B
         WDqF9RN4aHWrtSSBiVHTeAsE7bsaRoxRs56sisyTj3Os5ZtEwAfforkZywD6pBLBMfj+
         yiGWLCIqY72Vo00kJMmlyx9SslEblM1I0tIcStPIvAdHOkukyOPssTTpHu6JoVMezTe7
         DuQIQYAKwUdkEPvWxzVeQjmwONaCRraJVKYrOPVQJjXamtafZy/4GhKT+zcmHVgVAFm1
         2vNA==
X-Gm-Message-State: AOJu0YxXkgoVs7brp24XveZhgA8bD98MClu6D9xFH+UbKL9HX8cMNCiw
	XOJsNStzzwrrK7EZb1Jxfo5zkmOvfcP0CrSYYO+hIvHxS3WR0bCw0MXxdbCl4++0g1bzmHg+qq6
	a1QieHlMdcreAWOOjajaUnXTZJKNabiK39faFgQ==
X-Google-Smtp-Source: AGHT+IFp9wZFp7PGu0RcR1uD2IpDXLMQRWQla3gRj8qRezXJyFyxHkmQv5rHnuraGHJB+dMlsRycHuckgzpTuB99yYs=
X-Received: by 2002:a05:6102:ccb:b0:46c:fb37:393b with SMTP id
 g11-20020a0561020ccb00b0046cfb37393bmr1104868vst.11.1707474946599; Fri, 09
 Feb 2024 02:35:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208161700.268570-1-peter.griffin@linaro.org> <20240208161700.268570-3-peter.griffin@linaro.org>
In-Reply-To: <20240208161700.268570-3-peter.griffin@linaro.org>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 9 Feb 2024 10:35:35 +0000
Message-ID: <CANgGJDoaxDLxPBxc=2kFO+omF8FcTf_3et1=J3h1BF8X27XbaQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle()
 for PMU regs
To: Peter Griffin <peter.griffin@linaro.org>
Cc: arnd@arndb.de, krzysztof.kozlowski@linaro.org, linux@roeck-us.net, 
	wim@linux-watchdog.org, alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
	semen.protsenko@linaro.org, kernel-team@android.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-fsd@tesla.com, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 16:21, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Obtain the PMU regmap using the new API added to exynos-pmu driver rather
> than syscon_regmap_lookup_by_phandle(). As this driver no longer depends
> on mfd syscon remove that header and Kconfig dependency.
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Alexey Klimov <alexey.klimov@linaro.org>

Tested on odroid xu3 (exynos5422). Watchdog works as expected and can
reset the system.

> ---
>  drivers/watchdog/Kconfig       | 1 -
>  drivers/watchdog/s3c2410_wdt.c | 8 ++++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 7d22051b15a2..d78fe7137799 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -512,7 +512,6 @@ config S3C2410_WATCHDOG
>         tristate "S3C6410/S5Pv210/Exynos Watchdog"
>         depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
>         select WATCHDOG_CORE
> -       select MFD_SYSCON if ARCH_EXYNOS
>         help
>           Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
>           SoCs. This will reboot the system when the timer expires with
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 349d30462c8c..686cf544d0ae 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -24,9 +24,9 @@
>  #include <linux/slab.h>
>  #include <linux/err.h>
>  #include <linux/of.h>
> -#include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/delay.h>
> +#include <linux/soc/samsung/exynos-pmu.h>
>
>  #define S3C2410_WTCON          0x00
>  #define S3C2410_WTDAT          0x04
> @@ -699,11 +699,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>                 return ret;
>
>         if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> -               wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
> -                                               "samsung,syscon-phandle");
> +               wdt->pmureg = exynos_get_pmu_regmap_by_phandle(dev->of_node,
> +                                                "samsung,syscon-phandle");
>                 if (IS_ERR(wdt->pmureg))
>                         return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
> -                                            "syscon regmap lookup failed.\n");
> +                                            "PMU regmap lookup failed.\n");
>         }
>
>         wdt_irq = platform_get_irq(pdev, 0);
> --
> 2.43.0.594.gd9cf4e227d-goog
>
