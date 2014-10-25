From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH v2 01/10] usb: dwc2/gadget: report disconnect event from
 'end session' irq
Date: Sat, 25 Oct 2014 01:23:00 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844E5C19@US01WEMBX2.internal.synopsys.com>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413801940-31086-2-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

> From: Marek Szyprowski [mailto:m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org]
> Sent: Monday, October 20, 2014 3:46 AM
> 
> This patch adds a call to s3c_hsotg_disconnect() from 'end session'
> interrupt (GOTGINT_SES_END_DET) to correctly notify gadget subsystem
> about unplugged usb cable. 'disconnected' interrupt (DISCONNINT) might
> look a bit more suitable for this event, but it is asserted only in
> host mode, so in device mode we need to use something else.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/usb/dwc2/gadget.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 7b5856fadd93..119c8a3effc2 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2279,6 +2279,12 @@ irq_retry:
>  		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
> 
>  		writel(otgint, hsotg->regs + GOTGINT);
> +
> +		if (otgint & GOTGINT_SES_END_DET) {
> +			if (hsotg->gadget.speed != USB_SPEED_UNKNOWN)
> +				s3c_hsotg_disconnect(hsotg);
> +			hsotg->gadget.speed = USB_SPEED_UNKNOWN;
> +		}
>  	}
> 
>  	if (gintsts & GINTSTS_SESSREQINT) {

Does this mean we can get rid of the call to s3c_hsotg_disconnect in
s3c_hsotg_process_control after a SET_ADDRESS is received? If not,
then s3c_hsotg_disconnect will be called twice, once here after the
disconnect, and once again after the reconnect and SET_ADDRESS.

-- 
Paul

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
