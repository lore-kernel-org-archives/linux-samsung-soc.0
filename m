Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBC9C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 01:01:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2FF520791
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 01:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603933299;
	bh=9omObgFk9HUjEhy2yLwXcASd2BqfUuUqf8/Ec8xDwkI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=qpMfieiJhAKgmWLFgLRowPls5dQY5Ye3qr5UHzqpGfFozjr2Ivsh8JS2hiB2QivJF
	 PtnKQ9PoiXzUcKSM6raHhDcHsaRrARTKqrahUmQ+5YckvkSNAleKEPQ2L6w6SwFVqk
	 MB3GopWKsp/89Sw2ZXCVveuYIdWFwvqKaTtE6r9g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730671AbgJ2BBZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 21:01:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:60508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731509AbgJ1WR1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:27 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 18BF621534
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 09:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603876972;
        bh=9omObgFk9HUjEhy2yLwXcASd2BqfUuUqf8/Ec8xDwkI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=y9ki5fdVgGSsFx3eVnVRfV6lsjgHLXj51lznvw0qBmFXk6ODEZ3ibDiAREsfzZSFF
         lsjsTG6MDI/xjl8buvcftLR7vxckZYsSIQpmy8Jv0qD6In3DR1OLndr8jAs2pBU18E
         vNUtiTqf98W3Mj3IiDU+3I5S0Gh7lxubb3NKR/IY=
Received: by mail-oi1-f176.google.com with SMTP id k65so4286925oih.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 02:22:52 -0700 (PDT)
X-Gm-Message-State: AOAM530o66QLiix86EFYa2o28mzSgkvlaENK/1EEb+s81z9Ner6nrgTR
        A7h2QfyIKth1tuoY59GFnXbpiCTpe/FQW6L7GwY=
X-Google-Smtp-Source: ABdhPJwoah7prjZ/1yTBlESFoo54oxtmpidiEuxSFJxMCwhylUvk/yNuWKcYZYfcEQ8W/t9GRALwwkwGZIMp3xjAqhg=
X-Received: by 2002:aca:d64f:: with SMTP id n76mr4795314oig.174.1603876969181;
 Wed, 28 Oct 2020 02:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201007083944.27910-1-ardb@kernel.org> <CGME20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af@eucas1p1.samsung.com>
 <20201007083944.27910-3-ardb@kernel.org> <920965b8-6f87-3f82-9fce-d3051fc543ca@samsung.com>
In-Reply-To: <920965b8-6f87-3f82-9fce-d3051fc543ca@samsung.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 28 Oct 2020 10:22:38 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG-HcwhX9UJz3L-RYeBYcBZWJAt_arD_i4iMNvFcogXSw@mail.gmail.com>
Message-ID: <CAMj1kXG-HcwhX9UJz3L-RYeBYcBZWJAt_arD_i4iMNvFcogXSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: move device tree mapping out of linear region
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 28 Oct 2020 at 10:19, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
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
>

Thanks for the report. I will have a look later today.

Do these platforms happen to have any static device mappings that may
collide with this mapping of the FDT? Also, could this be related to
device drivers making changes in memory to the FDT image? Because the
permanent mapping of the FDT is read-only now.



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
