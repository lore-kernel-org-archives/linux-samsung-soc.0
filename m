From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 18/19] ARM: SAMSUNG: Remove remaining legacy code
Date: Wed, 16 Jul 2014 11:47:42 +0200
Message-ID: <1405504062.4408.11.camel@x220>
References: <1404496099-26708-1-git-send-email-t.figa@samsung.com>
	 <1404496099-26708-19-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews10.kpnxchange.com ([213.75.39.15]:63672 "EHLO
	cpsmtpb-ews10.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751590AbaGPJrp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 05:47:45 -0400
In-Reply-To: <1404496099-26708-19-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>

On Fri, 2014-07-04 at 19:48 +0200, Tomasz Figa wrote:
> After refactoring suspend/resume, which was last part with dependencies
> on legacy code, all Kconfig symbols related to Samsung ATAGS support can
> be deselected and more unused code removed. This includes most of s5p-*
> code as well, as s5pv210 was their last user.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---

This one also landed in today's linux-next (ie, next-20140716).

>[...]
> diff --git a/arch/arm/mach-s5pv210/include/mach/gpio.h b/arch/arm/mach-s5pv210/include/mach/gpio.h
> deleted file mode 100644
> index 6c8b903..0000000

This removed the single case were CONFIG_SAMSUNG_GPIO_EXTRA was used.

>[...]
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
>[...]
> @@ -64,31 +51,6 @@ config SAMSUNG_ATAGS
>  
>  if SAMSUNG_ATAGS
>  
> -# options for IRQ support
> -
> -config S5P_IRQ
> -	def_bool ARCH_S5PV210
> -	help
> -	  Support common interrupt part for ARCH_S5P SoCs
> -
> -config S5P_EXT_INT
> -	bool
> -	help
> -	  Use the external interrupts (other than GPIO interrupts.)
> -
> -config S5P_GPIO_INT
> -	bool
> -	help
> -	  Common code for the GPIO interrupts (other than external interrupts.)
> -
> -# options for gpio configuration support
> -
> -config S5P_GPIO_DRVSTR
> -	bool
> -	help
> -	  Internal configuration to get and set correct GPIO driver strength
> -	  helper
> -
>  config SAMSUNG_GPIO_EXTRA
>  	int "Number of additional GPIO pins"
>  	default 128 if SAMSUNG_GPIO_EXTRA128

So a second order effect is that SAMSUNG_GPIO_EXTRA can now be removed.
Which implies that SAMSUNG_GPIO_EXTRA64 and SAMSUNG_GPIO_EXTRA128 can
also be removed.

Should I submit the trivial patch to do that or is a patch already
queued somewhere?


Paul Bolle
