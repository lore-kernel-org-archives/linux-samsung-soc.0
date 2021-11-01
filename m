Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688C1C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 18:36:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E3886052B
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 18:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhKASiz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 1 Nov 2021 14:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbhKASiy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Nov 2021 14:38:54 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC858C061764
        for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Nov 2021 11:36:20 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id o26so33516001uab.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Nov 2021 11:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tO/sJOVXGu1XRctd0mIlL8N/rOf5z8jD5S9ZOoMr6sA=;
        b=frqAOxOFRbIGvADBVTuSAriUmgCHoZ/CYC5iPcTxfPHcBNFBsImfPerdak2uyfweZt
         39uELQ6rZ60s4TSuledNo8ZegjiyXUCj3YYgb9Vn8oBQjf0Pcjy/VQIzPT7g2adCx4NW
         UlTWVETRO/NM9/HnhiGzizt74td5bUjqH97mgBlr6nbecT8YmDaa2t5Uk5UvLmd6c6jO
         fbEwCWE0BB//Jkq5tGbfhuZQ6xnfgOTjzwJvyO1Hd+kCP9pTyyVBAJWGL0xcSwbZ4pIr
         PiHVD/edvPxHCyv4N1Zk6FdMdkfGOr/3c4nnqksYNtcRCnE5u7jHNBfux+M80GI4gzr5
         BEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tO/sJOVXGu1XRctd0mIlL8N/rOf5z8jD5S9ZOoMr6sA=;
        b=ae+AA5sYdZ+ci2y7N4g7DFct/6LCPI3PRcBq1C1EfozuLzLtVQfFofx6NGQpuxOooL
         MaxI1PyG/zVJL1BMdhF/m9K7y5E/HCIvb9rkclloNjiyYSacn+He2opquZoVfSMVTkUC
         SBgNhNNS9Mq5QvDidXBskgS/e+tYIFSmNz6QFzQGTxN8o9R4rWNpTUy0d1sigRVj6ink
         9sf4EGk+gvYzPQSHjrznBHozg0VpSi0qwj39HItJtGV5Q194Hxz1rf5fZHaPe38BULd7
         sSwunT+WLXtLjBFcRD9YeWXJsCw3ri0GTUrtcgnVm8tdEJ3VwGOscAbz1zlI9GTUIGAT
         GRmw==
X-Gm-Message-State: AOAM530aigrVAOskVYzeTUQflMpnCFAI3gQK+PbQuL8xGOWdx1Dsr2p7
        4Q7trzpYnmTZN/xPKghEJLcFbzKbNIA4W6ycV68JQw==
X-Google-Smtp-Source: ABdhPJxxjq8c8R6Qdvb63KamFUYIe0D4384RONh+9u++oFlaAHmRLO/1rp4h+nDtz1lq4Qr2SJUpuqnEc0NneC7ZWow=
X-Received: by 2002:a67:1781:: with SMTP id 123mr31610936vsx.1.1635791779839;
 Mon, 01 Nov 2021 11:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211026115916.31553-1-semen.protsenko@linaro.org>
 <8b3466f1-2b16-80ca-79c7-577860fc90aa@canonical.com> <CAPLW+4=YizLzdiZ1mdCGxvPCTYhNjeiomO=q=4Xk-ZxqqH++nA@mail.gmail.com>
 <CGME20211028143524eucas1p16f240d8bc7e0d2c677fc54afde45957b@eucas1p1.samsung.com>
 <e01b0072-008a-c83d-59b2-2174860c00fd@canonical.com> <d4398079-e512-e75b-92e9-51d590d8c240@samsung.com>
 <CAPLW+4kKBXiwQF4qPTA04WCDb3PY365OORV4brtFxmQbSBxL8A@mail.gmail.com> <c888fc5e-4698-333f-6922-8b53f3efbe36@samsung.com>
In-Reply-To: <c888fc5e-4698-333f-6922-8b53f3efbe36@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 1 Nov 2021 20:36:07 +0200
Message-ID: <CAPLW+4kw-fz2=Hkhy-tJBOXW7j=Ok1GwUHAsZB2Bc53Uj+qzYg@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: Enable MCT timer for ARCH_EXYNOS
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
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

On Fri, 29 Oct 2021 at 16:36, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 29.10.2021 15:15, Sam Protsenko wrote:
> > On Fri, 29 Oct 2021 at 14:38, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> On 28.10.2021 16:35, Krzysztof Kozlowski wrote:
> >>> On 28/10/2021 16:22, Sam Protsenko wrote:
> >>>> On Tue, 26 Oct 2021 at 17:03, Krzysztof Kozlowski
> >>>> <krzysztof.kozlowski@canonical.com> wrote:
> >>>>> On 26/10/2021 13:59, Sam Protsenko wrote:
> >>>>>> Some ARM64 Exynos SoCs have MCT timer block, e.g. Exynos850 and
> >>>>>> Exynos5433. CLKSRC_EXYNOS_MCT option is not visible unless COMPILE_TEST
> >>>>>> is enabled. Select CLKSRC_EXYNOS_MCT option for ARM64 ARCH_EXYNOS like
> >>>>>> it's done in arch/arm/mach-exynos/Kconfig, to enable MCT timer support
> >>>>>> for ARM64 Exynos SoCs.
> >>>>>>
> >>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>>>>> ---
> >>>>>>    arch/arm64/Kconfig.platforms | 1 +
> >>>>>>    1 file changed, 1 insertion(+)
> >>>>>>
> >>>>> +CC Marek, Marc, Mark and Chanwoo,
> >>>>> Looks like duplicated:
> >>>>> https://lore.kernel.org/lkml/20181018095708.1527-7-m.szyprowski@samsung.com/
> >>>>>
> >>>>> The topic stalled and I think this particular patch did not make sense
> >>>>> on its own, without rest of changes from Marek. I am not sure, though...
> >>>>>
> >>>> Krzysztof, Marek,
> >>>>
> >>>> That series looks nice, I'm quite interested in that being applied. Do
> >>>> you think I can do something to help with that (e.g. rebasing,
> >>>> re-sending on behalf of Marek, testing on Exynos850, etc)?
> >>> I think there were no objections against v4 of this patchset, but
> >>> somehow it wasn't applied.
> >>>
> >>> Marek,
> >>> Does it make sense to try respinning your v4?
> >> I think I've abandoned it, because I got a final NACK on the arch timer
> >> change (support for 'not-fw-configured' timers). Without that the above
> >> mentioned changes doesn't make much sense.
> >>
> >> I know that the Exynos5433 firmware breaks the defined protocol, but on
> >> the other hand I can do nothing more than carrying internally those few
> >> patches out of tree to keep it fully working with 'mainline'.
> >>
> >> I've observed the same problem with newer Exynos SoCs, but those so far
> >> didn't get mainline support (yet), although there have been some
> >> attempts from the community.
> >>
> > There is no such problem on Exynos850 SoC (which I'm trying to
> > upstream right now), the architectured timer seems to be working fine
> > there, as is. Or maybe everything is configured properly in
> > bootloader, not sure. Also I managed to use MCT as a primary
> > clocksource (for sched_clock, etc) by disabling arch timer in
> > arch/arm64/kernel/time.c (just for the sake of test), and it works
> > fine.  So I still would like to have MCT enabled in kernel: this way
> > we can at least test the driver, as the clocksource can be changed to
> > MCT via sysfs (or by disabling arch timer in time.c). And for that we
> > need to at least enable CLKSRC_EXYNOS_MCT in ARCH_EXYNOS.
> MCT can be also set as default by changing its rating, like it is done
> under #ifdef CONFIG_ARM.
> > I guess all your patches (except one you mentioned) from that series
> > should be fine to apply. Do you mind if I re-send your patch series
> > (minus one patch) on your behalf? That would spare you some boring
> > work, and at least minimize your local delta you're carrying.
>
> Feel free to resend it.
>

Thanks! This patch of mine should be ignored then, I'll re-submit
Marek's patches soon.

> Best regards
>
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
