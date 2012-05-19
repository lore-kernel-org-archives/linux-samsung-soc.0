From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 19/20] ARM: Exynos5: Add combiner, wakeup interrupt controller and ethernet nodes
Date: Sat, 19 May 2012 00:11:29 -0600
Message-ID: <20120519061129.BEE9D3E046E@localhost>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org> <1335813270-13083-20-git-send-email-thomas.abraham@linaro.org> <CAOesGMhxn6L+Pcp-v2v6z7srGd=8kGwqff7Tt6ok8pHMVXp3ZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33011 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752628Ab2ESGLc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 May 2012 02:11:32 -0400
Received: by pbbrp8 with SMTP id rp8so4810474pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 May 2012 23:11:31 -0700 (PDT)
In-Reply-To: <CAOesGMhxn6L+Pcp-v2v6z7srGd=8kGwqff7Tt6ok8pHMVXp3ZQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

On Wed, 2 May 2012 10:57:11 -0700, Olof Johansson <olof@lixom.net> wrot=
e:
> Hi,
>=20
> [adding devicetree-discuss]
>=20
> On Mon, Apr 30, 2012 at 12:14 PM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
> > And interrupt combiner, external interrupt wakeup interrupt control=
ler
> > and smsc9215 lan controller nodes.
> >
> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> > ---
> > =C2=A0arch/arm/boot/dts/exynos5250-smdk5250.dts | =C2=A0 11 ++++++
> > =C2=A0arch/arm/boot/dts/exynos5250.dtsi =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 55 +++++++++++++++++++++++++++++
> > =C2=A02 files changed, 66 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/b=
oot/dts/exynos5250-smdk5250.dts
> > index bcc4b89..dbc4bdb 100644
> > --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> > +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> > @@ -24,6 +24,17 @@
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootargs =3D=
 "root=3D/dev/ram0 rw ramdisk=3D8192 console=3DttySAC1,115200";
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0};
> >
> > + =C2=A0 =C2=A0 =C2=A0 lan9215@0x05000000 {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D "=
smsc,lan9215", "smsc,lan9115";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D <0x05000=
000 0x20000>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D <=
5 0>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupt-parent=
 =3D <&wakeup_eint>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phy-mode =3D "mi=
i";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smsc,irq-push-pu=
ll;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smsc,force-inter=
nal-phy;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local-mac-addres=
s =3D [00 80 00 23 45 67];
> > + =C2=A0 =C2=A0 =C2=A0 };
> > +
>=20
> since the 911x sits on a chipselect bus, you should instead add that
> bus to the dtsi and define this on that bus.
>=20
> Something like this in the dtsi:
>=20
>        sromc-bus {
>                #address-cells =3D <2>;
>                #size-cells =3D <1>;
>                ranges =3D < 0 0 0x04000000 0x20000
>                           1 0 0x05000000 0x20000
>                           2 0 0x06000000 0x20000
>                           3 0 0x07000000 0x20000>;
>        };
>=20
> and in the dts:
>=20
>        sromc-bus {
>                lan9215@1,0 {
>                        compatible =3D "smsc,lan9215", "smsc,lan9115";
>                        reg =3D <1 0 0x20000>;
>                        interrupts =3D <5 0>;
>                        interrupt-parent =3D <&wakeup_eint>;
>                        phy-mode =3D "mii";
>                        smsc,irq-push-pull;
>                        smsc,force-internal-phy;
>                        local-mac-address =3D [00 80 00 23 45 67];
>                };
>         };
>=20
>=20
> (You might be able to do just fine with one address cell, I'm not 100=
%
> sure why Grant's example uses two, but I used the same above for
> consistency).

Because otherwise there is no way to describe an offset from the base
of the chipselect base value, and the core code will try to apply the
size to the cs part of the address specifier. (so in the example
above the address range described by:

	reg =3D <1 0x20000>;

would mean cs values 1 to 0x20001; which is definitely wrong.

> Also, I don't think it's a good idea to hardcode the mac address in
> the dts like this; have u-boot fill it in from the environment
> variable there instead, if needed.

Very bad practice indeed.
