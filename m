From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH v3 1/2] usb: dwc2/gadget: add mutex to serialize
 init/deinit calls
Date: Tue, 18 Nov 2014 21:00:18 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304844ED98E@US01WEMBX2.internal.synopsys.com>
References: <54535F82.7020406@samsung.com>
 <1414750354-19571-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414750354-19571-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

> From: Marek Szyprowski [mailto:m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org]
> Sent: Friday, October 31, 2014 3:13 AM
> 
> This patch adds mutex, which protects initialization and
> deinitialization procedures against suspend/resume methods.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/usb/dwc2/core.h   |  1 +
>  drivers/usb/dwc2/gadget.c | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index 9f77b4d1c5ff..58732a9a0019 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -187,6 +187,7 @@ struct s3c_hsotg {
>  	struct s3c_hsotg_plat    *plat;
> 
>  	spinlock_t              lock;
> +	struct mutex		init_mutex;
> 
>  	void __iomem            *regs;
>  	int                     irq;
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index d8dda39c9e16..a2e4272a904e 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -21,6 +21,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/debugfs.h>
> +#include <linux/mutex.h>
>  #include <linux/seq_file.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> @@ -2908,6 +2909,7 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
>  		return -EINVAL;
>  	}
> 
> +	mutex_lock(&hsotg->init_mutex);
>  	WARN_ON(hsotg->driver);
> 
>  	driver->driver.bus = NULL;
> @@ -2933,9 +2935,12 @@ static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
> 
>  	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
> 
> +	mutex_unlock(&hsotg->init_mutex);
> +
>  	return 0;
> 
>  err:
> +	mutex_unlock(&hsotg->init_mutex);
>  	hsotg->driver = NULL;
>  	return ret;
>  }
> @@ -2957,6 +2962,8 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget,
>  	if (!hsotg)
>  		return -ENODEV;
> 
> +	mutex_lock(&hsotg->init_mutex);
> +
>  	/* all endpoints should be shutdown */
>  	for (ep = 1; ep < hsotg->num_of_eps; ep++)
>  		s3c_hsotg_ep_disable(&hsotg->eps[ep].ep);
> @@ -2974,6 +2981,8 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget,
> 
>  	clk_disable(hsotg->clk);
> 
> +	mutex_unlock(&hsotg->init_mutex);
> +
>  	return 0;
>  }
> 
> @@ -3002,6 +3011,7 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
> 
>  	dev_dbg(hsotg->dev, "%s: is_on: %d\n", __func__, is_on);
> 
> +	mutex_lock(&hsotg->init_mutex);
>  	spin_lock_irqsave(&hsotg->lock, flags);
>  	if (is_on) {
>  		clk_enable(hsotg->clk);
> @@ -3013,6 +3023,7 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
> 
>  	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> +	mutex_unlock(&hsotg->init_mutex);
> 
>  	return 0;
>  }
> @@ -3507,6 +3518,7 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
>  	}
> 
>  	spin_lock_init(&hsotg->lock);
> +	mutex_init(&hsotg->init_mutex);
> 
>  	hsotg->irq = ret;
> 
> @@ -3652,6 +3664,8 @@ static int s3c_hsotg_suspend(struct platform_device *pdev, pm_message_t state)
>  	unsigned long flags;
>  	int ret = 0;
> 
> +	mutex_lock(&hsotg->init_mutex);
> +
>  	if (hsotg->driver)
>  		dev_info(hsotg->dev, "suspending usb gadget %s\n",
>  			 hsotg->driver->driver.name);
> @@ -3674,6 +3688,8 @@ static int s3c_hsotg_suspend(struct platform_device *pdev, pm_message_t state)
>  		clk_disable(hsotg->clk);
>  	}
> 
> +	mutex_unlock(&hsotg->init_mutex);
> +
>  	return ret;
>  }
> 
> @@ -3683,7 +3699,9 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
>  	unsigned long flags;
>  	int ret = 0;
> 
> +	mutex_lock(&hsotg->init_mutex);
>  	if (hsotg->driver) {
> +
>  		dev_info(hsotg->dev, "resuming usb gadget %s\n",
>  			 hsotg->driver->driver.name);
> 
> @@ -3699,6 +3717,8 @@ static int s3c_hsotg_resume(struct platform_device *pdev)
>  	s3c_hsotg_core_connect(hsotg);
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> 
> +	mutex_unlock(&hsotg->init_mutex);
> +
>  	return ret;
>  }
> 

Acked-by: Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
