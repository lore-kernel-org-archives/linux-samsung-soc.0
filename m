From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [RFC PATCH v3] reset: Add a defer reset object to send board
 specific reset
Date: Tue, 8 Jul 2014 10:05:35 +0200
Message-ID: <20140708080535.GJ13423@lukather>
References: <1403098673-3058-1-git-send-email-houcheng@gmail.com>
 <CACRpkdYfu8HmVCkn9JFh+YP5OPdr8o9nTfoCnkJ7SSpGoenQUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8027505931246393651=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYfu8HmVCkn9JFh+YP5OPdr8o9nTfoCnkJ7SSpGoenQUg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Srinivas KANDAGATLA <srinivas.kandagatla@st.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Stephen Gallimore <stephen.gallimore@st.com>, Houcheng Lin <houcheng@gmail.com>, sre@kernel.org, Vikas Sajjan <vikas.sajjan@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, David Woodhouse <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org


--===============8027505931246393651==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4IYkFBVPN84tP7K"
Content-Disposition: inline


--T4IYkFBVPN84tP7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2014 at 09:52:03AM +0200, Linus Walleij wrote:
> On Wed, Jun 18, 2014 at 3:37 PM, Houcheng Lin <houcheng@gmail.com> wrote:
>=20
> > The Problem
> > -----------
> > The reset signal on a hardware board is send either:
> >     - during machine initialization
> >     - during bus master's initialization
>=20
> I just thought about this a bit, since there isn't already a generic GPIO
> reset driver, just call this drivers/reset/reset-gpio.c and make the
> ability to deferral just a configuration detail of the GPIO reset driver.

Philipp has been working on one for quite some time. See
http://www.spinics.net/lists/arm-kernel/msg321927.html

However, it seems to progress slowly, and we don't seem to be able to
reach a consensus here.

If you ask me, having to set a few extra properties like this just
advocates for a regular reset driver and DT node for the reset GPIO,
but I'm pretty sure Philipp will feel otherwise :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--T4IYkFBVPN84tP7K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTu6ZPAAoJEBx+YmzsjxAgsVEP/jTiyBvmg4EDVfiUjYQ6CJI/
iK+oL952MyOFEfIB+662u22IjLHeQnYwMRTpbPv9IbTh/HDu+q+Z4qTdF+zstu8L
VndbS5gNNU5IGwOLkru4w4jhQ0eCy0ZzOqaE2CkVG1Fa/ogVEi6WJZX2Cfjsu9JA
MVuOMfFJf+gKSPoFl7uMhF4hCwI5cipNwoQ6z/gWHJVfShO+6rm3yoN+qRjIb9kx
+bbZCi2tQcG0vFYNDKRfsWed13oLKs8TvniT0EIepzcEUA7XhfjP33JAU+WR9chI
baWQnr3RMymDQwKg5Ow0w7QQJcmA86R9Q1QdaqTSIFbnuyNCumCgYwmovfOYmL+g
PTzwrGEhaGpD9O6LRiEj36ylkBCyCEg+f23SB2hqWDoajEUVgBD9AOfw3K0V95HN
2v1DvAk6RVjmJSijsewCiJtc0ox3sPpOckWMU5wRxzPcAJkMRCBaeWt/x7VMVsNF
Le2gJ9GDGzjvXott9/SHsWi0z32XyKu2+s6oOAgnTFOj4T4y+YgbQgVAnyLk/saX
y4ivnSswImRPgGT8toGoDpCOZhTgWSu1LtCA+haDoF8iPrFBMqCwoU7RGxTiESV8
nKm2SEd0DVvbTK5Y6ZReXqHn1DFMJbZACRnRmb8KumH0sSfGmRJkZGod5L7wRp5y
CGN+4XQN7Z0tcxh0YLiY
=nk3n
-----END PGP SIGNATURE-----

--T4IYkFBVPN84tP7K--


--===============8027505931246393651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8027505931246393651==--
