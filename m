From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 5/7] s3c-hsudc: use udc_start and udc_stop functions
Date: Mon, 19 Dec 2011 15:32:05 +0200
Message-ID: <20111219133203.GG3146@legolas.emea.dhcp.ti.com>
References: <201112191423.21461.heiko@sntech.de>
 <201112191426.20365.heiko@sntech.de>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b/6gol1SqNxk8K3i"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201112191426.20365.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Ben Dooks' <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--b/6gol1SqNxk8K3i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2011 at 02:26:20PM +0100, Heiko St=FCbner wrote:
> udc_start and udc_stop reduce code duplication in comparison to
> start and stop generalising calls done by all drivers
> (i.e. bind and unbind) and moving these calls to common code.
>=20
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  drivers/usb/gadget/s3c-hsudc.c |   44 ++++++++++++----------------------=
-----
>  1 files changed, 14 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/s3c-hsudc.c b/drivers/usb/gadget/s3c-hsud=
c.c
> index 42bcd97..daaccec 100644
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
> +static int s3c_hsudc_start(struct usb_gadget *g,
> +		struct usb_gadget_driver *driver)
>  {
>  	struct s3c_hsudc *hsudc =3D the_controller;

while at that, you can drop this "the_controller" global. You could use
a container_of() to reach your s3c_hsudc pointer.

--=20
balbi

--b/6gol1SqNxk8K3i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO7zzTAAoJEIaOsuA1yqREcf0P/2hOH5P44mg+ceMd0qXYqIOD
JIxtKW8PA+9SpdGwnD+9ZTVAjCVoqeFAVHcyoTxm6DUr6qzj1xC7SBYJ2AnTp/mw
FUfQIz4QWw0YudLZR5ZUWmvbCcxI8g3vLNnDo8EYh39JmYepGAD9Q+6MuopPwSJn
8fxbM9Snd8lm75unSUMsdVmqWdI5fRyJbjt+dbct+yyq4Ai3AqLfJdhlXs/0RiIZ
dfl3cc9sv3bV9HqZ2hlb9VEjoLs8roQLRLdGxQnisIMwVI9poTzpBDHF/aoAT/uS
LwFt2apGj/Ksyey34+7lunZkuS4hLZGO7EgQBxooHO7apz6ihIdKwnnSuQv3TIUV
HDnZZm8tJeN/Mi/T14hPY81xruC42XKSoKOtNDRrDl0XMs3QzTFQkLKOrP6+YzO/
KbMLGo5x0t+y1kbifWbzf/X5Kp0R4cWxpcRaG0l3merC2TAL4YFWiL/AH2p+A8T4
scilQ3I0GadCXgujC2THZbnp9zwmd9m7oWupig8AlUWVGAzrvPJq0zyzNXNFTAAy
X5DgnHvc5z/K1GKQ6fiWWF6kON/iPML+Qvq+zVaVuQOHjeqFBkKse3gmNoje2RSZ
pHM05tyoLTzlngHF0x+qsOSLygZTD3+osIYOywA5cu+qbWvbolh51YJRYefsLVFl
Cp+MTwS7LpfxTTjVri4u
=UNaq
-----END PGP SIGNATURE-----

--b/6gol1SqNxk8K3i--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
