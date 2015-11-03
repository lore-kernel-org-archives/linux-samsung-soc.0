From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 20/22] clocksource/drivers/exynos_mct: Fix Kconfig and add
 COMPILE_TEST option
Date: Tue, 03 Nov 2015 09:54:38 +0900
Message-ID: <563805CE.8000904@samsung.com>
References: <1446469011-22710-1-git-send-email-daniel.lezcano@linaro.org>
 <1446469011-22710-20-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52212 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752700AbbKCAzG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 19:55:06 -0500
In-reply-to: <1446469011-22710-20-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: john.stultz@linaro.org, linux-kernel@vger.kernel.org, arnd@arndb.de, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "moderated list:ARM SUB-ARCHITECT..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>

Hi,

On 2015=EB=85=84 11=EC=9B=94 02=EC=9D=BC 21:56, Daniel Lezcano wrote:
> Let the platform's Kconfig to select the clock instead of having a re=
verse
> dependency from the driver to the platform options.
>=20
> Add the COMPILE_TEST option for the compilation test coverage. Due to=
 the
> non portable 'delay' code, this driver is only compilable on ARM.
>=20
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/Kconfig | 1 +
>  drivers/clocksource/Kconfig  | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kcon=
fig
> index 3a10f1a..ff10539 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -27,6 +27,7 @@ menuconfig ARCH_EXYNOS
>  	select SRAM
>  	select THERMAL
>  	select MFD_SYSCON
> +	select CLKSRC_EXYNOS_MCT
>  	help
>  	  Support for SAMSUNG EXYNOS SoCs (EXYNOS4/5)
> =20
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfi=
g
> index 916c36d..d829cbe 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -213,8 +213,8 @@ config CLKSRC_METAG_GENERIC
>  	  This option enables support for the Meta per-thread timers.
> =20
>  config CLKSRC_EXYNOS_MCT
> -	def_bool y if ARCH_EXYNOS
> -	depends on !ARM64
> +	bool "Exynos multi core timer driver" if COMPILE_TEST
> +	depends on ARM
>  	help
>  	  Support for Multi Core Timer controller on Exynos SoCs.
> =20
>=20

Looks good to me. As you commented, delay_timer is only used on ARM 32b=
it.
I'm glad to use the 'depends on ARM' instead of reverse dependency.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
