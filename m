From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3] arm: plat-samsung: check processor type before cache
 restoration in resume
Date: Mon, 11 Mar 2013 16:05:44 +0900
Message-ID: <052201ce1e26$d9886bf0$8c9943d0$%kim@samsung.com>
References: <1361961363-28412-1-git-send-email-inderpal.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42883 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392Ab3CKHFq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Mar 2013 03:05:46 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJH00BLAIDK8Z80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Mar 2013 16:05:45 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MJH00EXBIDKCN60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Mar 2013 16:05:44 +0900 (KST)
In-reply-to: <1361961363-28412-1-git-send-email-inderpal.singh@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Inderpal Singh' <inderpal.singh@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux@arm.linux.org.uk, patches@linaro.org

Inderpal Singh wrote:
> 
> Only cortex-a9 based samsung platforms have l2x0 cache controller. Hence check
> the same before restoring the cache in resume.
> 
> This is needed for single kernel image.
> 
> Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
> ---
> changes in v2:
>         - check processor midr instead of checking all soc ids as
>         suggested by Kukjin
> 
> changes in v3:
> 	- simplify by reading midr in assembly as per Russell
> 
>  arch/arm/plat-samsung/s5p-sleep.S |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/plat-samsung/s5p-sleep.S b/arch/arm/plat-samsung/s5p-
> sleep.S
> index bdf6dad..6e15993 100644
> --- a/arch/arm/plat-samsung/s5p-sleep.S
> +++ b/arch/arm/plat-samsung/s5p-sleep.S
> @@ -25,6 +25,9 @@
>  #include <asm/asm-offsets.h>
>  #include <asm/hardware/cache-l2x0.h>
> 
> +#define CPU_MASK	0xff0ffff0
> +#define CPU_CORTEX_A9	0x410fc090
> +
>  /*
>   *	 The following code is located into the .data section. This is to
>   *	 allow l2x0_regs_phys to be accessed with a relative load while we
> @@ -51,6 +54,12 @@
> 
>  ENTRY(s3c_cpu_resume)
>  #ifdef CONFIG_CACHE_L2X0
> +	mrc     p15, 0, r0, c0, c0, 0
> +	ldr	r1, =CPU_MASK
> +	and	r0, r0, r1
> +	ldr	r1, =CPU_CORTEX_A9
> +	cmp	r0, r1
> +	bne	resume_l2on
>  	adr	r0, l2x0_regs_phys
>  	ldr	r0, [r0]
>  	ldr	r1, [r0, #L2X0_R_PHY_BASE]
> --
> 1.7.9.5

Looks good to me, applied.

Thanks.

- Kukjin
