Return-Path: <SRS0=5Pkx=ED=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAECC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 21:45:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 889712475D
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 21:45:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="jm63EXKg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgJ1Vpt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 17:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgJ1Vpt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:45:49 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC95C0613CF
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 14:45:48 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id r9so1082780ioo.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I9SAz1Nr0rbpfdGWAlkoW2b28vlFNuIq9ln5WxnlO4E=;
        b=jm63EXKgY9yyp1UxuzjBCQD7lC3SlsBlciOvn/TyDTxBtCltv+kSg/7eppr8WRaovK
         l7iZ03reiAJmpcGehqZlNkYlVfd9wO1TED09s1t7az9Ed7YH1kdYHNCFN4RqGe1IgEBN
         AEXHW4PeYMNP2qUZ+TRbeOjL37UttB+8fbDgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I9SAz1Nr0rbpfdGWAlkoW2b28vlFNuIq9ln5WxnlO4E=;
        b=dDpOAm0t2cmXPzEFXAW3KX4d6avwDC8KG2tcZO1cPrYt02y6guoWdF/Mo6D1w00nZF
         L86vE2ZMaQLLE6jL+JhpjmxLbBzuULDvK/wX2BvKRL0JRsBhg9LikIAjv/tTJHYKZwop
         ni7cF/Yuj9CZSgJvJnkJ9+FWssks7mizV7TObEGGnXEn1xhI7iqcknNJTj2D+nkdRR5G
         72965gK70bWjzOnjFAODzZVZGqSNMCDjNcPduXgTBIpXplqBD2pA1tzVCIVBF2ddfkBn
         AffDInBPO85beZD4Bqv86ffnanl7F+qwzIGY75RwaSLZ/KGk8cubtPRGRRhJC0RRVUxj
         79hw==
X-Gm-Message-State: AOAM533x/WSYBfoXudq9rnhDb4CCeqQnKJ37Ya0+3JZBhujGPnZwOf+a
        Bawa6VdzthbzapLO2IFxCYK40tkqYwLKQ7AmQPLPkGD+Oscybw==
X-Google-Smtp-Source: ABdhPJwAj/+NNjUkoBXwXq5DIu0VTgWJza/6mTiWtlwuzf8bHOQ4vuDIb6imlwzIdmboQTzZiA7uP7/f3oC4UgxCMI4=
X-Received: by 2002:a37:a81:: with SMTP id 123mr6993857qkk.487.1603890401898;
 Wed, 28 Oct 2020 06:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201007083944.27910-1-ardb@kernel.org> <CGME20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af@eucas1p1.samsung.com>
 <20201007083944.27910-3-ardb@kernel.org> <920965b8-6f87-3f82-9fce-d3051fc543ca@samsung.com>
 <CACPK8XfNfqToFBe0GPFTGrnPhNTYhSDiEagpB7ayBSW1DC-THA@mail.gmail.com>
 <CAMj1kXH90MzCUJ_DHZ_2=JcWBX=Qf1PT-A9PX9EeBTVx22EkaQ@mail.gmail.com>
 <CACPK8Xfw0WYSxGf0PnVOF40+C-KOJnX2x_q2gXrf4JZPErKBDA@mail.gmail.com> <CAMj1kXFmvzEj4PRFsqfcuz_bi3jUYArvRXb4x3bHKhgX1p6y+A@mail.gmail.com>
In-Reply-To: <CAMj1kXFmvzEj4PRFsqfcuz_bi3jUYArvRXb4x3bHKhgX1p6y+A@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 28 Oct 2020 13:06:29 +0000
Message-ID: <CACPK8XdyJrcxjM9q9BfBt5u7dcsAjNhGazjY9rF1UT3mj3cDNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: move device tree mapping out of linear region
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 28 Oct 2020 at 13:00, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Wed, 28 Oct 2020 at 13:59, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Wed, 28 Oct 2020 at 12:53, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Wed, 28 Oct 2020 at 13:05, Joel Stanley <joel@jms.id.au> wrote:
> > > >
> > > > On Wed, 28 Oct 2020 at 09:19, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > > > > This patch landed in linux-next 20201028 as commit 7a1be318f579 ("ARM:
> > > > > 9012/1: move device tree mapping out of linear region"). Sadly it broke
> > > > > booting  almost all Samsung Exynos-based boards. The only one which
> > > > > booted, used an appended device tree. I can provide more information if
> > > > > needed, just let me know what to check. "Starting kernel ..." is the
> > > > > last message I see here. No output from earlycon.
> > > >
> > > > A bisection lead me to this patch after the next-20201028 failed to
> > > > boot on the aspeed systems in testing (aspeed_g5_defconfig).
> > > >
> > > > You can reproduce this with today's next and qemu 5.1:
> > > >
> > > > qemu-system-arm -M romulus-bmc -nographic \
> > > >  -kernel arch/arm/boot/zImage \
> > > >  -dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb \
> > > >  -initrd any-old-file
> > > >
> > > > It requires the initrd option to reproduce, but the initrd doesn't
> > > > need to be valid as we don't make it that far.
> > > >
> > > > There is no output but attaching gdb shows the kernel is stuck in
> > > > setup_machine_tags. (If we enable CONFIG_ATAGS it is instead stuck in
> > > > calibrate_delay).
> > > >
> > > > (gdb) bt
> > > > #0  setup_machine_tags (machine_nr=<optimized out>,
> > > > __atags_vaddr=<optimized out>) at ../arch/arm/kernel/atags.h:12
> > > > #1  setup_arch (cmdline_p=0x80c01fc4) at ../arch/arm/kernel/setup.c:1100
> > > > #2  0x80b00d2c in start_kernel () at ../init/main.c:862
> > > > #3  0x00000000 in ?? ()
> > > >
> > > > Reverting 7a1be318f579 on top of next allowed the system to boot again.
> > > >
> > >
> > > Does this help?
> >
> > Yes, that boots to userspace.
> >
>
> Thanks. I'll take that as a tested-by

Please do. Thanks for the quick fix.

Cheers,

Joel

>
>
> > >
> > > diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
> > > index bb79e52aeb90..4f355bda872a 100644
> > > --- a/arch/arm/include/asm/memory.h
> > > +++ b/arch/arm/include/asm/memory.h
> > > @@ -68,8 +68,8 @@
> > >  #define XIP_VIRT_ADDR(physaddr)  (MODULES_VADDR + ((physaddr) & 0x000fffff))
> > >
> > >  #define FDT_FIXED_BASE         UL(0xff800000)
> > > -#define FDT_FIXED_SIZE         (2 * PMD_SIZE)
> > > -#define FDT_VIRT_ADDR(physaddr)        ((void *)(FDT_FIXED_BASE |
> > > (physaddr) % PMD_SIZE))
> > > +#define FDT_FIXED_SIZE         (2 * SECTION_SIZE)
> > > +#define FDT_VIRT_ADDR(physaddr)        ((void *)(FDT_FIXED_BASE |
> > > (physaddr) % SECTION_SIZE))
> > >
> > >  #if !defined(CONFIG_SMP) && !defined(CONFIG_ARM_LPAE)
> > >  /*
