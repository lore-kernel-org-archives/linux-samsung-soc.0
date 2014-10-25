From: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Subject: RE: [PATCH v2 09/10] usb: dwc2/gadget: fix calls to phy control
 functions in suspend/resume code
Date: Sat, 25 Oct 2014 00:45:18 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844E5BE4@US01WEMBX2.internal.synopsys.com>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-10-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]:49010 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932111AbaJYApT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Oct 2014 20:45:19 -0400
In-Reply-To: <1413801940-31086-10-git-send-email-m.szyprowski@samsung.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Felipe Balbi <balbi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

> From: Marek Szyprowski [mailto:m.szyprowski@samsung.com]
> Sent: Monday, October 20, 2014 3:46 AM
> 
> This patch moves calls to phy enable/disable out of spinlock protected
> blocks in device suspend/resume to fix incorrect caller context. Phy
> related functions must not be called from atomic context. To protect
> device internal state from a race during suspend, a call to
> s3c_hsotg_core_disconnect() is added under a spinlock, what prevents any
> further activity on the usb bus.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/gadget.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index e8ffc080e6c7..0d34cfc71bfb 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -3653,11 +3653,13 @@ static int s3c_hsotg_suspend(struct platform_device *pdev, pm_message_t state)
>  			 hsotg->driver->driver.name);
> 
>  	spin_lock_irqsave(&hsotg->lock, flags);
> +	s3c_hsotg_core_disconnect(hsotg);
>  	s3c_hsotg_disconnect(hsotg);
> -	s3c_hsotg_phy_disable(hsotg);
>  	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> 
> +	s3c_hsotg_phy_disable(hsotg);
> +
>  	if (hsotg->driver) {
>  		int ep;
>  		for (ep = 0; ep < hsotg->num_of_eps; ep++)
> @@ -3686,8 +3688,9 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
>  				      hsotg->supplies);
>  	}
> 
> -	spin_lock_irqsave(&hsotg->lock, flags);
>  	s3c_hsotg_phy_enable(hsotg);
> +
> +	spin_lock_irqsave(&hsotg->lock, flags);
>  	s3c_hsotg_core_init_disconnected(hsotg);
>  	s3c_hsotg_core_connect(hsotg);
>  	spin_unlock_irqrestore(&hsotg->lock, flags);

Acked-by: Paul Zimmerman <paulz@synopsys.com>
