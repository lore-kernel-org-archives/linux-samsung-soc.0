From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/1] i2c: Kconfig: Enable HSI2C for Exynos5 platform
Date: Fri, 1 Aug 2014 18:17:36 +0200
Message-ID: <20140801161735.GB3277@katana>
References: <1403690523-1863-1-git-send-email-sachin.kamat@samsung.com>
 <CAD=FV=WzPxT4okEur8C2G=FZK=zq3EsyCv9aAJwZ1PDkfoOcpA@mail.gmail.com>
 <20140716174002.GG2759@katana>
 <CAK5sBcGoYC5qpwy1C95Nx5+ni6bEqCTFShYoVEAdxQVeekZhtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:37764 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750886AbaHAQSE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 12:18:04 -0400
Content-Disposition: inline
In-Reply-To: <CAK5sBcGoYC5qpwy1C95Nx5+ni6bEqCTFShYoVEAdxQVeekZhtQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <spk.linux@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2014 at 05:06:32PM +0530, Sachin Kamat wrote:
> On Wed, Jul 16, 2014 at 11:10 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> > On Wed, Jun 25, 2014 at 10:55:31AM -0700, Doug Anderson wrote:
> >> Sachin,
> >>
> >> On Wed, Jun 25, 2014 at 3:02 AM, Sachin Kamat <sachin.kamat@samsung.co=
m> wrote:
> >> > All Exynos5 platforms have HSI2C controllers and are needed by
> >> > various IPs connected to the boards based on these SoCs. Thus
> >> > select this by default for Exynos5 platforms.
> >> >
> >> > Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> >> > Cc: Doug Anderson <dianders@chromium.org>
> >> > ---
> >> >  drivers/i2c/busses/Kconfig |    4 ++--
> >> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> >> > index 9f7d5859cf65..c7918cffe790 100644
> >> > --- a/drivers/i2c/busses/Kconfig
> >> > +++ b/drivers/i2c/busses/Kconfig
> >> > @@ -465,9 +465,9 @@ config I2C_EG20T
> >> >  config I2C_EXYNOS5
> >> >         tristate "Exynos5 high-speed I2C driver"
> >> >         depends on ARCH_EXYNOS5 && OF
> >> > +       default y
> >> >         help
> >> > -         Say Y here to include support for high-speed I2C controlle=
r in the
> >> > -         Exynos5 based Samsung SoCs.
> >> > +         High-speed I2C controller on Exynos5 based Samsung SoCs.
> >> >
> >> >  config I2C_GPIO
> >> >         tristate "GPIO-based bitbanging I2C"
> >> > --
> >> > 1.7.9.5
> >>
> >> This seems reasonable to me and I will also take the blame for
> >> suggesting this.  It's hard to imagine running a real exynos5 system
> >> without I2C.  One could argue that on an exynos5250 the high speed I2C
> >> controller is not mandatory (since all the ports can be muxed to use
> >> the old controller) but on newer exynos5 products you're expected to
> >> have the main PMIC on one of the i2c ports.  An exynos system without
> >> access to its PMIC will just sorta limp by.
> >>
> >> ...but I've added Arnd to this thread as he expressed some
> >> reservations about this type of thing, so we'll see what he says.
> >
> > Ping. Arnd? I have no strong opinion and would take this patch...
>=20
> Wolfram,
>=20
> How do you want to proceed with this?

Giving Arnd a last chance to speak, otherwise I'll take it.


--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT272fAAoJEBQN5MwUoCm2bSMQAJ1U8Tv5EDDb0vBbv+idcKT/
3gGaYzUcFJzCZ88axjKYK0vXv7NSWhtWGPvDWOCdkewAmGC9gd01NbgoPZk6H/6Z
fMupxMlZOl7AU9vODXN096PSHpGGcc/ctxDlQoOXmR0KhE+RQ9iyR7VNBecfJKo9
SfmY9MLw2hPtelTBen75roDUlyFM/uI7vpOyWZ48V2NZBbX5XdYccnS5PJJj86tK
ovn/qm5dgJ6RpUR/J9vZIPtEtSV5kE29dPk/QT+I5e0sJMSl7NA4wcCLi2xOzncH
WCL1BPMyGyatgqikRSN86a54HmO1P8E7QUOGpC4gcnA9xEm4ylIeYYFq8f9otXz+
RT5/+RrTFnkYHwLKqBGYnb1e3k4mEL3tWW8+82iAOzK/NLR49g7NwCsABU5hl1De
H0EXha/Ypd1J5bchaiVr/34qk5sTBPMdfKo0/Xgw3ed5hM/xGZ8jmt61ONCqGnfP
O672uSyDgOeluTqBLKMjdJ4bxbXYL9D8V/HZPncm+rjHQdMAjTOGPIgDIBIRnfLq
rfLDXqU11RQt1eNqy8dqOL4k3syw+xAsCmqfysK/LcQuExW9RYDgcK/DpQsrTXcD
WXqRO5fv8diSH/+bfoIRM9uZB1Z6nqUx1DmU5hdL/pXP32s99UdllbyEtOotuUGJ
IvR8BmC8+TThqVgAgiBk
=3s/E
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
