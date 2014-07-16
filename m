From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 1/1] i2c: Kconfig: Enable HSI2C for Exynos5 platform
Date: Wed, 16 Jul 2014 19:40:02 +0200
Message-ID: <20140716174002.GG2759@katana>
References: <1403690523-1863-1-git-send-email-sachin.kamat@samsung.com>
 <CAD=FV=WzPxT4okEur8C2G=FZK=zq3EsyCv9aAJwZ1PDkfoOcpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jt0yj30bxbg11sci"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WzPxT4okEur8C2G=FZK=zq3EsyCv9aAJwZ1PDkfoOcpA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sachin Kamat <spk.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--jt0yj30bxbg11sci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2014 at 10:55:31AM -0700, Doug Anderson wrote:
> Sachin,
>=20
> On Wed, Jun 25, 2014 at 3:02 AM, Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> =
wrote:
> > All Exynos5 platforms have HSI2C controllers and are needed by
> > various IPs connected to the boards based on these SoCs. Thus
> > select this by default for Exynos5 platforms.
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> >  drivers/i2c/busses/Kconfig |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> > index 9f7d5859cf65..c7918cffe790 100644
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -465,9 +465,9 @@ config I2C_EG20T
> >  config I2C_EXYNOS5
> >         tristate "Exynos5 high-speed I2C driver"
> >         depends on ARCH_EXYNOS5 && OF
> > +       default y
> >         help
> > -         Say Y here to include support for high-speed I2C controller i=
n the
> > -         Exynos5 based Samsung SoCs.
> > +         High-speed I2C controller on Exynos5 based Samsung SoCs.
> >
> >  config I2C_GPIO
> >         tristate "GPIO-based bitbanging I2C"
> > --
> > 1.7.9.5
>=20
> This seems reasonable to me and I will also take the blame for
> suggesting this.  It's hard to imagine running a real exynos5 system
> without I2C.  One could argue that on an exynos5250 the high speed I2C
> controller is not mandatory (since all the ports can be muxed to use
> the old controller) but on newer exynos5 products you're expected to
> have the main PMIC on one of the i2c ports.  An exynos system without
> access to its PMIC will just sorta limp by.
>=20
> ...but I've added Arnd to this thread as he expressed some
> reservations about this type of thing, so we'll see what he says.

Ping. Arnd? I have no strong opinion and would take this patch...

>=20
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

--jt0yj30bxbg11sci
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTxrjyAAoJEBQN5MwUoCm2Uv4QAKS4r9+/GtEo8fqCOErZjukD
YSmEj/qOOcX4oHLnk63hi8yGTNE2LfW+IdfpwhHUbionjGot6QyDm8MxcflMTvv0
4c4eygRUPKrVEAWBOs738OJwIuP/4+4EcfYfO+3lMpTpHf2B9UJnOpMijRJiICb+
afbqlNcxtiF4OKzUJ+RpdjCjmoKkNLp3qqt9QWhNvTuWa4g2Ixfzi2AxKs2j+T3u
JCasptoTVvN11EhTlxSX4NOdSs3rBt3RouatNiCxv1/Nx5aQ7LO296n8yfuZGvyv
2GgnR1RewJ7P9HJ1vbuFxTluqfjP6ggJtdixjjDGE09HycHN1ttTJ87ukU+WghkZ
3d3DtGrr0gtQxZZYkJNSnSub64wPBSqhcCA0qyxs3+BaS2yIP3LclCS0ZU3terW9
hmWOeKCXsJhTZhWU0NPyHzPeklNhFXxmw8zJs3us5aaoZw/D+Nj8Ta+Pmc5g/WNY
+MywQMb6J1bRaGLWFNhsj00qozNGcx1f6CoDIpEjyPAAM55ktcgxMgGWEQaKT80Z
XseGgAVMJkuza2Qze1hlu5aQpRDDydusG7co9B6z9LgpDB5A1xmQnbRjC67HQC+c
dIxkAJp0NwfMEnV29LL1kN8EzJ75LXowTR9PyrJ3m7dA0iCwo1TBEZzrIqblLAYx
96wg8g/IEJUE/zEPGAJ3
=JyEI
-----END PGP SIGNATURE-----

--jt0yj30bxbg11sci--
