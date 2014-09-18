From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 1/2] usb: host: ehci-exynos: Remove unnecessary usb-phy
 support
Date: Thu, 18 Sep 2014 10:50:26 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1409181048290.894-100000@iolanthe.rowland.org>
References: <1411014258-17877-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411014258-17877-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, kgene.kim@samsung.com, jg1.han@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 18 Sep 2014, Vivek Gautam wrote:

> Now that we have completely moved from older USB-PHY drivers
> to newer GENERIC-PHY drivers for PHYs available with USB controllers
> on Exynos series of SoCs, we can remove the support for the same
> in our host drivers too.
> 
> We also defer the probe for our host in case we end up getting
> EPROBE_DEFER error when getting PHYs.

Better now.  But I didn't notice this the first time:

> +		if (IS_ERR(phy)) {
> +			ret = PTR_ERR(phy);
> +			if (ret == -EPROBE_DEFER) {
> +				return ret;
> +			} else if (ret != -ENOSYS && ret != -ENODEV) {
> +				dev_err(dev,
> +					"Error retrieving usb2 phy: %d\n", ret);
> +				return PTR_ERR(phy);

It doesn't make any real difference, but wouldn't you prefer to say
"return ret" here?

With or without that change, for both these two patches:

Acked-by: Alan Stern <stern@rowland.harvard.edu>
