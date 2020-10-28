Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD26C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:55:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9874320724
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603932912;
	bh=vEUSwFAE65XSY/KkTJZAHsNmaobAHgJ+Pl4mcszuFfM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=KmFCFFMAL8wOku4sjrFgFd8t912yH7m4CiMBhZD83lEFPsfW+J4qr4Ek6n+DO+rr6
	 O4N9qXZ80HZS3/6JdAqqTrlCI7SFW34wHXGi7b7XRtZZPcxAdKMSf9git746cISnNl
	 U9N31N8bV0iexabm53OqTh+QQX2Nq8cDNhu6hFwY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731305AbgJ1WSA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:18:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:60528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731769AbgJ1WRo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:44 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E447624737
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603889581;
        bh=vEUSwFAE65XSY/KkTJZAHsNmaobAHgJ+Pl4mcszuFfM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mVq/QxTeUBPlPu9fPHWjmdkM/LERQXaO0wVIv+yMZ/igTFIihEIW6CzCfTHRnsmNf
         UQ8S95ajkpvKZr7cJUyHvcKXxc9S6Y4G/mYm4ihCXbjaW7X6l5MnsIBMvp7pFz99uF
         HTGs/T8BnAWC5hXPrh6ueciSCiEhSKlOLgTRKUR0=
Received: by mail-oi1-f175.google.com with SMTP id j7so4797627oie.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 05:53:00 -0700 (PDT)
X-Gm-Message-State: AOAM533Hr0+J+bVhQHe486kmVxSbmfr3/ABf3msgt2A4SmLZ7BPUyvK8
        a6dlSPuj9akcms0vTqYzz2l672eh9jbs57j2R3M=
X-Google-Smtp-Source: ABdhPJyttFJYhfU6wb3hBcYeqITbXqCzFhSlN6XR76kEyb5fzFcHJGO6ObppcTFrZ0NAP1bH8dFmxNMdi+8pgZzjNUE=
X-Received: by 2002:aca:2310:: with SMTP id e16mr4841703oie.47.1603889580109;
 Wed, 28 Oct 2020 05:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201007083944.27910-1-ardb@kernel.org> <CGME20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af@eucas1p1.samsung.com>
 <20201007083944.27910-3-ardb@kernel.org> <920965b8-6f87-3f82-9fce-d3051fc543ca@samsung.com>
 <CACPK8XfNfqToFBe0GPFTGrnPhNTYhSDiEagpB7ayBSW1DC-THA@mail.gmail.com>
In-Reply-To: <CACPK8XfNfqToFBe0GPFTGrnPhNTYhSDiEagpB7ayBSW1DC-THA@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 28 Oct 2020 13:52:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH90MzCUJ_DHZ_2=JcWBX=Qf1PT-A9PX9EeBTVx22EkaQ@mail.gmail.com>
Message-ID: <CAMj1kXH90MzCUJ_DHZ_2=JcWBX=Qf1PT-A9PX9EeBTVx22EkaQ@mail.gmail.com>
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

On Wed, 28 Oct 2020 at 13:05, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 28 Oct 2020 at 09:19, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >
> > Hi,
> >
> > On 07.10.2020 10:39, Ard Biesheuvel wrote:
> > > On ARM, setting up the linear region is tricky, given the constraints
> > > around placement and alignment of the memblocks, and how the kernel
> > > itself as well as the DT are placed in physical memory.
> > >
> > > Let's simplify matters a bit, by moving the device tree mapping to the
> > > top of the address space, right between the end of the vmalloc region
> > > and the start of the the fixmap region, and create a read-only mapping
> > > for it that is independent of the size of the linear region, and how it
> > > is organized.
> > >
> > > Since this region was formerly used as a guard region, which will now be
> > > populated fully on LPAE builds by this read-only mapping (which will
> > > still be able to function as a guard region for stray writes), bump the
> > > start of the [underutilized] fixmap region by 512 KB as well, to ensure
> > > that there is always a proper guard region here. Doing so still leaves
> > > ample room for the fixmap space, even with NR_CPUS set to its maximum
> > > value of 32.
> > >
> > > Tested-by: Linus Walleij <linus.walleij@linaro.org>
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > This patch landed in linux-next 20201028 as commit 7a1be318f579 ("ARM:
> > 9012/1: move device tree mapping out of linear region"). Sadly it broke
> > booting  almost all Samsung Exynos-based boards. The only one which
> > booted, used an appended device tree. I can provide more information if
> > needed, just let me know what to check. "Starting kernel ..." is the
> > last message I see here. No output from earlycon.
>
> A bisection lead me to this patch after the next-20201028 failed to
> boot on the aspeed systems in testing (aspeed_g5_defconfig).
>
> You can reproduce this with today's next and qemu 5.1:
>
> qemu-system-arm -M romulus-bmc -nographic \
>  -kernel arch/arm/boot/zImage \
>  -dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb \
>  -initrd any-old-file
>
> It requires the initrd option to reproduce, but the initrd doesn't
> need to be valid as we don't make it that far.
>
> There is no output but attaching gdb shows the kernel is stuck in
> setup_machine_tags. (If we enable CONFIG_ATAGS it is instead stuck in
> calibrate_delay).
>
> (gdb) bt
> #0  setup_machine_tags (machine_nr=<optimized out>,
> __atags_vaddr=<optimized out>) at ../arch/arm/kernel/atags.h:12
> #1  setup_arch (cmdline_p=0x80c01fc4) at ../arch/arm/kernel/setup.c:1100
> #2  0x80b00d2c in start_kernel () at ../init/main.c:862
> #3  0x00000000 in ?? ()
>
> Reverting 7a1be318f579 on top of next allowed the system to boot again.
>

Does this help?

diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
index bb79e52aeb90..4f355bda872a 100644
--- a/arch/arm/include/asm/memory.h
+++ b/arch/arm/include/asm/memory.h
@@ -68,8 +68,8 @@
 #define XIP_VIRT_ADDR(physaddr)  (MODULES_VADDR + ((physaddr) & 0x000fffff))

 #define FDT_FIXED_BASE         UL(0xff800000)
-#define FDT_FIXED_SIZE         (2 * PMD_SIZE)
-#define FDT_VIRT_ADDR(physaddr)        ((void *)(FDT_FIXED_BASE |
(physaddr) % PMD_SIZE))
+#define FDT_FIXED_SIZE         (2 * SECTION_SIZE)
+#define FDT_VIRT_ADDR(physaddr)        ((void *)(FDT_FIXED_BASE |
(physaddr) % SECTION_SIZE))

 #if !defined(CONFIG_SMP) && !defined(CONFIG_ARM_LPAE)
 /*
