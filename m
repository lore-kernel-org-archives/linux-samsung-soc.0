From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH] usb: dwc2: Force 8bit UTMI width for Samsung Exynos SoCs
Date: Tue, 7 May 2019 14:38:01 +0200
Message-ID: <e5ded84a-a6a2-f998-f6d8-5af7c7b432e2@fivetechno.de>
References: <20190503204958.GA12532@kozik-lap>
 <CGME20190506130052eucas1p25afd4e15648e9efc6fd011e46081fbea@eucas1p2.samsung.com>
 <20190506130046.20898-1-m.szyprowski@samsung.com>
 <39c7b687-449e-5e89-4c70-527d4e779fd9@fivetechno.de>
 <eefff244-f311-e59e-d914-9a18b5a21620@samsung.com>
 <26ff3deb-4b8d-7dd2-2418-d56f6dcea313@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jQd3EMdFc47qTRaKrCGVpjLKjKCzoyw4f"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <26ff3deb-4b8d-7dd2-2418-d56f6dcea313@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jules Maselbas <jmaselbas@kalray.eu>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jQd3EMdFc47qTRaKrCGVpjLKjKCzoyw4f
Content-Type: multipart/mixed; boundary="qx0FfzwKdsQXFjs26GgsoSMGadaHSWCLD";
 protected-headers="v1"
From: Markus Reichl <m.reichl@fivetechno.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Minas Harutyunyan <hminas@synopsys.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jules Maselbas <jmaselbas@kalray.eu>, Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <e5ded84a-a6a2-f998-f6d8-5af7c7b432e2@fivetechno.de>
Subject: Re: [PATCH] usb: dwc2: Force 8bit UTMI width for Samsung Exynos SoCs
References: <20190503204958.GA12532@kozik-lap>
 <CGME20190506130052eucas1p25afd4e15648e9efc6fd011e46081fbea@eucas1p2.samsung.com>
 <20190506130046.20898-1-m.szyprowski@samsung.com>
 <39c7b687-449e-5e89-4c70-527d4e779fd9@fivetechno.de>
 <eefff244-f311-e59e-d914-9a18b5a21620@samsung.com>
 <26ff3deb-4b8d-7dd2-2418-d56f6dcea313@samsung.com>
In-Reply-To: <26ff3deb-4b8d-7dd2-2418-d56f6dcea313@samsung.com>

--qx0FfzwKdsQXFjs26GgsoSMGadaHSWCLD
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Am 07.05.19 um 14:03 schrieb Marek Szyprowski:
> Hi All,
>=20
> On 2019-05-07 11:17, Marek Szyprowski wrote:
>> Hi Markus,
>>
>> On 2019-05-07 10:12, Markus Reichl wrote:
>>> Hi Marek,
>>>
>>> your patch did not help on stable v5.1
>>>
>>> [=C2=A0=C2=A0=C2=A0 3.255963] samsung-usb2-phy 125b0000.exynos-usbphy=
:=20
>>> 125b0000.exynos-usbphy supply vbus not found, using dummy regulator
>>> [=C2=A0=C2=A0=C2=A0 4.044547] usbcore: registered new interface drive=
r smsc95xx
>>> [=C2=A0=C2=A0=C2=A0 4.112261] usb usb1: New USB device found, idVendo=
r=3D1d6b,=20
>>> idProduct=3D0002, bcdDevice=3D 5.01
>>> [=C2=A0=C2=A0=C2=A0 4.120363] usb usb1: New USB device strings: Mfr=3D=
3, Product=3D2,=20
>>> SerialNumber=3D1
>>> [=C2=A0=C2=A0=C2=A0 4.127560] usb usb1: Product: EHCI Host Controller=

>>> [=C2=A0=C2=A0=C2=A0 4.132415] usb usb1: Manufacturer: Linux=20
>>> 5.1.0-00005-geb4efae48eb5 ehci_hcd
>>> [=C2=A0=C2=A0=C2=A0 4.139446] usb usb1: SerialNumber: 12580000.ehci
>>> [=C2=A0=C2=A0=C2=A0 4.183056] usb3503 0-0008: switched to HUB mode
>>> [=C2=A0=C2=A0=C2=A0 4.183121] usb3503 0-0008: usb3503_probe: probed i=
n hub mode
>>> [=C2=A0=C2=A0=C2=A0 4.488344] usb 1-2: new high-speed USB device numb=
er 2 using=20
>>> exynos-ehci
>>> [=C2=A0=C2=A0=C2=A0 4.675605] usb 1-2: New USB device found, idVendor=
=3D0424,=20
>>> idProduct=3D3503, bcdDevice=3Da1.a0
>>> [=C2=A0=C2=A0=C2=A0 4.678166] usb 1-2: New USB device strings: Mfr=3D=
0, Product=3D0,=20
>>> SerialNumber=3D0
>>> [=C2=A0=C2=A0=C2=A0 4.686140] usb 1-2: skipping disabled interface 0
>>>
>>> root@odroid-x2:~# lsusb
>>> Bus 001 Device 002: ID 0424:3503 Standard Microsystems Corp.
>>> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>>
>> This patch fixes the issue introduced by "usb: dwc2: gadget: Replace=20
>> phyif with phy_utmi_width" commit, which is queued only to linux-next =

>> so far. Stable v5.1 doesn't include it, so the fix doesn't change=20
>> anything on v5.1.
>>
>> I've checked and OdroidU3 works fine with v5.1 release, but X2 fails=20
>> to detect USB devices. I will investigate this in a few minutes...
>=20
>=20
> Broken USB on X2 is caused by commit=20
> 01fdf179f4b064d4c9d30b39aba178caf32649f4 ("usb: core: skip interfaces=20
> disabled in devicetree").
>=20
> I looks that the mentioned commit conflicts with the Exynos EHCI and=20
> OHCI bindings and the way the PHY ports are defined for those drivers. =

> It worked on U3 only by the pure coincidence. This is probably a=20
> "minimal" fix for this issue:

Thanks Marek, below fix enables USB on Odroid-X2 with stable v5.1.

>=20
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 82239f27c4cc..cd455c4add25 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -2007,6 +2007,7 @@ int usb_set_configuration(struct usb_device *dev,=
=20
> int configuration)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct usb_interface *intf =3D cp->interface[i];
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (intf->dev.of_node &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of_device_is_compatible(intf->dev.of=
_node, NULL) &&
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !of_device_is_available(intf->=
dev.of_node)) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_in=
fo(&dev->dev, "skipping disabled=20
> interface %d\n",
> intf->cur_altsetting->desc.bInterfaceNumber);
>=20
> I will try to describe the problem in details and discuss it on the usb=
=20
> mailing list.
>=20
> Best regards
>=20

Gru=C3=9F,
--=20
Markus Reichl


--qx0FfzwKdsQXFjs26GgsoSMGadaHSWCLD--

--jQd3EMdFc47qTRaKrCGVpjLKjKCzoyw4f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCAAdFiEEVKeIeBh0ZWJOldzLOiXeDmsa/bIFAlzRfCoACgkQOiXeDmsa
/bK2LwwAx+0GgxHLGk0tMs5zq91YuX1lPr7gH0Kgha1DXAV70khVvjJ6o+gPsEDS
aEr28vKc+nOnWGRi3ihgcc6s8hbFsbQUkg3PG2jGc1T0h/WVwgDdFT3dhi/J6D8R
L1dnqsg1YFBJGaZgx81q4InyMOds5alMG4A9ibbEyOJuWc8aqx/VwjsNsPZ16sfP
sh3MMYOxo736aEU6gBFl0mjybEpNrDI4w3I8EAXneky1nF5lK5KGpL9Zg1BFQuKb
2NZlsLD7xmdsQ/J6+B62wBWLOw1oN0A1q2VAGNCxF7sata8QC2+NxCdNbIaaJtz1
WYTclML+ltdbx2gGgW0HAxIl6EpRABSO3NXDKlo2RVQhfCgsjZBEXmqfJl2BrZpO
9qlC74Q+9IEdF2UhFQg9Goo42WY238G0or1K1+O3bzcqLp9RT7q+sXx8NxhrcAGy
gIw++POPpDq29xawqeJ8wnTZK2DkjO8DjbUVx20S6qSNs9g8N96NU5SUJ2ySu8+3
5+7YIoQW
=jBwf
-----END PGP SIGNATURE-----

--jQd3EMdFc47qTRaKrCGVpjLKjKCzoyw4f--
