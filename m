From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 5/7] s3c-hsudc: move device registration to probe and
	remove
Date: Sun, 18 Dec 2011 08:09:07 +0000
Message-ID: <20111218080907.GR14542@n2100.arm.linux.org.uk>
References: <201112172023.05519.heiko@sntech.de> <201112172028.34509.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:47080 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814Ab1LRIJ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Dec 2011 03:09:27 -0500
Content-Disposition: inline
In-Reply-To: <201112172028.34509.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Greg KH <greg@kroah.com>
Cc: Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org

On Sat, Dec 17, 2011 at 08:28:34PM +0100, Heiko St=FCbner wrote:
> Instead of adding and deleting the gadget device in the start and sto=
p
> invocations. Use device_register in the probe method to initialize
> and add the gadget device and unregister it in the remove function.
>=20
> This also requires a release function for the gadget device.

Ouch.  This is a sure sign that your code is broken.  The lifetime of a
device structure is rather indeterminant, and modules should not contai=
n
release functions for these.

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/usb/gadget/s3c-hsudc.c |   27 ++++++++++++++++++---------
>  1 files changed, 18 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/s3c-hsudc.c b/drivers/usb/gadget/s3c-=
hsudc.c
> index 06ca8c4..fa2ae7a 100644
> --- a/drivers/usb/gadget/s3c-hsudc.c
> +++ b/drivers/usb/gadget/s3c-hsudc.c
> @@ -1156,11 +1156,6 @@ static int s3c_hsudc_start(struct usb_gadget_d=
river *driver,
>  	hsudc->driver =3D driver;
>  	hsudc->gadget.dev.driver =3D &driver->driver;
>  	hsudc->gadget.speed =3D USB_SPEED_UNKNOWN;
> -	ret =3D device_add(&hsudc->gadget.dev);
> -	if (ret) {
> -		dev_err(hsudc->dev, "failed to probe gadget device");
> -		return ret;
> -	}
> =20
>  	ret =3D bind(&hsudc->gadget);
>  	if (ret) {
> @@ -1180,8 +1175,6 @@ static int s3c_hsudc_start(struct usb_gadget_dr=
iver *driver,
>  					hsudc->gadget.name);
>  			driver->unbind(&hsudc->gadget);
> =20
> -			device_del(&hsudc->gadget.dev);
> -
>  			hsudc->driver =3D NULL;
>  			hsudc->gadget.dev.driver =3D NULL;
>  			return ret;
> @@ -1222,7 +1215,6 @@ static int s3c_hsudc_stop(struct usb_gadget_dri=
ver *driver)
>  		(void) otg_set_peripheral(hsudc->transceiver, NULL);
> =20
>  	driver->unbind(&hsudc->gadget);
> -	device_del(&hsudc->gadget.dev);
>  	disable_irq(hsudc->irq);
> =20
>  	dev_info(hsudc->dev, "unregistered gadget driver '%s'\n",
> @@ -1260,6 +1252,13 @@ static struct usb_gadget_ops s3c_hsudc_gadget_=
ops =3D {
>  	.vbus_draw	=3D s3c_hsudc_vbus_draw,
>  };
> =20
> +/* The gadget structure is stored inside the hsudc structure and wil=
l be
> + * released along with it. */
> +static void s3c_hsudc_gadget_release(struct device *dev)
> +{
> +	return;
> +}
> +
>  static int __devinit s3c_hsudc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -1307,7 +1306,6 @@ static int __devinit s3c_hsudc_probe(struct pla=
tform_device *pdev)
> =20
>  	spin_lock_init(&hsudc->lock);
> =20
> -	device_initialize(&hsudc->gadget.dev);
>  	dev_set_name(&hsudc->gadget.dev, "gadget");
> =20
>  	hsudc->gadget.max_speed =3D USB_SPEED_HIGH;
> @@ -1315,6 +1313,7 @@ static int __devinit s3c_hsudc_probe(struct pla=
tform_device *pdev)
>  	hsudc->gadget.name =3D dev_name(dev);
>  	hsudc->gadget.dev.parent =3D dev;
>  	hsudc->gadget.dev.dma_mask =3D dev->dma_mask;
> +	hsudc->gadget.dev.release =3D s3c_hsudc_gadget_release;
>  	hsudc->gadget.ep0 =3D &hsudc->ep[0].ep;
> =20
>  	hsudc->gadget.is_otg =3D 0;
> @@ -1348,12 +1347,20 @@ static int __devinit s3c_hsudc_probe(struct p=
latform_device *pdev)
>  	disable_irq(hsudc->irq);
>  	local_irq_enable();
> =20
> +	ret =3D device_register(&hsudc->gadget.dev);
> +	if (ret) {
> +		put_device(&hsudc->gadget.dev);
> +		goto err_add_device;
> +	}
> +
>  	ret =3D usb_add_gadget_udc(&pdev->dev, &hsudc->gadget);
>  	if (ret)
>  		goto err_add_udc;
> =20
>  	return 0;
>  err_add_udc:
> +	device_unregister(&hsudc->gadget.dev);
> +err_add_device:
>  	clk_disable(hsudc->uclk);
>  	clk_put(hsudc->uclk);
>  err_clk:
> @@ -1379,6 +1386,8 @@ static int __devexit s3c_hsudc_remove(struct pl=
atform_device *pdev)
> =20
>  	usb_del_gadget_udc(&hsudc->gadget);
> =20
> +	device_unregister(&hsudc->gadget.dev);
> +
>  	clk_disable(hsudc->uclk);
>  	clk_put(hsudc->uclk);
> =20
> --=20
> 1.7.2.3
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
