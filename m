From: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Subject: RE: [PATCH v3] usb: dwc2/gadget: report disconnect event from 'end
 session' irq
Date: Fri, 31 Oct 2014 18:15:08 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844E7F53@US01WEMBX2.internal.synopsys.com>
References: <1413801940-31086-2-git-send-email-m.szyprowski@samsung.com>
 <1414742668-4107-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:50516 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758724AbaJaSPK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 14:15:10 -0400
In-Reply-To: <1414742668-4107-1-git-send-email-m.szyprowski@samsung.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Felipe Balbi <balbi@ti.com>

> From: Marek Szyprowski [mailto:m.szyprowski@samsung.com]
> Sent: Friday, October 31, 2014 1:04 AM
> To: linux-usb@vger.kernel.org; linux-samsung-soc@vger.kernel.org
> Cc: Marek Szyprowski; Kyungmin Park; Robert Baldyga; Paul Zimmerman; Krzysztof Kozlowski; Felipe Balbi
> Subject: [PATCH v3] usb: dwc2/gadget: report disconnect event from 'end session' irq
> 
> This patch adds a call to s3c_hsotg_disconnect() from 'end session'
> interrupt (GOTGINT_SES_END_DET) to correctly notify gadget subsystem
> about unplugged usb cable. 'disconnected' interrupt (DISCONNINT) might
> look a bit more suitable for this event, but it is asserted only in
> host mode, so in device mode we need to use something else.
> 
> Additional check has been added in s3c_hsotg_disconnect() function
> to ensure that the event is reported only once after successful device
> enumeration.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/core.h   |  1 +
>  drivers/usb/dwc2/gadget.c | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index 55c90c53f2d6..b42df32e7737 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -212,6 +212,7 @@ struct s3c_hsotg {
>  	struct usb_gadget       gadget;
>  	unsigned int            setup;
>  	unsigned long           last_rst;
> +	unsigned int		address;
>  	struct s3c_hsotg_ep     *eps;
>  };
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index fcd2bb55ccca..6304efba11aa 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -1114,6 +1114,7 @@ static void s3c_hsotg_process_control(struct s3c_hsotg *hsotg,
>  				 DCFG_DEVADDR_SHIFT) & DCFG_DEVADDR_MASK;
>  			writel(dcfg, hsotg->regs + DCFG);
> 
> +			hsotg->address = ctrl->wValue;
>  			dev_info(hsotg->dev, "new address %d\n", ctrl->wValue);
> 
>  			ret = s3c_hsotg_send_reply(hsotg, ep0, NULL, 0);
> @@ -2031,6 +2032,10 @@ static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg)
>  {
>  	unsigned ep;
> 
> +	if (!hsotg->address)
> +		return;
> +
> +	hsotg->address = 0;
>  	for (ep = 0; ep < hsotg->num_of_eps; ep++)
>  		kill_all_requests(hsotg, &hsotg->eps[ep], -ESHUTDOWN, true);
> 
> @@ -2290,6 +2295,11 @@ irq_retry:
>  		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
> 
>  		writel(otgint, hsotg->regs + GOTGINT);
> +
> +		if (otgint & GOTGINT_SES_END_DET) {
> +			s3c_hsotg_disconnect(hsotg);
> +			hsotg->gadget.speed = USB_SPEED_UNKNOWN;
> +		}
>  	}
> 
>  	if (gintsts & GINTSTS_SESSREQINT) {

I don't think this is right. The host can send control requests to
the device before it sends a SetAddress to change from the default
address of 0. So if a GOTGINT_SES_END_DET happens before the
SetAddress, it will be ignored.

Or am I missing something?

-- 
Paul
