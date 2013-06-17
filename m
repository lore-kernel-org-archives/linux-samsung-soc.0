From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 09/11] spi: s3c64xx: Do not require
 legacy DMA API in case of S3C64XX
Date: Mon, 17 Jun 2013 17:06:30 +0100
Message-ID: <20130617160630.GF1403@sirena.org.uk>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <1371416058-22047-10-git-send-email-tomasz.figa@gmail.com>
 <CACRpkdb8V7pYVnOWOAJ6iG8_-jyeutq5W95+OCO4RLOv9EDjyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1650777763238057740=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CACRpkdb8V7pYVnOWOAJ6iG8_-jyeutq5W95+OCO4RLOv9EDjyg@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Padmavathi Venna <padma.v@samsung.com>, Takashi Iwai <tiwai@suse.de>, Alessandro Rubini <rubini@gnudd.com>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kerne
List-Id: linux-samsung-soc@vger.kernel.org


--===============1650777763238057740==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SpmsQTCLe2l6R7Sg"
Content-Disposition: inline


--SpmsQTCLe2l6R7Sg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2013 at 03:59:39PM +0200, Linus Walleij wrote:
> On Sun, Jun 16, 2013 at 10:54 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> > -       select S3C64XX_DMA if ARCH_S3C64XX
> > +       select S3C64XX_DMA if ARCH_S3C64XX && !S3C64XX_PL080

> I guess this means the SPI driver does not work without DMA.
> But is the SPI driver already augmented to handle generic DMA engine?
> Anyway:

Yes, the driver currently relies on DMA.  There are some pending patches
for non-DMA operation that I need to test.  To be honest for both this
and the ASoC driver I'd be more inclined to just either select or depend
on the DMA controller rather than leaving the option of using the old
code.

--SpmsQTCLe2l6R7Sg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRvzQDAAoJELSic+t+oim9vkEP/jzixmC2H6vNaPIqVT5tbmqW
QjsQJrZxQK2Ll4bAL9WWHV2Rv5C2gPg7ZWvRdUmjZtKpLaN91XHbtGIViewpmnDu
/CHmNzfW3MdVIRHGLtLau52+feXxfkqrljlCykrjW0A/8msZANUOcYsrbhR9QvTv
tuahMM7+MJQGJDez5JqOyX7XG8362wU44PgSIrcQ77q+9hvtC41aoKkCqbgvoFjC
75+Qm5S5MTfz0rMfc4ojrAy2ZhpmZIeAxq3xqk+YfnK66uZfZ45NzzYyNAd+xRVZ
VyYH2+ZPeUPcstrsSGF7+/J0bFHCFNRcr8K5bSHFlAagD4yHGgYo05rkql8skh33
VczChJKYLu1I2Q/UF9nhJF0bgfC9P9fCQU8VKtvtgg6D92pOio0VeiVKNjAwNrPW
FVVJ27zZ7W5biqrue+eG/VO7jfdiWMrdjdO2lPnnJy58xJHuoBxrBstmjOupFFQk
r6Dt2XcjsGkcYl+veIPKNt7QcLfxIlsix4cNBp8q1BTcA/8Tl6qyww3xhBrQN923
fgKgUAeeMVIvsLxWo0IyaHWW9wKTGLCeSAlI/+fqGxrDLUKtZYh7PpXsN2J3cDo2
SAy0BYRq3KdOEOB/N6jIGZM9BMwhiSTYMWxyfbwgEUNVaGEVO2GMGfI5YnOb5FN6
oBpX+4Q6BGxYwQpdU7O5
=cQEE
-----END PGP SIGNATURE-----

--SpmsQTCLe2l6R7Sg--

--===============1650777763238057740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1650777763238057740==--
