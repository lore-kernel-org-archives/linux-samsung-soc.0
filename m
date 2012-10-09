From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS5: Remove wrongly placed usb2.0 PHY_CFG
 definition from PMU_REG
Date: Tue, 09 Oct 2012 17:34:59 +0900
Message-ID: <003b01cda5f8$f84e35c0$e8eaa140$%han@samsung.com>
References: <1349443590-29901-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49555 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752458Ab2JIIfC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Oct 2012 04:35:02 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBM00GQMAHNZ420@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Oct 2012 17:35:00 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBM00CPUAIB0X10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Oct 2012 17:34:59 +0900 (KST)
In-reply-to: <1349443590-29901-1-git-send-email-gautam.vivek@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

On Friday, October 05, 2012 10:27 PM Vivek Gautam wrote
> 
> EXYNOS5_USB_CFG macro should actually point to USB20PHY_CFG
> system register (base addr + 0x230). It's wrongly placed in regs-pmu.
> Actual register at offset 0x230 in PMU is SEQ_TRANSITION4.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>

As you mentioned, this definition is wrong.
So, it should be removed.

Reviewed-by: Jingoo Han <jg1.han@samsung.com>


> ---
>  arch/arm/mach-exynos/include/mach/regs-pmu.h |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/include/mach/regs-pmu.h b/arch/arm/mach-exynos/include/mach/regs-pmu.h
> index d4e392b..70b2795 100644
> --- a/arch/arm/mach-exynos/include/mach/regs-pmu.h
> +++ b/arch/arm/mach-exynos/include/mach/regs-pmu.h
> @@ -230,8 +230,6 @@
> 
>  /* For EXYNOS5 */
> 
> -#define EXYNOS5_USB_CFG						S5P_PMUREG(0x0230)
> -
>  #define EXYNOS5_AUTO_WDTRESET_DISABLE				S5P_PMUREG(0x0408)
>  #define EXYNOS5_MASK_WDTRESET_REQUEST				S5P_PMUREG(0x040C)
> 
> --
> 1.7.6.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
