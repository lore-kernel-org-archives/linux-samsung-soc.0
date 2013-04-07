From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: S3C24XX: Correct NR_IRQS definition for s3c2440
Date: Sun, 7 Apr 2013 22:35:01 +0200
Message-ID: <201304072235.02218.heiko@sntech.de>
References: <1365366170-9682-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:39408 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759743Ab3DGUfK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Apr 2013 16:35:10 -0400
In-Reply-To: <1365366170-9682-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

Am Sonntag, 7. April 2013, 22:22:50 schrieb Sylwester Nawrocki:
> Due to NR_IRQS being incorrectly defined not all IRQ domains can
> be registered for S3C2440. It causes following errors on a s3c2440
> SoC based board:
>=20
> NR_IRQS:89
> S3C2440: IRQ Support
> irq: clearing pending status 00000002
> ------------[ cut here ]------------
> WARNING: at kernel/irq/irqdomain.c:234 0xc0056ed0()
> ...
> irq: could not create irq-domain
> ...
> s3c2410-wdt s3c2410-wdt: failed to install irq (-22)
> s3c2410-wdt: probe of s3c2410-wdt failed with error -22
> ...
> samsung-uart s3c2440-uart.0: cannot get irq 74
>=20
> Fix this by increasing NR_IRQS to at least (IRQ_S3C2443_AC97 + 1)
> if CPU_S3C2440 is selected, so the subintc IRQ domain gets properly
> registered.
>=20
> Cc: Heiko St=C3=BCbner <heiko@sntech.de>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Thanks for testing the irq changes on another subarchitecture and fixin=
g the=20
glitch.

Acked-by: Heiko Stuebner <heiko@sntech.de>


> ---
>  arch/arm/mach-s3c24xx/include/mach/irqs.h |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/mach-s3c24xx/include/mach/irqs.h
> b/arch/arm/mach-s3c24xx/include/mach/irqs.h index 43cada8..b6dd4cb 10=
0644
> --- a/arch/arm/mach-s3c24xx/include/mach/irqs.h
> +++ b/arch/arm/mach-s3c24xx/include/mach/irqs.h
> @@ -192,10 +192,8 @@
>=20
>  #if defined(CONFIG_CPU_S3C2416)
>  #define NR_IRQS (IRQ_S3C2416_I2S1 + 1)
> -#elif defined(CONFIG_CPU_S3C2443)
> -#define NR_IRQS (IRQ_S3C2443_AC97+1)
>  #else
> -#define NR_IRQS (IRQ_S3C2440_AC97+1)
> +#define NR_IRQS (IRQ_S3C2443_AC97 + 1)
>  #endif
>=20
>  /* compatibility define. */
