From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH v2 05/10] usb: dwc2/gadget: move setting last reset time
 to s3c_hsotg_core_init
Date: Sat, 25 Oct 2014 00:23:23 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844E5B7B@US01WEMBX2.internal.synopsys.com>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-6-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413801940-31086-6-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

> From: Marek Szyprowski [mailto:m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org]
> Sent: Monday, October 20, 2014 3:46 AM
> 
> This patch removes duplicated code and sets last_rst variable in the
> function which does the hardware reset.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/usb/dwc2/gadget.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index fd52a8b23649..c1dad46bbbdd 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2247,6 +2247,8 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
>  	/* must be at-least 3ms to allow bus to see disconnect */
>  	mdelay(3);
> 
> +	hsotg->last_rst = jiffies;
> +
>  	/* remove the soft-disconnect and let's go */
>  	__bic32(hsotg->regs + DCTL, DCTL_SFTDISCON);
>  }
> @@ -2347,7 +2349,6 @@ irq_retry:
>  							  -ECONNRESET, true);
> 
>  				s3c_hsotg_core_init(hsotg);
> -				hsotg->last_rst = jiffies;
>  			}
>  		}
>  	}
> @@ -2908,7 +2909,6 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
>  		goto err;
>  	}
> 
> -	hsotg->last_rst = jiffies;
>  	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
>  	return 0;
> 
> @@ -3667,7 +3667,6 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
>  	}
> 
>  	spin_lock_irqsave(&hsotg->lock, flags);
> -	hsotg->last_rst = jiffies;
>  	s3c_hsotg_phy_enable(hsotg);
>  	s3c_hsotg_core_init(hsotg);
>  	spin_unlock_irqrestore(&hsotg->lock, flags);

Acked-by: Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
