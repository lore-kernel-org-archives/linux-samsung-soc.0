From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] dwc3-exynos: Fix deferred probing storm.
Date: Wed, 25 May 2016 09:54:36 +0200
Message-ID: <57455A3C.4010707@samsung.com>
References: <20160524192424.GA11690@sesse.net>
 <E1b5Hwn-0005Be-UA@pannekake.samfundet.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:16825 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750969AbcEYHyk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2016 03:54:40 -0400
In-reply-to: <E1b5Hwn-0005Be-UA@pannekake.samfundet.no>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Steinar H. Gunderson" <sesse@google.com>
Cc: broonie@debian.org, linux-samsung-soc@vger.kernel.org, 823552@bugs.debian.org, balbi@kernel.org, linux-usb@vger.kernel.org

On 05/24/2016 08:13 PM, Steinar H. Gunderson wrote:
> dwc3-exynos has two problems during init if the regulators are slow
> to come up (for instance if the I2C bus driver is not on the initramfs)
> and return probe deferral. First, every time this happens, the driver
> leaks the USB phys created; they need to be deallocated on error.
> 
> Second, since the phy devices are created before the regulators fail,
> this means that there's a new device to re-trigger deferred probing,
> which causes it to essentially go into a busy loop of re-probing the
> device until the regulators come up.
> 
> Move the phy creation to after the regulators have succeeded, and also
> fix cleanup on failure. On my ODROID XU4 system (with Debian's initramfs
> which doesn't contain the I2C driver), this reduces the number of probe
> attempts (for each of the two controllers) from more than 2000 to eight.
> 
> Reported-by: Steinar H. Gunderson <sgunderson@bigfoot.com>
> Signed-off-by: Steinar H. Gunderson <sesse@google.com>

This is the same person so no need for "Reported-by". The reported-by is
used if someone else submits patch after your bug report.

Please (when resubmitting or applying) add following tags:

Fixes: d720f057fda4 ("usb: dwc3: exynos: add nop transceiver support")
Cc: <stable@vger.kernel.org>

This will help downstream (like Debian) using stable kernels.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

> ---
>  drivers/usb/dwc3/dwc3-exynos.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
> index dd5cb55..2f1fb7e 100644
> --- a/drivers/usb/dwc3/dwc3-exynos.c
> +++ b/drivers/usb/dwc3/dwc3-exynos.c
> @@ -128,12 +128,6 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, exynos);
>  
> -	ret = dwc3_exynos_register_phys(exynos);
> -	if (ret) {
> -		dev_err(dev, "couldn't register PHYs\n");
> -		return ret;
> -	}
> -
>  	exynos->dev	= dev;
>  
>  	exynos->clk = devm_clk_get(dev, "usbdrd30");
> @@ -183,20 +177,29 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
>  		goto err3;
>  	}
>  
> +	ret = dwc3_exynos_register_phys(exynos);
> +	if (ret) {
> +		dev_err(dev, "couldn't register PHYs\n");
> +		goto err4;
> +	}
> +
>  	if (node) {
>  		ret = of_platform_populate(node, NULL, NULL, dev);
>  		if (ret) {
>  			dev_err(dev, "failed to add dwc3 core\n");
> -			goto err4;
> +			goto err5;
>  		}
>  	} else {
>  		dev_err(dev, "no device node, failed to add dwc3 core\n");
>  		ret = -ENODEV;
> -		goto err4;
> +		goto err5;
>  	}
>  
>  	return 0;
>  
> +err5:
> +	platform_device_unregister(exynos->usb2_phy);
> +	platform_device_unregister(exynos->usb3_phy);
>  err4:
>  	regulator_disable(exynos->vdd10);
>  err3:
> 
