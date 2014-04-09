From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: Add facility to toggle vbus gpio
 on/off
Date: Wed, 09 Apr 2014 14:11:34 +0200
Message-ID: <534538F6.2010009@samsung.com>
References: <1397044485-26483-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:11383 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932542AbaDIMLi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 08:11:38 -0400
In-reply-to: <1397044485-26483-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>, kishon@ti.com
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, kgene.kim@samsung.com, t.figa@samsung.com, k.debski@samsung.com, jg1.han@samsung.com

Hi Vivek,

On 09/04/14 13:54, Vivek Gautam wrote:
> Adding support to enable/disable VBUS hooked to a gpio
> to enable vbus supply on the port.

Does the GPIO control a fixed voltage regulator ? If so, shouldn't
it be modelled by the regulator API instead ?

> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
[...]
> +	/* Get required GPIO for vbus */
> +	phy_drd->gpio = of_get_named_gpio(dev->of_node,
> +					  "samsung,vbus-gpio", 0);
> +	if (!gpio_is_valid(phy_drd->gpio))
> +		dev_dbg(dev, "no usbdrd-phy vbus gpio defined\n");
> +
> +	if (devm_gpio_request(dev, phy_drd->gpio, "phydrd_vbus_gpio"))
> +		dev_dbg(dev, "can't request usbdrd-phy vbus gpio %d\n",
> +			phy_drd->gpio);

--
Regards,
Sylwester
