From: John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH RESEND] usb: dwc2: rework initialization of host and gadget
 in dual-role mode
Date: Wed, 11 Mar 2015 15:51:21 -0700
Message-ID: <5500C6E9.9010105@synopsys.com>
References: <1425991270-30629-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:40002 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751986AbbCKWxR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Mar 2015 18:53:17 -0400
In-Reply-To: <1425991270-30629-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Felipe Balbi <balbi@ti.com>, John Youn <John.Youn@synopsys.com>

On 3/10/2015 5:41 AM, Marek Szyprowski wrote:
> If device is configured to work only in HOST or DEVICE mode, there is
> no point in initializing both subdrivers. This patch also fixes
> resource leakage if host subdriver fails to initialize.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/core.h     |  2 ++
>  drivers/usb/dwc2/platform.c | 29 +++++++++++++++++++++--------
>  2 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index 7a70a1349334..f93b06daef97 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -570,6 +570,8 @@ struct dwc2_hsotg {
>  	struct dwc2_core_params *core_params;
>  	enum usb_otg_state op_state;
>  	enum usb_dr_mode dr_mode;
> +	unsigned int hcd_enabled:1;
> +	unsigned int gadget_enabled:1;
>  
>  	struct phy *phy;
>  	struct usb_phy *uphy;
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index 6a795aa2ff05..ee0b0b06d0fc 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -121,8 +121,10 @@ static int dwc2_driver_remove(struct platform_device *dev)
>  {
>  	struct dwc2_hsotg *hsotg = platform_get_drvdata(dev);
>  
> -	dwc2_hcd_remove(hsotg);
> -	s3c_hsotg_remove(hsotg);
> +	if (hsotg->hcd_enabled)
> +		dwc2_hcd_remove(hsotg);
> +	if (hsotg->gadget_enabled)
> +		s3c_hsotg_remove(hsotg);
>  
>  	return 0;
>  }
> @@ -214,12 +216,23 @@ static int dwc2_driver_probe(struct platform_device *dev)
>  
>  	spin_lock_init(&hsotg->lock);
>  	mutex_init(&hsotg->init_mutex);
> -	retval = dwc2_gadget_init(hsotg, irq);
> -	if (retval)
> -		return retval;
> -	retval = dwc2_hcd_init(hsotg, irq, params);
> -	if (retval)
> -		return retval;
> +
> +	if (hsotg->dr_mode != USB_DR_MODE_HOST) {
> +		retval = dwc2_gadget_init(hsotg, irq);
> +		if (retval)
> +			return retval;
> +		hsotg->gadget_enabled = 1;
> +	}
> +
> +	if (hsotg->dr_mode != USB_DR_MODE_PERIPHERAL) {
> +		retval = dwc2_hcd_init(hsotg, irq, params);
> +		if (retval) {
> +			if (hsotg->gadget_enabled)
> +				s3c_hsotg_remove(hsotg);
> +			return retval;
> +		}
> +		hsotg->hcd_enabled = 1;
> +	}
>  
>  	platform_set_drvdata(dev, hsotg);
>  
> 

Acked-by: John Youn <johnyoun@synopsys.com>
