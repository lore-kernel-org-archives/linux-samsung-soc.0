From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH] usb: dwc2: Force 8bit UTMI width for Samsung Exynos SoCs
Date: Tue, 7 May 2019 10:12:17 +0200
Message-ID: <39c7b687-449e-5e89-4c70-527d4e779fd9@fivetechno.de>
References: <20190503204958.GA12532@kozik-lap>
 <CGME20190506130052eucas1p25afd4e15648e9efc6fd011e46081fbea@eucas1p2.samsung.com>
 <20190506130046.20898-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jaQbzrRu5YUNCCshYysHQXwri4Q0c42fX"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190506130046.20898-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jules Maselbas <jmaselbas@kalray.eu>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jaQbzrRu5YUNCCshYysHQXwri4Q0c42fX
Content-Type: multipart/mixed; boundary="SeKTbUyioFhKb6yGXBGhLlzIZWi9Rm3iK";
 protected-headers="v1"
From: Markus Reichl <m.reichl@fivetechno.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Minas Harutyunyan <hminas@synopsys.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jules Maselbas <jmaselbas@kalray.eu>, Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <39c7b687-449e-5e89-4c70-527d4e779fd9@fivetechno.de>
Subject: Re: [PATCH] usb: dwc2: Force 8bit UTMI width for Samsung Exynos SoCs
References: <20190503204958.GA12532@kozik-lap>
 <CGME20190506130052eucas1p25afd4e15648e9efc6fd011e46081fbea@eucas1p2.samsung.com>
 <20190506130046.20898-1-m.szyprowski@samsung.com>
In-Reply-To: <20190506130046.20898-1-m.szyprowski@samsung.com>

--SeKTbUyioFhKb6yGXBGhLlzIZWi9Rm3iK
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Hi Marek,

your patch did not help on stable v5.1

[    3.255963] samsung-usb2-phy 125b0000.exynos-usbphy: 125b0000.exynos-u=
sbphy supply vbus not found, using dummy regulator
[    4.044547] usbcore: registered new interface driver smsc95xx
[    4.112261] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.01
[    4.120363] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    4.127560] usb usb1: Product: EHCI Host Controller
[    4.132415] usb usb1: Manufacturer: Linux 5.1.0-00005-geb4efae48eb5 eh=
ci_hcd
[    4.139446] usb usb1: SerialNumber: 12580000.ehci
[    4.183056] usb3503 0-0008: switched to HUB mode
[    4.183121] usb3503 0-0008: usb3503_probe: probed in hub mode
[    4.488344] usb 1-2: new high-speed USB device number 2 using exynos-e=
hci
[    4.675605] usb 1-2: New USB device found, idVendor=3D0424, idProduct=3D=
3503, bcdDevice=3Da1.a0
[    4.678166] usb 1-2: New USB device strings: Mfr=3D0, Product=3D0, Ser=
ialNumber=3D0
[    4.686140] usb 1-2: skipping disabled interface 0

root@odroid-x2:~# lsusb
Bus 001 Device 002: ID 0424:3503 Standard Microsystems Corp.
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub



Am 06.05.19 um 15:00 schrieb Marek Szyprowski:
> Samsung Exynos SoCs require to force UTMI width to 8bit, otherwise the
> host side of the shared USB2 PHY doesn't work.
>=20
> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
> Fixes: 707d80f0a3c5 ("usb: dwc2: gadget: Replace phyif with phy_utmi_wi=
dth")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/params.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 6900eea57526..9ece4affb9d4 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -76,6 +76,7 @@ static void dwc2_set_s3c6400_params(struct dwc2_hsotg=
 *hsotg)
>  	struct dwc2_core_params *p =3D &hsotg->params;
> =20
>  	p->power_down =3D 0;
> +	p->phy_utmi_width =3D 8;
>  }
> =20
>  static void dwc2_set_rk_params(struct dwc2_hsotg *hsotg)
>=20

Gru=C3=9F,
--=20
Markus Reichl


--SeKTbUyioFhKb6yGXBGhLlzIZWi9Rm3iK--

--jaQbzrRu5YUNCCshYysHQXwri4Q0c42fX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCAAdFiEEVKeIeBh0ZWJOldzLOiXeDmsa/bIFAlzRPeYACgkQOiXeDmsa
/bJ4BAv/aFOkWeqjyJQlgtAY665B6v4yvYO7Xds4CECjPByYCSv1+0zc5MamdQGt
RcPsPqaGZ+HQ1E+3GIAsD2PtyKRst38iYr8JkYo3u/PEQXW+ZRMCQS9VNOQjcs2A
RnwEISl9BVmu/FcSRqL/7SrrTXZPF4+UwTziFu1PsCbx7pCaaLxfZF6zenTxaI3c
Lt4SofevaxV9ExdRLgvMhw/hk9FtzfAkQqWvAAYF5xreKTOlYi+xKvebIdJ66YUj
Otir2ZAEqfVxCLs1AFxvlNNLJ0IHqBNkiwJlPhP9oP9jyMymlTViGgC/Ar5LFA+O
a7BXnr+Cg7xJSHJuW13dyObnau9SDLrpk2OG+LWVXSPcfsuUpu0PwAhrSLvIjkgb
6rryONAA/JlDd463j1TkqSOG4LFk2slw6a/SM2dY9qW5CoYT4QFWtMzvRHKuy+BT
KFA9rg2mmKxP98DXi/9+/FEDL0ywrs1p1GDjH9/nsxGWB1r/P1BJIsdg/gMlbEaF
T+BPl3zG
=3jNv
-----END PGP SIGNATURE-----

--jaQbzrRu5YUNCCshYysHQXwri4Q0c42fX--
