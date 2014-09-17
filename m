From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v3 2/2] usb: host: ohci-exynos: Remove unnecessary usb-phy
 support
Date: Wed, 17 Sep 2014 21:06:05 +0900
Message-ID: <001501cfd26f$c1c32bf0$454983d0$%han@samsung.com>
References: <1410952662-4297-1-git-send-email-gautam.vivek@samsung.com>
 <1410952662-4297-3-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22618 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754061AbaIQMGI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 08:06:08 -0400
In-reply-to: <1410952662-4297-3-git-send-email-gautam.vivek@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, kgene.kim@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, September 17, 2014 8:18 PM, Vivek Gautam wrote:
> 
> Now that we have completely moved from older USB-PHY drivers
> to newer GENERIC-PHY drivers for PHYs available with USB controllers
> on Exynos series of SoCs, we can remove the support for the same
> in our host drivers too.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>

Acked-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/usb/host/ohci-exynos.c |   89 +++++++++++-----------------------------
>  1 file changed, 24 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
> index 7c48e3f..992b28d 100644
> --- a/drivers/usb/host/ohci-exynos.c
> +++ b/drivers/usb/host/ohci-exynos.c
> @@ -19,11 +19,8 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> -#include <linux/usb/phy.h>
> -#include <linux/usb/samsung_usb_phy.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
> -#include <linux/usb/otg.h>
> 
>  #include "ohci.h"
> 
> @@ -38,9 +35,7 @@ static struct hc_driver __read_mostly exynos_ohci_hc_driver;
> 
>  struct exynos_ohci_hcd {
>  	struct clk *clk;
> -	struct usb_phy *phy;
> -	struct usb_otg *otg;
> -	struct phy *phy_g[PHY_NUMBER];
> +	struct phy *phy[PHY_NUMBER];
>  };
> 
>  static int exynos_ohci_get_phy(struct device *dev,
> @@ -48,56 +43,40 @@ static int exynos_ohci_get_phy(struct device *dev,
>  {
>  	struct device_node *child;
>  	struct phy *phy;
> -	int phy_number;
> -	int ret = 0;
> +	int phy_num;
> +	int ret;
> 
> -	/*
> -	 * Getting generic phy:
> -	 * We are keeping both types of phys as a part of transiting OHCI
> -	 * to generic phy framework, so as to maintain backward compatibilty
> -	 * with old DTB too.
> -	 * We fallback to older USB-PHYs when we fail to get generic PHYs.
> -	 */
> +	/* Get the generic phys */
>  	for_each_available_child_of_node(dev->of_node, child) {
> -		ret = of_property_read_u32(child, "reg", &phy_number);
> +		ret = of_property_read_u32(child, "reg", &phy_num);
>  		if (ret) {
>  			dev_err(dev, "Failed to parse device tree\n");
>  			of_node_put(child);
>  			return ret;
>  		}
> 
> -		if (phy_number >= PHY_NUMBER) {
> +		if (phy_num >= PHY_NUMBER) {
>  			dev_err(dev, "Invalid number of PHYs\n");
>  			of_node_put(child);
>  			return -EINVAL;
>  		}
> 
> -		phy = devm_of_phy_get(dev, child, NULL);
> +		exynos_ohci->phy[phy_num] = devm_of_phy_get(dev, child, NULL);
> +		phy = exynos_ohci->phy[phy_num];
>  		of_node_put(child);
> -		if (IS_ERR(phy))
> -			/* Lets fallback to older USB-PHYs */
> -			goto usb_phy_old;
> -		exynos_ohci->phy_g[phy_number] = phy;
> -		/* Make the older PHYs unavailable */
> -		exynos_ohci->phy = ERR_PTR(-ENXIO);
> -	}
> -
> -	return 0;
> -
> -usb_phy_old:
> -	exynos_ohci->phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
> -	if (IS_ERR(exynos_ohci->phy)) {
> -		ret = PTR_ERR(exynos_ohci->phy);
> -		if (ret != -ENXIO && ret != -ENODEV) {
> -			dev_err(dev, "no usb2 phy configured\n");
> -			return ret;
> +		if (IS_ERR(phy)) {
> +			ret = PTR_ERR(phy);
> +			if (ret == -EPROBE_DEFER) {
> +				return ret;
> +			} else if (ret != -ENOSYS && ret != -ENODEV) {
> +				dev_err(dev,
> +					"Error retrieving usb2 phy: %d\n", ret);
> +				return PTR_ERR(phy);
> +			}
>  		}
> -		dev_dbg(dev, "Failed to get usb2 phy\n");
> -	} else {
> -		exynos_ohci->otg = exynos_ohci->phy->otg;
>  	}
> 
> -	return ret;
> +	return 0;
>  }
> 
>  static int exynos_ohci_phy_enable(struct device *dev)
> @@ -107,16 +86,13 @@ static int exynos_ohci_phy_enable(struct device *dev)
>  	int i;
>  	int ret = 0;
> 
> -	if (!IS_ERR(exynos_ohci->phy))
> -		return usb_phy_init(exynos_ohci->phy);
> -
>  	for (i = 0; ret == 0 && i < PHY_NUMBER; i++)
> -		if (!IS_ERR(exynos_ohci->phy_g[i]))
> -			ret = phy_power_on(exynos_ohci->phy_g[i]);
> +		if (!IS_ERR(exynos_ohci->phy[i]))
> +			ret = phy_power_on(exynos_ohci->phy[i]);
>  	if (ret)
>  		for (i--; i >= 0; i--)
> -			if (!IS_ERR(exynos_ohci->phy_g[i]))
> -				phy_power_off(exynos_ohci->phy_g[i]);
> +			if (!IS_ERR(exynos_ohci->phy[i]))
> +				phy_power_off(exynos_ohci->phy[i]);
> 
>  	return ret;
>  }
> @@ -127,14 +103,9 @@ static void exynos_ohci_phy_disable(struct device *dev)
>  	struct exynos_ohci_hcd *exynos_ohci = to_exynos_ohci(hcd);
>  	int i;
> 
> -	if (!IS_ERR(exynos_ohci->phy)) {
> -		usb_phy_shutdown(exynos_ohci->phy);
> -		return;
> -	}
> -
>  	for (i = 0; i < PHY_NUMBER; i++)
> -		if (!IS_ERR(exynos_ohci->phy_g[i]))
> -			phy_power_off(exynos_ohci->phy_g[i]);
> +		if (!IS_ERR(exynos_ohci->phy[i]))
> +			phy_power_off(exynos_ohci->phy[i]);
>  }
> 
>  static int exynos_ohci_probe(struct platform_device *pdev)
> @@ -206,9 +177,6 @@ skip_phy:
>  		goto fail_io;
>  	}
> 
> -	if (exynos_ohci->otg)
> -		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
> -
>  	platform_set_drvdata(pdev, hcd);
> 
>  	err = exynos_ohci_phy_enable(&pdev->dev);
> @@ -241,9 +209,6 @@ static int exynos_ohci_remove(struct platform_device *pdev)
> 
>  	usb_remove_hcd(hcd);
> 
> -	if (exynos_ohci->otg)
> -		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
> -
>  	exynos_ohci_phy_disable(&pdev->dev);
> 
>  	clk_disable_unprepare(exynos_ohci->clk);
> @@ -272,9 +237,6 @@ static int exynos_ohci_suspend(struct device *dev)
>  	if (rc)
>  		return rc;
> 
> -	if (exynos_ohci->otg)
> -		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
> -
>  	exynos_ohci_phy_disable(dev);
> 
>  	clk_disable_unprepare(exynos_ohci->clk);
> @@ -290,9 +252,6 @@ static int exynos_ohci_resume(struct device *dev)
> 
>  	clk_prepare_enable(exynos_ohci->clk);
> 
> -	if (exynos_ohci->otg)
> -		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
> -
>  	ret = exynos_ohci_phy_enable(dev);
>  	if (ret) {
>  		dev_err(dev, "Failed to enable USB phy\n");
> --
> 1.7.10.4
