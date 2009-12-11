From: Marc Zyngier <maz@misterjones.org>
Subject: Re: [PATCH 6/7] ARM: S5P6440: Board and configuration file
Date: Fri, 11 Dec 2009 17:04:13 +0100
Message-ID: <20091211170413.4f6d2744@life-in-the-fast-lane>
References: <1260525300-4322-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from inca-roads.misterjones.org ([213.251.177.50]:57795 "EHLO
	inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932918AbZLKQFI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Dec 2009 11:05:08 -0500
In-Reply-To: <1260525300-4322-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

On Fri, 11 Dec 2009 18:55:00 +0900
Kukjin Kim <kgene.kim@samsung.com> wrote:

> +static struct s3c2410_uartcfg smdk6440_uartcfgs[] __initdata = {
> +	[0] = {
> +		.hwport	     = 0,
> +		.flags	     = 0,
> +		.ucon	     = S5P6440_UCON_DEFAULT,
> +		.ulcon	     = S5P6440_ULCON_DEFAULT,
> +		.ufcon	     = S5P6440_UFCON_DEFAULT,
> +	},
> +	[1] = {
> +		.hwport	     = 1,
> +		.flags	     = 0,
> +		.ucon	     = S5P6440_UCON_DEFAULT,
> +		.ulcon	     = S5P6440_ULCON_DEFAULT,
> +		.ufcon	     = S5P6440_UFCON_DEFAULT,
> +	},
> +	[2] = {
> +		.hwport	     = 2,
> +		.flags	     = 0,
> +		.ucon	     = S5P6440_UCON_DEFAULT,
> +		.ulcon	     = S5P6440_ULCON_DEFAULT,
> +		.ufcon	     = S5P6440_UFCON_DEFAULT,
> +	},
> +	[3] = {
> +		.hwport	     = 3,
> +		.flags	     = 0,
> +		.ucon	     = S5P6440_UCON_DEFAULT,
> +		.ulcon	     = S5P6440_ULCON_DEFAULT,
> +		.ufcon	     = S5P6440_UFCON_DEFAULT,
> +	},
> +};

Doing so means that UARTs will get the default clock (PCLK), which is
always wrong on s5p6440. You should here set the .clock field of each
UART, according to your specific configuration (probably PCLK_LOW).

Or at least make sure it gets set to some sane default in the CPU
support code.

	M.
-- 
Fast. Cheap. Reliable. Pick two.
