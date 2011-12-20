From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 5/8] s3c-hsudc: use udc_start and udc_stop functions
Date: Tue, 20 Dec 2011 13:23:19 +0200
Message-ID: <20111220112317.GF31842@legolas.emea.dhcp.ti.com>
References: <201112191938.22254.heiko@sntech.de>
 <201112191941.45881.heiko@sntech.de>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2FkSFaIQeDFoAt0B"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog126.obsmtp.com ([74.125.149.155]:58986 "EHLO
	na3sys009aog126.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751539Ab1LTLXc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Dec 2011 06:23:32 -0500
Content-Disposition: inline
In-Reply-To: <201112191941.45881.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>


--2FkSFaIQeDFoAt0B
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 19, 2011 at 07:41:45PM +0100, Heiko St=FCbner wrote:
> udc_start and udc_stop reduce code duplication in comparison to
> start and stop generalising calls done by all drivers
> (i.e. bind and unbind) and moving these calls to common code.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/usb/gadget/s3c-hsudc.c |   44 ++++++++++++----------------------=
-----
>  1 files changed, 14 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/s3c-hsudc.c b/drivers/usb/gadget/s3c-hsud=
c.c
> index 8792830..d17cbcf 100644
> --- a/drivers/usb/gadget/s3c-hsudc.c
> +++ b/drivers/usb/gadget/s3c-hsudc.c
> @@ -282,8 +282,7 @@ static void s3c_hsudc_nuke_ep(struct s3c_hsudc_ep *hs=
ep, int status)
>   * All the endpoints are stopped and any pending transfer requests if an=
y on
>   * the endpoint are terminated.
>   */
> -static void s3c_hsudc_stop_activity(struct s3c_hsudc *hsudc,
> -			  struct usb_gadget_driver *driver)
> +static void s3c_hsudc_stop_activity(struct s3c_hsudc *hsudc)
>  {
>  	struct s3c_hsudc_ep *hsep;
>  	int epnum;
> @@ -295,10 +294,6 @@ static void s3c_hsudc_stop_activity(struct s3c_hsudc=
 *hsudc,
>  		hsep->stopped =3D 1;
>  		s3c_hsudc_nuke_ep(hsep, -ESHUTDOWN);
>  	}
> -
> -	spin_unlock(&hsudc->lock);
> -	driver->disconnect(&hsudc->gadget);
> -	spin_lock(&hsudc->lock);
>  }
> =20
>  /**
> @@ -1135,16 +1130,15 @@ static irqreturn_t s3c_hsudc_irq(int irq, void *_=
dev)
>  	return IRQ_HANDLED;
>  }
> =20
> -static int s3c_hsudc_start(struct usb_gadget_driver *driver,
> -		int (*bind)(struct usb_gadget *))
> +static int s3c_hsudc_start(struct usb_gadget *gadget,
> +		struct usb_gadget_driver *driver)
>  {
>  	struct s3c_hsudc *hsudc =3D the_controller;

I remember commenting that this 'the_controller' global could be
dropped. I will add a patch to this series myself this time otherwise we
will not have time to get this in during 3.3 merge window, but next time
please make sure you fix all comments (or give reasons not to do so)
before sending another version.

--=20
balbi

--2FkSFaIQeDFoAt0B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO8HAlAAoJEIaOsuA1yqRElwYP/i6ZbXDvFgJLzEwXciXpYfMg
4i+2Er0uaoBkzmpqvEXRlF3WMxAT48xisZbXhczqQ2qOUtaGY4AgCtDethcnGvYz
6AEiK8yfeX8o6fZgCowiBNjaHpnd9K0bRM71UjpWvfWBSnpZxN2f9fEm9LFj0PNz
ahwq+Qpru04JOx+gF6EcgRtd8YAC3FRAmIv1g9bAUNBLOX/lmbr8QWd1lBuw1wF0
jrWqEnzJRnB2r1mttIYgsrmT82bwKiLCzmrpsNHaNGSgQkPK5ya7jFvB7ONR/DtG
zfezl2ADdH6xMZ8+DPuaIqxnUFoTvUbewAv0COW4wsfT056mn6w7iZ7rreMa4qRl
BynDHllbAO5ZYFAxM0LTlN9y4EWROOOoZjhBukvAsrOAlXqdbt/3Fx9S9BhqKsVs
ziPlZrjI9nLkju/s/JIegY+/bNuvgAljw09NTLXTLphGOrN4iDCZ0qMKGdq1l9n3
antNaly/cZTZWmQtPwOqH7EOzfnyFuaVut6rDLH1v81Peku+kwbYnZFIKBYvj8Qh
upup/VJ2wLN9sdONZHKphwxXVgcZ6r+JEEzc7TETp5BbCrrDGGlbwVbxYjehweIj
2FhNUN7ibopeU5ebZtmRjoZE4vcGt3J32VeR1ds8NHCdi2cIudpCSRhRqqXsTFk/
e1+r6lijoJV8foMebSdb
=kY7I
-----END PGP SIGNATURE-----

--2FkSFaIQeDFoAt0B--
