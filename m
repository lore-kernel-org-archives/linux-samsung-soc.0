From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 10/30] usb: exynos: do not include plat/usb-phy.h
Date: Thu, 11 Apr 2013 13:25:40 -0700
Message-ID: <20130411202540.GA32047@kroah.com>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
 <1365638712-1028578-11-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:42456 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751254Ab3DKUZm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 16:25:42 -0400
Received: by mail-pa0-f42.google.com with SMTP id kq13so1082780pab.29
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Apr 2013 13:25:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1365638712-1028578-11-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

On Thu, Apr 11, 2013 at 02:04:52AM +0200, Arnd Bergmann wrote:
> The definitions have moved to include/linux/usb/samsung-usb-phy.h,
> and plat/usb-phy.h is unavailable from drivers in a multiplatform
> configuration.
> 
> Also fix up the plat/usb-phy.h header file to use the definitions
> from the new header instead of providing a separate copy.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-usb@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> ---
>  arch/arm/mach-exynos/setup-usb-phy.c         | 8 ++++----
>  arch/arm/mach-s3c64xx/setup-usb-phy.c        | 4 ++--
>  arch/arm/mach-s5pv210/setup-usb-phy.c        | 4 ++--
>  arch/arm/plat-samsung/include/plat/usb-phy.h | 5 +----
>  drivers/usb/host/ehci-s5p.c                  | 1 -
>  drivers/usb/host/ohci-exynos.c               | 1 -
>  6 files changed, 9 insertions(+), 14 deletions(-)

This patch doesn't apply to my usb-next tree due to the other changes in
these files.

Care to refresh it and resend it?  I'll be glad to apply it then.

thanks,

greg k-h
