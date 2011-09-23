From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/7] ARM: SAMSUNG: Add CLK Macro for clkdev support
Date: Fri, 23 Sep 2011 21:26:06 +0100
Message-ID: <20110923202606.GT17169@n2100.arm.linux.org.uk>
References: <1316778827-24694-1-git-send-email-padma.v@samsung.com> <1316778827-24694-3-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:38873 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752047Ab1IWU01 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Sep 2011 16:26:27 -0400
Content-Disposition: inline
In-Reply-To: <1316778827-24694-3-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, kgene.kim@samsung.com, jassisinghbrar@gmail.com, s.nawrocki@samsung.com, ben-linux@fluff.org

On Fri, Sep 23, 2011 at 05:23:42PM +0530, Padmavathi Venna wrote:
> diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
> index 73c66d4..c864825 100644
> --- a/arch/arm/plat-samsung/include/plat/clock.h
> +++ b/arch/arm/plat-samsung/include/plat/clock.h
> @@ -17,6 +17,13 @@
>  
>  struct clk;
>  
> +#define CLK(dev, con, ck)	\
> +	{			\
> +		.dev_id = dev,	\
> +		.con_id = con,	\
> +		.clk = ck,	\
> +	}
> +

How about a patch series which moves this to include/linux/clkdev.h,
preferably called CLKDEV_INIT() ?

There's versions of this already in:
arch/arm/mach-ux500/clock.h
arch/arm/mach-tegra/tegra2_clocks.c
arch/arm/mach-nomadik/clock.c
arch/arm/mach-davinci/clock.h

so let's have it standardized instead of everyone inventing their own.

(Remember, that's what we're supposed to already being looking out for
since Linus' whinge about how ARM stuff tends to grow out of control...)
