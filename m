From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 6/9] usb: dwc2/gadget: decouple setting soft disconnect
 from s3c_hsotg_core_init
Date: Thu, 16 Oct 2014 08:38:26 -0500
Message-ID: <20141016133826.GI3480@saruman>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-7-git-send-email-m.szyprowski@samsung.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hABqaeELJqnDDeDE"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413464285-24172-7-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--hABqaeELJqnDDeDE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2014 at 02:58:02PM +0200, Marek Szyprowski wrote:
> This patch changes s3c_hsotg_core_init function to leave hardware in
> soft disconnect mode, so the actual moment of coupling the hardware to
> the usb bus can be later controlled by the driver in the more accurate

what is this "more accurate way" you talk about ? Why is it more
accurate ? Perhaps you have failed some USB Certification test ? Which
test id was that ? Why did it fail ? and why does this patch solve the
issue ?

> way. For this purpose, separate functions for enabling and disabling
> soft disconnect mode have been added.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/usb/dwc2/gadget.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 1ba0682fb252..d039334967d7 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2124,7 +2124,7 @@ static int s3c_hsotg_corereset(struct s3c_hsotg *hs=
otg)
>   *
>   * Issue a soft reset to the core, and await the core finishing it.
>   */
> -static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
> +static void s3c_hsotg_core_init_disconnected(struct s3c_hsotg *hsotg)
>  {
>  	s3c_hsotg_corereset(hsotg);
> =20
> @@ -2241,14 +2241,23 @@ static void s3c_hsotg_core_init(struct s3c_hsotg =
*hsotg)
>  		readl(hsotg->regs + DOEPCTL0));
> =20
>  	/* clear global NAKs */
> -	writel(DCTL_CGOUTNAK | DCTL_CGNPINNAK,
> +	writel(DCTL_CGOUTNAK | DCTL_CGNPINNAK | DCTL_SFTDISCON,
>  	       hsotg->regs + DCTL);
> =20
>  	/* must be at-least 3ms to allow bus to see disconnect */
>  	mdelay(3);
> =20
>  	hsotg->last_rst =3D jiffies;
> +}
> +
> +static void s3c_hsotg_core_disconnect(struct s3c_hsotg *hsotg)
> +{
> +	/* set the soft-disconnect bit */
> +	__orr32(hsotg->regs + DCTL, DCTL_SFTDISCON);
> +}
> =20
> +static void s3c_hsotg_core_connect(struct s3c_hsotg *hsotg)
> +{
>  	/* remove the soft-disconnect and let's go */
>  	__bic32(hsotg->regs + DCTL, DCTL_SFTDISCON);
>  }
> @@ -2348,7 +2357,8 @@ irq_retry:
>  				kill_all_requests(hsotg, &hsotg->eps[0],
>  							  -ECONNRESET, true);
> =20
> -				s3c_hsotg_core_init(hsotg);
> +				s3c_hsotg_core_init_disconnected(hsotg);
> +				s3c_hsotg_core_connect(hsotg);
>  			}
>  		}
>  	}
> @@ -2983,7 +2993,8 @@ static int s3c_hsotg_pullup(struct usb_gadget *gadg=
et, int is_on)
>  	if (is_on) {
>  		s3c_hsotg_phy_enable(hsotg);
>  		clk_enable(hsotg->clk);
> -		s3c_hsotg_core_init(hsotg);
> +		s3c_hsotg_core_init_disconnected(hsotg);
> +		s3c_hsotg_core_connect(hsotg);
>  	} else {
>  		clk_disable(hsotg->clk);
>  		s3c_hsotg_phy_disable(hsotg);
> @@ -3670,7 +3681,8 @@ static int s3c_hsotg_resume(struct platform_device =
*pdev)
> =20
>  	spin_lock_irqsave(&hsotg->lock, flags);
>  	s3c_hsotg_phy_enable(hsotg);
> -	s3c_hsotg_core_init(hsotg);
> +	s3c_hsotg_core_init_disconnect(hsotg);
> +	s3c_hsotg_core_connect(hsotg);
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> =20
>  	return ret;
> --=20
> 1.9.2
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
balbi

--hABqaeELJqnDDeDE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUP8pSAAoJEIaOsuA1yqRE9/oP/Al7LkY9GzHN72tngd4Ik23G
c9j2lJgvpr6S8C2cKErpmkdTnbdeMiQK3ChqT90V0/WIdkzS3JJdQdrrwecfRMwS
0eUG1hr+1SBdne/KTQitEBI4B1iNZ8H3bOCbnfPgSzDhaaEfUkpQs+TeJYSY1gmA
KugKTHZcyjriS4bhCH2JHQAHzr5IOeSXoGq5VLjCiRnbH6GojwNYbU/nyk6gG/Zw
oTfpU59z6ztvElf/x6cBYdTnuA1dIG4CdipwOSUrMuado62crFSd29Rm5XWq/BTW
1As+jpkE8ajvHhcTjo/osAmIhMoOiePl+Ch2PXp8F1xabfQzsunFsUbxFqWZaoC+
L9hpNPk9xi2MelgseGpkaw71zGNr21kJf5kR1vPzfc7duCLJRt4fyLeNMi5zJMCx
ohyzYaX8Kpd0MuUJjyD5mPUlK3/976s2UaIlyHUeFpQzzB/C+sQwQbnjh0zC/W9k
IcbmyX4rf88M9IJEZuSyvW7a6uUXQHdwmWjyWcuX9C81NE/+5iT4UVYs5Wgscr+R
Cq5c4YPvULD8pbjOhRRDxiebVBbK6Kr8tYt5ojThgbL5vimpq86+IPeryiZ4tHN/
kR1tGOBA+DQ0thzoaaPaMkW5sM99UDAoitXk54XbS2b4bO+UGpkPauzXmn6VCAoX
eatfMB/6rqf+MmAExmbq
=2g6/
-----END PGP SIGNATURE-----

--hABqaeELJqnDDeDE--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
