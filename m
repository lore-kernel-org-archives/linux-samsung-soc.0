From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/7] s3c-hsudc: add a remove function
Date: Sun, 18 Dec 2011 10:42:15 +0100
Message-ID: <201112181042.15550.heiko@sntech.de>
References: <201112172023.05519.heiko@sntech.de> <201112172026.34215.heiko@sntech.de> <20111218081048.GS14542@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:33312 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751335Ab1LRJm1 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Dec 2011 04:42:27 -0500
In-Reply-To: <20111218081048.GS14542@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Greg KH <greg@kroah.com>, Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org

Am Sonntag 18 Dezember 2011, 09:10:48 schrieb Russell King - ARM Linux:
> On Sat, Dec 17, 2011 at 08:26:33PM +0100, Heiko St=FCbner wrote:
> > As the driver is also buildable as a module it should need
> > a cleanup function for the removal of the module.
>=20
> My guess is that this wasn't implemented because of the embedded stru=
ct
> device lifetime rules for the gadget - to prevent the unbinding of th=
e
> driver.
>=20
> Until the struct device lifetime gets fixed, you must not allow the m=
odule
> nor the data structure containing the struct device to be freed.
so essentially, this patch and the release stuff in 5/7 must go.

Thanks for pointing out this problem.


> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  drivers/usb/gadget/s3c-hsudc.c |   25 +++++++++++++++++++++++++
> >  1 files changed, 25 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/drivers/usb/gadget/s3c-hsudc.c
> > b/drivers/usb/gadget/s3c-hsudc.c index 3e5673d..7cb0850 100644
> > --- a/drivers/usb/gadget/s3c-hsudc.c
> > +++ b/drivers/usb/gadget/s3c-hsudc.c
> >=20
> > @@ -1370,12 +1370,37 @@ err_res:
> >  	return ret;
> > =20
> >  }
> >=20
> > +static int __devexit s3c_hsudc_remove(struct platform_device *pdev=
)
> > +{
> > +	struct s3c_hsudc *hsudc =3D the_controller;
> > +
> > +	usb_del_gadget_udc(&hsudc->gadget);
> > +
> > +	clk_disable(hsudc->uclk);
> > +	clk_put(hsudc->uclk);
> > +
> > +	free_irq(hsudc->irq, hsudc);
> > +
> > +	iounmap(hsudc->regs);
> > +
> > +	release_resource(hsudc->mem_rsrc);
> > +	kfree(hsudc->mem_rsrc);
> > +
> > +	if (hsudc->transceiver)
> > +		otg_put_transceiver(hsudc->transceiver);
> > +
> > +	the_controller =3D NULL;
> > +	kfree(hsudc);
> > +	return 0;
> > +}
> > +
> >=20
> >  static struct platform_driver s3c_hsudc_driver =3D {
> > =20
> >  	.driver		=3D {
> >  =09
> >  		.owner	=3D THIS_MODULE,
> >  		.name	=3D "s3c-hsudc",
> >  =09
> >  	},
> >  	.probe		=3D s3c_hsudc_probe,
> >=20
> > +	.remove		=3D __devexit_p(s3c_hsudc_remove),
> >=20
> >  };
> > =20
> >  module_platform_driver(s3c_hsudc_driver);
