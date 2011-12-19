From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/7] s3c-hsudc: add __devinit to probe function
Date: Mon, 19 Dec 2011 15:29:57 +0200
Message-ID: <20111219132956.GF3146@legolas.emea.dhcp.ti.com>
References: <201112191423.21461.heiko@sntech.de>
 <201112191424.58081.heiko@sntech.de>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C4ZO9l7mQWyMv5+Y"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201112191424.58081.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Ben Dooks' <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--C4ZO9l7mQWyMv5+Y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2011 at 02:24:57PM +0100, Heiko St=FCbner wrote:

I need a commit log, even if it's an obvious one. Sorry for the
nit-picking.

> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  drivers/usb/gadget/s3c-hsudc.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/s3c-hsudc.c b/drivers/usb/gadget/s3c-hsud=
c.c
> index 4c1abb1..3e5673d 100644
> --- a/drivers/usb/gadget/s3c-hsudc.c
> +++ b/drivers/usb/gadget/s3c-hsudc.c
> @@ -1260,7 +1260,7 @@ static struct usb_gadget_ops s3c_hsudc_gadget_ops =
=3D {
>  	.vbus_draw	=3D s3c_hsudc_vbus_draw,
>  };
> =20
> -static int s3c_hsudc_probe(struct platform_device *pdev)
> +static int __devinit s3c_hsudc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct resource *res;
> --=20
> 1.7.5.4
>=20

--=20
balbi

--C4ZO9l7mQWyMv5+Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO7zxUAAoJEIaOsuA1yqREOwYQAJyZdFzOu36k+AKSue8F7JhW
i7jGLyuUoSrHhb5oS7FUXzG08/SNoLbSbGPvPNia8EtlE8hbFclo10ywpy3RARf5
jCtmIbIA0Ow1AD/JGJKPA7yEv+Ig5yRuodgtk1ZNRm/8VDp3V+44w0YK7IIjWPdk
13Yg80sEK6w6kdo1/BtNH2Kwl3wdluMOYxb+HXJJBylgz917l2iRKUBZs0Rzs1w3
IA0Aoi3TBdarY2SzfnHii9J1SZHD404PDluoeOPfe/JJHNTZCodOOxO9IvfQdOsQ
TYatvwYrj87FGhwnSWJd11iKUCKPNvmOBjslat7VjOdj5xELIKhgtQa+vdo3hCsw
i8+uifdXq91X4DBoKhsuPALXuEK7yc/xYyuvu0GKTwicKvpciuDQaVRhO2H+Z7/V
JnFUjvPuDWyJE6cD0PSwmSKCChx90712+hTbHs3iXB1wakAN7NPvIbof/AaErlJP
CL/ca+mZBsFXR836uXQaW6BPasOQiQS2tsSpkhdjQ7RvLygJL+kRJNZrT8n+uMPf
0OetZYTTmwwx0secZm6uXJpbIaocXFVwuI4KD5/uHMDGQ9hgRVl0O4yIy26EJbq0
GJ6DGNMsVeXVMSKbRIN9ywwUOvrT+H0H9Ljvh7kIxxjl46zsFuYzDsd/82WopeoS
pw2sDphaxa3Pq1Pm7mhg
=TU8T
-----END PGP SIGNATURE-----

--C4ZO9l7mQWyMv5+Y--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
