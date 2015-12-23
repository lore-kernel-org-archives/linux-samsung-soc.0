From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v5 2/5] ARM: sa1111: ensure no negative value gets
 returned on positive match
Date: Wed, 23 Dec 2015 11:05:00 +0000
Message-ID: <20151223110500.GQ8644@n2100.arm.linux.org.uk>
References: <1450868368-5650-1-git-send-email-m.szyprowski@samsung.com>
 <1450868368-5650-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:45131 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751315AbbLWLFQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Dec 2015 06:05:16 -0500
Content-Disposition: inline
In-Reply-To: <1450868368-5650-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Dec 23, 2015 at 11:59:25AM +0100, Marek Szyprowski wrote:
> This patch ensures that existing bus match callbacks don't return
> negative values (which might be interpreted as potential errors in the
> future) in case of positive match.

This actually can't return a negative number - only valid devid bits
are 0 to 9 inclusive, and this isn't going to ever change.  So the
patch isn't strictly necessary, but is good from the point of view
of ensuring consistency.  Hence:

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>

> ---
>  arch/arm/common/sa1111.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
> index 3d22494..fb0a0a4 100644
> --- a/arch/arm/common/sa1111.c
> +++ b/arch/arm/common/sa1111.c
> @@ -1290,7 +1290,7 @@ static int sa1111_match(struct device *_dev, struct device_driver *_drv)
>  	struct sa1111_dev *dev = SA1111_DEV(_dev);
>  	struct sa1111_driver *drv = SA1111_DRV(_drv);
>  
> -	return dev->devid & drv->devid;
> +	return !!(dev->devid & drv->devid);
>  }
>  
>  static int sa1111_bus_suspend(struct device *dev, pm_message_t state)
> -- 
> 1.9.2
> 

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
