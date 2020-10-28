Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76935C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:57:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2801E20791
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603933035;
	bh=SnYKs1654AWR+nrhdVt8io8FwY4SuyLSqvMlDt1+iBg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=mNFGHRwYencXektLY3F/1JahQM/1FOHqVtqk/AesXYbx3pPsmbfV3FkfhZ6eZLtJn
	 xdmJOmNO/a5xuM280Ps3/Cq5acQ12NiUqcQ8vWfW/aD2uKQGA8BDRLHEfU+cFbsHdD
	 vkZQRg5A72JbvuoWW26MvJmj5vN3c9T5n067FwI0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgJ2A5O (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:57:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:60514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731612AbgJ1WRg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:36 -0400
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 74D952473B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603890018;
        bh=SnYKs1654AWR+nrhdVt8io8FwY4SuyLSqvMlDt1+iBg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bfJPgvQ2nbWQ0y8qNd2FhAVNbOa+qK5TwCBkevD3wAh6cVsHICrmRS7obr3XaVtLN
         +Q593weDvy7BPW+Q4ILuwWUas2gYpb2M87StyuAj13E1ITUSYDf9Z0R6whMqOlpFek
         I2gyQZXGndvzO8NpfszDOAFjAuTBlOZLroYk4bdA=
Received: by mail-oi1-f180.google.com with SMTP id z23so4860995oic.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 06:00:18 -0700 (PDT)
X-Gm-Message-State: AOAM530UUb1zugkg7C3NJAwhVbSmHdjj9kT1BwbFOmSRuMqkIGn1brSG
        ++461GxiNnqZZpQaKvK87TMWE1pFoJ7ru+ZGF4o=
X-Google-Smtp-Source: ABdhPJzhKgDY54dfBgpRa/rzbgvwBNdrRPj50U//TOKvLMS8REVFaGNqh0dfCVaaxnM+94ATuH6b4GQb0j0YN9it2zw=
X-Received: by 2002:aca:d64f:: with SMTP id n76mr5434265oig.174.1603890017608;
 Wed, 28 Oct 2020 06:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201007083944.27910-1-ardb@kernel.org> <CGME20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af@eucas1p1.samsung.com>
 <20201007083944.27910-3-ardb@kernel.org> <920965b8-6f87-3f82-9fce-d3051fc543ca@samsung.com>
 <CACPK8XfNfqToFBe0GPFTGrnPhNTYhSDiEagpB7ayBSW1DC-THA@mail.gmail.com>
 <CAMj1kXH90MzCUJ_DHZ_2=JcWBX=Qf1PT-A9PX9EeBTVx22EkaQ@mail.gmail.com> <CACPK8Xfw0WYSxGf0PnVOF40+C-KOJnX2x_q2gXrf4JZPErKBDA@mail.gmail.com>
In-Reply-To: <CACPK8Xfw0WYSxGf0PnVOF40+C-KOJnX2x_q2gXrf4JZPErKBDA@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 28 Oct 2020 14:00:05 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFmvzEj4PRFsqfcuz_bi3jUYArvRXb4x3bHKhgX1p6y+A@mail.gmail.com>
Message-ID: <CAMj1kXFmvzEj4PRFsqfcuz_bi3jUYArvRXb4x3bHKhgX1p6y+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: move device tree mapping out of linear region
To:     Joel Stanley <joel@jms.id.au>
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

On Wed, 28 Oct 2020 at 13:59, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 28 Oct 2020 at 12:53, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Wed, 28 Oct 2020 at 13:05, Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Wed, 28 Oct 2020 at 09:19, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > > > This patch landed in linux-next 20201028 as commit 7a1be318f579 ("ARM:
> > > > 9012/1: move device tree mapping out of linear region"). Sadly it broke
> > > > booting  almost all Samsung Exynos-based boards. The only one which
> > > > booted, used an appended device tree. I can provide more information if
> > > > needed, just let me know what to check. "Starting kernel ..." is the
> > > > last message I see here. No output from earlycon.
> > >
> > > A bisection lead me to this patch after the next-20201028 failed to
> > > boot on the aspeed systems in testing (aspeed_g5_defconfig).
> > >
> > > You can reproduce this with today's next and qemu 5.1:
> > >
> > > qemu-system-arm -M romulus-bmc -nographic \
> > >  -kernel arch/arm/boot/zImage \
> > >  -dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb \
> > >  -initrd any-old-file
> > >
> > > It requires the initrd option to reproduce, but the initrd doesn't
> > > need to be valid as we don't make it that far.
> > >
> > > There is no output but attaching gdb shows the kernel is stuck in
> > > setup_machine_tags. (If we enable CONFIG_ATAGS it is instead stuck in
> > > calibrate_delay).
> > >
> > > (gdb) bt
> > > #0  setup_machine_tags (machine_nr=<optimized out>,
> > > __atags_vaddr=<optimized out>) at ../arch/arm/kernel/atags.h:12
> > > #1  setup_arch (cmdline_p=0x80c01fc4) at ../arch/arm/kernel/setup.c:1100
> > > #2  0x80b00d2c in start_kernel () at ../init/main.c:862
> > > #3  0x00000000 in ?? ()
> > >
> > > Reverting 7a1be318f579 on top of next allowed the system to boot again.
> > >
> >
> > Does this help?
>
> Yes, that boots to userspace.
>

Thanks. I'll take that as a tested-by


> >
> > diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
> > index bb79e52aeb90..4f355bda872a 100644
> > --- a/arch/arm/include/asm/memory.h
> > +++ b/arch/arm/include/asm/memory.h
> > @@ -68,8 +68,8 @@
> >  #define XIP_VIRT_ADDR(physaddr)  (MODULES_VADDR + ((physaddr) & 0x000fffff))
> >
> >  #define FDT_FIXED_BASE         UL(0xff800000)
> > -#define FDT_FIXED_SIZE         (2 * PMD_SIZE)
> > -#define FDT_VIRT_ADDR(physaddr)        ((void *)(FDT_FIXED_BASE |
> > (physaddr) % PMD_SIZE))
> > +#define FDT_FIXED_SIZE         (2 * SECTION_SIZE)
> > +#define FDT_VIRT_ADDR(physaddr)        ((void *)(FDT_FIXED_BASE |
> > (physaddr) % SECTION_SIZE))
> >
> >  #if !defined(CONFIG_SMP) && !defined(CONFIG_ARM_LPAE)
> >  /*
