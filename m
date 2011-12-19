From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/7] s3c-hsudc: move platform_data struct to global header
Date: Mon, 19 Dec 2011 15:29:24 +0200
Message-ID: <20111219132923.GE3146@legolas.emea.dhcp.ti.com>
References: <201112191423.21461.heiko@sntech.de>
 <201112191424.24502.heiko@sntech.de>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bfHXWC0AWsk5KHuB"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog103.obsmtp.com ([74.125.149.71]:44673 "EHLO
	na3sys009aog103.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752478Ab1LSN3a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Dec 2011 08:29:30 -0500
Content-Disposition: inline
In-Reply-To: <201112191424.24502.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>


--bfHXWC0AWsk5KHuB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 19, 2011 at 02:24:24PM +0100, Heiko St=FCbner wrote:
> diff --git a/include/linux/usb/s3c-hsudc.h b/include/linux/usb/s3c-hsudc.h
> new file mode 100644
> index 0000000..6fa1093
> --- /dev/null
> +++ b/include/linux/usb/s3c-hsudc.h
> @@ -0,0 +1,34 @@
> +/*
> + * S3C24XX USB 2.0 High-speed USB controller gadget driver
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * The S3C24XX USB 2.0 high-speed USB controller supports upto 9 endpoin=
ts.
> + * Each endpoint can be configured as either in or out endpoint. Endpoin=
ts
> + * can be configured for Bulk or Interrupt transfer mode.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __LINUX_USB_S3C_HSUDC_H
> +#define __LINUX_USB_S3C_HSUDC_H
> +
> +/**
> + * s3c24xx_hsudc_platdata - Platform data for USB High-Speed gadget cont=
roller.
> + * @epnum: Number of endpoints to be instantiated by the controller driv=
er.
> + * @gpio_init: Platform specific USB related GPIO initialization.
> + * @gpio_uninit: Platform specific USB releted GPIO uninitialzation.
> + *
> + * Representation of platform data for the S3C24XX USB 2.0 High Speed ga=
dget
> + * controllers.
> + */
> +struct s3c24xx_hsudc_platdata {
> +	unsigned int	epnum;
> +	void		(*gpio_init)(void);
> +	void		(*gpio_uninit)(void);
> +};
> +
> +#endif	/* __LINUX_USB_S3C_HSUDC_H */

this holds platform_data only, how about
<linux/platform_data/s3c-hsudc.h> ??

other than that, it looks good.

--=20
balbi

--bfHXWC0AWsk5KHuB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO7zwzAAoJEIaOsuA1yqREP4UP/0YFCNtpvKZduH3MIFjy1/fz
bzAwu0Cb6r8/pJ1JmtrAmRnRCMgirgjA4ipynywUCEbd5Yyglz1QFutyQigSPvyw
eLSzPaDihG1Zq2ZLFA3DJoZH+6vG/HBFg4X8EjbYK3Riz19Xo1gHublHf/EjxGH2
o6+dHXqeXU09hKLoHz+KH8CRC5r3qLl/mk4C0A97OP6Z6QFzhbfjJf6YqeBNSPyD
tBcs3+LvSYxJcvyJuBZjZ/vapET8I2yoOKz2UEzZ+1+6A3EqwrJgPXWPYS97T/qT
qmdPV5NB7DfuyN981YiN/9+BP2c/8iZ6n8GrlUQCspgPP2xg4Ldw95IifPbxSnAY
AWpViGfuvSNXUwG16X8aOvcdrZqhGk1wZ09/t7slT/a0aX6pPhBRMVLbVs02DDsW
qwMJTEEWmaSImgFsCxNmB+d4+nXq+1ifPvpeGuEpxXwzv1ZJPI4TyypzJfj1Vcu+
yfe39W3FRvVrTLzhDAdX94x6SK/i5dr78YpwqcPfWUQyPIo743Qpd2OypGdqHedC
dA0UuJF/C94GTp0fnKSEVaHRX/eTcw7fT8W1dDeEfFrPFInECI4LTsps3/g2qbiL
V6iRfEqHATNOu1iSUuFRQJAaXU6rSMoB19jHEt9kEruoDAiZF2DNany5/ZTW9A8i
nGm04ONN3ukjgGe7K+4X
=eqPJ
-----END PGP SIGNATURE-----

--bfHXWC0AWsk5KHuB--
