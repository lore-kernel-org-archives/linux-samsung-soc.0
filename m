From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/2] drivers: amba: properly handle devices with power
 domains
Date: Wed, 25 Nov 2015 13:24:58 +0000
Message-ID: <20151125132458.GL8644@n2100.arm.linux.org.uk>
References: <1448456127-31842-1-git-send-email-m.szyprowski@samsung.com>
 <1448456289-31960-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:57134 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751832AbbKYNZH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 08:25:07 -0500
Content-Disposition: inline
In-Reply-To: <1448456289-31960-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, Nov 25, 2015 at 01:58:09PM +0100, Marek Szyprowski wrote:
> To read pid/cid registers, the probed device need to be properly turned on.
> When it is inside a power domain, the bus code should ensure that the
> given power domain is enabled before trying to access device's registers.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/amba/bus.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
> index f009936..25715cb 100644
> --- a/drivers/amba/bus.c
> +++ b/drivers/amba/bus.c
> @@ -373,6 +373,12 @@ int amba_device_add(struct amba_device *dev, struct resource *parent)
>  		goto err_release;
>  	}
>  
> +	ret = dev_pm_domain_attach(&dev->dev, true);
> +	if (ret) {
> +		iounmap(tmp);
> +		goto err_release;
> +	}
> +

NAK.  If dev_pm_domain_attach() returns an error, even -EPROBE_DEFER,
the result will be a missing device that has no way to be recovered.
This is too fragile.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
