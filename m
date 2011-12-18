From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 3/7] s3c-hsudc: add a remove function
Date: Sun, 18 Dec 2011 08:10:48 +0000
Message-ID: <20111218081048.GS14542@n2100.arm.linux.org.uk>
References: <201112172023.05519.heiko@sntech.de> <201112172026.34215.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40025 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750833Ab1LRILG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Dec 2011 03:11:06 -0500
Content-Disposition: inline
In-Reply-To: <201112172026.34215.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Greg KH <greg@kroah.com>
Cc: Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org

On Sat, Dec 17, 2011 at 08:26:33PM +0100, Heiko St=FCbner wrote:
> As the driver is also buildable as a module it should need
> a cleanup function for the removal of the module.

My guess is that this wasn't implemented because of the embedded struct
device lifetime rules for the gadget - to prevent the unbinding of the
driver.

Until the struct device lifetime gets fixed, you must not allow the mod=
ule
nor the data structure containing the struct device to be freed.

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/usb/gadget/s3c-hsudc.c |   25 +++++++++++++++++++++++++
>  1 files changed, 25 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/s3c-hsudc.c b/drivers/usb/gadget/s3c-=
hsudc.c
> index 3e5673d..7cb0850 100644
> --- a/drivers/usb/gadget/s3c-hsudc.c
> +++ b/drivers/usb/gadget/s3c-hsudc.c
> @@ -1370,12 +1370,37 @@ err_res:
>  	return ret;
>  }
> =20
> +static int __devexit s3c_hsudc_remove(struct platform_device *pdev)
> +{
> +	struct s3c_hsudc *hsudc =3D the_controller;
> +
> +	usb_del_gadget_udc(&hsudc->gadget);
> +
> +	clk_disable(hsudc->uclk);
> +	clk_put(hsudc->uclk);
> +
> +	free_irq(hsudc->irq, hsudc);
> +
> +	iounmap(hsudc->regs);
> +
> +	release_resource(hsudc->mem_rsrc);
> +	kfree(hsudc->mem_rsrc);
> +
> +	if (hsudc->transceiver)
> +		otg_put_transceiver(hsudc->transceiver);
> +
> +	the_controller =3D NULL;
> +	kfree(hsudc);
> +	return 0;
> +}
> +
>  static struct platform_driver s3c_hsudc_driver =3D {
>  	.driver		=3D {
>  		.owner	=3D THIS_MODULE,
>  		.name	=3D "s3c-hsudc",
>  	},
>  	.probe		=3D s3c_hsudc_probe,
> +	.remove		=3D __devexit_p(s3c_hsudc_remove),
>  };
> =20
>  module_platform_driver(s3c_hsudc_driver);
> --=20
> 1.7.2.3
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
