From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: EXYNOS: cpuidle: Skip C1 cpuidle state for exynos5440
Date: Wed, 24 Jul 2013 20:47:13 +0900
Message-ID: <0eaf01ce8863$89d3c4e0$9d7b4ea0$@org>
References: <0e7d01ce8840$82f79070$88e6b150$@org>
 <1374659615-29447-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:19144 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840Ab3GXLrP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 07:47:15 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF00D9ZVEMAAY0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 20:47:14 +0900 (KST)
In-reply-to: <1374659615-29447-1-git-send-email-amit.daniel@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

Amit Daniel Kachhap wrote:
> 
> This patch skips the deep C1(AFTR -Arm off top running) state for
> exynos5440
> soc as this soc does not support this state. All the cpu's only allows the
> basic
> C0 state.
> 
> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> ---
>  arch/arm/mach-exynos/cpuidle.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-
> exynos/cpuidle.c
> index 17a18ff..9a776a1 100644
> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -210,7 +210,7 @@ static int __init exynos4_init_cpuidle(void)
>  		device->cpu = cpu_id;
> 
>  		/* Support IDLE only */
> -		if (cpu_id != 0)
> +		if (soc_is_exynos5440() || cpu_id != 0)
>  			device->state_count = 1;
> 
>  		ret = cpuidle_register_device(device);
> --
> 1.7.1

Applied, thanks.
- Kukjin
