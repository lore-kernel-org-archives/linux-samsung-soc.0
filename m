Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C03C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 12:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16DC460EC0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 12:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240955AbhIWMmO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Sep 2021 08:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241120AbhIWMku (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 08:40:50 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52396C061767
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Sep 2021 05:39:19 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id i24so863861wrc.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Sep 2021 05:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MxzHpyFAKESr4Ic38SfTztzA/X7/MbsMGoi6a9FAX+U=;
        b=HrD+E5p/kd87Idd0+E+i7CSFqQrUH5/tS3hgU3xe0kPdEKpRL6WeIKHL8rLM2n9YZ0
         OrjLzYYAoUHwRlLkp6GlE8MS9tSnwYB0VIuvFvldJ4YVxhXnXnvH6dDee16vlM+K+E/v
         rLlo9UK1P8jUL61MnVMfCYnuyadgnJA9YD8T71HWRPG9RhVwC/bbbNDzSRy4xpft7fis
         DpX93qTrAfa3NFjJF6d91StYi08k5/yY50gdrwL9vHit1vNjU6o2b3MDf4qddvB9zeNM
         IV89tKRUntoWUfbjBLRfI1MyBtFJfMPLEU1sm7FFnJ5PHSRbQL8VcqbxeastkAraHpiB
         L1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MxzHpyFAKESr4Ic38SfTztzA/X7/MbsMGoi6a9FAX+U=;
        b=z4t/FtR6SyDL/pesH0JMExhUbKmL9bppLLAqnReUcH+JZB6xV73d5VUGEkxny0WSAk
         iVJ+f47Wi+ybXKFyWTqZ0Ogkn57IjCEaQJHpI7UVXVlqNG4r0luY5zutT++0PMheQmAk
         mmETWkaabe1MUvl3FRkcTvMtAVYiflQZ3R9zgjVGzKN4Gqml/3JIPIYeJK7BzaZdURR2
         vaBEHqKHfvot9dFuSuTVOyoUdyoblihabOvhqOpfsknoAmNzC8MH7KZ3AEoOwCtoCgr5
         FfteiBZN2yl7VmApTiw57iG8u06VPfvi/9Y3R77rsUQ+TA5Kl03HBlfwAj3x78hbCOaL
         dlGQ==
X-Gm-Message-State: AOAM5317MU5AFylmOgPbDKeJfl612yRc1NlI5zCrrvg0sgw9+qm3HXe6
        +iIS515p3w6+y95d0IIeDE+Tcg==
X-Google-Smtp-Source: ABdhPJxJ0vo0FQOPLMRAOfZZ+bDnC0Jo6XTw9or8ZXgwDUmzF6PVee54ZoA8mf+D3EiKxqFxQ71NrQ==
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr15939265wmh.3.1632400757847;
        Thu, 23 Sep 2021 05:39:17 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id v191sm5101400wme.36.2021.09.23.05.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 05:39:17 -0700 (PDT)
Date:   Thu, 23 Sep 2021 13:39:15 +0100
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
Message-ID: <YUx1c/xZ+nP5aI+X@google.com>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-3-willmcvicker@google.com>
 <2b48a41a-9130-b4cc-40d3-0bc7930ac76a@canonical.com>
 <YUmVj80m/rEC2mT7@google.com>
 <CABYd82a4OwxHNUUmUtBmTpSvWLu-f4sepHMF49kPQtWLU3MkDA@mail.gmail.com>
 <ad2de848-8fce-f275-25de-83a886243645@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad2de848-8fce-f275-25de-83a886243645@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:

> On 21/09/2021 19:45, Will McVicker wrote:
> > On Tue, Sep 21, 2021 at 1:19 AM Lee Jones <lee.jones@linaro.org> wrote:
> >>
> >> On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
> >>
> >>> On 20/09/2021 21:03, Will McVicker wrote:
> >>>> Switch the default logic to enable SOC_SAMSUNG and it's sub-configs to
> >>>> be enabled by default via "default y if ARCH_EXYNOS" versus being
> >>>> selected by the ARCH_EXYNOS config directly. This allows vendors to
> >>>> disable these configs if they wish and provides additional flexibility
> >>>> to modularize them in the presence of a generic kernel.
> >>>
> >>> This is not true. Vendors cannot disable these options as they are not
> >>> visible.
> >>
> >> Good point, well made.
> >>
> >>> Although I understand that Arnd prefers this way and I do not
> >>> object it, but your explanation is incorrect.
> > 
> > Thanks Krzysztof for the reviews! I'm sorry I missed the whole "hidden
> > configs" part. I'll upload the series to include the fix that refactos
> > the Samsung SoC drivers menuconfig which will address that and allow
> > one to enable/disable those configs. I'm going to hold off though
> > until we hash out the rest of the discussion in the cover letter
> > email.
> 
> No, please first read our discussions, including Lee's and Geert's
> comments. The drivers should not be converted to modules or made visible
> if such configuration does not work. If it works, please describe your
> testing setup.

Modules *should* work.  William is going to try it out.

Might need to lean-on for some testing on different H/W though.

> All these drivers are *necessary* for a multiplatform kernel supporting
> Exynos platforms, therefore disabling them does not make any sense (if
> you support Exynos platform). If your kernel does not support Exynos
> platform, just do not select ARCH_EXYNOS and problem disappears because
> none of these drivers will be visible and selected.
> 
> Unless you describe here some out-of-tree kernel which wants
> ARCH_EXYNOS, because vendor did not upstream it's code, but you do not
> want existing Exynos upstream drivers. We do not support such
> configuration. Please push your lovely vendor to work with upstream.
> That's the only solution.
> 
> It's the third time this abuse re-usage of ARCH_EXYNOS appears and the
> same as before - the vendor does not like to upstream stuff. There are
> few guys trying to upstream recent Samsung SoC support by themself (ping
> me for contacts if you would like to participate) but the one party
> which should be doing it - the lovely vendor - does not actually
> participate and instead sends ridiculous patches like this one here...
> or like this [1] [2].
> 
> Nope, please work with upstreaming SoC support, instead of abusing
> ARCH_EXYNOS for out of tree code from the vendor.

One of the on-going issues that GKI aims to solve pertains to the
disparity between what upstream engineers would like to be upstreamed
(i.e. everything) and what vendors can upstream (i.e. most things).

The old Open Source vs Business (i.e. products/real-life) struggle!

Vendors are not able to upstream all functionality right away, as it
would give away their perceived edge on the competition (i.e. other
vendors).  This is something we just have to accept as it will *never*
change.

GKI attempts to solve this issue by providing a generic core
containing all of the elements required to get every supported
platform bootstrapped to a point where modules can be loaded and
additional functionality can be brought in.  GKI provides all of the
modules available from the upstream kernel BUT allows them to be
overwritten/swapped-out by modules containing code (new/shiny
unreleased value-add) that the vendors do not wish to share (yet).

Clever, eh!

As I've explained before, the trigger for all of this was
SERIAL_SAMSUNG which is required for early console on supported
Samsung platforms i.e. this symbol *has* to be built-in.  In order for
this to built-in ARCH_EXYNOS has to be enabled due to the listed
dependencies in Kconfig.  And since ARCH_EXYNOS 'selects' all of these
different extra symbols, it means they too will be built-in, meaning
that a) the core binary will be unnecessarily bloated and b) vendors
who wish to overwrite/replace this functionality with their
non-shareable value-add, are not able to do so.

Going forward, it sounds like the best approach that will make
everyone happy, providing it's technically feasible, is to enable
these added (sometimes required, other times superfluous) symbols as
loadable modules.

> [1]
> https://lore.kernel.org/linux-samsung-soc/001001d5a03d$05de1f70$119a5e50$@samsung.com/
> 
> [2]
> https://lore.kernel.org/linux-usb/20210303022628.6540-1-taehyun.cho@samsung.com/
> 
> Best regards,
> Krzysztof

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
