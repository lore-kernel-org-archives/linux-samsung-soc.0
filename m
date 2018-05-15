From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 1/2] USB: dwc3: get extcon device by OF graph bindings
Date: Tue, 15 May 2018 10:26:44 +0300
Message-ID: <878t8l9y6j.fsf@linux.intel.com>
References: <20180131155718.5237-1-a.hajda@samsung.com> <CGME20180131155734eucas1p2b55ad1aab1d5086566dad7a79b25ccf3@eucas1p2.samsung.com> <20180131155718.5237-2-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180131155718.5237-2-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Andrzej Hajda <a.hajda@samsung.com> writes:

> extcon device is used to detect host/device connection. Since extcon
> OF property is deprecated, alternative method should be added.
> This method uses OF graph bindings to locate extcon.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> Hi all,
>
> This patch implements alternative method to get extcon from DWC3.
> The code works but is hacky, as DWC3 must traverse different DT nodes
> to get extcon, in case of TM2 it is USB-PHY and MUIC, but other
> platforms can have different paths.
> I would be glad if it can be merged as is for now, but additional work
> must be done to make it generic.
> I guess on DT binding side it is OK. So the problem should be addressed
> in the code.
> My rough idea is to implement kind of extcon aliases/forwarder mechanism,
> ie. USB-PHY will expect on its output remote port extcon, and it should r=
egister
> extcon-forwarder pointing to this extcon. This way DWC3 can look for the =
extcon
> on its PHY phandle, and it will receive via forwarding mechanism extcon
> exposed by MUIC.
> As I said this is rough idea for discussion, other propositions are welco=
me.
>
> Regards
> Andrzej

I need someone from devicetree to review and ack patch2 before I can
apply them. Either way, this doesn't apply:

checking file drivers/usb/dwc3/drd.c
Hunk #1 FAILED at 8.
Hunk #2 FAILED at 38.
2 out of 2 hunks FAILED

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlr6i7QACgkQzL64meEa
mQY04hAAn4K5ITshDV6Wslcg8R9p0Atc9aDKY2Ex7arwPRevurM8JWIspYtY9wuC
9r/nEgyTigQs17cJIxiNUhhLyfrbABiolPoVd43v6/nhLumbBus0Jaa4yA4wacLl
vSeM83Pb1TZbpwplM+Yv6cE/1rd0CJ6N9yXuHXzKyf4Bx3EChzZDwznY6ZkI+3kG
7ZKpF3kiziYbsyVA648MN8mWTn0pAQGPrbVolSg0pQH0j5YNKr5JgmszEj73siCW
dLrlgzotk9qE/bAymYmKAQT6MXSa/EgfjaPp6E/1cIBW+deR07dzhMjccviEkRm8
UzCYzuRXaIAJHJMsjrNvu/CwEKQBybI2LTarjKLMZeRqKl1LZQViFS8G3ufFoyGB
vT8yS49HERV05mUjHeFpCEEzi053Ig3YAAmL+4mMQgbzUp0aVS95OebQk/yA0p0Y
5fDo5lI757bjW6JNySApifuKeW98+fGS2OTeBRFBaWTJB8F1AmSdOrED0yUWn1Ze
d51DMQRVHvR8oZI7LNWSsIA+DkHeTCq4PpsI6q4LAs0OiKOpzZOrC/vyKii8tq9a
ZLBcL1mPgM2Ua7TTgh0InZ1WV8U6VlpZm1utsH0euBb3SNxwemUks0n5wOxQoFE7
tXdNkcSnXr3UhqilCcIw8ESegy2/UIZNt6gSEPbhEenU9BBpeZA=
=6lHx
-----END PGP SIGNATURE-----
--=-=-=--
