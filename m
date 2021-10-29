Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F24C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 13:15:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DBDF61175
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 13:15:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbhJ2NSF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 29 Oct 2021 09:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbhJ2NSF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Oct 2021 09:18:05 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2735C061570
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 06:15:36 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id e10so18053311uab.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g+Jn0Zb4XSWTtnsH7XrcWpFd+2PsMM1WYmSDBWFjSHk=;
        b=b9E/lRCvOBOQR1o3F7Fxr20iMUVtSJUqUxSOg6lRP3YmV//6oeIM13YCK+fke+bnix
         g/gii88LV1Ol2o5XiRcBIF1zdz7LNiNUU3EERvs0w4Fw75e8TzfH38xw3lE72l3P+OwA
         rh8RmIzbnE3CrIp8PKTRJ+pAfHgm6aMlFZwZ+EBoy4c877CzsdbrvddazYth9n8HKb4K
         3lU5bFpLNwATuM534+CbMr5KoLDzQtq4rikxLyka3CLMScSCnkYR+xcl/2oCN55jH8Eo
         InKF8BKDFNs8H53aXzh5N7Kd7gHP5DDx7fv9lZ9a1SnvETzyYPbpzU3dboZYmSWxXA15
         Ubnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g+Jn0Zb4XSWTtnsH7XrcWpFd+2PsMM1WYmSDBWFjSHk=;
        b=Z3OGth01KT9cgGgELPGo+mTz0mE23QZ3gpXWXjcG2DoH2/G6t2v3ukGQ1WG05RHN7j
         /ZD10AcM73LYbVtSzDpSvb2oHYov/mVpcJt7mOIeqzTPcujrSfNm/RXHAOUdytutOPtt
         Cdl+jcNN2wcv5pmgzEOIRS98/Wm+uEyD2R0dfhem387UE66umZj2m+XFaabNqvLIIQH1
         4ZLKFMH79YB52rvQTHk2sD45PimPmnDrZtwBt1DXeNrT5SjUE8MteAxL65TfeRxdKDXT
         6WwLe38Tr8max7l4wFSLBNmzHtPOM+vAs0Di8H9LM58zOuguSd1xUFOpFgoUOSgZykTA
         Avfw==
X-Gm-Message-State: AOAM531CsL8FnNZWO7iutte6YPYlPc/vLvyPEQmdzJrQCTwGsTrJOhDm
        mR5afbPWoOwvuWY0H9mZO7qZWzz9pgw2C4ZulS3K8Q==
X-Google-Smtp-Source: ABdhPJy54z6tvSJScJqF6AXYv4loNJuYfD/YEcFaxZYwl0OrIXfWSnt5RuDHqPLB8WOr+h4A+o6iGm8c/SKmN0YaQr8=
X-Received: by 2002:a67:f1ca:: with SMTP id v10mr12138135vsm.55.1635513336043;
 Fri, 29 Oct 2021 06:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211026115916.31553-1-semen.protsenko@linaro.org>
 <8b3466f1-2b16-80ca-79c7-577860fc90aa@canonical.com> <CAPLW+4=YizLzdiZ1mdCGxvPCTYhNjeiomO=q=4Xk-ZxqqH++nA@mail.gmail.com>
 <CGME20211028143524eucas1p16f240d8bc7e0d2c677fc54afde45957b@eucas1p1.samsung.com>
 <e01b0072-008a-c83d-59b2-2174860c00fd@canonical.com> <d4398079-e512-e75b-92e9-51d590d8c240@samsung.com>
In-Reply-To: <d4398079-e512-e75b-92e9-51d590d8c240@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 29 Oct 2021 16:15:24 +0300
Message-ID: <CAPLW+4kKBXiwQF4qPTA04WCDb3PY365OORV4brtFxmQbSBxL8A@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: Enable MCT timer for ARCH_EXYNOS
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Will Deacon <will@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 29 Oct 2021 at 14:38, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 28.10.2021 16:35, Krzysztof Kozlowski wrote:
> > On 28/10/2021 16:22, Sam Protsenko wrote:
> >> On Tue, 26 Oct 2021 at 17:03, Krzysztof Kozlowski
> >> <krzysztof.kozlowski@canonical.com> wrote:
> >>> On 26/10/2021 13:59, Sam Protsenko wrote:
> >>>> Some ARM64 Exynos SoCs have MCT timer block, e.g. Exynos850 and
> >>>> Exynos5433. CLKSRC_EXYNOS_MCT option is not visible unless COMPILE_TEST
> >>>> is enabled. Select CLKSRC_EXYNOS_MCT option for ARM64 ARCH_EXYNOS like
> >>>> it's done in arch/arm/mach-exynos/Kconfig, to enable MCT timer support
> >>>> for ARM64 Exynos SoCs.
> >>>>
> >>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>>> ---
> >>>>   arch/arm64/Kconfig.platforms | 1 +
> >>>>   1 file changed, 1 insertion(+)
> >>>>
> >>> +CC Marek, Marc, Mark and Chanwoo,
> >>> Looks like duplicated:
> >>> https://lore.kernel.org/lkml/20181018095708.1527-7-m.szyprowski@samsung.com/
> >>>
> >>> The topic stalled and I think this particular patch did not make sense
> >>> on its own, without rest of changes from Marek. I am not sure, though...
> >>>
> >> Krzysztof, Marek,
> >>
> >> That series looks nice, I'm quite interested in that being applied. Do
> >> you think I can do something to help with that (e.g. rebasing,
> >> re-sending on behalf of Marek, testing on Exynos850, etc)?
> > I think there were no objections against v4 of this patchset, but
> > somehow it wasn't applied.
> >
> > Marek,
> > Does it make sense to try respinning your v4?
>
> I think I've abandoned it, because I got a final NACK on the arch timer
> change (support for 'not-fw-configured' timers). Without that the above
> mentioned changes doesn't make much sense.
>
> I know that the Exynos5433 firmware breaks the defined protocol, but on
> the other hand I can do nothing more than carrying internally those few
> patches out of tree to keep it fully working with 'mainline'.
>
> I've observed the same problem with newer Exynos SoCs, but those so far
> didn't get mainline support (yet), although there have been some
> attempts from the community.
>

There is no such problem on Exynos850 SoC (which I'm trying to
upstream right now), the architectured timer seems to be working fine
there, as is. Or maybe everything is configured properly in
bootloader, not sure. Also I managed to use MCT as a primary
clocksource (for sched_clock, etc) by disabling arch timer in
arch/arm64/kernel/time.c (just for the sake of test), and it works
fine.  So I still would like to have MCT enabled in kernel: this way
we can at least test the driver, as the clocksource can be changed to
MCT via sysfs (or by disabling arch timer in time.c). And for that we
need to at least enable CLKSRC_EXYNOS_MCT in ARCH_EXYNOS.

I guess all your patches (except one you mentioned) from that series
should be fine to apply. Do you mind if I re-send your patch series
(minus one patch) on your behalf? That would spare you some boring
work, and at least minimize your local delta you're carrying.

Thanks!

> Best regards
>
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
