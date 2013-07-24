From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH V2 2/2] ARM: EXYNOS: cpuidle: Allow C1 state only in
 supported SOC's.
Date: Wed, 24 Jul 2013 14:15:34 +0900
Message-ID: <0e2301ce882c$d39021a0$7ab064e0$@org>
References: <1371036526-16589-1-git-send-email-amit.daniel@samsung.com>
 <1371036526-16589-3-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52236 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750883Ab3GXFPh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 01:15:37 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF005ZXD99SE50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 14:15:36 +0900 (KST)
In-reply-to: <1371036526-16589-3-git-send-email-amit.daniel@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Amit Daniel Kachhap wrote:
> 
> This patch registers the basic C0 state for all exynos SOC's but
> limits the C1(AFTR -Arm off top running) state in only the supported
> SOC's(ie. EXYNOS 4210, 4212, 4412 and 5250).
> 
> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> ---
>  arch/arm/mach-exynos/cpuidle.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-
> exynos/cpuidle.c
> index 2d071c6..ccb2b48 100644
> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -176,7 +176,9 @@ static int __init exynos4_init_cpuidle(void)
>  		device->cpu = cpu_id;
> 
>  		/* Support IDLE only */
> -		if (cpu_id != 0)
> +		if (!(soc_is_exynos4210() || soc_is_exynos4212() ||
> +			soc_is_exynos4412() || soc_is_exynos5250()) ||
> +			cpu_id != 0)

How about exynos5420?

So...

+		if (soc_is_exynos5440() || cpu_id !=0) ?

>  			device->state_count = 1;
> 
>  		ret = cpuidle_register_device(device);
> --
> 1.7.1

- Kukjin
