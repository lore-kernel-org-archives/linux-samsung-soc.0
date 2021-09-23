Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41295C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 12:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3044A61090
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 12:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241103AbhIWM7G (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Sep 2021 08:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241014AbhIWM7G (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 08:59:06 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E574C061757
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Sep 2021 05:57:34 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id w29so16871974wra.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Sep 2021 05:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IFhO86zUCGeR+R0X9HVERqTznoNeBD84llm7FMDDqNs=;
        b=aCI79VzTHBk0a6kt1kOIvS16kB6nPZXPZOmG/HGbBVrN7PuuR8bn148nWKg2/KHoMY
         g98qg7Yxi+xv2TGfww0sdIiDmDtnEvgJjLo4wTfFK5/egbhiNCgeyauYrKoyDKK5VCsl
         2eaFEdJSdgNsKntpCCPjxrWn1yS4uSBOx8pcn335bHUP9s1Up4N2OXxgfejgicgfKM4E
         YIVVXcUKZWS8paAStrOs4HldG/v2qly8OzZV9URbqfbMcKxBz80nafYfKKfMntjEygCM
         tMn8+LOMclBlAiy4a/geGdjnuUnzdqQt5xajRKAW/o1UK6OrCyycQIHf/vDGVtWuuUf5
         fSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IFhO86zUCGeR+R0X9HVERqTznoNeBD84llm7FMDDqNs=;
        b=aNaUj+1LORGCjJdwDt1jUn9G0YnChgvWGbGNrtgvwr1PYvvhBIEVaztRq0mO10wTYz
         Qp+ck8Ey2R5laeUBsvWp6Ixixmm18/Y3PV7K+30Sr+ytAfao+YdN9Qg4tI8fXsezd4xH
         7T5EKXF6g5vd145aJyi0TEFmJAXGeFDWfq3rwCB4qne3vP749QA2ipdUHZTV379R5gys
         aQ27jUHI6GYlXg5fBebGWKjDXexe8Aj0WCcJwz5WBZFGQo9D6KZd4Cj0+bysFQWqRSPR
         cSW+xaLWKR0+snbxgfkCZ0vBB52KuMAkgoo1MD74EFtIy5SJnNUnwPDJDjD5SnrZ7sCU
         u60g==
X-Gm-Message-State: AOAM531CZUXYFCpuRnEb4adenPDhh5fIwuc4O79DKfI8p79Fe5HcI8F2
        42erURqAIo68OOQ7Q8c4k11wAQ==
X-Google-Smtp-Source: ABdhPJzQKziCrP9k7CIpXN9PnCt6ZFzrhJV04VjcgNhAK65kzUVlIusnHrcjdn2rR7bC7xaKs5IE6Q==
X-Received: by 2002:a05:600c:225a:: with SMTP id a26mr4490670wmm.57.1632401852963;
        Thu, 23 Sep 2021 05:57:32 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id o17sm5204049wrj.96.2021.09.23.05.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 05:57:32 -0700 (PDT)
Date:   Thu, 23 Sep 2021 13:57:30 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Message-ID: <YUx5uhKW/Jy2r3lv@google.com>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-2-willmcvicker@google.com>
 <a8d40b96-bcb2-5eb6-b0e5-c20c14471c8a@kernel.org>
 <CAMuHMdWdHF49qj+qV-DnbDDv14J3y98TPHd_6y_i7o7_azhErg@mail.gmail.com>
 <2c8a79f7-711a-b075-745f-ea77b82a1117@canonical.com>
 <CABYd82bzKh=QQHyk-kPXekzCKx+Uy-z2TY5qAQQNfuew=h=O-w@mail.gmail.com>
 <001cd621-53d1-fe22-0eaa-d13137827297@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001cd621-53d1-fe22-0eaa-d13137827297@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:

> On 21/09/2021 19:58, Will McVicker wrote:
> > On Tue, Sep 21, 2021 at 1:35 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
> >> On 21/09/2021 09:50, Geert Uytterhoeven wrote:
> >>> On Tue, Sep 21, 2021 at 9:31 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>> On 20/09/2021 21:03, Will McVicker wrote:
> >>>>> COMMON_CLK_SAMSUNG is selected by ARCH_EXYNOS which forces this config
> >>>>> to be built-in when ARCH_EXYNOS is enabled. Switch the logic to use a
> >>>>> "default y if ARCH_EXYNOS" to provide flexibilty for vendors to disable
> >>>>> or modularize this driver.
> >>>>
> >>>> The clock drivers are essential, you cannot disable them for a generic
> >>>> kernel supporting ARCH_EXYNOS. Such kernel won't work properly on platforms.
> >>>
> >>> Obviously it's not gonna work if the clock driver is not enabled
> >>> at all.  But does it work if you make the clock driver modular, and
> >>> put it with all other essential driver modules in initramfs?  Debugging
> >>> would be hard, as the serial console driver also relies on clocks
> >>> and PM Domains etc.
> >>
> >> The kernel could boot without clock drivers (default settings from
> >> bootloader), probe clocks from initramfs and proceed with rootfs from
> >> eMMC/SD/net.
> >>
> >> In theory.
> >>
> >> However I have no reports that it ever worked. If there is such working
> >> upstream configuration, I don't mind here. Just please explain this in
> >> the commit msg.
> >>
> >>>
> >>> If not, this patch should be NAKed, until it works with a modular
> >>> clock driver.
> >>>
> >>> If yes, perhaps another line should be added (_before_ the other line)?
> >>>
> >>>   + default m if ARCH_EXYNOS && MODULES
> >>>     default y if ARCH_EXYNOS
> >>>
> >>> However, many developers may want MODULES=y, but not want to bother
> >>> with an initramfs.  So perhaps we need a new symbol
> >>> MINIMUM_GENERIC_KERNEL or so, protected by EXPERT, and make the
> >>> driver default to m if that is enabled?
> >>
> >> Yeah, that's indeed a problem to solve. For most users (and distros)
> >> building kernel for Exynos this should be built-in by default.
> >>
> >> Anyway, the option is non-selectable so it cannot be converted to "m" or
> >> disabled. And this is claimed in the commit msg:
> >> "provide flexibilty for vendors to disable or modularize this driver."
> >>
> >> The commit does not achieve it.
> >>
> >> Best regards,
> >> Krzysztof
> > 
> > Thanks for the reviews! As Lee has explained in his replies, the
> > intent of this series is to provide config flexibility to create a
> > defconfig that allows us to move out SoC specific drivers in order to
> > create a generic kernel that can be used across multiple devices with
> > different SoCs.
> 
> That's quite generic statement... or let me put it that way - we already
> have this ability to create a generic kernel supporting different SoCs.
> Exynos and other ARMv7 and ARMv8 platforms are multiplatform.
> 
> Task is done.

multi_v7_defconfig and ARMv8's defconfig are bloated monoliths which
provide limited flexibility.  Good for testing and messing around -
not much good for real products.

> Please be more specific about use case and describe what exactly in
> current upstream multiplatform kernel is missing, what is not
> multiplatform enough.

The use-case is GKI.  A realistic middle-ground between fully open
source and real-world usage of the Linux kernel in a competitive
technical arena.  GKI aims to be as close to Mainline as possible,
whilst allowing hardware vendors to supply their own software
containing their perceived competitive edge and/or supporting
not-yet-released hardware platforms.

If you end up over-constraining the ability to configure the kernel in
useful/meaningful ways, that makes one of the main (best intention)
aims of GKI, (i.e. to have an upstream first ethos in order to be as
close to upstream as possible) much more difficult.

I put in a lot of effort to ensure GKI doesn't end up as just another
fork of the Linux kernel.  So far, so good, but flexibility and
understanding is key.

> > I'm sorry I added confusion by mentioning
> > modularization. All of these drivers that I am modifying in this
> > series can be modularized which is an ongoing effort, but is not
> > addressed here and I don't believe that modularizing them should be a
> > requirement before supporting enabling/disabling them.
> 
> Since the disabling the driver for a kernel supporting Exynos does not
> make any sense, then making it at least modular unfortunately it is a
> requirement.

I can go with that.

> > I will update the series with my patch that refactors the Samsung SoC
> > drivers menuconfig to make these visible as well.
> 
> I would first recommend to really describe your use case because my
> questions about this are still unanswered.

Hopefully my replies have helped somewhat.

Happy to discuss further if required.

If all else fails, feel free to ping me on IRC (lag).

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
