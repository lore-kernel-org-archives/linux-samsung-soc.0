Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA14FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 08:34:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDAE661184
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 08:34:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhKCIg6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Nov 2021 04:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbhKCIg5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 04:36:57 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F5AC061714;
        Wed,  3 Nov 2021 01:34:21 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id b203so1831870iof.1;
        Wed, 03 Nov 2021 01:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jFave9Qo9BTxsM3PqmAtEeR+7yYOX2AlhHHLan6mN34=;
        b=f/K/sGt8QpNUPsmYNDmfD6afH8xgXkMRBqhBMDGCoQ0OmUcWSnGQzMaypTXWXXfJg6
         cfW/iFHEo8AkVqf32rhfCNfaQ3VONvz7j2fmdyuC4yYNcpqryDaYxGsMoibsYsdJmD6p
         CV75BTv+KC3+AQ2w5Dr+Qqy8VPQ1k4GY4tos/f3gZsElJGrtpfaZLNDl2K9OnJ4DGRDE
         GiEn/Gv4oRBwGFRHk/bYQcdxVMbNWNR2ZSmwJD8FshDTKAkxiP09elG3WYYRntcl78La
         krPgOne/gUaYIZodbikHmz7A3j6Rt9a/FeOB/NpyPN9hOImkn1I4UiZYvFM9l2iNvXBr
         /1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jFave9Qo9BTxsM3PqmAtEeR+7yYOX2AlhHHLan6mN34=;
        b=ztzpxg7RsJ61Pp6VFBvfyRYR0c/R71X5eZ/c5JKKEA/oMV/b/q7HIusfMwbnfFkbeE
         B/BweNarWic3e7FWtT7vwXJgxxE9f56a3Q0wyz/0y9wKXxaFgoDRvRDKFGaN7l263v+O
         m7I0+wwv93ca15RrdhXC5uwYRqhpkMZqkpzvXyJCoQjsFIjpZTMJBSvYYj6hhUn7Opf5
         ftowwsjmq/7Gy2yyaACWCCcI2I08+gC23xXeRcX8Lw2R5Z4bIhoEzdnmrwD5b8QMXlQM
         rlYOv4um61nx2WN4FksND6ub2sv2ugdb9fPCbmgHh6Jct9sRLjg3rstjUgTXYn5BiW5h
         70ZQ==
X-Gm-Message-State: AOAM531LrZK9kfUG7d5SNDaWxrvAFPV2QtTKFlF/rGY0MVoKvWqdH7zc
        7NOOkQiGbuXUOIVbhOzSynQwLSg7OxmmF0Mf0aT0sj4G
X-Google-Smtp-Source: ABdhPJwux1JlB8bk3u/JZ946VuDOdJJ+Q/8i3YbUrf++jKJblYXCHXmLZL4jYvAt7ztMKECskXVFfmjSEsWnBRwhNm8=
X-Received: by 2002:a05:6638:12cb:: with SMTP id v11mr2652907jas.13.1635928460829;
 Wed, 03 Nov 2021 01:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Wed, 3 Nov 2021 17:34:09 +0900
Message-ID: <CA+Ln22HMFhiqqPTD+EibJ1zkd9CZb3BkrfZdsmxL1_NfKLMewA@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: s3c: mark as deprecated and schedule removal
 after 2022
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:SAMSUNG SOC CLOCK DRIVERS" 
        <linux-samsung-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>, Cedric Roux <sed@free.fr>,
        Sam Van Den Berge <sam.van.den.berge@telenet.be>,
        Lihua Yao <ylhuajnu@outlook.com>,
        Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

2021=E5=B9=B411=E6=9C=882=E6=97=A5(=E7=81=AB) 20:05 Krzysztof Kozlowski <kr=
zysztof.kozlowski@canonical.com>:
>
> The Samsung S3C24xx and S3C64xx platforms are very old designs. S3C2416
> was introduced in 2008 and S3C6410 in 2009/2010.  They are not widely
> available anymore - out-of-stock on FriendlyArm (one of manufacturers of

FWIW, I still see mini6410 and (compatible) tiny6410 available on
AliExpress, although it's not a good enough reason to keep a platform
without active users.
(and I also have one, but haven't made any use of it for 7 years or so
and don't see myself finding time to invest into it)

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz

> boards) and only few specialist stores still offer them for quite a high
> price.
>
> The community around these platforms was not very active, so I suspect
> no one really uses them anymore. Maintenance takes precious time so
> there is little sense in keeping them alive if there are no real users.
>
> Let's mark all S3C24xx and S3C64xx platforms as deprecated and mention
> possible removal in one year (after 2022).  The deprecation message will
> be as text in Kconfig, build message (not a warning though) and runtime
> print error.
>
> If there are any users, they might respond and postpone the removal.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/arm/Kconfig                  | 7 ++++++-
>  arch/arm/mach-s3c/Kconfig.s3c64xx | 7 ++++++-
>  arch/arm/mach-s3c/cpu.c           | 1 +
>  arch/arm/mach-s3c/init.c          | 2 ++
>  arch/arm/mach-s3c/s3c24xx.c       | 5 +++++
>  arch/arm/mach-s3c/s3c64xx.c       | 5 +++++
>  6 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index f0f9e8bec83a..bd8237c7e7f1 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -473,7 +473,7 @@ config ARCH_SA1100
>           Support for StrongARM 11x0 based boards.
>
>  config ARCH_S3C24XX
> -       bool "Samsung S3C24XX SoCs"
> +       bool "Samsung S3C24XX SoCs (deprecated, see help)"
>         select ATAGS
>         select CLKSRC_SAMSUNG_PWM
>         select GPIO_SAMSUNG
> @@ -491,6 +491,11 @@ config ARCH_S3C24XX
>           (<http://www.simtec.co.uk/products/EB110ITX/>), the IPAQ 1940 o=
r the
>           Samsung SMDK2410 development board (and derivatives).
>
> +         The platform is deprecated and scheduled in removal. Please rea=
ch to
> +         the maintainers of the platform and linux-samsung-soc@vger.kern=
el.org if
> +         you still use it.
> +         Without such feedback, the platform will be removed after 2022.
> +
>  config ARCH_OMAP1
>         bool "TI OMAP1"
>         depends on MMU
> diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfi=
g.s3c64xx
> index f3fcb570edf5..3b090ae72bbd 100644
> --- a/arch/arm/mach-s3c/Kconfig.s3c64xx
> +++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
> @@ -4,7 +4,7 @@
>  #      Simtec Electronics, Ben Dooks <ben@simtec.co.uk>
>
>  menuconfig ARCH_S3C64XX
> -       bool "Samsung S3C64XX"
> +       bool "Samsung S3C64XX (deprecated, see help)"
>         depends on ARCH_MULTI_V6
>         select ARM_AMBA
>         select ARM_VIC
> @@ -25,6 +25,11 @@ menuconfig ARCH_S3C64XX
>         help
>           Samsung S3C64XX series based systems
>
> +         The platform is deprecated and scheduled in removal. Please rea=
ch to
> +         the maintainers of the platform and linux-samsung-soc@vger.kern=
el.org if
> +         you still use it.
> +         Without such feedback, the platform will be removed after 2022.
> +
>  if ARCH_S3C64XX
>
>  # Configuration options for the S3C6410 CPU
> diff --git a/arch/arm/mach-s3c/cpu.c b/arch/arm/mach-s3c/cpu.c
> index 6e9772555f0d..3b16cf42910f 100644
> --- a/arch/arm/mach-s3c/cpu.c
> +++ b/arch/arm/mach-s3c/cpu.c
> @@ -28,4 +28,5 @@ void __init s3c64xx_init_cpu(void)
>         }
>
>         pr_info("Samsung CPU ID: 0x%08lx\n", samsung_cpu_id);
> +       pr_err("The platform is deprecated and scheduled in removal. Plea=
se reach to the maintainers of the platform and linux-samsung-soc@vger.kern=
el.org if you still use it.  Without such feedback, the platform will be re=
moved after 2022.\n");
>  }
> diff --git a/arch/arm/mach-s3c/init.c b/arch/arm/mach-s3c/init.c
> index 9d92f03e9bc1..5db7dc54340c 100644
> --- a/arch/arm/mach-s3c/init.c
> +++ b/arch/arm/mach-s3c/init.c
> @@ -59,6 +59,8 @@ void __init s3c_init_cpu(unsigned long idcode,
>
>         if (cpu->map_io)
>                 cpu->map_io();
> +
> +       pr_err("The platform is deprecated and scheduled in removal. Plea=
se reach to the maintainers of the platform and linux-samsung-soc@vger.kern=
el.org if you still use it.  Without such feedback, the platform will be re=
moved after 2022.\n");
>  }
>
>  /* s3c24xx_init_clocks
> diff --git a/arch/arm/mach-s3c/s3c24xx.c b/arch/arm/mach-s3c/s3c24xx.c
> index ccfed48c98aa..2ea1cb21dfbc 100644
> --- a/arch/arm/mach-s3c/s3c24xx.c
> +++ b/arch/arm/mach-s3c/s3c24xx.c
> @@ -678,3 +678,8 @@ struct platform_device s3c2410_device_dclk =3D {
>         },
>  };
>  #endif
> +
> +#pragma message "The platform is deprecated and scheduled in removal (se=
e platform help). " \
> +               "Please reach to the maintainers of the platform " \
> +               "and linux-samsung-soc@vger.kernel.org if you still use i=
t." \
> +               "Without such feedback, the platform will be removed afte=
r 2022."
> diff --git a/arch/arm/mach-s3c/s3c64xx.c b/arch/arm/mach-s3c/s3c64xx.c
> index 4dfb648142f2..3e248f0e96a2 100644
> --- a/arch/arm/mach-s3c/s3c64xx.c
> +++ b/arch/arm/mach-s3c/s3c64xx.c
> @@ -425,3 +425,8 @@ static int __init s3c64xx_init_irq_eint(void)
>         return 0;
>  }
>  arch_initcall(s3c64xx_init_irq_eint);
> +
> +#pragma message "The platform is deprecated and scheduled in removal (se=
e platform help). " \
> +               "Please reach to the maintainers of the platform " \
> +               "and linux-samsung-soc@vger.kernel.org if you still use i=
t." \
> +               "Without such feedback, the platform will be removed afte=
r 2022."
> --
> 2.32.0
>
