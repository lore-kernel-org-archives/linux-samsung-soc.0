From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: Re: [PATCH v3] ARM: EXYNOS: Add MFC device tree support
Date: Wed, 19 Sep 2012 11:38:53 +0200
Message-ID: <505992AD.9080601@samsung.com>
References: <1347637097-15015-1-git-send-email-arun.kk@samsung.com>
 <1347637097-15015-2-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:16249 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754296Ab2ISJi5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 05:38:57 -0400
Received: from eusync1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAL008LPC5JMP70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Sep 2012 10:39:19 +0100 (BST)
Received: from [10.0.2.15] ([106.116.147.84])
 by eusync1.samsung.com (Oracle Communications Messaging Server 7u4-23.01
 (7.0.4.23.0) 64bit (built Aug 10 2011))
 with ESMTPA id <0MAL00B5GC4T6M40@eusync1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Sep 2012 10:38:54 +0100 (BST)
In-reply-to: <1347637097-15015-2-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, thomas.abraham@linaro.org, s.nawrocki@samsung.com, ch.naveen@samsung.com, joshi@samsung.com

On 09/14/2012 05:38 PM, Arun Kumar K wrote:

> This patch adds device tree entry for MFC v6 in the Exynos5
> SoC. Makes the required changes in the clock files and adds
> MFC to the DT device list.


Hi!

Thanks for working on this patch. Please allow me to add few
comments.


> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index b55794b..5df2f99 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -62,6 +62,12 @@
>  		interrupts = <0 42 0>;
>  	};
>  
> +	mfc {


Nitpick - shouldn't node names be generic?  MFC is strictly
samsung specific, something like "codec"/"video-codec" would make
more sense (IMVHO). I would prefer to see address too (e.g.
codec@0x11000000).

However, I do see that rtc below doesn't specify address in node too,
so maybe I'm missing something here.


>  
> +struct mfc_dt_meminfo {
> +	unsigned long loff;
> +	unsigned long lsize;
> +	unsigned long roff;
> +	unsigned long rsize;


  char *compatible;

> +};
> +
> +int fdt_find_mfc_mem(unsigned long node, const char *uname, int depth,
> +		void *data)
> +{
> +	__be32 *prop;
> +	unsigned long len;
> +	struct mfc_dt_meminfo *mfc_mem = data;
> +
> +	if (!of_flat_dt_is_compatible(node, "samsung,mfc-v6"))
> +		return 0;


  if (!of_flat_dt_is_compatible(node, mfc_mem->compatible))
	return 0;

> +
> +	prop = of_get_flat_dt_prop(node, "samsung,mfc-l", &len);
> +	if (!prop)
> +		return 0;
> +	mfc_mem->loff = of_read_ulong(prop, len/4);
> +
> +	prop = of_get_flat_dt_prop(node, "samsung,mfc-l-size", &len);
> +	if (!prop)
> +		return 0;
> +	mfc_mem->lsize = of_read_ulong(prop, len/4);
> +
> +	prop = of_get_flat_dt_prop(node, "samsung,mfc-r", &len);
> +	if (!prop)
> +		return 0;
> +	mfc_mem->roff = of_read_ulong(prop, len/4);
> +
> +	prop = of_get_flat_dt_prop(node, "samsung,mfc-r-size", &len);
> +	if (!prop)
> +		return 0;
> +	mfc_mem->rsize = of_read_ulong(prop, len/4);
> +
> +	return 1;
> +}


Above function could be reused for mfc-v5 (exynos4-dt.c) if compatible
string weren't hardcoded. Thus, please consider changing that and
moving this function to some common(.c?) file - you can see one possible
solution inline.

> +
> +static void __init exynos5_reserve(void)
> +{
> +	struct mfc_dt_meminfo mfc_mem;


        mfc_mem.compatible = "samsung,mfc-v6";

> +
> +	/* Reserve memory for MFC only if it's available */
> +	if (of_scan_flat_dt(fdt_find_mfc_mem, &mfc_mem))
> +		s5p_mfc_reserve_mem(mfc_mem.roff, mfc_mem.rsize, mfc_mem.loff,
> +				mfc_mem.lsize);
> +}
> +
>  DT_MACHINE_START(EXYNOS5_DT, "SAMSUNG EXYNOS5 (Flattened Device Tree)")
>  	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
>  	.init_irq	= exynos5_init_irq,
> @@ -94,4 +148,5 @@ DT_MACHINE_START(EXYNOS5_DT, "SAMSUNG EXYNOS5 (Flattened Device Tree)")
>  	.timer		= &exynos4_timer,
>  	.dt_compat	= exynos5250_dt_compat,
>  	.restart        = exynos5_restart,
> +	.reserve	= exynos5_reserve,
>  MACHINE_END


Regards,
-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
