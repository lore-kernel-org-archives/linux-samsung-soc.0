From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: Exynos5250: Enabling samsung usb phy
Date: Fri, 18 Jan 2013 15:10:13 +0200
Message-ID: <20130118131013.GG4672@arwen.pp.htv.fi>
References: <1355845182-14104-1-git-send-email-gautam.vivek@samsung.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4199437735349179049=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355845182-14104-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============4199437735349179049==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PyMzGVE0NRonI6bs"
Content-Disposition: inline

--PyMzGVE0NRonI6bs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 18, 2012 at 09:09:40PM +0530, Vivek Gautam wrote:
> This patch-set enables the samsung-usbphy driver on exynos5250,
> which enables the support for USB2 type and USB3 type phys.
> The corresponding phy driver patches are available at:
>  1) https://lkml.org/lkml/2012/12/18/201
>  2) https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-December/0=
24559.html
>=20
> Tested this patch-set on exynos5250 with following patch-sets for
> USB 2.0 and USB 3.0:
>  - https://patchwork.kernel.org/patch/1794651/
>  - https://lkml.org/lkml/2012/12/18/201
>  - https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-December/02=
4559.html
>  - http://comments.gmane.org/gmane.linux.usb.general/76352
>  - https://lkml.org/lkml/2012/12/13/492
>=20
> Vivek Gautam (2):
>   ARM: Exynos5250: Enabling samsung-usbphy driver
>   ARM: Exynos5250: Enabling USB 3.0 phy for samsung-usbphy driver

What should I do with this series ? Is it ready to apply ? If it is,
then please resend with Kukjim's Acked-by.

cheers

--=20
balbi

--PyMzGVE0NRonI6bs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ+Um1AAoJEIaOsuA1yqRE9D4P/jM87o9sF5BhHZ1wW05XWkPf
Ogounha5VfOsBV7nAkGrK9r8kXFzrg3onbJ6S2O9Oqa9F/PEJH60ixjghBXTja9n
cursCGf4KlhoxFJ1pWA2TGjyjjMa2XoUFtN8M5RQOX7Ryx9jN1d7ETivDuwdcvdD
OFewjYFSUajnNfNZJIzIGXUUJ2xGkirwXi3HGd3anITWxooT4IoSeU2i8bLMK0vG
ypBWouEi8MJZliEVnyoNOWYpnZODrPUWxWZEsRB/DEemFdj3g56EN8o2DkRdXl9f
gzx2/bWOH/tAz/mDVMoqf6u0IaLusMByONaeE7zOj34UykvdePRO1VDDzLnozp5F
+YC/ItRXHmEAWQBIiHQdjZyAqRLsRr5JS97aIzJpGg2rnaZ5jWeUp411QxMurEZe
h6ppnocvv0IHhHn2j6gG7YyOykQdRfHND4gpCMyJVjE+N/R7tWWSrVii6IDEwIox
EYtktmpV0yaFYORJQeQy4RcJ7SoUltdAqONmfcByX0Ausq35pWynnLYEubceX2rG
9pyVSaDZbyJYFv4igWs4LkLW+aNYIkX2Dj0YhpG7UAMBlRmXqAKpnaPuybRW+lcM
5UcYCRByDcT2oD5N0eYEmTEABwCD6S8yrgGLWoPsfzdO9TQw9LE5gON2sncCxk0t
q1CGkpg56EUi6+6pNtdq
=sxUC
-----END PGP SIGNATURE-----

--PyMzGVE0NRonI6bs--

--===============4199437735349179049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4199437735349179049==--
