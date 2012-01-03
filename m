From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] S3C: fix order of MACH_S3C* checks on GPIO count define
Date: Tue, 3 Jan 2012 09:43:56 +0000
Message-ID: <20120103094356.GG2914@n2100.arm.linux.org.uk>
References: <1325164036-15638-1-git-send-email-dron0gus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:57832 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185Ab2ACJoV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jan 2012 04:44:21 -0500
Content-Disposition: inline
In-Reply-To: <1325164036-15638-1-git-send-email-dron0gus@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gusakov Andrey <dron0gus@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Gusakov Andrey <dron_gus@mail.ru>, linux-arm-kernel@lists.infradead.org

On Thu, Dec 29, 2011 at 05:07:14PM +0400, Gusakov Andrey wrote:
> Differnt S3C24XX SoC have different number of GPIO. When building
> kernel for many S3C24XX SoCs GPIO number defined to minimun possible.
> This patch reordef ifdef's to define GPIO number to muximum possible.

This is error prome.  Please come up with a better solution to this.

> -#ifdef CONFIG_CPU_S3C244X
> -#define ARCH_NR_GPIOS	(32 * 9 + CONFIG_S3C24XX_GPIO_EXTRA)
> -#elif defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
> +#if defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
>  #define ARCH_NR_GPIOS	(32 * 12 + CONFIG_S3C24XX_GPIO_EXTRA)
> +#elif defined(CONFIG_CPU_S3C244X)
> +#define ARCH_NR_GPIOS	(32 * 9 + CONFIG_S3C24XX_GPIO_EXTRA)
>  #else
>  #define ARCH_NR_GPIOS	(256 + CONFIG_S3C24XX_GPIO_EXTRA)
>  #endif

Maybe something like:

#define S3C2443_NR_GPIOS	(32 * 12)
#define S3C2416_NR_GPIOS	(32 * 12)
#define S3C244X_NR_GPIOS	(32 * 9)

#define SAMSUNG_NR_GPIOS	(256)
#if defined (CONFIG_CPU_S3C244X) && S3C244X_NR_GPIOS > SAMSUNG_NR_GPIOS
#undef SAMSUNG_NR_GPIOS
#define SAMSUNG_NR_GPIOS	S3C244X_NR_GPIOS
#endif
#if defined (CONFIG_CPU_S3C2416) && S3C2416_NR_GPIOS > SAMSUNG_NR_GPIOS
#undef SAMSUNG_NR_GPIOS
#define SAMSUNG_NR_GPIOS	S3C2416_NR_GPIOS
#endif
#if defined (CONFIG_CPU_S3C2443) && S3C2443_NR_GPIOS > SAMSUNG_NR_GPIOS
#undef SAMSUNG_NR_GPIOS
#define SAMSUNG_NR_GPIOS	S3C2443_NR_GPIOS
#endif

#define ARCH_NR_GPIOS		(SAMSUNG_NR_GPIOS + CONFIG_S3C24XX_GPIO_EXTRA)

or maybe just solve this in Kconfig - we already have this:

config ARCH_NR_GPIO
        int
        default 1024 if ARCH_SHMOBILE || ARCH_TEGRA
        default 350 if ARCH_U8500
        default 0

to set ARCH_NR_GPIO in generic code.
