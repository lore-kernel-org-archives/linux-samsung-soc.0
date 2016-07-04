From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [BUG] Regression, usb-dwc3 not working, Odroid XU3, usb 3.0
Date: Mon, 04 Jul 2016 14:43:06 +0300
Message-ID: <87poqtljcl.fsf@linux.intel.com>
References: <577A47D3.7020900@samsung.com> <87shvpljsk.fsf@linux.intel.com> <577A4AFB.9030006@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <577A4AFB.9030006@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Krzysztof Kozlowski <k.kozlowski@samsung.com> writes:
>>> Since three recent next releases (first on 20160630), on Odroid XU3 boa=
rd
>>> the USB 3.0 host port (the only one) stopped working.
>>>
>>> This is a "samsung,exynos5250-dwusb3" (drivers/usb/dwc3/dwc3-exynos.c).
>>>
>>> Two issues here:
>>> 1. The port does not show up as USB 3.0 device.
>>> This one device is missing:
>>> 	Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>>>
>>> 2. The port does not work even for 2.0 devices (I didn't test 1.0).
>>>
>>>
>>> config: exynos_defconfig (ARM)
>>> DTS: exynos5422-odroidxu3.dts
>>=20
>> apply [1] and try again. That commit is already in greg/usb-testing [2]
>> and it should trickle down to usb-next shortly.
>>=20
>> [1] https://marc.info/?l=3Dlinux-usb&m=3D146728795330915&w=3D2
>> [2] https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/?=
h=3Dusb-testing&id=3D322832f2f19e04c866a0ce4bdac8cff8e695f2b3
>>=20
>
> Ahhh, indeed, fixed.
>
> FWIW:
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

cool, thanks for testing :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXekvKAAoJEIaOsuA1yqREV5sP/1E5d4aNzsFLzyx+LWoJcGt0
uprLLZCOSknJtk7nwllCNJvSpemFU87pwZgPqukEUbVIa94aWklplep5BzuMQ34E
h+BswLEcJv0Bd+HUJD/k4dQMhvv40hSv7yQx/gToeF1uDasg1/z2K/5vcHVAN5nt
hJ5UbRD2+27rTPAcV7ajYCftBPhVplo/kii9kd9r8nk9CnMU0wWlfLWDWginipwK
M5+ipEk0OiqIVA13e1rpfI3X0CkePvVFbG5VjtiPaizf0dSaY+R0AqZy/nrXfztg
5zdsnRAwfQv4oiSTqep8uEaI8DPAc3nXgYCERgfQz4353itPCrVi6/2Upaj4SmeM
jy//f1jZJHEchAIQJi+FUDkQhokC7uDBkSS0dPmt1TJVrf+ONdxrhlJFPSTsGeG/
dTy+UfU3J6ceJf1kxEu/mzxNJyNJBAClgoYyiAVNQxAxMcBWL6gbcQviu1p4eUYg
KxiFNKZnHw4h1s3FUxoLTHQ4960JyIFKa9ACtPEdsUrCCHBftcziqw2s9zLPjdGj
+EiClNarTxeenjsmxTT619+DdTlPpRSMIq3dLBr6KSJqUwMOtCw98ESCEnvtjER+
QlzrP7MNrlMipshoLdDzvvt/ei3QjawtL02LmwtRuj35XoV5AjYcXlmAu340B+al
gwkdpLQq1EOgybmAz9es
=FKF6
-----END PGP SIGNATURE-----
--=-=-=--
