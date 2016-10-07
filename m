From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: PROBLEM: DWC3 USB 3.0 not working on Odroid-XU4 with Exynos 5422
Date: Fri, 07 Oct 2016 10:42:21 +0300
Message-ID: <87y420wqoy.fsf@linux.intel.com>
References: <1472414695.3845.3.camel@mniewoehner.de> <87lgzgdof3.fsf@linux.intel.com> <57C41582.1030604@linux.intel.com> <1472468730.4925.3.camel@mniewoehner.de> <CANAwSgQMsK8YPxR==UXtR49kiJzYhkzvSCNwn8mDJfj-3wpa2w@mail.gmail.com> <CAFp+6iGrS0DTP=KUKDvk3NwWB32+1uj-irKT6fn5XTcfk572Hg@mail.gmail.com> <1475578687.1912.28.camel@mniewoehner.de> <CAFp+6iGx-jf+xrdHF=0J3FK9dDBg54zESYNVo8bz2Qz6G4gEZg@mail.gmail.com> <1475771380.22019.5.camel@mniewoehner.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475771380.22019.5.camel-zzFNMPX9jIaDjmgdnaGrkw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael =?utf-8?Q?Niew=C3=B6hner?= <linux-zzFNMPX9jIaDjmgdnaGrkw@public.gmane.org>, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Michael Niew=C3=B6hner <linux-zzFNMPX9jIaDjmgdnaGrkw@public.gmane.org> writes:
>> The clocks are same across working/non-working.
>> Is it possible to bisect the commit that's causing hang for 4.8x ?
>
>
> [c499ff71ff2a281366c6ec7a904c547d806cbcd1] usb: dwc3: core: re-factor ini=
t and exit paths
> This patch causes both the hang on reboot and the lsusb hang.

How to reproduce? Why don't we see this on x86 and TI boards? I'm
guessing this is failed bisection, as I can't see anything in that
commit that would cause reboot hang. Also, that code path is *NOT*
executed when you run lsusb.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJX91HdAAoJEMy+uJnhGpkGfAAQAMZCENtAX0a9lufBr3mIPf3q
ohYC5aYGSvfTgamFu0JZQneHAaFA+2GBOjpotm2mFOBxZ/IijKChHYmU9P1zLRLp
PbOimkQ3gI+UU4kfZR0fb+sZ40htSODfm5L6KuzlDWGR35Vb+v0ymJ2b3Ga4CRC1
XYOebcEvIXpvTJ1T3HvuLy7DWObdZx4c0NdfTM/Wahyglvd8/hV7c1CWjsvECCyA
b93Nxlo+zxENyc8/JNE5qbJfeDhIqFqj1bIUm2jgIBDZSNSHdxViBWEjGjH/lck5
8wAMlvDpTbte7hdbVdbxx6Ca5HeeNv9gG+Odto0y3x0zPU7samFjevIfsz2jlL9G
m2TfRgyisJlRQRS58DLNibdvPlaOHCiZ4K58CB2dQ1H4tvBofW61SOWR8JowhEap
5VhaJmhOhLXR75QmDQujl3ZbOKwTPqftRanlQkU/qgvzb7WyXRjfzUmPrh+XoXxp
UX+z+7xKXtas/FwZsw9CUnQODfmMfPpFceWUwOpj+o5LCPGqE5Du+/zQjLSnU6Ir
h7Skq8nEKC0R5OXQbgTiISlx7FnOKGBs4oJO1/Zsq46hN4rCrqpigF17pssozPCY
XFGB4IEj7dVv/hoAnvDnPxMWhztoI9FuBY8e7HFAXHn5WWvevT8APuHYQo0iT9ym
C0J84vq7dDSvMre0Xh8z
=wVuZ
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
