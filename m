From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Support Suspend-to-RAM on EXYNOS5420
Date: Mon, 16 Dec 2013 13:48:33 +0100
Message-ID: <2459303.277Jr8aotM@amdc1032>
References: <1387195271-3613-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55293 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752742Ab3LPMsx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Dec 2013 07:48:53 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXW00C1EGXG46C0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Dec 2013 21:48:52 +0900 (KST)
In-reply-to: <1387195271-3613-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Abhilash Kesavan <a.kesavan@samsung.com>, kgene.kim@samsung.com, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, olof@lixom.net, dianders@chromium.org


Hi,

On Monday, December 16, 2013 05:31:10 PM Abhilash Kesavan wrote:
> Add PMU configuration table for various low power modes - AFTR/LPA/SLEEP.
> Also, add core s2r support for Exynos5420.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
> This patch depends on "ARM: EXYNOS5: Add PMU settings for exynos5420"
> http://www.spinics.net/lists/linux-samsung-soc/msg24902.html

[...]

> @@ -253,10 +316,20 @@ static int exynos_pm_suspend(void)
>  
>  	/* Setting SEQ_OPTION register */
>  
> -	tmp = (S5P_USE_STANDBY_WFI0 | S5P_USE_STANDBY_WFE0);
> -	__raw_writel(tmp, S5P_CENTRAL_SEQ_OPTION);
> +	if (soc_is_exynos5420()) {
> +		cluster_id = (read_cpuid(CPUID_MPIDR) >> 8) & 0xf;
> +		if (!cluster_id)
> +			__raw_writel(EXYNOS5420_ARM_USE_STANDBY_WFI0,
> +				     S5P_CENTRAL_SEQ_OPTION);
> +		else
> +			__raw_writel(EXYNOS5420_KFC_USE_STANDBY_WFI0,
> +				     S5P_CENTRAL_SEQ_OPTION);
> +	} else if (soc_is_exynos5250()) {

Adding a check here for EXYNOS5250 doesn't look correct
(the old code behavior for older EXYNOYS SoCs should be
preserved).

> +		tmp = (S5P_USE_STANDBY_WFI0 | S5P_USE_STANDBY_WFE0);
> +		__raw_writel(tmp, S5P_CENTRAL_SEQ_OPTION);
> +	}

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
