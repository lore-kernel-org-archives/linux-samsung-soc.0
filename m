From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v3 5/5] ARM: exynos: select POWER_RESET_SYSCON and
 POWER_RESET_SYSCON_POWEROFF
Date: Tue, 01 Dec 2015 12:03:16 +0300
Message-ID: <010401d12c17$1e883d10$5b98b730$@samsung.com>
References: <1447996629-18232-1-git-send-email-alim.akhtar@samsung.com>
 <1447996629-18232-6-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:25279 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755446AbbLAJDU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Dec 2015 04:03:20 -0500
In-reply-to: <1447996629-18232-6-git-send-email-alim.akhtar@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alim Akhtar' <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: k.kozlowski@samsung.com, kgene@kernel.org, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m.reichl@fivetechno.de, tjakobi@math.uni-bielefeld.de, ulf.hansson@linaro.org

 Hello!

Tested it on top of 4.4-rc3.
 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 3a10f1a8317a..d279edf9b10d 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -27,6 +27,9 @@ menuconfig ARCH_EXYNOS
>  	select SRAM
>  	select THERMAL
>  	select MFD_SYSCON
> +	select POWER_RESET
> +	select POWER_RESET_SYSCON
> +	select POWER_RESET_SYSCON_POWEROFF

"select POWER_SUPPLY" is missing here. Without is we get:
--- cut ---
warning: (ARCH_HISI && ARCH_INTEGRATOR && ARCH_EXYNOS && ARCH_VEXPRESS && REALVIEW_DT) selects POWER_RESET which has unmet direct
dependencies (POWER_SUPPLY)
warning: (ARCH_EXYNOS) selects POWER_RESET_SYSCON which has unmet direct dependencies (POWER_SUPPLY && POWER_RESET && OF)
warning: (ARCH_EXYNOS) selects POWER_RESET_SYSCON_POWEROFF which has unmet direct dependencies (POWER_SUPPLY && POWER_RESET && OF)
--- cut ---

>  	help
>  	  Support for SAMSUNG EXYNOS SoCs (EXYNOS4/5)

 Otherwise works fine.

 Tested-by: Pavel Fedin <p.fedin@samsung.com>

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
