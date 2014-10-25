From: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Subject: RE: [PATCH v2 10/10] usb: dwc2/gadget: rework suspend/resume code
 to correctly restore gadget state
Date: Sat, 25 Oct 2014 01:16:05 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844E5C02@US01WEMBX2.internal.synopsys.com>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-11-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay4.synopsys.com ([198.182.44.111]:56030 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755263AbaJYBQJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Oct 2014 21:16:09 -0400
In-Reply-To: <1413801940-31086-11-git-send-email-m.szyprowski@samsung.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Felipe Balbi <balbi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

> From: Marek Szyprowski [mailto:m.szyprowski@samsung.com]
> Sent: Monday, October 20, 2014 3:46 AM
> 
> Suspend/resume code assumed that the gadget was always enabled and
> connected to usb bus. This means that the actual state of the gadget
> (soft-enabled/disabled or connected/disconnected) was not correctly
> preserved on suspend/resume cycle. This patch fixes this issue.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/core.h   |  4 +++-
>  drivers/usb/dwc2/gadget.c | 43 +++++++++++++++++++++++++++----------------
>  2 files changed, 30 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index bf015ab3b44c..3648b76a18b4 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -210,7 +210,9 @@ struct s3c_hsotg {
>  	u8                      ctrl_buff[8];
> 
>  	struct usb_gadget       gadget;
> -	unsigned int            setup;
> +	unsigned int            setup:1;
> +	unsigned int		connected:1;
> +	unsigned int		enabled:1;
>  	unsigned long           last_rst;
>  	struct s3c_hsotg_ep     *eps;
>  };
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 0d34cfc71bfb..c6c6cf982c90 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2925,6 +2925,8 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
>  	spin_lock_irqsave(&hsotg->lock, flags);
>  	s3c_hsotg_init(hsotg);
>  	s3c_hsotg_core_init_disconnected(hsotg);
> +	hsotg->enabled = 1;
> +	hsotg->connected = 0;
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> 
>  	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
> @@ -2961,6 +2963,8 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget,
> 
>  	hsotg->driver = NULL;
>  	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
> +	hsotg->enabled = 0;
> +	hsotg->connected = 0;
> 
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> 
> @@ -2999,11 +3003,14 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
>  	dev_dbg(hsotg->dev, "%s: is_on: %d\n", __func__, is_on);
> 
>  	spin_lock_irqsave(&hsotg->lock, flags);
> +
>  	if (is_on) {
>  		clk_enable(hsotg->clk);
> +		hsotg->connected = 1;
>  		s3c_hsotg_core_connect(hsotg);
>  	} else {
>  		s3c_hsotg_core_disconnect(hsotg);
> +		hsotg->connected = 0;
>  		clk_disable(hsotg->clk);
>  	}
> 
> @@ -3652,16 +3659,18 @@ static int s3c_hsotg_suspend(struct platform_device *pdev, pm_message_t state)
>  		dev_info(hsotg->dev, "suspending usb gadget %s\n",
>  			 hsotg->driver->driver.name);
> 
> -	spin_lock_irqsave(&hsotg->lock, flags);
> -	s3c_hsotg_core_disconnect(hsotg);
> -	s3c_hsotg_disconnect(hsotg);
> -	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
> -	spin_unlock_irqrestore(&hsotg->lock, flags);
> +	if (hsotg->enabled) {

Hmm. Are you sure it's safe to check ->enabled outside of the spinlock?
What happens if s3c_hsotg_udc_stop() runs right after this, before the
spinlock is taken, and disables stuff? Sure, it's a tiny window, but
still...

-- 
Paul

> +		int ep;
> 
> -	s3c_hsotg_phy_disable(hsotg);
> +		spin_lock_irqsave(&hsotg->lock, flags);
> +		if (hsotg->connected)
> +			s3c_hsotg_core_disconnect(hsotg);
> +		s3c_hsotg_disconnect(hsotg);
> +		hsotg->gadget.speed = USB_SPEED_UNKNOWN;
> +		spin_unlock_irqrestore(&hsotg->lock, flags);
> +
> +		s3c_hsotg_phy_disable(hsotg);
> 
> -	if (hsotg->driver) {
> -		int ep;
>  		for (ep = 0; ep < hsotg->num_of_eps; ep++)
>  			s3c_hsotg_ep_disable(&hsotg->eps[ep].ep);
> 
> @@ -3679,21 +3688,23 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
>  	unsigned long flags;
>  	int ret = 0;
> 
> -	if (hsotg->driver) {
> +	if (hsotg->driver)
>  		dev_info(hsotg->dev, "resuming usb gadget %s\n",
>  			 hsotg->driver->driver.name);
> 
> +	if (hsotg->enabled) {
>  		clk_enable(hsotg->clk);
>  		ret = regulator_bulk_enable(ARRAY_SIZE(hsotg->supplies),
> -				      hsotg->supplies);
> -	}
> +					    hsotg->supplies);
> 
> -	s3c_hsotg_phy_enable(hsotg);
> +		s3c_hsotg_phy_enable(hsotg);
> 
> -	spin_lock_irqsave(&hsotg->lock, flags);
> -	s3c_hsotg_core_init_disconnected(hsotg);
> -	s3c_hsotg_core_connect(hsotg);
> -	spin_unlock_irqrestore(&hsotg->lock, flags);
> +		spin_lock_irqsave(&hsotg->lock, flags);
> +		s3c_hsotg_core_init_disconnected(hsotg);
> +		if (hsotg->connected)
> +			s3c_hsotg_core_connect(hsotg);
> +		spin_unlock_irqrestore(&hsotg->lock, flags);
> +	}
> 
>  	return ret;
>  }
