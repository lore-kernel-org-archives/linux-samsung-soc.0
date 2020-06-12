Return-Path: <SRS0=BxTb=7Z=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B47C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 12 Jun 2020 02:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3763020835
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 12 Jun 2020 02:53:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksh5jdaL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgFLCxx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Jun 2020 22:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgFLCxx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Jun 2020 22:53:53 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D01CC03E96F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2020 19:53:53 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id q8so8742320iow.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2020 19:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K+UQMn4XLII3jpSziiawVVEOaVhY6ZIjWCrSiiLtkb8=;
        b=ksh5jdaLWv3tU1z6o8SmQ2FRLeupUM1iLsVEhLWN3SRppEV6EVw/ruPj1af5oZtxA4
         yRk0OGXzz1ACoYiBxdHg+syA0oS/JEbNKRgE9RfXraHSMX/WBkhhrS4hPJ72cnbO2br9
         XWqaVe8kGm9gET4UWTlEVpXO1/wbwrkzpL/ptJwSH/rzPa0cJfUwFo4u1OsM2wSwiLsU
         BQD6a1M2Bg+nLZt4ZdibQWaVPi1GlCXOEzWCMzhmEtP10kYu1b3KRSR6pqZizyI5tyV4
         PT5XewTRALSmynnUGK+vJkNYm6G82Mphg4y7iD+hs9pOGrfh8AoI14mpO57AzZ7H3og0
         SfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+UQMn4XLII3jpSziiawVVEOaVhY6ZIjWCrSiiLtkb8=;
        b=MiZdD4JT6Q8F2VDTtzpoL32xTPoki2ZXfJGlJTNsB+0weA4ofdVNbMRcjAMwIEvxuR
         llHWvJyyv6yN0h6HtypTocLlPtBV/r1o+lvy31g4PMbbCgqJc7dfaqUBGDG20/vW6lRc
         T5vd01CgruphWEWW0K3lw+CtyMELjw21atr4hciJdeDmCEF22CIRcknuGEkoP/kMiKcd
         JXDVpOxlq5S+TqdQ+iL3vlSBb6aM8pjtExHCy1zFt7BM/zoAwPJ9XHxjDz3wJYxZttTr
         yPCDeH9UMhD2xeqIMCk43u6YeVjT86DpoWimeEDeVMtCTQY8HQgzqP4C2C+4lOzTmdXQ
         semg==
X-Gm-Message-State: AOAM5301zfunqDr88SufKqVFIfwJxepiCNx/01hgVZAhUXgVOMmZaOS3
        pB/aAXoGfamPQUoOkVn2ni0FH+qM4HE5aogcgoc=
X-Google-Smtp-Source: ABdhPJzDJ5YO0GeuPgNkVBf5BRbJ4IfyKy6YkMhLhLbz0X61LU8WDhIaNQmOqmY9oyYbXwP+kccz3OQQgOwzXm9VpIk=
X-Received: by 2002:a05:6638:a0a:: with SMTP id 10mr6117323jan.30.1591930431883;
 Thu, 11 Jun 2020 19:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <CANAwSgQv9BKV4QfZAgSfFQvO7ftcFyCGXEo+g4pgQA4mgK52iQ@mail.gmail.com>
 <20200611064556.GA5056@kozik-lap> <CANAwSgQqW6+W2=QcrAx8DsafK_0eMtQthQWcZWy9NDWxN3WkbQ@mail.gmail.com>
 <19d94eb3-d08c-e436-ccc0-cca56291eed2@arm.com>
In-Reply-To: <19d94eb3-d08c-e436-ccc0-cca56291eed2@arm.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Fri, 12 Jun 2020 08:23:41 +0530
Message-ID: <CANAwSgSFPbnAh2VbiPuhvPOve3Y44hXZGnjpc_7e27K=xdBo8A@mail.gmail.com>
Subject: Re: ARM: warning: relocation out of range on Exynos XU4 and U3+
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Robin,

On Thu, 11 Jun 2020 at 16:29, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-06-11 08:51, Anand Moon wrote:
> > Hi Krzysztof,
> >
> > On Thu, 11 Jun 2020 at 12:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On Thu, Jun 11, 2020 at 11:13:57AM +0530, Anand Moon wrote:
> >>> Hi All,
> >>>
> >>> I would like to report some warnings I observed on pre-compiled kernel
> >>> image (5.7.1-1-ARCH) from Archlinux.
> >>> Sometimes ethernet would not come up and get connected, so in order to
> >>> investigate.
> >>> I found below warnings, So I am sharing the logs at my end.
> >>>
> >>> Are these warnings related to in-consistency in locking, How can we
> >>> Investigate more to fix this issue.
> >>
> >> These rather look like some address space randomization or some compiler
> >> (LLVM?) feature. Not Exynos-specific anyway.
> >>
> >> You should report it to Arch folks because they know how they compiled
> >> the kernel and what config they used (althogh config you can find in
> >> /proc/config.gz).
> >
> > Thanks for your inputs.
> > Ok I will do more checks at my end, before reporting further to Archlinux.
>
> Looks like the relocations fail when loading modules, and PLTs are not
> enbabled[1], so chances are the kernel image has simply grown too big to
> keep everything within direct branch range of everything else.
>
> Robin.
>
> [1]
> https://github.com/archlinuxarm/PKGBUILDs/blob/master/core/linux-odroid-xu3/config#L619

Thanks for your input CONFIG_ARM_MODULE_PLTS is being enable on
(5.7.2-1-ARCH) config
and this issue seems to have resolved.

Best Regards
-Anand
