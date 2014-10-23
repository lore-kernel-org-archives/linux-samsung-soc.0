From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 04/10] usb: dwc2/gadget: disable phy before turning
 off power regulators
Date: Thu, 23 Oct 2014 10:01:16 -0500
Message-ID: <20141023150116.GH13573@saruman>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-5-git-send-email-m.szyprowski@samsung.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CEUtFxTsmBsHRLs3"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413801940-31086-5-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--CEUtFxTsmBsHRLs3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2014 at 12:45:34PM +0200, Marek Szyprowski wrote:
> This patch fixes probe function to match the pattern used elsewhere in
> the driver, where power regulators are turned off as the last element in
> the device shutdown procedure.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Paul, can I have your Acked-by here so I can send this to v3.18-rc1 ?

--=20
balbi

--CEUtFxTsmBsHRLs3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUSRg8AAoJEIaOsuA1yqREvNEP/14c0qatv9CTdNG3vZplWEvL
ta9TS1bNqejTxzXBOYY9Q7FGcXh4LZ4ZDeoMJdqqVJwxndqQZX0hxAXIYrA/bSBy
G/3ACSeN0k+cyL6VK2inRirckY3rocbZhZwWKNyB32TfUsPI6rVzh176rsNJgMqB
wvue0IplHeTUUKX3ZVELMxVBVbK1iGe+d8gyU1a0K9EBTXX1iMXtDDJz6ySVxlVL
/riV6oJsQtYyFRcHk5vEuXdE7yQbyOVEtbYuf/sYNub4Wqy3kF81sBJCCft5c8oM
aV8QikRVNPW3c+okj8akufQfIfEEFsgwbW4CRaR4PA1PpKGKNq/Aaa2JoR6qwE2u
FkQ1oMOCSy/5OtlzycS5IslXSM5K1U5AKsl0PDBH6COcvyy7Pq30Tu+jxSX1RRWm
XqI+iaGLMKU8U+fD0/PCPR3/z6R5rFv6cJLwUIQKP8Yd9tWdHKWZZFReKVSObKb7
WFbnEs+ETIUgBbo8iBYjoaFe0070/Nt9R486jrSxLs2Tbm9tQEOgD0J6CKJNor24
i/b142MpcyNOcAnhHd8FRi4afzG98QSy0hIvugW2hd80WOuf1DhGNF+S/uoD92V8
uHTkJoiVunX7Ui6UJfC6E++o6wDRrQVcW31ym3d9o3btkI9ZXrSIuS2cLu9EIdYm
2cd0D7rnwvfLfaRr8nCG
=VBNr
-----END PGP SIGNATURE-----

--CEUtFxTsmBsHRLs3--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
