From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/4] Adding usb2.0 host-phy support for exynos5250
Date: Wed, 31 Oct 2012 16:07:23 +0200
Message-ID: <20121031140723.GF10998@arwen.pp.htv.fi>
References: <1351518160-22369-1-git-send-email-gautam.vivek@samsung.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3UPJqPzJiScbNEd6"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1351518160-22369-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--3UPJqPzJiScbNEd6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 29, 2012 at 07:12:36PM +0530, Vivek Gautam wrote:
> This patchset is based on the work by Praveen Paneri for
> samsung-usbphy driver:
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/12653
>=20
> Changes from v2:
>  - Using "EXYNOS5_PHY_" as common prefix along with exact names for
>    PHY SFRs for register definitions
>  - Using register names with bit macros to make things more clear.
>  - Removed parentheses around 0x230 in definition for EXYNOS5_USB_CFG
>    in [patch 2/4 v2].
>=20
> Tested on smdk5250 target with usb-next branch along with arch patches
> for exynos5250:
> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13042
> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13048
>=20
> Vivek Gautam (4):
>   usb: phy: samsung: Add host phy support to samsung-phy driver
>   ARM: Exynos5250: Enabling samsung-usbphy driver
>   USB: ehci-s5p: Add phy driver support
>   USB: ohci-exynos: Add phy driver support

you should join forces with Praveen Paneri so you guys have a single PHY
code.

(I haven't fully read your patches, so apologize if what I'm saying is
already taken care of)

--=20
balbi

--3UPJqPzJiScbNEd6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQkTCbAAoJEIaOsuA1yqREM7IP/2IGLE/qpSvUt1XhHxho0b3r
Y83CtkVsYiUNRP29PvoULIxEt5AfEHgGvsuqmZgPKCSmDTCopYFq3N5hD/ZoFWHd
Yi8Q9LzVvb2/fY6bpwwE/7fQyUI5zvc2IyqJ9IxeTKI6OP0MWUE52/nsOkr7a9lu
ojOtuuQRQzWatkNOwhGRj6ScNNh3J+oIW3E8nmyiocYs/BCHqFOJzZTQcB9LwmDp
F1c5lGiKgAW4KL2+tO55nDUAKGElFLtaBQT1jIQCatKXPvZDCIriYU66NBNpK2zi
9w1jwjiLFKXwHoUWNi08gGBA978QzMd75FRhkrqj/6hGgRUZnYDhZ176sBFqZaBY
UEW93/trJXQ3il8Uak/WlANQX5sUraxP2L41lMUC+4iyH0nrJUK0UFojPAlj3M7/
x8fmVbU3vecJTJsVCursClaQEI9Ga36BxBE/Qx6gWKQHaHY5ucsYxQPnS/ITjzqw
ZZd43/nbkskrz2onNd5IXL2kTU4luN8a4wvz2xier8gfzEcvPbLi4eLM+7EtFzcg
ofC3KektqDe2+rJu/7vwzvWfRpO7YB+kZbfYJJn4aNDTCgJECpQy2SjTS9FehmFj
xxu7tTO2I6qFjWKX8wEf6VVkKIeiqN46XOfZr/dDLheEaol9UQA4X5g8qOao+jAz
dv4LyMmlGw/2Iq8Mi56K
=Ee8P
-----END PGP SIGNATURE-----

--3UPJqPzJiScbNEd6--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
