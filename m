From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/4 v2] USB: ehci-s5p: Add phy driver support
Date: Mon, 15 Oct 2012 14:52:00 +0900
Message-ID: <008f01cdaa99$32371000$96a53000$%han@samsung.com>
References: <1349865780-7701-1-git-send-email-gautam.vivek@samsung.com>
 <1349865780-7701-4-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1349865780-7701-4-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, October 10, 2012 7:43 PM Vivek Gautam wrote

> 
> Adding the transceiver to ehci driver. Keeping the platform data
> for continuing the smooth operation for boards which still uses it
> 
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>


It looks good. I have tested this patch with Exynos5250.

Acked-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>


Best regards,
Jingoo Han


> ---
>  drivers/usb/host/ehci-s5p.c |   65 +++++++++++++++++++++++++++++-------------
>  1 files changed, 45 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
> index 85b74be..6dac38f 100644
> --- a/drivers/usb/host/ehci-s5p.c
> +++ b/drivers/usb/host/ehci-s5p.c
> @@ -17,6 +17,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/of_gpio.h>
>  #include <linux/platform_data/usb-ehci-s5p.h>
> +#include <linux/usb/phy.h>
>  #include <plat/usb-phy.h>
> 
>  #define EHCI_INSNREG00(base)			(base + 0x90)
> @@ -32,6 +33,8 @@ struct s5p_ehci_hcd {
>  	struct device *dev;
>  	struct usb_hcd *hcd;
>  	struct clk *clk;
> +	struct usb_phy *phy;
> +	struct s5p_ehci_platdata *pdata;
>  };
> 
>  static const struct hc_driver s5p_ehci_hc_driver = {
> @@ -65,6 +68,26 @@ static const struct hc_driver s5p_ehci_hc_driver = {
>  	.clear_tt_buffer_complete	= ehci_clear_tt_buffer_complete,
>  };
> 
> +static void s5p_ehci_phy_enable(struct s5p_ehci_hcd *s5p_ehci)
> +{
> +	struct platform_device *pdev = to_platform_device(s5p_ehci->dev);
> +
> +	if (s5p_ehci->phy)
> +		usb_phy_init(s5p_ehci->phy);
> +	else if (s5p_ehci->pdata->phy_init)
> +		s5p_ehci->pdata->phy_init(pdev, S5P_USB_PHY_HOST);
> +}
> +
> +static void s5p_ehci_phy_disable(struct s5p_ehci_hcd *s5p_ehci)
> +{
> +	struct platform_device *pdev = to_platform_device(s5p_ehci->dev);
> +
> +	if (s5p_ehci->phy)
> +		usb_phy_shutdown(s5p_ehci->phy);
> +	else if (s5p_ehci->pdata->phy_exit)
> +		s5p_ehci->pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
> +}
> +
>  static void s5p_setup_vbus_gpio(struct platform_device *pdev)
>  {
>  	int err;
> @@ -92,15 +115,10 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
>  	struct usb_hcd *hcd;
>  	struct ehci_hcd *ehci;
>  	struct resource *res;
> +	struct usb_phy *phy;
>  	int irq;
>  	int err;
> 
> -	pdata = pdev->dev.platform_data;
> -	if (!pdata) {
> -		dev_err(&pdev->dev, "No platform data defined\n");
> -		return -EINVAL;
> -	}
> -
>  	/*
>  	 * Right now device-tree probed devices don't get dma_mask set.
>  	 * Since shared usb code relies on it, set it here for now.
> @@ -118,6 +136,20 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
>  	if (!s5p_ehci)
>  		return -ENOMEM;
> 
> +	pdata = pdev->dev.platform_data;
> +	if (!pdata) {
> +		/* Fallback to Phy transceiver */
> +		phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
> +		if (IS_ERR_OR_NULL(phy)) {
> +			dev_err(&pdev->dev, "no platform data or transceiver defined\n");
> +			return -EPROBE_DEFER;
> +		} else {
> +			s5p_ehci->phy = phy;
> +		}
> +	} else {
> +		s5p_ehci->pdata = pdata;
> +	}
> +
>  	s5p_ehci->dev = &pdev->dev;
> 
>  	hcd = usb_create_hcd(&s5p_ehci_hc_driver, &pdev->dev,
> @@ -163,8 +195,7 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
>  		goto fail_io;
>  	}
> 
> -	if (pdata->phy_init)
> -		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
> +	s5p_ehci_phy_enable(s5p_ehci);
> 
>  	ehci = hcd_to_ehci(hcd);
>  	ehci->caps = hcd->regs;
> @@ -175,13 +206,15 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
>  	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to add USB HCD\n");
> -		goto fail_io;
> +		goto fail_add_hcd;
>  	}
> 
>  	platform_set_drvdata(pdev, s5p_ehci);
> 
>  	return 0;
> 
> +fail_add_hcd:
> +	s5p_ehci_phy_disable(s5p_ehci);
>  fail_io:
>  	clk_disable(s5p_ehci->clk);
>  fail_clk:
> @@ -191,14 +224,12 @@ fail_clk:
> 
>  static int __devexit s5p_ehci_remove(struct platform_device *pdev)
>  {
> -	struct s5p_ehci_platdata *pdata = pdev->dev.platform_data;
>  	struct s5p_ehci_hcd *s5p_ehci = platform_get_drvdata(pdev);
>  	struct usb_hcd *hcd = s5p_ehci->hcd;
> 
>  	usb_remove_hcd(hcd);
> 
> -	if (pdata && pdata->phy_exit)
> -		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
> +	s5p_ehci_phy_disable(s5p_ehci);
> 
>  	clk_disable(s5p_ehci->clk);
> 
> @@ -222,14 +253,11 @@ static int s5p_ehci_suspend(struct device *dev)
>  	struct s5p_ehci_hcd *s5p_ehci = dev_get_drvdata(dev);
>  	struct usb_hcd *hcd = s5p_ehci->hcd;
>  	bool do_wakeup = device_may_wakeup(dev);
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct s5p_ehci_platdata *pdata = pdev->dev.platform_data;
>  	int rc;
> 
>  	rc = ehci_suspend(hcd, do_wakeup);
> 
> -	if (pdata && pdata->phy_exit)
> -		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
> +	s5p_ehci_phy_disable(s5p_ehci);
> 
>  	clk_disable(s5p_ehci->clk);
> 
> @@ -240,13 +268,10 @@ static int s5p_ehci_resume(struct device *dev)
>  {
>  	struct s5p_ehci_hcd *s5p_ehci = dev_get_drvdata(dev);
>  	struct usb_hcd *hcd = s5p_ehci->hcd;
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct s5p_ehci_platdata *pdata = pdev->dev.platform_data;
> 
>  	clk_enable(s5p_ehci->clk);
> 
> -	if (pdata && pdata->phy_init)
> -		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
> +	s5p_ehci_phy_enable(s5p_ehci);
> 
>  	/* DMA burst Enable */
>  	writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
> --
> 1.7.6.5
