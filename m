From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] s3c-hsudc: Use helper functions instead of generic
 container_of
Date: Tue, 24 Jan 2012 11:36:51 +0200
Message-ID: <20120124093650.GR27414@legolas.emea.dhcp.ti.com>
References: <201201082156.44142.heiko@sntech.de>
 <201201082157.55898.heiko@sntech.de>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b0op/nKJ9CeIhp9z"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201201082157.55898.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, 'Ben Dooks' <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--b0op/nKJ9CeIhp9z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 08, 2012 at 09:57:55PM +0100, Heiko St=FCbner wrote:
> The helper functions were definied but never used until now.
>=20
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

applied, thanks

--=20
balbi

--b0op/nKJ9CeIhp9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPHnuyAAoJEIaOsuA1yqRE9XEP/1pzk+V2ZMRleFMSD7PfV0DH
e/S2+GBScLdWPiiENkw0+LNpqrPEwTloK307tQNXECOWZOaVsjsiGAVm989Ywfb6
tX/YEv94DaJRxivCS0rfPOjhE/xkr1QfvVXaE65ptMW6SF1/wMNW9YEZDwWQBJC5
/bRAO5TkPLUZS2CZk2s0L2HOnVbwc0dSyCSl9KwqshvMnd0qRu6BFlewzBKqpU29
YyFAgX7Lq7UUNIbSCqcnFIcxd2mV3VxrMHcAwRmI9TEfPMixnwl5kpXRMG6ENUQq
hLCyUyghWg85MKFnE1XmuMa5X9twZtm8IwtANuqarrU02nJ4BR2H9eLCJ8BfMv9p
zChVruZezU0UTuAJ1vOCNVqu0iI0R/q3UcSrCQHIFc6My+Ffx67K5PvJGtkZ2Azb
hbUHCOE4yRj/xh/4g19u58zGO9x4XacXWea1YGY1w2xv35SpF3enX9hq9UpeqMVk
sl+n4TyoZJ4+gLjvsBKx7SGXyJVVGkXlcioVayAQ8Sj4PKszKGsxWrSVx4eyhq5p
yExqiP4HeXNH9y65/zAA4aHNXzQwxcA/OnrucIa3o7URKOqEOTEThPJh1viYKH4b
2Ep6W8MnIKpY2/baTQw8NOos5kR6jJJK1yhfyKRyhC+uEp68Wl3wmki+mkIafMXF
wQsCe5YCyX30ghgPkQ2J
=m/A7
-----END PGP SIGNATURE-----

--b0op/nKJ9CeIhp9z--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
