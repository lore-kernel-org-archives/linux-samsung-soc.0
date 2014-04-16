From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v8 1/3] ARM: EXYNOS: initial board support for exynos5260
 SoC
Date: Wed, 16 Apr 2014 09:57:55 +0200
Message-ID: <534E3803.5010404@gmail.com>
References: <1397620738-14431-1-git-send-email-rahul.sharma@samsung.com> <1397620738-14431-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:45508 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751475AbaDPH57 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 03:57:59 -0400
In-Reply-To: <1397620738-14431-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Hi Rahul,

On 16.04.2014 05:58, Rahul Sharma wrote:
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>
> This patch add basic arch side support for exynos5260 SoC.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
>   arch/arm/mach-exynos/Kconfig |    5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index fc8bf18..bf4ed87 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -84,6 +84,11 @@ config SOC_EXYNOS5250
>   	help
>   	  Enable EXYNOS5250 SoC support
>
> +config SOC_EXYNOS5260
> +	bool "SAMSUNG EXYNOS5260"
> +	default y
> +	depends on ARCH_EXYNOS5
> +
>   config SOC_EXYNOS5420
>   	bool "SAMSUNG EXYNOS5420"
>   	default y
>

Is this patch necessary now? After Sachin's consolidation series there 
are no per SoC entries anymore.

Best regards,
Tomasz
