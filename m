Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65537C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 16:19:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B3A861050
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 16:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235928AbhIWQVE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Sep 2021 12:21:04 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:33644 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbhIWQU6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 12:20:58 -0400
Received: by mail-ua1-f45.google.com with SMTP id r8so4660783uap.0;
        Thu, 23 Sep 2021 09:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SBpZfoGMTotXxDAvtrxSwrqVhouzGhXeD4VzFaRJU5I=;
        b=ASqL0FmvcOmrQ+CqBVdHQJZQ490J67f1fBl3CpITmCSDCaamDyf2KmiPlTd1T0GJc0
         kTHv9uG6354/F2yPbJIHjYBwgTEWP3T6CWlztBgzPnFmIT5VoTRWN0xGHJe+285iUfYo
         PzsOr1aDQEKyyncZy6D8yDeNnmYKL22wbEqYaPboRwqJrspjrsMXgUPfj6R5NvxB67p4
         U7Uf4qJzT0tiiKbvp5Z0F1STkLyi8YF2cCfBIyTJqxofhRPK/cofnAIeNodv9Dvo9ENT
         Ww+0c6mQEgY/LFTKKYZTVyHO3La8T+4N0cetob1KY608fbXuo4Hv++5BJAjAKbMpKXoJ
         B2Sw==
X-Gm-Message-State: AOAM530tXvflkpbnbrCpi5XvdWZutTL3/KCz78yaWcOzP/3Paq7oROVy
        0KBU0n9PunkLkM5ebm5DK8I3ITLmovO0hGp8ook=
X-Google-Smtp-Source: ABdhPJzTrH7tlrD1lqVoDJi6x0JlYXAHLrd+w0oaUOL+xhUDYXJXFzRiExIxuJNMK9MYANrA413HbLUezCFzz6qJNZg=
X-Received: by 2002:ab0:16d4:: with SMTP id g20mr5101097uaf.114.1632413965859;
 Thu, 23 Sep 2021 09:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-3-willmcvicker@google.com> <2b48a41a-9130-b4cc-40d3-0bc7930ac76a@canonical.com>
 <YUmVj80m/rEC2mT7@google.com> <CABYd82a4OwxHNUUmUtBmTpSvWLu-f4sepHMF49kPQtWLU3MkDA@mail.gmail.com>
 <ad2de848-8fce-f275-25de-83a886243645@canonical.com> <YUx1c/xZ+nP5aI+X@google.com>
 <db808138-e839-48d8-26e7-659cc9950163@canonical.com> <YUyD/AxIVw+mbxSP@google.com>
In-Reply-To: <YUyD/AxIVw+mbxSP@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 18:19:14 +0200
Message-ID: <CAMuHMdUaHPoCDnu3sD7WOnvyaMp5qNjuRGaFxEDQp1ZoFkcrvg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] soc: samsung: change SOC_SAMSUNG default config logic
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Lee,

On Thu, Sep 23, 2021 at 3:42 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 23 Sep 2021, Krzysztof Kozlowski wrote:
> > On 23/09/2021 14:39, Lee Jones wrote:
> > > As I've explained before, the trigger for all of this was
> > > SERIAL_SAMSUNG which is required for early console on supported
> > > Samsung platforms i.e. this symbol *has* to be built-in.
> >
> > Actually SERIAL_SAMSUNG does not have to be built-in. It is necessary
> > for built-in only for debugging or development, not for real products.
>
> Right.  And in the early stages, GKI is used for early (non-released)
> H/W (this is also the part of the reason these differences can't be
> upstreamed early/now/yet) and sometimes changes break things requiring
> low-level debugging techniques to solve (inc. early console).
>
> > Unlike other drivers which have to be built-in, e.g. clocks or pinctrl,
> > or heavily tested whether setup from initrd works. Plus not breaking
> > distros who like to have everything as module (solution from Geert?)...
>
> We don't know which drivers *need* to be built-in yet.
>
> Clocks is probably not a good example even, since the power-on default
> is most likely all-on, which is fine.  Pinctrl remains to be seen.

Clocks is an excellent example: if a clock is missing, the driver
will fail to probe (unless the clock is considered optional by
the driver), regardless of the power-on or boot loader defaults.
With fw_devlinks=on (which is the default now, and developed by a
Google engineer (GKI or another division?)), the driver won't even
get to the probing point.

Pinctrl is different, as unless I'm mistaken, drivers will still
probe if the pin control driver is missing, so they will work if the
power-on or boot loader defaults of pin control are fine.

> > > In order for
> > > this to built-in ARCH_EXYNOS has to be enabled due to the listed
> > > dependencies in Kconfig.  And since ARCH_EXYNOS 'selects' all of these
> > > different extra symbols, it means they too will be built-in, meaning
> > > that a) the core binary will be unnecessarily bloated and b) vendors
> > > who wish to overwrite/replace this functionality with their
> > > non-shareable value-add, are not able to do so.
> >
> > I am sorry, but this is not reflecting status we want to have in
> > usptream. Everything selected by ARCH_EXYNOS *has to be selected* for
> > supported platforms. Since vendor does not contribute anything new
> > (except mentioned one work for UFS), we are not going to sacrifice
> > supported mainline platforms for a non-cooperative out-of-tree unknown
> > platforms.
>
> The is the part of the discussion that is the most contentious.
>
> Ideally we wouldn't have to enable any ARCH_* explicitly.  Greg has
> mentioned this publicly on a number of discussions.  However, removing
> the dependencies (from Kconfig in this case) is in contention with
> other user's use-cases.  No one wants to be asked seemingly irrelevant
> configuration questions during the config stages of a kernel build.
>
> So we are forced to enable ARCH_* to have our requirements built-in
> (ARCH_EXYNOS for SAMSUNG_SERIAL [early console] in this case).
> Unfortunately, this comes with additional cruft that we *might* not
> want (resulting in bloat) or that we wish to overwrite with more
> featureful driver modules.  We can't do that if these features are
> built-in.

The question is if Linux can actually boot on the affected platform
without this "additional cruft" builtin, for which we still haven't
received any confirmation yet...

So claiming to be "upstream first", and submitting patches, is great,
but only if the changes you're upstreaming actually work.
If they don't, and if you insist on keeping on upstreaming them,
without providing evidence that they don't break the affected platform
completely, perhaps this should be treated similar to the UMN patches?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
