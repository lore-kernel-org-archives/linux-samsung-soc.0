From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v7 1/2] usb: host: xhci-plat: Get PHYs for xhci's hcds
Date: Fri, 31 Oct 2014 16:51:10 +0300
Message-ID: <545393CE.8070102@cogentembedded.com>
References: <1414761989-21088-1-git-send-email-gautam.vivek@samsung.com> <1414761989-21088-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:47195 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758818AbaJaNvN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 09:51:13 -0400
Received: by mail-la0-f45.google.com with SMTP id pn19so878119lab.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2014 06:51:11 -0700 (PDT)
In-Reply-To: <1414761989-21088-2-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, kishon@ti.com, balbi@ti.com, stern@rowland.harvard.edu, kgene.kim@samsung.com, heikki.krogerus@linux.intel.com, mathias.nyman@intel.com, jwerner@google.com, jg1.han@samsung.com

Hello.

On 10/31/2014 4:26 PM, Vivek Gautam wrote:

> The host controller by itself may sometimes need to handle PHY
> and re-initialize it to re-configure some of the PHY parameters
> to get full support out of the PHY controller.
> Therefore, facilitate getting the two possible PHYs, viz.
> USB 2.0 type (UTMI+) and USB 3.0 type (PIPE3), and initialize them.

> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> ---
>   drivers/usb/host/xhci-plat.c |   74 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)

> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 3d78b0c..5207d5b 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
[...]
> @@ -129,10 +130,41 @@ static int xhci_plat_probe(struct platform_device *pdev)
>   			goto put_hcd;
>   	}
>
> +	/* Get possile USB 2.0 type PHY (UTMI+) available with xhci */
> +	hcd->phy = devm_phy_get(&pdev->dev, "usb2-phy");
> +	if (IS_ERR(hcd->phy)) {
> +		ret = PTR_ERR(hcd->phy);
> +		if (ret == -EPROBE_DEFER) {
> +			goto disable_clk;
> +		} else if (ret != -ENOSYS && ret != -ENODEV) {

    Asking to be a *switch* statement instead...

> +			hcd->phy = NULL;
> +			dev_warn(&pdev->dev,
> +				 "Error retrieving usb2 phy: %d\n", ret);
> +		}
> +	}
> +
[...]
> @@ -158,12 +190,41 @@ static int xhci_plat_probe(struct platform_device *pdev)
>   	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
>   		xhci->shared_hcd->can_do_streams = 1;
>
> +	/* Get possile USB 3.0 type PHY (PIPE3) available with xhci */
> +	xhci->shared_hcd->phy = devm_phy_get(&pdev->dev, "usb3-phy");
> +	if (IS_ERR(xhci->shared_hcd->phy)) {
> +		ret = PTR_ERR(xhci->shared_hcd->phy);
> +		if (ret == -EPROBE_DEFER) {
> +			goto put_usb3_hcd;
> +		} else if (ret != -ENOSYS && ret != -ENODEV) {

    Likewise...

> +			xhci->shared_hcd->phy = NULL;
> +			dev_warn(&pdev->dev,
> +				 "Error retrieving usb3 phy: %d\n", ret);
> +		}
> +	}
> +
[...]
> @@ -204,6 +271,8 @@ static int xhci_plat_suspend(struct device *dev)
>   	struct usb_hcd	*hcd = dev_get_drvdata(dev);
>   	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
>
> +	phy_exit(hcd->phy);

    Hm, in the suspend() method?

> +
>   	return xhci_suspend(xhci);
>   }
>
[...]

WBR, Sergei
