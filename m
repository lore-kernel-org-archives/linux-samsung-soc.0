From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 6/6] ARM: exynos: select THERMAL_OF
Date: Mon, 01 Feb 2016 10:26:32 +0900
Message-ID: <56AEB448.1080108@samsung.com>
References: <1454079040-3567945-1-git-send-email-arnd@arndb.de>
 <1454079040-3567945-7-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:37774 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933224AbcBAB0i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 Jan 2016 20:26:38 -0500
In-reply-to: <1454079040-3567945-7-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org

On 29.01.2016 23:50, Arnd Bergmann wrote:
> We cannot select a symbol that has disabled dependencies, so
> we get a warning if we ever enable EXYNOS_THERMAL without
> also turning on THERMAL_OF:
> 
> warning: (ARCH_EXYNOS) selects EXYNOS_THERMAL which has unmet direct dependencies (THERMAL && (ARCH_EXYNOS || COMPILE_TEST) && THERMAL_OF)
> 
> This adds another 'select' in the platform code to avoid that
> case. Alternatively, we could decide to not select EXYNOS_THERMAL
> here and instead make it a user option.

We want EXYNOS_THERMAL because we are using boost cpufreq on Exynos4x12
(through turbo frequencies in DTS and cpufreq-dt) so your current
solution is a proper fix for:

Fixes: f87e6bd3f740 ("thermal: exynos: Add the dependency of
CONFIG_THERMAL_OF instead of CONFIG_OF")

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>


Best regards,
Krzysztof

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-exynos/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 652a0bb11578..5189bcecad12 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -27,6 +27,7 @@ menuconfig ARCH_EXYNOS
>  	select S5P_DEV_MFC
>  	select SRAM
>  	select THERMAL
> +	select THERMAL_OF
>  	select MFD_SYSCON
>  	select CLKSRC_EXYNOS_MCT
>  	select POWER_RESET
> 
