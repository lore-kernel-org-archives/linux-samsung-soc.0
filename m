Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7657C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Nov 2021 20:14:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8272961058
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Nov 2021 20:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235014AbhKFUQs convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 6 Nov 2021 16:16:48 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:50587 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233450AbhKFUQr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 6 Nov 2021 16:16:47 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MJm8N-1n3Szt0MrR-00K50N; Sat, 06 Nov 2021 21:14:04 +0100
Received: by mail-wm1-f54.google.com with SMTP id c71-20020a1c9a4a000000b0032cdcc8cbafso8833989wme.3;
        Sat, 06 Nov 2021 13:14:04 -0700 (PDT)
X-Gm-Message-State: AOAM530r9MDoe7IEQGPPfj0ehB3eA3xqLPV/Svd21mRgZcnKm0d1gucz
        NPn6ZTU+GYilmDNl6PZNxRQrkSRMBageDy6w9Lw=
X-Google-Smtp-Source: ABdhPJx2b7CI98WRD0rAAEdo1HKxy9i2uBVWZl83alUhBfVIWCeQyFYst1M/z75cIXhVEij7b8+WEncj4WeKS5OT9eg=
X-Received: by 2002:a05:600c:2107:: with SMTP id u7mr20411429wml.82.1636229643722;
 Sat, 06 Nov 2021 13:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
 <c4bcafd0-f614-78c8-4d72-5d2b672f7e32@free.fr> <08c8f447-dcae-83b4-e5b3-a13704a5b158@canonical.com>
 <4062510.I3n91tvSNF@diego>
In-Reply-To: <4062510.I3n91tvSNF@diego>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 6 Nov 2021 21:13:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Pg8CkXgN8YNhp2U5Kgwf08kQGpLeTsyWKgNpGChC4uQ@mail.gmail.com>
Message-ID: <CAK8P3a2Pg8CkXgN8YNhp2U5Kgwf08kQGpLeTsyWKgNpGChC4uQ@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: s3c: mark as deprecated and schedule removal
 after 2022
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Cedric Roux <sed@free.fr>, Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Sam Van Den Berge <sam.van.den.berge@telenet.be>,
        Lihua Yao <ylhuajnu@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:xJK477YiYTHh/GjItTFmXQ0pBloRQThOtqQKT14YuAFzyci2SEM
 TU2wPz1+fkgRUwVRWxDDKKmr6I8bM8VrRkfNq/VvEKYGW5DUb7qbk3T1T/v+NmjM1SfAsTU
 SOXS1xGxD3X0itYw8HdtVr4Q49HI7hNKuHMzxh1f81Is/74+3R/KmuJsSQgy6LCjER+tdIk
 9RoTQsztKc7k7dMcES+mg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X+/yWRsxneU=:LpFHi9m3bDsPqwh8X6BY+q
 5XnK3a3sCJ8tVehR7UJWLVtZwkQA7Jk7gjsF1RTqX113DrZJsVVmGFSk8HkUWxQYjJVSZKtAq
 jS5kZPZRi+Ltz+yrDsB9FzXpUB8STjAB4KK+3XCNkP6vQTpDNLnLHJl26SdMyi18ouvnsrrnz
 ZfBdDxZobP+ypMYFtYnOrCmVL0u52SCQKMWO5cYC1kVRqUeFw9IE861f+7frxOCJgblrBJYQv
 7EnyeBsH2aB1kk3COt86x/1v1MdO5Bx1m7ILoewHQxh4I67+fcjoZlAop5yqrwf0gyxxgHBM1
 Su5e2+Ce68n2BC7CgZ5CqkDQI+rwYtytlsyT+YG0IKATI+VOvgpdtAjUx6sOiQzJV4OKfbng3
 LBR0hnXCnPbLDHpAQ9xdrDTXN+OrlR9xmrN+xmWu+fgTpk+ZVGCDTph7GbFvVIdvsyrXjbwh9
 iUNa6pk7wvVdLyFttbTlDoqchm9av7/4JYmj+K6jino+exhJPIPfRncL++BqX/nRVzbr9IUG9
 HZKXHwjc0rKsxFYKWHCR8Yl+BxQAH0f6igrVnBikwDh5ok7PVSKHQTlu6rjNw6Wa9Y40jI5a9
 mMEc0oKCNLciEzywbKr4UbPAJ/mUOgA5Qyq8xsHpDwqCaJqzZSOz5r/eyjOS6l1DmPJRODHLP
 ZJcjkxkkf4pIfVrzyZ9PuxGGfLPgbGnRa33sBKWkk+4yZM3VEXt9FUVPZG9wLPILlaEh9DqY4
 Z9oXHeLbsmTq8flFnyn5Rqq7AoT8xfxbLAG9f1ZqjSW3Ihv2FzidMd/P6qm/SxauN4Y1n7t1z
 K4AhNolNRnXlDeVTz1uL8jS6ryo3YHH9i9bzTXV0o9eEJp8oS0=
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Nov 6, 2021 at 8:33 PM Heiko Stübner <heiko@sntech.de> wrote:
> Am Samstag, 6. November 2021, 19:20:05 CET schrieb Krzysztof Kozlowski:
> > On 05/11/2021 18:49, Cedric Roux wrote:
> > >
> > > Anyway, there is at least one s3c2440 server on Earth powered
> > > by the linux kernel. Now you know! :)
> >
> > Thanks for coming back! We will see how much of feedback we gather.
>
> I do believe all (or at least most) of s3c24xx could run with a devicetree
> base with core peripherals enabled.
>
> So one possible alternative way could be to just deprecate (and then drop)
> all the board-files + their platform-data parts in mach-s3c.

Yes, and this would be similar to what we've done for mach-imx and
mach-omap2 in the past.

However, I think the Cragganmore/Speyside board that Mark mentioned
is not in the category of easily converted machines, so leaving only the
DT-enabled machines around would not help him.

If this is actually the case, one other possibility would be to remove
all the board files except for that one, in the hope that the transformation
(even a partial one) to DT becomes easier when there is no risk of
breaking other machines.

        Arnd
