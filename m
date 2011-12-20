From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/8] s3c-hsudc: move platform_data struct to global header
Date: Tue, 20 Dec 2011 13:25:00 +0200
Message-ID: <20111220112458.GG31842@legolas.emea.dhcp.ti.com>
References: <201112191938.22254.heiko@sntech.de>
 <201112191939.16542.heiko@sntech.de>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wtrm9ATX0sn6fFKv"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201112191939.16542.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Ben Dooks' <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--Wtrm9ATX0sn6fFKv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 19, 2011 at 07:39:15PM +0100, Heiko St=FCbner wrote:
> Gadget drivers should be compilable on all architectures.
> This patch removes one dependency on architecture-specific code.
>=20
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  arch/arm/mach-s3c2416/mach-smdk2416.c    |    1 +
>  arch/arm/plat-samsung/devs.c             |    1 +
>  arch/arm/plat-samsung/include/plat/udc.h |   15 +------------

I would like to have ack from Ben and/or Kukjin before applying this
one. Ben are you ok with this patch ?

--=20
balbi

--Wtrm9ATX0sn6fFKv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO8HCKAAoJEIaOsuA1yqRELM0QAKWaVUwLAXRFIiKnwtDRzq93
K7XT5FQ3Bq7KgGjAshDbot46zykBmNqvZNBkYK5aGyGqpZ7a6N+Y660LAab3A7mC
2NSMCmu3jTN6Op91QZbGRaqjndIUJIRv2VYr/5f4wdgae7uiJUZvOBkFddckQDy1
QQ2Fxc1IhIHaNOaUMoZcSHD//ZNwvWA4V94wHZPdTviAYWc+KxeJqOZ421z8VHY9
ZEONKwG7ET7sRugaGxM/hmF4v74UpKFqPhGyxqwNwL3jLe6wROMtFKj2QBdTrYy+
Zm63LXg8F4AOp0IRYUqOt3OHpG3WkR5QM9wHVL7DjBkVY7Ak9/85XJ4leSq/O+3h
a9ZRnGdgDhjqu0Viacu98ZpjhQE5wyyWi82/o90EelxQ4vaoQ/fpXxI61kkVX0DO
98hvB8DZJ83ZyYg3reREnC2djb1h/8c5u+GsU4q0RwPtowh09x2MNWIxJ5Z7Cjk4
Wep96moplIyJ12uZVZbmolautYpc4fp9wN2cRCRp2mrJsZw2eqeb1aG9nviLkQ9e
A8Ys8XhwqnzmOVBPY+gm7Y+8h5SLfSkW2Q9lWExY27/GXuWN44V1/PFqsFDWHCK8
X/1J5XXDLd2oVkkImzv3JCH2IDBgKL8Uaqm+dpx1Gnj/000eMk5QQ5+LR584HA6U
090dcNUoZp0g43M7Sths
=ng64
-----END PGP SIGNATURE-----

--Wtrm9ATX0sn6fFKv--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
