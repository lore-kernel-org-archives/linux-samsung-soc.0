From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Add MFC device tree support
Date: Mon, 20 Aug 2012 15:17:23 +0900
Message-ID: <5031D673.6060104@samsung.com>
References: <1345120273-22913-1-git-send-email-arun.kk@samsung.com>
 <1345120273-22913-2-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:23713 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673Ab2HTGRa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Aug 2012 02:17:30 -0400
Received: from eusync1.samsung.com (mailout3.w1.samsung.com [210.118.77.13])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M91004VLIU0UX00@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Aug 2012 07:18:00 +0100 (BST)
Received: from [10.0.2.15] ([10.90.7.33])
 by eusync1.samsung.com (Oracle Communications Messaging Server 7u4-23.01
 (7.0.4.23.0) 64bit (built Aug 10 2011))
 with ESMTPA id <0M9100573ISZQ150@eusync1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Aug 2012 07:17:28 +0100 (BST)
In-reply-to: <1345120273-22913-2-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, ch.naveen@samsung.com, joshi@samsung.com

On 08/16/2012 08:42 PM, Thomas Abraham wrote:
> On 16 August 2012 18:01, Arun Kumar K <arun.kk ... @public.gmane.org> wrote:

>> +  - interrupts : MFC interupt number to the CPU.
>> +
>> +  - samsung,mfc-r : Base address of the first memory bank used by MFC
>> +                   for DMA contiguous memory allocation.
>> +
>> +  - samsung,mfc-r-size : Size of the first memory bank.
> 
> It is not allowed to pass buffer base address and size from device
> tree. Device tree node should describe only the MFC controller
> hardware. Any memory management related information should be handled
> outside of device tree. This helps the bindings to be reusable across
> multiple operating systems.

The question is where elsewhere this should be described as this is strictly
board-dependent option (number and size of RAM banks are important here).

I agree that base addresses are bad, but I'm not aware of any functionality
that would allow driver (actually, its platform dependent part in
exynosN_reserve() function) to enumerate available memory banks and grab
memory chunks from two distinct banks.

My (lack of) knowledge ARM might be to blame here but I simply don't know
how to achieve this. Any suggestions?


On 08/16/2012 09:31 PM, Arun Kumar K wrote:

> +static void s5p_mfc_reserve_mem(phys_addr_t rbase, unsigned int rsize,
> +		phys_addr_t lbase, unsigned int lsize) {
> +
> +	if (memblock_remove(lbase, lsize)) {
> +		pr_err("Failed to reserve bank1 memory for MFC device\n");
> +		WARN_ON(1);
> +	}
> +
> +	if (memblock_remove(rbase, rsize)) {
> +		pr_err("Failed to reserve bank2 memory for MFC device\n");
> +		WARN_ON(1);
> +	}
> +}


non-static function with the same name is already defined in
arch/arm/plat-samsung/s5p-dev-mfc.c. Please don't duplicate it,
especially that you seem to be trying to do that twice!


> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c

> index ef770bc..898d2de 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
...
> +static void s5p_mfc_reserve_mem(phys_addr_t rbase, unsigned int rsize,
> +		phys_addr_t lbase, unsigned int lsize) {
> +
> +	if (memblock_remove(lbase, lsize)) {
> +		pr_err("Failed to reserve bank1 memory for MFC device\n");
> +		WARN_ON(1);
> +	}
> +
> +	if (memblock_remove(rbase, rsize)) {
> +		pr_err("Failed to reserve bank2 memory for MFC device\n");
> +		WARN_ON(1);
> +	}
> +}


See above.

> +
> +static void __init exynos5_reserve(void)
> +{
> +	s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);


I think it would make sense to make this memory reservation dependent
on "mfc*" node being present in DTS.  It's to early to use of_* functions
(because tree is not populated at this stage) but fdt_* family of functions
work just fine.

Regards,
-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
