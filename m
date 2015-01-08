From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/5] regulator: Allow parsing custom DT properties
 with simplified DT parse
Date: Thu, 8 Jan 2015 20:16:36 +0000
Message-ID: <20150108201636.GE2634@sirena.org.uk>
References: <1420458525-22576-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JLqpAN9gGHZowk+m"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420458525-22576-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--JLqpAN9gGHZowk+m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2015 at 12:48:40PM +0100, Krzysztof Kozlowski wrote:
> Hi,
>=20
>=20
> The patchset adds:
> 1. a way of parsing custom DT properties by the driver when simplified
>    DT parsing method is used,
> 2. GPIO enable control to the max77686 driver.

Applied 1-4, thanks.

--JLqpAN9gGHZowk+m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUruWjAAoJECTWi3JdVIfQd/IH/RuLGU10FeNFRf6CWJoXQ5go
BjTGJl4L5OnKyWv0WSpO8UmBl22y1Q11SoTBLGzxKpkDEZXtRiA9kZLEVugTjHXW
AJauBic/edRCVOZX5PbrUBkS416zcgGBxALk2TthUVydXcKhCwUJTLrKgxDQZlsk
+fNG8/5UpuwHyR2dhOrCdpPVTXG8An6KofE6c0X6l591vwzR2oVZ/ntVQw2xqP3q
T0tmzfTjdmc1vlhZbenSsWWmCxbm3fBCavofeYr5LVm3/EPC4qHmbrMnzw1NElnr
8jT6PDvIGEh07b6LCb4EVN7Ens6jNT2FoH0HzDKOYIJZDju/ToA9/kRWJf/Ppm4=
=K8HL
-----END PGP SIGNATURE-----

--JLqpAN9gGHZowk+m--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
