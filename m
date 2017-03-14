From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [3/3] arm64: exynos: Enable Exynos PMU and PM domains drivers
Date: Tue, 14 Mar 2017 20:03:36 +0530
Message-ID: <d7e15bc0-f17f-8b87-4b9d-c0abc3b554db@samsung.com>
References: <20170311213856.21701-4-krzk@kernel.org>
 <CGME20170314143652epcas5p43c7c8556228f996d19d716506eb9a0ed@epcas5p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47134 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751462AbdCNOgz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 10:36:55 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OMT01BU179H8VC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Mar 2017 23:36:53 +0900 (KST)
In-reply-to: <20170311213856.21701-4-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org



On 03/12/2017 03:08 AM, Krzysztof Kozlowski wrote:
> Enable EXYNOS_PM_DOMAINS because recently Exynos5433 got support for
> Power Management domains.  The Exynos5433 pinctrl driver requires
> EXYNOS_PMU to get the syscon-regmap for PMU address space.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
Looks good.
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  arch/arm64/Kconfig.platforms | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 129cc5ae4091..9cdaecd3e583 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -54,6 +54,8 @@ config ARCH_BRCMSTB
>  config ARCH_EXYNOS
>  	bool "ARMv8 based Samsung Exynos SoC family"
>  	select COMMON_CLK_SAMSUNG
> +	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
> +	select EXYNOS_PMU
>  	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>
