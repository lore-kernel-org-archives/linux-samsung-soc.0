From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V2 5/7] ARM: S5P64X0: Add file to hold common
	Framebuffer and LCD code
Date: Tue, 26 Jul 2011 09:00:52 +0100
Message-ID: <20110726080052.GM9653@n2100.arm.linux.org.uk>
References: <1311624025-2643-1-git-send-email-ajaykumar.rs@samsung.com> <1311624025-2643-6-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:35301 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753323Ab1GZIBC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 04:01:02 -0400
Content-Disposition: inline
In-Reply-To: <1311624025-2643-6-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, m.szyprowski@samsung.com

On Mon, Jul 25, 2011 at 04:00:23PM -0400, Ajay Kumar wrote:
> diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/Kconfig
> index 4fee745..ed87151 100644
> --- a/arch/arm/mach-s5p64x0/Kconfig
> +++ b/arch/arm/mach-s5p64x0/Kconfig
> @@ -32,6 +32,11 @@ config S5P64X0_SETUP_I2C1
>  	help
>  	  Common setup code for i2c bus 1.
>  
> +config COMMON_FB

This is a very bad config name.  It's specific to a group of SoCs but it
seems to be advertising itself as something which isn't.  What if
drivers/video/Kconfig gets a COMMON_FB symbol too?
