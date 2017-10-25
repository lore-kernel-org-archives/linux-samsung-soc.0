From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv4 2/2] phy: exynos5-usbdrd: Calibrate LOS levels for exynos5420/5800
Date: Wed, 25 Oct 2017 15:46:52 +0300
Message-ID: <87d15bfl8j.fsf@linux.intel.com>
References: <6de8a17a-745b-0fa2-c39d-cdeb28fc9489@ti.com> <1507550451-21324-1-git-send-email-andrzej.p@samsung.com> <CGME20171009120101eucas1p1066709725b5c6ca66961b85268480702@eucas1p1.samsung.com> <1507550451-21324-3-git-send-email-andrzej.p@samsung.com> <fca01b97-eea1-cc6f-9c12-fa8d9e55d980@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fca01b97-eea1-cc6f-9c12-fa8d9e55d980-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> writes:
> Felipe,
>
> On Monday 09 October 2017 05:30 PM, Andrzej Pietrasiewicz wrote:
>> From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>=20
>> Adding phy calibration sequence for USB 3.0 DRD PHY present on
>> Exynos5420/5800 systems.
>> This calibration facilitates setting certain PHY parameters viz.
>> the Loss-of-Signal (LOS) Detector Threshold Level, as well as
>> Tx-Vboost-Level for Super-Speed operations.
>> Additionally we also set proper time to wait for RxDetect measurement,
>> for desired PHY reference clock, so as to solve issue with enumeration
>> of few USB 3.0 devices, like Samsung SUM-TSB16S 3.0 USB drive
>> on the controller.
>>=20
>> We are using CR_port for this purpose to send required data
>> to override the LOS values.
>>=20
>> On testing with USB 3.0 devices on USB 3.0 port present on
>> SMDK5420, and peach-pit boards should see following message:
>> usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
>>=20
>> and without this patch, should see below shown message:
>> usb 1-1: new high-speed USB device number 2 using xhci-hcd
>>=20
>> [Also removed unnecessary extra lines in the register macro definitions]
>>=20
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> [adapted to use phy_calibrate as entry point]
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 183 ++++++++++++++++++++++++=
+++++++
>>  drivers/usb/dwc3/core.c                  |   7 +-
>
> are you okay with this patch?

if the API is fine for you, I'm okay with it being called from dwc3
core:

Acked-by: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlnwh7wACgkQzL64meEa
mQZhxRAAla244AhLoecGopJxptkgqFXSiHuoOm16JXcNis5LdY1g+naJQPJMajUQ
1w5OlXMkM/lZgYxp/Js9YueNkUAkisIy/T6fkqitcHqxqu+7biyHxkzVpCbnGwGg
YYu/x07GWFlwLxR181ZRDYSmMbcss7qW1znpXOiVrENnlgdtmZPASPvQHCPLT9zK
oFW7FuNhV2mVeRHU6pIq8RX1lMC/l3NlfaJw9nExLfB7JfD1/8+Rg0esFDqLNng+
tVJfCvedOpBnj4QKLMDdEiTu5fbmmnaebb8AuM603tpEl6+7dUuW2bKlLXjrCplu
fYI97bDCjEAQEAJ5ipJMXurUK+iGUhAyGIAzEIgifMREU145PcopKwXy7MCJydXy
lxbACXYGeZav21nDKkJ6cHoW+aHKQub1HKJ0PhpQuzd3+FSaOU4JBqFowIUZZnfp
6ImaLlAVKlszxh/S5iQFOSPGQCx2nZRmdkOSVdiExMCssG/Dyl6dTKXtyhTkRm9Q
o+oDHimBY4Gp3zzcNbdFPH5en9nDICeCiYvmmShOHYTVT+SYgM1YruB1m7N90f7A
1KUdVb+QzEe5nrTTax+NMIIGpwzidZST+wyqbPzYT4ttaBhLl55wTaQQFIxizfDV
mO46R+nsNsIsYxODtc01I3i3cfXSxxDaEEjPsJndFZLDIlIX0AM=
=QXif
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
