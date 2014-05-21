From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] ARM: EXYNOS: Enable multi-platform build support
Date: Wed, 21 May 2014 10:16:18 +0200
Message-ID: <4352730.lnFJpo5XeV@wuerfel>
References: <1400655169-21683-1-git-send-email-sachin.kamat@linaro.org> <1400655169-21683-3-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:49324 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751642AbaEUIQz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 04:16:55 -0400
In-Reply-To: <1400655169-21683-3-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Wednesday 21 May 2014 12:22:48 Sachin Kamat wrote:
>  # Configuration options for the EXYNOS4
>  
> +config ARCH_EXYNOS
> +       bool "Samsung EXYNOS" if ARCH_MULTI_V7
> +       select ARCH_HAS_BANDGAP
> +       select ARCH_HAS_CPUFREQ
> +       select ARCH_HAS_HOLES_MEMORYMODEL
> +       select ARCH_REQUIRE_GPIOLIB
> +       select ARM_AMBA
> +       select ARM_GIC
> +       select CLKSRC_OF
> +       select COMMON_CLK_SAMSUNG
> +       select CPU_V7
> +       select GENERIC_CLOCKEVENTS
> +       select HAVE_ARM_SCU if SMP
> +       select HAVE_S3C2410_I2C if I2C
> +       select HAVE_S3C2410_WATCHDOG if WATCHDOG
> +       select HAVE_S3C_RTC if RTC_CLASS
> +       select HAVE_SMP
> +       select PINCTRL
> +       select PINCTRL_EXYNOS
> +       select PM_GENERIC_DOMAINS if PM_RUNTIME
> +       select S5P_DEV_MFC
> +       select SAMSUNG_DMADEV
> +       select SPARSE_IRQ
> +       select SRAM
> +       select USE_OF
> +       help
> +         Support for SAMSUNG EXYNOS SoCs (EXYNOS4/5)
> +
> 

A number of these can be removed now: SPARSE_IRQ, USE_OF, GENERIC_CLOCKEVENTS,
CLKSRC_OF, CPU_V7 and HAVE_SMP are implied by ARCH_MULTIPLATFORM or ARCH_MULTI_V7,
so we shouldn't duplicate them here.

I believe SAMSUNG_DMADEV cannot work in multiplatform, but we also don't need
it any more.

The rest looks good.

	Arnd
