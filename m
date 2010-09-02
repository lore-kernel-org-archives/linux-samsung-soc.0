From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/3] h1940: use gpiolib for latch access
Date: Thu, 2 Sep 2010 11:53:49 +0100
Message-ID: <20100902105349.GT26319@n2100.arm.linux.org.uk>
References: <1282230003-2020-1-git-send-email-anarsoul@gmail.com> <1282230003-2020-2-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:45937 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751900Ab0IBKyQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Sep 2010 06:54:16 -0400
Content-Disposition: inline
In-Reply-To: <1282230003-2020-2-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Thu, Aug 19, 2010 at 06:00:01PM +0300, Vasily Khoruzhick wrote:
> diff --git a/arch/arm/mach-s3c2410/mach-h1940.c b/arch/arm/mach-s3c2410/mach-h1940.c
> index 779b45b..9717790 100644
> --- a/arch/arm/mach-s3c2410/mach-h1940.c
> +++ b/arch/arm/mach-s3c2410/mach-h1940.c
> @@ -42,6 +42,7 @@
>  #include <mach/regs-gpio.h>
>  #include <mach/gpio-fns.h>
>  #include <mach/gpio-nrs.h>
> +#include <mach/gpio.h>

linux/gpio.h ?

>  
>  #include <mach/h1940.h>
>  #include <mach/h1940-latch.h>
> @@ -58,6 +59,16 @@
>  #include <plat/mci.h>
>  #include <plat/ts.h>
>  
> +#ifndef __ASSEMBLY__
> +#define H1940_LATCH		((void __force __iomem *)0xF8000000)
> +#else
> +#define H1940_LATCH		0xF8000000
> +#endif

This file can never be built by the assembler, so the above is pointless.

> +
> +#define H1940_PA_LATCH		(S3C2410_CS2)

Parents not required.

Rest looks fine to me.
