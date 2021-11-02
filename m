Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2462EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 13:06:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05D60610A8
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 13:06:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhKBNIx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 09:08:53 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:49763 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbhKBNIw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 09:08:52 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MsZ3N-1mSyrz0PpD-00u1mt; Tue, 02 Nov 2021 14:06:16 +0100
Received: by mail-wr1-f46.google.com with SMTP id c4so3239766wrd.9;
        Tue, 02 Nov 2021 06:06:16 -0700 (PDT)
X-Gm-Message-State: AOAM531rRL16AW5kbXOzU1DKryqm4xSUXEwsAOwfpWbhng/6CcO2u7Ux
        XNqQX8ltJTeZsa5wklWbrrvjUWknm44EYMPXquQ=
X-Google-Smtp-Source: ABdhPJwWAg3P26ppcILEiFbUHfYrNLNZPTO8+/ud/UnYrQZ5JbVFgD73dBgB7HpD0+0SwFq4D2ogiUOntE/XRbGpjPs=
X-Received: by 2002:a05:6000:18c7:: with SMTP id w7mr46932714wrq.411.1635858375625;
 Tue, 02 Nov 2021 06:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 2 Nov 2021 14:05:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0KqS-OZoo46ajfaXw1aFXR9HouW2ZezKRWCawMa7yuGA@mail.gmail.com>
Message-ID: <CAK8P3a0KqS-OZoo46ajfaXw1aFXR9HouW2ZezKRWCawMa7yuGA@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: s3c: mark as deprecated and schedule removal
 after 2022
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>, Cedric Roux <sed@free.fr>,
        Sam Van Den Berge <sam.van.den.berge@telenet.be>,
        Lihua Yao <ylhuajnu@outlook.com>,
        Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:q0sQRh5HWy7ZoIvar8MpodwWNqyNjUBw3pEovunUCYKJbkVq1Bt
 0LFYukG6R/wfT1khoRgacyALS9c/cCNgTAIhKH0h0qyoYb53keYB0tttVaZTZYd7Lm4iJEw
 PF8DkgrZt4I83K+Gq4+KjmNvrIOrk+27L9ZX4nKRfxY4S4n+ZFjJyo6lrKdigzeg0nZZFM7
 IKNIRKId+SoemdJtOKWmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aNrjFLy/PRw=:U1IHxJAMxTaeM9Z/MWnbEN
 CS4OZHi7xjfpI82gGaU6RA4iZ4CiQ8krjzvSjQQMUenhkIwL1kA1yrzv87EwGQQ3wmNGROw8E
 PT6kuSt9KzM4RBfqFVh1dlZACa7/4Ppf2US8pUcJv0/ridKYOx/Vf/P95McYQCKiInRzCZNmN
 KJxYheq5ScRK1BZ6WdyqvA8blTPsyhGtBTpLO+sou4iKih5wCZ3/IldSXHe3ILlZ92RreYVmU
 zlVzDnVR047DTN9g69XHQCWulz4em3ZUSMTC5W0Tq+vqPmKNj3UyK3eMPBOdL1TFs8Zl6hC9f
 Q2iLi7ZSovIvNf/KUKyTX7dr+sHAzf6yfF+BUITeXB/aDw0zv76bGtHO/3BCYgaU5ipdcBLY0
 Nygir18gfwji4/Y6sPNySX0U0EGWk9MXId2BSisbIcjZfdw0r/ykuPAcBkE/zj/+aimV81FJs
 yx9GwU6XAxmV4bjahEVtmKomVF5PQPoTGi4ZD74tbojSJ8wVwqUk4UQ0fLHmi+BUaFB9yWdpP
 ogf3ON2wUUT4z1wnRdEOB5nEjLXdDOTeov1/R5DDzxYi00wKIXVJEgC9eOr0JBQctzP74n9aM
 z8bpMkhhCzQKNvIvQMe2G95HSq4DD3Z6r3e/h618DodHHCdjmQMzEM7dzoMdUJS07sadxwEPI
 nx1KjlgM12qpCcEy5YFjblafXWhYfGZzecU3+bCRG+nSiYskZMTohFNVE+BXGUcjafOk=
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 2, 2021 at 12:05 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> The Samsung S3C24xx and S3C64xx platforms are very old designs. S3C2416
> was introduced in 2008 and S3C6410 in 2009/2010.  They are not widely
> available anymore - out-of-stock on FriendlyArm (one of manufacturers of
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

Looks good to me.

We have a couple of platforms that are in a similar state, and we could do
the same there. I'd have to dig through
https://lore.kernel.org/linux-arm-kernel/CAK8P3a2VW8T+yYUG1pn1yR-5eU4jJXe1+M_ot6DAvfr2KyXCzQ@mail.gmail.com/
to see which ones promised to get back to working on the code and
ended up not doing so. ;-)

The ones that would help the most in removing are probably omap1,
pxa, and the strongarm-based platforms: those have a lot of special
cases in the code base. At least a year ago the maintainers wanted
to keep those around, but maybe the 2022 LTS kernel is a better
time for planned EOL. I also still have a backlog of cleanup patches
for omap1 and pxa (similar to the s3c24xx changes I did) that we
should get mainlined if we want to keep them around after all.

At some point later we can also seriously look into removing all
non-DT machine support, which would impact all of these:

$ git grep -w MACHINE_START arch/arm/mach-* | cut -f 3 -d/ | uniq -c
      1 mach-cns3xxx
     12 mach-davinci
      2 mach-dove
     19 mach-ep93xx
      3 mach-footbridge
      6 mach-iop32x
      2 mach-ixp4xx
     10 mach-mmp
      3 mach-mv78xx0
     14 mach-omap1
     17 mach-orion5x
     62 mach-pxa
      1 mach-rpc
     36 mach-s3c
     13 mach-sa1100

> +#pragma message "The platform is deprecated and scheduled in removal (see platform help). " \
> +               "Please reach to the maintainers of the platform " \
> +               "and linux-samsung-soc@vger.kernel.org if you still use it." \
> +               "Without such feedback, the platform will be removed after 2022."
> diff --git a/arch/arm/mach-s3c/s3c64xx.c b/arch/arm/mach-s3c/s3c64xx.c
> index 4dfb648142f2..3e248f0e96a2 100644
> --- a/arch/arm/mach-s3c/s3c64xx.c
> +++ b/arch/arm/mach-s3c/s3c64xx.c
> @@ -425,3 +425,8 @@ static int __init s3c64xx_init_irq_eint(void)
>         return 0;
>  }
>  arch_initcall(s3c64xx_init_irq_eint);
> +
> +#pragma message "The platform is deprecated and scheduled in removal (see platform help). " \
> +               "Please reach to the maintainers of the platform " \
> +               "and linux-samsung-soc@vger.kernel.org if you still use it." \
> +               "Without such feedback, the platform will be removed after 2022."

I don't want these to clutter up my randconfig build output, which I keep
completely empty by default. If you add an

#ifndef CONFIG_COMPILE_TEST

check around them, I'm fine with it though -- it would still catch all
real users
without bothering build-testing bots.
I think even with CONFIG_WERROR, we don't fail the build for #warning,
so that would also work in place of #pragma message.

       Arnd
