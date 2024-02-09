Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0630E6AA1
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Feb 2024 20:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707511433; cv=none; b=e0Ojfy/WrU/vByYE9FQ8HE4823+Ow5choJxC3TKFjOP9EQPm6KCa4C1lGgyTYAJNBW5T6QbeRUTicUaCwSZ+ucYuF9Qf7VUh05gV+KumOW+qi0YQCu9V9GcUJujZXA4CYpRzBYpXc2FrIgW5kdaf8G9mhDcXKlAm4c6nYlKC8nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707511433; c=relaxed/simple;
	bh=qPNWxsczTO7GV0dPUZcGSpqspC6V0iFjVzyRpKvq3X4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryXVOSZwLb3Y15IjZT/648h7I0YClD8jNlA3KXWzniHb7wL/OEqDMeohGeRhdNhBhB+btSgTq12AhkKp2ftEAz+LSj1ZHu5BJbgUoip4/Ie0927+/yJTCkVlqqaoRFinwDj3bJhA++rrAqn9KSV2oZD3O7UEqACenxymFjM8KYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hBCLSj6+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hBCLSj6+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e06d2180b0so1125554b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Feb 2024 12:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707511430; x=1708116230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPuCellk6eYqVa9MX4sdjQ9QAgJeGQ/IRRQj+Cyjbi4=;
        b=hBCLSj6+KkCwY6z4Bem+NZf8NX7cLp7odVe+/pn50irSaIJBADd9zXwnSimt+S0fpG
         pEeUt3vO6tvxHVTA1KZiJzfnnCwxt6BCX3xF7t+hVnKsnpp7ymtUmtV7N6vovPr8ZJqM
         ux8vAAPDpSL2Vi2fyTbgFy4T8R0Q+Iarh9PUjSVFzs4AAwfXA9kfyyEam0LDxnEQnBb2
         5w+IVcJ+uFyZiKGeJo4KzwBWSvPRNfSl+gw+r+7RXRAOOqCGtRECDrhCnyHynKXNVO6x
         bUTm2RmZDMtbvsDufxQsL57ixM8Ps8weq8G8Qrm18Pwtvi9Wul1ZGPsozeI1S2TlfUIG
         Rktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707511430; x=1708116230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPuCellk6eYqVa9MX4sdjQ9QAgJeGQ/IRRQj+Cyjbi4=;
        b=c7NiHe8w+r//TTLkyXhuMYIfKWAQE/AK+AOJbb0Z4dqCK2dYmAddkCNTZG1wVKTIhN
         P2tffOZx63j42IRrGPUxz8HwzsGf0DyRwTrrGgKBdrq97aiqSBQq4uD4eUy92ToOfljy
         7tfjaJnhtKpEkreAV1Riomao+DFEGjkNRLYoGQVDN9Qb2xVMoUjpSfIYdDOCUHSaq5LX
         SiigGRIE0rG48Hb/xvtZqbBl7AlVGDVZLKW/mXMJKiKiBFrHuamDVHtTyS11+M7YOX4f
         0EFEY8qMBkG7eTb5pqU+40Ryfvyx7oTw27TUqwXxbv8M52bjPBKKBuldMtXM8KzxgpUj
         cXsw==
X-Gm-Message-State: AOJu0Yz8a6g1AMJlm1U8pInyiwpcfQxyOKzaR+D7DQYuW/P2CPShjb+W
	BvFGUn5JN0wu3py3EO3FETBOAa2ew5gH+sNCYR9U95aeZe3J4FtqKchg3+u1T8NrnTZlVnxCwvA
	k15f8sBZ5822/LisHWn1n96lv9KN7lGGchEE+wA==
X-Google-Smtp-Source: AGHT+IHxT2vJWHBnr83Rt4mszpZUd9Y5Ux1o49kC7wAXkigzdHXT6Hl72EkvyTIEPZvAAUlI5pSHbZleyvFADVLIDDc=
X-Received: by 2002:a05:6a21:3a41:b0:19e:bc68:3c72 with SMTP id
 zu1-20020a056a213a4100b0019ebc683c72mr289248pzb.28.1707511430323; Fri, 09 Feb
 2024 12:43:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208161700.268570-1-peter.griffin@linaro.org> <20240208161700.268570-3-peter.griffin@linaro.org>
In-Reply-To: <20240208161700.268570-3-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 9 Feb 2024 14:43:39 -0600
Message-ID: <CAPLW+4n6e2SQSMSAQ66U09JhYRc7gqkwBqU2LOg_=Z2Aqdd4cw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle()
 for PMU regs
To: Peter Griffin <peter.griffin@linaro.org>
Cc: arnd@arndb.de, krzysztof.kozlowski@linaro.org, linux@roeck-us.net, 
	wim@linux-watchdog.org, alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
	alexey.klimov@linaro.org, kernel-team@android.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-fsd@tesla.com, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 10:21=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Obtain the PMU regmap using the new API added to exynos-pmu driver rather
> than syscon_regmap_lookup_by_phandle(). As this driver no longer depends
> on mfd syscon remove that header and Kconfig dependency.
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

Tested on my E850-96 board (Exynos850 chip) with Debian rootfs. Test proced=
ure:

1. Added this to /chosen node in dts:

    bootargs =3D "s3c2410_wdt.tmr_atboot=3D1 s3c2410_wdt.nowayout=3D1
s3c2410_wdt.soft_noboot=3D0";

2. Check if watchdogs are active:

    # dmesg | grep watchdog
    [    1.488149] s3c2410-wdt 10050000.watchdog: starting watchdog timer
    [    1.489003] s3c2410-wdt 10050000.watchdog: watchdog active,
reset enabled, irq disabled
    [    1.496928] s3c2410-wdt 10060000.watchdog: starting watchdog timer
    [    1.502984] s3c2410-wdt 10060000.watchdog: watchdog active,
reset enabled, irq disabled

3. Generate a panic to cause wdt reset:

    #  echo c > /proc/sysrq-trigger

In 15 seconds (wdt timeout) reboot happens, and bootloader shows this
message for the reboot reason:

    Watchdog or Warm Reset Detected

That proves regmap works fine with this patch. Otherwise reboot wouldn't ha=
ppen.

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
>         depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE=
_TEST
>         select WATCHDOG_CORE
> -       select MFD_SYSCON if ARCH_EXYNOS
>         help
>           Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
>           SoCs. This will reboot the system when the timer expires with
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
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
> @@ -699,11 +699,11 @@ static int s3c2410wdt_probe(struct platform_device =
*pdev)
>                 return ret;
>
>         if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> -               wdt->pmureg =3D syscon_regmap_lookup_by_phandle(dev->of_n=
ode,
> -                                               "samsung,syscon-phandle")=
;
> +               wdt->pmureg =3D exynos_get_pmu_regmap_by_phandle(dev->of_=
node,
> +                                                "samsung,syscon-phandle"=
);
>                 if (IS_ERR(wdt->pmureg))
>                         return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
> -                                            "syscon regmap lookup failed=
.\n");
> +                                            "PMU regmap lookup failed.\n=
");
>         }
>
>         wdt_irq =3D platform_get_irq(pdev, 0);
> --
> 2.43.0.594.gd9cf4e227d-goog
>
