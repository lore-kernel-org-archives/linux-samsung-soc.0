Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F479C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 15:36:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 300426109D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 15:36:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhKBPjZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 11:39:25 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:40441 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231911AbhKBPjY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 11:39:24 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N45th-1mYxc12VYv-0103aD; Tue, 02 Nov 2021 16:36:48 +0100
Received: by mail-wr1-f46.google.com with SMTP id d27so15995035wrb.6;
        Tue, 02 Nov 2021 08:36:48 -0700 (PDT)
X-Gm-Message-State: AOAM532QAeTlaIqCNH31kLvWFnE9FdTEyqr1/jnX9OdthmyZsKo7QqVl
        nR8+S+gF64ZIHr0vt3evZWdhR58bCjoFicjzBoE=
X-Google-Smtp-Source: ABdhPJyFKOfRqhd75a+W+sW2HO7LeKfPQjRuHDjKYWynSB0Dbok1mAHYJvCIj1wm+jFO5p+NtTMlBn87RTuivMg+2qc=
X-Received: by 2002:a05:6000:10cb:: with SMTP id b11mr36126749wrx.71.1635867408110;
 Tue, 02 Nov 2021 08:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
 <CAK8P3a0KqS-OZoo46ajfaXw1aFXR9HouW2ZezKRWCawMa7yuGA@mail.gmail.com> <ee51e10d-0fbf-d87f-aa98-a95d97a7e437@canonical.com>
In-Reply-To: <ee51e10d-0fbf-d87f-aa98-a95d97a7e437@canonical.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 2 Nov 2021 16:36:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0J2Md=TefT6ZoiXqP2=tpma+JSfZ3UYmUZKRMNXLh2ig@mail.gmail.com>
Message-ID: <CAK8P3a0J2Md=TefT6ZoiXqP2=tpma+JSfZ3UYmUZKRMNXLh2ig@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: s3c: mark as deprecated and schedule removal
 after 2022
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
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
X-Provags-ID: V03:K1:4ws8VumK4vssSHEzxcjBz8l8o2S15+TrZ8eVSNY6jZa8T7viBa1
 CbHUW7d7QzXuhGfPrnNl+b/ZODi+p5mka70RXdS1O90IjdyW1ybfmCrxOwAh9OjdNbmzo/h
 ohbetyuD9/TeUX6w5Pubw2MaowBnyGcx28QRhWZMvaQvi1d0/aZzp1VnjQs9GbawjneDWZt
 BweSNusmXgK+S2ncEOOUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RaT5ij0x6zE=:LwniGRe8hNx7NpVdN9ojxO
 hWRKN5O4EfvfqR8OqmNBLGWxji1Z/mXKoQRobEn5DF5nrTjWZuo0oxSo3S0V00f+fojYDGSyC
 c5f7mbPsCOYR1cS4PAwqZLmkNWUFrgS/1slCHCMKCkZ/URR6GEtGzRJDsBi9Lx3ZLHdzl0Y5c
 c7dI/g1PAh3fBlJlv1KYDCznpMHZZZ/s90wQfX3xCXjKX+erNqTXpHPfQCbSSbnKlfHBVFByG
 tJQYOtK/LyF1K4gPQUbVo2W2ugFAmkXN4Fc95k0t+uQpD7Ed49UWl0IDRHgyzkq19LCsfhOUc
 loT2tAu+Kgfl/mANw30VqMBfIpDrPI5p9XPRTL+gcumdS/iCm7RyWfCfDtDvWtR3ysD6z23A7
 aFBKCFeG9f3ILwRKOVmTwYyr4uAyT1+yTrEuS/TkrGTi48C0nANywz8rWDcXt9jjqHVDumk8z
 xbxG75fuLYmuSwLgd2DBV6hE10o+p4AQ0HnIhllB3al1cWtExfhMd4gjxDDngc/YFMcL9pmsJ
 xxkxZ1/l4gpY3aSUc16t0TPPftT9A+POIlDN2dD9d0BkcN8d9tNVha2IcRjSGjWpSBMLo5zYu
 Tm1uRSqGKl3njrxBYyWZwgrMo23JtdSd365m1ReweSxl7LhFey2KMwccVPeWau4xgRGVDMRl1
 okzVWX0DfT9YOCAkIPzl3vhuu4oclF4YgsMb1d5TRQe20Sb7pk/uwyWbs2PW+gTC3JGftbMpO
 KTzhcpPdPSikOEbGQTKEOH20IbCp4cbvS82P5Xn8XuXUZJzvFw/mIBUudsOKdaqk/mKKVXBo7
 qtsp8deeHqIq2WRo9ClL/e9F6MB5kpPt7JhVP1VXYyT/Ag9NX8=
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 2, 2021 at 3:55 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 02/11/2021 14:05, Arnd Bergmann wrote:
> > On Tue, Nov 2, 2021 at 12:05 PM Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> >
> > The ones that would help the most in removing are probably omap1,
> > pxa, and the strongarm-based platforms: those have a lot of special
> > cases in the code base. At least a year ago the maintainers wanted
> > to keep those around, but maybe the 2022 LTS kernel is a better
> > time for planned EOL.
>
> If the maintainers or users expressed wish to keep them alive, let's
> keep them. In fact there might be some industrial machine working for 20
> more years...
>
> If you did not receive any feedback about your queries, I am happy to
> add similar deprecation-warning notes to these as well. Just let me know
> which one should be affected.

There are definitely platforms with long service life, such as ep93xx
or ixp4xx, both of which are actively being worked on. For the other
ones, I think it worth asking again every other year or so, either for
modernising or dropping them in the long run.

> > check around them, I'm fine with it though -- it would still catch all
> > real users without bothering build-testing bots.
>
> I like that idea, I'll use it in v2. No one really should build a real
> config with COMPILE_TEST and I want to nag and find the real users.
>
> > I think even with CONFIG_WERROR, we don't fail the build for #warning,
> > so that would also work in place of #pragma message.
>
> It fails, I tried it. That's why #pragma.

Ok, #pragma with #ifdef is fine then.

       Arnd
