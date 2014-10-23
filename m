From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 03/10] usb: dwc2/gadget: fix gadget unregistration in
 udc_stop() function
Date: Thu, 23 Oct 2014 13:56:09 -0500
Message-ID: <20141023185609.GE21407@saruman>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-4-git-send-email-m.szyprowski@samsung.com>
 <20141023150132.GI13573@saruman>
 <A2CA0424C0A6F04399FB9E1CD98E0304844E5483@US01WEMBX2.internal.synopsys.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <A2CA0424C0A6F04399FB9E1CD98E0304844E5483-Yu2iAY70zvrYN67daEjeMPufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2014 at 06:18:51PM +0000, Paul Zimmerman wrote:
> > From: Felipe Balbi [mailto:balbi-l0cyMroinI0@public.gmane.org]
> > Sent: Thursday, October 23, 2014 8:02 AM
> >=20
> > On Mon, Oct 20, 2014 at 12:45:33PM +0200, Marek Szyprowski wrote:
> > > udc_stop() should clear ->driver pointer unconditionally to let the U=
DC
> > > framework to work correctly with both registering/unregistering gadge=
ts
> > > and enabling/disabling gadgets by writing to
> > > /sys/class/udc/*hsotg/soft_connect interface.
> > >
> > > Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >=20
> > Also here. In fact, this is much more important :-)
>=20
> Acked-by: Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>=20
> Are there any more patches in this series that need immediate attention?
> Otherwise I plan to finish reviewing the series on Friday or so.

no, this is the most important one. Everything else can wait until
Friday, thanks.

--=20
balbi

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUSU9JAAoJEIaOsuA1yqREt5cP/0i4vVaxH1Ky3n5GqAoiQO57
GnYWIhTcPo/DJ8sCEfC/uPSweFgx9zlEXUNHcVIe2pLpb5MNwec1xYvpsOmRt2t+
K1qWLrrEWJxFlILVt2ure4XzwEevLvSncFs2CLXxxjyBmYCRSWladd3geupIcXEm
jiReUUX6vqcUAHUb0kQowziKS8mWi7GarEzy+GrZngaNt8/mVsQVmi3/j+LVfxuV
LqCrOlfL7Nx1F0LOBMnzDeR/Y7SJ0OyevHxIJSahaTY6H0k98/mN7z+u8L3AVuP8
wG6JdKnus1iAUc+qEgxN44FSElyu+OEKg3qMfuTEJ6M7SBEluN1rVsYs8RvMpdGB
oyzsLhYLhldHu/MCqL1W8suP25HDnvfdX50mVjHQ8gPz85JRI8GDSEYELHU1Zp+U
T0fZrQuyH+NF5DslGLLue8oqzKD2tYzWlFDX3bsptY0sGqKf24Ds2JedP235Cl6k
XNid3dopCe/FDuNMhJdLxG2/+i0wd2BoJxQx7lol/kcG2wqLATFd7YsC6aHy/2YQ
J5loLZZS33bzqcnZrDn49IA6vriPGxbuyjEYr6amNQFVGf+Lutcp73qIGWGNNIJJ
4f61E3RQA+mvyZfV6KkXWb+LV7oMF2uIfNwg5Nl0jQlxJoFiHmJbFDsmoLeCLchZ
zdYJGty95RCAgVg/Tq6O
=Ev//
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
