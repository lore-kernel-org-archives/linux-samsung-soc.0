From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: s3c2410: Properly handle interrupts of number 0
Date: Fri, 2 Mar 2018 13:46:47 +0100
Message-ID: <20180302124647.sfhnto77wgdh5sv6@katana>
References: <1519936484-23132-1-git-send-email-krzk@kernel.org>
 <20180302111931.GX9418@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mmmpzdutlodmvuhh"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180302111931.GX9418@n2100.armlinux.org.uk>
Sender: stable-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org


--mmmpzdutlodmvuhh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


So, maybe some words why I accepted this patch.

On Fri, Mar 02, 2018 at 11:19:31AM +0000, Russell King - ARM Linux wrote:
> On Thu, Mar 01, 2018 at 09:34:44PM +0100, Krzysztof Kozlowski wrote:
> > Interrupt number 0 (returned by platform_get_irq()) might be a valid IRQ
> > so do not treat it as an error.  If interrupt 0 was configured, the dri=
ver
> > would exit the probe early, before finishing initialization, but with
> > 0-exit status.
>=20
> The official position (as stated by Linus) is that interrupt zero is
> not a valid interrupt for peripheral drivers (it may be valid within
> architecture code for things like the x86 PIT, but nothing else.)

I am aware of that situation and I totally agree with the reasoning.

> You need to number your platform interrupts from one rather than zero.

Ack.

> Note that there have been patches proposed to make platform_get_irq()
> return an error rather than returning a value of zero, so changing
> the driver in this way is not a good idea.

I'd much agree to such an approach, yet I didn't see it coming along so
far for years(?) now.

The reason I applied this patch is consistency with the current
interface. The code is wrong with the way platform_get_irq right now
works. This is independent of platform_get_irq should work, I thought.
This needs to be fixed in a seperate series. This patch will not harm
that transition.


--mmmpzdutlodmvuhh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqZR68ACgkQFA3kzBSg
KbZLNxAAqyzCrbHqB9udzXQlk4IfhZaq7rgPRZi9tHSLJiHNWZ4LEalGpquOjmvp
tnvWgX1Ptopi/iwINS7+NBrFQGCQCVlPycNwmVZbfTaMfTHcO9TY5qtW7mlsbxQs
QfOyx786YRjDDJTvNcWPvyU9rXs09JJRcWfvGEs6/uGb12Z7kXVcMbVuqDCGzpSr
0KB0ya47x7YNkHdWrtfht4J/0Wf2DuhX7W/c1K9NaROo02I0tgjgrk57kYDJq1Hq
d9V1m/56WErvBHS4QmdnYrRAzPBr3b4/9ah0Cd+X9sopYafL0hsm2XcuPk0frPB5
mn6h1FP+XLt1IYDMhXt5yQWnj1QXTn0u4vvuYPWQRA9meWi8xWi8jrzR05+kSguc
phPGcCwiOh/K8/w4Wm0WrxMMi3TLDnR1hsceZz2/N700Kosamtm0FnG2eAiUnpuH
zEwRRGCWl91btaVB9sWfcsI+LrDeCH3AL6GOauNtP6jDyyRlEVilS31iDJRC5qCu
KaKKSXBN+zb9BdJ+I+xL8CcxT0jAFuq2WMjIRiYWkyJqPTmeAERwuppEI88cu+N0
rmKrIBLZDXEhAay6E3sYSXk+ZLp3ZixsJ5ip5cV40NY5lMx7YhH9lv4nSJZVcd5V
UvEiWKdhGW7VgY53ZjrFh+64Q63hdiqI6+QsOFQiqTdSGkYTWLU=
=iX6R
-----END PGP SIGNATURE-----

--mmmpzdutlodmvuhh--
