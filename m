From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 7/9] usb: dwc2/gadget: use soft disconnect mode for
 implementing pullup control
Date: Thu, 16 Oct 2014 08:41:20 -0500
Message-ID: <20141016134120.GJ3480@saruman>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-8-git-send-email-m.szyprowski@samsung.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="72k7VsmfIboquFwl"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413464285-24172-8-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--72k7VsmfIboquFwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

your subject line is wrong. ->pullup() is already implemented, you're
moving unnecessary code from ->pullup() to other places.

On Thu, Oct 16, 2014 at 02:58:03PM +0200, Marek Szyprowski wrote:
> This patch moves PHY enable and disable calls from pullup method to
> udc_start/stop functions and adds calls to recently introduces soft
> disconnect mode in pullup method. This improves dwc2 gadget driver
> compatibility with gadget API requirements (now pullup method really
> forces soft disconnect mode instead of shutting down the whole hardware)
> and as a side effect also solves the issue related to limited caller
> context for PHY related functions (they cannot be called from
> non-sleeping context).

you're doing two things in one patch. See below

> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/usb/dwc2/gadget.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index d039334967d7..cdf417a7ae63 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2883,6 +2883,7 @@ static int s3c_hsotg_udc_start(struct usb_gadget *g=
adget,
>  			   struct usb_gadget_driver *driver)
>  {
>  	struct s3c_hsotg *hsotg =3D to_hsotg(gadget);
> +	unsigned long flags;
>  	int ret;
> =20
>  	if (!hsotg) {
> @@ -2919,7 +2920,15 @@ static int s3c_hsotg_udc_start(struct usb_gadget *=
gadget,
>  		goto err;
>  	}
> =20
> +	s3c_hsotg_phy_enable(hsotg);

you moved phy_enable to udc_start/udc_stop (one patch)

> +
> +	spin_lock_irqsave(&hsotg->lock, flags);
> +	s3c_hsotg_init(hsotg);
> +	s3c_hsotg_core_init_disconnected(hsotg);

you moved core init here (another patch).

> +	spin_unlock_irqrestore(&hsotg->lock, flags);
> +
>  	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
> +
>  	return 0;
> =20
>  err:
> @@ -2957,6 +2966,8 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *ga=
dget,
> =20
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> =20
> +	s3c_hsotg_phy_disable(hsotg);
> +
>  	regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
> =20
>  	clk_disable(hsotg->clk);
> @@ -2990,14 +3001,13 @@ static int s3c_hsotg_pullup(struct usb_gadget *ga=
dget, int is_on)
>  	dev_dbg(hsotg->dev, "%s: is_on: %d\n", __func__, is_on);
> =20
>  	spin_lock_irqsave(&hsotg->lock, flags);
> +
>  	if (is_on) {
> -		s3c_hsotg_phy_enable(hsotg);
>  		clk_enable(hsotg->clk);
> -		s3c_hsotg_core_init_disconnected(hsotg);
>  		s3c_hsotg_core_connect(hsotg);
>  	} else {
> +		s3c_hsotg_core_disconnect(hsotg);
>  		clk_disable(hsotg->clk);
> -		s3c_hsotg_phy_disable(hsotg);
>  	}
> =20
>  	hsotg->gadget.speed =3D USB_SPEED_UNKNOWN;
> --=20
> 1.9.2
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
balbi

--72k7VsmfIboquFwl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUP8r/AAoJEIaOsuA1yqREpgUP/2gUj1nFwbWUC2h0eFLTMym5
3aczk8cI9OII6YMnqYQ3IpeEhkxoXV0nzBrNYCfEb0CFlaDvLBnSxs8YoLBy87vu
tSGh1sgf/IXmownhz/HxUc5qX12LgvAGhXOP+UhgPswCLWfXpYvRAQb2jYf6IPvd
G0AL6Afa/Mj/q3480chjVBt/nVJC3fl15WK7jVul/g7s2/ZK43IxwCV/Mh9GU0TP
YNATk8XBGfL6xEWV5cEpVjGb/rVn3EVLwpSBvI/1YWoGdLkyw8G6YbEPAKUYisyw
o4+ZiD9GA+pECUooO3KIqtxmwDAoeVMv5VqdbjdiCVMiklwmkUKJUBZdQEQhys4Y
TuTwGSOI1iGS0QaYJE8npNjOtKKz4SigB0L+Pop+0vgCu6yOaOIoG44m6AoN3V5T
LQASWvUIescJ0XA5ANBmHUwITPB5DmvtIfZaBM8pqNkx9iTvzU0ETkmPpOHCGBfR
/bSMjo9aKF17tURdT8LxVGGtKi3vTORabR9J/czDmpqb0VnHbAAfzbUSvmJMZrOp
GzEO5fY5BmSk1sP1P1XBGkjJACXba0Us8yNjG7cS3B5g2Tof157ozdxUe+gA7vgs
DHwTrVjzCx8A9W54V2MXvHDEX+4H6WuTUF9L2VHH+oOy1LwqPL7691Z8wAakdbgg
f5qD5J52M5XOF5AuhyLx
=TlHu
-----END PGP SIGNATURE-----

--72k7VsmfIboquFwl--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
