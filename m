Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA07C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 18:05:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2426361248
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 18:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238811AbhIWSH3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Sep 2021 14:07:29 -0400
Received: from mail-vk1-f178.google.com ([209.85.221.178]:36797 "EHLO
        mail-vk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242667AbhIWSHZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 14:07:25 -0400
Received: by mail-vk1-f178.google.com with SMTP id t186so2958974vkd.3;
        Thu, 23 Sep 2021 11:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rBW9oigA3M6I4upMBiJaZfcaxJFLLXlzf1RS4A+4bEM=;
        b=v7JTG6jI62sNgdD2hmwhceOWpa3fdbufHVNZ6EpFNto4XgAqve2nApiBbpEL9wG+Uv
         dSL1pWV5Kzh/Cn8Zo/yikumhZaebzNBi7k22vKAsuICC9W9bYh3ipiRbanSE++PNAeYE
         5pOFakcbfIW+sA9ilrVLF/FUrsyo5k6RtQdtwy645684QFkT+cFl97ckygx9CDMhAuQQ
         ZY95kAoKZRWsr8MN4B5lgzNtBqB6xSTzk4DTt21rYRjKYej0X/rIyLtnQFjUjT7hcTZB
         2bXSfnN+BoiC+xoh9SjKrwDvsXFIzdsZgAbnIzX6V4ntD2S0d7W2fKmJzP7Xo2CSSKZ+
         WnUA==
X-Gm-Message-State: AOAM531EtcUB/vGt0Ixu4goIdEH95qTUSF7bDvbOH/6i0vp1pwbY1S0A
        4JgVnySrCusRuhaGuT47qm1W0epmDUZjiZ3QkH4=
X-Google-Smtp-Source: ABdhPJz4AjvCw8fTJexqs6DkYP0oJBEeFwh+VuYL7GrwofLh9foa4aAVcIhkOm69AWOZpHSirP8hK3g44fRmA8vVrlY=
X-Received: by 2002:a1f:9187:: with SMTP id t129mr4910403vkd.15.1632420352877;
 Thu, 23 Sep 2021 11:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-3-willmcvicker@google.com> <2b48a41a-9130-b4cc-40d3-0bc7930ac76a@canonical.com>
 <YUmVj80m/rEC2mT7@google.com> <CABYd82a4OwxHNUUmUtBmTpSvWLu-f4sepHMF49kPQtWLU3MkDA@mail.gmail.com>
 <ad2de848-8fce-f275-25de-83a886243645@canonical.com> <YUx1c/xZ+nP5aI+X@google.com>
 <db808138-e839-48d8-26e7-659cc9950163@canonical.com> <YUyD/AxIVw+mbxSP@google.com>
 <CAMuHMdUaHPoCDnu3sD7WOnvyaMp5qNjuRGaFxEDQp1ZoFkcrvg@mail.gmail.com>
In-Reply-To: <CAMuHMdUaHPoCDnu3sD7WOnvyaMp5qNjuRGaFxEDQp1ZoFkcrvg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 20:05:41 +0200
Message-ID: <CAMuHMdVj4nEVUN=+gmknKvGSkZtOyE3hXcZ5cim+iJz491S-gw@mail.gmail.com>
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

On Thu, Sep 23, 2021 at 6:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Sep 23, 2021 at 3:42 PM Lee Jones <lee.jones@linaro.org> wrote:
> > On Thu, 23 Sep 2021, Krzysztof Kozlowski wrote:
> > > On 23/09/2021 14:39, Lee Jones wrote:
> > > > As I've explained before, the trigger for all of this was
> > > > SERIAL_SAMSUNG which is required for early console on supported
> > > > Samsung platforms i.e. this symbol *has* to be built-in.
> > >
> > > Actually SERIAL_SAMSUNG does not have to be built-in. It is necessary
> > > for built-in only for debugging or development, not for real products.
> >
> > Right.  And in the early stages, GKI is used for early (non-released)
> > H/W (this is also the part of the reason these differences can't be
> > upstreamed early/now/yet) and sometimes changes break things requiring
> > low-level debugging techniques to solve (inc. early console).
> >
> > > Unlike other drivers which have to be built-in, e.g. clocks or pinctrl,
> > > or heavily tested whether setup from initrd works. Plus not breaking
> > > distros who like to have everything as module (solution from Geert?)...
> >
> > We don't know which drivers *need* to be built-in yet.
> >
> > Clocks is probably not a good example even, since the power-on default
> > is most likely all-on, which is fine.  Pinctrl remains to be seen.
>
> Clocks is an excellent example: if a clock is missing, the driver
> will fail to probe (unless the clock is considered optional by
> the driver), regardless of the power-on or boot loader defaults.
> With fw_devlinks=on (which is the default now, and developed by a
> Google engineer (GKI or another division?)), the driver won't even
> get to the probing point.
>
> Pinctrl is different, as unless I'm mistaken, drivers will still
> probe if the pin control driver is missing, so they will work if the
> power-on or boot loader defaults of pin control are fine.

In addition, relying on implicit power-on or boot loader state comes
with its own set of pitfalls, which may break other use cases.
On a heavily power-managed mobile device, clocks and/or power domains
can be turned off, so a kernel launched from kexec or kdump may start
in a state not adhering to these implicit dependencies.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
