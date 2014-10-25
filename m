From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH v2 02/10] usb: dwc2/gadget: fix enumeration issues
Date: Sat, 25 Oct 2014 00:21:10 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844E5B63@US01WEMBX2.internal.synopsys.com>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413801940-31086-3-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org



> -----Original Message-----
> From: Marek Szyprowski [mailto:m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org]
> Sent: Monday, October 20, 2014 3:46 AM
> 
> Excessive debug messages might cause timing issues that prevent correct
> usb enumeration. This patch hides information about USB bus reset to let
> driver enumerate fast enough to avoid making host angry. This fixes
> endless enumeration and usb reset loop observed with some Linux hosts.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/usb/dwc2/gadget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 119c8a3effc2..8870e38c1d82 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2333,7 +2333,7 @@ irq_retry:
> 
>  		u32 usb_status = readl(hsotg->regs + GOTGCTL);
> 
> -		dev_info(hsotg->dev, "%s: USBRst\n", __func__);
> +		dev_dbg(hsotg->dev, "%s: USBRst\n", __func__);
>  		dev_dbg(hsotg->dev, "GNPTXSTS=%08x\n",
>  			readl(hsotg->regs + GNPTXSTS));
> 

Acked-by: Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
