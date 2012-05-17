From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] Samsung usb stuff for v3.5
Date: Thu, 17 May 2012 09:46:59 -0700
Message-ID: <20120517164659.GA22415@kroah.com>
References: <0b1401cd33f8$b5aca930$2105fb90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:61470 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758930Ab2EQQrC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 May 2012 12:47:02 -0400
Received: by dady13 with SMTP id y13so2646864dad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 May 2012 09:47:02 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <0b1401cd33f8$b5aca930$2105fb90$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: balbi@ti.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>

On Thu, May 17, 2012 at 03:45:55PM +0900, Kukjin Kim wrote:
> Hi Greg and Felipe,
> 
> Please pull Samsung 's3c-hsotg' UDC support for EXYNOS4210 and S5PV210 from:
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> v3.5-for-usb
> 
> Since it has a dependency on 'usb: hsotg: samsung ...' patches which have
> been already in usb tree now, so would be better if you could pull this
> series in your tree. Or this can be sent to upstream in the end of upcoming
> merge window after pulling usb tree. But I think usb tree is better in this
> case.
> 
> If any problems, please kindly let me know.

All pulled into my usb-next branch now, thanks.

greg k-h
