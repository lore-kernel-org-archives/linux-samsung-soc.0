From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH v4] usb: dwc2/gadget: rework disconnect event handling
Date: Fri, 14 Nov 2014 19:01:37 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844EBBFF@US01WEMBX2.internal.synopsys.com>
References: <5465EEF3.7060902@samsung.com>
 <1415967607-6174-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415967607-6174-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

> -----Original Message-----
> From: Marek Szyprowski [mailto:m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org]
> Sent: Friday, November 14, 2014 4:20 AM
> 
> This patch adds a call to s3c_hsotg_disconnect() from 'end session'
> interrupt (GOTGINT_SES_END_DET) to correctly notify gadget subsystem
> about unplugged usb cable. DISCONNINT interrupt cannot be used for this
> purpose, because it is asserted only in host mode.
> 
> To avoid reporting disconnect event more than once, a disconnect call has
> been moved from USB_REQ_SET_ADDRESS handling function to SESSREQINT
> interrupt. This way driver ensures that disconnect event is reported
> either when usb cable is unplugged or every time the host starts a new
> session.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/usb/dwc2/core.h   |  1 +
>  drivers/usb/dwc2/gadget.c | 13 +++++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index 55c90c53f2d6..78b9090ebf71 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -210,6 +210,7 @@ struct s3c_hsotg {
>  	u8                      ctrl_buff[8];
> 
>  	struct usb_gadget       gadget;
> +	unsigned int		session:1;
>  	unsigned int            setup;
>  	unsigned long           last_rst;
>  	struct s3c_hsotg_ep     *eps;
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index fcd2bb55ccca..c7f68dc1cf6b 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -1029,7 +1029,6 @@ static int s3c_hsotg_process_req_feature(struct s3c_hsotg *hsotg,
>  }
> 
>  static void s3c_hsotg_enqueue_setup(struct s3c_hsotg *hsotg);
> -static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg);
> 
>  /**
>   * s3c_hsotg_stall_ep0 - stall ep0
> @@ -1107,7 +1106,6 @@ static void s3c_hsotg_process_control(struct s3c_hsotg *hsotg,
>  	if ((ctrl->bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD) {
>  		switch (ctrl->bRequest) {
>  		case USB_REQ_SET_ADDRESS:
> -			s3c_hsotg_disconnect(hsotg);
>  			dcfg = readl(hsotg->regs + DCFG);
>  			dcfg &= ~DCFG_DEVADDR_MASK;
>  			dcfg |= (le16_to_cpu(ctrl->wValue) <<
> @@ -2031,6 +2029,10 @@ static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg)
>  {
>  	unsigned ep;
> 
> +	if (!hsotg->session)
> +		return;
> +
> +	hsotg->session = 0;
>  	for (ep = 0; ep < hsotg->num_of_eps; ep++)
>  		kill_all_requests(hsotg, &hsotg->eps[ep], -ESHUTDOWN, true);
> 
> @@ -2290,11 +2292,18 @@ irq_retry:
>  		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
> 
>  		writel(otgint, hsotg->regs + GOTGINT);
> +
> +		if (otgint & GOTGINT_SES_END_DET) {
> +			s3c_hsotg_disconnect(hsotg);

I think you should clear hsotg->session here, shouldn't you?
Otherwise I think s3c_hsotg_disconnect() will be called twice, once
here and once when the next GINTSTS_SESSREQINT comes.

-- 
Paul

> +			hsotg->gadget.speed = USB_SPEED_UNKNOWN;
> +		}
>  	}
> 
>  	if (gintsts & GINTSTS_SESSREQINT) {
>  		dev_dbg(hsotg->dev, "%s: SessReqInt\n", __func__);
>  		writel(GINTSTS_SESSREQINT, hsotg->regs + GINTSTS);
> +		s3c_hsotg_disconnect(hsotg);
> +		hsotg->session = 1;
>  	}
> 
>  	if (gintsts & GINTSTS_ENUMDONE) {
> --
> 1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
