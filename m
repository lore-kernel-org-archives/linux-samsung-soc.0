Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C900CC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:32:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66B102080C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="fk79988O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387801AbgJ1Way (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387786AbgJ1Wau (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:30:50 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50374C0613CF
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 15:30:50 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id 140so559794qko.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 15:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r50RziCCf41vMt4iusxMNzQ7m6GlYmpIxcFKzK4DYSY=;
        b=fk79988OS57sRAt4EOE+FcQ3YfB+bD6qgUHXgGxv3XyX9KrOtbUvEyl8wTAcN/tYDQ
         SF1QwIUaZZxnsZEOZRvskEdT3nmfg2k+eFPNvGIwAOB9Co7t97zHY4sMP+FiM6VyZ7p9
         0IQXv0BT6YDINGomQMbZpCjfh0oGQsDRvPwWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r50RziCCf41vMt4iusxMNzQ7m6GlYmpIxcFKzK4DYSY=;
        b=uVzC7POehvioRv0jsQUcowwHQiJd04y/3WKBl2VSkLEMka5vGB8l6CEqkx9eiaxvvq
         KqJ4kqgKwunQmW6rZxjoEYw+QLX8wr1fj+58PWXZ5ylCHmj3DEpYKvnzg970knqh0z2N
         CcpQpafYDhAhZ4k0dgRGic6au3/nEwU9IWo9CK7XMDIC1IOmC0j19DrWY3qtqvJWKzyE
         AZyiyYG5eXmFBrhS7+YbEA/y0ysw3GdPMJTKuJXWPh4eno77tUw8yBI7Vn9nuW/EAjNH
         h6tsRivnnF3mwQ2oAd3pNCfV3dmU8caMjFW2mxbteQ2aRLLN9FbTT08dG+UjQNsmlw/4
         iTEQ==
X-Gm-Message-State: AOAM531cEi7YhUqejW9Hia1esHYqEi40NDNY8eKDK7qGYJ1YO9wApGib
        1TRV3Dlcya+KmIEgV2f62hjco+gahCv949Xwy2m/6AlN5LBMEdQt
X-Google-Smtp-Source: ABdhPJyWAgQ3u9tLc+LnZ0/V5egif53hxBvUfuO9ckZ+WaffrbWyT/eHS1v4Jh7aXIFSqFZzAhz+og+GieSzmUPipfA=
X-Received: by 2002:a05:620a:1303:: with SMTP id o3mr7013552qkj.66.1603886740809;
 Wed, 28 Oct 2020 05:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201007083944.27910-1-ardb@kernel.org> <CGME20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af@eucas1p1.samsung.com>
 <20201007083944.27910-3-ardb@kernel.org> <920965b8-6f87-3f82-9fce-d3051fc543ca@samsung.com>
In-Reply-To: <920965b8-6f87-3f82-9fce-d3051fc543ca@samsung.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 28 Oct 2020 12:05:28 +0000
Message-ID: <CACPK8XfNfqToFBe0GPFTGrnPhNTYhSDiEagpB7ayBSW1DC-THA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: move device tree mapping out of linear region
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
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

On Wed, 28 Oct 2020 at 09:19, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 07.10.2020 10:39, Ard Biesheuvel wrote:
> > On ARM, setting up the linear region is tricky, given the constraints
> > around placement and alignment of the memblocks, and how the kernel
> > itself as well as the DT are placed in physical memory.
> >
> > Let's simplify matters a bit, by moving the device tree mapping to the
> > top of the address space, right between the end of the vmalloc region
> > and the start of the the fixmap region, and create a read-only mapping
> > for it that is independent of the size of the linear region, and how it
> > is organized.
> >
> > Since this region was formerly used as a guard region, which will now be
> > populated fully on LPAE builds by this read-only mapping (which will
> > still be able to function as a guard region for stray writes), bump the
> > start of the [underutilized] fixmap region by 512 KB as well, to ensure
> > that there is always a proper guard region here. Doing so still leaves
> > ample room for the fixmap space, even with NR_CPUS set to its maximum
> > value of 32.
> >
> > Tested-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> This patch landed in linux-next 20201028 as commit 7a1be318f579 ("ARM:
> 9012/1: move device tree mapping out of linear region"). Sadly it broke
> booting  almost all Samsung Exynos-based boards. The only one which
> booted, used an appended device tree. I can provide more information if
> needed, just let me know what to check. "Starting kernel ..." is the
> last message I see here. No output from earlycon.

A bisection lead me to this patch after the next-20201028 failed to
boot on the aspeed systems in testing (aspeed_g5_defconfig).

You can reproduce this with today's next and qemu 5.1:

qemu-system-arm -M romulus-bmc -nographic \
 -kernel arch/arm/boot/zImage \
 -dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb \
 -initrd any-old-file

It requires the initrd option to reproduce, but the initrd doesn't
need to be valid as we don't make it that far.

There is no output but attaching gdb shows the kernel is stuck in
setup_machine_tags. (If we enable CONFIG_ATAGS it is instead stuck in
calibrate_delay).

(gdb) bt
#0  setup_machine_tags (machine_nr=<optimized out>,
__atags_vaddr=<optimized out>) at ../arch/arm/kernel/atags.h:12
#1  setup_arch (cmdline_p=0x80c01fc4) at ../arch/arm/kernel/setup.c:1100
#2  0x80b00d2c in start_kernel () at ../init/main.c:862
#3  0x00000000 in ?? ()

Reverting 7a1be318f579 on top of next allowed the system to boot again.

Cheers,

Joel

>
> > ---
> >   Documentation/arm/memory.rst  |  7 ++++++-
> >   arch/arm/include/asm/fixmap.h |  2 +-
> >   arch/arm/include/asm/memory.h |  5 +++++
> >   arch/arm/kernel/head.S        |  5 ++---
> >   arch/arm/kernel/setup.c       | 11 ++++++++---
> >   arch/arm/mm/init.c            |  1 -
> >   arch/arm/mm/mmu.c             | 20 ++++++++++++++------
> >   arch/arm/mm/pv-fixup-asm.S    |  4 ++--
> >   8 files changed, 38 insertions(+), 17 deletions(-)
> >
> > diff --git a/Documentation/arm/memory.rst b/Documentation/arm/memory.rst
> > index 0521b4ce5c96..34bb23c44a71 100644
> > --- a/Documentation/arm/memory.rst
> > +++ b/Documentation/arm/memory.rst
> > @@ -45,9 +45,14 @@ fffe8000   fffeffff        DTCM mapping area for platforms with
> >   fffe0000    fffe7fff        ITCM mapping area for platforms with
> >                               ITCM mounted inside the CPU.
> >
> > -ffc00000     ffefffff        Fixmap mapping region.  Addresses provided
> > +ffc80000     ffefffff        Fixmap mapping region.  Addresses provided
> >                               by fix_to_virt() will be located here.
> >
> > +ffc00000     ffc7ffff        Guard region
> > +
> > +ff800000     ffbfffff        Permanent, fixed read-only mapping of the
> > +                             firmware provided DT blob
> > +
> >   fee00000    feffffff        Mapping of PCI I/O space. This is a static
> >                               mapping within the vmalloc space.
> >
> > diff --git a/arch/arm/include/asm/fixmap.h b/arch/arm/include/asm/fixmap.h
> > index fc56fc3e1931..9575b404019c 100644
> > --- a/arch/arm/include/asm/fixmap.h
> > +++ b/arch/arm/include/asm/fixmap.h
> > @@ -2,7 +2,7 @@
> >   #ifndef _ASM_FIXMAP_H
> >   #define _ASM_FIXMAP_H
> >
> > -#define FIXADDR_START                0xffc00000UL
> > +#define FIXADDR_START                0xffc80000UL
> >   #define FIXADDR_END         0xfff00000UL
> >   #define FIXADDR_TOP         (FIXADDR_END - PAGE_SIZE)
> >
> > diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
> > index 99035b5891ef..ad9dcf4f751d 100644
> > --- a/arch/arm/include/asm/memory.h
> > +++ b/arch/arm/include/asm/memory.h
> > @@ -67,6 +67,10 @@
> >    */
> >   #define XIP_VIRT_ADDR(physaddr)  (MODULES_VADDR + ((physaddr) & 0x000fffff))
> >
> > +#define FDT_FIXED_BASE               UL(0xff800000)
> > +#define FDT_FIXED_SIZE               (2 * PMD_SIZE)
> > +#define FDT_VIRT_ADDR(physaddr)      ((void *)(FDT_FIXED_BASE | (physaddr) % PMD_SIZE))
> > +
> >   #if !defined(CONFIG_SMP) && !defined(CONFIG_ARM_LPAE)
> >   /*
> >    * Allow 16MB-aligned ioremap pages
> > @@ -107,6 +111,7 @@ extern unsigned long vectors_base;
> >   #define MODULES_VADDR               PAGE_OFFSET
> >
> >   #define XIP_VIRT_ADDR(physaddr)  (physaddr)
> > +#define FDT_VIRT_ADDR(physaddr)  (physaddr)
> >
> >   #endif /* !CONFIG_MMU */
> >
> > diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
> > index f8904227e7fd..9b18d8c66129 100644
> > --- a/arch/arm/kernel/head.S
> > +++ b/arch/arm/kernel/head.S
> > @@ -275,9 +275,8 @@ __create_page_tables:
> >        */
> >       mov     r0, r2, lsr #SECTION_SHIFT
> >       movs    r0, r0, lsl #SECTION_SHIFT
> > -     subne   r3, r0, r8
> > -     addne   r3, r3, #PAGE_OFFSET
> > -     addne   r3, r4, r3, lsr #(SECTION_SHIFT - PMD_ORDER)
> > +     ldrne   r3, =FDT_FIXED_BASE >> (SECTION_SHIFT - PMD_ORDER)
> > +     addne   r3, r3, r4
> >       orrne   r6, r7, r0
> >       strne   r6, [r3], #1 << PMD_ORDER
> >       addne   r6, r6, #1 << SECTION_SHIFT
> > diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> > index 58e56e23a19a..c08574cad748 100644
> > --- a/arch/arm/kernel/setup.c
> > +++ b/arch/arm/kernel/setup.c
> > @@ -18,6 +18,7 @@
> >   #include <linux/of_platform.h>
> >   #include <linux/init.h>
> >   #include <linux/kexec.h>
> > +#include <linux/libfdt.h>
> >   #include <linux/of_fdt.h>
> >   #include <linux/cpu.h>
> >   #include <linux/interrupt.h>
> > @@ -90,7 +91,6 @@ unsigned int cacheid __read_mostly;
> >   EXPORT_SYMBOL(cacheid);
> >
> >   unsigned int __atags_pointer __initdata;
> > -void *atags_vaddr __initdata;
> >
> >   unsigned int system_rev;
> >   EXPORT_SYMBOL(system_rev);
> > @@ -1078,13 +1078,18 @@ void __init hyp_mode_check(void)
> >   void __init setup_arch(char **cmdline_p)
> >   {
> >       const struct machine_desc *mdesc = NULL;
> > +     void *atags_vaddr;
> >
> >       if (__atags_pointer)
> > -             atags_vaddr = phys_to_virt(__atags_pointer);
> > +             atags_vaddr = FDT_VIRT_ADDR(__atags_pointer);
> >
> >       setup_processor();
> > -     if (atags_vaddr)
> > +     if (atags_vaddr) {
> >               mdesc = setup_machine_fdt(atags_vaddr);
> > +             if (mdesc)
> > +                     memblock_reserve(__atags_pointer,
> > +                                      fdt_totalsize(atags_vaddr));
> > +     }
> >       if (!mdesc)
> >               mdesc = setup_machine_tags(atags_vaddr, __machine_arch_type);
> >       if (!mdesc) {
> > diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> > index 000c1b48e973..652a87bd065c 100644
> > --- a/arch/arm/mm/init.c
> > +++ b/arch/arm/mm/init.c
> > @@ -223,7 +223,6 @@ void __init arm_memblock_init(const struct machine_desc *mdesc)
> >       if (mdesc->reserve)
> >               mdesc->reserve();
> >
> > -     early_init_fdt_reserve_self();
> >       early_init_fdt_scan_reserved_mem();
> >
> >       /* reserve memory for DMA contiguous allocations */
> > diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
> > index 0665a0dbd040..a7231d151c63 100644
> > --- a/arch/arm/mm/mmu.c
> > +++ b/arch/arm/mm/mmu.c
> > @@ -40,6 +40,8 @@
> >   #include "mm.h"
> >   #include "tcm.h"
> >
> > +extern unsigned long __atags_pointer;
> > +
> >   /*
> >    * empty_zero_page is a special page that is used for
> >    * zero-initialized data and COW.
> > @@ -947,7 +949,7 @@ static void __init create_mapping(struct map_desc *md)
> >               return;
> >       }
> >
> > -     if ((md->type == MT_DEVICE || md->type == MT_ROM) &&
> > +     if (md->type == MT_DEVICE &&
> >           md->virtual >= PAGE_OFFSET && md->virtual < FIXADDR_START &&
> >           (md->virtual < VMALLOC_START || md->virtual >= VMALLOC_END)) {
> >               pr_warn("BUG: mapping for 0x%08llx at 0x%08lx out of vmalloc space\n",
> > @@ -1343,6 +1345,15 @@ static void __init devicemaps_init(const struct machine_desc *mdesc)
> >       for (addr = VMALLOC_START; addr < (FIXADDR_TOP & PMD_MASK); addr += PMD_SIZE)
> >               pmd_clear(pmd_off_k(addr));
> >
> > +     if (__atags_pointer) {
> > +             /* create a read-only mapping of the device tree */
> > +             map.pfn = __phys_to_pfn(__atags_pointer & SECTION_MASK);
> > +             map.virtual = FDT_FIXED_BASE;
> > +             map.length = FDT_FIXED_SIZE;
> > +             map.type = MT_ROM;
> > +             create_mapping(&map);
> > +     }
> > +
> >       /*
> >        * Map the kernel if it is XIP.
> >        * It is always first in the modulearea.
> > @@ -1503,8 +1514,7 @@ static void __init map_lowmem(void)
> >   }
> >
> >   #ifdef CONFIG_ARM_PV_FIXUP
> > -extern void *atags_vaddr;
> > -typedef void pgtables_remap(long long offset, unsigned long pgd, void *bdata);
> > +typedef void pgtables_remap(long long offset, unsigned long pgd);
> >   pgtables_remap lpae_pgtables_remap_asm;
> >
> >   /*
> > @@ -1517,7 +1527,6 @@ static void __init early_paging_init(const struct machine_desc *mdesc)
> >       unsigned long pa_pgd;
> >       unsigned int cr, ttbcr;
> >       long long offset;
> > -     void *boot_data;
> >
> >       if (!mdesc->pv_fixup)
> >               return;
> > @@ -1534,7 +1543,6 @@ static void __init early_paging_init(const struct machine_desc *mdesc)
> >        */
> >       lpae_pgtables_remap = (pgtables_remap *)(unsigned long)__pa(lpae_pgtables_remap_asm);
> >       pa_pgd = __pa(swapper_pg_dir);
> > -     boot_data = atags_vaddr;
> >       barrier();
> >
> >       pr_info("Switching physical address space to 0x%08llx\n",
> > @@ -1570,7 +1578,7 @@ static void __init early_paging_init(const struct machine_desc *mdesc)
> >        * needs to be assembly.  It's fairly simple, as we're using the
> >        * temporary tables setup by the initial assembly code.
> >        */
> > -     lpae_pgtables_remap(offset, pa_pgd, boot_data);
> > +     lpae_pgtables_remap(offset, pa_pgd);
> >
> >       /* Re-enable the caches and cacheable TLB walks */
> >       asm volatile("mcr p15, 0, %0, c2, c0, 2" : : "r" (ttbcr));
> > diff --git a/arch/arm/mm/pv-fixup-asm.S b/arch/arm/mm/pv-fixup-asm.S
> > index 8eade0416739..5c5e1952000a 100644
> > --- a/arch/arm/mm/pv-fixup-asm.S
> > +++ b/arch/arm/mm/pv-fixup-asm.S
> > @@ -39,8 +39,8 @@ ENTRY(lpae_pgtables_remap_asm)
> >
> >       /* Update level 2 entries for the boot data */
> >       add     r7, r2, #0x1000
> > -     add     r7, r7, r3, lsr #SECTION_SHIFT - L2_ORDER
> > -     bic     r7, r7, #(1 << L2_ORDER) - 1
> > +     movw    r3, #FDT_FIXED_BASE >> (SECTION_SHIFT - L2_ORDER)
> > +     add     r7, r7, r3
> >       ldrd    r4, r5, [r7]
> >       adds    r4, r4, r0
> >       adc     r5, r5, r1
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
