From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] ARM: SAMSUNG: serial: Fix on handling of one clock
 source for UART
Date: Sat, 28 May 2011 17:39:04 +0800
Message-ID: <20110528093904.GC21388@kroah.com>
References: <1306548243-2526-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:39776 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751879Ab1E1JjG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 May 2011 05:39:06 -0400
Content-Disposition: inline
In-Reply-To: <1306548243-2526-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>

On Fri, May 27, 2011 at 07:04:03PM -0700, Kukjin Kim wrote:
> From: Boojin Kim <boojin.kim@samsung.com>
> 
> This patch fixes the way of comparison for handling of two or more
> clock sources for UART.
> 
> For example, if just only one clock source is defined even though
> there are two clock sources for UART, the serial driver does not
> set proper clock up. Of course, it is problem.
> 
> So this patch changes the condition of comparison to avoid useless
> setup clock and adds a flag 'NO_NEED_CHECK_CLKSRC' which means
> selection of source clock is not required.
> 
> In addition, since the Exynos4210 has only one clock source for UART
> this patch adds the flag into its common_init_uarts().
> 
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Cc: Greg Kroah-Hartman <greg@kroah.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-exynos4/init.c                     |    1 +
>  arch/arm/plat-samsung/include/plat/regs-serial.h |    2 ++
>  drivers/tty/serial/s5pv210.c                     |    4 ++--
>  3 files changed, 5 insertions(+), 2 deletions(-)

Is this needed in older kernels as well (like .39)?

thanks,

greg k-h
