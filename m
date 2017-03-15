From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 3/3] arm64: exynos: Enable Exynos PMU and PM domains
 drivers
Date: Wed, 15 Mar 2017 09:55:30 +0900
Message-ID: <58C89102.6000408@samsung.com>
References: <20170314171028.20337-1-krzk@kernel.org>
 <CGME20170314171217epcas3p10a2dfd5bb9f157c49e5f20a2799e58ee@epcas3p1.samsung.com>
 <20170314171028.20337-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41451 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750936AbdCOAze (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 20:55:34 -0400
In-reply-to: <20170314171028.20337-4-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>

Hi,

On 2017년 03월 15일 02:10, Krzysztof Kozlowski wrote:
> Enable EXYNOS_PM_DOMAINS because recently Exynos5433 got support for
> Power Management domains.  The Exynos5433 pinctrl driver requires
> EXYNOS_PMU to get the syscon-regmap for PMU address space.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
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

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
