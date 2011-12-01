From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] USB: Add S5P OHCI diver
Date: Thu, 01 Dec 2011 19:03:15 +0900
Message-ID: <046e01ccb010$7175e9a0$5461bce0$%kim@samsung.com>
References: <1321338716-15593-1-git-send-email-jg1.han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20085 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751718Ab1LAKDl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 05:03:41 -0500
In-reply-to: <1321338716-15593-1-git-send-email-jg1.han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Greg Kroah-Hartman' <gregkh@suse.de>, 'Alan Stern' <stern@rowland.harvard.edu>
Cc: 'Yulgon Kim' <yulgon.kim@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>

Jingoo Han wrote:
> 
> This patch adds USB OHCI driver for Samsung S5P SoCs.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/usb/Kconfig         |    1 +
>  drivers/usb/host/Kconfig    |    6 +
>  drivers/usb/host/ohci-hcd.c |    5 +
>  drivers/usb/host/ohci-s5p.c |  273
> +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 285 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/usb/host/ohci-s5p.c
> 

(snip)

> +#ifdef CONFIG_PM
> +static int s5p_ohci_suspend(struct device *dev)
> +{
> +	struct s5p_ohci_hcd *s5p_ohci = dev_get_drvdata(dev);
> +	struct usb_hcd *hcd = s5p_ohci->hcd;
> +	struct ohci_hcd *ohci = hcd_to_ohci(hcd);
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct s5p_ohci_platdata *pdata = pdev->dev.platform_data;
> +	unsigned long flags;
> +	int rc = 0;
> +
> +	/* Root hub was already suspended. Disable irq emission and
> +	 * mark HW unaccessible, bail out if RH has been resumed. Use
> +	 * the spinlock to properly synchronize with possible pending
> +	 * RH suspend or resume activity.
> +	 *
> +	 * This is still racy as hcd->state is manipulated outside of
> +	 * any locks =P But that will be a different fix.
> +	 */
> +	spin_lock_irqsave(&ohci->lock, flags);
> +	if (hcd->state != HC_STATE_SUSPENDED && hcd->state != HC_STATE_HALT)
> {
> +		rc = -EINVAL;
> +		goto fail;
> +	}
> +
> +	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
> +
> +	if (pdata && pdata->phy_exit)
> +		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);

Since ohci and echi share the code for control of phy, this can make a
problem when this is used by module or doing suspend-to-resume. So need to
sort it out.

And how about to use ohci-exynos instead of ohci-s5p? As you know, this
can/will be used on EXYNOS SoCs.

Others, ok to me. If you address comments from me, you can add my ack.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
