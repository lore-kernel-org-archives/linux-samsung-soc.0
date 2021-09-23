Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B007C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 13:41:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FE2B61216
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 13:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241460AbhIWNm4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Sep 2021 09:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241400AbhIWNmw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 09:42:52 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F894C061756
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Sep 2021 06:41:20 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id u18so17360237wrg.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Sep 2021 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=n97jpOwzjyhCoVd9vlltvxz5/0o39tZOmH5FNWRSBJA=;
        b=ZjHBaTJuf7gbFODWJS2c/ERmfonZHKL4RfRXUpmt8NBJ65B7qDMuRvqLAiKbTnNqM7
         UrJ7cktyoA+BPLAYVY+Yjvs2Hp9aqMxT/zX5lTofiqmrK874ro0T9pLu/+m06irUWk+p
         I4rGovrBxoQdIrkdsQZH9AVOFBC2EdhrqcQvBXSmAvkk1Oei2P9IVkTeoHHADplDd9/M
         BWOHIejmqvmbkOsIYz/9busjx2sj1Y57ERVuA50pwROMMEhbcwvdlO0lmT7CATfXB2Rv
         2HLIzEbt97SzVsJFdqpGRvm6Ttzb6RKdE+npeRHfK5PWVELHXV4jEuk3JSpdlmvYI1+k
         a3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=n97jpOwzjyhCoVd9vlltvxz5/0o39tZOmH5FNWRSBJA=;
        b=zkwxs5eSsMCMQ8PDKwUP6TOX52f6hCEek+XJOFaTUcIqA5oTqucLyHuP2IrUbnaJlV
         GOjBIpf+CiPOGRsHi77hSrYfXbXtFTVbTIxBfOEWM5KwYHOOBHd1aLnc87E2ewECjcuh
         23BiPMQeYDUw6hBZ15uhkEfiFXyimnl7jja/6RStBfRYE+0i6mH/c0jX/JYKGSMQlIJT
         57nmaCkWGJRmNGeFOYGX2pu+t2/4WYDKmFpWt0Qn+np8UiFyfAyRheLDAjJqDKNVNEiY
         e/38MB5KYC5pYBnJtbUIlLEOeQdVkxq2n0LbEkA1p1mwrDtCv1tCbu629jhfQtDrA0gG
         Ctww==
X-Gm-Message-State: AOAM531hp+plwmnVU5zf3jeU8GUxKBMCZHX+gs3QqwUkg5wDVDD0XXfq
        2e0EkA7DtYxpA1H7llatK+omvw==
X-Google-Smtp-Source: ABdhPJx54k5rpYcwfEIU6k1OIBDHGX2hwSJH+SOIv2BKzor88w1+CXllOr7IYfNuaqMe41u/KvK3Dg==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr4644942wmf.154.1632404478608;
        Thu, 23 Sep 2021 06:41:18 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id y18sm5278650wrq.6.2021.09.23.06.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 06:41:18 -0700 (PDT)
Date:   Thu, 23 Sep 2021 14:41:16 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1 2/4] soc: samsung: change SOC_SAMSUNG default config
 logic
Message-ID: <YUyD/AxIVw+mbxSP@google.com>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-3-willmcvicker@google.com>
 <2b48a41a-9130-b4cc-40d3-0bc7930ac76a@canonical.com>
 <YUmVj80m/rEC2mT7@google.com>
 <CABYd82a4OwxHNUUmUtBmTpSvWLu-f4sepHMF49kPQtWLU3MkDA@mail.gmail.com>
 <ad2de848-8fce-f275-25de-83a886243645@canonical.com>
 <YUx1c/xZ+nP5aI+X@google.com>
 <db808138-e839-48d8-26e7-659cc9950163@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db808138-e839-48d8-26e7-659cc9950163@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 23 Sep 2021, Krzysztof Kozlowski wrote:

> On 23/09/2021 14:39, Lee Jones wrote:
> > On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
> > 
> >> On 21/09/2021 19:45, Will McVicker wrote:
> >>> On Tue, Sep 21, 2021 at 1:19 AM Lee Jones <lee.jones@linaro.org> wrote:
> >>>>
> >>>> On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
> >>>>
> >>>>> On 20/09/2021 21:03, Will McVicker wrote:
> >>>>>> Switch the default logic to enable SOC_SAMSUNG and it's sub-configs to
> >>>>>> be enabled by default via "default y if ARCH_EXYNOS" versus being
> >>>>>> selected by the ARCH_EXYNOS config directly. This allows vendors to
> >>>>>> disable these configs if they wish and provides additional flexibility
> >>>>>> to modularize them in the presence of a generic kernel.
> >>>>>
> >>>>> This is not true. Vendors cannot disable these options as they are not
> >>>>> visible.
> >>>>
> >>>> Good point, well made.
> >>>>
> >>>>> Although I understand that Arnd prefers this way and I do not
> >>>>> object it, but your explanation is incorrect.
> >>>
> >>> Thanks Krzysztof for the reviews! I'm sorry I missed the whole "hidden
> >>> configs" part. I'll upload the series to include the fix that refactos
> >>> the Samsung SoC drivers menuconfig which will address that and allow
> >>> one to enable/disable those configs. I'm going to hold off though
> >>> until we hash out the rest of the discussion in the cover letter
> >>> email.
> >>
> >> No, please first read our discussions, including Lee's and Geert's
> >> comments. The drivers should not be converted to modules or made visible
> >> if such configuration does not work. If it works, please describe your
> >> testing setup.
> > 
> > Modules *should* work.  William is going to try it out.
> > 
> > Might need to lean-on for some testing on different H/W though.
> 
> I can help, few other folks from Samsung can help as well.

Thanks.  I'd really appreciate it.

> >> All these drivers are *necessary* for a multiplatform kernel supporting
> >> Exynos platforms, therefore disabling them does not make any sense (if
> >> you support Exynos platform). If your kernel does not support Exynos
> >> platform, just do not select ARCH_EXYNOS and problem disappears because
> >> none of these drivers will be visible and selected.
> >>
> >> Unless you describe here some out-of-tree kernel which wants
> >> ARCH_EXYNOS, because vendor did not upstream it's code, but you do not
> >> want existing Exynos upstream drivers. We do not support such
> >> configuration. Please push your lovely vendor to work with upstream.
> >> That's the only solution.
> >>
> >> It's the third time this abuse re-usage of ARCH_EXYNOS appears and the
> >> same as before - the vendor does not like to upstream stuff. There are
> >> few guys trying to upstream recent Samsung SoC support by themself (ping
> >> me for contacts if you would like to participate) but the one party
> >> which should be doing it - the lovely vendor - does not actually
> >> participate and instead sends ridiculous patches like this one here...
> >> or like this [1] [2].
> >>
> >> Nope, please work with upstreaming SoC support, instead of abusing
> >> ARCH_EXYNOS for out of tree code from the vendor.
> > 
> > One of the on-going issues that GKI aims to solve pertains to the
> > disparity between what upstream engineers would like to be upstreamed
> > (i.e. everything) and what vendors can upstream (i.e. most things).
> > 
> > The old Open Source vs Business (i.e. products/real-life) struggle!
> > 
> > Vendors are not able to upstream all functionality right away, as it
> > would give away their perceived edge on the competition (i.e. other
> > vendors).  This is something we just have to accept as it will *never*
> > change.
> 
> Sure, I understand. Balance, compromise, not perfectness.
> 
> However now it is heavily in-balanced since vendor did upstream only one
> change - UFS drivers for new SoC - since 2017. One change. Nothing else,
> nothing for older SoC, nothing for newer.
> 
> All other work is done by the community, not by the vendor.
> 
> Not sure how to qualify Sam's Exynos850 work, but even if counting it,
> there will be just two changes from vendor.
> 
> This is not acceptable, this is not a balanced approach.

Completely understand.  Been there, got frustrated by that!

However, GKI is your friend here, since it operates an upstream-first
philosophy.  Samsung would not be able to utilise GKI if its platform
wasn't supported by upstream.  Regardless of who did the work, (not my
concern at this point) the platform is supported in Mainline.

Volunteers (including Linaro) do a bunch of upstreaming on behalf of
vendors, including some of the very largest/most successful.
Sometimes that just the way it goes - try not to take it too
personally.

> > GKI attempts to solve this issue by providing a generic core
> > containing all of the elements required to get every supported
> > platform bootstrapped to a point where modules can be loaded and
> > additional functionality can be brought in.  GKI provides all of the
> > modules available from the upstream kernel BUT allows them to be
> > overwritten/swapped-out by modules containing code (new/shiny
> > unreleased value-add) that the vendors do not wish to share (yet).
> > 
> > Clever, eh!
> > 
> > As I've explained before, the trigger for all of this was
> > SERIAL_SAMSUNG which is required for early console on supported
> > Samsung platforms i.e. this symbol *has* to be built-in.  
> 
> Actually SERIAL_SAMSUNG does not have to be built-in. It is necessary
> for built-in only for debugging or development, not for real products.

Right.  And in the early stages, GKI is used for early (non-released)
H/W (this is also the part of the reason these differences can't be
upstreamed early/now/yet) and sometimes changes break things requiring
low-level debugging techniques to solve (inc. early console).

> Unlike other drivers which have to be built-in, e.g. clocks or pinctrl,
> or heavily tested whether setup from initrd works. Plus not breaking
> distros who like to have everything as module (solution from Geert?)...

We don't know which drivers *need* to be built-in yet.

Clocks is probably not a good example even, since the power-on default
is most likely all-on, which is fine.  Pinctrl remains to be seen.

> > In order for
> > this to built-in ARCH_EXYNOS has to be enabled due to the listed
> > dependencies in Kconfig.  And since ARCH_EXYNOS 'selects' all of these
> > different extra symbols, it means they too will be built-in, meaning
> > that a) the core binary will be unnecessarily bloated and b) vendors
> > who wish to overwrite/replace this functionality with their
> > non-shareable value-add, are not able to do so.
> 
> I am sorry, but this is not reflecting status we want to have in
> usptream. Everything selected by ARCH_EXYNOS *has to be selected* for
> supported platforms. Since vendor does not contribute anything new
> (except mentioned one work for UFS), we are not going to sacrifice
> supported mainline platforms for a non-cooperative out-of-tree unknown
> platforms.

The is the part of the discussion that is the most contentious.

Ideally we wouldn't have to enable any ARCH_* explicitly.  Greg has
mentioned this publicly on a number of discussions.  However, removing
the dependencies (from Kconfig in this case) is in contention with
other user's use-cases.  No one wants to be asked seemingly irrelevant
configuration questions during the config stages of a kernel build.

So we are forced to enable ARCH_* to have our requirements built-in
(ARCH_EXYNOS for SAMSUNG_SERIAL [early console] in this case).
Unfortunately, this comes with additional cruft that we *might* not
want (resulting in bloat) or that we wish to overwrite with more
featureful driver modules.  We can't do that if these features are
built-in.

Please don't make this discussion about particular vendors.  Bringing
in emotional feelings pertaining to specific companies or individuals
does not make for a quality level-headed technical discussion.

The principles I'm discussing here are vendor agnostic.

> > Going forward, it sounds like the best approach that will make
> > everyone happy, providing it's technically feasible, is to enable
> > these added (sometimes required, other times superfluous) symbols as
> > loadable modules.
> 
> Not entirely. What actually would make everyone happy and it is still
> technically feasible is for a multi-billion company with thousands of
> engineers to contribute something. Let's start with a little bit. From
> billions of dollars and thousands of engineers we won't expect too much,
> right?

I understand your frustration, but it's orthogonal to this discussion.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
