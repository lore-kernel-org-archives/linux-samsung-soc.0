From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Show proper respect for Heinrich Hertz by using the
 correct unit for frequency
Date: Sat, 2 May 2015 16:59:47 +0200
Message-ID: <20150502145947.GA8156@xo-6d-61-c0.localdomain>
References: <20150511131952.GD2067@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:58530 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754568AbbFWQvh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jun 2015 12:51:37 -0400
Content-Disposition: inline
In-Reply-To: <20150511131952.GD2067@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org

Hi!

> The SI unit of frequency is Hertz, named after Heinrich Hertz, and is
> given the symbol "Hz" to denote this.  "hz" is not the unit of frequency,
> and is in fact meaningless.
> 
> Fix arch/arm to correctly use "Hz", thereby acknowledging Heinrich Hertz
> contribution to the modern world.
> 

> --- a/arch/arm/mach-ixp4xx/include/mach/platform.h
> +++ b/arch/arm/mach-ixp4xx/include/mach/platform.h
> @@ -74,7 +74,7 @@ extern unsigned long ixp4xx_exp_bus_size;
>  /*
>   * Clock Speed Definitions.
>   */
> -#define IXP4XX_PERIPHERAL_BUS_CLOCK 	(66) /* 66Mhzi APB BUS   */ 
> +#define IXP4XX_PERIPHERAL_BUS_CLOCK 	(66) /* 66MHzi APB BUS   */ 
>  #define IXP4XX_UART_XTAL        	14745600
>  

Speaking about meaningless... What is MHzi supposed to mean?

ACK for the rest.
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
