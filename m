From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 3/4] ARM: EXYNOS4: Add usb ehci device to the NURI board
Date: Wed, 13 Apr 2011 16:54:02 -0700
Message-ID: <20110413235402.GA32159@kroah.com>
References: <1302236532-27636-1-git-send-email-jy0922.shim@samsung.com>
 <1302236532-27636-3-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:43222 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750901Ab1DMXy0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Apr 2011 19:54:26 -0400
Content-Disposition: inline
In-Reply-To: <1302236532-27636-3-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, gregkh@suse.de, kyungmin.park@samsung.com, jg1.han@samsung.com

On Fri, Apr 08, 2011 at 01:22:11PM +0900, Joonyoung Shim wrote:
> This patch is to support usb ehci device to the NURI board.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Note, I had to apply this one by hand, I don't know what tree you made
it against.  Hopefully the merge issues will be simple to handle, as
they were pretty obvious to me.

thanks,

greg k-h
