Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1BFC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:54:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79D5720790
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:54:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="j2943dn/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgJ2Ay6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:54:58 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34876 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731786AbgJ1WSG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:18:06 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201028091918euoutp02cafa32518b89629f30214aa513050749~CHWoBL-hU3170131701euoutp02P
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 09:19:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201028091918euoutp02cafa32518b89629f30214aa513050749~CHWoBL-hU3170131701euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603876758;
        bh=IjTwsA7iT0jEl+TzwK32J0foZxre9zzAKlymerkXtJ4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=j2943dn/YirTXzdunC6rQvIfRqgbZUUR/XJIf0Pb6Dm0pAVklOw2x0uTT1lYY4Gd8
         q8MAanUIkh/UPfCeOc4GWlSYX/DX6RikaSSiJNPd201VsCKGcXX68PsEp0gdWcMUO8
         WWFOfCzCMO0w+zoy8br4gVYSPzMu1qLa5FC4CtSY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201028091913eucas1p21c355bef082119e2b6e4830a7ddcad08~CHWjJaVXk0660706607eucas1p2A;
        Wed, 28 Oct 2020 09:19:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 42.5C.06318.197399F5; Wed, 28
        Oct 2020 09:19:13 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af~CHWizDeS72352023520eucas1p1R;
        Wed, 28 Oct 2020 09:19:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201028091912eusmtrp19899f8382158128b84fe2b85fab456fe~CHWiyWauU1261612616eusmtrp12;
        Wed, 28 Oct 2020 09:19:12 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-ca-5f993791dcda
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 25.01.06314.097399F5; Wed, 28
        Oct 2020 09:19:12 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201028091912eusmtip2fae13b3b7609489a2e9ddd0a56b91629~CHWiR9lrH2136521365eusmtip2e;
        Wed, 28 Oct 2020 09:19:12 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] ARM: move device tree mapping out of linear
 region
To:     Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <920965b8-6f87-3f82-9fce-d3051fc543ca@samsung.com>
Date:   Wed, 28 Oct 2020 10:19:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201007083944.27910-3-ardb@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfSxVcRjH97vn3HPOVdd+LvGkpnbXy7SQYc4mhrLd/rBpa/7I0JUzV3Hp
        XkRrS0TcyVCG29bbNC8Vdb3MO91EGFdsXqLSmFFJy0tjWB2H8t/zfL+f53l+3+3HELImsS0T
        qY7jNGpllJwyI2s7Vvocct2LQk9UP5WwK4vziF390U6zJtNLmr23ViJiDZNDYrbQ1CJijfnN
        iH0wM0Oxac3ttLdEMTj0nlBMv7tNKer1H2mFoTyTUowPNVGKquIbigWDXQB93uxkOBcVmcBp
        nLwumKmKMwdQ7LJ/oqG/VpyMZj11SMIAdoWsjFWxDpkxMlyKwFB2i+ANGV5E0DkiE4wFBBVL
        NWh7orWqRiRAJQgae1wFaB7Bc1MlxRuWOADmZ3JI3rDCFQhWP01RfEPgNwiyf77aHKewM+jm
        dJsTUuwFK/pWWocYhsSHIbn3EC/vwWGwvrBGCIgFdBVNkTwiwW5Q3WDPywQ+AKk19wmhtoEP
        Uw9F/CnAQzQ8ezhA8Dzg05CvjxUCWMLXzmpaqPdDz90sUuBTEXzpe0ELTRaCwZTCrcgeMN63
        SvGLCGwPlQ1OguwD7cmjW/vNYWTOQniDOeTVFmzJUshIlwn0EdB3Vvw7+7p/gMhBcv2OYPod
        afQ70uj/332EyHJkw8VroyM4rYuau+qoVUZr49URjhdjog3o75/q2ehcqkMta2FGhBkk3y0d
        OVgYKhMrE7RJ0UYEDCG3kvr29oTIpOHKpGucJiZUEx/FaY1oH0PKbaQuT2aDZThCGcdd5rhY
        TrPtihiJbTIK9xu+7i+ejc3LCEzwtTGNxdG96w2+d5iwwcJ6u9G69AmpSnV274Bfy1jlqfa2
        7pTvXd5tC74hDpeuBHdPf1P7OwVZllIbbkfPnBu2tg+wDcolPSezR9zFBbseN6pEVca69F8e
        rg6z1jddIE0+n1hXsfz7uEegT5md+duJjsC2z3JSq1I6HyM0WuUfKOf1Q08DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xe7oTzGfGGyx8qmvx88t7Rotf746w
        W5w/v4HdYsqf5UwWmx5fY7WYcX4fk8WhqXsZLea9eMFm0br3CLsDp8flaxeZPZ6daGfz2Dnr
        LrvHplWdbB53ru1h89i8pN7j8ya5APYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2Pz
        WCsjUyV9O5uU1JzMstQifbsEvYwlnZcYC775Vmy6sI21gfGlbRcjJ4eEgInE/s1bmUBsIYGl
        jBIdS/0g4jISJ6c1sELYwhJ/rnWxdTFyAdW8ZZRo3P2JGSQhLOAnsXrvT1aQhIjAOkaJNVOa
        mUEcZoHDjBInOzexQoyNl3h7/TgLiM0mYCjR9RZkFCcHr4CdxM9Z+9m7GDk4WARUJRrOqoCE
        RQWSJF5emMoEUSIocXLmExaQEk4BU4ktuzRBwswCZhLzNj9khrDlJZq3zoayxSVuPZnPNIFR
        aBaS7llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwMjcduzn5h2MlzYG
        H2IU4GBU4uG9oTAjXog1say4MvcQowQHs5IIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGE2BXpvI
        LCWanA9MGnkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhidOTTY
        uzOioyem6mZZJVVUHQgov7Yw9OKOgxlqdkc7fA7MvCD9cv8PTjPmXlXz6vfHdiRP4965YN2C
        infMtTVn968yk5vgm239/daH2JuRLXvnPVtqaPvlzNvkaJfLXRHzpq40vPXeXPsM5y5B7v2H
        T+pcPv7xue19qazpR8TVpY9+3Xtjk/o7JZbijERDLeai4kQAa+qmPOICAAA=
X-CMS-MailID: 20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af
References: <20201007083944.27910-1-ardb@kernel.org>
        <20201007083944.27910-3-ardb@kernel.org>
        <CGME20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 07.10.2020 10:39, Ard Biesheuvel wrote:
> On ARM, setting up the linear region is tricky, given the constraints
> around placement and alignment of the memblocks, and how the kernel
> itself as well as the DT are placed in physical memory.
>
> Let's simplify matters a bit, by moving the device tree mapping to the
> top of the address space, right between the end of the vmalloc region
> and the start of the the fixmap region, and create a read-only mapping
> for it that is independent of the size of the linear region, and how it
> is organized.
>
> Since this region was formerly used as a guard region, which will now be
> populated fully on LPAE builds by this read-only mapping (which will
> still be able to function as a guard region for stray writes), bump the
> start of the [underutilized] fixmap region by 512 KB as well, to ensure
> that there is always a proper guard region here. Doing so still leaves
> ample room for the fixmap space, even with NR_CPUS set to its maximum
> value of 32.
>
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

This patch landed in linux-next 20201028 as commit 7a1be318f579 ("ARM: 
9012/1: move device tree mapping out of linear region"). Sadly it broke 
booting  almost all Samsung Exynos-based boards. The only one which 
booted, used an appended device tree. I can provide more information if 
needed, just let me know what to check. "Starting kernel ..." is the 
last message I see here. No output from earlycon.

> ---
>   Documentation/arm/memory.rst  |  7 ++++++-
>   arch/arm/include/asm/fixmap.h |  2 +-
>   arch/arm/include/asm/memory.h |  5 +++++
>   arch/arm/kernel/head.S        |  5 ++---
>   arch/arm/kernel/setup.c       | 11 ++++++++---
>   arch/arm/mm/init.c            |  1 -
>   arch/arm/mm/mmu.c             | 20 ++++++++++++++------
>   arch/arm/mm/pv-fixup-asm.S    |  4 ++--
>   8 files changed, 38 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/arm/memory.rst b/Documentation/arm/memory.rst
> index 0521b4ce5c96..34bb23c44a71 100644
> --- a/Documentation/arm/memory.rst
> +++ b/Documentation/arm/memory.rst
> @@ -45,9 +45,14 @@ fffe8000	fffeffff	DTCM mapping area for platforms with
>   fffe0000	fffe7fff	ITCM mapping area for platforms with
>   				ITCM mounted inside the CPU.
>   
> -ffc00000	ffefffff	Fixmap mapping region.  Addresses provided
> +ffc80000	ffefffff	Fixmap mapping region.  Addresses provided
>   				by fix_to_virt() will be located here.
>   
> +ffc00000	ffc7ffff	Guard region
> +
> +ff800000	ffbfffff	Permanent, fixed read-only mapping of the
> +				firmware provided DT blob
> +
>   fee00000	feffffff	Mapping of PCI I/O space. This is a static
>   				mapping within the vmalloc space.
>   
> diff --git a/arch/arm/include/asm/fixmap.h b/arch/arm/include/asm/fixmap.h
> index fc56fc3e1931..9575b404019c 100644
> --- a/arch/arm/include/asm/fixmap.h
> +++ b/arch/arm/include/asm/fixmap.h
> @@ -2,7 +2,7 @@
>   #ifndef _ASM_FIXMAP_H
>   #define _ASM_FIXMAP_H
>   
> -#define FIXADDR_START		0xffc00000UL
> +#define FIXADDR_START		0xffc80000UL
>   #define FIXADDR_END		0xfff00000UL
>   #define FIXADDR_TOP		(FIXADDR_END - PAGE_SIZE)
>   
> diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
> index 99035b5891ef..ad9dcf4f751d 100644
> --- a/arch/arm/include/asm/memory.h
> +++ b/arch/arm/include/asm/memory.h
> @@ -67,6 +67,10 @@
>    */
>   #define XIP_VIRT_ADDR(physaddr)  (MODULES_VADDR + ((physaddr) & 0x000fffff))
>   
> +#define FDT_FIXED_BASE		UL(0xff800000)
> +#define FDT_FIXED_SIZE		(2 * PMD_SIZE)
> +#define FDT_VIRT_ADDR(physaddr)	((void *)(FDT_FIXED_BASE | (physaddr) % PMD_SIZE))
> +
>   #if !defined(CONFIG_SMP) && !defined(CONFIG_ARM_LPAE)
>   /*
>    * Allow 16MB-aligned ioremap pages
> @@ -107,6 +111,7 @@ extern unsigned long vectors_base;
>   #define MODULES_VADDR		PAGE_OFFSET
>   
>   #define XIP_VIRT_ADDR(physaddr)  (physaddr)
> +#define FDT_VIRT_ADDR(physaddr)  (physaddr)
>   
>   #endif /* !CONFIG_MMU */
>   
> diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
> index f8904227e7fd..9b18d8c66129 100644
> --- a/arch/arm/kernel/head.S
> +++ b/arch/arm/kernel/head.S
> @@ -275,9 +275,8 @@ __create_page_tables:
>   	 */
>   	mov	r0, r2, lsr #SECTION_SHIFT
>   	movs	r0, r0, lsl #SECTION_SHIFT
> -	subne	r3, r0, r8
> -	addne	r3, r3, #PAGE_OFFSET
> -	addne	r3, r4, r3, lsr #(SECTION_SHIFT - PMD_ORDER)
> +	ldrne	r3, =FDT_FIXED_BASE >> (SECTION_SHIFT - PMD_ORDER)
> +	addne	r3, r3, r4
>   	orrne	r6, r7, r0
>   	strne	r6, [r3], #1 << PMD_ORDER
>   	addne	r6, r6, #1 << SECTION_SHIFT
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index 58e56e23a19a..c08574cad748 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -18,6 +18,7 @@
>   #include <linux/of_platform.h>
>   #include <linux/init.h>
>   #include <linux/kexec.h>
> +#include <linux/libfdt.h>
>   #include <linux/of_fdt.h>
>   #include <linux/cpu.h>
>   #include <linux/interrupt.h>
> @@ -90,7 +91,6 @@ unsigned int cacheid __read_mostly;
>   EXPORT_SYMBOL(cacheid);
>   
>   unsigned int __atags_pointer __initdata;
> -void *atags_vaddr __initdata;
>   
>   unsigned int system_rev;
>   EXPORT_SYMBOL(system_rev);
> @@ -1078,13 +1078,18 @@ void __init hyp_mode_check(void)
>   void __init setup_arch(char **cmdline_p)
>   {
>   	const struct machine_desc *mdesc = NULL;
> +	void *atags_vaddr;
>   
>   	if (__atags_pointer)
> -		atags_vaddr = phys_to_virt(__atags_pointer);
> +		atags_vaddr = FDT_VIRT_ADDR(__atags_pointer);
>   
>   	setup_processor();
> -	if (atags_vaddr)
> +	if (atags_vaddr) {
>   		mdesc = setup_machine_fdt(atags_vaddr);
> +		if (mdesc)
> +			memblock_reserve(__atags_pointer,
> +					 fdt_totalsize(atags_vaddr));
> +	}
>   	if (!mdesc)
>   		mdesc = setup_machine_tags(atags_vaddr, __machine_arch_type);
>   	if (!mdesc) {
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 000c1b48e973..652a87bd065c 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -223,7 +223,6 @@ void __init arm_memblock_init(const struct machine_desc *mdesc)
>   	if (mdesc->reserve)
>   		mdesc->reserve();
>   
> -	early_init_fdt_reserve_self();
>   	early_init_fdt_scan_reserved_mem();
>   
>   	/* reserve memory for DMA contiguous allocations */
> diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
> index 0665a0dbd040..a7231d151c63 100644
> --- a/arch/arm/mm/mmu.c
> +++ b/arch/arm/mm/mmu.c
> @@ -40,6 +40,8 @@
>   #include "mm.h"
>   #include "tcm.h"
>   
> +extern unsigned long __atags_pointer;
> +
>   /*
>    * empty_zero_page is a special page that is used for
>    * zero-initialized data and COW.
> @@ -947,7 +949,7 @@ static void __init create_mapping(struct map_desc *md)
>   		return;
>   	}
>   
> -	if ((md->type == MT_DEVICE || md->type == MT_ROM) &&
> +	if (md->type == MT_DEVICE &&
>   	    md->virtual >= PAGE_OFFSET && md->virtual < FIXADDR_START &&
>   	    (md->virtual < VMALLOC_START || md->virtual >= VMALLOC_END)) {
>   		pr_warn("BUG: mapping for 0x%08llx at 0x%08lx out of vmalloc space\n",
> @@ -1343,6 +1345,15 @@ static void __init devicemaps_init(const struct machine_desc *mdesc)
>   	for (addr = VMALLOC_START; addr < (FIXADDR_TOP & PMD_MASK); addr += PMD_SIZE)
>   		pmd_clear(pmd_off_k(addr));
>   
> +	if (__atags_pointer) {
> +		/* create a read-only mapping of the device tree */
> +		map.pfn = __phys_to_pfn(__atags_pointer & SECTION_MASK);
> +		map.virtual = FDT_FIXED_BASE;
> +		map.length = FDT_FIXED_SIZE;
> +		map.type = MT_ROM;
> +		create_mapping(&map);
> +	}
> +
>   	/*
>   	 * Map the kernel if it is XIP.
>   	 * It is always first in the modulearea.
> @@ -1503,8 +1514,7 @@ static void __init map_lowmem(void)
>   }
>   
>   #ifdef CONFIG_ARM_PV_FIXUP
> -extern void *atags_vaddr;
> -typedef void pgtables_remap(long long offset, unsigned long pgd, void *bdata);
> +typedef void pgtables_remap(long long offset, unsigned long pgd);
>   pgtables_remap lpae_pgtables_remap_asm;
>   
>   /*
> @@ -1517,7 +1527,6 @@ static void __init early_paging_init(const struct machine_desc *mdesc)
>   	unsigned long pa_pgd;
>   	unsigned int cr, ttbcr;
>   	long long offset;
> -	void *boot_data;
>   
>   	if (!mdesc->pv_fixup)
>   		return;
> @@ -1534,7 +1543,6 @@ static void __init early_paging_init(const struct machine_desc *mdesc)
>   	 */
>   	lpae_pgtables_remap = (pgtables_remap *)(unsigned long)__pa(lpae_pgtables_remap_asm);
>   	pa_pgd = __pa(swapper_pg_dir);
> -	boot_data = atags_vaddr;
>   	barrier();
>   
>   	pr_info("Switching physical address space to 0x%08llx\n",
> @@ -1570,7 +1578,7 @@ static void __init early_paging_init(const struct machine_desc *mdesc)
>   	 * needs to be assembly.  It's fairly simple, as we're using the
>   	 * temporary tables setup by the initial assembly code.
>   	 */
> -	lpae_pgtables_remap(offset, pa_pgd, boot_data);
> +	lpae_pgtables_remap(offset, pa_pgd);
>   
>   	/* Re-enable the caches and cacheable TLB walks */
>   	asm volatile("mcr p15, 0, %0, c2, c0, 2" : : "r" (ttbcr));
> diff --git a/arch/arm/mm/pv-fixup-asm.S b/arch/arm/mm/pv-fixup-asm.S
> index 8eade0416739..5c5e1952000a 100644
> --- a/arch/arm/mm/pv-fixup-asm.S
> +++ b/arch/arm/mm/pv-fixup-asm.S
> @@ -39,8 +39,8 @@ ENTRY(lpae_pgtables_remap_asm)
>   
>   	/* Update level 2 entries for the boot data */
>   	add	r7, r2, #0x1000
> -	add	r7, r7, r3, lsr #SECTION_SHIFT - L2_ORDER
> -	bic	r7, r7, #(1 << L2_ORDER) - 1
> +	movw	r3, #FDT_FIXED_BASE >> (SECTION_SHIFT - L2_ORDER)
> +	add	r7, r7, r3
>   	ldrd	r4, r5, [r7]
>   	adds	r4, r4, r0
>   	adc	r5, r5, r1

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

