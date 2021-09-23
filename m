Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A36EC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 14:18:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0581460527
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 14:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241308AbhIWOUZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Sep 2021 10:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241532AbhIWOUY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 10:20:24 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0E7C061574
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Sep 2021 07:18:53 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id i23so17779734wrb.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Sep 2021 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lWN31N47pSgIJgUdRSmzMjOL76R+VFH6kctnLUaWXmg=;
        b=PV60LmYi6FsftDoBB4JrVLkvcwz+mfC0CUyAL8Yh2RpQCRSSCz04xYCTHE7c+A+lG+
         tOK3nqqezmNBrSWOGIAH0nAka/koxA8J9sKj0OnyhRPFZNX2GxUNiGNmEkAAgpZ91a00
         jcEQPuhGn4D3KQbwJ2dbwb0L5KdKTA05Sdaa3aA5hlc2/0GK9L2cORawYWR+X6+LjAKB
         T9UiSCJ2lwVxfON+Ad7esFVGGntuRfZtAMrLyl0Yr5UqqufEUmQEoCNj78hDrWb4OYRx
         8znM4Yr2mGIl/fp5D8Q0ErEDV7dDA+MV66PlHkmGAMk9FP7dTERvY+Gx3zSLCakawiNb
         Tz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lWN31N47pSgIJgUdRSmzMjOL76R+VFH6kctnLUaWXmg=;
        b=pmSujRkNz8dSA+UkJk95bOb1WQlfrNpW+07dMrPJr4bcWXCK4k86FMzGB5J1jnLYh1
         MHM7PeHjgC4GOqoDKIjeW5UQ4BZ9AO9Gsv4cGSxgcdkR+o0CSq6oELuCMPQJoODeThod
         5LtDYCV49KPsLuoYFexHNkMP06zuwRYxv7RrNuULMDxhAzjh3PuebYowzyjYLYUPqWz+
         3YjVKNHhextS/qgIL+wUrGZnvZBuDIDmuZUKKHuPPHq2wfokSm7IDD2Y+DAosamfHW/b
         PDXRL6XtqMkkNwaBlACeJnTabhtfQRRHfIx4m1fbV9SzmDB6esP2ngtnmnN5DGIvbFGj
         bxzg==
X-Gm-Message-State: AOAM531OsusYiT99ep6cju7CZ0GRcGJyzxZ+K4nzPCnqn45PNXSjzzSw
        hNbgIvzV88Baccpw/LciV8gTdw==
X-Google-Smtp-Source: ABdhPJxsWmEt/VdNJNMR40tDtaz4Yjgl9qWWb63ntwgx9lQD4x2yQuSr/sQhCix2pTnbjHkic8fD1g==
X-Received: by 2002:a05:6000:105:: with SMTP id o5mr5354920wrx.413.1632406731493;
        Thu, 23 Sep 2021 07:18:51 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id s15sm5595832wrb.22.2021.09.23.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 07:18:51 -0700 (PDT)
Date:   Thu, 23 Sep 2021 15:18:49 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] clk: samsung: change COMMON_CLK_SAMSUNG default
 config logic
Message-ID: <YUyMyVezyjfv1Hs7@google.com>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-2-willmcvicker@google.com>
 <a8d40b96-bcb2-5eb6-b0e5-c20c14471c8a@kernel.org>
 <CAMuHMdWdHF49qj+qV-DnbDDv14J3y98TPHd_6y_i7o7_azhErg@mail.gmail.com>
 <2c8a79f7-711a-b075-745f-ea77b82a1117@canonical.com>
 <CABYd82bzKh=QQHyk-kPXekzCKx+Uy-z2TY5qAQQNfuew=h=O-w@mail.gmail.com>
 <001cd621-53d1-fe22-0eaa-d13137827297@canonical.com>
 <YUx5uhKW/Jy2r3lv@google.com>
 <30a1d0f3-a17c-bf87-2519-542063a7a663@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30a1d0f3-a17c-bf87-2519-542063a7a663@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 23 Sep 2021, Krzysztof Kozlowski wrote:

> On 23/09/2021 14:57, Lee Jones wrote:
> > On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
> > 
> >> On 21/09/2021 19:58, Will McVicker wrote:
> >>> On Tue, Sep 21, 2021 at 1:35 AM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@canonical.com> wrote:
> >>>>
> >>>> On 21/09/2021 09:50, Geert Uytterhoeven wrote:
> >>>>> On Tue, Sep 21, 2021 at 9:31 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>>>> On 20/09/2021 21:03, Will McVicker wrote:
> >>>>>>> COMMON_CLK_SAMSUNG is selected by ARCH_EXYNOS which forces this config
> >>>>>>> to be built-in when ARCH_EXYNOS is enabled. Switch the logic to use a
> >>>>>>> "default y if ARCH_EXYNOS" to provide flexibilty for vendors to disable
> >>>>>>> or modularize this driver.
> >>>>>>
> >>>>>> The clock drivers are essential, you cannot disable them for a generic
> >>>>>> kernel supporting ARCH_EXYNOS. Such kernel won't work properly on platforms.
> >>>>>
> >>>>> Obviously it's not gonna work if the clock driver is not enabled
> >>>>> at all.  But does it work if you make the clock driver modular, and
> >>>>> put it with all other essential driver modules in initramfs?  Debugging
> >>>>> would be hard, as the serial console driver also relies on clocks
> >>>>> and PM Domains etc.
> >>>>
> >>>> The kernel could boot without clock drivers (default settings from
> >>>> bootloader), probe clocks from initramfs and proceed with rootfs from
> >>>> eMMC/SD/net.
> >>>>
> >>>> In theory.
> >>>>
> >>>> However I have no reports that it ever worked. If there is such working
> >>>> upstream configuration, I don't mind here. Just please explain this in
> >>>> the commit msg.
> >>>>
> >>>>>
> >>>>> If not, this patch should be NAKed, until it works with a modular
> >>>>> clock driver.
> >>>>>
> >>>>> If yes, perhaps another line should be added (_before_ the other line)?
> >>>>>
> >>>>>   + default m if ARCH_EXYNOS && MODULES
> >>>>>     default y if ARCH_EXYNOS
> >>>>>
> >>>>> However, many developers may want MODULES=y, but not want to bother
> >>>>> with an initramfs.  So perhaps we need a new symbol
> >>>>> MINIMUM_GENERIC_KERNEL or so, protected by EXPERT, and make the
> >>>>> driver default to m if that is enabled?
> >>>>
> >>>> Yeah, that's indeed a problem to solve. For most users (and distros)
> >>>> building kernel for Exynos this should be built-in by default.
> >>>>
> >>>> Anyway, the option is non-selectable so it cannot be converted to "m" or
> >>>> disabled. And this is claimed in the commit msg:
> >>>> "provide flexibilty for vendors to disable or modularize this driver."
> >>>>
> >>>> The commit does not achieve it.
> >>>>
> >>>> Best regards,
> >>>> Krzysztof
> >>>
> >>> Thanks for the reviews! As Lee has explained in his replies, the
> >>> intent of this series is to provide config flexibility to create a
> >>> defconfig that allows us to move out SoC specific drivers in order to
> >>> create a generic kernel that can be used across multiple devices with
> >>> different SoCs.
> >>
> >> That's quite generic statement... or let me put it that way - we already
> >> have this ability to create a generic kernel supporting different SoCs.
> >> Exynos and other ARMv7 and ARMv8 platforms are multiplatform.
> >>
> >> Task is done.
> > 
> > multi_v7_defconfig and ARMv8's defconfig are bloated monoliths which
> > provide limited flexibility.  Good for testing and messing around -
> > not much good for real products.
> 
> I am not saying about defconfigs. I am saying that ARMv8 platform is
> multiplatform so we already solved the problem Will mentioned. :)
> 
> > 
> >> Please be more specific about use case and describe what exactly in
> >> current upstream multiplatform kernel is missing, what is not
> >> multiplatform enough.
> > 
> > The use-case is GKI.  A realistic middle-ground between fully open
> > source and real-world usage of the Linux kernel in a competitive
> > technical arena.  GKI aims to be as close to Mainline as possible,
> > whilst allowing hardware vendors to supply their own software
> > containing their perceived competitive edge and/or supporting
> > not-yet-released hardware platforms.
> 
> <grumpy mode>
> Therefore the use case is to not contribute anything upstream around
> ARCH_EXYNOS but use it in millions of devices downstream with hundreds
> of out-of-tree modules. The use case is to make life easy for the vendor
> and out-of-tree code, not for the upstream. Instead of promoting
> upstreaming, or leaning towards usptream in some balanced way, the use
> case is to entirely go to out-of-tree.
> 
> I am not thinking here about edge or not-yet-released platforms but
> "ancient" in terms of current SoC business, e.g. 3-5 years old.
> </grumpy mode>
> 
> > 
> > If you end up over-constraining the ability to configure the kernel in
> > useful/meaningful ways, that makes one of the main (best intention)
> > aims of GKI, (i.e. to have an upstream first ethos in order to be as
> > close to upstream as possible) much more difficult.
> 
> GKI encourages core kernel changes to be upstreamed but it is
> effectively the nail in the coffin of upstreaming vendor SoC changes.
> There is simply no incentive for less-cooperative vendor to upstream
> it's modules (except usual benefits like code quality and user support
> which are not important for less-cooperative vendors).
> 
> The kernel should be configured mainly towards mainline platforms. Not
> the other way around. This of course does not stop it for supporting
> out-of-tree code, but I guess you also know that what's out-of-tree, it
> does not exist. :)

I'm not sure you've thought the above points through. :)

How is that any of this different to Mainline?

So long as you have the headers for the kernel you wish to compile
against, you can create all the new modules you like in both cases.

> > I put in a lot of effort to ensure GKI doesn't end up as just another
> > fork of the Linux kernel.  So far, so good, but flexibility and
> > understanding is key.
> > 
> >>> I'm sorry I added confusion by mentioning
> >>> modularization. All of these drivers that I am modifying in this
> >>> series can be modularized which is an ongoing effort, but is not
> >>> addressed here and I don't believe that modularizing them should be a
> >>> requirement before supporting enabling/disabling them.
> >>
> >> Since the disabling the driver for a kernel supporting Exynos does not
> >> make any sense, then making it at least modular unfortunately it is a
> >> requirement.
> > 
> > I can go with that.
> > 
> >>> I will update the series with my patch that refactors the Samsung SoC
> >>> drivers menuconfig to make these visible as well.
> >>
> >> I would first recommend to really describe your use case because my
> >> questions about this are still unanswered.
> > 
> > Hopefully my replies have helped somewhat.
> > 
> > Happy to discuss further if required.
> > 
> > If all else fails, feel free to ping me on IRC (lag).
> 
> Thanks Lee, you described the use case. In general I like it and support
> it, except for what I wrote in the other mail.
> 
> Vendor does not contribute much therefore there is no balance in
> upstreaming. Since none of other vendor's platforms are supported, I am
> looking only at what is supported. From that perspective - the change
> proposed by Will and previous guys, does not have much sense.
> 
> My perspective probably would change a lot if vendor did contribute some
> of its non-edge platforms (3-5 years old)... especially that unlike few
> community guys (e.g. PostmarketOS), vendor has shit-tons of money and
> the hardware manuals. :)

But no incentive to upstream code old (dead) platforms that they no
longer make money from.  We're not talking about kind-hearted
individuals here.  These are business entities.

What is the business incentive to put hundreds of thousands of dollars
into something with no RoI?

> Instead of pushing this change, please let's give some incentive to the
> vendor for upstreaming anything.

Again, you're being specific.  We would also like/need to make the
same kinds of changes to other vendor configurations.  One's which do
contribute significantly at their own cost.

The technical reasoning cannot be different because you do or don't
like the way the company operates.  Try to detach a little from
your feelings during discussions which should be purely technical.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
