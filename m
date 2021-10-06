Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A9FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 13:30:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6051161075
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 13:30:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238668AbhJFNb6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 09:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbhJFNb6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 09:31:58 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30762C061749
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 06:30:06 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id 66so2879787vsd.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 06:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UrLV8lA9162y3Lq8ezBxO5g1WjobTNq21pHd09HREe4=;
        b=tN7kKFFg9UP/MYNLwIHE2JePwU333q5+xEdt6mbOfK0hbOqAnd+K8rFgOZNTJx7fkb
         z/9RmDktrO7pxyC6UuXssuZZWsCAswQDn7wn5deSg1gnvCOv8Ip5xkrdEq7CXH3sCnz5
         ZNKR/+BqPuhTAn8hLDD4fnGzeGsIFvFU0wgg00r6O4GwozDTmTHidt/Ty78CLvTvEYnd
         qhcWASimkmlcmwjQHm7yB+SxGIcUbamU/ZwNq3/UNDcl0t4YGloyPIGRooCd010An6rF
         C9foeSGVxLNd4ID+7XL0smV1L+Wx1IKChUsOwMkjGXsB7qXj8w2omU4gDE8wMEzizz/O
         7aYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UrLV8lA9162y3Lq8ezBxO5g1WjobTNq21pHd09HREe4=;
        b=PrQoGV7XaiyHu/vRnZTCCDS0evn9BvI0EOpOIN6TV2WrsX7VBYIEhDMHc8AEDW7rtJ
         SaA6Hy3ZJQd2LU9kvUL4uooc8NTrtsy8i80va1wGfRW/q5IUkhFpUHMsHlpMVkpGfcJ/
         5fSxkdfmGJrM/KpwfD2mCz8gkL9P6zOALHj5ytxjC45T0qZrsB1xs1bBiF3MjryNG1GY
         IyCrqid71O26xC0CFAvApV8QYp9g/kNrI4jGNEfQ5xFI7U6Tsaz8UudfaLRja8X0xqfC
         LY8TC3whgkXmS70nAZlGm6uV6NRCdjJDja03d5sc04Lgw82vZbD7mf4J0neeOwFJbaBV
         nn+Q==
X-Gm-Message-State: AOAM532Wb5y6o3e+Ih5GRdmgfAsQan/v2qmyGqX4whbVOC9HOUl3r0En
        CKzWT2+G5TewBzDC45NTl2wQyHjk5ihbtT3Vl87Yjg==
X-Google-Smtp-Source: ABdhPJw7Y31PK48QAwhNJ55JoS18j5NxCyEWG2Cj9aMQv6RP/Q4Nir7aL+rkCVZGbUp9DmNbSv1KECk7Zun40Hhp4GI=
X-Received: by 2002:a67:1781:: with SMTP id 123mr23972078vsx.1.1633527005116;
 Wed, 06 Oct 2021 06:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-2-semen.protsenko@linaro.org> <6ef3e9a3-77e7-48b7-cbcd-c13db50d0cd9@canonical.com>
 <CAPLW+4kexaByx0nfy3q5g9XmrYdLav7E25h8qiO4Z_zmUVbRYQ@mail.gmail.com> <16ee07a1-afa9-b258-8836-e96de84551db@canonical.com>
In-Reply-To: <16ee07a1-afa9-b258-8836-e96de84551db@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 6 Oct 2021 16:29:53 +0300
Message-ID: <CAPLW+4kq7MuF8HiY-UYvC0b8woT6G=hktJPPLD0iQ39iddmceA@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: samsung: Enable bus clock on init
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 6 Oct 2021 at 15:38, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 06/10/2021 12:46, Sam Protsenko wrote:
> > On Wed, 15 Sept 2021 at 11:21, Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
> >> On 14/09/2021 17:56, Sam Protsenko wrote:
> >>> By default if bus clock has no users its "enable count" value is 0. It
> >>> might be actually running if it's already enabled in bootloader, but
> >>> then in some cases it can be disabled by mistake. For example, such case
> >>> was observed when dw_mci_probe() enabled bus clock, then failed to do
> >>> something and disabled that bus clock on error path. After that even
> >>> attempt to read the 'clk_summary' file in DebugFS freezed forever, as
> >>> CMU bus clock ended up being disabled and it wasn't possible to access
> >>> CMU registers anymore.
> >>>
> >>> To avoid such cases, CMU driver must increment the ref count for that
> >>> bus clock by running clk_prepare_enable(). There is already existing
> >>> '.clk_name' field in struct samsung_cmu_info, exactly for that reason.
> >>> It was added in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
> >>> support for runtime PM"). But the clock is actually enabled only in
> >>> Exynos5433 clock driver. Let's mimic what is done there in generic
> >>> samsung_cmu_register_one() function, so other drivers can benefit from
> >>> that `.clk_name' field. As was described above, it might be helpful not
> >>> only for PM reasons, but also to prevent possible erroneous clock gating
> >>> on error paths.
> >>>
> >>> Another way to workaround that issue would be to use CLOCK_IS_CRITICAL
> >>> flag for corresponding gate clocks. But that might be not very good
> >>> design decision, as we might still want to disable that bus clock, e.g.
> >>> on PM suspend.
> >>>
> >>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>> ---
> >>>  drivers/clk/samsung/clk.c | 13 +++++++++++++
> >>>  1 file changed, 13 insertions(+)
> >>>
> >>> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> >>> index 1949ae7851b2..da65149fa502 100644
> >>> --- a/drivers/clk/samsung/clk.c
> >>> +++ b/drivers/clk/samsung/clk.c
> >>> @@ -357,6 +357,19 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
> >>>
> >>>       ctx = samsung_clk_init(np, reg_base, cmu->nr_clk_ids);
> >>>
> >>> +     /* Keep bus clock running, so it's possible to access CMU registers */
> >>> +     if (cmu->clk_name) {
> >>> +             struct clk *bus_clk;
> >>> +
> >>> +             bus_clk = __clk_lookup(cmu->clk_name);
> >>> +             if (bus_clk) {
> >>> +                     clk_prepare_enable(bus_clk);
> >>> +             } else {
> >>> +                     pr_err("%s: could not find bus clock %s\n", __func__,
> >>> +                            cmu->clk_name);
> >>> +             }
> >>> +     }
> >>> +
> >>
> >> Solving this problem in generic way makes sense but your solution is
> >> insufficient. You skipped suspend/resume paths and in such case you
> >> should remove the Exynos5433-specific code.
> >>
> >
> > Keeping core bus clocks always running seems like a separate
> > independent feature to me (not related to suspend/resume). It's
> > mentioned in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
> > support for runtime PM") this way:
> >
> >     "Also for each CMU there is one special parent clock, which has to
> > be enabled all the time when any access to CMU registers is being
> > done."
> >
> > Why do you think suspend/resume paths have to be implemented along
> > with it? Btw, I didn't add PM ops in clk-exynos850, as PM is not
> > implemented on my board yet and I can't test it.
>
> You can skip the runtime PM, so keep your patch almost like it is now
> (in respect to Sylwester's comment about __clk_lookup). However now the
> Exynos5433 will enable the clk_name twice: here and in
> exynos5433_cmu_probe().
>
> If you keep this approach, you need to remove duplicated part in
> exynos5433_cmu_probe()...
>

My patch is only touching samsung_cmu_register_one(), and
exynos5433_cmu_probe() doesn't call samsung_cmu_register_one(). So I
don't think there can be a problem there. Or I'm missing something?

samsung_cmu_register_one() is actually called from 5433 clk driver,
but only from CMUs registered with CLK_OF_DECLARE(), and those are not
setting .clk_name field, so my code is not affecting those either.

Real problem I can see is that I can't avoid using __clk_lookup() if I
implement that code in samsung_cmu_register_one(). Tried to do use
clk_get(NULL, ...) instead, but it doesn't work with 1st param (dev)
being NULL, because samsung_clk_register_*() functions don't register
clkdev (only samsung_clk_register_fixed_rate() does), hence
LIST_HEAD(clocks) is empty in clkdev.c, and clk_get() fails, when not
provided with actual 'dev' param, which in turn is not present in
samsung_cmu_register_one()...

About using platform_driver: as I can see from clk-exynos5433.c, only
CMUs which belong to Power Domains are registered as platform_driver.
Rest of CMUs are registered using CLK_OF_DECLARE(), thus they don't
get platform_device param. That makes it harder to avoid using
__clk_lookup() inside samsung_cmu_register_one().

All that said, I feel like correct way to implement this patch would be:
  1. Register all PD-capable CMUs as platform_driver in clk-exynos850
(all CMUs except CMU_TOP)
  2. Move bus clock enablement code from samsung_cmu_register_one() to
corresponding clk-exynos850 probe function

This way I would be able to use clk_get(dev, ...) instead of
__clk_lookup(), and that won't affect any existing code for sure. Code
will be more unified w.r.t. how it's done in clk-exynos5433, and
platform_device will be a foundation for implementing PM ops later.
Taking into account how much design decisions should be done for using
that in common code -- I'd say let's do that later, as a separate
refactoring activity.

Do you think that makes sense?

Thanks!

> >
> > If you are suggesting moving all stuff from exynos5433_cmu_probe()
> > into samsung_cmu_register_one(), it would take passing platform_device
> > there, and implementing all PM related operations. I guess it's not a
> > super easy task, as it would require converting clk-exynos7 to
> > platform_driver for instance, and re-testing everything on exynos5433
> > and exynos7 boards (which I don't have).
> >
> > What do you say if I pull that code to clk-exynos850.c instead for v2?
> > Refactoring (merging stuff from exynos5433_cmu_probe() into
> > samsung_cmu_register_one() ) can be done later, when I add PM ops into
> > clk-exynos850.
> >
> >> Best regards,
> >> Krzysztof
>
>
> Best regards,
> Krzysztof
