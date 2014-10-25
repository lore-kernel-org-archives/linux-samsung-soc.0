From: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Subject: RE: [PATCH v2 07/10] usb: dwc2/gadget: move phy control calls out
 of pullup() method
Date: Sat, 25 Oct 2014 00:36:55 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844E5BAD@US01WEMBX2.internal.synopsys.com>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-8-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:48947 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932111AbaJYAg5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Oct 2014 20:36:57 -0400
In-Reply-To: <1413801940-31086-8-git-send-email-m.szyprowski@samsung.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Felipe Balbi <balbi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

> From: Marek Szyprowski [mailto:m.szyprowski@samsung.com]
> Sent: Monday, October 20, 2014 3:46 AM
> 
> This patch moves phy enable/disable calls from pullup() method to
> udc_start/stop functions. This solves the issue related to limited caller
> context for PHY functions, because they cannot be called from non-sleeping
> context. This is also a preparation for using soft-disconnect feature of
> udc controller in pullup() method.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/gadget.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 5eb2473031c4..98adf8d17493 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2919,6 +2919,8 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
>  		goto err;
>  	}
> 
> +	s3c_hsotg_phy_enable(hsotg);
> +
>  	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
>  	return 0;
> 
> @@ -2955,6 +2957,8 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget,
> 
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> 
> +	s3c_hsotg_phy_disable(hsotg);
> +
>  	regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
> 
>  	clk_disable(hsotg->clk);
> @@ -2989,13 +2993,11 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
> 
>  	spin_lock_irqsave(&hsotg->lock, flags);
>  	if (is_on) {
> -		s3c_hsotg_phy_enable(hsotg);
>  		clk_enable(hsotg->clk);
>  		s3c_hsotg_core_init_disconnected(hsotg);
>  		s3c_hsotg_core_connect(hsotg);
>  	} else {
>  		clk_disable(hsotg->clk);
> -		s3c_hsotg_phy_disable(hsotg);
>  	}
> 
>  	hsotg->gadget.speed = USB_SPEED_UNKNOWN;

Acked-by: Paul Zimmerman <paulz@synopsys.com>
